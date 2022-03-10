import 'package:flutter/material.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({ Key? key }) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 77, bottom: 20, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                //名前とサムネイルのレイアウトを整えるためにContainerで箱をつくる
                Container(width: 100, child: Text('名前')),
                Expanded(child: TextField()),
              ],
            ),
            //Rowの間同士に余白
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                //名前とサムネイルのレイアウトを整えるためにContainerで箱をつくる
                Container(width: 100, child: Text('サムネイル')),
                //TextFieldとレイアウトを合わせる
                Expanded(
                  child: Container(
                    //箱の中の要素を真ん中にする
                    alignment: AlignmentDirectional.center,
                    child: ElevatedButton(
                      onPressed: () {
                        print('画像を選択');
                      },
                      child: Text('画像を選択')
                      ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}