import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TopProgressRow extends StatelessWidget {
  final Map tObj;
  final Color bgColor;
  final Color textColor;
  final bool isActivePadding;
  const TopProgressRow({super.key, required this.tObj, required this.bgColor, required this.textColor, this.isActivePadding = false});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: isActivePadding ? const EdgeInsets.only(bottom:  10, top: 0 ) : const EdgeInsets.only(bottom:  0, top: 10 ), 
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        padding: const EdgeInsets.all(15),
        width: 150,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
    
            BoxShadow(color: bgColor.withOpacity(0.7,), offset: const Offset(0, 4), blurRadius: 8  )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
              SimpleCircularProgressBar(
                size: 60,
                progressColors: [ textColor.withOpacity(0.7) ],
                backStrokeWidth: 0,
                maxValue: double.tryParse(tObj["max_val"].toString()) ?? 0.0 ,
                progressStrokeWidth: 6,
              valueNotifier: ValueNotifier( double.tryParse(tObj["val"].toString()) ?? 0.0   ),
              mergeMode: true,
              onGetText: (double value) {
                TextStyle centerTextStyle = TextStyle(
                  fontSize: 15,
                  color:  textColor.withOpacity(0.7),
                  fontWeight: FontWeight.w700
                );
    
                return Text(
                  tObj["displayType"].toString() == "val" ?  '${value.toInt()}/${int.tryParse(tObj["max_val"].toString()) ?? 0}' : '${value.toInt()}%',
                  style: centerTextStyle,
                );
              },
            ),
    
            const Spacer(),
    
            Text(
              tObj["name"].toString(),
              style:  TextStyle(
                fontSize: 15,
                color: textColor,
                fontWeight: FontWeight.w700
              ),
            ),
    
            const SizedBox(height: 4,),
    
             Text(
              tObj["sub_name"].toString(),
              style: TextStyle(
                  fontSize: 11,
                  color: textColor.withOpacity(0.7),
                  fontWeight: FontWeight.w700),
            )
    
    
        ],),
      ),
    );
  }
}
