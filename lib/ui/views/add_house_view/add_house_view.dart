import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:real_estate/core/data/repositories/add_new_house_repo.dart';
import 'package:real_estate/core/enums/file_type.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

class AddHouseView extends StatefulWidget {
  const AddHouseView({Key? key}) : super(key: key);

  @override
  State<AddHouseView> createState() => _AddHouseViewState();
}

class _AddHouseViewState extends State<AddHouseView> {

  String dropDownValue = 'Homs';
  int roomsNumber = 1;

  bool isToggled = false;

  final ImagePicker picker = ImagePicker();
  List<XFile> imageFileList = [];



  FileModel? selectedFile;
  bool showOptions = false;

  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(115, 162, 131, 1.0),
                      Color.fromRGBO(156, 187, 158, 1.0),
                      Color.fromRGBO(216, 253, 224, 1.0),
                      Color.fromRGBO(187, 185, 185, 1.0),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.03,
                      right: size.width * 0.03,
                      top: size.width * 0.03),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios , color: Colors.black,),
                          SizedBox(width: size.width * 0.75),
                          Text('Clear All'),
                        ],
                      ),
                      Row(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: size.height*0.05),

                              Text(
                                'Post an Add',
                                style: TextStyle(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                              ),

                              SizedBox(height: size.height*0.06),

                              Text(
                                  'Reach thousands of buyers\n and tenants in a few steps',
                                  style: TextStyle(fontSize: size.width * 0.035 , color: Colors.black)),
                            ],
                          ),
                          Spacer(),

                          Padding(
                            padding: EdgeInsets.only(top: size.width*0.15),
                            child: SvgPicture.asset(
                              'images/sliver_pic.svg',
                              width: size.width * 0.1,
                              height: size.height * 0.1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 , bottom: size.width*0.03),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.check_circle_outline , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Purpose' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.1),
                child: Row(
                  children: [
                    MultiSelectContainer(
                      splashColor: Colors.blue.withOpacity(0.1),
                      highlightColor: Colors.blue.withOpacity(0.1),
                      textStyles: const MultiSelectTextStyles(
                          selectedTextStyle:
                          TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
                      itemsDecoration: MultiSelectDecorations(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
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
                        MultiSelectCard(value: 'Sell', label: 'Sell'),
                        MultiSelectCard(value: 'Rent Out', label: 'Rent Out'),
                      ],
                      onChange: (allSelectedItems, selectedItem) {},
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: size.width*0.03 , bottom: size.width*0.03 , left: size.width*0.14 , right: size.width*0.05),
                child: Divider(color: Colors.grey, thickness: size.width*0.002,),
              ),


              Row(
                children: [
                  SizedBox(width: size.width*0.03),
                  Container(
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: Icon(Icons.location_on_outlined , color: Colors.white,)
                  ),
                  SizedBox(width: size.width*0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City' , style: TextStyle(fontSize: size.width*0.035),),
                      SizedBox(height: size.width*0.01),
                      Text(dropDownValue , style: TextStyle(fontSize: size.width*0.035 , color: Colors.teal),),
                    ],
                  ),

                  Spacer(),

                  Padding(
                    padding: EdgeInsets.only(right: size.width*0.05),
                    child: DropdownButton(
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
                        DropdownMenuItem(child: Text('Homs'),value: 'Homs',),
                        DropdownMenuItem(child: Text('Damascus'),value: 'Damascus',),
                        DropdownMenuItem(child: Text('Aleppo'),value: 'Aleppo',),
                        DropdownMenuItem(child: Text('Hama'),value: 'Hama',),
                        DropdownMenuItem(child: Text('Tartus'),value: 'Tartus',),
                        DropdownMenuItem(child: Text('Latakia'),value: 'Latakia',),
                      ],
                    ),
                  ),

                ],
              ),

              Padding(
                padding: EdgeInsets.only(top: size.width*0.03 , bottom: size.width*0.03 , left: size.width*0.14 , right: size.width*0.05),
                child: Divider(color: Colors.grey, thickness: size.width*0.002,),
              ),





              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.label_outline , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Total Price' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.14 , right: size.width*0.05),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter the price',
                  ),
                ),
              ),




              Padding(
                padding: EdgeInsets.only(left: size.width*0.04 , top: size.width*0.02),
                child: Row(
                  children: [
                    Icon(Icons.bed_outlined , color: Colors.grey,),
                    SizedBox(width: size.width*0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Number of rooms"),
                        SizedBox(height: size.width*0.02),
                        Text("  $roomsNumber" , style: TextStyle(color: Colors.teal , fontSize: size.width*0.04),),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: size.width*0.08),
                      child: DropdownButton(
                        value: roomsNumber,
                        icon: Icon(Icons.arrow_drop_down),
                        style: TextStyle(color: Colors.black),
                        underline: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        onChanged: (int? newValue){
                          setState(() {
                            roomsNumber = newValue!;
                          });
                        },
                        items: [
                          DropdownMenuItem(child: Text('1'),value: 1,),
                          DropdownMenuItem(child: Text('2'),value: 2,),
                          DropdownMenuItem(child: Text('3'),value: 3,),
                          DropdownMenuItem(child: Text('4'),value: 4,),
                          DropdownMenuItem(child: Text('5'),value: 5,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: size.width*0.03 , bottom: size.width*0.03 , left: size.width*0.14 , right: size.width*0.05),
                child: Divider(color: Colors.grey, thickness: size.width*0.002,),
              ),



              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.title , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Property Title' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.14 , right: size.width*0.05),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter title e.g Beautiful new house',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.description_outlined , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Property Description' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.14 , right: size.width*0.05),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Describe your property in detail',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.image , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Upload images of your property' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width*0.14),
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.01),
                    Row(
                      children: [
                        Icon(Icons.check , color: Colors.teal , size: size.width*0.04,),
                        Text(' Ads with pictures get 5x more views and leads' , style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check , color: Colors.teal , size: size.width*0.04,),
                        Text(' Upload good quality pictures with proper lighting' , style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.check , color: Colors.teal , size: size.width*0.04,),
                        Text(' Cover all areas of tour property' , style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height*0.03),

              DottedBorder(
                dashPattern: [10, 10],
                color: Colors.teal,
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: size.height*0.075,
                    width: size.width*0.6,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: size.width*0.01),
                        ElevatedButton(
                          onPressed: () {
                            pickFile(FileTypeEnum.GALLERY);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            fixedSize: Size(size.width*0.5, size.height * 0.055),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined),
                              Text(' Open Gallery' , style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05 , vertical: size.width*0.05),
                child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: imageFileList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.file(File(imageFileList[index].path) , fit: BoxFit.cover,),
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.email_outlined , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Email Address' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.14 , right: size.width*0.05),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'mousa.tma.it@gmail.com',
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.03 , top: size.width*0.05 ),
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.phone_android , color: Colors.white,),
                      width: size.width*0.075,
                      height: size.height*0.04,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                    ),
                    Text('   Contact Number' , style: TextStyle(fontSize: size.width*0.045),),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: size.width*0.14 , right: size.width*0.05),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '+963 ',
                  ),
                ),
              ),

              SizedBox(height: size.height*0.05),

              Container(
                width: size.width,
                height: size.height*0.075,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Save as Draft' , style: TextStyle(fontSize: size.width*0.04),),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        fixedSize: Size(size.width*0.5, size.height * 0.055),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: ()
                        {
                          AddNewHouseRepository().addNew(
                              user_id: 1,
                              name: titleController.text,
                              price: double.parse(priceController.text),
                              sell: true,
                              description: descriptionController.text,
                              city: dropDownValue.toString(),
                              region: 'region',
                              number_of_rooms: int.parse(priceController.text),
                              photoPath: selectedFile!.path,
                          );
                        },
                          child: Text('Post Ad' , style: TextStyle(color: Colors.white),),
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void selectImage () async {
    // List<String> imagesPath = [];
    final List<XFile?> selectedImages = await picker.pickMultiImage();
    if(selectedImages.isNotEmpty)
    {
      imageFileList.addAll(selectedImages as Iterable<XFile>);
    }
    setState(() {

    });
  }

  Future<FileModel> pickFile(FileTypeEnum type) async {
    String path = '';

    switch (type) {
      case FileTypeEnum.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileTypeEnum.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
    }
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }

}

class FileModel {
  FileTypeEnum type;
  String path;

  FileModel(this.path, this.type);
}
