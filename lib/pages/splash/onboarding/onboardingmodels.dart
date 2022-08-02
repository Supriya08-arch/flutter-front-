class onboardingModel {
  final String? imagePath;
  final String? title;
  final String? desc;

  onboardingModel({
    this.imagePath,
    this.title,
    this.desc,
  });

  static List<onboardingModel> data = [
    onboardingModel(
        imagePath: 'asset/images/onboard13.jpg',
        title: 'Smart Shopping, Smart You!',
        desc: 'Always check products and seller\n rating before buying'),
    onboardingModel(
        imagePath: 'asset/images/onboard3.webp',
        title: 'Secure Payment',
        desc:
            'Variety of payment options including\n cash on delivery and bank cards'),
    onboardingModel(
        imagePath: 'asset/images/onboard2.jpg',
        title: 'Fast Delivery',
        desc:
            'Discover the best producrs from GUITAR SHOP\n and fast deliver to your doorstep'),
  ];
}
