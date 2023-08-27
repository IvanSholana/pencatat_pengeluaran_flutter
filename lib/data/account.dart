
class UserAccount {
  UserAccount({required this.username, required this.password});

  String username;
  String password;
}

List<UserAccount> accountList = [
  UserAccount(username: "ivansholana", password: "ivan12345")
];
