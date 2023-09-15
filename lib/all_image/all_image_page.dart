import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_image_controller.dart';

class AllImagePage extends GetWidget<AllImageController>{
  @override
  final controller= Get.put(AllImageController());

   AllImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
     SingleChildScrollView(
       child:  Column(
         children: [
           const SizedBox(height: 60,),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                  InkWell(
                   onTap:() {
                     Get.back();
                   },
                   child: const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white,size: 40,),
                 ),
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
                 Container(),
               ],
             ),
           ),
           const SizedBox(height: 4,),
           GridView.builder(
             physics: const NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: 40,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 mainAxisSpacing: 4,
                 crossAxisSpacing: 4,
                 crossAxisCount: 3),
             itemBuilder:(context, index) {
               return Container(
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     image: const DecorationImage(
                         image: AssetImage('image/tt.jpg'),
                         fit: BoxFit.cover
                     )
                 ),
               );
             },)
         ],
       ),
     ),
    );
  }

}