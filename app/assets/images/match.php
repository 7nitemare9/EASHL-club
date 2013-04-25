<div class="box">
  <h2><strong><img src="./images/headers/news.jpg" alt="Latest News" /></strong></h2>
  <p>
  <div class="content">
    <?php 
include("../config.php");
$result = mysql_query("SELECT * FROM EHC_matcher WHERE tid = $tid", $connect);
					while ($myrow = mysql_fetch_array($result)){
						?>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp; </p>
  <div align="center">
  <table width="480" border="1">
    <tr>
    <td width="210"><div align="center">EHC Rockets</div></td>
    <td width="38">-</td>
    <td width="210"><?php echo $myrow[motstandare]; ?></td>    
  </tr>
</table>

<p>&nbsp;</p>


<table>
	<tr>
	<td width="33"><h1><?php echo $myrow[gmal]; ?></h1></td>
    <td width="24"><h1>-</h1></td>
    <td width="46"><h1><?php echo $myrow[imal]; ?></h1></td>
    </tr>
</table>
</div>
  <p>&nbsp;</p>
  <div class="box" style="position: relative; width: 533px; left: 25px;">
    <h5>
    <?php
	if($myrow[RD] == 'Nizziano' || $myrow[RW2] == 'Nizziano'){ echo '<div style="top: 14px; left: 468px; position: absolute;"><img src="./images/matchroster/91in.jpg"/></div>';}
	else if($myrow[RD] != 'Nizziano' && $myrow[RW2] != 'Nizziano'){ echo '<div style="top: 14px; left: 468px; position: absolute;"><img src="./images/matchroster/91out.jpg"/></div>';}
	if($myrow[C] == 'ThePsychoKi11er'){ echo '<div style="top: 14px; left: 270px; position: absolute;"><img src="./images/matchroster/22in.jpg"/></div>';}
	else if($myrow[C] != 'ThePsychoKi11er'){ echo '<div style="top: 14px; left: 270px; position: absolute;"><img src="./images/matchroster/22out.jpg"/></div>';}
	if($myrow[RW] == 'kinnunen9'){ echo '<div style="top: 14px; left: 71px; position: absolute;"><img src="./images/matchroster/1in.jpg"/></div>';}
	else if($myrow[RW] != 'kinnunen9'){ echo '<div style="top: 14px; left: 71px; position: absolute;"><img src="./images/matchroster/1out.jpg"/></div>';}
	if($myrow[LW] == 'BloodySpoon81'){ echo '<div style="top: 14px; left: 204px; position: absolute;"><img src="./images/matchroster/19in.jpg"/></div>';}
	else if($myrow[LW] != 'BloodySpoon81'){ echo '<div style="top: 14px; left: 204px; position: absolute;"><img src="./images/matchroster/19out.jpg"/></div>';}
	if($myrow[LD] == 'Sork pippi'){ echo '<div style="top: 14px; left: 336px; position: absolute;"><img src="./images/matchroster/42in.jpg"/></div>';}
	else if($myrow[LD] != 'Sork pippi'){ echo '<div style="top: 14px; left: 336px; position: absolute;"><img src="./images/matchroster/42out.jpg"/></div>';}
	if($myrow[LD2] == 'zzwampen'){ echo '<div style="top: 14px; left: 5px; position: absolute;"><img src="./images/matchroster/0in.jpg"/></div>';}
	else if($myrow[LD2] != 'zzwampen'){ echo '<div style="top: 14px; left: 5px; position: absolute;"><img src="./images/matchroster/0out.jpg"/></div>';}
	if($myrow[RD] == 'I Have a xXx GT'){ echo '<div style="top: 14px; left: 137px; position: absolute;"><img src="./images/matchroster/4in.jpg"/></div>';}
	else if($myrow[RD] != 'I Have a xXx GT'){ echo '<div style="top: 14px; left: 137px; position: absolute;"><img src="./images/matchroster/4out.jpg"/></div>';}	
	if($myrow[RD2] == 'M4ck4n'){ echo '<div style="top: 14px; left: 402px; position: absolute;"><img src="./images/matchroster/55in.jpg"/></div>';}
	else if($myrow[RD2] != 'M4ck4n'){ echo '<div style="top: 14px; left: 402px; position: absolute;"><img src="./images/matchroster/55out.jpg"/></div>';}
	if($myrow[G] == 'Sork pippi'){ echo '<div style="top: 14px; left: 336px; position: absolute;"><img src="./images/matchroster/42in.jpg"/></div>';}	
	?>
    </h5>
  </div>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div align="center">
  <table width="373" border="1" class="tcenter" bgcolor="#202020" scope="col">
    <tr>
      <td width="156" height="25"><div align="center">Spelare</div></td>
      <td width="16">&nbsp;</td>
      <td width="60"><div align="center">Mål</div></td>
      <td width="35">&nbsp;</td>
      <td width="72"><div align="center">Assist</div></td>
    </tr>
    <?php
	if($myrow[C] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[C] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[CG] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[CA] . '</div></td>';
		echo '</tr>';
	}	
if($myrow[LW] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[LW] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LWG] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LWA] . '</div></td>';
		echo '</tr>';
	}
if($myrow[RW] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[RW] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RWG] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RWA] . '</div></td>';
		echo '</tr>';
	}
if($myrow[LD] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[LD] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LDG] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LDA] . '</div></td>';
		echo '</tr>';
	}
if($myrow[RD] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[RD] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RDG] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RDA] . '</div></td>';
		echo '</tr>';
	}
if($myrow[RW2] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[RW2] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RW2G] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RW2A] . '</div></td>';
		echo '</tr>';
	}
if($myrow[LD2] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[LD2] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LD2G] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[LD2A] . '</div></td>';
		echo '</tr>';
	}
	if($myrow[RD2] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[RD2] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RD2G] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[RD2A] . '</div></td>';
		echo '</tr>';
	}

	?>    
  </table>  
  </div>
  <p>&nbsp;</p>
  <div align="center">
   <table width="373" border="1" class="tcenter" bgcolor="#202020" scope="col">
    <tr>
      <td width="156" height="25" ><div align="center">Målvakt</div></td>
      <td width="16">&nbsp;</td>
      <td width="60"><div align="center">Insläppta</div></td>
      <td width="25">&nbsp;</td>
      <td width="82"><div align="center">Räddnings %</div></td>
    </tr>
    <?php
	if($myrow[G] != ''){
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow[G] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[GGA] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow[GSP] . '</div></td>';
		echo '</tr>';
	}	
	?>
    </table>
    
    </div>
    <div align="center"><p>Tidigare möten</p>
  <table width="373" border="1" class="tcenter" bgcolor="#202020" scope="col">
    <tr>
      <td width="136" height="25"><div align="center">ECH Rockets</div></td>
      <td width="8">&nbsp;</td>
      <td width="11"><div align="center">-</div></td>
      <td width="8">&nbsp;</td>
      <td width="176"><div align="center"><?php echo $myrow[motstandare]; ?></div></td>
    </tr>
    <?php
	$result2 = mysql_query("SELECT * FROM EHC_matcher WHERE motstandare = '$myrow[motstandare]' ORDER BY tid DESC", $connect);		
	while ($myrow2 = mysql_fetch_array($result2)){	
		echo '<tr>';
		  echo '<td height="25"><div align="center">' . $myrow2[gmal] . '</div></td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td>&nbsp;</td>';
		  echo '<td><div align="center">' . $myrow2[imal] . '</div></td>';
		echo '</tr>';
	}	?>
  </table>  
  </div>

<?php

}

					
?>     
</div>
</div>
</div>