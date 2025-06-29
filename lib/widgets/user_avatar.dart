import 'package:flutter/material.dart';
import 'package:pudge/entities/user/user.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.user, required this.size});

  final User user;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[300],
        image: user.avatar != null
            ? DecorationImage(
                image: NetworkImage(user.avatar!.originalUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
