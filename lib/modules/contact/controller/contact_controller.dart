import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:telegram_clone/modules/contact/respository/contact_repository.dart';

final getContactsProvider = FutureProvider((ref) {
  final contactRepostory = ref.watch(contactRepositoryProvider);
  return contactRepostory.getContacts();
});
