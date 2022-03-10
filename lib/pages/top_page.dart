import 'package:chat_app/model/user.dart';
import 'package:chat_app/pages/setting_profile.dart';
import 'package:chat_app/pages/talk_room.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({ Key? key }) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  //ユーザーをリスト型で管理するために変数を定義
  List<User> userList = [
    //クラス（設計書）からインスタンス（実態）を生成
    User(
      name: '藤原',
      uid: 'abc',
      imagePath: 'https://storage.nana-music.com/picture/7493771-bc54558e-45cd-469b-820e-fff407d7c5e3-large.png',
      lastMessage: 'こんばんは'
    ),
    User(
      name: '華怜',
      uid: 'def',
      imagePath: 'https://pics.prcm.jp/471af7fd4bb0a/85203843/png/85203843_220x220.png',
      lastMessage: 'こんにちは'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャットアプリ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingProfile()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          //要素を横に並べたいからRowウィジェットを使用
          //InkWellウィジェットでラップすることによってタップ機能のないウィジェットをタップできるようにする
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TalkRoom(userList[index].name)));
          },
          child: Container(
            height: 69,
            child: Row(
              children: [
                //アイコンを丸めに表示
                 Padding(
                   //アイコンの左右に余白を入れる
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: CircleAvatar(backgroundImage: NetworkImage(userList[index].imagePath),
                   //アイコンの大きさを調整
                   radius: 24,
                   ),
                 ),
                 Column(
                   //縦に並べているウィジェットを横方向にどうするかを決める
                   crossAxisAlignment: CrossAxisAlignment.start,
                   //縦方向にどうするかを決める
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(userList[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                     Text(userList[index].lastMessage, style: TextStyle(color: Colors.grey)),
                   ],
                 ),
              ],
            ),
          ),
        );
      }),
    );
  }
}