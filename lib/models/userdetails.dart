class UserDetails {
  String? apparel;
  String? collar;
  String? sleeve;
  String? cuff;
  String? placket;
  String? pocket;
  String? yoke;
  String? pleat;
  String? hem;
  String? seam;
  String? button;
  String? body;
  String? chest;
  String? waist;
  String? hip;
  String? thigh;
  String? sleeveLen;
  String? legLen;
  String? fabric;

  UserDetails({
    this.apparel,
    this.collar,
    this.sleeve,
    this.cuff,
    this.placket,
    this.pocket,
    this.yoke,
    this.pleat,
    this.hem,
    this.seam,
    this.button,
    this.body,
    this.chest,
    this.waist,
    this.hip,
    this.thigh,
    this.sleeveLen,
    this.legLen,
    this.fabric,
  });

  UserDetails copyWith({
    String? apparel,
    String? collar,
    String? sleeve,
    String? cuff,
    String? placket,
    String? pocket,
    String? yoke,
    String? pleat,
    String? hem,
    String? seam,
    String? button,
    String? body,
    String? chest,
    String? waist,
    String? hip,
    String? thigh,
    String? sleeveLen,
    String? legLen,
    String? fabric,
  }) {
    return UserDetails(
      apparel: apparel ?? this.apparel,
      collar: collar ?? this.collar,
      sleeve: sleeve ?? this.sleeve,
      cuff: cuff ?? this.cuff,
      placket: placket ?? this.placket,
      pocket: pocket ?? this.pocket,
      yoke: yoke ?? this.yoke,
      pleat: pleat ?? this.pleat,
      hem: hem ?? this.hem,
      seam: seam ?? this.seam,
      button: button ?? this.button,
      body: body ?? this.body,
      chest: chest ?? this.chest,
      waist: waist ?? this.waist,
      hip: hip ?? this.hip,
      thigh: thigh ?? this.thigh,
      sleeveLen: sleeveLen ?? this.sleeveLen,
      legLen: legLen ?? this.legLen,
      fabric: fabric ?? this.fabric,
    );
  }
}
