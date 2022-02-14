<?php
echo "<h1>Olá Mundo!</h1>";
echo "<p>";
echo "<h2>Testando novo build</h2>";
echo "<p>";
echo "<h3>Novamente realizando um build</h3>";

?>
<html>
  <script language="JavaScript">
<!--
function showtime()
{ setTimeout("showtime();",1000);
callerdate.setTime(callerdate.getTime()+1000);
var hh = String(callerdate.getHours());
var mm = String(callerdate.getMinutes());
var ss = String(callerdate.getSeconds());
document.clock.face.value =
((hh < 10) ? " " : "") + hh +
((mm < 10) ? ":0" : ":") + mm +
((ss < 10) ? ":0" : ":") + ss;

}
callerdate=new Date(<?php echo date("Y,m,d,H,i,s");?>);
//-->
</script>
<body onLoad="showtime()">
<form name="clock"><input type="text" name="face" value="" size=15></form
</html>
