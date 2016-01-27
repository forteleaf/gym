<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" /> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="/resources/js/jquery.isloading.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script src="/resources/js/angular.min.js"></script>
<script src="/resources/js/angular-animate.min.js"></script>

<script>
	$(function(){
		// 메세지 submit
		$("#msgSendForm").submit(function(event){
			event.preventDefault();
			if($("#content").val().length <= 0 ){
			return;
			}
			$.ajax({
				  type: "POST",
				  url: "/msg/send/",
				  data: $("#msgSendForm").serialize(),
				  success:function(data){
					  if(data == "success"){
						$("#msgSend").modal("hide");
						$("#msgSuccess").modal();
					  }else{
						$("#msgSend").modal("hide");
						$("#msgFail").modal();
					  }
				  }
			});
		});
 	});

	// 
	var myControllerModule = angular.module('app',[]);
  	<% String id = (String) session.getAttribute("id");%>
  	myControllerModule.controller('MsgListCtrl',function($scope, $http, $filter){
		$http.get("/msg/userlistjson/<%=id%>").then(function (response){
			$scope.msglist = response.data;
			console.log(response.data);
			$scope.orderProperty = "send_date";
			$scope.reverse = false;
		    $scope.order = function(predicate) {
		        $scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
		        $scope.predicate = predicate;
		    };
		});
		
		// 메세지 읽기
		$scope.showfull = function(msgnum, index){
			
			//console.log("클릭이 되는 감요?"+msgnum);
			$http.get("/msg/changeread/"+msgnum).then(function(){
				$scope.msglist[index].status = 'Y'; // 읽음표시
				$('#showmsg').modal('show');
				$scope.msgsender = $scope.msglist[index].recv_id;
				$scope.msgcontent = $scope.msglist[index].content;
				//console.log($scope.msglist[index].msgnum); // 클릭되는 번호
			});
			$('#btndeletemsg').click(function(){
				$http.get("/msg/deletemsg/"+msgnum).then(function(){
					$('#showmsg').modal('hide');
					$scope.msglist.splice(index,1);
				});
			});
		};
  		
  		$scope.btnWriteMsg = function($scope) {
  			$("#msgSend").modal({backdrop: false});
  		};
	});
  	
</script>
<style>
.sortorder:after {
  content: '\25b2';
}
.sortorder.reverse:after {
  content: '\25bc';
}
</style>

<div ng-app="app" ng-controller="MsgListCtrl" >
<table class="table">
  <tbody>
  <tr>
  	<td ng-click="order('msgnum')">번호
  	<span class="sortorder" ng-show="predicate === 'msgnum'" ng-class="{reverse:reverse}"></span>
  	</td>
  	<td ng-click="order('status')">상태
  	<span class="sortorder" ng-show="predicate === 'status'" ng-class="{reverse:reverse}"></span>
  	</td>
  	<td ng-click="order('content')">내용
  	<span class="sortorder" ng-show="predicate === 'content'" ng-class="{reverse:reverse}"></span>
  	</td>
  	<td ng-click="order('id')">작성자
  	<span class="sortorder" ng-show="predicate === 'id'" ng-class="{reverse:reverse}"></span>
  	</td>
  	<td ng-click="order('send_date')">시간
  	<span class="sortorder" ng-show="predicate === 'send_date'" ng-class="{reverse:reverse}"></span>
  	</td>
  </tr>
  <tr ng-repeat="msg in msglist | filter:search | orderBy:predicate:reverse">
    <td>{{msg.msgnum}}</td>
    <td ng-switch on="msg.status" >
    	<span class="label label-warning" ng-switch-when="N">not read</span> 
    	<span class="label label-info" ng-switch-default="Y">read</span> 
    </td>
    <td name="msgContent" ng-click="showfull(msg.msgnum, $index)" ng-init="msglist = 15">{{msg.content | limitTo : msglist }}</td>
    <!-- <td>{{msg.id}}</td> -->
    <td>    
		<span class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" onclick="$('#recv_id').val($(this).text())" >{{msg.id }}</a>
			<span class="dropdown-menu">
			  <li><a type="button" ng-click="btnWriteMsg($event)">쪽지 보내기</a>
			  <!-- count 가 li 마다 var count 가 새로 시작 된다 -->
			</span>
		</span>
	</td>
    <td>{{msg.send_date}}</td>
    <!-- 에러보내기  -->
  </tr>
  </tbody>
</table>
<div class="container text-center">
	<div class="input-sm">
		<span>내용 검색 : </span> <input type="text" ng-model="search.content" />
	</div>
</div>
<!-- 메세지 보기 창을 만들었어요 -->

<div id="showmsg" class="modal fade" role="dialog">
  <div class="modal-dialog modal-sm">
    	<div class="panel panel-info">
		  <div class="panel-heading"> <span class="glyphicon glyphicon-envelope"></span><string>{{msgsender}}</string>님이 보낸 메세지</div>
		  <div class="panel-body">{{msgcontent}}</div>
		  <div class="panel-footer text-right">
		    <button class="btn btn-danger btn-sm" id="btndeletemsg">삭제하기</button>
		  </div>
		</div>
  </div>
</div>

</div>

<!-- 쪽지 보내기 form -->
<div class="modal fade" id="msgSend" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
        <h4 class="modal-title">쪽지 보내기</h4>
      </div>
        <form role="form" id="msgSendForm">
      <div class="modal-body">
          <!-- 로그인한 아이디 -->
          <input type="hidden" value="${id }" id="id" name="id">
          <input type="hidden" value="" id="recv_id" name="recv_id">
          <div class="form-group">
			<label for="comment">보낼 메세지 : </label>
			<textarea class="form-control" rows="3" id="content" name="content"></textarea>
		  </div>
	  </div>
	  <div class="modal-footer">
	    <button type="submit" class="btn btn-success">Send</button>
	    <button type=reset class="btn btn-danger" data-dismiss="modal">Close</button>
	  </div>
	    </form>
    </div>
  </div>
</div>
