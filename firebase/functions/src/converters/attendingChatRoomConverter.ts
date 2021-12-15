import { FieldValue } from '@google-cloud/firestore'

export const attendingChatRoomConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AttendingChatRoom {
        const data = qds.data()
        return {
            reference: qds.ref,
            updatedAt: data.updatedAt ?? null,
            lastMessage: data.lastMessage,
            name: data.name,
            imageURL: data.imageURL ?? null,
            usersCount: data.usersCount,
            mute: data.mute,
            unreadCount: data.unreadCount,
        }
    },
    toFirestore(obj: AttendingChatRoom): FirebaseFirestore.DocumentData {
        return {
            updatedAt: FieldValue.serverTimestamp(),
            lastMessage: obj.lastMessage,
            name: obj.name,
            imageURL: obj.imageURL,
            usersCount: obj.usersCount,
            mute: obj.mute,
            unreadCount: obj.unreadCount,
        }
    }
}
