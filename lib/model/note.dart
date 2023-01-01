// final String tableNotes = 'notes';
//
// class NoteFields {
//
//   static final List<String> values = [
//     id , isImportant , number, title , descripition , time
//   ];
//
//   static final String id = '_id';
//   static final String isImportant = 'isImportant';
//   static final String number = 'number';
//   static final String title = 'title';
//   static final String descripition = 'descripition';
//   static final String time = 'time';
// }
//
// class Note {
//
//   Note(
//       {this.id,
//       this.isImportant,
//       this.title,
//       this.createdTime,
//       this.descripition,
//       this.number});
//
//   final int? id;
//   final bool? isImportant;
//   final int? number;
//   final String? title;
//   final String? descripition;
//   final DateTime? createdTime;
//
//   Note copy({
//     int? id,
//     bool? isImportant,
//     String? title,
//     DateTime? createdTime,
//     String? descripition,
//     int? number
//   }) =>
//       Note(
//           id: id ?? this.id,
//         isImportant: isImportant ?? this.isImportant,
//         number: number ?? this.number,
//         descripition: descripition ?? this.descripition,
//         title: title ?? this.title,
//         createdTime: createdTime ?? this.createdTime,
//       );
//
//   static Note fromJson(Map<String , object> json) => Note(
//     id: json[NoteFields.id] as int?,
//     number: json[NoteFields.number] as int,
//     title: json[NoteFields.descripition] as String,
//     descripition: json[NoteFields.descripition] as String,
//     createdTime: DateTime.parse(json[NoteFields.time] as String),
//     isImportant: json[NoteFields.isImportant] == 1,
//
//   );
//
//   Map<String, Object?> toJson() => {
//         NoteFields.id: id,
//         NoteFields.title: title,
//         NoteFields.descripition: descripition,
//         NoteFields.number: number,
//         NoteFields.isImportant: isImportant! ? 1 : 0,
//         NoteFields.time: createdTime?.toIso8601String(),
//       };
// }
