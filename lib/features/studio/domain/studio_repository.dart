import 'package:pudge/entities/post/create_post_dto.dart';


abstract class StudioRepository {
  Future createPost(CreatePostDTO data) async {}
}