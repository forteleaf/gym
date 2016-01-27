<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div style="background-color: #ffffff">
<form action="/fboard/update" id="frm" method="post" >
<table border="1" width="1000"table class="table table-hover">
<tr><td>
<h1>계시글수정</h1>
</td></tr>
	<tr><td>
	<input type="hidden" name="fbnum" value="${dto.fbnum }">
	<input type="hidden" name="writer" value="${dto.id }">
	작성자<input type="text" name="writer" value="${dto.id }" disabled="disabled">
	</td></tr>
	<tr><td>
	제목 <input type="text" name="title" value="${dto.title }">
	</td></tr>
	<tr><td>
	내용<br>
	<textarea name="content" id="editor" rows="10" cols="100" style="width:766px; height:412px;">${dto.content }</textarea> 
		     <script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];               
        //스마트에디터 프레임생성
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: obj,
            elPlaceHolder: "editor",
            sSkinURI: "/resources/editor/SmartEditor2Skin.html", 
            htParams : {
                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseToolbar : true,             
                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,     
                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true, 
            }
        });
        //전송버튼
        $("#updatebtn").click(function(){
        	$('#confirmupdatefb').modal('show');
        	$('#btnupdateok').click(function(){
	            //id가 smarteditor인 textarea에 에디터에서 대입
	            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	            //폼 submit
            	$("#frm").submit();
        	});
        	$('#btnconfirmupdatefb').click(function(){
        		$('#confirmupdatefb').modal('hide');
        	});
        });
    })
    </script><br>
    <div class="text-center">
	<input type="button" class="btn btn-primary btn-xs" id="updatebtn" value="수정"> <a href="/fboard/plist" class="btn btn-primary btn-xs" role="button">목록</a><br>
	</div>
	</td></tr>
	</table>
</form>
</div>
<div id="confirmupdatefb" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-success">
		  <div class="panel-heading">
		  <div class="panel-body"><h3>수정을 완료하시겠습니까</h3></div></div>
		  <div class="panel-footer text-center">
		    <button class="btn btn-primary glyphicon glyphicon-ok" id="btnupdateok">수정하기</button>
		    <button class="btn btn-danger glyphicon glyphicon-remove" id="btnconfirmupdatefb">취소</button>
		  </div>
		</div>
  </div>
</div>
<div style="height: 100px;"></div>
