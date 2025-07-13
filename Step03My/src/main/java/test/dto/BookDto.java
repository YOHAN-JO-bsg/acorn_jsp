package test.dto;

public class BookDto {
    private int num;        // Book ID/Number
    private String title;   // Book Title
    private String author;  // Book Author
    private String publisher; // Book Publisher

    // Default constructor (important for JavaBeans)
    public BookDto() {}

    // Constructor with all fields (optional, but convenient)
    public BookDto(int num, String title, String author, String publisher) {
        this.num = num;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
    }

    // Getter and Setter methods for all fields
    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
}