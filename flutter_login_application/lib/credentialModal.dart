class Credential {
  String userId;
  String password;
  Credential({this.userId,this.password});


   factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
        userId : json['userId'],
        password : json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.userId;
    data['password'] = this.password;
    return data;
  }
}