import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController{
  TextEditingController textEditingController = TextEditingController();
  List listIndex = [];
  List listFilePath = [];
  RxInt indexListIndex =0.obs;
  RxBool isVisible = false.obs;
  String filePath = "";
  String content2 = "";
  CameraController get to => Get.find();
  RxInt indexCam =0.obs;
  RxBool indexFlash =false.obs;
   CameraController ? controller;
   List<CameraDescription> ?cameras;
   CameraDescription? currentCamera;
  bool get isCameraInitialized => controller != null;
  bool get isCameraFrontFacing => currentCamera?.lensDirection == CameraLensDirection.front;

  Future<void> initializeCamera(index) async {
    cameras = await availableCameras();
    controller = CameraController(cameras![index], ResolutionPreset.high);
    await controller?.initialize();
    controller?.startImageStream((CameraImage image) {
      update();
    });
  }

List<String> item = [
  "minh nhat nguyen",
  "minh nhat nguyen",
  "minh nhat nguyen",
  "minh nhat nguyen",
  "minh nhat nguyen",
  "minh nhat nguyen",
];

  @override
  void onInit() {
    super.onInit();
    initializeCamera(0);
    for(int i = 0; i< item.length; i++){
      listIndex.add(false);
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }


}