import 'package:intl/intl.dart';

/// 曜日（日本語）
const List<String> weekdays = [
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

/// 月の日数
int getLastDay(int year, int month) => DateTime(year, month + 1, 0).day;

/// 入力日の曜日（整数）
int getIntWeekDay(int year, int month, int day) => DateTime(year, month, day).weekday;

/// 2 つの DateTime が同じ日かどうか
bool sameDay(DateTime a, DateTime b) {
  return a.difference(b).inDays == 0 && a.day == b.day;
}

/// チャットルーム一覧に表示する最終更新日時の文字列で、
///
/// - 今日と同じ日付なら HH:mm の文字列を
/// - N 日前までなら「N 日前」の文字列を
/// - それより前なら yyyy-MM-dd の文字列を
///
/// 返す
String dateTimeString({
  required DateTime? datetime,
  int daysDiffLimit = 7,
}) {
  if (datetime == null) {
    return '';
  }
  final now = DateTime.now();
  if (sameDay(datetime, now)) {
    return DateFormat('HH:mm').format(datetime);
  }
  // 今日の 00:00
  final todaysMidnight = DateTime(now.year, now.month, now.day);
  // 引数に渡した日の 00:00
  final midnight = DateTime(datetime.year, datetime.month, datetime.day);

  // 今日の 00:00 と引数に渡した日の 00:00 の日付差を取り
  // その日付差に応じて表示を切り替える
  final daysDiff = todaysMidnight.difference(midnight).inDays.abs();
  if (daysDiff <= daysDiffLimit) {
    if (daysDiff == 0) {
      return '今日';
    }
    if (daysDiff == 1) {
      return '昨日';
    }
    return '$daysDiff日前';
  }
  return DateFormat('yyyy-MM-dd').format(datetime);
}
