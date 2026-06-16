import '../../domain/entities/workspace_entity.dart';

class WorkspaceModel extends WorkspaceEntity {
  WorkspaceModel({
    required super.localId,
    super.serverId, // 🎯 Entity ထဲမှာ optional ပေးထားရင် super.serverId ကို required ဖြုတ်ပေးပါ
    required super.name,
    required super.createdAt,
  });

  // 📥 ဆာဗာမှလာသော JSON အား Model ပြောင်းရန်
  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      // 🎯 Server ID သည် numeric ဖြစ်ပါက localId အဖြစ်ပါ တစ်ခါတည်း သတ်မှတ်ပေးခြင်းဖြင့် Foreign Key ချိတ်ဆက်မှုကို လွယ်ကူစေသည်
      localId: int.tryParse(json['id']?.toString() ?? '') ?? 0,

      // 🎯 ဆာဗာဆီကလာတဲ့ json['id'] (String/UUID) ဟာ ကျွန်ုပ်တို့ App အတွက် serverId ဖြစ်ပါတယ်
      serverId: json['id']?.toString(),

      name: json['name'] as String,

      // DateTime သို့ ပြောင်းလဲခြင်းကိုပါ တစ်ခါတည်း Safe ဖြစ်အောင် စစ်ပေးထားပါတယ်
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
    );
  }
}
