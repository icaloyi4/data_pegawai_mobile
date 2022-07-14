import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojrek_hris/features/home_page/data/entities/news_dummy_model.dart';

import '../../../../core/assets/my_color.dart';
import '../../../../core/assets/my_cons.dart';
import '../../../../core/widget/styling.dart';

class News extends StatefulWidget {
  @override
  _News createState() => _News();
}

class _News extends State<News> {
  late PageController _controller;
  var _heightCard;
  var lowRatio;
  int _dot_pos = 0;
  List<NewsDummyModel> berita = [];

  @override
  void initState() {
    berita.add(new NewsDummyModel(
        "Satgas Beri Warning! COVID-19 Harian RI 'Ngamuk', Naik 6 Kali Lipat",
        "Jakarta - Juru bicara Satgas COVID-19 Prof Wiku Adisasmito mewanti-wanti peningkatan kasus signifikan sepekan terakhir. Kasus harian kembali melampaui tiga ribu orang per hari, usai sebelumnya konsisten berada di dua ribu kasus.\nSebelumnya meskipun terjadi kenaikan, kita berhasil mempertahankan 2 ribu kasus. Angka ini meningkat 6 kali lipat dibandingkan tepat sebulan lalu, di mana kasus harian kita masih sebesar 551 kasus dalam satu hari, terang Wiku dalam konferensi pers BNPB, Kamis (14/7/2022).\nTotal kenaikan kasus COVID-19 berdampak pada jumlah pasien yang memerlukan perawatan di RS maupun menjalan isolasi mandiri. Jika dibandingkan dengan catatan sebulan lalu, kenaikan dilaporkan mencapai empat kali lipat.",
        'https://akcdn.detik.net.id/community/media/visual/2022/01/11/pemerintah-wanti-wanti-gelombang-omicron-prokes-jangan-kendor-3_169.jpeg?w=700&q=90',
        'https://health.detik.com/berita-detikhealth/d-6178199/satgas-beri-warning-covid-19-harian-ri-ngamuk-naik-6-kali-lipat'));
    berita.add(new NewsDummyModel(
        "Update Corona RI 14 Juli: Tambah 3.584 Kasus Baru, Meninggal 9",
        "Jakarta - Juru bicara Satgas COVID-19 Prof Wiku Adisasmito mewanti-wanti peningkatan kasus signifikan sepekan terakhir. Kasus harian kembali melampaui tiga ribu orang per hari, usai sebelumnya konsisten berada di dua ribu kasus.\nSebelumnya meskipun terjadi kenaikan, kita berhasil mempertahankan 2 ribu kasus. Angka ini meningkat 6 kali lipat dibandingkan tepat sebulan lalu, di mana kasus harian kita masih sebesar 551 kasus dalam satu hari, terang Wiku dalam konferensi pers BNPB, Kamis (14/7/2022).\nTotal kenaikan kasus COVID-19 berdampak pada jumlah pasien yang memerlukan perawatan di RS maupun menjalan isolasi mandiri. Jika dibandingkan dengan catatan sebulan lalu, kenaikan dilaporkan mencapai empat kali lipat.",
        'https://akcdn.detik.net.id/community/media/visual/2021/09/09/corona-belum-kelar-euforia-bisa-bikin-kasus-covid-19-naik-lagi-7_169.jpeg?w=700&q=90',
        'https://health.detik.com/berita-detikhealth/d-6179398/update-corona-ri-14-juli-tambah-3584-kasus-baru-meninggal-9'));
    berita.add(new NewsDummyModel(
        "Sebaran 3.584 Kasus Covid-19 di Indonesia 14 Juli 2022: DKI Jakarta Terbanyak, Tembus 1.749 Kasus",
        "Jakarta - Juru bicara Satgas COVID-19 Prof Wiku Adisasmito mewanti-wanti peningkatan kasus signifikan sepekan terakhir. Kasus harian kembali melampaui tiga ribu orang per hari, usai sebelumnya konsisten berada di dua ribu kasus.\nSebelumnya meskipun terjadi kenaikan, kita berhasil mempertahankan 2 ribu kasus. Angka ini meningkat 6 kali lipat dibandingkan tepat sebulan lalu, di mana kasus harian kita masih sebesar 551 kasus dalam satu hari, terang Wiku dalam konferensi pers BNPB, Kamis (14/7/2022).\nTotal kenaikan kasus COVID-19 berdampak pada jumlah pasien yang memerlukan perawatan di RS maupun menjalan isolasi mandiri. Jika dibandingkan dengan catatan sebulan lalu, kenaikan dilaporkan mencapai empat kali lipat.",
        'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/sebaran-2743-kasus-covid-19-rabu-6-juli-2022.jpg',
        'https://www.tribunnews.com/corona/2022/07/14/sebaran-3584-kasus-covid-19-di-indonesia-14-juli-2022-dki-jakarta-terbanyak-tembus-1749-kasus'));
    // berita.add(new NewsDummyModel("Less is more",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // berita.add(new NewsDummyModel("Waxing technical",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // berita.add(new NewsDummyModel("San Francisco (iOS)",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // berita.add(new NewsDummyModel("Proxima Nova",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    // berita.add(new NewsDummyModel(
    //     "How to choose the best fonts for apps",
    //     "In the Justinmind UI design tool, you can use default and Google Fonts in your designs. They’re easily integrated into the tool. If you’re stuck between a few font choices then a great solution to this age-old problem is to simply prototype and test until you have the most appropriate solution. Some designers even go so far as to create a paper UI sketching of the design, already noting the fonts they feel would fit in."));
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      try {
        if (_dot_pos < berita.length - 1) {
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
  }

  @override
  Widget build(BuildContext context) {
    return announceWidget(berita);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  Widget announceWidget(List<NewsDummyModel> pengumuman) {
    _controller = PageController();
    _heightCard = MediaQuery.of(context).size.height * 0.4;
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
              itemCount: pengumuman.length,
              itemBuilder: (context, pos) => pageview(pengumuman[pos])),
        ),
        dots_indicator(_dot_pos)
      ],
    );
  }

  Widget pageview(NewsDummyModel model) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: _heightCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                model.photo,
                height: _heightCard * 0.5,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: _heightCard * 0.5 * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          model.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: styleHeader(
                              textStyleWeight: TextStyleWeight.Title3),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: _heightCard * 0.5 * 0.5,
                        child: Text(
                          model.content,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: styleHeader(
                              textStyleWeight: TextStyleWeight.body),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dots_indicator(int pos) {
    return DotsIndicator(
      dotsCount: berita.length,
      position: pos.toDouble(),
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
