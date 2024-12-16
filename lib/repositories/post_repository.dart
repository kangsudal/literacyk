import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/post.dart';
import 'package:literacyk/repositories/handle_exception.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    try{
      final snapshot = await postCollection.get();
      final docs = snapshot.docs;
      final result = docs.map((doc)=>Post.fromDoc(doc)).toList();
      return result;
    }catch(e){
      throw handleException(e);
    }
  }

  Future<void> createPost(Post post) async {
    Map<String, dynamic> createData = {
      'id': post.id,
      'title': post.title,
      'contents': post.contents,
      'imgUrls': post.imgUrls,
      'createdAt': post.createdAt,
      'updatedAt': post.updatedAt,
      'createdBy': post.createdBy,
      'clapRecords': post.clapRecords,
      'bookmarkedBy': post.bookmarkedBy,
      'viewedBy': post.viewedBy,
    };
    try {
      await postCollection.add(createData);
    } catch (e) {
      throw handleException(e);
    }
  }

  Future<Post?> readPost(String postId) async {
    return null;
  }

  Future<void> updatePost(Post post) async {}
  Future<void> deletePost(String postId) async {}
}
