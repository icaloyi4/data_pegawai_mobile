import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_enum.dart';
import 'package:ojrek_hris/core/widget/styling.dart';
import 'package:ojrek_hris/features/home_page/data/remote/announcement_response.dart';

import '../../../core/assets/my_cons.dart';

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
                        ?Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Image.network(
                            dataAnnouncements.imgUrl!,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          )
                  ),
                ): Container(),
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
              ],
            ),
          ),
        ));
  }
}
