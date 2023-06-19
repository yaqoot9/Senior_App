import 'package:firstapp/home.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/HomePage': (BuildContext context) => Home(),
        },
        debugShowCheckedModeBanner: false,
        home: SafeArea(child: Scaffold(
          appBar: AppBar(
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Color(0XFFECEFF1),
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/HomePage',
                        );
                      });
                },
              ),
            ],
            backgroundColor:Colors.grey[600],
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blueGrey[50], size: 35),
              onPressed: () => Navigator.of(context).pop(),
            ),
            leadingWidth: 105,
            title: Text(
              "App Guide",style: TextStyle(fontSize: 27,fontFamily:'Courgette',color:Colors.white),
            ),
            centerTitle: true,
          ),
          body:AppGuide() ,
        ),)
    );
  }
}

class AppGuide extends StatefulWidget {
  @override
  _AppGuideState createState() => _AppGuideState();
}

class _AppGuideState extends State<AppGuide> {
  late PageController _pageController;
  int _currentIndex = 0;
  List<Widget> _pages = [
    GuidePage(
      title: 'Welcome to fresh your plant',
      description: 'This is a sample app guide.',
      imagePath: 'assets/app_Logo.png',
    ),
    GuidePage(
      title: 'Page 2',
      description: 'This is the second page of the guide.',
      imagePath: 'assets/app_Logo.png',
    ),
    GuidePage(
      title: 'Page 3',
      description: 'This is the third page of the guide.',
      imagePath: 'assets/app_Logo.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        items: _pages
            .whereType<GuidePage>()
            .map<BottomNavigationBarItem>((GuidePage page) {
          return BottomNavigationBarItem(
            icon: Icon(Icons.circle,),
            label: page.title,
          );
        }).toList(),
      ),

    );
  }
}

class GuidePage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const GuidePage({
   Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}