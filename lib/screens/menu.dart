import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
	MyHomePage({super.key});

	final List<ProductButton> productFilters = [
		ProductButton("All Products"),
		ProductButton("My Products"),
		ProductButton("Create Product"),
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

class ProductButton extends StatelessWidget {
	final String productFilter;

	const ProductButton(this.productFilter, {super.key});

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			child: Text("${this.productFilter}",
					style: TextStyle(color: Colors.white)
					),
			onPressed: () {
				ScaffoldMessenger.of(context)
				..hideCurrentSnackBar()
				..showSnackBar(
					SnackBar(
						content: 
						Text("Kamu telah menekan tombol ${this.productFilter}"),
					),
				);
			},
			style: ElevatedButton.styleFrom(backgroundColor:
				this.productFilter == "All Products" ? Colors.blue
				: this.productFilter == "My Products" ? Colors.green
				: Colors.red,
			),
		);
	}
}
