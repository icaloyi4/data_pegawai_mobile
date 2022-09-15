import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';
import 'package:ojrek_hris/core/assets/my_enum.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/home_features/home_page/data/remote/announcement_response.dart';

import '../../../../core/routing/page_routing.dart';

class AnnounceShowPage extends StatelessWidget {
  final DataAnnouncements dataAnnouncements = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.5,
          title: Text("${dataAnnouncements.title}",
              style: styleHeader(
                  textStyleWeight: TextStyleWeight.Title3,
                  color:
                      MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (dataAnnouncements.imgUrl != null)
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(dataAnnouncements.imgUrl!,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover, loadingBuilder:
                                (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }))
                    : Container(),
                Text(
                  "${dataAnnouncements.title}",
                  style: styleHeader(textStyleWeight: TextStyleWeight.Title2),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${dataAnnouncements.subtitle}",
                  style: styleHeader(textStyleWeight: TextStyleWeight.body),
                ),
                (dataAnnouncements.url != null)
                    ? Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(PageRouting.NEWS_WEBVIEW, arguments: [
                                dataAnnouncements.url,
                                dataAnnouncements.title
                              ]);
                            },
                            child: Text(
                              "For more info : ${dataAnnouncements.url}",
                              style: styleHeader(
                                  textStyleWeight: TextStyleWeight.body),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ));
  }
}
