class OnboardingContent {
  String image;
  String title;
  String discription;

  OnboardingContent({required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: "العثور على أفضل مكان  للبقاء في سعر جيد",
      image: 'assets/images/property_images/image1.png',
      discription: "احصل على مشترين معتمدين لممتلكاتك من خلال لوحة تحكم سهلة الإدارة!"
  ),
  OnboardingContent(
      title: "بيع الممتلكات الخاصة بك بسرعة بنقرة واحدة فقط",
      image: 'assets/images/property_images/first_image.png',
      discription: "احصل على مشترين معتمدين لممتلكاتك من خلال لوحة تحكم سهلة الإدارة! "
  ),
  OnboardingContent(
      title: 'ابحث عن الخيار الأمثل لمنزلك المستقبلي',
      image: 'assets/images/property_images/image3.png',
      discription: "احصل على مشترين معتمدين لممتلكاتك من خلال لوحة تحكم سهلة الإدارة!"
  ),
];