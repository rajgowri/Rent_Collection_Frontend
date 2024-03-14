import 'package:flutter/material.dart';
import 'package:shop_rent/Modules/HomePage.dart';
import 'package:shop_rent/Modules/Invoices/PaidInvoices.dart';
import 'package:shop_rent/Modules/Invoices/PendingInvoices.dart';
import 'package:shop_rent/Modules/Overview.dart';
import 'package:shop_rent/Modules/Payments/Categories.dart';
import 'package:shop_rent/Modules/Payments/Payments.dart';
import 'package:shop_rent/Modules/Profile/ChangePswd.dart';
import 'package:shop_rent/Modules/Profile/Profile.dart';
import 'package:shop_rent/Modules/Property/AddShops.dart';
import 'package:shop_rent/Modules/Property/DeleteShops.dart';
import 'package:shop_rent/Modules/Property/HideShops.dart';
import 'package:shop_rent/Modules/Reports/DepositReport.dart';
import 'package:shop_rent/Modules/Reports/PaymentReport.dart';
import 'package:shop_rent/Modules/Reports/RentReport.dart';
import 'package:shop_rent/Modules/ShopKeepers/ActiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/Add.dart';
import 'package:shop_rent/Modules/ShopKeepers/InactiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/Inbox.dart';
import 'package:shop_rent/Modules/Shops/Assets.dart';
import 'package:shop_rent/Modules/Shops/Rooms.dart';

class AddPayments extends StatefulWidget {
  const AddPayments({super.key});

  @override
  State<AddPayments> createState() => _AddPaymentsState();
}

class _AddPaymentsState extends State<AddPayments> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  DateTime? _Date;

  String? selectedCategory;
  List<String> category = ["Deposit", "Rent", "Expense"];

  String? selectedMethod;
  List<String> method = ["Cash", "Online"];

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
                        padding: EdgeInsets.all(20),
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
                      foregroundColor: Colors.black,
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
                  child: Text("Dashboard",style: TextStyle(fontSize: 20,color: Colors.white),),
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
                        if (newValue == "Rent Report") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RentReportPage()),
                          );
                        }
                        else if (newValue == "Deposit Report") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DepositReportPage()),
                          );
                        }
                        else if (newValue == "Payment Report") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentReportPage()),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Shop Keepers Details
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.all(20), // Add margin to separate sections
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text("Add Payment", style: TextStyle(fontSize: 25)),
                        SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: selectedCategory,
                          items: category.map((state) {
                            return DropdownMenuItem<String>(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Select Category",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Amount",
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        DropdownButtonFormField<String>(
                          value: selectedMethod,
                          items: method.map((state) {
                            return DropdownMenuItem<String>(
                              value: state,
                              child: Text(state),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedMethod = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Select Method",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Reference id",
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Payment Date",
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () async {
                                final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null && pickedDate != _Date) {
                                  setState(() {
                                    _Date = pickedDate;
                                  });
                                }
                              },
                            ),
                          ),
                          readOnly: true, // Makes the TextField readonly
                          controller: TextEditingController(
                            // Displays the selected date in the TextField
                            text: _Date != null
                                ? '${_Date!.day}/${_Date!.month}/${_Date!.year}'
                                : '',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(child: SizedBox(
                                height: 40,
                                width: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.teal.shade900,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        )
                                    ),
                                    onPressed: (){}, child: Text("Submit")))),
                            SizedBox(width: 10,),
                            Expanded(child: SizedBox(
                                height: 40,
                                width: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.teal.shade900,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)
                                        )
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Back"))))
                          ],
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





