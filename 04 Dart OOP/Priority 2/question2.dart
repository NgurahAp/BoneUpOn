class Course {
  String judul;
  String deskripsi;

  Course(
    this.judul,
    this.deskripsi,
  );
}

class Student {
  String nama;
  int kelas;
  List<Course> courses;

  Student(
    this.nama,
    this.kelas,
    this.courses,
  );

  void tambahCourse(Course tambah) {
    courses.add(tambah);
  }

  void hapusCourse(Course hapus) {
    courses.remove(hapus);
  }

  void lihatCourses() {
    print("Berikut daftar course yang dimiliki $nama:");
    for (Course course in courses) {
      print('Judul : ${course.judul} \n Deskripsi : ${course.deskripsi}');
    }
  }
}

void main() {
  // MEMBUAT DAN MELIHAT SELURUH COURSE
  Course course1 = Course("IPA", "Ilmu Pengetahuan Alam");
  List<Course> courses = [course1];
  Student student = Student("Arya", 10, courses);
  // student.lihatCourses();

  // Menambah
  Course course2 = Course("IPS", "Ilmu Pengetahuan Sosial");
  student.tambahCourse(course2);
  // student.lihatCourses();

  // MENGHAPUS
  student.hapusCourse(course1);
  student.lihatCourses();
}
