// data/models/project_model.dart
import '../../domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({required super.localId, super.serverId, required super.localWorkspaceId, required super.name, required super.createdAt});

  // 📥 ဆာဗာမှလာသော JSON အား Model ပြောင်းရန်
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      // 🎯 0 အစား JSON ထဲတွင် ပါလာသော ID များကို ပြောင်းလဲထည့်သွင်းပေးရန် လိုအပ်သည်
      localId: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      localWorkspaceId: int.tryParse(json['workspaceId']?.toString() ?? '') ?? 0,
      serverId: json['id']?.toString(),
      name: json['name'] as String,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
    );
  }
}
