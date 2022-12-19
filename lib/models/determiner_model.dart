// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Determiner {
  String? oid;
  String? adi;
  String? firma;
  Determiner({
    this.oid,
    this.adi,
    this.firma,
  });

 

  Determiner copyWith({
    String? oid,
    String? adi,
    String? firma,
  }) {
    return Determiner(
      oid: oid ?? this.oid,
      adi: adi ?? this.adi,
      firma: firma ?? this.firma,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'adi': adi,
      'firma': firma,
    };
  }

  factory Determiner.fromMap(Map<String, dynamic> map) {
    return Determiner(
      oid: map['Oid'] != null ? map['Oid'] as String : null,
      adi: map['Adi'] != null ? map['Adi'] as String : null,
      firma: map['Firma'] != null ? map['Firma'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Determiner.fromJson(String source) => Determiner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Determiner(oid: $oid, adi: $adi, firma: $firma)';

  @override
  bool operator ==(covariant Determiner other) {
    if (identical(this, other)) return true;
  
    return 
      other.oid == oid &&
      other.adi == adi &&
      other.firma == firma;
  }

  @override
  int get hashCode => oid.hashCode ^ adi.hashCode ^ firma.hashCode;
}
