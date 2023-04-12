class Course {
  String courseName;
  String courseDescription;
  String courseStatus;
  String courseImage;
  List<String> imagesBunch = [];

  Course(this.courseName, this.courseDescription, this.courseImage,
      this.courseStatus, this.imagesBunch);
}

List<Course> CourseDetail = [
  Course(
      "Flutter",
      "In this course you will learn mobile app development using Flutter",
      "",
      "20 SECTION - 10 hours",
      ['./images/pic1.jpg', './images/pic2.jpg', './images/pic2.jpg']),
];
