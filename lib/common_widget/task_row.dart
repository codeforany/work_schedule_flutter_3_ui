import 'package:flutter/material.dart';
import 'package:flutter_face_pile/flutter_face_pile.dart';
import 'package:work_schedule/common/color_extenstion.dart';

class TaskRow extends StatelessWidget {
  final Map tObj;
  final int index;
  const TaskRow({super.key, required this.tObj, required this.index});

  @override
  Widget build(BuildContext context) {

    var imgArr = tObj["image"] as List? ?? [];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              tObj["dtime"].toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: TColor.primary,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: index % 2 == 0 ? TColor.color3 : TColor.color4,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tObj["name"].toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: index % 2 == 0
                            ? TColor.color3Text
                            : TColor.color4Text,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    tObj["sub_name"].toString(),
                    style: TextStyle(
                        fontSize: 11,
                        color: index % 2 == 0
                            ? TColor.color3Text
                            : TColor.color4Text,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 25 + ( (imgArr.length - 1) * 25 * 0.6 ) ,
                        child: FacePile(
                          faces: 
                          
                          imgArr.map((iObj) {

                            return  FaceHolder(
                              id: iObj["id"].toString(),
                              name: iObj["name"].toString(),
                              avatar: NetworkImage(
                                  iObj["image"].toString()),
                            );
                          } ).toList()

                         ,
                          faceSize: 25,
                          facePercentOverlap: .3,
                          borderColor: Colors.white,
                        ),
                      ),
                      Text(
                        tObj["time"].toString(),
                        style: TextStyle(
                            fontSize: 11,
                            color: index % 2 == 0
                                ? TColor.color3Text
                                : TColor.color4Text),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
