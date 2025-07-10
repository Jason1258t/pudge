import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/pages/studio/use_studio_form_hook.dart';

class PickImagesBottomSheet extends StatelessWidget {
  PickImagesBottomSheet({super.key, required this.form});
  final StudioFormState form;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(
            Icons.photo_library,
            color: AppColors.onBackground,
          ),
          title: Text('Pick from gallery', style: AppTypography.bodySmall),
          onTap: () async {
            Navigator.pop(context);
            final images = await picker.pickMultiImage();
            if (images.isNotEmpty) {
              form.images.value = images;
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt, color: AppColors.onBackground),
          title: Text('Take photo', style: AppTypography.bodySmall),
          onTap: () async {
            Navigator.pop(context);
            final image = await picker.pickImage(source: ImageSource.camera);
            if (image != null) {
              form.images.value = [...form.images.value, image];
            }
          },
        ),
      ],
    );
  }
}
