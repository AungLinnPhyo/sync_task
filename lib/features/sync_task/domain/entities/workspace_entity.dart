class WorkspaceEntity {
  final int localId;        // 🏠 ဖုန်းထဲက ဒေတာချိတ်ဆက်ရန် Local Int ID (Foreign Key အတွက် သုံးမည်)
  final String? serverId;   // 🌐 ဆာဗာကပေးမည့် ID
  final String name;
  final DateTime createdAt;

  WorkspaceEntity({
    required this.localId,
    this.serverId,
    required this.name,
    required this.createdAt,
  });

  // 💡 UI ကုဒ်ဟောင်းများ မခက်ခဲစေရန် id ဟု ခေါ်လျှင် ဆာဗာ ID (သို့) Local ID စာသားအား ပြန်ပေးမည့် Getter
  String get id => serverId ?? localId.toString();
}