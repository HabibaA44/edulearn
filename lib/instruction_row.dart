import 'package:flutter/material.dart';

class InstructionRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData logo;
  const InstructionRow({super.key,
  this.subtitle="",
  this.title="",
  required this.logo
  });

  @override
  Widget build(BuildContext context) {
    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 12,
                            right: 12,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Icon(logo,color: Colors.blue,size: 20,),

                            width: 40,
                            height: 40,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    );
  }
}