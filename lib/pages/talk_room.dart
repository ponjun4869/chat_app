import 'package:chat_app/model/message.dart';
import 'package:flutter/material.dart';
//intlを使うときは頭にintlを書くように設定
import 'package:intl/intl.dart' as intl;

class TalkRoom extends StatefulWidget {
  final String name;
  TalkRoom(this.name);
  // const TalkRoom({ Key? key, String? name }) : super(key: key, name: name);

  @override
  State<TalkRoom> createState() => _TalkRoomState();
}

class _TalkRoomState extends State<TalkRoom> {
  //Messageをリスト型で管理するために変数を定義
  List<Message> messageList = [
    Message(
      message: "あいうえお",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "あいうえお",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "あいうえお",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてげげっげあががとなにぬげげがｗがｗがえｒがうぇめのがげあげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "あいうえお",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあｆｄｆげがｇん；ｈがげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "あいうえお",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあｆｄｆげがｇん；ｈがげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "テスト1テストテストテストテストテスト手打ちうどん",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあｆｄｆげがｇん；ｈがげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
    Message(
      message: "テスト2テストテストテストテストテストテスト手打ちうどん",
      isMe: true,
      sendTime: DateTime(2020, 2, 2, 11, 11)
    ),
    Message(
      message: "アイウエオかきくけこさしすせそたちつてとなにぬめのがげあｆｄｆげがｇん；ｈがげ",
      isMe: false,
      sendTime: DateTime(2020, 1, 1, 8, 11)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      //Stackで要素同士を重ねることができる（入力欄作成のために必要）
      body: Stack(
        children: [
          Padding(
            //入力欄の要素とメッセージが被らないように入力欄のheight(60)分をbottomに余白をつける
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView.builder(
              //スクロールの仕方を変更。要素が画面幅を超えた時にスクロール可能にする
              //デフォルトはAlwaysScrollableScrollPhysics
              physics: RangeMaintainingScrollPhysics(),
              //要素の数だけのListView.builderの高さになるように設定
              shrinkWrap: true,
              //上にスクロールするように設定
              reverse: true,
              //messageListの数だけカウント。無限を回避
              itemCount: messageList.length,
              itemBuilder: (context, index) {
              return Padding(
                //メッセージ同士に余白をつける。最後のメッセージ要素（reverse:trueになっているため最初の要素）にだけbottomの余白をつける（三項演算子）
                padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0, bottom: index == 0 ? 10.0 : 0),
                child: Row(
                  //時間表示をメッセージちょい下にする
                  crossAxisAlignment: CrossAxisAlignment.end,
                  //ltrメソッドがintlパッケージを参照しているのでエラーが起きている
                  //なのでパッケージをasで指定する ※3行目の記述
                  //materialのrtlメソッド 文字を右側から表示させる
                  //自分が送ったメッセージか相手のメッセージかで文字を左右どちらから表示するか分岐する（三項演算子）
                  textDirection: messageList[index].isMe ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Container(
                      //メッセージの最大横幅を画面の6割までに指定し、メッセージが長文の場合は折り返すように設定
                      //MediaQuery.of(context).size.widthは決まり文句
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                      //メッセージに対する背景色を大きくする。横幅:10.0と縦幅:6.0
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                      //メッセージの角を丸くする
                      decoration: BoxDecoration(
                        //自分が送ったメッセージと相手のメッセージで色を分ける（三項演算子）
                        color: messageList[index].isMe ? Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      //messageインスタンスのデータを取得して表示
                      child: Text(messageList[index].message)
                      ),
                    //intlパッケージのDateFormatを使ってDateTime型からString型に変換
                    Text(intl.DateFormat('HH:mm').format(messageList[index].sendTime), style: TextStyle(fontSize: 12.0),)
                  ],
                ),
              );
            }),
          ),
          //入力欄
          Align(
            //画面の下真ん中に入力欄を表示
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                children: [
                  //エラー文を読むと、TextFieldは横幅いっぱいまで要素が広がる性質があるため、Rowで囲んでいたIconButtonが幅を超えてしまい表示できなかった。
                  //そのため、Expandedで現在表示できる範囲まで横幅を制限する必要がある。
                  //ここで表示できる範囲は 画面幅 ー IconButton。
                  const Expanded(
                    child: Padding(
                      //OutLineInputBorderに対して余白をつける
                    padding:  EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  )),
                  IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: () {
                      print('送信完了');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}