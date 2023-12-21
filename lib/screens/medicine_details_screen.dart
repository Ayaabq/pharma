import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedDetails extends StatefulWidget {
  const MedDetails({super.key});

  @override
  State<MedDetails> createState() => _MedDetailsState();
}

class _MedDetailsState extends State<MedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 67, 201, 201),
        title: const Text('Details'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        //padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  color: const Color.fromARGB(255, 67, 201, 201),
                  'images/pill.svg',
                  width: 90,
                  height: 90,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'paracetamol',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '10\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            //Scientific name
            const Text(
              'Scientific Name',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Ancolen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //Company Name
            const SizedBox(height: 15),
            Text(
              'Company',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Med Comp',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            //spacer to the end of the screen
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('Add to the Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
