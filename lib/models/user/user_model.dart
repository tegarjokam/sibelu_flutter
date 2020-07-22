import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String username;
  String fullName;
  @JsonKey(ignore: true)
  String error;

  User(this.username, this.fullName);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User.withError(this.error);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{username: $username fullname: $fullName}';
  }
}
