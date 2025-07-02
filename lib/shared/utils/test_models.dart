import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/user/user.dart';

abstract class TestModels {
  static final user = User(
    id: '1',
    username: "John Doe",
    bio: "Talent creator from pudge app",
    avatar: ImageData(
      id: "1",
      originalUrl:
          "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    ),
  );

  static const images = [
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg',
      width: 511,
      height: 511,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/96/85/56/9685564b9dee09932cd04163b710335b.jpg',
      width: 736,
      height: 760,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/45/87/ba/4587baafd4ee717696c886585ee0ccf1.jpg',
      width: 736,
      height: 981,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/80/66/92/806692328c09a53d6dab591863db10a1.jpg',
      width: 736,
      height: 736,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/c9/e6/48/c9e6486eabe6a4e97a58148eada7fe99.jpg',
      width: 736,
      height: 1104,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/ac/3d/04/ac3d0448febbd8fb437fba6effb8b18a.jpg',
      width: 736,
      height: 736,
    ),
    ImageData(
      id: '',
      originalUrl:
          'https://i.pinimg.com/736x/21/e1/34/21e134bbc846c2b89d92bff19b6e0a9a.jpg',
      width: 736,
      height: 1592,
    ),
  ];

  static const imageUrls = [
    "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    "https://i.pinimg.com/736x/45/87/ba/4587baafd4ee717696c886585ee0ccf1.jpg",
    "https://i.pinimg.com/736x/ac/3d/04/ac3d0448febbd8fb437fba6effb8b18a.jpg",
    "https://i.pinimg.com/736x/80/66/92/806692328c09a53d6dab591863db10a1.jpg",
    "https://i.pinimg.com/736x/c9/e6/48/c9e6486eabe6a4e97a58148eada7fe99.jpg",
    "https://i.pinimg.com/736x/21/e1/34/21e134bbc846c2b89d92bff19b6e0a9a.jpg",
    "https://i.pinimg.com/736x/96/85/56/9685564b9dee09932cd04163b710335b.jpg",
  ];
}
