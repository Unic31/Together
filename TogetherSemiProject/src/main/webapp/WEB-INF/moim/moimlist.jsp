<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../commonvar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body, body * {
	font-family: 'Jua'
}

table {
	border: 0.5px solid gray;
	margin-left: 250px;
	background-color: #ffd;
}

div.listmid {
	width: 350px;
	height: 330px;
	margin-top: 20px;
	margin-left: 50px;
	margin-bottom: 20px;
	cursor: pointer;
	border: 1px solid gray;
	border-radius:30px;
	text-align: center;
	background-color: #ffc;
}

label {
	cursor: pointer;
}

div>img {
	border-radius: 30px;
}
#loginfo {
	margin-left: 300px;
}
</style>
</head>
<body>
<div id="loginfo" style="border: 0px solid black; width: 900px; height: 60px; font-size: 30px" align="center">
<c:choose>
<c:when test="${unum==0 }">
GUEST로 게시판 조회 중 입니다
</c:when>
<c:otherwise>
${udto.uname }님이 로그인 중 입니다
</c:otherwise>
</c:choose>
</div>

	<div style="width: 900px;">			
		<table class="table">
		<tr><td colspan="3">
		<h2 align="center">모임리스트</h2><br><h4 align="right">${city1} ${city2} ${category} 모임이 총 ${totalCount}개 있습니다.</h4>
		</td></tr>
				<tr>
					<td style="width:450px;">					
						<label data-bs-toggle="modal" data-bs-target="#mySportsModal">
							&nbsp;&nbsp;&nbsp;&nbsp; <i class="bi bi-dribbble"></i> <h7>운동/스포츠</h7>
						</label> &nbsp;&nbsp;&nbsp; <label data-bs-toggle="modal"
							data-bs-target="#myGameModal"> <i
							class="bi bi-controller"></i> <h7>게임/오락</h7>
						</label> &nbsp;&nbsp;&nbsp; <label data-bs-toggle="modal"
							data-bs-target="#myTravelModal"> <i class="bi bi-geo-alt"></i>
							<h7>여행/아웃도어</h7>
						</label> <br> <label data-bs-toggle="modal"
							data-bs-target="#myBookModal"> &nbsp;&nbsp;&nbsp; <i
							class="bi bi-book"></i> <h7>책/글</h7>
						</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
							data-bs-toggle="modal" data-bs-target="#myWorkModal"> <i
							class="bi bi-briefcase"></i> <h7>업종/직무</h7>
						</label> &nbsp;&nbsp; <label data-bs-toggle="modal"
							data-bs-target="#myLangModal"> &nbsp;&nbsp;&nbsp; <i
							class="bi bi-translate"></i> <h7>외국/언어</h7>
						</label> <br> <label data-bs-toggle="modal"
							data-bs-target="#myMusicModal"> <i
							class="bi bi-music-note-beamed"></i> <h7>음악/악기</h7>
						</label> &nbsp;&nbsp;&nbsp;&nbsp; <label data-bs-toggle="modal"
							data-bs-target="#mySocialModal"> <i
							class="bi bi-cup-straw"></i> <h7>사교/인맥</h7>
						</label> &nbsp; <label data-bs-toggle="modal"
							data-bs-target="#myCraftsModal"> &nbsp;&nbsp;&nbsp; <i
							class="bi bi-palette"></i> <h7>공예/만들기</h7>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</label>
						</td>
				<td colspan="2" align="center" style="width: 450px;">					 
						<label for="user_city">지역</label> <select id="city" name="city1">
							<option hidden>시, 도 선택</option>
							<option value="서울특별시">서울특별시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="인천광역시">인천광역시</option>
							<option value="광주광역시">광주광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="울산광역시">울산광역시</option>
							<option value="세종특별자치시">세종특별자치시</option>
							<option value="경기도">경기도</option>
							<option value="강원도">강원도</option>
							<option value="충청북도">충청북도</option>
							<option value="충청남도">충청남도</option>
							<option value="전라북도">전라북도</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="경상남도">경상남도</option>
							<option value="제주특별자치도">제주특별자치도</option>
						</select>						
						<select id="district" name="city2">
							<option>시, 군, 구 선택</option>
						</select>
						<script>
               $(document).ready(function() {
                     $('#city').change(function() {
                       var city = $(this).val();
                       if (city === '서울특별시') {
                         var districts = ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'];
                       } else if (city === '부산광역시') {
                          var districts = ['강서구', '금정구', '기장군', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'];
                       } else if (city === '대구광역시') {
                           var districts = ['남구', '달서구', '달성군', '동구', '북구', '서구', '수성구', '중구'];
                        } else if (city === '인천광역시') {
                           var districts = ['강화군', '계양구', '남구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군'];
                        } else if (city === '광주광역시') {
                           var districts = ['광산구', '남구', '동구', '북구', '서구'];
                        } else if (city === '대전광역시') {
                           var districts = ['대덕구', '동구', '서구', '유성구', '중구'];
                        } else if (city === '울산광역시') {
                           var districts = ['남구', '동구', '북구', '울주군'];            
                        } else if (city === '세종특별자치시') {
                           var districts = ['가람동','고운동', '금남면', '나성동', '누리동', '다솜동', '다정동', '대평동', '도담동', '반곡동', '보람동', '부강면', '산울동', '새롬동', '세종동', '소담동', '소정면','아름동', '어진동', '연기면', '연동면', '연서면', '용호동', '장군면', '전동면', '전의면', '조치원읍', '종촌동', '집현동', '한별동', '한솔동', '합강동', '해밀동'];            
                        } else if (city === '경기도') {
                           var districts = ['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', ' 포천시', '하남시', '화성시'];
                        } else if (city === '강원도') {
                           var districts = ['강릉시', '동해시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양양군', '영월군', '인제군', '정선군', '철원군', '화천군', '횡성군'];
                        } else if (city === '충청북도') {
                           var districts = ['청주시', '충주시', '제천시', '보은군', '옥천군', '영동군', '진천군', '괴산군', '음성군', '단양군'];
                        } else if (city === '충청남도') {
                           var districts = ['천안시', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
                        } else if (city === '전라북도') {
                           var districts = ['전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
                        } else if (city === '전라남도') {
                           var districts = ['광양시', '나주시', '목포시', '순천시', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'];
                        } else if (city === '경상북도') {
                           var districts = ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'];
                        } else if (city === '경상남도') {
                           var districts = ['창원시', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
                        } else if (city === '제주특별자치도') {
                           var districts = ['제주시', '서귀포시'];
                        } else {
                         $('#district').empty().prop('disabled', true);
                       }
                       var districtSelect = $('#district');
                       districtSelect.empty();
                         districtSelect.append($('<option>', { value: '', text: '전지역' }));  
                       $.each(districts, function(index, value) {
                         districtSelect.append($('<option>', { value: value, text: value }));
                       });
                       districtSelect.prop('disabled', false);
                     });
                   });
                 </script>						
					</td>															
					<tr>					
					<td colspan="2" align="center">
					선택한 카테고리 : <span type="text" class="selcategory"></span><br>
					선택한 지역 :
					<span type="text" id="seldistrict1"></span>
					<span type="text" id="seldistrict2"></span>				
					<form action="moimlist" method="get">
					<input type="hidden" class="seldistrict1" name="city1" value="">
					<input type="hidden" class="seldistrict2" name="city2" value="">
					<input type="hidden" id="selcategory" name="category" value="">
					<br>
				    <button type="submit" onclick="submitSelectedConditions()">선택 조건 검색</button>
				 	</td>
					</form>

					<script>
					function submitSelectedConditions() {
					  // 선택된 카테고리와 지역 정보를 가져옴
					  const selectedCategory = document.querySelector('#selcategory').value;
					  const selectedCity1 = document.querySelector('.seldistrict1').value;
					  const selectedCity2 = document.querySelector('.seldistrict2').value;
					
					  // selcategory에만 값이 있는 경우
					  if (selectedCategory && !selectedCity1) {
					    // selcategory의 value 속성만 설정하고 seldistrict의 name 속성을 제거
					    document.querySelector('.seldistrict1').removeAttribute('name');
					    document.querySelector('.seldistrict2').removeAttribute('name'); 
					  }
					  // seldistrict1에만 값이 있는 경우
					  else if (!selectedCategory && selectedCity1 && !selectedCity2) {
					    // seldistrict의 value 속성만 설정하고 selcategory의 name 속성을 제거
					    document.querySelector('#selcategory').removeAttribute('name');
					    document.querySelector('.seldistrict2').removeAttribute('name');
					  }
						// seldistrict1와seldistrict2에만 값이 있는 경우
					  else if (!selectedCategory && selectedCity1 && selectedCity2) {
					    // seldistrict의 value 속성만 설정하고 selcategory의 name 속성을 제거
					    document.querySelector('#selcategory').removeAttribute('name');
					  }
						// selcategory와seldistrict1에만 값이 있는 경우
					  else if (selectedCategory && selectedCity1 && !selectedCity2) {
					    // seldistrict의 value 속성만 설정하고 selcategory의 name 속성을 제거
						  document.querySelector('.seldistrict2').removeAttribute('name');
					  }
					  // selcategory와 seldistrict 모두 값이 없는 경우
					  else if (!selectedCategory && !selectedCity1 && !selectedCity2) {
					    // 값이 있는 경우만 input 요소에 value 속성을 할당
						  document.querySelector('#selcategory').removeAttribute('name');
						  document.querySelector('.seldistrict1').removeAttribute('name'); 
						  document.querySelector('.seldistrict2').removeAttribute('name');
					  }
					  // form 데이터를 서버로 전송
					  document.querySelector('form').submit();
					}
					</script>
					</tr>				
			</tr>
			<!-- 리스트 출력 부분 -->
			<c:forEach var="dto" items="${list}" varStatus="i">
				<c:if test="${i.count % 2 == 1}">
					<tr>
				</c:if>
				<td style="width: 350px;">
				<a href="moimdetail?mnum=${dto.mnum}"
									style="color: black; font-size: 17px; text-decoration: none; cursor: pointer;" id="godetail" onclick="checkUnum(event)">
					<div class="listmid">
						<c:choose>
							<c:when test="${dto.mphoto==null}">
								<!-- Result값이 있다면 실행할 로직 -->								
									<img
									src="http://sjrhsefqqpro17075801.cdn.ntruss.com/moim/together.png?type=f&w=200&h=200&ttype=jpg"
									border="1" style="cursor: pointer; margin-top: 10px"> <br>
							</c:when>
							<c:otherwise>
								<img
									src="http://${imageUrl_small}/moim/${dto.mphoto}?type=f&w=200&h=200&ttype=jpg"
									border="1"
									onclick="location.href='moimdetail?mnum=${dto.mnum}'"
									style="cursor: pointer; margin-top: 10px; border-radius:30px;">
								<br>
							</c:otherwise>
						</c:choose>
						<span
							style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: inline-block; max-width: 200px;">
							<b style="font-size: 20px;">${dto.mname}</b>
						</span> <br> 지역:${dto.city1} ${dto.city2} <br> 카테고리:${dto.category} <br> 모임인원:${dto.unum}명						
					</div>
					</a>
				</td>
				<c:if test="${i.count % 2 == 0}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
		</table>

		<!-- 페이징처리하기 -->
		<c:choose>
			<c:when test="${category ne null and city1 ne null and city2 ne null}">
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&city1=${city1}&city2=${city2}&currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&city1=${city1}&city2=${city2}&currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&city1=${city1}&city2=${city2}&currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&city1=${city1}&city2=${city2}&currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:when>
			<c:when test="${category ne null and city1 ne null and city2 eq null}">
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&city1=${city1}&currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&city1=${city1}&currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&city1=${city1}&currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&city1=${city1}&currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:when>
			<c:when test="${category ne null and city1 eq null and city2 eq null}">
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?category=${category}&currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?category=${category}&currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:when>
			<c:when test="${category eq null and city1 ne null and city2 eq null}">
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?city1=${city1}&currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?city1=${city1}&currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?city1=${city1}&currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?city1=${city1}&currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:when>
			<c:when test="${category eq null and city1 ne null and city2 ne null}">
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?city1=${city1}&city2=${city2}&currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?city1=${city1}&city2=${city2}&currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?city1=${city1}&city2=${city2}&currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?city1=${city1}&city2=${city2}&currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<div
					style="width: 900px; margin-left: 640px; margin-top: 50px; font-size: 20px;">
					<!-- 이전 -->
					<c:if test="${startPage>1}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?currentPage=${startPage-1}">이전</a>
					</c:if>
					&nbsp;
					<!-- 페이지 번호 출력 -->
					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<a
								style="color: blue; font-size: 23px; text-decoration: none; cursor: pointer;"
								href="moimlist?currentPage=${pp}">${pp}</a>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<a style="color: black; text-decoration: none; cursor: pointer;"
								href="moimlist?currentPage=${pp}">${pp}</a>
						</c:if>
						&nbsp;
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${endPage<totalPage}">
						<a style="color: black; text-decoration: none; cursor: pointer;"
							href="moimlist?currentPage=${endPage+1}">다음</a>
					</c:if>
				</div>
			</c:otherwise>
		</c:choose>
	</div>


	<form action="moimlist" method="get">
		<!-- The Modal -->
		<div class="modal" id="mySportsModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">운동/스포츠</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="축구">축구</label>
						<label><input type="checkbox" name="category" value="농구">농구</label>
						<label><input type="checkbox" name="category" value="야구">야구</label>
						<label><input type="checkbox" name="category" value="테니스">테니스</label>
						<br> <label><input type="checkbox" name="category"
							value="배드민턴">배드민턴</label> <label><input type="checkbox"
							name="category" value="자전거">자전거</label> <label><input
							type="checkbox" name="category" value="클라이밍">클라이밍</label> <br>
						<label><input type="checkbox" name="category" value="탁구">탁구</label>
						<label><input type="checkbox" name="category"
							value="러닝/마라톤">러닝/마라톤</label> <label><input
							type="checkbox" name="category" value="골프">골프</label> <label><input
							type="checkbox" name="category" value="볼링">볼링</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myGameModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">게임/오락</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="다트">다트</label>
						<label><input type="checkbox" name="category" value="보드게임">보드게임</label>
						<label><input type="checkbox" name="category"
							value="두뇌심리게임">두뇌심리게임</label> <br> <label><input
							type="checkbox" name="category" value="온라인게임">온라인게임</label> <label><input
							type="checkbox" name="category" value="콘솔게임">콘솔게임</label> <label><input
							type="checkbox" name="category" value="단체놀이">단체놀이</label> <br>
						<label><input type="checkbox" name="category" value="타로카드">타로카드</label>
						<label><input type="checkbox" name="category" value="마술">마술</label>
						<label><input type="checkbox" name="category" value="바둑">바둑</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myTravelModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">여행/아웃도어</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="등산">등산</label>
						<label><input type="checkbox" name="category"
							value="산책/트래킹">산책/트래킹</label> <label><input
							type="checkbox" name="category" value="캠핑/백패킹">캠핑/백패킹</label> <br>
						<label><input type="checkbox" name="category" value="국내여행">국내여행</label>
						<label><input type="checkbox" name="category" value="해외여행">해외여행</label>
						<label><input type="checkbox" name="category" value="낚시">낚시</label>
						<label><input type="checkbox" name="category"
							value="패러글라이딩">패러글라이딩</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myBookModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">책/글</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="책/독서">책/독서</label>
						<label><input type="checkbox" name="category" value="인문학">인문학</label>
						<label><input type="checkbox" name="category" value="심리학">심리학</label>
						<label><input type="checkbox" name="category" value="철학">철학</label>
						<br> <label><input type="checkbox" name="category"
							value="역사">역사</label> <label><input type="checkbox"
							name="category" value="시사/경제">시사/경제</label> <label><input
							type="checkbox" name="category" value="작문/글쓰기">작문/글쓰기</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myWorkModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">업족/직무</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category"
							value="의료/건강/제약">의료/건강/제약</label> <label><input
							type="checkbox" name="category" value="IT/포털/인터넷">IT/포털/인터넷</label>
						<label><input type="checkbox" name="category" value="교육업">교육업</label>
						<br> <label><input type="checkbox" name="category"
							value="광고/마케팅업계">광고/마케팅업계</label> <label><input
							type="checkbox" name="category" value="디자인업계  ">디자인업계</label> <label><input
							type="checkbox" name="category" value="무역/상사">무역/상사</label> <br>
						<label><input type="checkbox" name="category" value="금융업">금융업</label>
						<label><input type="checkbox" name="category"
							value="세무/회계">세무/회계</label> <label><input type="checkbox"
							name="category" value="전자/기계/전기">전자/기계/전기</label> <br> <label><input
							type="checkbox" name="category" value="패션/의류/뷰티">패션/의류/뷰티</label>
						<label><input type="checkbox" name="category" value="서비스업">서비스업</label>
						<label><input type="checkbox" name="category"
							value="식음료/외식업">식음료/외식업</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myLangModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">외국/언어</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="영어">영어</label>
						<label><input type="checkbox" name="category" value="일본어">일본어</label>
						<label><input type="checkbox" name="category" value="중국어">중국어</label>
						<label><input type="checkbox" name="category" value="프랑스어">프랑스어</label>
						<label><input type="checkbox" name="category" value="스페인어">스페인어</label>
						<label><input type="checkbox" name="category" value="러시아어">러시아어</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myMusicModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">음악/악기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category"
							value="노래/보컬">노래/보컬</label> <label><input type="checkbox"
							name="category" value="기타/베이스">기타/베이스</label> <label><input
							type="checkbox" name="category" value="드럼">드럼</label> <label><input
							type="checkbox" name="category" value="피아노">피아노</label> <label><input
							type="checkbox" name="category" value="바이올린">바이올린</label> <br>
						<label><input type="checkbox" name="category"
							value="밴드/합주">밴드/합주</label> <label><input type="checkbox"
							name="category" value="작사/작곡">작사/작곡</label> <label><input
							type="checkbox" name="category" value="힙합">힙합</label> <label><input
							type="checkbox" name="category" value="클래식">클래식</label> <label><input
							type="checkbox" name="category" value="재즈">재즈</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="mySocialModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">사교/인맥</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category" value="지역">지역</label>
						<label><input type="checkbox" name="category" value="나이">나이</label>
						<label><input type="checkbox" name="category" value="성별">성별</label>
						<label><input type="checkbox" name="category"
							value="싱글/연애">싱글/연애</label> <label><input type="checkbox"
							name="category" value="기혼/유부">기혼/유부</label> <br> <label><input
							type="checkbox" name="category" value="돌싱">돌싱</label> <label><input
							type="checkbox" name="category" value="와인/커피/차">와인/커피/차</label> <label><input
							type="checkbox" name="category" value="맛집/미식회">맛집/미식회</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>

		<!-- The Modal -->
		<div class="modal" id="myCraftsModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">공예/만들기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<label><input type="checkbox" name="category"
							value="미술/그림">미술/그림</label> <label><input type="checkbox"
							name="category" value="캘리그라피">캘리그라피</label> <label><input
							type="checkbox" name="category" value="천연비누/화장품">천연비누/화장품</label>
						<br> <label><input type="checkbox" name="category"
							value="캔들/디퓨저/석고 ">캔들/디퓨저/석고 </label> <label><input
							type="checkbox" name="category" value="가죽공예">가죽공예</label> <label><input
							type="checkbox" name="category" value="가구/목공예">가구/목공예</label> <label><input
							type="checkbox" name="category" value="도자/점토공예">도자/점토공예</label> <br>
						<label><input type="checkbox" name="category"
							value="자수/뜨개질">자수/뜨개질</label> <label><input
							type="checkbox" name="category" value="키덜트/프라모델">키덜트/프라모델</label>
						<label><input type="checkbox" name="category"
							value="메이크업/네일">메이크업/네일</label>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">선택</button>
					</div>

				</div>
			</div>
		</div>
	</form>
	<script>
$(function() {
    // 체크박스 값이 변경될 때마다 실행되는 함수
    $('input[name="category"]').on('change', function() {
      // 모든 체크박스를 해제
      $('input[name="category"]').not(this).prop('checked', false);
      
      // 선택된 체크박스 값을 출력
      var selected = $(this).val();
      $('.selcategory').text(selected);
      $('#selcategory').val(selected);
    });
    
 	// 셀렉트 값이 변경될 때마다 실행되는 함수
 	 $('select[name="city1"]').on('change', function() {      
      // 선택된 값을 출력
      var selected = $(this).val();
      $('#seldistrict1').text(selected);
      $('.seldistrict1').val(selected);
    });
 	
    $('select[name="city2"]').on('change', function() {      
      // 선택된 값을 출력
      var selected = $(this).val();
      $('#seldistrict2').text(selected);
      $('.seldistrict2').val(selected);
    });
  });
	
	function checkUnum(event) {
	  // 현재 사용자의 세션에서 unum 값을 가져옵니다.
	  //const unum = sessionStorage.getItem('unum');
	  // unum 값이 null인 경우에만 alert을 호출합니다.
	  if (${unum} === 0) {
	    alert('로그인을 해주세요.');
	    event.preventDefault(); // 링크 이동을 막습니다.
	    location.href="/user/login"
	  }
	}
</script>
</body>
</html>











