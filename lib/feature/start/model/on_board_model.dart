class OnboardModel {
  final String file;

  final String title;
  OnboardModel({
    required this.file,
    required this.title,
  });
}

List<OnboardModel> onboardData = [
  OnboardModel(file: "onboard1.svg", title: "Envanter Takipi Kolaylaştıran"),
  OnboardModel(
      file: "onboard2.svg",
      title: "Tara & QR Kodlarla ve Barcode ile Bağlantı Kur"),
  OnboardModel(
      file: "onboard3.svg",
      title: "Takımınla,İşcilerinle ve Müşterilerinle Paylaş"),
  OnboardModel(
      file: "onboard4.svg",
      title: "Tara & QR Kodlarla ve Barcode ile Bağlantı Kur"),
  OnboardModel(file: "onboard5.svg", title: "Ara,Filtrele ve Çıkart"),
];
