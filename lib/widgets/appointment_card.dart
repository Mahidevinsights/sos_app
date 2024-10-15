import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String doctorName;
  final String consultationType;
  final String time;
  final int tokenNumber;
  final Color customPurple;

  AppointmentCard({
    required this.doctorName,
    required this.consultationType,
    required this.time,
    required this.tokenNumber,
    required this.customPurple,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                    'assets/images/app_card_img.png'), // Replace with actual image
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: customPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    consultationType,
                                    style: TextStyle(
                                        fontSize: 10, color: customPurple),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    time,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: customPurple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: customPurple,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                const Text(
                                  'Token No',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '$tokenNumber',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Handle payment
                  },
                  icon: const Icon(Icons.payment),
                  label: const Text('Pay ₹200'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red[50],
                    foregroundColor: Colors.red,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle joining call
                  },
                  icon: const Icon(Icons.video_call),
                  label: const Text('Join Call'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
