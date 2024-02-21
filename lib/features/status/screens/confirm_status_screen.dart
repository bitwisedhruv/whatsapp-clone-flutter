import 'dart:io';
import 'package:connectr/colors.dart';
import 'package:connectr/features/status/controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmStatusScreen extends ConsumerWidget {
  static const String routeName = '/confirm-status';
  final File file;
  const ConfirmStatusScreen({
    super.key,
    required this.file,
  });

  void addStatus(WidgetRef ref, BuildContext context) {
    ref.read(statusControllerProvider).addStatus(file, context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.file(file),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: tabColorDarkOld,
        onPressed: () => addStatus(ref, context),
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    );
  }
}
