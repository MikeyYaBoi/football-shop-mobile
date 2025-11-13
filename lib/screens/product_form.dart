import 'package:flutter/services.dart';
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

	final List<String> _categories = [
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
		return Scaffold(
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
									inputFormatters: [
										FilteringTextInputFormatter.digitsOnly
									],
									decoration: InputDecoration(
										hintText: "Harga Produk",
										labelText: "Harga Produk",
										border: OutlineInputBorder(
											borderRadius: 
											BorderRadius.circular(5.0),
										),
									),
									onChanged: (String? inputValue) {
										setState(() {
											_price = int.tryParse(inputValue ?? "") ?? 0;
											}
										);
									},
									validator: (String? inputValue) {
										if (inputValue == null ||
										inputValue.isEmpty) {
											return 
											"Harga Tidak Boleh Kosong!";
										}

										final parsedPrice = int.tryParse(inputValue);
										if (parsedPrice == null) {
											return "Harga Harus Berupa Angka!";
										}
										else if (parsedPrice <= 0) {
											return "Harga Tidak Valid!";
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
											_category = newCategory!;
											}
										);
									},
								),
							),

							// PRODUCT THUMBNAIL
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "URL Gambar Produk (opsional)",
										labelText: "URL Gambar Produk",
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
								),
							),

							// FEATURING PRODUCT
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: SwitchListTile(
									title: const
									Text("Tandai Sebagai Produk Direkomendasi"),
									value: _isFeatured,
									onChanged: (bool value) {
										setState(() {
											_isFeatured = value;
											}
										);
									},
								),
							),

							// SAVE BUTTON
							Align(
								alignment: Alignment.bottomCenter,
								child: Padding(
									padding: const EdgeInsets.all(8.0),
									child: ElevatedButton(
										style: ButtonStyle(
											backgroundColor: 
											MaterialStateProperty
											.all(Colors.tealAccent[700]),
										),
										onPressed: () {
											if (_formKey.currentState!.validate()) {
												showDialog(
													context: context,
													builder: (context) {
														return AlertDialog(
															title: const Text("Produk Berhasil Ditambahkan!"),
															content: SingleChildScrollView(
																child: Column(
																	crossAxisAlignment: 
																		CrossAxisAlignment.start,
																	children: <Widget> [
																	Text("Nama: $_name"),
																	Text("Harga: Rp$_price"),
																	Text("Deskripsi: \n$_description"),
																	Text("Kategori: $_category"),
																	Text("URL Gambar: $_thumbnail"),
																	Text("Direkomendasikan: ${_isFeatured ? "Ya": "Tidak"}"),
																	],
																),
															),
															actions: [
																TextButton(
																	child: const Text("Oke"),
																	onPressed: () {
																		Navigator.pop(context);
																		_formKey.currentState!.reset();
																	},
																),
															],
														);
													},
												);
											}
										},
										child: const Text (
											"Simpan",
											style: TextStyle(color: Colors.white),
										),
									),
								),
							),
						],
					),
				),
			),
		);
	}
}

