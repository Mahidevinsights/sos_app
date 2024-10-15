import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sos_app/screens/sos_request_screen.dart';
import 'package:sos_app/widgets/appointment_card.dart';

class HomeContent extends StatelessWidget {
  final Color customPurple = const Color(0xFF5F57EA);
  final PageController _controller = PageController();

  HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Emergency SOS button
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SosRequestScreen()));
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Emergency help needed?',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Just hold the button to call',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -60,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SosRequestScreen()));
                        },
                        child: Container(
                          width: 135,
                          height: 110,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/sos_image.png'), // Replace with your image path
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Risk Assessment Section
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/risk_mngmt_pic.svg"),
                            const SizedBox(width: 16),
                            const Text('Risk\nAssessment',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.65,
                              strokeWidth: 5,
                              backgroundColor: Colors.grey.shade300,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(customPurple),
                            ),
                            const Text(
                              '65%',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          // Handle risk calculation
                        },
                        child: Container(
                          width: screenWidth * 0.3, // Responsive width
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: customPurple, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Calculate',
                                style: TextStyle(color: customPurple),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: customPurple,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sheduled appointment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 210,
              child: PageView(
                controller: _controller,
                children: [
                  AppointmentCard(
                    doctorName: 'Dr. Ashutosh Misra',
                    consultationType: 'General Consultation',
                    time: '10:30 AM',
                    tokenNumber: 5,
                    customPurple: customPurple,
                  ),
                  AppointmentCard(
                    doctorName: 'Dr. Rohit Sharma',
                    consultationType: 'Dermatology',
                    time: '11:00 AM',
                    tokenNumber: 12,
                    customPurple: customPurple,
                  ),
                  AppointmentCard(
                    doctorName: 'Dr. Priya Reddy',
                    consultationType: 'Pediatric Consultation',
                    time: '11:30 AM',
                    tokenNumber: 7,
                    customPurple: customPurple,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Dot Indicator
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3, // Number of cards
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey.shade400,
                  activeDotColor: customPurple,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 4,
                ),
              ),
            ),

            const SizedBox(height: 20),

            AppointmentCard(
              doctorName: 'Dr. Rohit Sharma',
              consultationType: 'Dermatology',
              time: '11:00 AM',
              tokenNumber: 12,
              customPurple: customPurple,
            ),
          ],
        ),
      ),
    );
  }
}
