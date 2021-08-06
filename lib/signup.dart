import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rappappnew/policy.dart';
import 'package:rappappnew/variables.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  registeruser(){

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text).then((signeduser){
      usercollection.doc(signeduser.user.uid).set({
        'username': usercontroller.text,
        'password': passwordcontroller.text,
        'email': emailcontroller.text,
        'uid': signeduser.user.uid,
        'profilepic': 'https://img.favpng.com/25/13/19/samsung-galaxy-a8-a8-user-login-telephone-avatar-png-favpng-dqKEPfX7hPbc6SMVUCteANKwj.jpg'
      });
    });
        Navigator.pop(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter Your Details",
                style: myStyle(25, Colors.black, FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(
              "Register",
              style: myStyle(25, Colors.black, FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: emailcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      prefixIcon: Icon(Icons.email),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                          )
                          )
                          ),
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: usercontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      prefixIcon: Icon(Icons.person),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: passwordcontroller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: Icon(Icons.lock),
                      labelStyle: myStyle(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),

            

            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: ()=>registeruser(),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "SignUp",
                    style: myStyle(20, Colors.white, FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I agree to",
                  style: myStyle(20),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsOfPolicy())),
                  child: Text(
                    "Terms of Policy",
                    style: myStyle(20, Colors.purple),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}