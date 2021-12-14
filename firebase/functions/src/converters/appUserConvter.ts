export const appUserConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AppUser {
        const data = qds.data()
        return {
            reference: qds.ref,
            createdAt: data.createdAt ?? null,
            updatedAt: data.updatedAt ?? null,
            name: data.name,
            imageURL: data.imageURL ?? null,
        }
    },
    toFirestore(obj: AppUser): FirebaseFirestore.DocumentData {
        return {
            createdAt: FirebaseFirestore.FieldValue.serverTimestamp(),
            updatedAt: FirebaseFirestore.FieldValue.serverTimestamp(),
            name: obj.name,
            imageURL: obj.imageURL,
        }
    }
}
