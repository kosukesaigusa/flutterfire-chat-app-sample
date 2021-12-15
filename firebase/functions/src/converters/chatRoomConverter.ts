import { FieldValue } from '@google-cloud/firestore'

export const chatRoomConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): ChatRoom {
        const data = qds.data()
        return {
            reference: qds.ref,
            createdAt: data.createdAt ?? null,
            updatedAt: data.updatedAt ?? null,
            name: data.name,
            imageURL: data.imageURL ?? null,
            unreadCount: data.unreadCount,
        }
    },
    toFirestore(obj: ChatRoom): FirebaseFirestore.DocumentData {
        return {
            createdAt: FieldValue.serverTimestamp(),
            updatedAt: FieldValue.serverTimestamp(),
            name: obj.name,
            imageURL: obj.imageURL,
            unreadCount: obj.unreadCount,
        }
    }
}
