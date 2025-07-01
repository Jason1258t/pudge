import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class StudioFormState {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<List<XFile>> images;
  final ValueNotifier<bool> canPublish;
  final ValueNotifier<bool> showDescription;

  StudioFormState({
    required this.titleController,
    required this.descriptionController,
    required this.images,
    required this.canPublish,
    required this.showDescription,
  });
}

StudioFormState useStudioFormState() {
  final titleController = useTextEditingController();
  final descriptionController = useTextEditingController();
  final images = useState<List<XFile>>([]);
  final canPublish = useState(false);
  final showDescription = useState(false);

  useEffect(() {
    void update() {
      final title = titleController.text.trim();
      final description = descriptionController.text.trim();
      showDescription.value = title.isNotEmpty;

      canPublish.value =
          title.length < 200 &&
          description.length < 500 &&
          images.value.isNotEmpty;
    }

    titleController.addListener(update);
    descriptionController.addListener(update);
    images.addListener(update);

    return () {
      titleController.removeListener(update);
      descriptionController.removeListener(update);
      images.removeListener(update);
    };
  }, [titleController, descriptionController, images]);

  return StudioFormState(
    titleController: titleController,
    descriptionController: descriptionController,
    images: images,
    canPublish: canPublish,
    showDescription: showDescription,
  );
}
