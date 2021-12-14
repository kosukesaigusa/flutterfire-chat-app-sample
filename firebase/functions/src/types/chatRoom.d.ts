interface ChatRoom {
  reference?: FirebaseFirestore.DocumentReference | null;
  createdAt?: FirebaseFirestore.Timestamp | null;
  updatedAt?: FirebaseFirestore.Timestamp | null;
  name: string;
  imageURL: string | null;
  unreadCount: number;
}
