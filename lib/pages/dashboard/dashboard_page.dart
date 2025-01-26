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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () => {},
          icon: Icon(Icons.settings, color: Theme.of(context).iconTheme.color),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => {}, 
          icon: Icon(Icons.remove_red_eye, color: Theme.of(context).iconTheme.color))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Account:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
            const SizedBox(width: 5),
            Text("Globalcaja", style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const DashboardBackground(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                Widget child;
                switch (index) {
                  case 0:
                    child = const ResumeKpi();
                    break;
                  case 1:
                    child = const InversionKpi();
                    break;
                  case 2:
                    child = const TransactionsListKpi();
                    break;
                  default:
                    child = const SizedBox.shrink();
                }

                return SlideTransition(
                  position: _itemAnimations[index],
                  child: Column(
                    children: [
                      child,
                      if (index < 2)
                        Space(
                          space: SpaceEnum.double,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
