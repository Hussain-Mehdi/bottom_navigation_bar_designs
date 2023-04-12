class Course {
  String courseName;
  String courseDescription;
  String courseStatus;
  String courseImage;
  List<String> imagesBunch = [];

  Course(this.courseName, this.courseDescription, this.courseImage,
      this.courseStatus, this.imagesBunch);
}

List<Course> courseDetail = [
  Course(
      "Flutter",
      "In this course you will learn mobile app development using Flutter",
      "./images/circle.png",
      "20 SECTION - 10 hours",
      ['./images/pic1.jpg', './images/pic2.jpg', './images/pic3.jpg']),
  Course(
      "React",
      "In this course you will learn Web app development using Flutter",
      "./images/circle.png",
      "20 SECTION - 10 hours",
      ['./images/pic1.jpg', './images/pic2.jpg', './images/pic3.jpg']),
  Course(
      "C# (C-Sharp)",
      "In this course you will learn software development using Flutter",
      "./images/circle.png",
      "20 SECTION - 10 hours",
      ['./images/pic1.jpg', './images/pic2.jpg', './images/pic3.jpg']),
  Course(
      "HTML/CSS",
      "In this course you will learn website development using Flutter",
      "./images/circle.png",
      "20 SECTION - 10 hours",
      ['./images/pic1.jpg', './images/pic2.jpg', './images/pic3.jpg']),
];
