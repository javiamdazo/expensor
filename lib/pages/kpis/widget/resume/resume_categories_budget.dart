import 'package:expensor/model/category.dart';
import 'package:expensor/pages/category/category_provider.dart';
import 'package:expensor/widgets/formatted_number.dart';
import 'package:expensor/widgets/space.dart';
import 'package:flutter/material.dart';

class ResumeCategoriesBudget extends StatelessWidget {
  const ResumeCategoriesBudget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Space(),
        SizedBox(
          height: height * 0.07,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CategoryProvider.categories.length,
            itemBuilder: (context, index) {
              final Category category = CategoryProvider.getCategories()[index];
              return ResumeCategoriesItem(category: category);
            },
          ),
        )
      ],
    );
  }
}

class ResumeCategoriesItem extends StatelessWidget {
  const ResumeCategoriesItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: category.color,
            child: Icon(
              category.icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          FormattedNumber(
              number: 15,
              style: Theme.of(context).textTheme.labelMedium,
              numberType: NumberType.currency)
        ],
      ),
    );
  }
}
