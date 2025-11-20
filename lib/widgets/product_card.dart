import 'package:football_shop_mobile/screens/product_form.dart';
import 'package:flutter/material.dart';
import 'package:football_shop_mobile/screens/product_entry_list.dart';
import 'package:football_shop_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductButton extends StatelessWidget {
	final String productFilter;

	const ProductButton(this.productFilter, {super.key});

	@override
	Widget build(BuildContext context) {
		final request = context.watch<CookieRequest>();
		return ElevatedButton(
			child: Text("${this.productFilter}",
					style: TextStyle(color: Colors.white)
					),
			onPressed: () async {
				ScaffoldMessenger.of(context)
				..hideCurrentSnackBar()
				..showSnackBar(
					SnackBar(
						content: 
						Text("Kamu telah menekan tombol ${this.productFilter}"),
					),
				);

				if (this.productFilter == "Create Product") {
					Navigator.push(
						context, MaterialPageRoute(
							builder: (context) => ProductFormPage(),
						)
					);
				}

				else if (this.productFilter == "All Products") {
					Navigator.push(context, 
						MaterialPageRoute(
							builder: (context) => const ProductEntryListPage(),
						)
					);
				}

				else if (this.productFilter == "Logout") {
					// TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
					// To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
					// If you using chrome,  use URL http://localhost:8000
					
					final response = await request.logout(
						"http://localhost:8000/auth/logout/");
					String message = response["message"];
					if (context.mounted) {
						if (response['status']) {
							String uname = response["username"];
							ScaffoldMessenger.of(context).showSnackBar(SnackBar(
								content: Text("$message See you again, $uname."),
							));
							Navigator.pushReplacement(
								context,
								MaterialPageRoute(builder: (context) => const LoginPage()),
							);
						} else {
							ScaffoldMessenger.of(context).showSnackBar(
								SnackBar(
									content: Text(message),
								),
							);
						}
					}
				}
			},
			style: ElevatedButton.styleFrom(backgroundColor:
				this.productFilter == "All Products" ? Colors.blue
				: this.productFilter == "My Products" ? Colors.green
				: Colors.red,
			),
		);
	}
}
