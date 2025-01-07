import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubiqmerchant_version_2/presentation/app_documentaries/controllers/faq/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("FAQ"), actions: [
        PopupMenuButton(
            itemBuilder: (context) => [
                  for (int i = 0;
                      i < controller.faqModel.faqCategoryList!.length;
                      i++)
                    PopupMenuItem(
                        child: Text(controller
                            .faqModel.faqCategoryList![i].faqCategoryName!),
                        onTap: () {
                          // controller.getFaq(controller.faqModel.faqCategoryList![i].id.toString());
                        })
                ])
      ]),
      body: Obx(() => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.faqList.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                trailing: const Icon(Icons.keyboard_arrow_down),
                backgroundColor: Colors.grey[200],
                textColor: Colors.indigo.shade800,
                leading: Text(
                  "${index + 1}.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey.shade800),
                ),
                title: Text('Q : ${controller.faqList[index].faqQuestion}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey.shade800)),
                children: [
                  ListTile(
                    title: Text('A : ${controller.faqList[index].faqAnswer}',
                        style: TextStyle(color: Colors.blueGrey.shade400)),
                    onTap: () {},
                    textColor: Colors.blue.shade500,
                    leading: const SizedBox(),
                  ),
                ],
              );
            },
          )),
    ));
  }
}
