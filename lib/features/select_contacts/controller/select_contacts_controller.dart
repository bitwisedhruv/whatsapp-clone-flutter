// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectr/features/select_contacts/repository/select_contacts_repository.dart';

final getContactsProvider = FutureProvider((ref) async {
  final selectContactsRepository = ref.watch(selectContactsRepositoryProvider);
  return selectContactsRepository.getContacts();
});

final selectContactsControllerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactsRepositoryProvider);
  return SelectContactController(
      ref: ref, selectContactsRepository: selectContactRepository);
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactsRepository selectContactsRepository;
  SelectContactController({
    required this.ref,
    required this.selectContactsRepository,
  });

  void selectContact(BuildContext context, Contact selectedContact) {
    selectContactsRepository.selectContact(selectedContact, context);
  }
}
