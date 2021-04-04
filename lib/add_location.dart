import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:location/location.dart' as loc;
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

const kApiKey =
    'pk.eyJ1IjoiYWJkdWxxdWFkaXIxMjMiLCJhIjoiY2s5a2FmNHM3MDRudTNmbHIxMXJnazljbCJ9.znqRJyK_9-nzvIoPaSrmjw';

class GetLocation extends StatefulWidget {
  GetLocation(      { Key key})
      : super(key: key);
//  final Position initialPosition;

//  final bool showMarker;
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  String mapSearchValue;
  bool _showMarker, locating = false, istap = false;
  Position position;
  loc.Location location;
  TextEditingController locationTextController;
  @override
  void initState() {
    super.initState();
    _showMarker = true;
    location = loc.Location();
    position =
         Position(latitude: null, longitude: null);
    locationTextController = TextEditingController();
//    if (position.latitude == null || position.longitude == null)
      getUserLocation();
  }

  void getUserLocation() async {
    setState(() => locating = true);
    try {
      bool _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }
      showDialog(
          context: context,
          builder: (_) => WillPopScope(
              onWillPop: () => Future.value(false),
              child: Material(
                color: Colors.transparent,
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Getting your Location', style: TextStyle(color: Colors.white),)
                  ],
                )),
              )));
      Position userPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(  'Lat and long are ${userPosition.latitude} ${userPosition.longitude}');

      final coordinates =
          new Coordinates(userPosition.latitude, userPosition.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      setState(() {
        position = userPosition;
        mapSearchValue = first.addressLine;
        _showMarker = isSelected = true;
        locationTextController.text = mapSearchValue;
      });
      LatLng latlog = new LatLng(position.latitude, position.longitude);
      _mapController.onReady.then((value) => _mapController.move(latlog, 12));
      Navigator.of(context, rootNavigator: true).pop();
      setState(() => locating = false);
      // print("${first.featureName} : ${first.addressLine}");
    } catch (e) {
      print(e.toString());
      setState(() => locating = false);
    }
  }

  void getLocation(String address) async {
    List<Address> results =
        await Geocoder.local.findAddressesFromQuery(address);
    Coordinates coordinates = results.first.coordinates;
    setState(() {
      _showMarker = true;
      position = Position(
          latitude: coordinates.latitude, longitude: coordinates.longitude);
      print(  'Lat and long are ${coordinates.latitude} ${coordinates.longitude}');
      LatLng latlog = new LatLng(coordinates.latitude, coordinates.longitude);
      _mapController.move(latlog, 12);
    });
  }

  final _mapController = MapController();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: getUserLocation,
        child: Icon(Icons.gps_fixed),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Add Location",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context, null);
            // locationval.value = TextEditingValue(text: mapSearchValue);
            // locationval.selection = TextSelection.fromPosition(
            //     TextPosition(offset: locationval.text.length));
            // setState(() {});
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  mapSearchValue == null
                      ? null
                      : {'location': mapSearchValue, 'position': position});
            },
            child: Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        elevation: 1.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                  interactive: true,
                  center: LatLng(position.latitude ?? 19.0760,
                      position.longitude ?? 72.8777),
                  minZoom: 10.0,
                  maxZoom: 18,
                  zoom: 13.0),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/abdulquadir123/ck9kbtkmm0ngc1ipif8vq6qbv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJkdWxxdWFkaXIxMjMiLCJhIjoiY2s5a2FmNHM3MDRudTNmbHIxMXJnazljbCJ9.znqRJyK_9-nzvIoPaSrmjw",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiYWJkdWxxdWFkaXIxMjMiLCJhIjoiY2s5a2FmNHM3MDRudTNmbHIxMXJnazljbCJ9.znqRJyK_9-nzvIoPaSrmjw',
                    'id': 'mapbox.mapbox-streets-v8'
                  },
                ),
                MarkerLayerOptions(
                  markers: [
                    if (_showMarker)
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(position.latitude ?? 19.0760,
                            position.longitude ?? 72.8777),
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.teal,
                            size: 45.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20.0,
            left: 15.0,
            right: 15.0,
            child: isSelected
                ? Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black, blurRadius: 0, spreadRadius: 0)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: locationTextController,
                                onChanged: (value) => mapSearchValue = value,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                                onTap: () {
                                  setState(() => isSelected = false);
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.teal,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                : MapBoxPlaceSearchWidget(
                    apiKey: kApiKey,
                    searchHint: 'Search here',
                    height: 500,
                    country: 'in',
//                    limit: 15,
                    onSelected: (place) {
                      setState(() {
                        MapBoxPlace temp = place;
                        mapSearchValue = temp.placeName;
                        getLocation(mapSearchValue);
                        // print("search value  : $mapSearchValue");
                      });
                    },
                    context: context,
                  ),
          )
        ],
      ),
    );
  }
}
