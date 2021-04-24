import 'package:declutter_project/models/products.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productfocusNode = FocusNode();
  final _marketFocusNode = FocusNode();
  final _sellingFocusNode = FocusNode();
  final _descriptionfocusNode = FocusNode();
  final _reasonfocusNode = FocusNode();
  final _categoryItems = [
    'Babies',
    'Electronics',
    'House-Hold',
    'Kitchen',
    'Fashion',
    'Others'
  ];
  var _currentItemSeletected;
  final _condition = ['New', 'Used'];
  var _currenConditionSeletected;

  //initialize the global key to have access to the current state
  final _form = GlobalKey<FormState>();

  //current value for the product
  var _editedProduct = Product(
    productId: null,
    category: '',
    decReason: '',
    productCondition: '',
    productDesc: '',
    productMarketPrice: 0,
    productPrice: 0,
    productTitle: '',
  );

  //call the dispose method to dispose the focusNode aso as to avoid memory leaks

  @override
  void dispose() {
    _productfocusNode.dispose();
    _marketFocusNode.dispose();
    _sellingFocusNode.dispose();
    _descriptionfocusNode.dispose();
    _reasonfocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    _form.currentState.save();
    print(_editedProduct.category);
    print(_editedProduct.productTitle);
    print(_editedProduct.productCondition);
    print(_editedProduct.productMarketPrice);
    print(_editedProduct.productPrice);
    print(_editedProduct.productDesc);
    print(_editedProduct.decReason);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _saveForm();
              })
        ],
        backgroundColor: Color(0XFFFF914D),
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20, top: 30),
        child: Form(
          key: _form,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      // focusNode: _productfocusNode,
                      // textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_productfocusNode);
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: value,
                          category: _editedProduct.category,
                          productMarketPrice: _editedProduct.productMarketPrice,
                          productPrice: _editedProduct.productPrice,
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          decReason: _editedProduct.decReason,
                        );
                      },
                    ),
                  ),
                  // SizedBox(
                  //   width: 10.0,
                  // ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // width: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton<String>(
                              hint: Text(
                                "Condition",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.right,
                              ),
                              items: _condition.map((String dropDownItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownItem,
                                  child: Text(dropDownItem),
                                );
                              }).toList(),
                              onChanged: (String conditionSelected) {
                                setState(() {
                                  _currenConditionSeletected =
                                      conditionSelected;
                                 
                                });
                              },
                              value: _currenConditionSeletected,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: _editedProduct.productTitle,
                          category: _editedProduct.category,
                          productMarketPrice: int.parse(value),
                          productPrice: _editedProduct.productPrice,
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          decReason: _editedProduct.decReason,
                        );
                      },
                      focusNode: _marketFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Market Price',
                        hintText: '2500',
                      ),
                    ),
                  ),
                  // SizedBox(width: 15.0),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: _editedProduct.productTitle,
                          category: _editedProduct.category,
                          productMarketPrice: _editedProduct.productMarketPrice,
                          productPrice: int.parse(value),
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          decReason: _editedProduct.decReason,
                        );
                      },
                      focusNode: _sellingFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '2500',
                        labelText: 'Selling Price',
                      ),
                    ),
                  ),
                  // SizedBox(width: 10.0),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        // width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: DropdownButton<String>(
                              hint: Text(
                                "Categories",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.left,
                              ),
                              items: _categoryItems
                                  .map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (String valueSelected) {
                                _onDropDownSelected(valueSelected);
                              },
                              value: _currentItemSeletected,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                onSaved: (value) {
                  _editedProduct = Product(
                    productId: _editedProduct.productId,
                    productTitle: _editedProduct.productTitle,
                    category: _editedProduct.category,
                    productMarketPrice: _editedProduct.productMarketPrice,
                    productPrice: _editedProduct.productPrice,
                    productCondition: _editedProduct.productCondition,
                    productDesc: value,
                    decReason: _editedProduct.decReason,
                  );
                },
                textInputAction: TextInputAction.next,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                focusNode: _descriptionfocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_reasonfocusNode);
                },
              ),
              TextFormField(
                onSaved: (value) {
                  _editedProduct = Product(
                    productId: _editedProduct.productId,
                    productTitle: _editedProduct.productTitle,
                    category: _editedProduct.category,
                    productMarketPrice: _editedProduct.productMarketPrice,
                    productPrice: _editedProduct.productPrice,
                    productCondition: _editedProduct.productCondition,
                    productDesc: _editedProduct.productDesc,
                    decReason: value,
                  );
                },
                maxLines: 1,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: 'Purpose of decluttering',
                ),
                focusNode: _reasonfocusNode,
                onFieldSubmitted: (_) {
                  _saveForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDropDownSelected(String valueSelected) {
    setState(() {
      _currentItemSeletected = valueSelected;
    });
  }
}
