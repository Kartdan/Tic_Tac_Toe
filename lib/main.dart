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
  void createAlertDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text('$number'), actions: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                conclusion,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ]);
        });
  }

  final TextEditingController controller = TextEditingController();
  String conclusion = '';
  int? number;
  String? text;
  String? errorText;
  String result = '';
  int x;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Number Shapes'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsetsDirectional.all(16.0),
            child: const Text(
              'Please input a number to see if it is square or triangular.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.all(16.0),
            child: TextField(
              controller: controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (String? value) {},
              decoration: InputDecoration(
                errorText: errorText,
                hintText: 'Try me',
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE57373),
        elevation: 0.0,
        onPressed: () {
          int squareFlag = 0;
          int triangularFlag = 0;
          final String value = controller.text;
          final int? intValue = int.tryParse(value);
          setState(() {
            if (intValue == null) {
              errorText = 'please enter a number';
            } else {
              number = intValue;
              errorText = null;
              for (int i = 0; i < intValue / 2; i++) {
                if (i * i == intValue) {
                  squareFlag = 1;
                }
              }
              for (int i = 0; i < intValue / 2; i++) {
                if (i * i * i == intValue) {
                  triangularFlag = 1;
                }
              }
              if (squareFlag == 0 && triangularFlag == 0) {
                conclusion =
                    'Number $intValue is neither TRIANGULAR or SQUARE.';
              } else if (squareFlag == 1 && triangularFlag == 1) {
                conclusion = 'Number $intValue is both TRIANGULAR and SQUARE.';
              } else if (squareFlag == 1) {
                conclusion = 'Number $intValue is SQUARE.';
              } else if (triangularFlag == 1) {
                conclusion = 'Number $intValue is TRIANGULAR.';
              }
              createAlertDialog(context);
              controller.clear();
            }
          });
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
