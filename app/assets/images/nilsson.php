<style type="text/css">
body,td,th {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12px;
}
</style>

			<div id="right-column">
				
				<!-- Latest News -->
				<div class="box"> <strong><img src="images/headers/empty.jpg" alt="Latest News" /></strong>
				
					<div class="content">
						<!-- News Subject -->
					  <h3><img src="images/Nilsson.png" width="291" height="47" /><img src="images/91.jpg" alt="" width="250" height="346" align="right" /></h3>
					  <p><strong>Info</strong></p>
                      <p>Age: 29                      </p>
                      <p>Height: 1.88 m                      </p>
                      <p>Weight: 90 kg					  </p>
                      <p>Playertype: Powerforward </p>
                      <div style="margin-left:215px; margin-top:-140px;"><img src="images/nizzefoto.jpg" /></div><p>&nbsp;</p>
                      <p><strong>Biography</strong></p>
					  <p>Nilsson är en offensiv forward med tungt skott och hårda tacklingar. 
				      När han tänder till med sitt offensiva spel i underlägen är han en katalyst för hela laget.				      I defensiven är han omutbar och lägger ner varenda spelare som kommer i närheten.	Varierar	med	finurliga	passningar	och listiga skott.</p>
					  <p>Så när du befinner dig liggande på isen så är med största sannolikhet numret på lastbilen som körde över dig 91.<br />
				      </p>
<p>&nbsp;</p>
<p>Bra och dåliga egenskaper</p>
<p><img src="images/up.png" width="28" height="28" />Finurliga passningar och hårda handledsskott.</p>
<p><img src="images/up.png" alt="" width="28" height="28" />Uppfinningsrikedom i anfallszon.</p>
<p><img src="images/up.png" alt="" width="28" height="28" />Brutala tacklingar.</p>
<p><img src="images/down.png" width="28" height="28" /> Ibland överarbetar situationen mer än vad det behövs.
  <br />
</p>
<?php
					  	include("../config.php");
$result = mysql_query("SELECT * FROM EHC_Spelare WHERE Namn = 'Nizziano'", $connect);
while ($myrow = mysql_fetch_array($result)){ ?><p align="center"><img src="images/Statisticscareer.png" width="134" height="14" /></p>
<div align="center">
  <table width="523" border="1" align="center" cellspacing="2" class="tcenter">
    <tr>
      <th width="103" align="center" height="17"  scope="col"><div align="center">World Rank</div></th>
      <th width="71" align="center"  scope="col"><div align="center">Games </div></th>
      <th width="62" align="center"  scope="col"><div align="center">Goals</div></th>
      <th width="86" align="center"  scope="col"><div align="center">Assists</div></th>
      <th width="87" align="center"  scope="col"><div align="center">Points</div></th>
      <th width="70" align="center"  scope="col"><div align="center">+/-</div></th>
      </tr>
    <tr>
      <td align="center" ><div align="center"><?php echo $myrow[Rank]; ?></div></td>
      <td align="center" ><div align="center"><?php echo $myrow[Matcher]; ?></div></td>
      <td align="center" ><div align="center"><?php echo $myrow[Mal]; ?></div></td>
      <td align="center" ><div align="center"><?php echo $myrow[Assist]; ?></div></td>
      <td align="center" ><div align="center"><?php echo $myrow[Poang]; ?></div></td>
      <td align="center" ><div align="center"><?php echo $myrow[plusminus]; ?></div></td>
      </tr>
  </table>
</div>
<p align="center"><img src="images/Statisticscareerpergame.png" width="134" height="14" /></p>
<div align="center">
  <table width="523" border="1" cellspacing="2" class="tcenter">
    <tr>
      <th width="95" height="17" align="center"  scope="col"><div align="center">Points</div></th>
      <th width="67" align="center"  scope="col"><div align="center">+/-</div></th>
      <th width="89" align="center"  scope="col"><div align="center">Goals</div></th>
      <th width="76" align="center"  scope="col"><div align="center">Assists</div></th>
      <th width="61" align="center"  scope="col"><div align="center">Hits </div></th>
      <th width="91" align="center"  scope="col"><div align="center">PIM</div></th>
      </tr>
    <tr>
      <td align="center" ><div align="center"><?php $temp = $myrow[Poang] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" ><div align="center"><?php $temp = $myrow[plusminus] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" ><div align="center"><?php  $temp = $myrow[Mal] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" ><div align="center"><?php $temp = $myrow[Assist] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" ><div align="center"><?php $temp = $myrow[Hits] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" ><div align="center"><?php $temp = $myrow[PIM] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      </tr>
  </table>
</div>
<p>* Statistics since 26/1 - 2011</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<?php } ?>
                  </div>	
				</div>
				
			</div>
			
