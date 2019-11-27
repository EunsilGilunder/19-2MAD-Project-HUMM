import 'package:flutter/material.dart';
import 'package:mad_project_humm/post.dart';
import 'package:mad_project_humm/ui_utils.dart';
import 'package:mad_project_humm/users.dart';
import 'package:mad_project_humm/avatar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final ScrollController scrollController;

  MyApp({this.scrollController});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _posts = <Post>[
    Post(
      user: eunsil,
      imageUrls: [

      ],
      likes: [
        Like(user: grootlover),
      ],
      comments: [
        Comment(
          text: '제발 집에 보내줘',
          user: grootlover,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return StoriesBarWidget();
        }
        return PostWidget(_posts[i - 1]);
      },
      itemCount: _posts.length + 1,
      controller: widget.scrollController,
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    currentUser,
    grootlover,
  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
    i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            user: _users[i],
            onTap: () => _onUserStoryTap(context, i),
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}