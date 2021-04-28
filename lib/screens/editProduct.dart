import 'package:declutter_project/models/products.dart';
import 'package:declutter_project/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _urlEditcontroller = TextEditingController();
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
    imageUrl: '',
  );

// initialized a default value for the editing field
  var _inItValues = {
    'productTitle': '',
    'category': '',
    'productId': '',
    'decReason': '',
    'productCondition': '',
    'productDesc': '',
    'productMarketPrice': '',
    'productPrice': '',
    'imageUrl': '',
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      //whem extraction the productid, there's possibility that it wont be there, hence the check below
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _currenConditionSeletected = _editedProduct.productCondition;
        _currentItemSeletected = _editedProduct.category;
      }
      //use the default values and overrite it here
      _inItValues = {
        'productTitle': _editedProduct.productTitle,
        'category': _editedProduct.category,
        'productId': _editedProduct.productId,
        'decReason': _editedProduct.decReason,
        'productCondition': _editedProduct.productCondition,
        'productDesc': _editedProduct.productDesc,
        'productMarketPrice': _editedProduct.productMarketPrice.toString(),
        'productPrice': _editedProduct.productPrice.toString(),
        'imageUrl': '',
      };
      _urlEditcontroller.text = _editedProduct.imageUrl;
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  //call the dispose method to dispose the focusNode aso as to avoid memory leaks
  @override
  void dispose() {
    _urlEditcontroller.dispose();
    _productfocusNode.dispose();
    _marketFocusNode.dispose();
    _sellingFocusNode.dispose();
    _descriptionfocusNode.dispose();
    _reasonfocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final _isValidate = _form.currentState
        .validate(); //this triggers the validator for all field.
    if (!_isValidate) {
      return;
    }
    _form.currentState.save();
    if (_editedProduct.productId != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.productId, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }

    Navigator.of(context).pop();
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
                      initialValue: _inItValues['productTitle'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a product name';
                        }
                        return null;
                      },
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
                          imageUrl: _editedProduct.imageUrl,
                          decReason: _editedProduct.decReason,
                        );
                      },
                    ),
                  ),
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
                                  _editedProduct = Product(
                                    productId: _editedProduct.productId,
                                    productTitle: _editedProduct.productTitle,
                                    category: _editedProduct.category,
                                    productMarketPrice:
                                        _editedProduct.productMarketPrice,
                                    productPrice: _editedProduct.productPrice,
                                    productCondition: conditionSelected,
                                    productDesc: _editedProduct.productDesc,
                                    imageUrl: _editedProduct.imageUrl,
                                    decReason: _editedProduct.decReason,
                                  );
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
                      initialValue: _inItValues['productMarketPrice'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'provide amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: _editedProduct.productTitle,
                          category: _editedProduct.category,
                          productMarketPrice: int.parse(value),
                          productPrice: _editedProduct.productPrice,
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          imageUrl: _editedProduct.imageUrl,
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
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      initialValue: _inItValues['productPrice'],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'provide amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: _editedProduct.productTitle,
                          category: _editedProduct.category,
                          productMarketPrice: _editedProduct.productMarketPrice,
                          productPrice: int.parse(value),
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          imageUrl: _editedProduct.imageUrl,
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
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
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
                                setState(() {
                                  _currentItemSeletected = valueSelected;
                                  _editedProduct = Product(
                                    productId: _editedProduct.productId,
                                    productTitle: _editedProduct.productTitle,
                                    category: valueSelected,
                                    productMarketPrice:
                                        _editedProduct.productMarketPrice,
                                    productPrice: _editedProduct.productPrice,
                                    productCondition:
                                        _editedProduct.productCondition,
                                    productDesc: _editedProduct.productDesc,
                                    imageUrl: _editedProduct.imageUrl,
                                    decReason: _editedProduct.decReason,
                                  );
                                });
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
                initialValue: _inItValues['productDesc'],
                onSaved: (value) {
                  _editedProduct = Product(
                    productId: _editedProduct.productId,
                    productTitle: _editedProduct.productTitle,
                    category: _editedProduct.category,
                    productMarketPrice: _editedProduct.productMarketPrice,
                    productPrice: _editedProduct.productPrice,
                    productCondition: _editedProduct.productCondition,
                    productDesc: value,
                    imageUrl: _editedProduct.imageUrl,
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
                initialValue: _inItValues['decReason'],
                onSaved: (value) {
                  _editedProduct = Product(
                    productId: _editedProduct.productId,
                    productTitle: _editedProduct.productTitle,
                    category: _editedProduct.category,
                    productMarketPrice: _editedProduct.productMarketPrice,
                    productPrice: _editedProduct.productPrice,
                    productCondition: _editedProduct.productCondition,
                    productDesc: _editedProduct.productDesc,
                    imageUrl: _editedProduct.imageUrl,
                    decReason: value,
                  );
                },
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: 'Purpose of decluttering',
                ),
                focusNode: _reasonfocusNode,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(top: 10, right: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )),
                    child: Container(
                      child: _urlEditcontroller.text.isEmpty
                          ? Text('please enter a url')
                          : FittedBox(
                              child: Image.network(_urlEditcontroller.text)),
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _urlEditcontroller,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(labelText: 'image url'),
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          productId: _editedProduct.productId,
                          productTitle: _editedProduct.productTitle,
                          category: _editedProduct.category,
                          productMarketPrice: _editedProduct.productMarketPrice,
                          productPrice: _editedProduct.productPrice,
                          productCondition: _editedProduct.productCondition,
                          productDesc: _editedProduct.productDesc,
                          decReason: _editedProduct.decReason,
                          imageUrl: value,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
