
import 'package:facebook/models/models.dart';
import 'package:facebook/models/story_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/story.dart';
import '../widgets/story_info.dart';

class Story1 extends StatefulWidget {
  const Story1({Key? key,

   }) : super(key: key);


  @override
  State<Story1> createState() => _Story1State();
}
//StoryInfo
//https://i.pinimg.com/736x/7a/e0/cb/7ae0cb60358bc2f1bfc5b254ae3ba792.jpg
class _Story1State extends State<Story1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryInfoWidget(storyinfo: StoryInfo(
          // width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height,
          storyimg: 'https://i.pinimg.com/736x/02/74/d4/0274d43686e69f010bcffbe113fd039f.jpg', userimg: 'https://i.pinimg.com/736x/7a/e0/cb/7ae0cb60358bc2f1bfc5b254ae3ba792.jpg', username: 'Mariam Mohmed', date: '25-7-2002'),),
    );
  }
}