import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pudge/core/theme/theme.dart';
import 'package:pudge/features/studio/presentation/studio_notifier.dart';
import 'package:pudge/pages/studio/pick_images_bottom_sheet.dart';
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

    final studio = ref.watch(studioNotifierProvider.notifier);

    useEffect(() {
      void updateNotifier() {
        studio.onTitleChanged(form.titleController.text);
        studio.onDescriptionChanged(form.descriptionController.text);
        studio.setImages(form.images.value);
      }

      form.titleController.addListener(updateNotifier);
      form.descriptionController.addListener(updateNotifier);
      form.images.addListener(updateNotifier);

      return () {
        form.titleController.removeListener(updateNotifier);
        form.descriptionController.removeListener(updateNotifier);
        form.images.removeListener(updateNotifier);
      };
    }, [form, studio]);
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
            pickImages: (context) => showImagePickDialog(context, form),
            images: form.images.value,
            removeImage: (index) {
              final images = List<XFile>.from(form.images.value);
              images.removeAt(index);
              form.images.value = images;
            },
          ),
          Gap(AppSpacing.md),
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

  Future<void> showImagePickDialog(
    BuildContext context,
    StudioFormState form,
  ) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.navigation,
      builder: (context) => PickImagesBottomSheet(form: form),
    );
  }
}
