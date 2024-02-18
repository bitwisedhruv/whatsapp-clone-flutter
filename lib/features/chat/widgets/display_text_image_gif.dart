import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectr/common/enums/message_enum.dart';
import 'package:connectr/features/chat/widgets/video_player_item.dart';
import 'package:flutter/material.dart';

class DisplayTextImageGif extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayTextImageGif({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.video
            ? VideoPlayerItem(
                videoUrl: message,
              )
            // : type == MessageEnum.gif
            //     ? CachedNetworkImage(
            //         imageUrl: message,
            //       )
            : CachedNetworkImage(
                imageUrl: message,
              );
  }
}
