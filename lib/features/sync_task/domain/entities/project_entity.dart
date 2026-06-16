class ProjectEntity {
  final int localId; // 🏠 Local DB (Drift) အတွက် auto-increment int ID
  final String? serverId; // 🌐 ဆာဗာကပေးမည့် ID (အော့ဖ်လိုင်းတုန်းက null ဖြစ်နေမည်)
  final int localWorkspaceId; // 🏠 မိဘ Workspace ရဲ့ Local Int ID (ဒေတာ ချိတ်ဆက်ရန်)
  final String name;
  final DateTime createdAt;

  ProjectEntity({required this.localId, this.serverId, required this.localWorkspaceId, required this.name, required this.createdAt});

  // 💡 UI ကုဒ်ဟောင်းများ မပျက်စေရန် id လို့ ခေါ်ရင် Server ID (သို့) Local ID စာသား ထုတ်ပေးမည့် Getter
  String get id => serverId ?? localId.toString();
}
