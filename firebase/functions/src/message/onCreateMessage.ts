import * as functions from 'firebase-functions'

export const onCreateMessage = functions
    .region('asia-northeast1')
    .firestore.document('chatRooms/{chatRoomId}/messages/{messageId}')
    .onCreate(async (snapshot, context) => {
        console.log(snapshot)
        console.log(context)
        console.log('Hello World!')
    })
