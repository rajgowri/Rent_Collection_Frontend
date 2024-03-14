import 'package:flutter/material.dart';
import 'package:shop_rent/Modules/HomePage.dart';
import 'package:shop_rent/Modules/Invoices/PaidInvoices.dart';
import 'package:shop_rent/Modules/Invoices/PendingInvoices.dart';
import 'package:shop_rent/Modules/Overview.dart';
import 'package:shop_rent/Modules/Payments/Categories.dart';
import 'package:shop_rent/Modules/Payments/Payments.dart';
import 'package:shop_rent/Modules/Profile/Profile.dart';
import 'package:shop_rent/Modules/Property/AddShops.dart';
import 'package:shop_rent/Modules/Property/DeleteShops.dart';
import 'package:shop_rent/Modules/Property/HideShops.dart';
import 'package:shop_rent/Modules/Reports/AssetReport.dart';
import 'package:shop_rent/Modules/Reports/DepositReport.dart';
import 'package:shop_rent/Modules/Reports/PaymentReport.dart';
import 'package:shop_rent/Modules/Reports/RentReport.dart';
import 'package:shop_rent/Modules/Reports/ShopReport.dart';
import 'package:shop_rent/Modules/ShopKeepers/ActiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/Add.dart';
import 'package:shop_rent/Modules/ShopKeepers/InactiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/Inbox.dart';
import 'package:shop_rent/Modules/Shops/Assets.dart';
import 'package:shop_rent/Modules/Shops/Rooms.dart';

class ChangePswd extends StatefulWidget {
  const ChangePswd({Key? key}) : super(key: key);

  @override
  State<ChangePswd> createState() => _ChangePswdState();
}

