import 'package:camera/camera.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController{

  CameraController get to => Get.find();
  RxInt indexCam =0.obs;
   CameraController ? controller;
   List<CameraDescription> ?cameras;
   CameraDescription? currentCamera;
   CameraImage ? _currentImage;

  bool get isCameraInitialized => controller != null;
  bool get isCameraFrontFacing => currentCamera?.lensDirection == CameraLensDirection.front;

  Future<void> initializeCamera(index) async {
    cameras = await availableCameras();

    controller = CameraController(cameras![index], ResolutionPreset.max);
    await controller?.initialize();
    controller?.startImageStream((CameraImage image) {
      _currentImage = image;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    initializeCamera(0);
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}