import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
	MyHomePage({super.key});

	final List<ProductButton> productFilters = [
		ProductButton("All Products"),
		ProductButton("My Products"),
		ProductButton("Create Products"),
	];
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(

		);
}

class ProductButton extends StatelessWidget {
	final String productFilter;

	ProductSnackBar(this.productFilter, {super.key});

	@override
	Widget build(BuildContext context) {
		return ElevatedButton(
			child: const Text("${this.productFilter}"),
			onPressed: () {
				ScaffoldMessenger.of(context).showSnackBar(
					SnackBar(
						content: const
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
