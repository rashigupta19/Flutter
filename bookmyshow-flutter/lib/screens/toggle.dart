import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

const double width = 180.0;
const double height = 36.0;
const double nowAlign = -1;
const double comingAlign = 1;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  Color nowColor = const Color.fromARGB(255, 255, 255, 255);
  

  @override
  void initState() {
    super.initState();
    xAlign = nowAlign;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(74, 76, 91, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(xAlign, 0),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: width * 0.5,
                  height: height,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(246, 55, 89, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = nowAlign;
                   
                  });
                },
                child: Align(
                  alignment: const Alignment(-1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'NOW SHOWING',
                      style: TextStyle(
                        color: nowColor,
                        fontSize: 10
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    xAlign = comingAlign;
                  });
                },
                child: Align(
                  alignment: const Alignment(1, 0),
                  child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'COMING SOON',
                      style: TextStyle(
                        color: nowColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}