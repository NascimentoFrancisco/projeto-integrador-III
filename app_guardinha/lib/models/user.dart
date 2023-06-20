
class User{
  int id;
  String cpf;
  String email;
  String password = "";

  User({required this.id, required this.cpf, required this.email});

  User.fromJson(Map<String, dynamic> json)
   :id = json["id"],
    cpf = json["cpf"],
    email = json["email"];

}