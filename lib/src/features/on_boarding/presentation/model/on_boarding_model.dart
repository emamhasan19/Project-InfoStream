class OnBoardingModel {
  OnBoardingModel({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  static List<OnBoardingModel> fetchAllData() => [
        OnBoardingModel(
          title: 'Express Yourself Freely',
          description:
              'Share your thoughts and creativity with the world. Post updates, photos and videos to express yourself and showcase your unique personality. Connect with others who appreciate your authentic self.',
          image: 'assets/images/image1.svg',
        ),
        OnBoardingModel(
          title: 'Stay Informed and Inspired',
          description:
              'Stay up-to-date with the latest news, stories, and trends. Follow your favorite pages and news sources to get curated content that keeps you informed and inspired.',
          image: 'assets/images/image1.svg',
        ),
        OnBoardingModel(
          title: 'Connect with Friends and Family',
          description:
              'Stay connected with your loved ones and build meaningful relationships. Share updates, photos, and videos, and engage in conversations with friends and family members.',
          image: 'assets/images/image1.svg',
        ),
      ];
}
