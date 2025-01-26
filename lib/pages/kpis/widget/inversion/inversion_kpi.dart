import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/profitability.dart';
import 'package:flutter/material.dart';

class InversionKpi extends StatefulWidget {
  const InversionKpi({super.key});

  @override
  InversionKpiState createState() => InversionKpiState();
}

class InversionKpiState extends State<InversionKpi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saving & Inversion",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "View details",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color.fromRGBO(128, 168, 255, 1),
                      fontSize: 15),
                ),
              ],
            ),
            Column(
              children: [
                FormattedNumber(
                    number: 6898.89,
                    style: Theme.of(context).textTheme.titleMedium,
                    numberType: NumberType.currency),
                Row(
                  children: [
                    FormattedNumber(
                      number: 6400.00,
                      style: Theme.of(context).textTheme.titleSmall,
                      numberType: NumberType.currency,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Profitability(
                        number: 9.56,
                        style: Theme.of(context).textTheme.titleSmall)
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Card(
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                children: const [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.abc,
                        color: Colors.white,
                      ),
                    ),
                    title: Text("Trade republic"),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
