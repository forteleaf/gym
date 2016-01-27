<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script src="/resources/js/Chart.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var chartLabels = [];
		var chartData = [];
		var id=$("#id").val();
		$.getJSON('/diary/count/' + id, function(data){
			$.each(data, function(i,obj){
				chartLabels.push(obj.date);
				chartData.push(obj.weight);
			});
			createChart();
		});
		var data = {
			    labels: chartLabels,
			    datasets: [
			        {
			            label: "My First dataset",
			            fillColor: "rgba(151,187,205,0.8)",
			            strokeColor: "rgba(151,187,205,0.8)",
			            highlightFill: "rgba(151,187,205,0.75)",
			            highlightStroke: "rgba(151,187,205,1)",
			            data: chartData
			        }	
				]
			}
			function createChart(){
				var ctx = $("#myWeight").get(0).getContext("2d");
				var myLineChart = new Chart(ctx).Line(data);
			}
	});
</script>

<input type="hidden" id="id" value="${id }">
<div>
	<canvas id="myWeight" width="400" height="250"></canvas>
</div>	