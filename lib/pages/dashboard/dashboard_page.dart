import 'package:expensor/pages/dashboard/dashboard_background.dart';
import 'package:expensor/pages/kpis/widget/inversion/inversion_kpi.dart';
import 'package:expensor/pages/kpis/widget/resume/resume_kpi.dart';
import 'package:expensor/pages/kpis/widget/transactions/transactions_list_kpi.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late List<Animation<Offset>> _itemAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _itemAnimations = List.generate(
      3, // Number of items to animate
      (index) => Tween<Offset>(
        begin: const Offset(0, 1), // Start below the screen
        end: Offset.zero, // End at the original position
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(
            index * 0.2, // Stagger the animations
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DashboardBackground(),
          ListView(
            children: [
              const ResumeKpi(),
              Space(),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 26, 41),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const TransactionsListKpi(),
                      Space(
                        space: SpaceEnum.triple,
                      ),
                      const InversionKpi(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
