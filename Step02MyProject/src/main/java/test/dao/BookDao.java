// src/main/java/test/dao/BookDao.java
package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.dto.BookDto;
import test.util.DbcpBean;

public class BookDao {

    // 싱글톤 패턴 (있다면 그대로 사용)
    private static BookDao dao;
    private BookDao() {}
    public static BookDao getInstance() {
        if (dao == null) {
            dao = new BookDao();
        }
        return dao;
    }

    // ⭐⭐⭐ 이 부분이 누락되었습니다! 이 메서드를 BookDao 클래스 안에 추가해야 합니다. ⭐⭐⭐
    // num 에 해당하는 도서 하나의 정보를 리턴하는 메소드
    public BookDto getByNum(int num) {
        BookDto dto = null; 
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn();
            
            // SQL 쿼리의 컬럼 이름이 DB 테이블과 정확히 일치해야 합니다.
            String sql = "SELECT num, title, author, publisher FROM book WHERE num = ?"; 
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num); 

            rs = pstmt.executeQuery();

            if (rs.next()) { 
                dto = new BookDto();
                dto.setNum(rs.getInt("num"));
                dto.setTitle(rs.getString("title"));
                dto.setAuthor(rs.getString("author"));
                dto.setPublisher(rs.getString("publisher"));
            }

        } catch (Exception e) {
            System.err.println("BookDao.getByNum() 메소드 오류 발생:");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dto;
    }
    // ⭐⭐⭐ getByNum 메서드 끝 ⭐⭐⭐


    // 모든 도서 목록을 리턴하는 메소드 (기존 코드)
    public List<BookDto> selectAll() {
        // ... (기존 selectAll() 코드) ...
        List<BookDto> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = new DbcpBean().getConn(); 
            String sql = "SELECT num, title, author, publisher FROM book ORDER BY num ASC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BookDto dto = new BookDto();
                dto.setNum(rs.getInt("num"));
                dto.setTitle(rs.getString("title"));
                dto.setAuthor(rs.getString("author"));
                dto.setPublisher(rs.getString("publisher"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {}
        }
        return list;
    }

    // 도서 추가 (insert) 메소드 (기존 코드)
    public boolean insert(BookDto dto) {
        // ... (기존 insert() 코드) ...
        Connection conn = null;
        PreparedStatement pstmt = null;
        int flag = 0; 
        try {
            conn = new DbcpBean().getConn();
            String sql = "INSERT INTO book (title, author, publisher) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getAuthor());
            pstmt.setString(3, dto.getPublisher());
            flag = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {}
        }
        return flag > 0 ? true : false;
    }
}