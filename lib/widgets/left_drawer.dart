import 'package:flutter/material.dart';
import 'package:football_shop_mobile/screens/menu.dart';
import 'package:football_shop_mobile/screens/product_form.dart';

class LeftDrawer extends StatelessWidget {
	const LeftDrawer({super.key});

	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: ListView(
				children: [
					const DrawerHeader(
						decoration: BoxDecoration(
							color: Colors.lightGreen,
						),
						child: Column(
							children: [
								Text("Football Shop",
									textAlign:TextAlign.center,
									style: TextStyle(
										fontSize: 30,
										fontWeight: FontWeight.bold,
										color: Colors.white,
									),
								),
								Padding(padding: EdgeInsets.all(10)),
								Text("No. 1 shop for football apparells",
									textAlign: TextAlign.center,
									style: TextStyle(
										fontSize: 15,
										fontWeight: FontWeight.normal,
										color: Colors.white,
									),
								),
							],
						),
					),
					ListTile(
						leading: const Icon(Icons.home_outlined),
						title: const Text('Halaman Utama'),
						// Bagian redirection ke MyHomePage
						onTap: () {
							Navigator.pushReplacement(
								context,
								MaterialPageRoute(
									builder: (context) => MyHomePage(),
								)
							);
						},
					),
					ListTile(
						leading: const Icon(Icons.post_add),
						title: const Text('Tambah Produk'),
						// Bagian redirection ke NewsFormPage
						onTap: () {
							Navigator.push(
								context,
								MaterialPageRoute(
									builder: (context) => ProductFormPage(),
								)
							);
						},
					),
				],
			),
		);
	}
}

