import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojrek_hris/core/assets/my_cons.dart';

class UsingCamera extends StatefulWidget {
  @override
  _UsingCamera createState() => _UsingCamera();
}

class _UsingCamera extends State<UsingCamera> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for captured image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras != null) {
        controller = CameraController(cameras![1], ResolutionPreset.max);
        //cameras[0] = first camera, change to 1 to another camera

        controller!.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      } else {
        print("NO any camera found");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // appBar: AppBar(
        //   title: Text("Capture Image from Camera"),
        //   backgroundColor: Colors.transparent,
        // ),
        child: Container(
            child: Column(children: [
          Container(
              child: controller == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : !controller!.value.isInitialized
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CameraPreview(controller!)),

          Expanded(
            child: Container(
              height: 50,
              width: MyCons.width_screen,
              child: ElevatedButton.icon(
                //image capture button
                onPressed: () async {
                  try {
                    if (controller != null) {
                      //check if contrller is not null
                      if (controller!.value.isInitialized) {
                        //check if controller is initialized
                        image = await controller!.takePicture();
                        Get.back(result: image); //capture image
                        setState(() {
                          //update UI
                        });
                      }
                    }
                  } catch (e) {
                    print(e); //show error
                  }
                },
                icon: Icon(Icons.camera),
                label: Text("Capture"),
              ),
            ),
          ),
          // Container(
          //   //show captured image
          //   padding: EdgeInsets.all(30),
          //   child: image == null
          //       ? Text("No image captured")
          //       : Image.file(
          //           File(image!.path),
          //           height: 300,
          //         ),
          //   //display captured image
          // )
        ])),
      ),
    );
  }
}
