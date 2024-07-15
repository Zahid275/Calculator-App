import 'package:calculator_2/Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var Question = "";
  String Answer = "";

  isOperation(String x) {
    if (x == '%' ||
        x == "÷" ||
        x == "+" ||
        x == '-' ||
        x == "X" ||
        x == "Ans") {
      return true;
    } else {
      return false;
    }
  }



  List ButtonsList = [
    "C", 'Del', "%", "÷",
    "7", "8", "9", "+",
    "4", "5", "6", "-",
    '1', '2', "3", "X",
    '0', '.', 'Ans', '='
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("   Calculator",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.purple[100],
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.purple[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 20 ),
                        alignment: Alignment.topLeft,
                        child: Text(Question,
                          style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
                    Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.topRight,
                        child: Text(Answer,
                          style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
                  ],

                ),


              ),
            ),
            Expanded(
              flex: 13,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ButtonsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyButton(
                          btnText: ButtonsList[index],
                          btnColor: Colors.green[400],
                          onPressed: () {
                            setState(() {
                              Question = '';
                              Answer = "";
                            });


                          },
                          txtColor: Colors.white,
                        ),
                      );
                    }
                    if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyButton(
                          btnText: ButtonsList[index],
                          btnColor: Colors.redAccent,
                          onPressed: () {
                            setState(() {
                             Question =  Question.substring(0,Question.length-1);
                            });


                          },
                          txtColor: Colors.white,
                        ),
                      );
                    }
                    else if(index == ButtonsList.length-1){
                      return Padding(padding: const EdgeInsets.all(10),
                        child: MyButton(btnText: ButtonsList[index],
                          txtColor: Colors.white,
                          btnColor: Colors.deepPurpleAccent,
                          onPressed: (){
                            EqualPressed();
                          },

                        ),

                      );



                    }



                    else {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: MyButton(
                            btnText: ButtonsList[index],
                            onPressed: () {
                              setState(() {
                                Question = Question+ ButtonsList[index];

                              });

                            },
                            txtColor: isOperation(ButtonsList[index])
                                ? Colors.white
                                : Colors.deepPurpleAccent,
                            btnColor: isOperation(ButtonsList[index])
                                ? Colors.deepPurpleAccent
                                : Colors.white),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }




  EqualPressed(){
    print("hello");
    var finalQuestion = Question;

    finalQuestion = finalQuestion.replaceAll("X", "*",);

    finalQuestion = finalQuestion.replaceAll("÷", "/",);
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm

    );
    print(eval.toString());



    setState(() {
      Answer =  eval.toString();
    });

  }
}