class _ChangePswdState extends State<ChangePswd> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showOldPasswordError = false;
  bool _showNewPasswordError = false;
  bool _showConfirmPasswordError = false;
  bool _passwordsMatch = true;

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
        .hasMatch(value)) { // Check for special characters
      return 'Password must contain at least one special character.';
    } else if (!RegExp(r'[0-9]')
        .hasMatch(value)) { // Check for numbers
      return 'Password must contain at least one number.';
    } else if (value == _oldPasswordController.text && _oldPasswordController.text.isNotEmpty) {
      return 'New password cannot be the same as old password.';
    }
    return null;
  }

  void _resetFields() {
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();

    _showOldPasswordError = false;
    _showNewPasswordError = false;
    _showConfirmPasswordError = false;
    _passwordsMatch = true;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> data2 = [
      {"leading":Icon(Icons.bar_chart,color: Colors.black,),"title": "Report", "options": ["Rent", "Deposit","Payment", "Asset Rent", "Shop Rent"]},
      {"leading":Icon(Icons.person,color: Colors.black,),"title": "Vender", "options": ["Add", "Active Vender", "Inactive Vender", "Inbox"]},
      {"leading":Icon(Icons.area_chart,color: Colors.black,),"title": "Property", "options": ["Add Shop", "Delete Shop", "Hide Shop"]},
      {"leading":Icon(Icons.home_work_outlined,color: Colors.black,),"title": "Shops", "options": ["Assets", "Shops"]},
      {"leading":Icon(Icons.file_copy_rounded,color: Colors.black,),"title": "Invoice", "options": ["Pending Invoices", "Paid Invoices"]},
      {"leading":Icon(Icons.wallet,color: Colors.black,),"title": "Payment", "options": ["Payment", "Categories"]},
    ];

       return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade900,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {
              if (_isDrawerOpen) {
                _scaffoldKey.currentState!.openEndDrawer();
                _isDrawerOpen = false;
              } else {
                _scaffoldKey.currentState!.openDrawer();
                _isDrawerOpen = true;
              }
            },
          ),
          actions: [
            SizedBox(
                width: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal.shade900
                  ),
                  onPressed: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.teal.shade100,
                      context: context, builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                              ),
                              leading: Icon(Icons.account_circle, size: 40),
                              title: Text("Robert", style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 20),
                            ListTile(
                              leading: (Icon(Icons.settings,color: Colors.teal.shade200,)),
                              title: Text("Change Password",style: TextStyle(color: Colors.white),),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChangePswd())
                                );
                              },
                            ), ListTile(
                              leading: (Icon(Icons.person,color: Colors.teal.shade200,)),
                              title: Text("My Profile",style: TextStyle(color: Colors.white),),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile())
                                );
                              },
                            ),
                            ListTile(
                              leading: (Icon(Icons.logout,color: Colors.teal.shade200,)),
                              title: Text("Logout",style: TextStyle(color: Colors.white),),
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage())
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    );
                  }, child: Icon(Icons.account_circle, color: Colors.white, size: 30),)),
            SizedBox(width: 10,)
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 70),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal.shade900,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Overview()),
                    );
                  },
                  child: Text("Dashboard",style: TextStyle(fontSize: 20),),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: data2.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: data2[index]["leading"],
                    title: Text(data2[index]["title"]),
                    trailing: DropdownButton<String>(
                      elevation: 0,
                      underline: Container(),
                      iconEnabledColor: Colors.black,
                      items: (data2[index]["options"] as List<String>).map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == "Rent") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RentReportPage()),
                          );
                        }
                        else if (newValue == "Deposit") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DepositReportPage()),
                          );
                        }
                        else if (newValue == "Payment") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentReportPage()),
                          );
                        }
                        else if (newValue == "Shop Rent") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopReportPage()),
                          );
                        }
                        else if (newValue == "Asset Rent") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AssetReportPage()),
                          );
                        }
                        else if (newValue == "Add") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddPage()),
                          );
                        }
                        else if (newValue == "Active Vender") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ActiveShopKeepersPage()),
                          );
                        }
                        else if (newValue == "Inactive Vender") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InactiveShopKeepersPage()),
                          );
                        }
                        else if (newValue == "Inbox") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InboxPage()),
                          );
                        }
                        else if (newValue == "Add Shop") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddShopsPage()),
                          );
                        }
                        else if (newValue == "Delete Shop") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DeleteShopsPage()),
                          );
                        }
                        else if (newValue == "Hide Shop") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HideShopsPage()),
                          );
                        }
                        else if (newValue == "Pending Invoices") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PendingInvoicesPage()),
                          );
                        }
                        else if (newValue == "Paid Invoices") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaidInvoicesPage()),
                          );
                        }
                        else if (newValue == "Payment") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentsPage()),
                          );
                        }
                        else if (newValue == "Categories") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoriesPage()),
                          );
                        }
                        else if (newValue == "Assets") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AssetsPage()),
                          );
                        }
                        else if (newValue == "Shops") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RoomsPage()),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text("Change Password", style: TextStyle(fontSize: 25),),
                SizedBox(height: 20),
                TextField(
                  controller: _oldPasswordController,
                  decoration: InputDecoration(
                      labelText: "Old Password",
                      border: OutlineInputBorder(),
                    errorText: _showOldPasswordError ? 'Old password is required.' : null,
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(),
                    errorText: _showNewPasswordError ? _validatePassword(_newPasswordController.text) : null,
                  ),
                ),
                SizedBox(height: 20,),
                Text("* Your Password can't be too similar to your personal information.\n* Your Password must contain at least 8 characters.\n* Your password can't be a commonly used password.\n*Your password can't be entirely numeric",style: TextStyle(fontSize: 17),),
                SizedBox(height: 20,),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                    errorText: _showConfirmPasswordError
                        ? (_passwordsMatch ? null : 'Passwords do not match.')
                        : null,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal.shade900,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)
                                )
                            ),
                            onPressed: (){
                              setState(() {
                                _showOldPasswordError = _oldPasswordController.text.isEmpty;
                                _showNewPasswordError = _validatePassword(_newPasswordController.text) != null;
                                _showConfirmPasswordError = _confirmPasswordController.text.isEmpty;
                                _passwordsMatch = _newPasswordController.text == _confirmPasswordController.text;
                              });
                              if (!_showOldPasswordError && !_showNewPasswordError && !_showConfirmPasswordError && _passwordsMatch) {
                                _resetFields();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Password updated successfully!'),
                                  ),
                                );
                              }
                            },
                            child: Text("Update",style: TextStyle(fontSize: 17),))),
                    SizedBox(width: 80,),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: 0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal.shade900,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                              )
                          ),
                          onPressed: (){
                            _resetFields();
                          },child: Text("Reset",style: TextStyle(fontSize: 17),),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


