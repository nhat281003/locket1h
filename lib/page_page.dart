import 'dart:io';
import 'package:clone_locket/all_image/all_image_page.dart';
import 'package:clone_locket/page_controller.dart';
import 'package:clone_locket/screen/screen_camera_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagePage extends GetWidget<Page2Controller>{
  @override
  final controller = Get.put(Page2Controller());

   PagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<Page2Controller>(builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body:
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.itemlock.length,
            itemBuilder: (context, index) {
            return  index == 0?
            ScreenCamPage():
            Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white,size: 40,),
                      SizedBox(
                        width: 240,
                        height: 40,
                        child:  DropdownButtonHideUnderline(
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(20),
                            dropdownColor: const Color.fromRGBO(80, 80, 80, 1),
                            isExpanded: true,
                            iconSize: 0,
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.keyboard_arrow_down_rounded, size: 30,)),
                            elevation: 16,
                            hint: controller.selectValue.value != "" ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.selectValue.value,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 18,
                                )
                              ],
                            ) : const
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'All Friends',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                            items: ['All Friends', 'tuan hung', 'minh nhat','minh nhat','minh nhat','minh nhat','minh nhat','minh nhat',].map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child:
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8),
                                          alignment: Alignment.center,
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white12,
                                              shape: BoxShape.circle
                                          ),
                                          child:const Icon( Icons.people_alt,color: Colors.white,size:12),
                                        ),
                                        const SizedBox(width: 8,),
                                        Expanded(child:   Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        )),
                                        const Icon(Icons.navigate_next, size: 20,color: Colors.white,)
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    Container(
                                      color: Colors.black,
                                      width: double.infinity,
                                      height: 0.5,
                                    )
                                  ],
                                ),
                              );
                            },
                            ).toList(),
                            onChanged: (String? value) {},
                          ),
                        ),
                      ),
                       InkWell(
                        onTap: () {
                          Get.bottomSheet(
                           Container(
                             decoration:  const BoxDecoration(
                               color: Color.fromRGBO(36, 36, 36, 1),
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                             ),
                             child: ListView.builder(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemCount: 3,
                               itemBuilder: (context, index) {
                                 return Column(
                                   children: [
                                     Container(
                                       padding: const EdgeInsets.symmetric(vertical: 16),
                                       child:  Text(
                                         index == 1?
                                         "Download phto":
                                         index == 2?
                                         "Cancle":
                                         "Delete photo", style:  TextStyle(color:
                                       index == 1?
                                       Colors.white:
                                       index == 2?
                                       Colors.white:
                                       Colors.red, fontWeight: FontWeight.w500, fontSize: 16),),
                                     ),
                                     Container(
                                       color: Colors.black,
                                       width: double.infinity,
                                       height: 0.5,
                                     )
                                   ],);
                               },),
                           )
                          );
                        },
                        child: const Icon(CupertinoIcons.ellipsis_circle, color: Colors.white,size: 30,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Expanded(child:
                Stack(
                  children: [
                    controller.itemlock[index].isFile == true?
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child:  Image.file(
                        fit: BoxFit.fill,
                        width: double.infinity,
                        File('${controller.itemlock[index].image}'),
                      ),
                    ):
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image:  DecorationImage(
                              image: AssetImage("${controller.itemlock[index].image}"),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 10,
                      child:
              controller.itemlock[index].content!.isNotEmpty?
              Center(
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: RichText(text:  TextSpan(
                                children: [
                                  TextSpan(text: "${controller.itemlock[index].content}", style:  const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
                                ]
                            ),)
                        ),
                      ): Container(), )
                  ],
                )),
                const SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: RichText(text:  TextSpan(
                        children: [
                          TextSpan(text: "${controller.itemlock[index].name}", style:  const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                          TextSpan(text: "  ${controller.itemlock[index].timeout}", style:  const TextStyle(color: Colors.white38, fontSize: 18, fontWeight: FontWeight.w500)),
                        ]
                    ),)
                ),
                const SizedBox(height: 100,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       InkWell(
                        onTap: (){
                          Get.to(AllImagePage());
                        },
                        child: const Icon(CupertinoIcons.square_grid_2x2, size: 30, color: Colors.white,),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child:
                              index ==0 ?
                              const Icon(CupertinoIcons.chat_bubble, color: Colors.white38,size: 28,):
                              index ==2 ?
                              Icon(Icons.favorite, color: Colors.purpleAccent.shade700,size: 28,):
                              index ==3 ?
                              Icon(Icons.favorite, color: Colors.red.shade700,size: 28,):
                              index ==4 ?
                             InkWell(
                               onTap: (){

                               },
                               child:  const Icon(Icons.face_retouching_natural_rounded, color: Colors.white,size: 28,),
                             ):
                              Icon(Icons.favorite, color: Colors.yellow.shade700,size: 28,),
                            );
                          },),
                      ),
                      const Icon(Icons.share, size: 25, color: Colors.white,),
                    ],
                  ),
                ),
                const SizedBox(height: 40,)


              ],
            );
          },) ,
        );
      },);
  }
}