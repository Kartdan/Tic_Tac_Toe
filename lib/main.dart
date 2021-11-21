import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tictac(List<int> list, int nr)
  {
    if(list[0] == nr && list[1] == nr && list[2] == nr)
      {
        return 1;
      }
    if(list[3] == nr && list[4] == nr && list[5] == nr)
    {
      return 1;
    }
    if(list[6] == nr && list[7] == nr && list[8] == nr)
    {
      return 1;
    }
    if(list[0] == nr && list[3] == nr && list[6] == nr)
    {
      return 1;
    }
    if(list[1] == nr && list[4] == nr && list[7] == nr)
    {
      return 1;
    }
    if(list[2] == nr && list[5] == nr && list[8] == nr)
    {
      return 1;
    }
    if(list[0] == nr && list[4] == nr && list[8] == nr)
    {
      return 1;
    }
    if(list[2] == nr && list[4] == nr && list[6] == nr)
    {
      return 1;
    }
    return 0;
  }

  int nowinner(List<int> list)
  {
    for(int i = 0; i < list.length; i++)
      {
        if(list[i] == 0)
          {
            return 0;
          }
      }
    return 1;
  }

  final List<int> _list = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<Color> colorlist = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
  ];
  int turn = 1;
  int gameover = 0;
  String button = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Center(
          child: Text('tic-tac-toe'),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: colorlist[index],
              ),
            ),
            onTap: () {
              setState(() {
                {
                  if (turn == 1) {
                    colorlist[index] = Colors.green;
                    _list[index] = 1;
                    if(tictac(_list, turn) == 1)
                      {
                        button = 'Play again';
                        gameover = 1;
                    } else {
                      turn = 2;
                    }
                  } else {
                    _list[index] = 2;
                    colorlist[index] = Colors.red;
                    if (tictac(_list, turn) == 1) {
                      button = 'Play again';
                      gameover = 1;
                    } else {
                      turn = 1;
                    }
                  }
                  if (nowinner(_list) == 1) {
                    if (gameover == 1) {
                      for (int i = 0; i < colorlist.length; i++) {
                        colorlist[i] = Colors.blue;
                      }
                      for (int i = 0; i < _list.length; i++) {
                        _list[i] = 0;
                      }
                      button = 'Play again';
                    } else {
                      for (int i = 0; i < colorlist.length; i++) {
                        colorlist[i] = Colors.blue;
                      }
                      for (int i = 0; i < _list.length; i++) {
                        _list[i] = 0;
                      }
                    }
                  }
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          button,
          textAlign: TextAlign.center,
        ),
        onPressed: (){
          setState(() {
            if(gameover == 1)
            {
              for(int i = 0; i < colorlist.length; i++)
                {
                  colorlist[i] = Colors.blue;
                }
              for(int i = 0; i < _list.length; i++)
              {
                _list[i] = 0;
              }
              button = '';
              gameover = 0;
            }
          });
        },
      ),
    );
  }
}
