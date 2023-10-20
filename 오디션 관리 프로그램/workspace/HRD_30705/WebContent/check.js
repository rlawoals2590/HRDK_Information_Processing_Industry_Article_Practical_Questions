/**
 * 
 */

function checkData(){
	if(document.frm_insert.artist_id.value == ""){
		frm_insert.artist_id.focus();
		alert("참가번호가 입력되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.artist_name.value == ""){
		frm_insert.artist_name.focus();
		alert("참가자명이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.year.value == ""){
		frm_insert.year.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.month.value == ""){
		frm_insert.month.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.day.value == ""){
		frm_insert.day.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.artist_gender.value == ""){
		alert("성별이 선택되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.talent.value == ""){
		frm_insert.talent.focus();
		alert("특기가 선택되지 않았습니다!");
		return false;
	}
	if(document.frm_insert.agency.value == ""){
		frm_insert.agency.focus();
		alert("소속사가 입력되지 않았습니다!");
		return false;
	}
	alert('참가신청이 정상적으로 등록 되었습니다!');
	return true;
}

function resetData(){
	alert('정보를 지우고 처음부터 다시 입력합니다!');
	return true;
}