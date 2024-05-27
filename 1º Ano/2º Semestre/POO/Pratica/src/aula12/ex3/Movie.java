package aula12.ex3;

public class Movie implements Comparable<Movie> {
    private String name;
    private double score;
    private String rating;
    private String genre;
    private int runningTime;

    public Movie(String name, double score, String rating, String genre, int runningTime) {
        this.name = name;
        this.score = score;
        this.rating = rating;
        this.genre = genre;
        this.runningTime = runningTime;
    }

    public String getName() {
        return name;
    }

    public double getScore() {
        return score;
    }

    public String getRating() {
        return rating;
    }

    public String getGenre() {
        return genre;
    }

    public int getRunningTime() {
        return runningTime;
    }

    @Override
    public int compareTo(Movie other) {
        return this.name.compareTo(other.name);
    }

    @Override
    public String toString() {
        return "Movie [name=" + name + ", score=" + score + ", rating=" + rating + ", genre=" + genre + ", runningTime=" + runningTime + "]";
    }
}
