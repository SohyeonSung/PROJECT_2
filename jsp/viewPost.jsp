<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page
	import="java.util.*, model.dto.PostDTO, model.dto.CommentDTO, model.dto.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat sdfDateOnly = new SimpleDateFormat("yyyy-MM-dd");

PostDTO post = (PostDTO) request.getAttribute("post");
List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("commentList");
String userId = (String) session.getAttribute("userId");

if (userId == null && session.getAttribute("loginUser") != null) {
	userId = ((UserDTO) session.getAttribute("loginUser")).getUserId();
}
String writerId = post.getUserId();
String writerNickname = post.getNickname();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #e8f1ff;
	margin: 0;
	padding: 40px 20px;
}

.container {
	max-width: 800px;
	margin: 0 auto;
}

.card {
	background-color: #ffffff;
	border-radius: 1.5rem;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
	padding: 2rem;
	margin-bottom: 2rem;
}

.btn {
	padding: 8px 14px;
	border-radius: 10px;
	background-color: #3b82f6;
	color: white;
	border: none;
	cursor: pointer;
	font-size: 14px;
}

.btn:hover {
	background-color: #2563eb;
}

.btn-danger {
	background-color: #f87171;
}

.btn-danger:hover {
	background-color: #ef4444;
}

.btn-secondary {
	background-color: #6b7280;
	color: white;
}

.btn-secondary:hover {
	background-color: #4b5563;
}

.comment-form textarea {
	width: 100%;
	height: 60px;
	padding: 8px;
	font-size: 14px;
	border-radius: 8px;
	border: 1px solid #ccc;
}

.comment {
	margin-bottom: 20px;
	padding: 14px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #f9fafb;
}

.media-preview {
	margin-top: 1rem;
}

.action-bar .left-buttons>form {
	display: inline-block;
	margin-right: 8px;
}

.action-bar .scrap-button {
	margin-top: 12px;
}

