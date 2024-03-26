
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:untitled/WebViewPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {

  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '8826eec5f744658162616455cf5361ad',
    javaScriptAppKey: '529540eb153fa80c33ac0fea3a763257',
  );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);
  
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const WebViewPage()));
            },
            child: const Text("Web view"),
          ),
        ),
      )
    );
  }
}

/*
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _callAPI() async {
    try {
      await AuthCodeClient.instance.authorize(
        redirectUri: 'http://localhost:8080/login/oauth2/code/kakao',
      );
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),

      body: Center(

        child: TextButton(
          onPressed: _callAPI,
          child: Image.asset('assets/kakao_login.png')
        ),
      ),

    );
  }

}
*/
