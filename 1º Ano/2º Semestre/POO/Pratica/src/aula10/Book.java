package aula10;

import java.util.Objects;

public class Book {
    private String title;
    private String author;
    private int year;

    public Book(String title, String author, int year) {
        this.setTitle(title);
        this.setAuthor(author);
        this.setYear(year);
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getYear() {
        return this.year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return String.format("%s, %s, %d", this.getTitle(), this.getAuthor(), this.getYear());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getTitle(), getAuthor(), getYear());
    }
}
