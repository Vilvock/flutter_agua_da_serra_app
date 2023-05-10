class GlobalWSModel {
  final String status;
  final String msg;

  GlobalWSModel({
    required this.status,
    required this.msg,
  });

  // factory GlobalWSModel.fromJson(Map<String, dynamic> json) {
  //   return GlobalWSModel(
  //     status: json['status'],
  //     msg: json['msg'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'status': status,
  //     'msg': msg,
  //   };
  // }
}
