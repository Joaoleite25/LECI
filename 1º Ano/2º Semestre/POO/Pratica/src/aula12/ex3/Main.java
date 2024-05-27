package aula12.ex3;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        List<Movie> movies = new ArrayList<>();
        try {
            File file = new File("Pratica/src/aula12/movies.txt");
            Scanner scanner = new Scanner(file);

            if (scanner.hasNextLine()) {
                scanner.nextLine();
            }

            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split("\t");

                String name = parts[0];
                double score = Double.parseDouble(parts[1]);
                String rating = parts[2];
                String genre = parts[3];
                int runningTime = Integer.parseInt(parts[4]);

                movies.add(new Movie(name, score, rating, genre, runningTime));
            }

            scanner.close();
        } catch (FileNotFoundException e) {
            System.out.println("Erro ao ler o arquivo: " + e.getMessage());
        }

        Collections.sort(movies, new Comparator<Movie>() {
            @Override
            public int compare(Movie m1, Movie m2) {
                if (m1.getScore() != m2.getScore()) {
                    return Double.compare(m2.getScore(), m1.getScore());
                } else {
                    return Integer.compare(m1.getRunningTime(), m2.getRunningTime());
                }
            }
        });

        for (Movie movie : movies) {
            System.out.println(movie);
        }

        Scanner input = new Scanner(System.in);
        System.out.println("Enter the genre: ");
        String userGenre = input.nextLine();

        try {
            PrintWriter writer = new PrintWriter("Pratica/src/aula12/myselection.txt", "UTF-8");

            for (Movie movie : movies) {
                if (movie.getScore() > 60 && movie.getGenre().equalsIgnoreCase(userGenre)) {
                    writer.println(movie);
                }
            }

            writer.close();
        } catch (IOException e) {
            System.out.println("An error occurred while writing to the file: " + e.getMessage());
        }

        input.close();
    }
}