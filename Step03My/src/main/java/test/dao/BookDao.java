package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.dto.BookDto; 
import test.util.DbcpBean;

/*
 * Data Access Object 객체를 생성할 클래스 정의하기
 * - DB 에 insert, update, delete, select 작업을 하는 코드를 작성한다.
 */

public class BookDao { // 클래스 이름 MemberDao -> BookDao 로 변경

    // Singleton pattern for DAO (common practice)
    private static BookDao dao; 
    private BookDao() {} 
    public static BookDao getInstance() { 
        if (dao == null) {
            dao = new BookDao(); 
        }
        return dao;
    }

    // 도서번호를 이용해서 도서 1권의 정보를 리턴하는 메소드
    public BookDto getByNum(int num) { 
        BookDto dto = null; 

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn();
            // 실행할 sql문 
            String sql = """
                SELECT title, author, publisher
                FROM book
                WHERE num=?
            """;
            pstmt = conn.prepareStatement(sql);
            // ? 에 값 바인딩
            pstmt.setInt(1, num);
            // select 문 실행하고 결과를 ResultSet 으로 받아온다
            rs = pstmt.executeQuery();
            //반복문 돌면서 ResultSet 에 담긴 데이터를 추출해서 리턴해줄 객체에 담는다
            if (rs.next()) { // while 대신 if 로 변경 (단일 레코드 조회이므로)
                //객체 생성후
                dto = new BookDto(); // MemberDto -> BookDto 로 변경
                // 도서 한권의 정보를 담는다
                dto.setNum(num); // 번호는 매개변수에 있는 내용을 담으면 된다.
                dto.setTitle(rs.getString("title")); // name -> title 로 변경
                dto.setAuthor(rs.getString("author")); // addr -> author 로 변경
                dto.setPublisher(rs.getString("publisher")); // publisher 추가
            }

        } catch (Exception e) {
            System.err.println("BookDao.getByNum() method error:"); // 에러 로그에 메서드명 추가
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리 추가
            }
        }
        return dto;
    }

    // 도서 전체 목록을 select 해서 List 에 담아서 리턴하는 메소드
    public List<BookDto> selectAll() { // MemberDto -> BookDto 로 변경
        // 도서 정보를 누적시킬 ArrayList 객체 미리 준비하기
        List<BookDto> list = new ArrayList<>(); // MemberDto -> BookDto 로 변경

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn();
            // 실행할 sql문 - member 테이블 대신 book 테이블 사용, name, addr 대신 title, author, publisher 사용
            String sql = """
                SELECT num, title, author, publisher
                FROM book
                ORDER BY num ASC
            """;
            pstmt = conn.prepareStatement(sql);
            // select 문 실행하고 결과를 ResultSet 으로 받아온다
            rs = pstmt.executeQuery();
            //반복문 돌면서 ResultSet 에 담긴 데이터를 추출해서 리턴해줄 객체에 담는다
            while (rs.next()) {
                //커서가 위치한 곳의 도서 정보를 저장할 BookDto 객체 생성
                BookDto dto = new BookDto(); // MemberDto -> BookDto 로 변경
                dto.setNum(rs.getInt("num"));
                dto.setTitle(rs.getString("title")); // name -> title 로 변경
                dto.setAuthor(rs.getString("author")); // addr -> author 로 변경
                dto.setPublisher(rs.getString("publisher")); // publisher 추가
                // 도서 한권의 정보가 담긴 새로운 BookDto 객체의 참조값을 List 에 누적시키기
                list.add(dto);
            }
        } catch (Exception e) {
            System.err.println("BookDao.selectAll() method error:"); // 에러 로그에 메서드명 추가
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리 추가
            }
        }

        return list;
    }

    // 도서 한권의 정보를 DB 에서 수정하고 성공여부를 리턴하는 메소드
    public boolean update(BookDto dto) { // MemberDto -> BookDto 로 변경
        Connection conn = null;
        PreparedStatement pstmt = null;
        //변화된 row 의 갯수를 담을 변수 선언하고 0으로 초기화
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            // SQL 문 - member 테이블 대신 book 테이블 사용, name, addr 대신 title, author, publisher 사용
            String sql = """
                UPDATE book
                SET title=?, author=?, publisher=?
                WHERE num=?
            """;
            pstmt = conn.prepareStatement(sql);
            // ? 에 순서대로 필요한 값 바인딩
            pstmt.setString(1, dto.getTitle()); // name -> title 로 변경
            pstmt.setString(2, dto.getAuthor()); // addr -> author 로 변경
            pstmt.setString(3, dto.getPublisher()); // publisher 추가
            pstmt.setInt(4, dto.getNum());
            // sql 문 실행하고 변화된(추가된, 수정된, 삭제된) row 의 갯수 리턴받기
            rowCount = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("BookDao.update() method error:"); // 에러 로그에 메서드명 추가
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리 추가
            }
        }

        //변화된 rowCount 값을 조사해서 작업의 성공 여부를 알아 낼수 있다.
        return rowCount > 0;
    }

    // 도서 한권의 정보를 DB 에서 삭제하고 성공여부를 리턴하는 메소드
    public boolean deleteByNum(int num) { // 메소드 이름 delete -> deleteByNum 유지 (호출하는 곳에서 일관성 유지)
        Connection conn = null;
        PreparedStatement pstmt = null;
        //변화된 row 의 갯수를 담을 변수 선언하고 0으로 초기화
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            // SQL 문 - member 테이블 대신 book 테이블 사용
            String sql = """
                DELETE FROM book
                WHERE num=?
            """;
            pstmt = conn.prepareStatement(sql);
            // ? 에 순서대로 필요한 값 바인딩
            pstmt.setInt(1, num);
            // sql 문 실행하고 변화된(추가된, 수정된, 삭제된) row 의 갯수 리턴받기
            rowCount = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("BookDao.deleteByNum() method error:"); // 에러 로그에 메서드명 추가
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리 추가
            }
        }

        return rowCount > 0;
    }

    // 도서 한권의 정보를 DB 에 저장하고 성공여부를 리턴하는 메소드
    public boolean insert(BookDto dto) { // MemberDto -> BookDto 로 변경
        Connection conn = null;
        PreparedStatement pstmt = null;
        //변화된 row 의 갯수를 담을 변수 선언하고 0으로 초기화
        int rowCount = 0;
        try {
            conn = new DbcpBean().getConn();
            // SQL 문 - member 테이블 대신 book 테이블 사용, name, addr 대신 title, author, publisher 사용
            // 시퀀스도 member_seq -> book_seq 로 변경
            String sql = """
                INSERT INTO book
                (num, title, author, publisher)
                VALUES(book_seq.NEXTVAL, ?, ?, ?)
            """;
            pstmt = conn.prepareStatement(sql);
            // ? 에 순서대로 필요한 값 바인딩
            pstmt.setString(1, dto.getTitle()); // name -> title 로 변경
            pstmt.setString(2, dto.getAuthor()); // addr -> author 로 변경
            pstmt.setString(3, dto.getPublisher()); // publisher 추가
            // sql 문 실행하고 변화된(추가된, 수정된, 삭제된) row 의 갯수 리턴받기
            rowCount = pstmt.executeUpdate();
        } catch (Exception e) {
            System.err.println("BookDao.insert() method error:"); // 에러 로그에 메서드명 추가
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace(); // 예외 처리 추가
            }
        }

        return rowCount > 0;
    }
}