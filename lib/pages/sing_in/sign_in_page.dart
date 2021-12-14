import 'package:cloud_functions_app_sample/pages/chat_room_list/chat_room_list.dart';
import 'package:cloud_functions_app_sample/store/store.dart';
import 'package:cloud_functions_app_sample/utils/snackbar.dart';
import 'package:cloud_functions_app_sample/widgets/tap_to_unfocus_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final store = Store();

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscure = true;
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapToUnfocusPage(
      child: Scaffold(
        appBar: AppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(32),
                      TextField(
                        controller: emailController,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          labelText: 'メールアドレス',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const Gap(16),
                      TextField(
                        controller: passwordController,
                        maxLines: 1,
                        obscureText: obscure,
                        decoration: InputDecoration(
                          labelText: 'パスワード',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            onPressed: _toggleObscurity,
                            icon: obscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                        ),
                      ),
                      const Gap(32),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: loading
                              ? null
                              : () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  final result = await store.signInWithEmail(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  setState(() {
                                    loading = false;
                                  });
                                  if (!result.isSucces) {
                                    showFloatingSnackBar(context, result.message);
                                    return;
                                  }
                                  await Navigator.pushAndRemoveUntil<void>(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatRoomListPage(),
                                    ),
                                    (_) => false,
                                  );
                                },
                          child: Text(loading ? '処理中...' : 'サインイン'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _toggleObscurity() {
    setState(() {
      obscure = !obscure;
    });
  }
}
