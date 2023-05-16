/*변수 선언*/
    
    var email = document.querySelector('#email');
    
    var pw1 = document.querySelector('#pass');
    var pwMsg = document.querySelector('#alertTxt');
    var pwImg1 = document.querySelector('#pswd1_img1');

    var pw2 = document.querySelector('#pass_check');
    var pwImg2 = document.querySelector('#pswd2_img1');
    var pwMsgArea = document.querySelector('.int_pass');
    
    var userName = document.querySelector('#uname');
    
    var age = document.querySelector('#age');
    
    var gender = document.querySelector('#gender');
    
    var city = document.querySelector('#city');
    
    var category = document.querySelector('#selcategory');
    
    var mobile = document.querySelector('#hp');
    
    var error = document.querySelectorAll('.error_next_box');
    
    var emailcheck = false;
    
    /*이벤트 핸들러 연결*/
    
    email.addEventListener("input", isEmailCorrect);
    
    pw1.addEventListener("input", checkPw);
    pw2.addEventListener("input", comparePw);
    
    userName.addEventListener("input", checkName);
    
    age.addEventListener("focusout", checkage);
    
    gender.addEventListener("focusout", function() {
        if(gender.value === "성별") {
            error[5].style.display = "block";
        } else {
            error[5].style.display = "none";
        }
    });
    
    city.addEventListener("focusout", checkcity);
    
    category.addEventListener("focusout", checkcategory);
    
    mobile.addEventListener("input", checkPhoneNum);
    
    
    /*콜백 함수*/
    
    var email_check = false;
    function isEmailCorrect() {
		$("#olmessage").text("");
    	var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
		
        if(email.value === ""){
			email_check = false;
           error[0].innerHTML = "필수 정보입니다.";
           error[0].style.display = "block"; 
        } else if(!emailPattern.test(email.value)) {
			email_check = false;
            error[0].innerHTML = "이메일 주소를 다시 확인해주세요.";
           error[0].style.display = "block";
        } else {
			email_check = true;
           error[0].style.display = "none"; 
        }

    }
    
    function checkPw() {
        var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
        if(pw1.value === "") {
			error[1].innerHTML = "필수 정보입니다.";
			error[1].style.color = "red";
			error[1].style.display = "block";
		} else if(!pwPattern.test(pw1.value)) {
            error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            error[1].style.color = "red";
            pwMsg.innerHTML = "사용불가";
            pwMsg.style.color = "red";
            pwMsgArea.style.paddingRight = "93px";
            error[1].style.display = "block";
            
            pwMsg.style.display = "block";
            pwImg1.src = "/photo/m_icon_not_use.png";
        } else {
            error[1].style.display = "none";
            pwMsg.innerHTML = "안전";
            pwMsg.style.display = "block";
            pwMsg.style.color = "#03c75a";
            pwImg1.src = "/photo/m_icon_safe.png";
        }
    }

    function comparePw() {
        if(pw2.value === pw1.value && pw2.value != "") {
            pwImg2.src = "/photo/m_icon_check_enable.png";
            error[2].style.color = "red";
            error[2].style.display = "none";
        } else if(pw2.value !== pw1.value) {
            pwImg2.src = "/photo/m_icon_check_disable.png";
            error[2].style.color = "red";
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "block";
        } 

        if(pw2.value === "") {
            error[2].innerHTML = "필수 정보입니다.";
            error[2].style.color = "red";
            error[2].style.display = "block";
        }
    }
    
    function checkName() {
         var namePattern = /^[a-zA-Z가-힣]+$/; // 특수기호, 공백 사용 불가능
         if (userName.value === "") {
           error[3].innerHTML = "필수 정보입니다.";
           error[3].style.display = "block";
         } else if (!namePattern.test(userName.value)) {
           error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
           error[3].style.display = "block";
         } else {
           error[3].style.display = "none";
         }
       }
    
    function checkage() {
       
       if(age.value === "") {
            error[4].innerHTML = "필수 정보입니다.";
            error[4].style.display = "block";
        } else {
            error[4].style.display = "none";
        }
    }
    
    function checkcity() {
        
        if(city.value === "") {
             error[6].innerHTML = "필수 정보입니다.";
             error[6].style.display = "block";
         } else {
             error[6].style.display = "none";
         }
     }
    
    function checkcategory() {
        
        if(category.value === "") {
             error[7].innerHTML = "필수 정보입니다.";
             error[7].style.display = "block";
         } else {
             error[7].style.display = "none";
         }
     }
    
    function checkPhoneNum() {
         var isPhoneNum = /^[0-9]*$/;

         if(mobile.value === "") {
           error[8].innerHTML = "필수 정보입니다.";
           error[8].style.display = "block";
         } else if(!isPhoneNum.test(mobile.value)) {
           error[8].innerHTML = "숫자로만 입력해주세요.";
           error[8].style.display = "block";
         } else {
           error[8].style.display = "none";
         }
       }
    
    $("#email").focusout(function(){
		if(!email_check) return;
    	$(".btn-submit").attr("type", "button");
    	const email = $("#email").val();
    	$.ajax({
    		type: "get",
    		async: false,
    		url: "http://localhost:9000/user/emailCheck",
    		data: {email: email},
    		success: function (data) {
    			if(data == 0 && email!=''){
		    		$("#olmessage").text("사용 가능한 이메일 입니다.");
		    		$("#olmessage").addClass("olmessaget");
		    		$("#olmessage").removeClass("olmessagef");
		    		$(".btn-submit").attr("type", "submit");
    			}else{
	    			$("#olmessage").text("이미 사용중인 이메일 입니다.");
	        		$("#olmessage").addClass("olmessagef");
	        		$("#olmessage").removeClass("olmessaget");	
    			}
    		}
    	});
    });
    
    const form = document.querySelector('form');
    const hiddenInput = document.querySelector('.selcategory');
    
    	form.addEventListener('submit', function(event) {
    		
    		const emailInput = document.querySelector('#email');
    		var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
    	    if (emailInput.value == ''){
    	        event.preventDefault();
    	        if (confirm('이메일을 입력해주세요.')) {
    	        	emailInput.focus();
    	        }
    	        return;
    	    }
    	    else if (!emailPattern.test(emailInput.value)){
    	        event.preventDefault();
    	        if (confirm('이메일 형식을 확인해주세요.')) {
    	        	emailInput.focus();
    	        }
    	        return;
    	    }
    		
    		const passInput = document.querySelector('#pass');
    		var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    		
    	    if (passInput.value == ''){
    	        event.preventDefault();
    	        if (confirm('비밀번호를 입력해주세요.')) {
    	            passInput.focus();
    	        }
    	        return;
    	    }
    	    else if (!pwPattern.test(passInput.value)){
    	    	event.preventDefault();
    	        if (confirm('비밀번호 형식을 확인해주세요.')) {
    	            passInput.focus();
    	        }
    	        return;
    	    }
    	    
    	    const passcheck = document.querySelector('#pass_check');
    	    if (passcheck.value != passInput.value){
    	        event.preventDefault();
    	        if (confirm('비밀번호를 확인해주세요.')) {
    	            passcheck.focus();
    	        }
    	        return;
    	    }
    		
    	    const nameInput = document.querySelector('#uname');
    	    var namePattern = /^[a-zA-Z가-힣]+$/;
    	    if (nameInput.value == ''){
    	        event.preventDefault();
    	        if (confirm('이름을 입력해주세요.')) {
    	        	nameInput.focus();
    	        }
    	        return;
    	    }
 			else if (!namePattern.test(nameInput.value)){
    	    	event.preventDefault();
    	        if (confirm('이름을 형식을 확인해주세요.')) {
    	        	nameInput.focus();
    	        }
    	        return;
    	    } 
    	    
    	    const ageInput = document.querySelector('#age');
    	    if (ageInput.value == ''){
    	        event.preventDefault();
    	        if (confirm('생년월일을 입력해주세요.')) {
    	            ageInput.focus();
    	        }
    	        return;
    	    }
    	    
    	    const genderInput = document.querySelector('#gender');
    	    if (genderInput.value == '성별'){
    	        event.preventDefault();
    	        if (confirm('성별을 선택해주세요.')) {
    	            genderInput.focus();
    	        }
    	        return;
    	    }
    	    const cityInput=document.querySelector('#city');
    	    if (cityInput.value == '시, 도 선택'){
    	    	event.preventDefault();
    	        if(confirm('지역을 선택해주세요.')){
    	    	    cityInput.focus();
    	    	}
    	    	return;
    	    }
    	    
        	const categoryInput = document.querySelector('#category');
        	if (hiddenInput.value == "null") {
        		event.preventDefault();
        	    if(confirm('카테고리를 선택해주세요.')){
        	    	categoryInput.focus();
        	    }
        	    return;
        	}
    	    
    	    const hpInput=document.querySelector('#hp');
    	    var isPhoneNum = /^[0-9]*$/;
    	    if (hpInput.value == ''){
    	    	event.preventDefault();
    	        if(confirm('전화번호를 입력해주세요.')){
    	        hpInput.focus();
    	    	}
    	    	return;
    	    }
    	    else if(!isPhoneNum.test(hpInput.value)){
    	    	event.preventDefault();
    	        if(confirm('전화번호는 숫자로만 입력해주세요.')){
    	        hpInput.focus();
    	    	}
    	    	return;
    	    }
    	    
    	    if(emailcheck == false){
				event.preventDefault();	// 이벤트를 막는 함수
				if(confirm('인증을 완료해주세요.')){
					document.getElementById("inn").focus();
				}
				return;
			}
    	});
    	
    
    $(function() {
        // 체크박스 값이 변경될 때마다 실행되는 함수
        $('input[name="categorys"]').on('change', function() {
          // 모든 체크박스를 해제
          $('input[name="categorys"]').not(this).prop('checked', false);
          
          // 선택된 체크박스 값을 출력
          var selected = $(this).val();
          $('#selcategory').text(selected);
          $('.selcategory').val(selected);
        });
      });
      
      
      $("#inem").click(function(){	 
		 let inemail = $("#inemail").val();
		 
		 if(inemail=="")
		 {
			 alert("인증 이메일을 입력해주세요.")
			 return;	// return을 쓰거나 else를 써야한다 그러지 않으면 밑에 있는 함수도 실행
		 }
		 
		 // 이메일 중복 확인
		 $.ajax({
			type: "get",
			url: "/chemail",
			data: {"inemail":inemail},	// "" 안에있는 이름으로 controller에 : 뒤에 있는 값을 보낸다
			success: function(data) {
				if(data){
					
					// 인증번호 보내기	 
					 $.ajax({
			    		type: "get",
			    		url: "/inemail",
			    		data: {"inemail": inemail},
			    		success: function () {
			    			alert("인증번호를 발송했습니다.");
			    		}
			    	});	
				}
				else{
					alert("이미 인증 받은 아이디 입니다.");
				}
			}
		 }); 
	  });
	  
	  // 인증 확인
	  $("#innum").click(function(){
		  
		  let code = $("#inn").val();
		  
		  $.ajax({
			 type: "get",
			 url: "/chcode",
			 data: {"code":code},
			 success: function(data){
				 if(data)
				 {
					 alert("인증되었습니다.");
					 emailcheck=true;
				 }
				 else{
					 alert("인증 번호가 틀렸습니다.")
					 emailcheck=false;
				 }
			 }
		  });
	  });
      
      