import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import 'package:ojrek_hris/core/assets/my_color.dart';
import 'package:ojrek_hris/core/widget/styling.dart';

import '../../../../core/assets/my_cons.dart';
import '../../../../core/assets/my_enum.dart';
import '../../../../core/base/base_stateful.dart';
import '../../../../core/widget/cool_alert.dart';
import '../bloc/crud_news_bloc.dart';
import '../data/remote/news_response.dart';

class CrudNewsPage extends StatefulWidget {
  @override
  _CrudNewsPage createState() => _CrudNewsPage();
}

class _CrudNewsPage
    extends BaseState<CrudNewsBloc, CrudNewsState, CrudNewsPage> {
  var _keyFormNews = new GlobalKey<FormState>();
  var _isUpdate = false;
  var _imageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: Text("${_isUpdate ? "Update News" : "Create New News"}",
            style: styleHeader(
                textStyleWeight: TextStyleWeight.Title3,
                color: MyCons.darkModeEnabled ? Colors.white : Colors.black54)),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: formNews(),
          ))),
          Card(
            child: StreamBuilder<CrudNewsState>(
                stream: bloc.stateStream,
                initialData: InitState(),
                builder: (blocCtx, snapshot) => mapStateHandler(snapshot.data)),
            // Container(
            //     alignment: Alignment.bottomCenter,
            //     child: StreamBuilder<RegisterState>(
            //         stream: bloc.stateStream,
            //         initialData: InitState(),
            //         builder: (blocCtx, snapshot) =>
            //             mapStateHandler(snapshot.data)))
          )
        ],
      )),
    );
  }

  Widget buttonSave() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          // Get.toNamed(PageRouting.REGISTER_SUCCESS);
          if (_keyFormNews.currentState!.validate()) {
            AlertMessage.showAlert(
              context,
              message: "Are you sure?",
              title: "Confirmation",
              type: CoolAlertType.confirm,
              onConfirm: () {
                Get.back();
                if (_newsData != null) {
                  bloc.pushEvent(CRUDNews(context,
                      typeCrud: _isUpdate ? TypeCrud.UPDATE : TypeCrud.CREATE,
                      newsData: _newsData!));
                }
              },
              onCancel: () {
                Get.back();
              },
            );
          }
        },
        child: Container(
          decoration: styleBoxAllWithColor(colors: MyColors.mainColor),
          child: Text(
            "Save",
            style: styleHeader(
                color: Colors.white, textStyleWeight: TextStyleWeight.Title3),
          ),
          alignment: Alignment.center,
          height: 50,
        ),
      ),
    );
  }

  Widget formNews() {
    return Form(
      key: _keyFormNews,
      child: Column(
        children: [
          Container(
            child: TextFormField(
              decoration: fieldDecoration('Title', Icons.newspaper, false),
              enabled: true,
              initialValue:
                  _newsData?.title == null ? "" : _newsData?.title.toString(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty';
                }
                _newsData?.title = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: textWithIcon(icon: Icons.newspaper, text: 'Content'),
          // ),
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.newspaper,
                    color: MyColors.mainColor,
                  ),
                ),
                TextFormField(
                  enabled: true,
                  maxLength: 1000,
                  maxLines: 5,
                  initialValue: _newsData?.subtitle == null
                      ? ""
                      : _newsData?.subtitle.toString(),
                  decoration: fieldDecoration(
                      'Enter news content here ...', null, false),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'content cannot be empty';
                    }
                    _newsData?.subtitle = value;
                    return null;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              initialValue:
                  _newsData?.url == null ? "" : _newsData?.url.toString(),
              decoration: fieldDecoration('News URL', Icons.http, false),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'News URL cannot be empty';
                }
                _newsData?.url = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextFormField(
              enabled: true,
              controller: _imageController,
              decoration: fieldDecoration('Image News URL', Icons.image, false),
              onChanged: (value) {
                setState(() {});
              },
              validator: (value) {
                _newsData?.imgUrl = value;
                return null;
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _imageController.text.isEmpty
              ? Container()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    _imageController.text.toString(),
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )),
        ],
      ),
    );
  }

  InputDecoration fieldDecoration(
      String label, IconData? icon, bool isPassword) {
    return new InputDecoration(
      hintText: label,
      // labelText: label,
      labelStyle: new TextStyle(color: MyColors.mainColor),
      prefixIcon: Icon(
        icon,
        color: MyColors.mainColor,
      ),
      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      border: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      disabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(10.0),
        borderSide: BorderSide(color: MyColors.mainColor),
      ),
      errorStyle: TextStyle(
        color: Colors.red, // or any other color
      ),
    );
  }

  late NewsData? _newsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isUpdate = (Get.arguments != null);
    // _newsData = MyCons.dataUser?.News;
    if (Get.arguments != null) {
      _newsData = Get.arguments;
      _imageController.text =
          _newsData?.imgUrl == null ? "" : _newsData!.imgUrl.toString();
    } else {
      _newsData = new NewsData();
    }
  }

  @override
  CrudNewsBloc initBloc() {
    // TODO: implement initBloc
    return KiwiContainer().resolve<CrudNewsBloc>();
  }

  @override
  Widget mapStateHandler(CrudNewsState? state) {
    if (state is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return buttonSave();
  }
}
