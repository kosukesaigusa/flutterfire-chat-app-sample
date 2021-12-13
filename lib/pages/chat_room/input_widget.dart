import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/theme/theme.dart';
import 'package:cloud_functions_app_sample/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final store = Store();

class ChatInputWidget extends StatelessWidget {
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
                      // controller: vm.textEditingController,
                      // focusNode: vm.focusNode,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'メッセージを入力',
                      ),
                      // onChanged: vm.changeText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
