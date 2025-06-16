sealed class UserException implements Exception {}

class UserNotFoundException implements UserException {
  final String id;

  UserNotFoundException(this.id);

  @override
  String toString() {
    return "User with id $id not found";
  }

}