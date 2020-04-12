import 'package:flutter/material.dart';
import 'addressModal.dart';

class AddressList extends StatelessWidget {
  final List<Address> data;
  const AddressList(this.data);

  @override
  Widget build(BuildContext context) {
    var placewidth = MediaQuery.of(context).size.width;
    placewidth = placewidth ;
    return Container(
      height: 470,
                width: double.infinity,

      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                    height: 110,
                    margin: EdgeInsets.only(top:5),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.tealAccent[400]),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                        ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: placewidth*0.57,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            data[index].details,
                            style: TextStyle(fontSize: 17,color: Colors.grey[800]),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(left: BorderSide(width: 0.4,color: Colors.tealAccent[400]))
                          ),
                          padding: EdgeInsets.only(left:10),
                          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                          children: <Widget>[
                            Text('Latitude',style: TextStyle(fontSize: 14,color: Colors.grey[800],fontWeight: FontWeight.w600,)),
                            Text('${data[index].lat}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.tealAccent[700]),),
                            Text('Longitude',style: TextStyle(fontSize: 14,color: Colors.grey[800],fontWeight: FontWeight.w600,)),
                            Text('${data[index].lng}',style: TextStyle(fontSize: 14,color: Colors.tealAccent[700],fontWeight: FontWeight.w600,),)
                          ],
                        ))
                      ],
                    ));
          }),
    );
  }
}
