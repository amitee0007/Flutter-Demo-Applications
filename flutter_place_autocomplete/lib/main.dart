import 'dart:async';
import 'package:flutter_place_autocomplete/addressList.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/material.dart';
import 'addressModal.dart';

const kGoogleApiKey = "ENTER_YOUR_API_HERE";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
List<Address> data = [];

main() => runApp(AddLocation());

class AddLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchPlace(),
      );
}

final _errorkey = GlobalKey<ScaffoldState>();
final _addedkey = GlobalKey<ScaffoldState>();


class SearchPlace extends PlacesAutocompleteWidget {
  SearchPlace()
      : super(
          apiKey: kGoogleApiKey,
          language: "en",
        );

  @override
  _SearchPlaceState createState() => _SearchPlaceState();
}

class _SearchPlaceState extends PlacesAutocompleteState {
  Future<Null> displayPrediction(Prediction info) async {
    if (info != null) {
      // get place (lat/lng)
      PlacesDetailsResponse place =
          await _places.getDetailsByPlaceId(info.placeId);
      final lat = place.result.geometry.location.lat;
      final lng = place.result.geometry.location.lng;

      // GetInput(info.description,lat,lng);
      var fetched = new Address();
      fetched.details = '${info.description}';
      fetched.lat = lat;
      fetched.lng = lng;  



      setState(() {
        data.add(fetched);
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.tealAccent[400]),
            borderRadius: BorderRadius.circular(5)
          ),
          child: AppBarPlacesAutoCompleteTextField(),
        ),
        Container(
          height: 200,
          child: PlacesAutocompleteResult(
              onTap: (info) {
                displayPrediction(info);
              },
              logo: Center(
                child: Icon(
                  Icons.place,
                  size: 100,
                  color: Colors.tealAccent[400],
                  
                ),
              )),
        ),
        Container(
          width: double.infinity,
            child: data.length > 0
                ? AddressList(data)
                : Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        'Place Autocomplete Application',
                        style: TextStyle(color: Colors.grey[800], fontSize: 26),
                      )
                      ),
                      SizedBox(height: 60,),
                      Center(child: 
                      Text('Search & Add Places in your list',
                      style: TextStyle(
                        color: Colors.tealAccent[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      )
                    ],
                  ))
      ],
    );

    return SafeArea(child: Scaffold(key: _errorkey, body: body));
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    _errorkey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }
}

