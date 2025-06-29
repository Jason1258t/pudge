import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/user/user.dart';

abstract class TestModels {
  static final user = User(
    id: '1',
    username: "John Doe",
    bio: "Talent creator from pudge app",
    avatar: Image(
      id: "1",
      originalUrl:
          "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    ),
  );
}
