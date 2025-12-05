import 'package:flutter/material.dart';
import 'package:first_app/services/auth_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final AuthService _authService = AuthService();


  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      icon: Icons.headphones,
      title: 'Welcome to Spotify',
      description: 'Discover new music, podcasts, and more.',
      color: Colors.green,
    ),
    OnboardingPage(
      icon: Icons.search,
      title: 'Find Your Sound',
      description: 'Search and explore millions of tracks.',
      color: Colors.blue,
    ),
    OnboardingPage(
      icon: Icons.play_circle_fill,
      title: 'Play Anywhere',
      description: 'Listen on your phone, tablet, or computer.',
      color: Colors.purple,
    ),
  ];  

  @override 
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _completeOnboarding() async {
    await _authService.completeOnboarding();
    if(mounted) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(onPressed: () {
                    _completeOnboarding();
                  }, child: Text('Skip'))),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  
                  return _buildPage(
                     _pages[index]
                  );
                },
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pages.length, (index) => _buildDot(index)),
            ),
            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next', style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }


Widget _buildPage(OnboardingPage page) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          page.icon,
          size: 120,
          color: page.color,
        ),
        SizedBox(height: 24),
        Text(
          page.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}

Widget _buildDot(int index) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4.0),
    width: _currentPage == index ? 24 : 8,
    height: 10,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: _currentPage == index ? Colors.blue : Colors.grey,
    ),
  );
}

}

class OnboardingPage{
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });   
}

