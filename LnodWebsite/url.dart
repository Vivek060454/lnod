import '../main.dart';

String urldomain='https://lnodcommunities.com/';
class Url{
  String home='${urldomain}';
  String aboutwlfa='${urldomain}about-wlfa/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String aboutGoverningCouncil='${urldomain}about-governing-council/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String aboutLNOD='${urldomain}about-lnod/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String aboutus='${urldomain}about-us-2/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String faq='${urldomain}faqs/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String asyncronousELearning='${urldomain}asynchronous-e-learning/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String lnodAcademy='${urldomain}lnod-academy-app/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String  lnofGallery= '${urldomain}lnod-gallery-app/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String upcomingEvents='${urldomain}upcoming-events/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}&rest_route=/simple-jwt-login/v1/autologin&JWT="${appStore.token.toString()}"&redirectUrl=${urldomain}upcoming-events';
  String ExpertAdvisory='${urldomain}expert-advisory-services-app/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String TheLearningUniverse='${urldomain}the-learning-universe/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String TopFeaturesVideos='${urldomain}top-featured-videos/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String WhosReadingWhat='${urldomain}whos-reading-what/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String Blog='${urldomain}blog/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String lnodCommunititesOf='${urldomain}lnod-communities-of-practice/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String learningresource='${urldomain}learning-resources-app/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String submitblog='${urldomain}/post-your-own-blog/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String registerhereweb='${urldomain}/promote-your-product/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String subgroup='${urldomain}/request-a-sub-group/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String podcast='${urldomain}/podcasts/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String volunter='${urldomain}/volunteer-with-us-app/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';
  String corporatemembership='${urldomain}/corporate-membership/?inapp=true&${appStore.isDarkMode?'darkmode=true':""}';

}