class PrealertModel {
  int? id;
  String? tracking;
  String? content;
  String? instruction;
  String? message;

  PrealertModel({
    this.id,
    this.tracking,
    this.content,
    this.instruction,
    this.message,
  });

  PrealertModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tracking = json['tracking'];
    content = json['content'];
    instruction = json['instruction'];
    message = json['message'];
  }
}
