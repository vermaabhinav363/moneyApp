import 'package:flutter/material.dart';
import 'package:money/Data/data.dart';
import 'package:money/Methods/auth.dart';
import 'package:money/Methods/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(USERNAME!),
        backgroundColor: const Color(0xffb000080),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // The "-" icon
            onPressed: () {
              Authentication.signOutWithGoogle(context: context);
            }, // The `_decrementCounter` function
          ),
        ],
      ),
      body: PageView(

        controller: pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: [
          Container(

          ),
          Container(

          ),
          Container(

          ),
          Container(

          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history_sharp), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffb000080),
        unselectedItemColor: Colors.grey,
        onTap: onTap,
      ),
    );
    }
  }


class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffb000080),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Text(
                                "A".toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                              child: Row(
                            children: [
                              Text(
                                USERNAME!,
                              ),
                              const Spacer(),
                            ],
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        child: SingleChildScrollView(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          Text(
                            EMAIL!,
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xffb000080)),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text(
                'Create a new group',
                style: TextStyle(color: Color(0xffb000080)),
              ),
              onTap: () => {
                DatabaseMethods.CreateGroup('testing')
              },
            ),
            const Divider(
                height: 20,
                thickness: 4,
                indent: 8,
                endIndent: 8,
                color: Color(0xffb000080)),
            ListTile(
              title: const Center(
                  child: Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 10, color: Color(0xffb000080)),
              )),
              onTap: () => {},
            ),
            ListTile(
              title: const Center(
                  child: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 10, color: Color(0xffb000080)),
              )),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );

  }



}

