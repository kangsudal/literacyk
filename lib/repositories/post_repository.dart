import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/handle_exception.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    try {
      final snapshot = await postCollection.orderBy('createdAt', descending: true).get();
      final docs = snapshot.docs;
      List<Post> result = docs
          .map((doc) => Post.fromMap(
                doc.data(),
                id: doc.id,
              ))
          .toList();
      return result;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> createPost(Post post) async {
    try {
      final docRef = await postCollection.add(post.toMap());
      await docRef.update({'id': docRef.id});
    } catch (e) {
      throw handleException(e);
    }
  }

  // 단일 게시물 조회
  Future<Post?> readPost(String postId) async {
    try {
      final doc = await postCollection.doc(postId).get();
      if (doc.exists) {
        Map<String,dynamic> dataMap = doc.data() as Map<String, dynamic>;
        return Post.fromMap(dataMap, id: doc.id);
      }
      return null;
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> updatePost(Post post) async {
    try {
      await postCollection.doc(post.id).update(post.toMap());
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await postCollection.doc(postId).delete();
    } catch (e) {
      throw handleException(e);
    }
  }
}
