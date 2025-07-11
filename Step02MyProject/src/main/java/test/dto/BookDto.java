// src/main/java/test/dto/BookDto.java
package test.dto;

public class BookDto {
    private int num;        // 도서 번호
    private String title;   // 도서 제목
    private String author;  // 저자
    private String publisher; // 출판사

    // 기본 생성자
    public BookDto() {}

    // 모든 필드를 받는 생성자 (선택 사항)
    public BookDto(int num, String title, String author, String publisher) {
        this.num = num;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
    }

    // Getter 와 Setter 메소드
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