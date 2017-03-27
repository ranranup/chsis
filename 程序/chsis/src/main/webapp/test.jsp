<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>测试</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    -->
</head>
<body>
	<div id="selectDiv">
		<select>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select>
	</div>
</body>
<script src="assets/js/chsis/jquery.min.js"></script>

<script type="text/javascript">
	$('select').on('change', onSelect);
		
	function onSelect() {
		$(this).nextAll('select').remove();
		var value = $(this).attr('value');
		var newSelect = '<select>';
		newSelect += '<option value="'+ value + '1">'+ value +'1</option>';
		newSelect += '<option value="'+ value + '2">'+ value +'2</option>';
		newSelect += '<option value="'+ value + '3">'+ value +'3</option>';
		newSelect += '</select>';
		$('#selectDiv').append(newSelect);
		$('select').on('change', onSelect);
	}
</script>
</html>