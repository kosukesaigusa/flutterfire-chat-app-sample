export const messageConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): Message {
        const data = qds.data()
        return {
            reference: qds.ref,
            createdAt: data.createdAt ?? null,
            isDeleted: data.isDeleted,
            senderRef: data.senderRef,
            content: data.content,
        }
    },
    toFirestore(obj: Message): FirebaseFirestore.DocumentData {
        return {
            createdAt: FirebaseFirestore.FieldValue.serverTimestamp(),
            updatedAt: FirebaseFirestore.FieldValue.serverTimestamp(),
            isDeleted: obj.isDeleted,
            senderRef: obj.senderRef,
            content: obj.content,
        }
    }
}
