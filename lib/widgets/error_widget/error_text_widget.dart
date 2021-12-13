import 'package:flutter/material.dart';

class ErrorTextWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('問題が発生しました。'),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('問題が発生しました。'),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('戻る'),
          ),
        ],
      ),
    );
  }
}
