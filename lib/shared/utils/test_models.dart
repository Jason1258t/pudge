import 'dart:math';

import 'package:pudge/entities/comment/comment.dart';
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/entities/user/user.dart';

abstract class TestModels {
  static final user = User(
    id: '1',
    username: "John Doe",
    bio: "Talent creator from pudge app",
    avatar: ImageData(
      id: "1",
      originalUrl:
          "https://i.pinimg.com/736x/ab/66/e5/ab66e5046764e4bbd136d33c4932ce74.jpg",
    ),
  );

  static final List<User> users = [
    User(
      id: 'user_001',
      username: 'alina_fox',
      bio: 'Люблю кодить и кофе',
      avatar: images[2],
    ),
    User(id: 'user_002', username: 'tech_guru', bio: null, avatar: null),
    User(
      id: 'user_003',
      username: 'nightowl',
      bio: 'Работаю только по ночам',
      avatar: images[0],
    ),
  ];

  static final List<Comment> comments = [
    Comment(
      id: 'comment_001',
      content:
          'Отличная статья! Очень полезно. Отличная статья! Очень полезно. Отличная статья! Очень полезно. Отличная статья! Очень полезно. Отличная статья! Очень полезно.',
      author: users[0],
      createAt: DateTime.now().subtract(Duration(minutes: 5)),
      likesCount: 12,
      attachments: [],
    ),
    Comment(
      id: 'comment_002',
      content: 'Не согласен с последним пунктом.',
      author: users[1],
      createAt: DateTime.now().subtract(Duration(hours: 2)),
      likesCount: 3,
      attachments: [images[1]],
    ),
    Comment(
      id: 'comment_003',
      content: 'Вот ссылка на документацию: https://dart.dev',
      author: users[2],
      createAt: DateTime.now().subtract(Duration(days: 1)),
      likesCount: 25,
      attachments: null,
    ),
  ];

  static const images = [
    ImageData(
      id: '1',
      originalUrl:
          'https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg',
      width: 511,
      height: 511,
    ),
    ImageData(
      id: '2',
      originalUrl:
          'https://i.pinimg.com/736x/45/87/ba/4587baafd4ee717696c886585ee0ccf1.jpg',
      width: 736,
      height: 981,
    ),
    ImageData(
      id: '3',
      originalUrl:
          'https://i.pinimg.com/736x/ac/3d/04/ac3d0448febbd8fb437fba6effb8b18a.jpg',
      width: 736,
      height: 736,
    ),
    ImageData(
      id: '4',
      originalUrl:
          'https://i.pinimg.com/736x/80/66/92/806692328c09a53d6dab591863db10a1.jpg',
      width: 736,
      height: 736,
    ),
    ImageData(
      id: '5',
      originalUrl:
          'https://i.pinimg.com/736x/c9/e6/48/c9e6486eabe6a4e97a58148eada7fe99.jpg',
      width: 736,
      height: 1104,
    ),
    ImageData(
      id: '6',
      originalUrl:
          'https://i.pinimg.com/736x/21/e1/34/21e134bbc846c2b89d92bff19b6e0a9a.jpg',
      width: 736,
      height: 1592,
    ),
    ImageData(
      id: '7',
      originalUrl:
          'https://i.pinimg.com/736x/96/85/56/9685564b9dee09932cd04163b710335b.jpg',
      width: 736,
      height: 760,
    ),
    ImageData(
      id: '8',
      originalUrl:
          'https://i.pinimg.com/736x/b0/2b/00/b02b00d629fbd5cae44b56ec2d0ed3ec.jpg',
      width: 657,
      height: 1024,
    ),
    ImageData(
      id: '9',
      originalUrl:
          'https://i.pinimg.com/736x/44/62/10/44621010c6e55b44157a2880e5cee237.jpg',
      width: 736,
      height: 1472,
    ),
    ImageData(
      id: '10',
      originalUrl:
          'https://i.pinimg.com/736x/e8/74/1d/e8741da2467d361895777bdf9e9877cc.jpg',
      width: 736,
      height: 736,
    ),
    ImageData(
      id: '11',
      originalUrl:
          'https://i.pinimg.com/736x/0a/b5/5d/0ab55d4eea26dddb732b00a348969ee6.jpg',
      width: 736,
      height: 977,
    ),
    ImageData(
      id: '12',
      originalUrl:
          'https://i.pinimg.com/736x/85/b3/1d/85b31d24cecb05b41e90fdcdd3e0cef1.jpg',
      width: 736,
      height: 1308,
    ),
    ImageData(
      id: '13',
      originalUrl:
          'https://i.pinimg.com/736x/78/63/88/78638889824ef2f367cf2b40c63a860b.jpg',
      width: 736,
      height: 761,
    ),
  ];

  static final posts = _generatePostsOneToOne(images);

  static List<Post> _generatePostsOneToOne(List<ImageData> allImages) {
    final List<Post> posts = [];
    final random = Random();
    int idCounter = 1;

    for (final image in allImages) {
      final List<ImageData> postImages = [image];

      final additionalCount = random.nextInt(3);
      for (int i = 0; i < additionalCount; i++) {
        final extra = allImages[random.nextInt(allImages.length)];
        postImages.add(extra);
      }

      posts.add(
        Post(
          id: '${idCounter++}',
          title: 'Post $idCounter',
          description: 'Auto-generated post $idCounter',
          images: postImages,
          createdAt: DateTime.now().subtract(Duration(minutes: idCounter * 4)),
          commentsCount: random.nextInt(30),
          likesCount: random.nextInt(100),
          isLiked: random.nextBool(),
          avgScore: 1.5 + random.nextDouble() * 3.5,
        ),
      );
    }

    return posts;
  }

  static const imageUrls = [
    "https://i.pinimg.com/736x/e0/12/3d/e0123d96ce6fc5ce8e27a21472b1d125.jpg",
    "https://i.pinimg.com/736x/45/87/ba/4587baafd4ee717696c886585ee0ccf1.jpg",
    "https://i.pinimg.com/736x/ac/3d/04/ac3d0448febbd8fb437fba6effb8b18a.jpg",
    "https://i.pinimg.com/736x/80/66/92/806692328c09a53d6dab591863db10a1.jpg",
    "https://i.pinimg.com/736x/c9/e6/48/c9e6486eabe6a4e97a58148eada7fe99.jpg",
    "https://i.pinimg.com/736x/21/e1/34/21e134bbc846c2b89d92bff19b6e0a9a.jpg",
    "https://i.pinimg.com/736x/96/85/56/9685564b9dee09932cd04163b710335b.jpg",
    "https://i.pinimg.com/736x/b0/2b/00/b02b00d629fbd5cae44b56ec2d0ed3ec.jpg",
    "https://i.pinimg.com/736x/44/62/10/44621010c6e55b44157a2880e5cee237.jpg",
    "https://i.pinimg.com/736x/e8/74/1d/e8741da2467d361895777bdf9e9877cc.jpg",
    "https://i.pinimg.com/736x/0a/b5/5d/0ab55d4eea26dddb732b00a348969ee6.jpg",
    "https://i.pinimg.com/736x/85/b3/1d/85b31d24cecb05b41e90fdcdd3e0cef1.jpg",
    "https://i.pinimg.com/736x/78/63/88/78638889824ef2f367cf2b40c63a860b.jpg",
  ];
}
