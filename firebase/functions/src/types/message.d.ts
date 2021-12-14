interface Message {
  reference?: FirebaseFirestore.DocumentReference | null;
  createdAt?: FirebaseFirestore.Timestamp | null;
  isDeleted: boolean;
  senderRef: FirebaseFirestore.DocumentReference;
  content: string;
}
