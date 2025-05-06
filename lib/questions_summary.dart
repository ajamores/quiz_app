import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 300,
      //Scroll widget
      child: SingleChildScrollView(
        child: Column(
          //children requires a List of Widges, use .map
          children:
              summaryData.map((data) {

                final isCorrect = data['user_answer'] == data['correct_answer'];
                
                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCorrect ? Colors.lightBlue : Colors.purpleAccent,
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    //Expanded works for lines that are 2 long for single line and
                    //breaks them into multiple lines. IN THIS PARTICULAR CASE:
                    //With expanded, it's restricted to that width of that row
                    //and this column here will instead only expand such
                    // that it fills up the space provided by row.
                    // That's why in the end, expanded here,
                    // restricts the width of the column, instead of increasing it.
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // start on far left
                          children: [
                            Text(
                              data['question'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 231, 232, 233),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(145, 203, 67, 237),
                              ),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(174, 146, 246, 255),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(), // generate list of rows, make it compatible ,
        ),
      ),
    );
  }
}
