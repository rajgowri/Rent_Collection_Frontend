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
import 'package:shop_rent/Modules/Reports/AssetReport.dart';
import 'package:shop_rent/Modules/Reports/DepositReport.dart';
import 'package:shop_rent/Modules/Reports/PaymentReport.dart';
import 'package:shop_rent/Modules/Reports/RentReport.dart';
import 'package:shop_rent/Modules/Reports/ShopReport.dart';
import 'package:shop_rent/Modules/ShopKeepers/ActiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/InactiveShopKeepers.dart';
import 'package:shop_rent/Modules/ShopKeepers/Inbox.dart';
import 'package:shop_rent/Modules/Shops/Assets.dart';
import 'package:shop_rent/Modules/Shops/Rooms.dart';

class Asset {
  String category;
  String name;
  int quantity;

  Asset(this.category, this.name, this.quantity);
}

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
  }

  class _AddPageState extends State<AddPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  List<String> selectedCategories = [];
  List<String> selectedSubCategories = [];

  List<Asset> selectedAssets = [];

  List<String> categories = ["Furniture", "Electrical Appliances", "Others"];
  Map<String, List<String>> subCategoriesMap = {
  "Furniture": ["Table", "Chair", "Bed", "Sofa"],
  "Electrical Appliances": ["Fan", "Light", "TV", "Refrigerator"],
  "Others": ["Water Purifier", "Mirror"]
  };

  String? documentFilePath;

  DateTime? _startDate;
  DateTime? _endDate;

  String? selectedState;
  List<String> states = [
    "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa",
    "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka", "Kerala",
    "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland",
    "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
    "Uttar Pradesh", "Uttarakhand", "West Bengal"
  ];

  String? selectedPayment;
  List<String> payment = ["Cash", "Online"];

  bool isNewTenant = true;

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
        body: ListView(
            children: [
        Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Vendor Type", style: TextStyle(fontSize: 25)),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: isNewTenant,
                        onChanged: (bool? value) {
                          setState(() {
                            isNewTenant = value!;
                          });
                        },
                      ),
                      Text("New Tenant",style: TextStyle(fontSize: 15),),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: isNewTenant,
                        onChanged: (bool? value) {
                          setState(() {
                            isNewTenant = value!;
                          });
                        },
                      ),
                      Text("Existing Tenant",style: TextStyle(fontSize: 15),),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            if(isNewTenant)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Vendor Details", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Mobile number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Temporary Address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Permanent Address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 350,
                      child: DropdownButtonFormField<String>(
                        value: selectedState,
                        items: states.map((state) {
                          return DropdownMenuItem<String>(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedState = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "State",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Pin Code",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Emergency contact number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 10,),
            if(isNewTenant)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text("Rent Deposit", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Deposit Amount",
                          border: OutlineInputBorder()
                      ),
                    ),
                    SizedBox(height: 10,),
                    DropdownButtonFormField<String>(
                      value: selectedPayment,
                      items: payment.map((state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedPayment = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Deposit payment channel",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                          labelText: "Payment reference id",
                          border: OutlineInputBorder()
                      ),
                    )
                  ],
                ),
              ),
            SizedBox(height: 10,),
            if(isNewTenant)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("Assets", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 20),
                    for (var category in categories)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(category, style: TextStyle(fontSize: 20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: subCategoriesMap[category]!.map((subcategory) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: selectedAssets.any((asset) =>
                                        asset.category == category && asset.name == subcategory),
                                        onChanged: (value) {
                                          setState(() {
                                            if (value!) {
                                              selectedAssets.add(Asset(category, subcategory, 1));
                                            } else {
                                              selectedAssets.removeWhere((asset) =>
                                              asset.category == category && asset.name == subcategory);
                                            }
                                          });
                                        },
                                      ),
                                      Text(subcategory),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                  Container(
                                    width: 80,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText: 'Quantity',
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        final int quantity = int.tryParse(value) ?? 0;
                                        selectedAssets.removeWhere((asset) =>
                                        asset.category == category && asset.name == subcategory);
                                        if (quantity > 0) {
                                          selectedAssets.add(Asset(category, subcategory, quantity));
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            SizedBox(height: 10,),
            if(isNewTenant)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Upload Documents", style: TextStyle(fontSize: 25)),
                    SizedBox(height: 25),
                  Text("Vender's Photo",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Photo",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  SizedBox(
                      height: 40,
                      width: 500,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              )
                          ),
                          onPressed: (){},
                          child: Text("Browse File",style: TextStyle(fontSize: 15),))),
                  SizedBox(height: 5,),
                  Text("JPEG and PNG, Max image size 100MB"),
                  SizedBox(height: 20),
                  Text("Vender's Id",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  Text("Id Proof Front",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  SizedBox(
                      height: 40,
                      width: 500,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              )
                          ),
                          onPressed: (){}, child: Text("Browse File",style: TextStyle(fontSize: 15),))),

                  SizedBox(height: 5,),
                  Text("JPEG and PNG, Max image size 100MB"),
                  SizedBox(height: 15,),
                  Text("Id Proof Back",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  SizedBox(
                      height: 40,
                      width: 500,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              )
                          ),
                          onPressed: (){}, child: Text("Browse File",style: TextStyle(fontSize: 15),))),
                  SizedBox(height: 5,),
                  Text("JPEG and PNG, Max image size 100MB"),
                  SizedBox(height: 20,),
                  Text("Shop Details",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 15,),
                  Text("Document",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  SizedBox(
                      height: 40,
                      width: 500,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              )
                          ),
                          onPressed: (){}, child: Text("Browse File",style: TextStyle(fontSize: 15),))),

                  SizedBox(height: 5,),
                  Text("PDF, Max file size 200MB"),
                ],
              ),
            ),
            SizedBox(height: 10,),
            if(isNewTenant) Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Lease",style: TextStyle(fontSize: 25)),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Lease start date",
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
                          if (pickedDate != null && pickedDate != _startDate) {
                            setState(() {
                              _startDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: _startDate != null
                          ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                          : '',
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Lease end date",
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
                          if (pickedDate != null && pickedDate != _endDate) {
                            setState(() {
                              _endDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    readOnly: true,
                    controller: TextEditingController(
                      text: _endDate != null
                          ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                          : '',
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          onPressed: (){}, child: Text("Submit"))),
                ],
              ),
            ),
            Column(
              children: [
                if (!isNewTenant) Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Existing Tenant Details", style: TextStyle(fontSize: 25)),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Enter Vender Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal.shade900,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              )
                          ),
                          onPressed: () {},
                          child: Text("Submit"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
    ],
    ),),
    );
  }
}

