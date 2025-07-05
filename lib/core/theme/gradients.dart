import 'package:flutter/cupertino.dart';

abstract class AppGradients {
  static final inst = LinearGradient(
    colors: [Color(0xff9C3FE4), Color(0xffC65647)],
    begin: Alignment(-1, -0.2),
    end: Alignment(1, 0.2)
  );

  static final instDisabled = LinearGradient(
      colors: [Color(0xff424242), Color(0xff2d283a)],
      begin: Alignment(-1, -0.2),
      end: Alignment(1, 0.2)
  );
}
