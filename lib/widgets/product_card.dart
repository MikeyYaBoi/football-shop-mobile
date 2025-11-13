import 'package:football_shop_mobile/screens/product_form.dart';

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

				if (this.productFilter == "Create Product") {
					Navigator.push(
						context, MaterialPageRoute(
							builder: (context) => ProductFormPage(),
						)
					);
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
