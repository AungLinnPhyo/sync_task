class WorkspaceEntity {
  final String id; // 💡 UI UUID ကော Server ID ကော လက်ခံနိုင်ရန် String ထားရမည်
  final String name;
  final DateTime createdAt;

  WorkspaceEntity({
    required this.id,
    required this.name,
    required this.createdAt,
  });
}