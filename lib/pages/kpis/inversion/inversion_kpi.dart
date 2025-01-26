import 'package:expensor/pages/kpis/inversion/inversion_accounts_provider.dart';
import 'package:expensor/pages/kpis/inversion/inversion_item.dart';
import 'package:expensor/widgets/inversion_resume_data.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class InversionKpi extends StatefulWidget {
  const InversionKpi({super.key});

  @override
  InversionKpiState createState() => InversionKpiState();
}

class InversionKpiState extends State<InversionKpi> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
                      color: Theme.of(context).primaryColor,
                      fontSize: 15),
                ),
              ],
            ),
            InversionResumeData(invested: 6800, pL: 6.59, balance: 7200)
          ],
        ),
        Space(),
        Card(
            child: SizedBox(
                height: height * 0.15,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    itemCount:
                        InversionAccountsProvider.getInversionAccounts().length,
                    itemBuilder: (context, index) {
                      return InversionItem(
                        inversionAccount: InversionAccountsProvider
                            .getInversionAccounts()[index],
                      );
                    }))),
      ],
    );
  }
}
