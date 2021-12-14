interface AttendingUser {
  reference?: FirebaseFirestore.DocumentReference | null;
  userRef: FirebaseFirestore.DocumentReference;
  mute: boolean;
}
