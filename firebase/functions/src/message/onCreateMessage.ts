import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import { attendingUserConverter } from '../converters/attendingUserConverter'
import { messageConverter } from '../converters/messageConverter'
// import { attendingChatRoomConverter } from '@/converters/attendingChatRoomConverter'

/** チャットルーム内でメッセージドキュメントが作成されたときに、
 * 同じチャットルームに参加しているユーザーの attendingChatRoom ドキュメントを
 * 更新する。
 */
export const onCreateMessage = functions
    .region('asia-northeast1')
    .firestore.document('chatRooms/{chatRoomId}/messages/{messageId}')
    .onCreate(async (snapshot, context) => {
        const message = messageConverter.fromFirestore(snapshot)
        const db = admin.firestore()
        const batch = db.batch()
        const qs = await snapshot.ref
            .collection('attendingUsers')
            .withConverter(attendingUserConverter).get()
        for (const qds of qs.docs) {
            const attendingUser = qds.data()
            const attendingChatRoomRef = attendingUser.userRef
                .collection('attendingChatRooms').doc(context.params.chatRoomId)
                // .withConverter(attendingChatRoomConverter)
            // 参考：Update 時の型安全について
            // https://zenn.dev/arark/articles/60927323db8697
            batch.set(attendingChatRoomRef, {
                lastMessage: message.content,
                unreadCount: FirebaseFirestore.FieldValue.increment(1)
            }, {merge: true})
        }

        try {
            await batch.commit()
            console.log('=======================================')
            console.log(`${snapshot.ref.path}: onCreateMessage が正常終了しました。`)
            console.log('=======================================')
        } catch (e) {
            console.log('=======================================')
            console.log(`${snapshot.ref.path}: onCreateMessage が以上終了しました (${e})。`)
            console.log('=======================================')
        }
    })
