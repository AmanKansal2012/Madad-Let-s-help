
import 'package:flutter/material.dart';
import 'package:madad/model/form_model.dart';
import 'package:madad/utils/constants.dart';

import '../network_handling/form_controller.dart';

class Donor extends StatefulWidget {
  @override
  _DonorState createState() => _DonorState();
}





class _DonorState extends State<Donor> {
  final List<String> _items = ['Male', 'female','Other'].toList();
  final List<String> _grpItems = ['A+', 'A-', 'B+', 'B-', 'AB+','AB-', 'O+','O-'].toList();
  final List<String> _cities = [
    'Moradabad',
    'Central Delhi',
    'East Delhi',
    'New Delhi',
    'North Delhi',
    'North East Delhi',
    'North West Delhi',
    'South Delhi',
    'South West Delhi',
    'West Delhi',
    'Agra',
    'Allahabad',
    'Aligarh',
    'Ambedkar Nagar',
    'Auraiya',
    'Azamgarh',
    'Barabanki',
    'Budaun',
    'Bagpat',
    'Bahraich',
    'Bijnor',
    'Ballia',
    'Banda',
    'Balrampur',
    'Bareilly',
    'Basti',
    'Bulandshahr',
    'Chandauli',
    'Chitrakoot',
    'Deoria',
    'Etah',
    'Kanshi Ram Nagar',
    'Etawah',
    'Firozabad',
    'Farrukhabad',
    'Fatehpur',
    'Faizabad',
    'Gautam Buddh Nagar',
    'Gonda',
    'Ghazipur',
    'Gorakhpur',
    'Ghaziabad',
    'Hamirpur',
    'Hardoi',
    'Mahamaya Nagar',
    'Jhansi',
    'Jalaun',
    'JP Nagar',
    'Jaunpur district',
    'Ramabai Nagar',
    'Kannauj',
    'Kanpur',
    'Kaushambi',
    'Kushinagar',
    'Lalitpur',
    'Lakhimpur Kheri',
    'Lucknow',
    'Mau',
    'Meerut',
    'Maharajganj',
    'Mahoba',
    'Mirzapur',
    'Mainpuri',
    'Mathura',
    'Muzaffarnagar',
    'Panchsheel Nagar',
    'Pilibhit',
    'Shamli',
    'Pratapgarh',
    'Rampur',
    'Raebareli',
    'Saharanpur',
    'Sitapur',
    'Shahjahanpur',
    'Sant Kabir Nagar',
    'Siddharthnagar',
    'Sonbhadra',
    'Sant Ravidas Nagar',
    'Sultanpur',
    'Shravasti',
    'Unnao',
    'Varanasi',
    'Almora',
    'Bageshwar',
    'Chamoli',
    'Champawat',
    'Dehradun',
    'Haridwar',
    'Nainital',
    'Pauri Garhwal',
    'Pithoragarh',
    'Rudraprayag',
    'Tehri Garhwal',
    'Udham Singh Nagar',
    'Uttarkashi',
    'Other'
  ].toList();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otherMobileNoController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController recoveredController = TextEditingController();

  String _selection;
  String _bloodGroup;
  String _city;
  bool name=false,mobileNo=false,age=false,recover=false,enable=false;

