import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money/Methods/auth.dart';

class introduct extends StatefulWidget {
  const introduct({Key? key}) : super(key: key);

  @override
  _introductState createState() => _introductState();
}

bool loading = false;

class _introductState extends State<introduct> {
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: const Color(0xffb000080),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height *
                            0.65, //10% of screen height
                        width: MediaQuery.of(context)
                            .size
                            .width, //80% of screen width
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              const Text(
                                'Split  It',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Pacifico-Regular',
                                    color: Color(0xffb000080)),
                              ),
                              Container(
                                child: Lottie.network(
                                    'https://assets5.lottiefiles.com/packages/lf20_jcikwtux.json'
                                    //'https://assets2.lottiefiles.com/packages/lf20_zu3z8n5o.json'
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                          child: ButtonTheme(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              minWidth: 300.0,
                              height: 50.0,
                              child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Authentication.signInWithGoogle(
                                        context: context);
                                  },
                                  label: const Text("Sign In with  Google"),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  icon: Image.asset(
                                    'assets/google-logo-9824.png',
                                    height: 20,
                                    width: 20,
                                  )))),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
