package aula11.ex2;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedList;
import java.util.List;

public class Gradebook {
    private final IGradeCalculator gradeCalculator = new SimpleGradeCalculator();

    private List<Student> students = new LinkedList<>();

    public void load(String filename) {
        LinkedList<String> lines = new LinkedList<>();
        Path path = Paths.get(filename);
        try {
            lines = new LinkedList<>(Files.readAllLines(path));
        } catch (IOException e) {
            System.out.printf("Certifique-se que o ficheiro \"%s\" está na raiz da pasta do projeto", path);
            System.exit(1);
        }

        for (String line : lines) {
            String[] data = line.split("\\|");
            String name = data[0];
            LinkedList<Double> grades = new LinkedList<>();
            for (int i = 1; i < data.length; i++) {
                grades.add(Double.parseDouble(data[i]));
            }
            students.add(new Student(name, grades));
        }
    }

    public void addStudent(Student newStudent) {
        students.add(newStudent);
    }

    public void removeStudent(String name) {
        students.removeIf(student -> student.getName().equals(name));
    }

    public Student getStudent(String name) {
        return students.stream().filter(student -> student.getName().equals(name)).findFirst().orElse(null);
    }

    public double calculateAverageGrade(String name) {
        return gradeCalculator.calculate(getStudent(name).getGrades());
    }

    public void printAllStudents() {
        for (Student student : students)
            System.out.printf("Nome: %s%nNota Final: %.2f%n%n", student.getName(), gradeCalculator.calculate(student.getGrades()));
    }
}