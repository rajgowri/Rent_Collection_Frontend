import 'package:flutter/material.dart';
import 'package:shop_rent/Modules/HomePage.dart';
import 'package:shop_rent/Modules/Invoices/PaidInvoices.dart';
import 'package:shop_rent/Modules/Invoices/PendingInvoices.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalDue.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalAdditional.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalDiscount.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalIncome.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalPaid.dart';
import 'package:shop_rent/Modules/OverviewCards/TotalRent.dart';
import 'package:shop_rent/Modules/Payments/Categories.dart';
import 'package:shop_rent/Modules/Payments/Payments.dart';
import 'package:shop_rent/Modules/Profile/ChangePswd.dart';
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

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = [
      {"title": "0/0", "subtitle": "Vender", "trailing": Icon(Icons.person, color: Colors.teal, size: 35)},
      {"title": "0/0", "subtitle": "Shops", "trailing": Icon(Icons.home, color: Colors.teal, size: 35)},
      {"title": "0/0", "subtitle": "Assets", "trailing": Icon(Icons.table_restaurant_rounded, color: Colors.teal, size: 35)},
      {"title": "0/0", "subtitle": "Invoices", "trailing": Icon(Icons.file_copy_outlined, color: Colors.teal, size: 35)},
    ];

    List<Map<String, dynamic>> data2 = [
      {"leading":Icon(Icons.bar_chart,color: Colors.black,), "title": "Report", "options": ["Rent", "Deposit","Payment", "Asset Rent", "Shop Rent"]},
      {"leading":Icon(Icons.person,color: Colors.black,), "title": "Vender", "options": ["Add", "Active Vender", "Inactive Venser", "Inbox"]},
      {"leading":Icon(Icons.area_chart,color: Colors.black,), "title": "Property", "options": ["Add Shop", "Delete Shop", "Hide Shop"]},
      {"leading":Icon(Icons.home_work_outlined,color: Colors.black,), "title": "Shops", "options": ["Assets", "Shops"]},
      {"leading":Icon(Icons.file_copy_rounded,color: Colors.black,), "title": "Invoice", "options": ["Pending Invoices", "Paid Invoices"]},
      {"leading":Icon(Icons.wallet,color: Colors.black,), "title": "Payment", "options": ["Payment", "Categories"]},
    ];

    List<Map<String,dynamic>> data1 = [
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white,)),"title":"0 Rs","subtitle":"Total Due"},
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white)),"title":"0 Rs","subtitle":"Total Paid"},
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white)),"title":"0 Rs","subtitle":"Total Income"},
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white)),"title":"0 Rs","subtitle":"Total Rent"},
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white)),"title":"0 Rs","subtitle":"Total Additional"},
      {"leading":CircleAvatar(
          backgroundColor: Colors.teal,
          child:Icon(Icons.currency_rupee,color: Colors.white)),"title":"0 Rs","subtitle":"Total Discount"},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
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
                      backgroundColor: Colors.teal.shade900,
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
                              leading: Icon(Icons.account_circle, size: 40,),
                              title: Text("Robert", style: TextStyle(fontSize: 20),),
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
                      shape: RoundedRectangleBorder(
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
                        else if (newValue == "Asset Rent") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AssetReportPage()),
                          );
                        }
                        else if (newValue == "Shop Rent") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShopReportPage()),
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Overview", style: TextStyle(fontSize: 25),),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(data[index]["title"],style: TextStyle(fontSize: 25)),
                        subtitle: Text(data[index]["subtitle"],style: TextStyle(fontSize: 17)),
                        trailing: data[index]["trailing"],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30,),
              Text("February Overview", style: TextStyle(fontSize: 25),),
              Text("February month overall report",style: TextStyle(fontSize: 15),),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                    itemCount: data1.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalDue()),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalPaid()),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalIncome()),
                            );
                          } else if (index == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalRent()),
                            );
                          } else if (index == 4) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalAdditional()),
                            );
                          } else if (index == 5) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TotalDiscount()),
                            );
                          }
                        },
                        child: Card(
                          color: Colors.white,
                          child: ListTile(
                            leading:data1[index]["leading"],
                            title: Text(data1[index]["title"],style: TextStyle(fontSize: 23)),
                            subtitle: Text(data1[index]["subtitle"],style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
