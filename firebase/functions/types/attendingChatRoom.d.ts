interface AttendingChatRoom {
  reference?: FirebaseFirestore.DocumentReference | null;
  updatedAt?: FirebaseFirestore.Timestamp | null;
  lastMessage: string;
  name: string;
  imageURL: string | null;
  usersCount: number;
  mute: boolean;
  unreadCount: number;
}
