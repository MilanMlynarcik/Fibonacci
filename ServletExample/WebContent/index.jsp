<!DOCTYPE html>

<head>
<title></title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){

						var jobNumber = 0;
						var maxNumber;
						
						function pollServer() {
						
							$.ajax({
										type : 'get', // it's easier to read GET request parameters
										url : 'someservlet',
										dataType : 'JSON',
										data : {
											jobNum:jobNumber,
											max : maxNumber
										// look here!
										},

										success : function(responseJson) {

											
											$('#main').hide();
											jobNumber = responseJson[1];
											
											document.getElementById("somediv1").innerHTML = "Job Number: "+jobNumber;

											var result = responseJson[0];

											if (result != '0') {
												
												document.getElementById("somediv2").innerHTML = "Fib Sequence: "+ responseJson[0];
												$('#somebutton2').style.visibility='visible';
												clearInterval(interval);

											} else {
												document.getElementById("somediv2").innerHTML = "Page will refresh in 10s.";

											} 

										},
										error : function(data) {
											alert('fail');

										}
									});

						}
						function getMax() {
							return $('#maxNumber').val();
						}
						$('#somebutton').click(function(event) {
							
							maxNumber = getMax();
							pollServer()
							interval = setInterval(pollServer, 2000);

						});

					});
</script>
</head>
<body>
	<div id="main">
		<p>Fibonacci Sequence Length
		<p>
			<input type="text" id="maxNumber">
			<p>(Value 1-100)</p>
			<button id="somebutton">Submit</button>
	</div>

	<div id="somediv1"></div>
	<div id="somediv2"></div>
<button id="somebutton2" style="visibility:hidden" >Back to Start</button>

</body>
</html>