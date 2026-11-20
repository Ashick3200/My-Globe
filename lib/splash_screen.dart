import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller; // logo pulse (repeat)
  late final AnimationController _flightController; // flight slide
  late final Animation<double> _flightAnimation;
  bool _flying = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _flightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _flightAnimation = CurvedAnimation(
      parent: _flightController,
      curve: Curves.easeIn,
    );
  }

  Future<void> _onExplore() async {
    if (_flying) return;
    setState(() => _flying = true);

    await _flightController.forward(); // flight left -> right

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _flightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final planeWidth = size.width < 600 ? 200.0 : 300.0;
    final logoSize = size.width < 600 ? 280.0 : 380.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D47A1), Color(0xFF0A1F5C)],
          ),
        ),
        child: Stack(
          children: [
            // Center content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Big logo
                  ScaleTransition(
                    scale: Tween<double>(begin: 0.97, end: 1.03)
                        .animate(_controller),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: logoSize,
                      height: logoSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _onExplore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF29B6F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Explore',
                      style: TextStyle(fontSize: 18, letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),

            // Flying plane: left (off-screen) -> right (off-screen)
            AnimatedBuilder(
              animation: _flightAnimation,
              builder: (context, child) {
                final dx = -planeWidth +
                    (size.width + planeWidth) * _flightAnimation.value;
                return Positioned(
                  left: dx,
                  top: size.height * 0.35,
                  child: child!,
                );
              },
              child: Image.asset(
                'assets/images/flight.png',
                width: planeWidth,
              ),
            ),

            // Footer
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(
                'DISCOVER • EXPLORE • EXPERIENCE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 11,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}