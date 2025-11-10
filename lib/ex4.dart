import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: const BoxDecoration(
                color: Color(0xFF87CEEB),
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  WeatherCard(
                    city: 'Phnom Penh',
                    currentTemp: 32.2,
                    minTemp: 27.0,
                    maxTemp: 35.0,
                    weatherImage: 'assets/ex4/cloudy.png',
                    gradientColors: [
                      Color(0xFFB87FD9),
                      Color(0xFF8B6AC7),
                    ],
                  ),
                  SizedBox(height: 20),
                  WeatherCard(
                    city: 'Paris',
                    currentTemp: 22.2,
                    minTemp: 10.0,
                    maxTemp: 40.0,
                    weatherImage: 'assets/ex4/sunny.png',
                    gradientColors: [
                      Color(0xFF6FD9B8),
                      Color(0xFF5BC9A8),
                    ],
                  ),
                  SizedBox(height: 20),
                  WeatherCard(
                    city: 'Rome',
                    currentTemp: 29.5,
                    minTemp: 18.0,
                    maxTemp: 33.0,
                    weatherImage: 'assets/ex4/sunnyCloudy.png',
                    gradientColors: [
                      Color(0xFFE97CA0),
                      Color(0xFFD96B8F),
                    ],
                  ),
                  SizedBox(height: 20),
                  WeatherCard(
                    city: 'Toulouse',
                    currentTemp: 25.4,
                    minTemp: 17.0,
                    maxTemp: 28.0,
                    weatherImage: 'assets/ex4/veryCloudy.png',
                    gradientColors: [
                      Color(0xFFE8AC7E),
                      Color(0xFFD99B6E),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherImage;
  final List<Color> gradientColors;

  const WeatherCard({
    super.key,
    required this.city,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherImage,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
             
              Positioned(
                right: -30,
                top: -20,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

            
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          weatherImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            city,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Min: ${minTemp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Max: ${maxTemp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${currentTemp.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
