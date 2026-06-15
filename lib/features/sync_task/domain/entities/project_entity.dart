class ProjectEntity {
  final String id;
  final String workspaceId; // 💡 Parent ID (UUID ကော Server ID ပါ လက်ခံနိုင်ရန်)
  final String name;
  final DateTime createdAt;

  ProjectEntity({
    required this.id,
    required this.workspaceId,
    required this.name,
    required this.createdAt,
  });
}