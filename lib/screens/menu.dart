import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';
import 'package:football_shop_mobile/screens/product_form.dart';
import 'package:football_shop_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
	MyHomePage({super.key});

	final List<ProductButton> productFilters = [
		ProductButton("All Products"),
		ProductButton("My Products"),
		ProductButton("Create Product"),
		ProductButton("Logout"),
	];
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text("Football Shop",
									style: TextStyle(
										color: Colors.white,
										fontWeight: FontWeight.bold,
									),
				),
				backgroundColor: Theme.of(context).colorScheme.secondary,
			),

			drawer: LeftDrawer(),

			body: Center(
			  child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: productFilters.toList(),
			  ),
			),
		);
	}
}
