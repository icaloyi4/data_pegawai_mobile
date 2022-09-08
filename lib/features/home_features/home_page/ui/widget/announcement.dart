import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/features/home_features/home_page/bloc/home_bloc.dart';
import 'package:ojrek_hris/features/home_features/home_page/data/remote/announcement_response.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/assets/my_cons.dart';
import '../../../../../core/assets/my_enum.dart';
import '../../../../../core/base/base_stateful.dart';
import '../../../../../core/routing/page_routing.dart';
import '../../../../../core/widget/error_text.dart';
import '../../../../../core/widget/styling.dart';

class Announcement extends StatefulWidget {
  @override
  _Announcement createState() => _Announcement();
}

class _Announcement extends BaseState<HomeBloc, HomeState, Announcement> {
  late PageController _controller;
  var _heightCard;
  var lowRatio;
  int _dot_pos = 0;
  List<DataAnnouncements>? _announcements = [];

  @override
  void initState() {
    // pengumuman.add(new AnnounceDummyModel("Test, and then test some more",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // pengumuman.add(new AnnounceDummyModel("Less is more",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // pengumuman.add(new AnnounceDummyModel("Waxing technical",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // pengumuman.add(new AnnounceDummyModel("San Francisco (iOS)",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // pengumuman.add(new AnnounceDummyModel("Proxima Nova",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // pengumuman.add(new AnnounceDummyModel(
    //     "How to choose the best fonts for apps",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));

    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      try {
        if (_dot_pos < _announcements!.length - 1) {
          _dot_pos++;
        } else {
          _dot_pos = 0;
        }
      } catch (e) {
        _dot_pos = 0;
      }

      _controller.animateToPage(
        _dot_pos,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
    super.initState();
    bloc.pushEvent(GetAnnouncements(context));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeState>(
        stream: bloc.stateStream,
        initialData: LoadingState(),
        builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data));
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Widget announceWidget(List<DataAnnouncements>? pengumuman) {
    _controller = PageController();
    _heightCard = MediaQuery.of(context).size.height * 0.25;
    lowRatio = _heightCard < 210.0;
    return Column(
      children: [
        Container(
          height: _heightCard,
          child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _dot_pos = index;
                });
              },
              itemCount: pengumuman!.length,
              itemBuilder: (context, pos) => pageview(pengumuman[pos])),
        ),
        dots_indicator(_dot_pos)
      ],
    );
  }

  Widget pageviewLoading() {
    _controller = PageController();
    _heightCard = MediaQuery.of(context).size.height * 0.25;
    lowRatio = _heightCard < 210.0;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: _heightCard,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade200,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20 * MyCons.heigh_percent,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: _heightCard - 50 - (20 * MyCons.heigh_percent),
                    color: Colors.white,
                  ),
                  // Expanded(
                  //   child: Container(
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pageview(DataAnnouncements model) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(PageRouting.SHOW_ANNOUNCEMENT, arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: _heightCard,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.title}",
                    style: styleHeader(textStyleWeight: TextStyleWeight.Title3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      "${model.subtitle}",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: styleHeader(textStyleWeight: TextStyleWeight.body),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dots_indicator(int pos) {
    return DotsIndicator(
      dotsCount: _announcements!.length,
      position: pos.toDouble(),
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  @override
  HomeBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<HomeBloc>();
  }

  @override
  Widget mapStateHandler(HomeState? state) {
    // return pageviewLoading();
    if (state is LoadingState) {
      return pageviewLoading();
    }

    if (state is SuccessGetAnnouncement) {
      _announcements = state.listAnnouncements;
      if (_announcements!.isEmpty) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: _heightCard,
              child: ErrorText(
                message: "No announcement at this time",
              )),
        );
      }
      return announceWidget(state.listAnnouncements);
    }

    if (state is ErrorGetAnnouncement) {
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
                bloc.pushEvent(GetAnnouncements(context));
              },
            )),
      );
    }
    return Container();
  }
}
