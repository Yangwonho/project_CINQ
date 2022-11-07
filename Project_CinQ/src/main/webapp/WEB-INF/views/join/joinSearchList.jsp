
<!-- join/joinSearchListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/listNum.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/script/css/search.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script type="text/javascript">

</script>
<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
</style>
</head>
<body>
    <c:import url="../default/header.jsp"/>
    <input type="hidden" value="${joinList}">
    <!-- <div align="center"> -->
    <div class="main">
    <br>
    <div class="subject" >
		<b>등록된 구인 목록</b> &ensp; Join List
	</div>
    	<form action="joinSearchList" method="post" enctype='multipart/form-data'>
    		<div class="search-box">
        		<input type="text" class="search-txt" name="title" placeholder="글 제목으로 검색"> 
	        	<a class="search-btn" href="#"><i class="fas fa-search"></i></a>
			</div>
		</form>
    <br><br>
    <!-- table 부분 -->
    <div class="list">
    <table class="Table">
    	<tr height="80px"></tr>
        <c:if test="${joinSearchList.size() == 0}">
        	<tr>
        		<th colspan="2">검색하신 내용과 일치하는 제목이 없습니다</th>
        	</tr>   
        </c:if>
        <c:forEach var="dto_s" items="${joinSearchList}">
            <tr height="100px">
            	<td id="content_loc">${dto_s.loc_sep_name}</td>
            	<c:if test="${dto_s.image == 'nan'}">
                    <td id="content_image" rowspan="5">
                        <b>이미지가 없습니다..</b>
                  	</td>
                </c:if>
                <c:if test="${dto_s.image != 'nan'}">
                 	<td id="content_image" rowspan="5">
                 	<a href="/root/join/joinView?write_no=${dto_s.write_no}"><img src="${contextPath}/join/download?imageFileName=${dto_s.image}" width="650px" height="400px"></a>
                  	</td>
                </c:if>
            </tr>
        
            <tr id="content_row">
            	 <td id="content_title"><a href="/root/join/joinView?write_no=${dto_s.write_no}">제목 : ${dto_s.title}</a></td>
            </tr>
            <tr id="content_row">
            	<td id="content_loc_name">상세 위치 : ${dto_s.loc_name}</td>
            </tr>
            <tr id="content_row">
            	<td></td>
            </tr>
            <tr id="content_row">
				<td id="content_con">내용 : ${dto_s.content}</td>
			</tr>
		    <tr height="100px"></tr>
		</c:forEach>
        		<tr>
            		<td colspan="6" align="center">
                		<c:forEach var="num" begin="1" end="${repeat}">
                			<button onclick="location.href='joinSearchList?title=${title}&num=${num}'">${num}</button>
             			</c:forEach>
         			</td>
     			</tr>
     			<tr>
        			<td colspan="6">
            	 		<button onclick="location.href='${contextPath }/join/artistForm'">글작성</button>
        			</td>
     			</tr>
    		</table>
    	</div>
    	</div>
    	<c:import url="../default/footer.jsp"/>
</body>
</html> 