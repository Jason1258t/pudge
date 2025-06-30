import 'package:flutter/material.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

class StudioPage extends StatelessWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title:  Text('Создайте пост', style: AppTypography.titleMedium),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      )
    );
  }
}
