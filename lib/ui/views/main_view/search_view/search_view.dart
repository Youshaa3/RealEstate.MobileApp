import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  String dropDownValue = 'one';

  RangeValues values1 = const RangeValues(0.1 , 1.0);
  RangeValues values2 = const RangeValues(0.1 , 1.0);

  List<int> selectedItems = [];
  int index =1;

  @override
  Widget build(BuildContext context) {

    RangeLabels labels1 = RangeLabels(
      values1.start.toString(),
      values1.end.toString(),
    );

    RangeLabels labels2 = RangeLabels(
      values2.start.toString(),
      values2.end.toString(),
    );

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text("Filters"),
          actions: [
            Padding(
              padding: EdgeInsets.only(right:size.width*0.05 , top: size.width*0.045),
              child: Text('Done' , style: TextStyle(fontSize: size.width*0.045),),
            )
          ],
          backgroundColor: Colors.teal,
          elevation: 50.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.width*0.035),

                    Row(
                      children: [
                        SizedBox(width: size.width*0.03),
                        Icon(Icons.check_circle_outline),
                        Text('    I want to' , style: TextStyle(fontSize: size.width*0.04 , fontWeight: FontWeight.bold),),
                        SizedBox(width: size.width*0.35),

                        ToggleSwitch(
                          minWidth: size.width*0.16,
                          minHeight: size.height*0.05,
                          cornerRadius: 20.0,
                          activeBgColors: [[Colors.teal], [Colors.teal]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          initialLabelIndex: 1,
                          totalSwitches: 2,
                          labels: ['Buy', 'Rent'],
                          radiusStyle: true,
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),

                        SizedBox(height: size.width*0.035),

                      ],
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),

                    Row(
                      children: [
                        SizedBox(width: size.width*0.03),
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: size.width*0.04),
                        Column(
                          children: [
                            Text('City' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: size.width*0.035),),
                            Text(dropDownValue , style: TextStyle(fontSize: size.width*0.035 , color: Colors.teal),),
                          ],
                        ),
                        SizedBox(width: size.width*0.55),

                        DropdownButton(
                          value: dropDownValue,
                          icon: Icon(Icons.arrow_drop_down),
                          style: TextStyle(color: Colors.black),
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          onChanged: (String? newValue){
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(child: Text('one'),value: 'one',),
                            DropdownMenuItem(child: Text('two'),value: 'two',),
                            DropdownMenuItem(child: Text('three'),value: 'three',),
                            DropdownMenuItem(child: Text('four'),value: 'four',),
                            DropdownMenuItem(child: Text('five'),value: 'five',),
                          ],
                        ),

                      ],
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width*0.035),
                            Icon(Icons.map),
                            Text('   Select Location' , style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold),),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.02 , top: size.width*0.02),
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width*0.6,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search Locations',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(Icons.search , color: Colors.black,),
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.02 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),

                              SizedBox(width: size.width*0.08),

                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(size.width*0.25 , size.width*0.12),
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.map , color: Colors.teal),
                                    SizedBox(width: size.width*0.015),
                                    Text('Map' , style: TextStyle(color: Colors.black , fontSize: size.width*0.035)),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),

                    Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.03 , right: size.width*0.03),
                          child: Row(
                            children: [
                              Icon(Icons.label_outline),
                              SizedBox(width: size.width*0.02),
                              Text('Price Range' , style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width*0.55),
                              Text('SYP' , style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.02 , right: size.width*0.02 , top: size.width*0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*0.35,height: size.width*0.08,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.0 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),

                              Text('To' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: size.width*0.035),),

                              SizedBox(
                                width: size.width*0.35,height: size.width*0.08,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Any',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.0 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        RangeSlider(
                          activeColor: Colors.blue,
                          values: values1,
                          divisions: 10,
                          labels: labels1,
                          onChanged: (newValue){
                            setState(() {
                              values1 = newValue;
                            });
                          },
                        ),

                      ],
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),

                    Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.03 , right: size.width*0.03),
                          child: Row(
                            children: [
                              Icon(Icons.design_services_outlined),
                              SizedBox(width: size.width*0.02),
                              Text('Area Range' , style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold),),
                              SizedBox(width: size.width*0.55),
                              Text('Meter' , style: TextStyle(fontSize: size.width*0.035 , fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.02 , right: size.width*0.02 , top: size.width*0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width*0.35,height: size.width*0.08,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.0 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),

                              Text('To' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: size.width*0.035),),

                              SizedBox(
                                width: size.width*0.35,height: size.width*0.08,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Any',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.0 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        RangeSlider(
                          activeColor: Colors.blue,
                          values: values2,
                          divisions: 10,
                          labels: labels2,
                          onChanged: (newValue){
                            setState(() {
                              values2 = newValue;
                            });
                          },
                        ),

                      ],
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),

                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.03),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.bed_outlined),
                              SizedBox(width: size.width*0.02),
                              Text("Bedrooms"),
                            ],
                          ),
                          SizedBox(height: size.width*0.02),
                          Row(
                            children: [
                              MultiSelectContainer(
                                splashColor: Colors.blue.withOpacity(0.1),
                                highlightColor: Colors.blue.withOpacity(0.1),
                                textStyles: const MultiSelectTextStyles(
                                    selectedTextStyle:
                                    TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
                                itemsDecoration: MultiSelectDecorations(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  selectedDecoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20)),
                                  disabledDecoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(color: Colors.grey[500]!),
                                      borderRadius: BorderRadius.circular(10)),),
                                items: [
                                    MultiSelectCard(value: 'Studio', label: 'Studio'),
                                    MultiSelectCard(value: '1', label: '1'),
                                    MultiSelectCard(value: '2', label: '2'),
                                    MultiSelectCard(value: '3', label: '3'),
                                    MultiSelectCard(value: '4', label: '4'),
                                    MultiSelectCard(value: '5', label: '5'),
                                    MultiSelectCard(value: '6', label: '6'),
                                    MultiSelectCard(value: '10+', label: '10+'),
                                  ],
                                  onChange: (allSelectedItems, selectedItem) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Divider(thickness: size.width*0.0015 , color: Colors.grey),
                    SizedBox(height: size.width*0.035),


                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.02),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.font_download_outlined),
                              SizedBox(width: size.width*0.015),
                              Text('Add Keyword'),
                            ],
                          ),
                          SizedBox(height: size.width*0.02),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width*0.68,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Try"furnished","low price"etc',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:BorderSide(color: Colors.black),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.symmetric(vertical: size.width*0.02 , horizontal:size.width*0.04 ),
                                  ),
                                ),
                              ),

                              SizedBox(width: size.width*0.05),

                              ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.grey.withOpacity(0),
                                  fixedSize: Size(size.width*0.04 , size.width*0.1),
                                  backgroundColor: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Center(child: Icon(Icons.add , color: Colors.teal)),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.all(size.width*0.05),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: size.width*0.4,
                          height: size.height*0.05,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(child: Text('Show Ads' , style: TextStyle(color: Colors.white , fontSize: size.width*0.035),)),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width*0.5)
                  ],
                ),
              ),



            ],
          ),
        ),
    ),
    );
  }
}
