import 'package:emicalculator/widgets/chart.dart';
import 'package:emicalculator/widgets/slider.dart';
import 'package:emicalculator/widgets/textbox.dart';
import 'package:flutter/material.dart';

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  int _value = 1;
  int loanAmount = 0;
  double total_interest = 0;
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  double emi = 0;
  takeSliderValue(int value) {
    _value = value;
    print("Rec value from slider $value");
    t3.text = _value.toString();
    setState(() {});
  }

  _compute() {
    loanAmount = int.parse(t1.text);
    int roi = int.parse(t2.text);
    int tenure = int.parse(t3.text);
    print("Tenure is $tenure");
    total_interest =
        double.parse((loanAmount * roi * tenure / 100).toStringAsFixed(2));
    emi = double.parse(
        ((total_interest + loanAmount) / (12 * tenure)).toStringAsFixed(2));
    print("Total interest is $total_interest");
    print("EMI is $emi");
    setState(() {});
  }

  _getTextContainer(label, value, devicesize) {
    return Container(
      height: 45,
      width: devicesize.width / 2.2,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text("₹ $value")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    Map<String, double> dataMap = {
      "Interest": total_interest,
      "Principal Amount": loanAmount.toDouble()
    };
    TextBox tb =
        TextBox(label: "Tenure ", icondata: Icons.money_off_rounded, tc: t3);
    tb.setFunction(takeSliderValue);
    return Scaffold(
        appBar: AppBar(title: Text("EMI CALCULATOR")),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          TextBox(label: "Loan Money", icondata: Icons.money, tc: t1),
          TextBox(label: "ROI ", icondata: Icons.monetization_on, tc: t2),
          tb,
          MySlider(takeSliderValue,
              _value), //pass fn as an argument to the constructor
          ElevatedButton(
            onPressed: () {
              _compute();
            },
            child: Text("Compute"),
          ),
          Text(
            "Emi $emi",
            style: TextStyle(fontSize: 50),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                  child: Row(
                children: [
                  Container(
                    child: Expanded(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _getTextContainer("Loan EMI", emi, deviceSize),
                              SizedBox(
                                height: 10,
                              ),
                              _getTextContainer("Total Interest Playable",
                                  total_interest, deviceSize),
                              SizedBox(
                                height: 10,
                              ),
                              _getTextContainer("Total Payment",
                                  loanAmount + total_interest, deviceSize)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: chart(dataMap),
                  ),
                ],
              ))),
        ])));
  }
}
