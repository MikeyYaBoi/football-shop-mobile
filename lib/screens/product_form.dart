import 'package:flutter/material.dart';
import 'package:football_shop_mobile/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
	const ProductFormPage({super.key});

	@override
	State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
	final _formKey = GlobalKey<FormState>();
	String _name = "";
	int _price = 0;
	String _description = "";
	String _category = "shoes";
	String _thumbnail = "";
	bool _isFeatured = false;

	final List<String> categories = [
		"shoes",
		"ball",
		"shin guards",
		"jersey",
		"shorts",
		"socks",
		"goalkeeper shoes",
	];

	@override
	Widget build(BuildContext context) {
		return Placeholder(
			Scaffold(
				appBar: AppBar(
					title: const Center(
						child: Text("Add New Product"),
					),
					backgroundColor: Colors.tealAccent[700],
					foregroundColor: Colors.white,
				),

				drawer: LeftDrawer(),

				body: Form(
					key: _formKey,
					child: SingleChildScrollView(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								// PRODUCT NAME
								Padding(
									padding: const EdgeInsets.all(8.0),
									child: TextFormField(
										decoration: InputDecoration(
											hintText: "Nama Produk",
											labelText: "Nama Produk",
											border: OutlineInputBorder(
												borderRadius: 
												BorderRadius.circular(5.0),
											),
										),
										onChanged: (String? inputValue) {
											setState(() {
												_name = inputValue!;
												}
											);
										},
										validator: (String? inputValue) {
											if (inputValue == null ||
											inputValue.isEmpty) {
												return "Nama Produk Harus Ada";
											}
											return null;
										},
									),
								),

								//PRODUCT PRICE
								Padding(
									padding: const EdgeInsets.all(8.0),
									child: TextFormField(
										decoration: InputDecoration(
											hintText: "Harga Produk",
											labelText: "Harga Produk",
											border: OutlineInputBorder(
												borderRadius: 
												BorderRadius.circular(5.0),
											),
										),
										onChanged: (int? inputValue) {
											setState(() {
												_price = inputValue!;
												}
											);
										},
										validator: (int? inputValue) {
											if (inputValue == null ||
											inputValue <= 0) {
												return 
												"Harga Produk Tidak Valid!";
											}
											return null;
										},
									),
								),

								// PRODUCT DESCRIPTION
								Padding(
									padding: const EdgeInsets.all(8.0),
									child: TextFormField(
										maxLines: 5,
										decoration: InputDecoration(
											hintText: "Deskripsi Produk",
											labelText: "Deskripsi Produk",
											border: OutlineInputBorder(
												borderRadius: 
												BorderRadius.circular(5.0),
											),
										),
										onChanged: (String? inputValue) {
											setState(() {
												_description = inputValue!;
												}
											);
										},
										validator: (String? inputValue) {
											if (inputValue == null ||
											inputValue.isEmpty) {
												return
												"Deskripsi Produk Harus Ada";
											}
											return null;
										},
									),
								),

								//PRODUCT CATEGORY
								Padding(
									padding: const EdgeInsets.all(8.0),
									child: DropdownButtonFormField<String>(
										decoration: InputDecoration(
											labelText: "Kategori",
											border: OutlineInputBorder(
												borderRadius:
												BorderRadius.circular(5.0),
											),
										),
										value: _category,
										items: _categories
											.map((cat) => DropdownMenuItem(
													value: cat,
													child: Text(
														cat[0].toUpperCase()+
														cat.substring(1)
													),
												)
											).toList(),
										onChanged: (String? newCategory) {
											setState(() {
												_category = newCategory;
												}
											);
										},
									),
								),

							],
						),
					),
				),
			);
		);
	}
}

