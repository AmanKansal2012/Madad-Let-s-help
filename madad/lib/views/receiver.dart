import 'package:madad/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../network_handling/form_controller.dart';
import '../model/form_model.dart';

class Receiver extends StatefulWidget {
  @override
  _ReceiverState createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  List<FormModel> formItems = List<FormModel>();
  List<FormModel> filteredItems = List<FormModel>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _controller = TextEditingController();
  bool showSearhBar=false,searchhing=false;
  @override
  void initState() {
    super.initState();
    getList();
  }

  getList()async{
    await FormController().getFormList().then((formItems) {
      setState(() {
        this.formItems = formItems;
      });
    });
    print(formItems);
  }
  @override
  Widget build(BuildContext context) {
    //getList();
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: kColorB,
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: showSearhBar==false?AppBar(
            automaticallyImplyLeading: false,

            leading: Padding(
              padding: const EdgeInsets.only(top:22.0),
              child: IconButton(icon:Icon(Icons.arrow_back_rounded,color: kFadedHighlightColor,),onPressed: ()=>Navigator.pop(context),),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:25.0,right: 18),
                child: IconButton(icon:Icon(Icons.search,color: kFadedHighlightColor,),onPressed: (){
                  setState(() {
                    showSearhBar=true;
                  });
                }),
              ),
            ],
            backgroundColor:kColorD,
          ):AppBar(
            automaticallyImplyLeading: false,

            leading: Padding(
              padding: const EdgeInsets.only(top:22.0),
              child: IconButton(icon:Icon(Icons.arrow_back_rounded,color: kFadedHighlightColor,),onPressed: (){
                setState(() {
                  showSearhBar=false;
                  searchhing=false;
                });
              },),
            ),
            title:Padding(
              padding: const EdgeInsets.only(top:22.0),
              child: Container(
                child: TextField(
                  cursorColor: kColorC,
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
      hintText: "Search Donors...",
      border: InputBorder.none,
      suffixIcon: IconButton(icon:Icon(Icons.close),color: kColorC,onPressed: (){
        setState(() {
          _controller.clear();
          searchhing=false;
        });
      },),
      hintStyle: kTitle2.copyWith(color: kFadedHighlightColor),
      ),
      style: kTitle2.copyWith(color: kFadedHighlightColor),

                        onChanged: (value) {

                          setState(() {

                              searchhing=_controller.text.trim().length>1?true:false;

                            filteredItems = formItems
                                .where((item) => item.city
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.bloodGrp
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.mobile
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.otherMobileNo
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.recovered
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.remarks
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.address
                                .toLowerCase()
                                .contains(value.toLowerCase())||item.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });

                        },
      ),
              ),
            ),
            backgroundColor: kColorD,
          )),
      body:formItems.length<1?Center(child: Container(height:100,width: 100,child: CircularProgressIndicator(valueColor:new AlwaysStoppedAnimation<Color>(kColorD),backgroundColor: kColorC,strokeWidth: 20,)),):Padding(
        padding:  EdgeInsets.symmetric(vertical:18.0,horizontal: 24),
        child: !searchhing?ListView.separated(
          shrinkWrap: true,
            itemCount: formItems.length-1??0,
            itemBuilder: (context, i)=>
            Card(
              color: kColorA,
              elevation: 3,
              child: ExpansionTile(title:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${formItems[i].name}",style: kTitle2.copyWith(color: kColorD),),
                  Text("City:${formItems[i].city}",style: kTitle2.copyWith(color: kColorD)),
                  Text("Recovered from Covid: ${formItems[i].recovered}",style: kBody2.copyWith(color: kColorD)),

                ],
              ),
                trailing: Text("${formItems[i].bloodGrp}",style: kBody1.copyWith(color: kColorD),),
// trailing: Column(
//   mainAxisAlignment: MainAxisAlignment.start,
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//
//   ],
// ),
children: _buildExpandableContent(i),
              ),
            ),
          separatorBuilder: (context, index) {
            return Divider(color: kColorD,thickness: 2,);
          },

        ):filteredItems.length>0?
        ListView.separated(
          shrinkWrap: true,
          itemCount: filteredItems.length,
          itemBuilder: (context, i)=>
              Card(
                color: kColorA,
                elevation: 3,
                child: ExpansionTile(title:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${filteredItems[i].name}",style: kTitle2.copyWith(color: kColorD),),
                    Text("City:${filteredItems[i].city}",style: kTitle2.copyWith(color: kColorD)),
                    Text("Recovered from Covid: ${filteredItems[i].recovered}",style: kBody2.copyWith(color: kColorD)),

                  ],
                ),
                  trailing: Text("${filteredItems[i].bloodGrp}",style: kBody1.copyWith(color: kColorD),),

                  children: _buildExpandableContent(i),
                ),
              ),
          separatorBuilder: (context, index) {
            return Divider(color: kColorD,thickness: 2,);
          },

        ):Center(child: Padding(
          padding: EdgeInsets.all(4),
          child:ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('asset/icon/nothing.svg',allowDrawingOutsideViewBox:true,height: MediaQuery.of(context).size.height * 0.4,width: MediaQuery.of(context).size.width * 0.4,),
                  Text("\n   Sorry Nothing found !",style:kTitle2.copyWith(color: kColorD),)
                ],
              ),
            ],
          ),
        ),),
      )
    );
  }
  _buildExpandableContent(int i) {
    List<Widget> columnContent = [];

    // for (String content in vehicle.contents)
      columnContent.add(
        new ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new SelectableText(
               "Mobile No.: ${formItems[i].mobile}", style:kBody1.copyWith(color: kColorD), toolbarOptions: ToolbarOptions(
                  copy: true,
                  selectAll: true,
                  cut: false,
                  paste: false
              ),),
            ],
          ),
          leading: new Icon(Icons.local_hospital,color: kColorD,),
        ),
      );

    return columnContent;
  }

}
