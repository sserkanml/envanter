// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Member {
  String? oid;
  String? kullaniciAdi;
  String? kullaniciSifre;
  String? adiSoyadi;
  String? firmaId;
  String? kaydeden;
  String? kaytar;
  String? songirtar;
  int? yetki;
  int? aktifPasif;
  List<String>? kullaniciRolleri;
  Member({
    this.oid,
    this.kullaniciAdi,
    this.kullaniciSifre,
    this.adiSoyadi,
    this.firmaId,
    this.kaydeden,
    this.kaytar,
    this.songirtar,
    this.yetki,
    this.aktifPasif,
    this.kullaniciRolleri,
  });

  Member copyWith({
    String? oid,
    String? kullaniciAdi,
    String? kullaniciSifre,
    String? adiSoyadi,
    String? firmaId,
    String? kaydeden,
    String? kaytar,
    String? songirtar,
    int? yetki,
    int? aktifPasif,
    List<String>? kullaniciRolleri,
  }) {
    return Member(
      oid: oid ?? this.oid,
      kullaniciAdi: kullaniciAdi ?? this.kullaniciAdi,
      kullaniciSifre: kullaniciSifre ?? this.kullaniciSifre,
      adiSoyadi: adiSoyadi ?? this.adiSoyadi,
      firmaId: firmaId ?? this.firmaId,
      kaydeden: kaydeden ?? this.kaydeden,
      kaytar: kaytar ?? this.kaytar,
      songirtar: songirtar ?? this.songirtar,
      yetki: yetki ?? this.yetki,
      aktifPasif: aktifPasif ?? this.aktifPasif,
      kullaniciRolleri: kullaniciRolleri ?? this.kullaniciRolleri,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'kullaniciAdi': kullaniciAdi,
      'kullaniciSifre': kullaniciSifre,
      'adiSoyadi': adiSoyadi,
      'firmaId': firmaId,
      'kaydeden': kaydeden,
      'kaytar': kaytar,
      'songirtar': songirtar,
      'yetki': yetki,
      'aktifPasif': aktifPasif,
      'kullaniciRolleri': kullaniciRolleri,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      oid: map['oid'] != null ? map['oid'] as String : null,
      kullaniciAdi:
          map['kullaniciAdi'] != null ? map['kullaniciAdi'] as String : null,
      kullaniciSifre: map['kullaniciSifre'] != null
          ? map['kullaniciSifre'] as String
          : null,
      adiSoyadi: map['adiSoyadi'] != null ? map['adiSoyadi'] as String : null,
      firmaId: map['firmaId'] != null ? map['firmaId'] as String : null,
      kaydeden: map['kaydeden'] != null ? map['kaydeden'] as String : null,
      kaytar: map['kaytar'] != null ? map['kaytar'] as String : null,
      songirtar: map['songirtar'] != null ? map['songirtar'] as String : null,
      yetki: map['yetki'] != null ? map['yetki'] as int : null,
      aktifPasif: map['aktifPasif'] != null ? map['aktifPasif'] as int : null,
      kullaniciRolleri: map['kullaniciRolleri'] != null
          ? List<String>.from((map['kullaniciRolleri'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) =>
      Member.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Member(oid: $oid, kullaniciAdi: $kullaniciAdi, kullaniciSifre: $kullaniciSifre, adiSoyadi: $adiSoyadi, firmaId: $firmaId, kaydeden: $kaydeden, kaytar: $kaytar, songirtar: $songirtar, yetki: $yetki, aktifPasif: $aktifPasif, kullaniciRolleri: $kullaniciRolleri)';
  }

  @override
  bool operator ==(covariant Member other) {
    if (identical(this, other)) return true;

    return other.oid == oid &&
        other.kullaniciAdi == kullaniciAdi &&
        other.kullaniciSifre == kullaniciSifre &&
        other.adiSoyadi == adiSoyadi &&
        other.firmaId == firmaId &&
        other.kaydeden == kaydeden &&
        other.kaytar == kaytar &&
        other.songirtar == songirtar &&
        other.yetki == yetki &&
        other.aktifPasif == aktifPasif &&
        listEquals(other.kullaniciRolleri, kullaniciRolleri);
  }

  @override
  int get hashCode {
    return oid.hashCode ^
        kullaniciAdi.hashCode ^
        kullaniciSifre.hashCode ^
        adiSoyadi.hashCode ^
        firmaId.hashCode ^
        kaydeden.hashCode ^
        kaytar.hashCode ^
        songirtar.hashCode ^
        yetki.hashCode ^
        aktifPasif.hashCode ^
        kullaniciRolleri.hashCode;
  }
}
