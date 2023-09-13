import 'dart:io';

import 'package:camera/camera.dart';
import 'package:clone_locket/model/item_lock.dart';
import 'package:clone_locket/page_controller.dart';
import 'package:clone_locket/screen/screen_camera_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
            controller.filePath.isNotEmpty ?
                controller.isVisible.value == true?
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
                ):
                Container(
             margin: const EdgeInsets.only(top: 20),
             child:  const Text("Send to...",style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
           ):
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
            controller.filePath.isNotEmpty ? const SizedBox(height: 40,): const SizedBox(height: 60,),
            Expanded(child:
       controller.filePath.isNotEmpty ?
       controller.isVisible.value == true?
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
             child:
             AspectRatio(
               aspectRatio:16/9,
               child:   CameraPreview(
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(60)
                     ),
                   ),
                   controller.controller!),
             ),
           )
       ):
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child:  Image.file(
                          fit: BoxFit.fill,
                          width: double.infinity,
                          File( controller.isVisible.value == false? controller.filePath: "",),
                        ),
                      ),
                      Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child:
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(
                              controller: controller.textEditingController,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              enabled: true,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none
                                ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                hintText: "Send to message",
                                hintStyle: TextStyle(color: Colors.white),
                                alignLabelWithHint: true
                              ),
                            )
                        ),
                      ))
                    ],
                  ):
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
                  child:
                AspectRatio(
                  aspectRatio:16/9,
                  child:   CameraPreview(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60)
                        ),
                      ),
                      controller.controller!),
                ),
                )
            ),),
            const SizedBox(height: 60,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.filePath.isNotEmpty ?
                      controller.isVisible.value ==true?
                      InkWell(
                        onTap: () {
                          controller.indexFlash.value =! controller.indexFlash.value;
                          controller.indexFlash.value == true ?
                          controller.controller?.setFlashMode(FlashMode.torch) :
                          controller.controller?.setFlashMode(FlashMode.off) ;
                        },
                        child: controller.indexFlash.value == true ?
                        Icon(CupertinoIcons.bolt_fill, color: Colors.yellow.shade700,size:size ,):
                        Icon(CupertinoIcons.bolt, color: Colors.white,size:size ,),
                      ):
                   InkWell(
                    onTap: (){
                      Get.back();
                    },
                    splashColor: Colors.transparent,
                    child: const Icon(CupertinoIcons.xmark, size: 40,color: Colors.white,),
                  ):
                  InkWell(
                    onTap: () {
                      controller.indexFlash.value =! controller.indexFlash.value;
                      controller.indexFlash.value == true ?
                      controller.controller?.setFlashMode(FlashMode.torch) :
                      controller.controller?.setFlashMode(FlashMode.off) ;
                    },
                    child: controller.indexFlash.value == true ?
                    Icon(CupertinoIcons.bolt_fill, color: Colors.yellow.shade700,size:size ,):
                    Icon(CupertinoIcons.bolt, color: Colors.white,size:size ,),
                  ),

                  controller.filePath.isNotEmpty ?
                  controller.isVisible.value ==true?
                  InkWell(
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(70),
                    onTap: () {
                      captureImage();
                      controller.isVisible.value =! controller.isVisible.value ;
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
                  ):
                  InkWell(
                    onTap: (){
                      Get.find<Page2Controller>().itemlock.add(ItemLock(image: controller.filePath, name: "nyminhnhat", content: controller.textEditingController.value.text.toString(), timeout: "1h"));
                      Get.find<Page2Controller>().update();
                      Get.find<Page2Controller>().refresh();
                      controller.isVisible.value =! controller.isVisible.value ;
                      Get.showSnackbar(GetSnackBar(
                        title: "Thông báo",
                          messageText: const Text("Send Success", style: TextStyle(color: Colors.white, fontSize: 16),),
                          snackPosition: SnackPosition.BOTTOM, // Vị trí của Toast
                          duration: const Duration(seconds: 3), // Thời gian hiển thị
                          backgroundColor:Colors.grey.shade600, // Màu nền
                          borderRadius: 30, // Bo góc
                          margin: const EdgeInsets.all(20), // Khoảng cách với viền màn hình
                          padding: const EdgeInsets.all(15), // Khoảng cách nội dung với viền
                      ));
                      controller.update();

                    },
                    splashColor: Colors.transparent,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        shape: BoxShape.circle
                      ),
                      child: const Center(
                        child: Icon(Icons.send, color: Colors.white, size: 40,),
                      ),
                    ),
                  ):
                  InkWell(
                   focusColor: Colors.transparent,
                   splashColor: Colors.transparent,
                   borderRadius: BorderRadius.circular(70),
                   onTap: () {
                     captureImage();
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

                  controller.filePath.isNotEmpty ?
                  controller.isVisible.value ==true?
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
                  ):
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                    },
                    child: const Icon(CupertinoIcons.square_arrow_down, color: Colors.white,size:40),
                  ):
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
            controller.filePath.isNotEmpty ?
            controller.isVisible.value ==true?
            const SizedBox(height: 10,):
            const SizedBox(height: 30,):
            const SizedBox(height: 10,),
            controller.filePath.isNotEmpty ?
            controller.isVisible.value ==true?
            const Text("History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),):
           SizedBox(
             height: 70,
             child:  ListView.builder(
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,
               itemCount: controller.item.length,
               itemBuilder: (context, index) {
                 return
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      controller.indexListIndex.value = index ;
                      controller.listIndex[index] =!controller.listIndex[index]  ;
                    },
                    child: SizedBox(
                      width: 80,
                      child:  Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 2, color:
                                    controller.indexListIndex.value == 0?
                                        index == 0?
                                        Colors.yellow.shade700:
                                        Colors.grey.shade700:
                                                index!= 0?
                                                controller.listIndex[index]== true ?
                                                Colors.yellow.shade700:
                                        Colors.grey.shade700:Colors.grey.shade700 )
                                ),
                              ),
                              Positioned(
                                  left: 2,
                                  right: 2,
                                  top: 2,
                                  bottom: 2,
                                  child:
                                  index == 0?
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration:  BoxDecoration(
                                      color: Colors.grey.shade700,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.people, size: 20,color: Colors.white,),
                                  ):
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage('image/tt.jpg'),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            index == 0?
                            "All": "${controller.item[index]}",overflow: TextOverflow.ellipsis, maxLines: 1,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),)
                        ],
                      ),
                    ),
                  );
               },),
           ):
            const Text("History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),),
            controller.filePath.isNotEmpty ?
            controller.isVisible.value ==true?
            const Icon(Icons.keyboard_arrow_down, size: 40,color: Colors.white,):
            const Text("") :
            const Icon(Icons.keyboard_arrow_down, size: 40,color: Colors.white,),
            const SizedBox(height: 10,),

          ],
        ),
      );
    },);
  }
  void captureImage() async {
    try {
      if (controller.controller != null && controller.controller!.value.isInitialized) {
        final Directory appDir = await getApplicationDocumentsDirectory();
        final String appDirPath = appDir.path;
        final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
        final String filePath = join(appDirPath, '$timestamp.jpg');
        XFile? capturedImage = await controller.controller?.takePicture();
        final File imageFile = File(capturedImage!.path);
        await imageFile.copy(filePath);
        controller.filePath = filePath;
        print('Đã chụp ảnh: $filePath');
      }
    } catch (e) {
      print('Lỗi khi chụp ảnh: $e');
    }
  }
  // Hiển thị ảnh vừa chụp

}
