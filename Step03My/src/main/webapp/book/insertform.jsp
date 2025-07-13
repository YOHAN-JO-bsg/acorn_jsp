<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/book/insertform.jsp</title>
<style>
    body {
        font-family: sans-serif; /* 기본 산세리프 폰트 */
        background-color: #f0f2f5;
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    
    .container {
        max-width: 500px; /* 컨테이너 너비를 적절하게 조절 */
        width: 90%; /* 모바일 환경 고려 */
        padding: 40px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1); /* 그림자 효과 강화 */
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        font-weight: 700;
    }

    form div {
        margin-bottom: 20px; /* 폼 필드 간 간격 */
    }

    label {
        display: block; /* 라벨을 블록 요소로 만들어 줄바꿈 */
        font-size: 14px;
        font-weight: bold;
        color: #555;
        margin-bottom: 8px;
        text-align: left; /* 추가: 라벨 텍스트를 중앙 정렬 */
    }

    input[type="text"] {
        width: calc(100% - 24px); /* 패딩 값 고려한 너비 */
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        box-sizing: border-box;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 8px rgba(52, 152, 219, 0.3); /* 포커스 시 그림자 효과 */
        outline: none; /* 포커스 테두리 제거 */
    }

    /* 버튼 스타일링 */
    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
    }

    .button-group a, button[type="submit"] {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        text-align: center; /* 링크 텍스트 중앙 정렬 */
        text-decoration: none; /* 링크 밑줄 제거 */
    }
    
    button[type="submit"] {
        background-color: #2ecc71; /* 추가 버튼 색상 */
        color: #fff;
        margin-right: 10px;
    }

    button[type="submit"]:hover {
        background-color: #27ae60;
        transform: translateY(-2px); /* 호버 시 약간 위로 이동 */
    }

    .button-group a {
        background-color: #e74c3c; /* 취소 버튼 색상 */
        color: #fff;
        margin-left: 10px;
    }

    .button-group a:hover {
        background-color: #c0392b;
        transform: translateY(-2px); /* 호버 시 약간 위로 이동 */
    }

    /* 링크 스타일 (폼 아래에 링크를 추가할 경우) */
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #3498db;
        text-decoration: none;
    }
    
    .back-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class = "container">
        <h1>새 도서 추가 양식</h1>
        <form action="${pageContext.request.contextPath }/book/insert.jsp" method = "post">
            <div>
                <label for="title">제목</label>
                <input type="text" name = "title" id = "title" required />
            </div>
            
            <div>
                <label for="author">저자</label>
                <input type="text" name = "author" id = "author" required />
            </div>
            
            <div>
                <label for="publisher">출판사</label>
                <input type="text" name = "publisher" id = "publisher" required />
            </div>
            
            <div class="button-group">
                <button type = "submit">추가</button>
                <a href="${pageContext.request.contextPath }/book/list.jsp">취소</a>
            </div>
            
        </form>
        <a href="${pageContext.request.contextPath }/book/list.jsp" class="back-link">도서 목록으로 돌아가기</a>
    </div>
</body>
</html>