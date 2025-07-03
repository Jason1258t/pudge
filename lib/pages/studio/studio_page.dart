import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/shared/ui/buttons/elevated_button.dart';
import 'package:pudge/shared/ui/inputs/text_field_borders_none.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

import 'images/images_section.dart';
import 'use_studio_form_hook.dart';

class StudioPage extends HookConsumerWidget {
  const StudioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = useStudioFormState();

    return CustomScaffold(
      padding: EdgeInsets.all(AppSpacing.lg),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Create post', style: AppTypography.titleMedium),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ImagesSection(
            pickImages: (context) => pickImages(context, form),
            images: form.images.value,
            onImagesChanged: (images) => form.images.value = images,
          ),
          Gap(AppSpacing.xl),
          CustomTextFieldWithoutBorders(
            controller: form.titleController,
            maxLines: 2,
            hint: "Enter title here",
          ),
          if (form.showDescription.value)
            CustomTextFieldWithoutBorders(
              controller: form.descriptionController,
              maxLines: 2,
              hint: "Enter description here",
              hintStyle: AppTypography.bodySmallLight.copyWith(
                color: AppColors.textHint,
              ),
              style: AppTypography.bodyRegular,
            ),
          const Spacer(),
          CustomElevatedButton(
            callback: () {},
            text: "Publish",
            active: form.canPublish.value,
          ),
        ],
      ),
    );
  }

  Future<void> pickImages(BuildContext context, StudioFormState form) async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.navigation,
      builder: (context) => SafeArea(
        child: Wrap(
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
              leading: const Icon(
                Icons.camera_alt,
                color: AppColors.onBackground,
              ),
              title: Text('Take photo', style: AppTypography.bodySmall),
              onTap: () async {
                Navigator.pop(context);
                final image = await picker.pickImage(
                  source: ImageSource.camera,
                );
                if (image != null) {
                  form.images.value = [image];
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
