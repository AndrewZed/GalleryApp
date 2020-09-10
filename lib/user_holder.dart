import 'package:galleryapp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    print(user.toString());

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('A user whith this name already exists');
    }
  }

  User registerUserByEmail(String name, String email) {
    User user = User(name: name, email: email);
    if (users.containsKey(user.login))
      throw Exception('A user whith this email already exists');
    users[user.login] = user;
    return user;
  }

  User registerUserByPhone(String name, String phone) {
    User user = User(name: name, phone: phone);
    if (users.containsKey(user.login))
      throw Exception('A user whith this phone already exists');
      users[user.login] = user;
    return user;
  }

  User getUserByLogin(String login) {
    if (!users.containsKey(login))
      throw Exception('A user whith this login not exist');
    return users[login];
  }

  User findUserInFriends(String login, User friend) {
    User user = getUserByLogin(login);
    if (!user.hasFriend(friend))
      throw Exception('${user.login} is not a friend of the login');
    return friend;
  }

  void setFriends(String login, List friends) {
    User user = getUserByLogin(login);
    friends.forEach((newFriend) {
      user.addFriend(newFriend);
    });
  }

  List<User> importUsers(List listUsers) {
    List<User> result =[];

    listUsers.forEach((element) {
      String userString = element.toString().trim();
      List userData = userString.split(';');
      result.add(User(
        name: userData[0].trim(),
        email: userData[1].trim(),
        phone: userData[2].trim(),
      ));
    });
    return result;
  }
}
