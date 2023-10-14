import 'cookie_page.dart';
import 'package:flutter/material.dart';
import 'package:cookie_store/Pages/bottom_bar.dart';
import 'package:cookie_store/widgets/neumorphism_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Button(),
          )
          // IconButton(
          //   icon:
          //       const Icon(Icons.notifications_none, color: Color(0xFF545D68)),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Categories',
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15.0),
          TabBar(
            dividerHeight: 0,
            indicatorColor: Colors.transparent,
            labelColor: const Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 45.0),
            unselectedLabelColor: const Color(0xFFCDCDCD),
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text('Cookies',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Cookie cake',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Ice cream',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              )
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: const [
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ]))
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
