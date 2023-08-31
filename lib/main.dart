import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyCalc());
}
class MyCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 title: " ",
      home:Calc() ,
    );

  }


}
class Calc extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _Calc();
  }

}
class _Calc extends State<Calc> {
  String text = "0";
  double numOne = 0;
  double numTwo = 0;
  String res = "0";
  String finalRes = "0";
  String oper=''; //operation
  String PreOper='';//previous operation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(

              children: <Widget>[
                Expanded(child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,

                  ),
                  maxLines: 1,
                  textAlign: TextAlign.right,
                ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("AC",Color(0xffa5a5a5),1),
                button("+/_",Color.fromRGBO(165, 165, 165, 1),1),
                button("%",Color.fromRGBO(165, 165, 165, 1),1),
                button("/",Color.fromRGBO(255, 152, 0, 1),1
    )





              ],
            ),



            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("7",Color.fromRGBO(50, 50, 50, 1),1),
                button("8",Color.fromRGBO(50, 50, 50, 1),1),
                button("9",Color.fromRGBO(50, 50, 50, 1),1),
                button("x",Color.fromRGBO(255, 152, 0, 1),1
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("4",Color.fromRGBO(50, 50, 50, 1),1),
                button("5",Color.fromRGBO(50, 50, 50, 1),1),
                button("6",Color.fromRGBO(50, 50, 50, 1),1),
                button("-",Color.fromRGBO(255, 152, 0, 1),1
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("1",Color.fromRGBO(50, 50, 50, 1),1),
                button("2",Color.fromRGBO(50, 50, 50, 1),1),
                button("3",Color.fromRGBO(50, 50, 50, 1),1),
                button("+",Color.fromRGBO(255, 152, 0, 1),1
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button("0",Color.fromRGBO(50, 50, 50, 1),0),
                button(".",Color.fromRGBO(50, 50, 50, 1),1),
                button("=",Color.fromRGBO(255, 152, 0, 1),1
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget button(String txt,Color color,int numb){
    Container container;
    if(numb==0){
      container =Container(
      padding: EdgeInsets.only(left: 81,top: 20,right: 81,bottom:20 ),
    child:
    ElevatedButton(
    onPressed: () {
      Calculate(txt);
    },
    child: Text(txt,
    style: TextStyle(
    fontSize: 30,
    ),
    ),


    style: ElevatedButton.styleFrom(
    backgroundColor: color,
    padding: EdgeInsets.all(20),
    shape:StadiumBorder() ,
    ),


    ),
    );
    }else{
      container =Container(
        padding: EdgeInsets.only(bottom:10 ),
        child:
        ElevatedButton(
          onPressed: () {
            Calculate(txt);
          },
          child: Text(txt,
            style: TextStyle(
              fontSize: 30,
            ),
          ),


          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20),
            shape:CircleBorder(),
          ),


        ),
      );

    }

    return container;

  }
  void Calculate(txtBtn){
    if(txtBtn=='AC'){
      text='0';
      numOne = 0;
      numTwo = 0;
      res = "0";
      finalRes = "0";
      oper='';
      PreOper='';
    }else if(oper=='='&& txtBtn=='='){
      switch(PreOper){
        case '+':
          finalRes=Add();
          break;
        case '-':
          finalRes=Sub();
          break;
        case 'x':
          finalRes=Mul();
          break;
        case '/':
          finalRes=div();
          break;
      }

    }
    else if(txtBtn=='+'|| txtBtn=='-'||txtBtn=='x'||txtBtn=='/'||txtBtn=='=') {
      if (numOne == 0) {
        numOne = double.parse(res);
      }
      else {
        numTwo=double.parse(res);
      }
      switch(oper){
        case '+':
          finalRes=Add();
          break;
        case '-':
          finalRes=Sub();
          break;
        case '*':
          finalRes=Mul();
          break;
        case '/':
          finalRes=div();
          break;
      }

      PreOper=oper;
      oper=txtBtn;
      res='';

    }else if (txtBtn=='%'){
      res=(numOne/100).toString();
      finalRes=res;
    }else if (txtBtn=='.'){
      if(!res.contains('.'))
        res +='.';
      finalRes=res;
    }else if(txtBtn=='+/_'){
      res.startsWith('-') ? res =res.substring(1):res='-'+res;
      finalRes=res;
    }
    else{
      if(res=='0')
        res=txtBtn;
      else
      res = res + txtBtn;
      finalRes=res;

    }
    setState(() {
      text=finalRes;
    });
  }
 String Add(){
    res=(numOne+numTwo).toString();
    numOne=double.parse(res);
    return decimalRemove(res);
 }
  String Sub(){
    res=(numOne-numTwo).toString();
    numOne=double.parse(res);
    return res;
  }
  String Mul(){
    res=(numOne*numTwo).toString();
    numOne=double.parse(res);
    return decimalRemove(res);
  }
  String div(){
    res=(numOne/numTwo).toString();
    numOne=double.parse(res);
    return decimalRemove(res);
  }
  String decimalRemove(String _res){
    if(_res.contains('.')){
      List<String> split =_res.split('.');
      if(!(int.parse(split[1])>0) )
        return split[0];
    }
    return _res;
  }

}

