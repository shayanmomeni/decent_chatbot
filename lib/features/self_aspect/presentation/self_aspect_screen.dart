import 'package:decent_chatbot/core/components/buttons_widgets.dart';
import 'package:decent_chatbot/core/constants/config.dart';
import 'package:decent_chatbot/features/self_aspect/data/repo/self_aspect_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/self_aspect_controller.dart';

class SelfAspectScreen extends StatelessWidget {
  SelfAspectScreen({super.key});

  final controller =
      Get.put(SelfAspectController(repo: SelfAspectRepositoryImpl()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Self Aspect'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select 10 self aspects",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: controller.aspects.length,
                itemBuilder: (context, index) {
                  final aspect = controller.aspects[index];
                  return Obx(() {
                    final isSelected =
                        controller.selectedAspects.contains(aspect);
                    return GestureDetector(
                      onTap: () {
                        controller.toggleSelection(aspect);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppConfig().colors.primaryColor
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: isSelected
                                ? AppConfig().colors.primaryColor
                                : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          aspect,
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Obx(() => Text(
                  "Selected: ${controller.selectedAspects.length}/10",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: CustomIconButton(
              title: "Submit",
              color: AppConfig().colors.primaryColor,
              onTap: () {
                // if (controller.selectedAspects.length < 10) {
                //   Get.snackbar(
                //     "Incomplete",
                //     "Please select 10 aspects.",
                //     snackPosition: SnackPosition.BOTTOM,
                //   );
                //   return;
                // }

                // Get.snackbar(
                //   "Success",
                //   "Selected aspects: ${controller.selectedAspects}",
                //   snackPosition: SnackPosition.BOTTOM,
                // );
              })
          .paddingOnly(
        bottom: 40,
        left: 16,
        right: 16,
      ),
    );
  }
}
