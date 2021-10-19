class DoctorModel {
  final String? name;
  final String? imageName;
  final String? spesialis;
  final double? rating;
  final String? location;

  DoctorModel(
      this.name, this.imageName, this.spesialis, this.rating, this.location);
}

List<DoctorModel> mockDoctorModel = [
  DoctorModel("Dr. Wright", "assets/images/image_doctor1.png", "Dentist", 4.6,
      "Bandung"),
  DoctorModel(
      "Dr. Julia", "assets/images/image_doctor2.png", "Nurse", 4.4, "Jakarta"),
  DoctorModel("Dr. Sharane", "assets/images/image_doctor3.png", "Dermatology",
      4.5, "Margaasih, Bandung"),
  DoctorModel("Dr. Smith", "assets/images/image_doctor4.png", "Dentist", 5,
      "Cicaheum, Bandung"),
];
