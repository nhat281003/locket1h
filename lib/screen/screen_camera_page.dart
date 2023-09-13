import 'package:camera/camera.dart';
import 'package:clone_locket/screen/screen_camera_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ScreenCamPage extends GetWidget<ScreenController>{
  final controller = Get.put(ScreenController());
  static double size = 30;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenController>(builder: (controller) {
      return 
        Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:  Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white12,
                        shape: BoxShape.circle
                    ),
                    child:const Icon( Icons.people_alt,color: Colors.white,size:30),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Text('+ Add Widget', textAlign: TextAlign.center,style:  TextStyle(color: Colors.black , fontSize: 16, fontWeight: FontWeight.w600),),
                  )),
                  const SizedBox(width: 30,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.white12,
                        shape: BoxShape.circle
                    ),
                    child:Icon(CupertinoIcons.profile_circled,color: Colors.white,size:size),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60,),
            Expanded(child:
            Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(60)
                ),
                width:double.infinity,
                child: controller.controller == null?
                const Center(child:Text("Loading Camera...", style: TextStyle(color: Colors.white),)):
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CameraPreview(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)
                        ),
                      ),
                      controller.controller!),
                )
            ),),
            const SizedBox(height: 60,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(CupertinoIcons.bolt, color: Colors.white,size:size ,),
                 InkWell(
                   focusColor: Colors.transparent,
                   splashColor: Colors.transparent,
                   borderRadius: BorderRadius.circular(70),
                   onTap: () {
                     Get.showSnackbar(
                         GetSnackBar(
                           animationDuration: Duration(microseconds: 3),
                           duration: Duration(seconds: 2),
                           backgroundColor: Colors.yellow.shade700,
                             borderRadius: 20,
                             title: "Chụp cc à thằng nhok da đen",
                             message: "Thảo là của t",
                         ));
                   },
                   child:  Container(
                     width: 80,
                     height: 80,
                     padding: const EdgeInsets.all(4),
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(
                             color: Colors.yellow.shade700,
                             width: 3
                         )
                     ),
                     child: Container(
                       width: 70,
                       height: 70,
                       decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.white
                       ),
                     ),
                   ),
                 ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      controller.indexCam.value ++ ;
                      if(controller.indexCam.value != 0 && controller.indexCam.value %2 !=0){
                        controller.indexCam.value = 1;
                        controller.initializeCamera(controller.indexCam.value);
                      }else{
                        controller.indexCam.value = 0;
                        controller.initializeCamera(controller.indexCam.value);

                      }
                    },
                    child: Icon(Icons.flip_camera_ios_outlined, color: Colors.white,size:size),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Text("History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            const Icon(Icons.keyboard_arrow_down, size: 40,color: Colors.white,),
            const SizedBox(height: 10,),

          ],
        ),
      );
    },);
  }
}