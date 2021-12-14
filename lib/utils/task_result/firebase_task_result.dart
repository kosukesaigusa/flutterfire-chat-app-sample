/// FirebaseException が発生し得るタスクの TaskResult
class FirebaseTaskResult {
  FirebaseTaskResult({
    required this.isSucces,
    required this.message,
    this.code,
  });
  final bool isSucces;
  final String message;
  final String? code;
}
