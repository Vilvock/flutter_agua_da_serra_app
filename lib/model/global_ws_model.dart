class GlobalWSModel {
  final String status;

  GlobalWSModel({
    required this.status,
  });

  factory GlobalWSModel.fromJson(Map<String, dynamic> json) {
    return GlobalWSModel(
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}
