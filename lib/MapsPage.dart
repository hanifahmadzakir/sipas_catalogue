import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:sipas_userapps/BugReport.dart';
import 'package:sipas_userapps/auth_services.dart';
// ignore: unused_import
import 'package:async/async.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController mapController;

  String searchAddr;

  //Marker's Coordinate
  final Set<Marker> _markers = {};
  LatLng _currentPosition = LatLng(-6.914744, 107.609810);
  LatLng _terminal = LatLng(-6.942786083, 107.5963195);
  LatLng _ahmadYaniA = LatLng(-6.919854, 107.6223);
  LatLng _ahmadYaniB = LatLng(-6.909912, 107.640911);
  LatLng _abcA = LatLng(-6.918372, 107.604475);
  LatLng _abcB = LatLng(-6.919363, 107.608065);
  LatLng _abdulRahmanSaleh = LatLng(-6.907417, 107.584372);
  LatLng _acehA = LatLng(-6.910392, 107.608275);
  LatLng _acehB = LatLng(-6.910235, 107.609659);
  LatLng _alkateri = LatLng(-6.920285, -6.920285);
  LatLng _ambonA = LatLng(-6.907293, 107.618493);
  LatLng _ambonB = LatLng(-6.907483, 107.616903);
  LatLng _ambonC = LatLng(-6.908744, 107.614178);
  LatLng _anggrek = LatLng(-6.912577, 107.628781);
  LatLng _astanaAnyar = LatLng(-6.933388, 107.602368);
  LatLng _astina = LatLng(-6.9044758, 107.596251);
  LatLng _badakSinga = LatLng(-6.896809, 107.609889);
  LatLng _bali = LatLng(-6.912501, 107.615947);
  LatLng _dalemKaumA = LatLng(-6.922263399, 107.6058869);
  LatLng _dalemKaumB = LatLng(-6.922551493, 107.608233);
  LatLng _drRajiman = LatLng(-6.90386887, 107.6002476);
  LatLng _jendSudirmanA = LatLng(-6.920422082, 107.601183);
  LatLng _jendSudirmanB = LatLng(-6.919337488, 107.5951456);
  LatLng _jendSudirmanC = LatLng(-6.919443661, 107.5899009);
  LatLng _ahmadYaniC = LatLng(-6.907883, 107.644766);
  LatLng _lodaya = LatLng(-6.930921, 107.6224032);
  LatLng _mTohaA = LatLng(-6.943155099, 107.6080074);
  LatLng _mTohaB = LatLng(-6.958287885, 107.6265564);
  LatLng _malabarA = LatLng(-6.923067762, 107.6249657);
  LatLng _malabarB = LatLng(-6.924549286, 107.6246505);
  LatLng _naripan = LatLng(-6.920718436, 107.6150488);
  LatLng _panjunan = LatLng(-6.929940376, 107.5985056);
  LatLng _pecinanLama = LatLng(-6.917552223, 107.6048791);
  LatLng _pungkurA = LatLng(-6.927357948, 107.6063958);
  LatLng _pungkurB = LatLng(-6.929055612, 107.6105167);
  LatLng _pungkurC = LatLng(-6.930253896, 107.6110806);
  LatLng _purnawarman = LatLng(-6.904409437, 107.6092315);
  LatLng _suniaraja = LatLng(-6.915693362, 107.6051655);
  LatLng _masjidAgungBdg = LatLng(-6.922449372, 107.6073883);

  //Marker's Setting and Information
  @override
  void initState() {
    _markers.add(Marker(
      markerId: MarkerId("Kota Bandung"),
      position: _currentPosition,
      infoWindow: InfoWindow(title: "Kota bandung", snippet: "kota kembang"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Terminal Leuwi Panjang"),
      position: _terminal,
      infoWindow: InfoWindow(
        title: "Parkiran Terminal Leuwi Panjang",
        snippet: "Kapasitas: Mobil : 182 ",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Ahmad Yani A"),
      position: _ahmadYaniA,
      infoWindow: InfoWindow(
          title: "Parkiran Ahmad Yani A", snippet: "Kapasitas: Mobil: 99"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Ahmad Yani B"),
      position: _ahmadYaniB,
      infoWindow: InfoWindow(
          title: "Parkiran Ahmad Yani B", snippet: "Kapasitas: Motor: 144"),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran ABC A"),
      position: _abcA,
      infoWindow: InfoWindow(
          title: "Parkiran ABC A",
          snippet: "Kapasitas: Mobil:16 || Motor: 300"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran ABC B"),
      position: _abcB,
      infoWindow: InfoWindow(title: "Parkiran ABC B", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran A.R. Saleh"),
      position: _abdulRahmanSaleh,
      infoWindow: InfoWindow(
          title: "Parkiran Abdul Rahman Saleh", snippet: "Kapasitas: Mobil:44"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Aceh A"),
      position: _acehA,
      infoWindow: InfoWindow(title: "Parkiran Aceh A", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Aceh B"),
      position: _acehB,
      infoWindow: InfoWindow(title: "Parkiran Aceh B", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Alkateri"),
      position: _alkateri,
      infoWindow: InfoWindow(
          title: "Parkiran Alkateri",
          snippet: "Kapasitas: Mobil:28 || Motor: 122"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Ambon A"),
      position: _ambonA,
      infoWindow: InfoWindow(
          title: "Parkiran Ambon A",
          snippet: "Kapasitas: Mobil:23 || Motor: 35"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Ambon B"),
      position: _ambonB,
      infoWindow: InfoWindow(title: "Parkiran Ambon B", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Ambon C"),
      position: _ambonC,
      infoWindow: InfoWindow(
          title: "Parkiran Ambon C",
          snippet: "Kapasitas: Mobil:18 || Motor: 13"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Anggrek"),
      position: _anggrek,
      infoWindow: InfoWindow(title: "Parkiran Anggrek", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Astana Anyar"),
      position: _astanaAnyar,
      infoWindow: InfoWindow(title: "Parkiran Astana Anyar", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Astina"),
      position: _astina,
      infoWindow: InfoWindow(title: "Parkiran Astina", snippet: " "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Badak Singa"),
      position: _badakSinga,
      infoWindow: InfoWindow(
          title: "Parkiran Badak Singa", snippet: "Kapasitas: Mobil:10"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Bali"),
      position: _bali,
      infoWindow:
          InfoWindow(title: "Parkiran Bali", snippet: "Kapasitas: Mobil:43 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Dalem kaum A"),
      position: _dalemKaumA,
      infoWindow: InfoWindow(
          title: "Parkiran Dalam kaum A",
          snippet: "Kapasitas: Mobil:100 || Motor: 100"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Dalem Kaum B"),
      position: _dalemKaumB,
      infoWindow: InfoWindow(
          title: "Parkiran Dalem kaum", snippet: "Kapasitas: Mobil:68 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Dr. Rajiman"),
      position: _drRajiman,
      infoWindow: InfoWindow(
          title: "Parkiran Dr. Rajiman", snippet: "Kapasitas: Mobil:10 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Jend. Sudirman"),
      position: _jendSudirmanA,
      infoWindow: InfoWindow(
          title: "Parkiran Jend. Sudirman A",
          snippet: "Kapasitas: Mobil:88 || Motor: 20"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Jend. Sudirman"),
      position: _jendSudirmanB,
      infoWindow: InfoWindow(
          title: "Parkiran Jend. Sudirman B",
          snippet: "Kapasitas: Mobil:150 || Motor: 20"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Jend. Sudirman"),
      position: _jendSudirmanC,
      infoWindow: InfoWindow(
          title: "Parkiran Jend. Sudirman C",
          snippet: "Kapasitas: Mobil:50 || Motor: 6"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Ahmad Yani C"),
      position: _ahmadYaniC,
      infoWindow: InfoWindow(
          title: "Parkiran Ahmad Yani C",
          snippet: "Kapasitas: Mobil:165 || Motor: 15"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Lodaya"),
      position: _lodaya,
      infoWindow:
          InfoWindow(title: "Parkiran Lodaya", snippet: "Kapasitas: Mobil:97 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran M. Toha A"),
      position: _mTohaA,
      infoWindow: InfoWindow(
          title: "Parkiran M. Toha A", snippet: "Kapasitas: Mobil:127 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran M. Toha B"),
      position: _mTohaB,
      infoWindow: InfoWindow(
          title: "Parkiran M. Toha", snippet: "Kapasitas: Mobil: 15 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Malabar A"),
      position: _malabarA,
      infoWindow: InfoWindow(
          title: "Parkiran Malbar A", snippet: "Kapasitas: Mobil:11 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Malabar B"),
      position: _malabarB,
      infoWindow: InfoWindow(
          title: "Parkiran Malabar B", snippet: "Kapasitas: Mobil:18 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Naripan"),
      position: _naripan,
      infoWindow: InfoWindow(
          title: "Parkiran Naripan",
          snippet: "Kapasitas: Mobil:20 || Motor: 196"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Panjuan"),
      position: _panjunan,
      infoWindow:
          InfoWindow(title: "Parkiran Panjuan", snippet: "Kapasitas: Mobil:8 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Pecinan Lama"),
      position: _pecinanLama,
      infoWindow: InfoWindow(
          title: "Parkiran Pecinan Lama",
          snippet: "Kapasitas: Mobil:36 || Motor: 40"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Pungkur A"),
      position: _pungkurA,
      infoWindow: InfoWindow(
          title: "Parkiran pungkur",
          snippet: "Kapasitas: Mobil:50 || Motor: 78"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Pungkut B"),
      position: _pungkurB,
      infoWindow: InfoWindow(
          title: "Parkiran Pungkur B", snippet: "Kapasitas: Mobil:180 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Pungkur C"),
      position: _pungkurC,
      infoWindow: InfoWindow(
          title: "Parkiran Pungkur C", snippet: "Kapasitas: Mobil:39 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Purnawarman"),
      position: _purnawarman,
      infoWindow: InfoWindow(
          title: "Parkiran Purnawarman", snippet: "Kapasitas: Mobil:35 "),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Parkiran Suniaraja"),
      position: _suniaraja,
      infoWindow: InfoWindow(
          title: "Parkiran Suniaraja",
          snippet: "Kapasitas: Mobil:30 || Motor: 10"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
    _markers.add(Marker(
      markerId: MarkerId("Masjid Agung Bandung"),
      position: _masjidAgungBdg,
      infoWindow: InfoWindow(title: "Parkiran Agung Bandung", snippet: ""),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                child: new AlertDialog(
                  title: new Text('Markers Information'),
                  content: new Text(
                      'Yellow Marker = Car Parking \nBlue Marker = Car and Motorcycle parking \nRed Marker = Motorcylce Parking'),
                ));
          },
          child: Icon(Icons.help),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: AppBar(
          title: new Text('Sipas Maps'),
          backgroundColor: Colors.indigo,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text('Sipasian'),
                accountEmail: Text('blablabla@mail.com'),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: new Text('S'),
                ),
                decoration: new BoxDecoration(color: Colors.lightBlue),
                otherAccountsPictures: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: new Text('Y'),
                  ),
                  new CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: new Text('W'),
                  ),
                ],
              ),
              new ListTile(
                title: new Text('Home page'),
                trailing: new Icon(Icons.home),
              ),
              new ListTile(
                title: new Text('Parking List '),
                trailing: new Icon(Icons.local_parking),
              ),
              new ListTile(
                title: new Text('Parking Maps'),
                trailing: new Icon(Icons.map),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                title: new Text('Bug Report'),
                trailing: new Icon(Icons.report),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BugReport();
                  }));
                },
              ),
              new ListTile(
                title: new Text('Logout'),
                trailing: new Icon(Icons.exit_to_app),
                onTap: () async {
                  await AuthServices.signOut();
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(-6.914744, 107.609810),
                zoom: 15.0,
              ),
              markers: _markers,
            ),
            Positioned(
              top: 20.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: TextField(
                  onTap: () async {
                    Prediction p = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: "AIzaSyDbATwyOPmBJuKyVeiaSBd2r5j25vtLsvM",
                        language: "id",
                        components: [new Component(Component.country, "id")]);
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        //searchandNavigate();
                        //},
                        iconSize: 30.0,
                      )),
                  onChanged: (val) {
                    setState(() {
                      searchAddr = val;
                    });
                  },
                ),
              ),
            )
          ],
        ));
  }

  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 15.0)));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
