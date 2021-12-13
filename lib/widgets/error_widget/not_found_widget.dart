import 'package:flutter/material.dart';

class NotFoundWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('データが見つかりませんでした。'),
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

class NotFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('データが見つかりませんでした。'),
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
