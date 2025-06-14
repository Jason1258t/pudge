import 'package:flutter/cupertino.dart';

abstract class AppGradients {
  static final inst = LinearGradient(
    colors: [Color(0xff9C3FE4), Color(0xffC65647)],
    begin: Alignment(-1, -0.2),
    end: Alignment(1, 0.2)
  );
}
