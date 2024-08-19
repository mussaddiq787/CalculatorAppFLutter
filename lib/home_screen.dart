import 'package:flutter/material.dart';
import 'package:calculatorapp/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = " ";
  var answer = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment : Alignment.bottomRight,
                          child: Text(userinput.toString(), style: TextStyle(fontSize: 40, color: Colors.white),),),
                           SizedBox(height: 10,),
                           Text(answer.toString(), style: TextStyle(fontSize: 40, color: Colors.white),),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: 'AC', onpress: (){
                          userinput = '';
                          answer = '';
                          setState(() {});
                        },),
                        MyButton(title: '+/-',onpress: (){
                          userinput += '+/-';
                          setState(() {

                          });
                        },),
                        MyButton(title: '%', onpress: (){
                          userinput += '%';
                          setState(() {

                          });
                        },),
                        MyButton(title: '/',onpress: (){
                          userinput += '/';
                          setState(() {

                          });
                        }, color:Color(0xffFFA500),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '7', onpress: (){
                          userinput += '7';
                          setState(() {
                          });
                        },),
                        MyButton(title: '8',onpress: (){
                          userinput += '8';
                          setState(() {

                          });
                        },),
                        MyButton(title: '0', onpress: (){
                          userinput += '0';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'x',onpress: (){
                          userinput += 'x';
                          setState(() {

                          });
                        }, color:Color(0xffFFA500),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '4', onpress: (){
                          userinput += '4';
                          setState(() {

                          });
                        },),
                        MyButton(title: '5',onpress: (){
                          userinput += '5';
                          setState(() {

                          });
                        },),
                        MyButton(title: '6', onpress: (){
                          userinput += '6';
                          setState(() {

                          });
                        },),
                        MyButton(title: '-',onpress: (){
                          userinput += '-';
                          setState(() {

                          });
                        }, color:Color(0xffFFA500),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '1', onpress: (){
                          userinput += '1';
                          setState(() {

                          });
                        },),
                        MyButton(title: '2',onpress: (){
                          userinput += '2';
                          setState(() {

                          });
                        },),
                        MyButton(title: '3', onpress: (){
                          userinput += '3';
                          setState(() {

                          });
                        },),
                        MyButton(title: '+',onpress: (){
                          userinput += '+';
                        setState(() {

                        });}, color:Color(0xffFFA500),),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '0', onpress: (){
                          userinput += '0';
                          setState(() {

                          });
                        },),
                        MyButton(title: '.',onpress: (){
                          userinput += '.';
                          setState(() {

                          });
                        },),
                        MyButton(title: 'DEL', onpress: (){
                          userinput = userinput.substring(0 , userinput.length - 1);

                          setState(() {

                          });
                        },),
                        MyButton(title: '=',onpress: (){
                          equalpress();
                          setState(() {
                          });
                        }, color:Color(0xffFFA500),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalpress(){
     String finalUserInput = userinput;
     finalUserInput = userinput.replaceAll('x', '*');
    Parser p = Parser();
      Expression exp = p.parse(finalUserInput);
ContextModel contextModel = ContextModel();

double eval = exp.evaluate(EvaluationType.REAL, contextModel);
answer = eval.toString();
  }
}



