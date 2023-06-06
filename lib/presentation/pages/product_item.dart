import 'package:flutter/material.dart';
import 'package:nano_health_assesment/presentation/pages/details_page.dart';

class ProductItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  height: 300,
                  width: 200,
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow:[ BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 2,
                      )
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage()));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset("assets/teacher1.jpg",
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                shape: BoxShape.circle,

                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("T.Loony",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue
                              ),
                            ),
                            Text("Math",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54
                              ),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(height: 5,),
                                Text("4.9",style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54
                                ),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}