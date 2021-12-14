import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions_app_sample/models/app_user/app_user.dart';
import 'package:cloud_functions_app_sample/models/chat_room/chat_room.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/snackbar.dart';
import 'package:cloud_functions_app_sample/utils/task_result/firebase_task_result.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final store = Store();

/// メッセージの入力欄および送信ボタン・画像添付ボタンのウィジェット
class ChatInputWidget extends StatefulWidget {
  const ChatInputWidget({required this.chatRoomId});
  final String chatRoomId;
  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grey900,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 36,
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: GestureDetector(
              onTap: () {
                showFloatingSnackBar(context, 'まだ何も起こりません。');
              },
              child: const Icon(Icons.image),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: grey800,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'メッセージを入力',
                      ),
                      // onChanged: (text) {// SharedPreferences に下書きを保存する },
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              final result = await _sendMessage();
              if (!result.isSucces) {
                showFloatingSnackBar(context, result.message);
                return;
              }
              textEditingController.clear();
              FocusScope.of(context).unfocus();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  Future<FirebaseTaskResult> _sendMessage() async {
    final text = textEditingController.text;
    if (text.isEmpty) {
      return FirebaseTaskResult(isSucces: false, message: '入力内容が空です。');
    }
    final message = Message(
      senderRef: userRef(userId: store.nonNullUid).reference,
      content: textEditingController.text,
    );
    try {
      await messagesRef(chatRoomId: widget.chatRoomId).add(message);
    } on FirebaseException catch (e) {
      return FirebaseTaskResult(
        isSucces: false,
        message: 'エラーが発生しました (${e.code})',
        code: e.code,
      );
    }
    return FirebaseTaskResult(
      isSucces: true,
      message: 'メッセージを送信しました。',
    );
  }
}
