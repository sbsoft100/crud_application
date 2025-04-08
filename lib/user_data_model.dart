class UserDataFields {
  static final List<String> values = [
    id,
    name,
    emailId,
    password,

  ];
  static String id = "_id";
  static String name = "name";
  static String emailId = "emailId";
  static String password = "password";

}

class UserData {
  static String data = "userData";
  int? id;
  String? name;
  String? emailId;
  String? password;


  UserData(
      {this.id,
        required this.name,
        required this.emailId,
        required this.password,
       });

  static UserData fromMap(Map<String, dynamic> map) {
    return UserData(
        emailId: map[UserDataFields.emailId] as String,
        id: map[UserDataFields.id] as int,
        name: map[UserDataFields.name] as String,
      password: map[UserDataFields.password] as String,
       );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      UserDataFields.id: id,
      UserDataFields.name: name,
      UserDataFields.emailId: emailId,
      UserDataFields.password: password,

    };
    return map;
  }

  UserData copy({
    int? id,
    String? name,
    String? emailId,
    String? password,

  }) {
    return UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        emailId: emailId ?? this.emailId,
        password: password ?? this.password,
       );
  }
}
