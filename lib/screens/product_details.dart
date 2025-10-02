import 'package:flutter/material.dart';
import 'package:widget_presentation/widgets/review_card.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  final List<String> tabs = ['Description', 'Specifications', 'Reviews'];
  final List<Map<String, String>> specs = [
    {"title": 'Battery Life', "value": '30 hours'},
    {"title": 'Charging Time', "value": '2 hours'},
    {"title": 'Weight', "value": '250g'},
    {"title": 'Connectivity', "value": 'Bluetooth 5.0'},
    {"title": 'Noise Cancellation', "value": 'Active'},
  ];
  final List<Map<String, String>> reviews = [
    {
      "author": 'Alex Johnson',
      "rating": '5',
      "comment": 'Amazing sound quality! Very comfortable for long sessions.',
    },
    {
      "author": 'Sarah Miller',
      "rating": '4',
      "comment": 'Great battery life, but could be more comfortable.',
    },
    {
      "author": 'Mike Chen',
      "rating": '5',
      "comment": 'Best headphones I have ever owned!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          bottom: TabBar(tabs: tabs.map((tab) => Tab(text: tab)).toList()),
        ),
        body: TabBarView(
          children: [
            // Description Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wireless Bluetooth Headphones',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Experience premium sound quality with our latest wireless headphones. '
                    'Featuring noise cancellation, 30-hour battery life, and comfortable '
                    'over-ear design perfect for all-day use.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    'https://t4.ftcdn.net/jpg/03/28/37/93/240_F_328379347_xEKgEB2wkjAJmcqSTmrg4uKxfWrlL7D9.jpg',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Tab for Specifications
            ListView(
              padding: EdgeInsets.all(16),
              children: specs
                  .map(
                    (elem) => ListTile(
                      title: Text(elem['title']!),
                      trailing: Text(elem['value']!),
                    ),
                  )
                  .toList(),
            ),

            // Tab for Reviews
            ListView(
              padding: const EdgeInsets.all(16),
              children: reviews
                  .map(
                    (review) => ReviewCard(
                      author: review['author']!,
                      rating: int.parse(review['rating']!),
                      comment: review['comment']!,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
