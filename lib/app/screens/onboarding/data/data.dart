
class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/icons/personaldetails.svg");
  sliderModel.setTitle('Record Personal Details');
  sliderModel.setDesc("Discover identity services with ease");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/icons/otherrecords.svg");
  sliderModel.setTitle('Track your records');
  sliderModel.setDesc("Discover identity servceices with ease");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/icons/safe.svg");
  sliderModel.setTitle('Synchronise your data');
  sliderModel.setDesc("Discover identy servceices with ease");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

//4
  sliderModel.setImageAssetPath("assets/icons/verify.svg");
  sliderModel.setTitle('Verify Once');
  sliderModel.setDesc("Discover identity services with ease");
  slides.add(sliderModel);
  sliderModel = new SliderModel();

//5
  sliderModel.setImageAssetPath("assets/icons/identify.svg");
  sliderModel.setTitle('Identify Everywhere');
  sliderModel.setDesc("Discover identity services with ease");
  slides.add(sliderModel);
  sliderModel = new SliderModel();
  return slides;
}
