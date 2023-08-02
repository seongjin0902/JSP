<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	
}

body {
	width: 100%;
	height: 100%;
	boader: 1px solid black;
}

.wrapper {
	
}

.wrapper>header {
	
}

.wrapper>header>.top--header {
	
}

.wrapper>header>nav {
	
}

.wrapper>main {
	
}

.wrapper>footer {
	
}
</style>
</head>
<script>
        function editRow(boardNumber, contents) {
            var row = document.getElementById('row-' + boardNumber);
            var cells = row.getElementsByTagName('td');

            for (var i = 2; i < cells.length - 1; i++) {
                var cellValue = cells[i].innerText;
                cells[i].innerHTML = '<input type="text" name="contents-' + boardNumber + '" value="' + cellValue + '" />';
            }

            var editButton = row.getElementsByClassName('edit-button')[0];
            var saveButton = row.getElementsByClassName('save-button')[0];
            editButton.style.display = 'none';
            saveButton.style.display = 'block';
        }

        function saveRow(boardNumber) {
            var row = document.getElementById('row-' + boardNumber);
            var inputs = row.getElementsByTagName('input');

            var formData = new FormData();
            formData.append('boardNumber', boardNumber);
            for (var i = 0; i < inputs.length; i++) {
                formData.append(inputs[i].name, inputs[i].value);
            }

            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'pageedit.do', true);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    // 서버에서 처리가 성공적으로 완료됐을 때 실행할 로직
                    console.log(xhr.responseText);
                    var response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        for (var i = 2; i < inputs.length; i++) {
                            var cellValue = inputs[i].value;
                            cells[i].innerHTML = cellValue;
                        }
                        var editButton = row.getElementsByClassName('edit-button')[0];
                        var saveButton = row.getElementsByClassName('save-button')[0];
                        editButton.style.display = 'block';
                        saveButton.style.display = 'none';
                    } else {
                        alert('수정에 실패했습니다.');
                    }
                }
            };
            xhr.send(formData);
        }
    </script>
</head>
<body>
    <div class="wrapper">
        <header>
            <!-- 이전 header 영역... -->
        </header>
        <main>
            <section>
                <div class="show--block">
                    <!-- 이전 로그인한 회원 정보 영역... -->
                    <h2>작성한 게시물 목록</h2>
                    <div>
                        <c:if test="${not empty posts}">
                            <table border="1">
                                <tr>
                                    <th>글 번호</th>
                                    <th>작성자</th>
                                    <th>내용</th>
                                    <th>작성날짜</th>
                                    <th>조회수</th>
                                    <th>좋아요</th>
                                </tr>
                                <c:forEach items="${posts}" var="board">
                                    <tr id="row-${board.number}">
                                        <td>${board.number}</td>
                                        <td>${board.id}</td>
                                        <td>${board.contents}</td>
                                        <td>${board.date}</td>
                                        <td>${board.hits}</td>
                                        <td>${board.like}</td>
                                        <td>
                                            <button class="edit-button" onclick="editRow('${board.number}', '${board.contents}')">수정</button>
                                            <button class="save-button" style="display:none;" onclick="saveRow('${board.number}')">저장</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:if>
                        <c:if test="${empty posts}">
                            <!-- 작성한 게시물이 없을 때의 처리... -->
                        </c:if>
                    </div>
                </div>
            </section>
            <!-- 이전 section 영역... -->
        </main>
        <footer></footer>
    </div>
</body>
</html>