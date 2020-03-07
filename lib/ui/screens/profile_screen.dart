import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restofood_api/core/utils/toast_utils.dart';
import 'package:restofood_api/ui/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: SingleChildScrollView(child: ProfileBody()),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String username, email, pathPhoto, kota;

  @override
  void initState(){
    super.initState();
    getPref();
  }

  logout(){
    ToastUtils.show("Mencoba Logout");
    savePref();
    Future.delayed(const Duration(milliseconds: 2000), (){
      ToastUtils.show("Berhasil Logout");
      Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> routes) => false);
    });
  }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString("username");
      email = pref.getString("email");
      pathPhoto = pref.getString("foto");
      kota = pref.getString("kota");
    });

    if (username != null) {
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, "/login", (Route<dynamic> routes) => false);
    }
  }

  savePref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("username");
      pref.remove("email");
      pref.remove("profile");
      pref.remove("kota");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Bagian headers
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            color: Colors.orange,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(60),
                        image: DecorationImage(
                            image: NetworkImage(
                                pathPhoto.toString()))),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${username.toString()}",
                    // "Adam Prabowo",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      "Seorang pria dengan dedikasi tinggi dan haus akan ilmu baru",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )),

        //Bagian field login
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Biodata",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Asal Kota: ${kota.toString()}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //Button Logout
        SizedBox(height: 15),
        Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: PrimaryButton(
            color: Colors.orange,
            text: "LOGOUT",
            onClick: (){
              logout();
            }
          )
        )
      ],
    );
  }
}
