import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/common/constants/colors.dart';
import 'package:telegram_clone/common/utils/utility.dart';
import 'package:telegram_clone/common/widgets/error_widget.dart';
import 'package:telegram_clone/modules/contact/controller/contact_controller.dart';
import 'package:telegram_clone/modules/contact/respository/contact_repository.dart';

class ContactView extends ConsumerWidget {
  static const String routeName = '/contact-view';
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Start a new Conversation',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.blackColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ref.watch(getContactsProvider).when(
        data: (data) {
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final contact = data[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: contact.photoOrThumbnail != null
                        ? MemoryImage(contact.photoOrThumbnail!)
                        : null,
                  ),
                  title: Text(contact.displayName),
                );
              });
        },
        error: (error, stackTrace) {
          return ErrorView(errorMessage: error.toString());
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
