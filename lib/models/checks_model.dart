// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckModel {
  String? oid;
  String? sayim;
  String? malzeme;
  double? miktar;
  String? kaydeden;
  String? kayitZamani;
  String? firmaID;
  CheckModel({
    this.oid,
    this.sayim,
    this.malzeme,
    this.miktar,
    this.kaydeden,
    this.kayitZamani,
    this.firmaID,
  });

  

  CheckModel copyWith({
    String? oid,
    String? sayim,
    String? malzeme,
    double? miktar,
    String? kaydeden,
    String? kayitZamani,
    String? firmaID,
  }) {
    return CheckModel(
      oid: oid ?? this.oid,
      sayim: sayim ?? this.sayim,
      malzeme: malzeme ?? this.malzeme,
      miktar: miktar ?? this.miktar,
      kaydeden: kaydeden ?? this.kaydeden,
      kayitZamani: kayitZamani ?? this.kayitZamani,
      firmaID: firmaID ?? this.firmaID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'sayim': sayim,
      'malzeme': malzeme,
      'miktar': miktar,
      'kaydeden': kaydeden,
      'kayitZamani': kayitZamani,
      'firmaID': firmaID,
    };
  }

  factory CheckModel.fromMap(Map<String, dynamic> map) {
    return CheckModel(
      oid: map['Oid'] != null ? map['Oid'] as String : null,
      sayim: map['Sayim'] != null ? map['Sayim'] as String : null,
      malzeme: map['Malzeme'] != null ? map['Malzeme'] as String : null,
      miktar: map['Miktar'] != null ? map['Miktar'] as double : null,
      kaydeden: map['Kaydeden'] != null ? map['Kaydeden'] as String : null,
      kayitZamani: map['Kayit_Zamani'] != null ? map['Kayit_Zamani'] as String : null,
      firmaID: map['FirmaID'] != null ? map['FirmaID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckModel.fromJson(String source) => CheckModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckModel(oid: $oid, sayim: $sayim, malzeme: $malzeme, miktar: $miktar, kaydeden: $kaydeden, kayitZamani: $kayitZamani, firmaID: $firmaID)';
  }

  @override
  bool operator ==(covariant CheckModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.oid == oid &&
      other.sayim == sayim &&
      other.malzeme == malzeme &&
      other.miktar == miktar &&
      other.kaydeden == kaydeden &&
      other.kayitZamani == kayitZamani &&
      other.firmaID == firmaID;
  }

  @override
  int get hashCode {
    return oid.hashCode ^
      sayim.hashCode ^
      malzeme.hashCode ^
      miktar.hashCode ^
      kaydeden.hashCode ^
      kayitZamani.hashCode ^
      firmaID.hashCode;
  }
}
