import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWidget extends StatefulWidget {
  const SharedPreferencesWidget({super.key});

  @override
  State<SharedPreferencesWidget> createState() =>
      _SharedPreferencesWidgetState();
}

class _SharedPreferencesWidgetState extends State<SharedPreferencesWidget> {
  int _counter = 0;
  // 객체 초기화. null이 될 수도 있다.
  // 빈 껍데기 상태
  SharedPreferences? prefs;

  // initState가 실행될 때 initPreferences()를 실행
  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  void initPreferences() async {
    // 빈 껍데기였던 prefs를 값으로 채워주고
    prefs = await SharedPreferences.getInstance();
    // 채워졌으면 _counter 변수로 넣어준다.
    // 이 때 _counter는 제일 처음 실행한 사람에게는 prefs값이 없을테니까 null이면 0으로 넣어준다.
    if (prefs != null) {
      _counter = prefs!.getInt('_counter') ?? 0;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Widget'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: false,
        leading: Icon(Icons.people),
        actions: [
          Icon(Icons.share),
        ],
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: TextStyle(
            fontSize: 48,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _counter += 1);
          // prefs가 빈 껍데기가 아니면 prefs에 값을 넣어준다.
          if (prefs != null) {
            prefs!.setInt('_counter', _counter);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
