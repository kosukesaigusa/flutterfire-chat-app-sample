export const attendingUserConverter = {
    fromFirestore(qds: FirebaseFirestore.QueryDocumentSnapshot): AttendingUser {
        const data = qds.data()
        return {
            reference: qds.ref,
            userRef: data.userRef,
            mute: data.mute,
        }
    },
    toFirestore(obj: AttendingUser): FirebaseFirestore.DocumentData {
        return {
            userRef: obj.userRef,
            mute: obj.userRef,
        }
    }
}