  @override
  void initState() {
    _selection = _items.first;
    _bloodGroup = _grpItems.first;
    _city = _cities.first;
    super.initState();
  }
  Future<void> _submitForm() async {

    if(_formKey.currentState.validate()){
      setState(() {
        enable=true;
      });
      FormModel formModel = FormModel(
        nameController.text.trim(),
        _selection,
        ageController.text.trim(),
        _bloodGroup,
        "Yes",
        "No",
        recoveredController.text.trim(),
        mobileController.text.trim(),
        "",
        _city,
        "",
        "",
      );

      FormController formController = FormController();

      formController.submitForm(formModel, (String response) {

        if (response == FormController.STATUS_SUCCESS) {
           nameController.clear();
           mobileController.clear();
           otherMobileNoController .clear();
           ageController.clear();
           addressController.clear();
           remarksController.clear();
           recoveredController.clear();
          setState(() {
            enable=false;
          });
          _showSnackbar("Details Submitted");
        } else {
          nameController.clear();
          mobileController.clear();
          otherMobileNoController .clear();
          ageController.clear();
          addressController.clear();
          remarksController.clear();
          recoveredController.clear();
          setState(() {
            enable=false;
          });
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Details");
    }


  }
  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message),backgroundColor: kColorD,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  Widget citiesDropdown(
      List<DropdownMenuItem<String>> dropdownCityMenuOptions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("City :",style: kBody1.copyWith(color: kColorD),),
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0),
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(

                  style: kBody1.copyWith(color: kColorD),
                  dropdownColor: kColorA,
                  value: _city,
                  items: dropdownCityMenuOptions,
                  onChanged: (s) {
                    setState(() {
                      _city = s;
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
  Widget genderDropdown(
      List<DropdownMenuItem<String>> dropdownGenderMenuOptions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       // Text("Gender:",style: kBody1.copyWith(color: kColorD),),
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0),
            child: FittedBox(
              alignment: Alignment.center,
              child: DropdownButton<String>(

                  style: kBody1.copyWith(color: kColorD),
                  dropdownColor: kColorA,
                  value: _selection,
                  items: dropdownGenderMenuOptions,
                  onChanged: (s) {
                    setState(() {
                      _selection = s;
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
  Widget bloodDropdown(
      List<DropdownMenuItem<String>> dropdownBloodGroupMenuOptions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       // Text("Blood Group:",style: kBody1.copyWith(color: kColorD),),
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

          ),
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10.0),
            child: FittedBox(
              alignment: Alignment.centerLeft,
              child: DropdownButton<String>(


                  style: kBody1.copyWith(color: kColorD),
                  dropdownColor: kColorA,
                  value: _bloodGroup,
                  items: dropdownBloodGroupMenuOptions,
                  onChanged: (s) {
                    setState(() {
                      _bloodGroup = s;
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final dropdownMenuOptions = _items
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final dropdownBloodMenuOptions = _grpItems
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final dropdownCityMenuOptions = _cities
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kColorB,
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,

            leading: Padding(
              padding: const EdgeInsets.only(top:22.0),
              child: IconButton(icon:Icon(Icons.arrow_back_rounded,color: kFadedHighlightColor,),onPressed: ()=>Navigator.pop(context),),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child:Center(
                child: Container(
                  alignment: Alignment.center,
                  width:MediaQuery.of(context).size.width,
                  child: Text(
                    "मदद -Let's help each other",
                    style: kTitle1.copyWith(color: kColorC,),
                  ),
                ),
              ),
            ),
            backgroundColor:kColorD,
          )),
      body  : Center(
        child: Container(
           height: MediaQuery.of(context).size.height*0.8,
           width: MediaQuery.of(context).size.width*0.9,
         // color: kColorA,
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Container(
                      child: Text(
                        "Please fill out the details for donation",
                        style: kTitle1.copyWith(color: kColorD,),
                        textAlign: TextAlign.center,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Container(
                      child: Text(
                        "* mark fields are mandatory",
                        style: kCaption2.copyWith(color: kColor3,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, right:24,top: 6,bottom: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color:kColorA,
                            border: Border.all(
                              color: kColorD,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[

                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    cursorColor: kColorC,
                                    textCapitalization: TextCapitalization.sentences,
                                    controller: nameController,
                                    onSubmitted: null,
                                    style:  kBody1.copyWith(color: kColorD),
                                    onChanged: (val) {
                                      setState(() {
                                        if(val.trim().length>1)
                                          name=true;
                                        else
                                          name=false;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: Text("*",style:kTitle1.copyWith(color: Colors.red)),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Enter your Name',
                                      hintStyle:
                                      kBody1.copyWith(color: kColorD),
                                      contentPadding: const EdgeInsets.only(
                                        left: 16,
                                        top:12

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
                  ],
                ),

                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, top: 4,bottom: 4,right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color:kColorA,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kColorD,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              autofocus: false,
                              cursorColor: kColorC,
                              textCapitalization: TextCapitalization.sentences,
                              maxLength: 13,
                              controller: mobileController,
                              onSubmitted: null,
                              style:  kBody1.copyWith(color: kColorD),
                              onChanged: (val) {
                                setState(() {
                                  if(val.trim().length>=10)
                                    mobileNo=true;
                                  else
                                    mobileNo=false;
                                });
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                counterText: "",
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text("*",style:kTitle1.copyWith(color: Colors.red)),
                                ),  border: InputBorder.none,
                                hintText: 'mobile number',
                                hintStyle:
                                kBody1.copyWith(color: kColorD,fontSize: 14),
                                contentPadding: const EdgeInsets.only(
                                    left: 16,
                                    top:12
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 24, top: 4,bottom: 4),
                  //     child: Container(
                  //
                  //       decoration: BoxDecoration(
                  //         color:kColorA,
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         border: Border.all(
                  //           color: kColorD,
                  //           width: 1,
                  //         ),
                  //       ),
                  //       child: Column(
                  //         children: <Widget>[
                  //           Column(
                  //             children: <Widget>[
                  //               TextField(
                  //                 textCapitalization: TextCapitalization.sentences,
                  //                 cursorColor: kColorC,
                  //                 maxLength: 13,
                  //                 controller: otherMobileNoController,
                  //
                  //                 onSubmitted: null,
                  //                 style:  kBody1.copyWith(color: kColorD),
                  //
                  //                 keyboardType: TextInputType.phone,
                  //                 decoration: InputDecoration(
                  //                   counterText: "",
                  //                   border: InputBorder.none,
                  //                   hintText: 'other mobile number',
                  //                   hintStyle:
                  //                   kBody1.copyWith(color: kColorD,fontSize: 14),
                  //                   contentPadding: const EdgeInsets.symmetric(
                  //                     horizontal: 16,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],),

                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, top: 4,bottom: 4,right: 4),
                      child: Container(

                        decoration: BoxDecoration(
                          color:kColorA,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kColorD,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                            genderDropdown(dropdownMenuOptions),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, top: 4,bottom: 4,right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color:kColorA,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kColorD,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                bloodDropdown(dropdownBloodMenuOptions),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),



                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 24,right:24, top: 4,bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                color:kColorA,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: kColorD,
                  width: 1,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      TextField(
                        autofocus: false,
                        cursorColor: kColorC,
                        textCapitalization: TextCapitalization.sentences,

                        controller: ageController,
                        onSubmitted: null,
                        style:  kBody1.copyWith(color: kColorD),
                        onChanged: (val) {
                          setState(() {
                          if(val.trim().isNotEmpty)
                          {
                            age=true;
                          }
                          else{
                            age=false;
                          }});
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text("*",style:kTitle1.copyWith(color: Colors.red)),
                          ), border: InputBorder.none,
                          hintText: 'age',
                          hintStyle:
                          kBody1.copyWith(color: kColorD),
                          contentPadding: const EdgeInsets.only(
                              left: 16,
                              top:12
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color:kColorA,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: kColorD,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  TextField(
                                    autofocus: false,
                                    cursorColor: kColorC,
                                    textCapitalization: TextCapitalization.sentences,


                                    controller: recoveredController,
                                    onSubmitted: null,
                                    style:  kBody1.copyWith(color: kColorD),
                                    onChanged: (val){
                                      setState(() {
                                        if(val.trim().isNotEmpty)
                                          recover=true;
                                        else
                                          recover=false;
                                      });
                                    },

                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: Text("*",style:kTitle1.copyWith(color: Colors.red)),
                                      ), border: InputBorder.none,
                                      hintText: 'Are you a covid recovered patient? If yes then when?',
                                      hintStyle:
                                      kBody1.copyWith(color: kColorD),
                                        contentPadding: const EdgeInsets.only(
                                            left: 16,
                                            top:12
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
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 24,right:24, top: 4,bottom: 4),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color:kColorA,
                //             borderRadius: BorderRadius.circular(8.0),
                //             border: Border.all(
                //               color: kColorD,
                //               width: 1,
                //             ),
                //           ),
                //           child: Column(
                //             children: <Widget>[
                //               Column(
                //                 children: <Widget>[
                //                   TextField(
                //                     cursorColor: kColorC,
                //                     textCapitalization: TextCapitalization.sentences,
                //                     controller: addressController,
                //                     style:  kBody1.copyWith(color: kColorD),
                //                     keyboardType: TextInputType.text,
                //                     decoration: InputDecoration(
                //
                //                       border: InputBorder.none,
                //                       hintText: 'Enter your address',
                //                       hintStyle:
                //                       kBody1.copyWith(color: kColorD),
                //                       contentPadding: const EdgeInsets.symmetric(
                //                         horizontal: 16,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24, top: 4,bottom: 4,right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            color:kColorA,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: kColorD,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  citiesDropdown(dropdownCityMenuOptions),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 24,right:24, top: 4,bottom: 4),
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color:kColorA,
                //             borderRadius: BorderRadius.circular(8.0),
                //             border: Border.all(
                //               color: kColorD,
                //               width: 1,
                //             ),
                //           ),
                //           child: Column(
                //             children: <Widget>[
                //               Column(
                //                 children: <Widget>[
                //                   TextField(
                //                     cursorColor: kColorC,
                //                     textCapitalization: TextCapitalization.sentences,
                //
                //                     controller: remarksController,
                //                     onSubmitted: null,
                //                     style:  kBody1.copyWith(color: kColorD),
                //                     keyboardType: TextInputType.text,
                //                     decoration: InputDecoration(
                //                       border: InputBorder.none,
                //                       hintText: 'Remarks, If Any?',
                //                       hintStyle:
                //                       kBody1.copyWith(color: kColorD),
                //                       contentPadding: const EdgeInsets.symmetric(
                //                         horizontal: 16,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:24.0,vertical: 12,
                  ),
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      color:kColorA,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: kColorD,
                        width: 1,
                      ),),
                    width: double.infinity,
                    child: RaisedButton(
                      disabledColor: kColorD.withOpacity(0.6),
                      color: kColorD,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(8.0),

                      ),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: enable,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 16,
                                width: 16,
                                child:  CircularProgressIndicator(
                                  strokeWidth: 6.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(kColorD),
                                  backgroundColor: kColor1,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Submit Details",
                            style: kTitle1.copyWith(
                              color:kColor3 ,
                            ),
                          ),
                        ],
                      ),
                      onPressed:name&&mobileNo&&age&&recover? _submitForm:null,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