.action-buttons-right {
	margin-top: 16px;
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 게시글 영역 -->
		<div class="card">
			<h2
				style="display: flex; justify-content: space-between; align-items: center;">
				<span><%=post.getTitle()%></span> <span
					style="display: flex; gap: 10px; align-items: center;"> <c:if
						test="${loginUser != null && loginUser.userGrade == '관리자'}">
						<a
							href="${pageContext.request.contextPath}/AdminReportProcessListController">
							<button type="button" class="btn btn-secondary"
								style="font-size: 13px;">← 관리자 페이지</button>
						</a>
					</c:if> <span style="font-size: 18px; color: #888;">👁️ <%=post.getViewCount()%></span>
				</span>
			</h2>


			<div class="info-bar">
				<span><strong><%=writerNickname%></strong></span> <span><%=sdfDateOnly.format(post.getCreatedAt())%></span>
			</div>

			<p><%=post.getpContent()%></p>


			<c:if test="${not empty post.filePath}">
				<div class="media-preview">
					<c:choose>
						<%-- 이미지 출력 --%>
						<c:when test="${fn:startsWith(post.fileType, 'image')}">
							<img src="/upload/${post.filePath}" width="400" />
						</c:when>

						<%-- 동영상 출력 --%>
						<c:when test="${fn:startsWith(post.fileType, 'video')}">
							<video width="400" controls>
								<source src="/upload/${post.filePath}" type="${post.fileType}" />
								브라우저가 video 태그를 지원하지 않습니다.
							</video>
						</c:when>

						<%-- 일반 파일 다운로드 --%>
						<c:otherwise>
							<a href="/upload/${post.filePath}" download> 📎 <c:out
									value="${fn:substringAfter(post.filePath, '/')}" />
							</a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>



			<!-- 신고 버튼 (게시글) -->
			<button class="btn btn-danger"
				onclick="openReportModal('post', <%=post.getPostId()%>)">🚨
				게시글 신고</button>



			<div class="action-bar" style="margin-top: 20px;">
				<div class="left-buttons">
					<%
					if (userId != null && userId.equals(writerId)) {
					%>
					<form action="editPostForm.do" method="get">
						<input type="hidden" name="postId" value="<%=post.getPostId()%>">
						<button type="submit" class="btn">수정</button>
					</form>
					<form action="deletePost.do" method="post"
						onsubmit="return confirm('정말 삭제하시겠습니까?');">
						<input type="hidden" name="postId" value="<%=post.getPostId()%>">
						<button type="submit" class="btn btn-danger">삭제</button>
					</form>
					<%
					}
					%>

					<form action="CommunityListController" method="get">
						<input type="hidden" name="category" value="all"> <input
							type="hidden" name="keyword" value="">
						<button type="submit" class="btn btn-secondary">목록으로</button>
					</form>
				</div>

				<!-- 스크랩 버튼 -->
				<c:if test="${not empty sessionScope.loginUser}">
					<div class="action-buttons-right">
						<!-- 스크랩 -->
						<c:choose>
							<c:when test="${hasScrapped}">
								<button id="scrapBtn" class="btn"
									style="background-color: #3b82f6;" onclick="toggleScrap(false)">🔖
									스크랩됨</button>
							</c:when>
							<c:otherwise>
								<button id="scrapBtn" class="btn"
									style="background-color: lightgray;"
									onclick="toggleScrap(true)">📌 스크랩</button>
							</c:otherwise>
						</c:choose>

						<!-- 좋아요 -->
						<form action="likePost" method="post" style="display: inline;">
							<input type="hidden" name="postId" value="${post.postId}" />
							<c:choose>
								<c:when test="${hasLiked == 1}">
									<button type="submit" class="btn"
										style="background-color: pink;">❤️ ${post.likeCount}</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn"
										style="background-color: lightgray;">🤍
										${post.likeCount}</button>
								</c:otherwise>
							</c:choose>
						</form>
					</div>
				</c:if>




			</div>

			<!-- 댓글 영역 -->
			<div class="card">
				<h3>💬 댓글</h3>

				<form action="addComment" method="post" class="comment-form">
					<input type="hidden" name="postId" value="<%=post.getPostId()%>">
					<textarea name="cContent" required></textarea>
					<br />
					<button type="submit" class="btn" style="margin-top: 10px;">댓글
						작성</button>
				</form>

				<hr />

				<%
				if (commentList != null && !commentList.isEmpty()) {
					for (CommentDTO comment : commentList) {
				%>
				<div class="comment">
					<p>
						<strong><%=comment.getNickname()%></strong>:
						<%=comment.getcContent()%></p>
					<p style="font-size: 13px; color: #999;"><%=sdf.format(comment.getCreatedAt())%></p>

					<!-- 댓글 신고 버튼 -->
					<button class="btn btn-danger"
						onclick="openReportModal('comment', <%=comment.getCommentId()%>)">🚨
						댓글 신고</button>


					<%
					if (userId != null && userId.equals(comment.getUserId())) {
					%>
					<form action="updateComment" method="post" style="display: inline;">
						<input type="hidden" name="commentId"
							value="<%=comment.getCommentId()%>"> <input type="hidden"
							name="postId" value="<%=post.getPostId()%>"> <input
							type="text" name="cContent" value="<%=comment.getcContent()%>"
							required>
						<button type="submit" class="btn">수정</button>
					</form>
					<form action="deleteComment" method="post" style="display: inline;">
						<input type="hidden" name="commentId"
							value="<%=comment.getCommentId()%>"> <input type="hidden"
							name="postId" value="<%=post.getPostId()%>">
						<button type="submit" class="btn btn-danger">삭제</button>
					</form>
					<%
					}
					%>
				</div>
				<%
				}
				} else {
				%>
				<p>댓글이 없습니다.</p>
				<%
				}
				%>
			</div>
		</div>


		<!-- ✅ 신고 모달 폼 (공통) -->
		<div id="reportModal"
			style="display: none; position: fixed; top: 20%; left: 35%; width: 30%; background: white; border: 1px solid gray; padding: 20px; z-index: 999;">
			<form id="reportForm" method="post"
				action="<%=request.getContextPath()%>/ReportController">
				<input type="hidden" name="targetType" id="reportTargetType">
				<input type="hidden" name="targetId" id="reportTargetId"> <label>신고
					사유:</label><br>
				<textarea name="reason" rows="4" cols="40" required></textarea>
				<br> <br>
				<button type="submit" class="btn btn-danger"
					onclick="submitReport()">신고 제출</button>
				<button type="button" class="btn" onclick="closeReportModal()">닫기</button>
			</form>
		</div>

		<script>
	function openReportModal(type, id) {
		document.getElementById("reportTargetType").value = type;
		document.getElementById("reportTargetId").value = id;
		document.getElementById("reportModal").style.display = "block";
	}
	function closeReportModal() {
		document.getElementById("reportModal").style.display = "none";
		document.getElementById("reportForm").reset();
	}
	
	// AJAX로 신고 제출
	function submitReport() {
	const form = document.getElementById("reportForm");
	const formData = new FormData(form);

	fetch("<%=request.getContextPath()%>/ReportController", {
		method: "POST",
		body: formData // Content-Type 자동 처리됨!
	})
	.then(response => {
		if (response.ok) {
			alert("신고가 접수되었습니다.");
			closeReportModal();
		} else {
			alert("신고 처리 실패");
		}
	})
	.catch(error => {
		console.error("에러 발생:", error);
		alert("네트워크 오류");
	});
	}
	
	
</script>



		<!-- ✅ 스크랩 Ajax -->
		<script>
	function toggleScrap(add) {
		const postId = ${post.getPostId()};
		const formData = new URLSearchParams();
		formData.append("postId", postId);
		formData.append("add", add);

		fetch("${pageContext.request.contextPath}/scrap", {
			method: "POST",
			headers: { "Content-Type": "application/x-www-form-urlencoded" },
			body: formData
		})
		.then(res => res.json())
		.then(data => {
			if (data.success) {
				const btn = document.getElementById("scrapBtn");
				if (data.scrapped) {
					btn.innerText = "🔖 스크랩됨";
					btn.style.backgroundColor = "#3b82f6";
					btn.setAttribute("onclick", "toggleScrap(false)");
				} else {
					btn.innerText = "📌 스크랩";
					btn.style.backgroundColor = "lightgray";
					btn.setAttribute("onclick", "toggleScrap(true)");
				}
			} else {
				alert(data.message);
			}
		});
	}
	</script>
</body>
</html>
