import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String pilihanMobil = "Brio";
  String pilihanMobilOut = "";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> jenisMobil = [];

    var itm1 = const DropdownMenuItem<String>(
      value: "Brio",
      child: Text("Brio"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "Civic",
      child: Text("Civic"),
    );

    jenisMobil.add(itm1);
    jenisMobil.add(itm2);

    return MaterialApp(
        title: 'Hello App',
        home: Scaffold(
          appBar: AppBar(
              leading: FlutterLogo(),
              backgroundColor: Colors.blueGrey,
              title: Text('Quiz Flutter'),
              actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
          body: GridView(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        'Mobil Saya',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.network(
                        // "https://cdn0-production-images-kly.akamaized.net/iV_zTWyyXSg85Gq47FezJQK-sfA=/0x370:3999x2624/640x360/filters:quality(75):strip_icc():format(jpeg):watermark(kly-media-production/assets/images/watermarks/otosia/watermark-color-landscape.png,480,20,0)/kly-media-production/medias/4294957/original/071762000_1674035849-IMG_20220315_100111.jpg"
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Detail'))
                    ],
                  )),
              Container(
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      isExpanded: true,
                      value: pilihanMobil,
                      items: jenisMobil,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            pilihanMobil = newValue;
                          }
                        });
                      },
                    ),
                    Text(pilihanMobil),
                    Text("Nomor Rangka: XXXXXX", textAlign: TextAlign.start),
                    Text("Nomor Mesin: XXXXXX", textAlign: TextAlign.start),
                  ],
                ),
              ),
              Container(
                  child: Column(children: [
                Container(
                  child: Text(
                    "Katalog Produk",
                    textAlign: TextAlign.center,
                  ),
                ),
                //   GridView(
                //       padding: EdgeInsets.all(10),
                //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 3,
                //           crossAxisSpacing: 20,
                //           mainAxisSpacing: 10,
                //           childAspectRatio: 1 / 1),
                //       children: [
                //         Image.network(
                //             "https://imgcdn.oto.com/medium/gallery/exterior/14/1995/honda-brio-12704.jpg"),
                //         Image.network(
                //             "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/2018_Honda_Civic_1.5_E_hatchback_%28FK4%3B_01-23-2019%29%2C_South_Tangerang.jpg/280px-2018_Honda_Civic_1.5_E_hatchback_%28FK4%3B_01-23-2019%29%2C_South_Tangerang.jpg"),
                //         Image.network(
                //             "https://static.carmudi.co.id/IZ48VfA65MNHUCkkLJKNC0Ztm5s=/900x405/http://trenotomotif.com/ncs/images/Thumbnail/Thumbnail2022/HR-V.jpg"),
                //       ]),
              ])),
            ],
          ), //
        ));
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Nama Kelompok 4'),
            content: const Text(
                'Hafizh Lutfi Hidayat (hafizh.lutfihidayat@upi.edu) ; Surya Alfin Maoludin (surya.alvin33@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
