import 'dart:io';

import 'package:connectr/common/enums/message_enum.dart';
import 'package:connectr/features/auth/controller/auth_controller.dart';
import 'package:connectr/features/chat/repository/chat_repository.dart';
import 'package:connectr/models/chat_contact.dart';
import 'package:connectr/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatController(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatController {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatController({
    required this.chatRepository,
    required this.ref,
  });

  Stream<List<ChatContact>> chatContacts() {
    return chatRepository.getChatContact();
  }

  Stream<List<Message>> chatStream(String recieverUserId) {
    return chatRepository.getChatStream(recieverUserId);
  }

  void sendTextMessage(
    BuildContext context,
    String text,
    String recieverUserId,
  ) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
            context: context,
            text: text,
            recieverUserId: recieverUserId,
            senderUser: value!,
          ),
        );
  }

  void sendFileMessage(
    BuildContext context,
    File file,
    String recieverUserId,
    MessageEnum messageEnum,
  ) {
    ref.read(userDataAuthProvider).whenData(
          (value) => chatRepository.sendFileMessage(
            context: context,
            file: file,
            recieverUserId: recieverUserId,
            senderUserData: value!,
            ref: ref,
            messageEnum: messageEnum,
          ),
        );
  }

  // void sendGIFMessage(
  //   BuildContext context,
  //   String gifUrl,
  //   String recieverUserId,
  // ) {
  //   int gifUrlPartIndex = gifUrl.lastIndexOf('-') + 1;
  //   String gifUrlPart = gifUrl.substring(gifUrlPartIndex);
  //   String newGifUrl = 'https://i.giphy.com/media/$gifUrlPart/200.gif';
  //   ref.read(userDataAuthProvider).whenData(
  //         (value) => chatRepository.sendGIFMessage(
  //           context: context,
  //           gifUrl: newGifUrl,
  //           recieverUserId: recieverUserId,
  //           senderUser: value!,
  //         ),
  //       );
  // }
}