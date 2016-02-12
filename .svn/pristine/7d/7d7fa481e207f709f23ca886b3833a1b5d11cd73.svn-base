<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="/resources/js/Chart.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	var chartLabels = [];
	var chartData = [];
		$.getJSON('/instructor/paydetail', function(data){
			$.each(data, function(i,obj) {
				if(obj.work==1){
					chartLabels.push(obj.id);
					chartData.push(obj.sal);	
				}
			});
			createChart();
		});
		var data = {
			    labels: chartLabels,
			    datasets: [
			        {
			            label: "My First dataset",
			            fillColor: "rgba(151,187,205,0.5)",
			            strokeColor: "rgba(151,187,205,0.8)",
			            highlightFill: "rgba(151,187,205,0.75)",
			            highlightStroke: "rgba(151,187,205,1)",
			            data: chartData
			        }	
				]
			}
			function createChart(){
				var ctx = $("#myChart").get(0).getContext("2d");
				var myBarChart = new Chart(ctx).Bar(data);
		}
	});
</script>

<!-- 봉급 바 차트 -->
<div>
	<canvas id="myChart" width="700" height="400"></canvas>
</div>	




<div id="paycheck">

</div>