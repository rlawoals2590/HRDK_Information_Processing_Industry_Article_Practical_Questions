function checkData(){
	if(document.fr_insert.custno.value == ""){
		fr_insert.custno.focus();
		alert("회원번호가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.custname.value == ""){
		fr_insert.custname.focus();
		alert("회원이름이 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.phone.value == ""){
		fr_insert.phone.focus();
		alert("회원전화가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.address.value == ""){
		alert("통신사가 선택되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.joindate.value == ""){
		fr_insert.joindate.focus();
		alert("가입날짜가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.grade.value == ""){
		fr_insert.grade.focus();
		alert("고객등급이 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.city.value == ""){
		fr_insert.city.focus();
		alert("도시코드가 입력되지 않았습니다.");
		return false;
	}

	alert('회원등록이 정상적으로 등록 되었습니다!');
	return true;
}

function checkUpdateData(){
	if(document.fr_insert.custno.value == ""){
		fr_insert.custno.focus();
		alert("회원번호가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.custname.value == ""){
		fr_insert.custname.focus();
		alert("회원이름이 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.phone.value == ""){
		fr_insert.phone.focus();
		alert("회원전화가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.address.value == ""){
		alert("통신사가 선택되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.joindate.value == ""){
		fr_insert.joindate.focus();
		alert("가입날짜가 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.grade.value == ""){
		fr_insert.grade.focus();
		alert("고객등급이 입력되지 않았습니다.");
		return false;
	}
	if(document.fr_insert.city.value == ""){
		fr_insert.city.focus();
		alert("도시코드가 입력되지 않았습니다.");
		return false;
	}

	alert('회원정보수정이 완료 되었습니다!');
	return true;
}