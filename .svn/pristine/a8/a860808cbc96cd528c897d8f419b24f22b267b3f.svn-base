<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="/resources/js/Chart.min.js"></script>
<h1>운동세부정보!</h1>
<table class="table table-hover">
	<tr>
		<th>운동번호</th>
		<th>운동명</th>
		<th>운동분류</th>
		<th>소모칼로리</th>
		<th>유산소</th>
		<th>근력</th>
		<th>지구력</th>
	</tr>
	<tr>
		<td>${dto.exnum }</td>
		<td>${dto.exname }</td>
		<td>${dto.exclass }</td>
		<td id="calorie">${dto.calorie }</td>
		<td id="aero">${dto.aero }</td>
		<td id="stren">${dto.strength }</td>
		<td id="stam">${dto.stamina }</td>
	</tr>
</table>
<!-- 
	"소모칼로리" : $("#calorie").val() + "cal",
			"유산소" : $("#aero").val() + "%",
			"근력" : $("#stren").val()+ "%",
			"지구력" : $("#stam").val()+ "%"

 -->
<script type="text/javascript">
	$(document).ready(function(){
		var data = {
			    labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
			    datasets: [
			        {
			            label: "My First dataset",
			            fillColor: "rgba(220,220,220,0.2)",
			            strokeColor: "rgba(220,220,220,1)",
			            pointColor: "rgba(220,220,220,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(220,220,220,1)",
			            data: [65, 59, 90, 81, 56, 55, 40]
			        },
			        {
			            label: "My Second dataset",
			            fillColor: "rgba(151,187,205,0.2)",
			            strokeColor: "rgba(151,187,205,1)",
			            pointColor: "rgba(151,187,205,1)",
			            pointStrokeColor: "#fff",
			            pointHighlightFill: "#fff",
			            pointHighlightStroke: "rgba(151,187,205,1)",
			            data: [28, 48, 40, 19, 96, 27, 100]
			        }
			    ]
			};
		var ctx = $("#myChart").get(0).getContext("2d");
		var myRadarChart = new Chart(ctx).Radar(data);
		alert("ss");
	});
</script>
 
 
<canvas id="myChart" width="400" height="400"></canvas>


