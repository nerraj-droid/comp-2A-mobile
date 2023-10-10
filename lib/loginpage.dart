import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_creator/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShow = true;
  TextEditingController _emailConrtoller = TextEditingController();
  TextEditingController _passwordConrtoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailConrtoller.dispose();
    _passwordConrtoller.dispose();
  }

  login(String email, String password) {
    if (email == "innovativeafz@gmail.com" && password == "12345") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
      //navigate to homepage
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Incorrect credentials!')));
      //snackbar 'email or password is incorrect'
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Sign In Page",
          style: GoogleFonts.aclonica(),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        children: [
          Text("Sign In"),
          TextField(
            controller: _emailConrtoller,
            decoration: InputDecoration(
              hintText: "Email",
            ),
          ),
          TextField(
            controller: _passwordConrtoller,
            obscureText: !_isShow,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isShow = !_isShow;
                      });
                    },
                    icon: _isShow
                        ? Icon(Icons.abc)
                        : Icon(Icons.remove_red_eye_rounded)),
                hintText: "Password",
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(width: 2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    print("Email: " +
                        _emailConrtoller.text +
                        " " +
                        "Password: " +
                        _passwordConrtoller.text);
                    login(_emailConrtoller.text, _passwordConrtoller.text);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: Text("Sign In")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {},
                  child: Text("Register"))
            ],
          )
        ],
      ),
    );
  }
}
