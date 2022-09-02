import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/base/base_stateful.dart';
import 'package:ojrek_hris/features/home_page/bloc/home_bloc.dart';
import 'package:ojrek_hris/features/home_page/data/remote/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/routing/page_routing.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widget/error_text.dart';
import '../../../../core/widget/styling.dart';

class NewsAllPage extends StatefulWidget {
  @override
  _NewsAllPage createState() => _NewsAllPage();
}

class _NewsAllPage extends BaseState<HomeBloc, HomeState, NewsAllPage> {
  var _heightCard;
  @override
  Widget build(BuildContext context) {
    _heightCard = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: Text("News",
              style: styleHeader(
                  textStyleWeight: TextStyleWeight.Title3,
                  color:
                      MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<HomeState>(
              stream: bloc.stateStream,
              initialData: LoadingState(),
              builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
        ));
  }

  @override
  HomeBloc initBloc() {
    return KiwiContainer().resolve<HomeBloc>();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.pushEvent(GetNews(context));
  }

  @override
  Widget mapStateHandler(HomeState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is SuccessGetNews) {
      if (state.listNews != null) {
        return newsWidget(state.listNews!);
      } else {
        return newsWidget([]);
      }
    }

    if (state is ErrorGetNews) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: _heightCard,
            child: ErrorText(
              message: "Something Wrong, Tap to try Again",
              tryAgain: () {
                bloc.pushEvent(GetNews(context));
              },
            )),
      );
    }
    return Container();
  }

  Widget newsWidget(List<NewsData> _listnews) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(_listnews.length, (index) {
          NewsData _news = _listnews.elementAt(index);
          return GestureDetector(
            onTap: () async {
              if (MyCons.isWeb) {
                if (!await launchUrl(Uri.parse(_news.url.toString()))) {
                  throw 'Could not launch ${_news.url.toString()}';
                }
              } else {
                Get.toNamed(PageRouting.NEWS_WEBVIEW,
                    arguments: [_news.url, _news.title]);
              }
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: itemHeight * 0.5,
                      child: (_news.imgUrl != null)
                          ? Image.network(
                              _news.imgUrl!,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text("No Image Detected"),
                            ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${_news.title}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: styleHeader(
                                    textStyleWeight: TextStyleWeight.Title3),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "${_news.subtitle}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: styleHeader(
                                        textStyleWeight: TextStyleWeight.body),
                                  ),
                                ),
                              ),
                              Text(
                                "${_news.updateBy} - ${changeDateFormat(date: _news.updateAt, newFormat: MyCons.DATETIME_FORMAT_BEAUTY)}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
