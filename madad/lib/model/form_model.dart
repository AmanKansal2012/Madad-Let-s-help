import 'dart:convert';


class FormModel {
  String name;
  String gender;
  String age;
  String bloodGrp;
  String donor;
  String receipient;
  String recovered;
  String mobile;
  String otherMobileNo;
  String city;
  String address;
  String remarks;


  FormModel(this.name,this.gender,  this.age,this.bloodGrp,this.donor, this.receipient, this.recovered,this.mobile, this.otherMobileNo, this.city, this.address, this.remarks);

  factory FormModel.fromJson(dynamic json) {
    return FormModel("${json['name']}", "${json['gender']}","${json['age']}","${json['bloodGrp']}","${json['donor']}", "${json['receipient']}","${json['recovered']}","${json['mobile']}","${json['otherMobileNo']}","${json['city']}", "${json['address']}",
        "${json['remarks']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'gender': gender,
    'age': age,
    'bloodGrp': bloodGrp,
    'donor': donor,
    'receipient': receipient,
    'recovered': recovered,
    'mobile': mobile,
    'otherMobileNo': otherMobileNo,
    'city': city,
    'address': address,
    'remarks': remarks,
  };
  // Method to make GET parameters.
  String toParams() =>
      "?name=$name&gender=$gender&age=$age&bloodGrp=$bloodGrp&donor=$donor&receipient=$receipient&recovered=$recovered&mobile=$mobile&otherMobileNo=$otherMobileNo&city=$city&address=$address&remarks=$remarks";


}
