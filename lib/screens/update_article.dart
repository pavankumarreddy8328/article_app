import 'package:article_app/controllers/controllers_export.dart';
import 'package:article_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateArticle extends GetView<CreateArticleController> {
  const UpdateArticle({super.key});
  static const routeName = "/update";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Article"),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
            .onDrag, // Dismiss keyboard on scroll
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.titleController,
                    textInputAction: TextInputAction.next,
                    validator: Validators.validateNotEmpty,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Title"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.authorController,
                    validator: Validators.validateNotEmpty,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Author"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.categoryController,
                    validator: Validators.validateNotEmpty,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Category"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.readTimeController,
                    validator: Validators.validateNotEmpty,
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Read Time"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    validator: Validators.validateNotEmpty,
                    textInputAction: TextInputAction.done,
                    maxLines: 10, // Allows up to 5 lines of text
                    minLines: 3, // Starts with 3 lines
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Description"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.updateArticle(
                             controller.titleController.text,
                              controller.descriptionController.text,
                              controller.authorController.text,
                              controller.categoryController.text, );
                        }
                      },
                      child: Text("Submit"))
                ],
              )),
        ),
      ),
    );
  }
}
