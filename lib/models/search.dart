import 'package:pharma/models/category/category_model.dart';
import 'package:pharma/models/medicine.dart';

/// data : []
/// messag : "you search in product"

class Search {
  Search({
      List<dynamic>? data, 
      String? messag,
    String? name
  }){
    _data = data;
    _messag = messag;
    _name=name;

}

  Search.fromJson(dynamic json) {

    _messag = json['messag'];
      _data=json['data'];

  }
  List<dynamic>? _data;
  String? _messag;
  String? _name;
Search copyWith({  List<dynamic>? data,
  String? messag,
}) => Search(  data: data ?? _data,
  messag: messag ?? _messag,
);
  List<dynamic>? get data => _data;
  String? get messag => _messag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['messag'] = _messag;
    map['name'] = _name;
    return map;
  }

}