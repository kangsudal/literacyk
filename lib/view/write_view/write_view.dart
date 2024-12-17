import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:literacyk/config/route_names.dart';
import 'package:literacyk/models/custom_error.dart';
import 'package:literacyk/view/write_view/write_viewmodel.dart';

class WriteView extends ConsumerStatefulWidget {
  final String? postId; //수정 모드일땐 postId를 받음
  const WriteView({super.key, this.postId});

  @override
  ConsumerState<WriteView> createState() => _WriteViewState();
}

class _WriteViewState extends ConsumerState<WriteView> {
  final formKey = GlobalKey<FormState>();
  String? title;
  String? contents;

  @override
  void initState() {
    super.initState();
    debugPrint('postId:${widget.postId} in write_view');
  }

  @override
  Widget build(BuildContext context) {
    final writeViewmodelState =
        ref.watch(writeViewmodelProvider(widget.postId));
    bool isEdit = widget.postId != null;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: Text('Close'),
            onPressed: () {
              context.goNamed(RouteNames.home);
            },
          ),
          leadingWidth: 70,
          title: Text(isEdit ? '글수정' : '글쓰기'),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () async {
                final writeViewmodel =
                    ref.read(writeViewmodelProvider(widget.postId).notifier);
                final form = formKey.currentState;
                if (form == null || !form.validate()) return;
                form.save();
                try {
                  await writeViewmodel.savePost(
                    title: title!,
                    contents: contents!,
                    isEdit: isEdit,
                    postId: widget.postId,
                  );
                  context.goNamed(RouteNames.home);
                } on CustomError catch (e) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message)));
                }
              },
              child: Text('Post'),
            ),
          ],
        ),
        body: writeViewmodelState.when(
          data: (post) {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '제목',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: post?.title,
                        validator: (title) {
                          return validateTitle(title);
                        },
                        onSaved: (title) {
                          this.title = title;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        minLines: 1,
                        maxLines: 50,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: '내용',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: post?.contents,
                        validator: (contents) {
                          return validateContents(contents);
                        },
                        onSaved: (contents) {
                          this.contents = contents;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, _) {
            CustomError e = error as CustomError;
            return Text(e.message);
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  String? validateTitle(String? title) {
    if (title!.isEmpty) {
      return '제목을 써주세요';
    }
    if (title.length < 3) {
      return '제목은 최소 세글자 입니다.';
    }
    return null;
  }

  String? validateContents(String? contents) {
    if (contents!.isEmpty) {
      return '내용을 써주세요.';
    }
    return null;
  }
}
