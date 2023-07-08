import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/dark_theme.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key? key}) : super(key: key);

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Map<int, List<IconData>> icons = {
    1: [
      Icons.electric_bike,
      Icons.directions_bike,
      Icons.bike_scooter,
      Icons.pedal_bike
    ],
    2: [Icons.house, Icons.house_siding, Icons.cottage, Icons.cabin],
    3: [
      Icons.timer_outlined,
      Icons.access_alarm,
      Icons.add_alarm,
      Icons.access_time
    ],
  };

  late int iconGroup;
  late IconData selected;
  late List<int> randomNumbers;
  int selectedIndex = -1;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    generateRandomIcons();
  }

  void generateRandomIcons() {
    final random = Random();
    iconGroup = random.nextInt(3) + 1;
    int rand = random.nextInt(4);
    selected = icons[iconGroup]![rand];
    randomNumbers = generateRandomNumbers();
    selectedIndex = -1;
    isCorrect = false;
  }

  void _resetDialog() {
    setState(() {
      randomNumbers = generateRandomNumbers();
      iconGroup = Random().nextInt(3) + 1;
      selected = icons[iconGroup]![Random().nextInt(4)];
      selectedIndex = -1;
    });
  }

  List<int> generateRandomNumbers() {
    final List<int> numbers = [0, 1, 2, 3];
    final random = Random();
    numbers.shuffle(random);
    return numbers;
  }

  void checkAnswer(int index) {
    if (icons[iconGroup]![index] == selected) {
      setState(() {
        selectedIndex = index;
        isCorrect = true;
      });
      Timer(Duration(seconds: 1), () {
        Navigator.pop(context, true);
      });
    } else {
      setState(() {
        selectedIndex = index;
        isCorrect = false;
      });
      Future.delayed(const Duration(seconds: 1), () {
        _resetDialog();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: 'Select the similar icon as '),
                  WidgetSpan(child: Icon(selected)),
                ],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.watch<DarkThemeProvider>().darkTheme
                        ? Colors.white
                        : Colors.black)),
          ),
          SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children:
                List.generate(4, (index) => _buildCard(randomNumbers[index])),
          ),
          if (isCorrect)
            Text(
              'Correct!',
              style: TextStyle(color: Colors.blue),
            ),
          if (isCorrect) SizedBox(height: 16),
          if (!isCorrect && selectedIndex != -1)
            Text(
              'Try again!',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  Widget _buildCard(int index) {
    final random = Random();
    final rotationAngle = random.nextInt(360).toDouble();
    final isSelected = index == selectedIndex;
    final borderColor = isSelected
        ? (isCorrect ? Colors.blue : Colors.red)
        : Colors.transparent;
    return InkWell(
      onTap: () {
        if (isCorrect) return;
        checkAnswer(index);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Transform.rotate(
          angle: rotationAngle * (pi / 180),
          child: Icon(
            icons[iconGroup]![index],
            size: 45,
          ),
        ),
      ),
    );
  }
}
