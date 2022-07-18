import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telegram_clone/common/utils/utility.dart';

class UserInfoView extends StatefulWidget {
  static const String routeName = '/user-info-view';
  const UserInfoView({Key? key}) : super(key: key);

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final TextEditingController nameController = TextEditingController();
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              image == null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: Image.network(
                        'https://as1.ftcdn.net/v2/jpg/03/46/83/96/1000_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg',
                        fit: BoxFit.cover,
                      ).image,
                    )
                  : CircleAvatar(
                      radius: 64,
                      backgroundImage: FileImage(image!),
                    ),
              Positioned(
                bottom: 0,
                left: 80,
                child: IconButton(
                  onPressed: selectImage,
                  icon: Icon(
                    Icons.add_a_photo,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.done),
              )
            ],
          )
        ],
      ))),
    );
  }
}
