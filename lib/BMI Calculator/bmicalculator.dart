import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController WeightController=TextEditingController();
  TextEditingController heightController=TextEditingController();
  double ?bmi;
  bool isUnderweight=false,isOverWeight=false,isNormal=false,isObesity=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('BMI Calculator'),backgroundColor: const Color.fromARGB(255, 170, 121, 179),),
     body: Padding(padding: EdgeInsets.all(15.0),
     child: Column(
      children: [
        Row(
          children: [
            Text('Weight (KG)',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(width: 10,),
            Container(height: 60,
            width: 200,
            child: TextFormField(
              controller: WeightController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            )

          ],
          
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text('Height (m)',style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(width: 18,),
            Container(height: 60,
            width: 200,
            child: TextFormField(
              controller: heightController,
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
            ),
            )

          ],
          
        ),
        SizedBox(height: 10,),
        Center(
          child: ElevatedButton(
            onPressed: (){
              double weight=double.parse(WeightController.text);
              double height=double.parse(heightController.text);
              bmi=double.parse( (weight/(height*height)).toStringAsFixed(1));
              isUnderweight=isOverWeight=isNormal=isObesity=false;
              setState(() {
                  if(bmi!=null){
                       if(bmi!<18.5){
                        isUnderweight=true;

                       }
                       else if(bmi!<=24.9){
                        isNormal=true;

                       }
                       else if(bmi!<=29.9){
                        isOverWeight=true;
                       }
                       else{
                        isObesity=true;
                       }

                  }
              });

            },
            child: Text('Calculate',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          
          ),
        ),
        SizedBox(height: 10,),
        bmi==null?Text(''):Text('BMI = ${bmi}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
     ,  SizedBox(height: 10,),
       Row(
        children: [
          Container(
            height: 50,
            width: 120,
            child: Center(child: Text('Underweight',style: TextStyle(fontSize: 15),)),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
              color: isUnderweight?Colors.red:Colors.grey
            ),
          ),
          SizedBox(width: 15,),
           Container(
            height: 50,
            width: 120,
            child: Center(child: Text('Normal weight',style: TextStyle(fontSize: 15),)),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
              color: isNormal?Colors.green:Colors.grey
            ),
          ),

        ],
       )
       ,  SizedBox(height: 10,),
       Row(
        children: [
          Container(
            height: 50,
            width: 120,
            child: Center(child: Text('Overweight',style: TextStyle(fontSize: 15),)),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
              color:isOverWeight?Colors.red:Colors.grey
            ),
          ),
          SizedBox(width: 15,),
           Container(
            height: 50,
            width: 120,
            child: Center(child: Text('Obesity',style: TextStyle(fontSize: 15),)),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(5),
              color: isObesity?Colors.red:Colors.grey
            ),
          ),

        ],
       )

      ],
     ),
     ),
    );
  }
}