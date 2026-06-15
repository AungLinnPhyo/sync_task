import '../../domain/entities/workspace_entity.dart';

class WorkspaceModel {
  final int id; // 💡 ဆာဗာဘက်က Auto-increment Integer (101, 102) ပြန်ပေးမည်
  final String name;
  final String createdAt;

  WorkspaceModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  // 📥 ဆာဗာမှလာသော JSON အား Model ပြောင်းရန်
  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  // 🔄 Model မှ ကျွန်ုပ်တို့ App ထဲတွင်သုံးမည့် Entity သို့ ပြောင်းလဲပေးမည့် Method
  WorkspaceEntity toEntity() {
    return WorkspaceEntity(
      id: id.toString(), // 💡 int ID အား String အဖြစ်သို့ ဤနေရာတွင် ပြောင်းလဲပေးလိုက်သည်
      name: name,
      createdAt: DateTime.parse(createdAt),
    );
  }
}