import '../../domain/entities/project_entity.dart';

class ProjectModel {
  final int id;
  final int workspaceId;
  final String name;
  final String createdAt;

  ProjectModel({required this.id, required this.workspaceId, required this.name, required this.createdAt});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(id: json['id'] as int, workspaceId: json['workspaceId'] as int, name: json['name'] as String, createdAt: json['createdAt'] as String);
  }

  // Model မှ Domain Entity သို့ ပြောင်းလဲခြင်း
  ProjectEntity toEntity() {
    return ProjectEntity(id: id.toString(), workspaceId: workspaceId.toString(), name: name, createdAt: DateTime.parse(createdAt));
  }
}
