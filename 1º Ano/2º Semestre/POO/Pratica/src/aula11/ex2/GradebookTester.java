package aula11.ex2;

import java.util.LinkedList;
import java.util.List;

public class GradebookTester {
    public static void main(String[] args) {
        Gradebook gradebook = new Gradebook();

        gradebook.load("alunos.txt");

        Student newStudent = new Student("Johny May", new LinkedList<>(List.of(10.0, 15.0, 19.0)));
        gradebook.addStudent(newStudent);

        gradebook.removeStudent("Jane Smith");

        double averageGrade = gradebook.calculateAverageGrade("John Doe");
        System.out.println("Average grade for John Doe: " + averageGrade);

        gradebook.printAllStudents();
    }
}
