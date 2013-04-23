
				<div class="box">
					<h2><strong><img src="./images/headers/news.jpg" alt="Latest News" /></strong></h2>
				
					<div class="content">
						<!-- News Subject -->
					  <h3><img src="ostlund.jpg" width="291" height="38" /><img src="images/hockeykortmall.png" alt="" width="250" height="346" align="right" /></h3>
 <p>Bio</p>
 <p>Lagets mest värdefullaste spelare utan tvekan när han är på humör i buren. Hans insatser har gång på gång gett oss vinster då vi kanske inte förtjänar det. Med sitt fantastiska spelsinne lyckas han läsa av även de farligaste måltjuvarna.1</p>
 <p> Hans största styrka är hans lugn, vilket i sin tur gör att vi får backar som är trygga.</p>
 <p>&nbsp;</p>
 <p>Bra och dåliga egenskaper</p>
<p><img src="images/up.png" alt="d" width="28" height="28" />Lugnet och följamheten.</p>
 <p><img src="images/up.png" alt="d" width="28" height="28" />Ruskigt snabb plockhandske.</p>
 <p><img src="images/up.png" alt="d" width="28" height="28" />Bra pådrivare.</p>
 <p><img src="images/down.png" alt="e" width="28" height="28" />Frilägen.</p>
<p align="center">&nbsp;</p>
<?php
					  	include("../config.php");
$result = mysql_query("SELECT * FROM EHC_Spelare WHERE Namn = 'Sork pippi'", $connect);
while ($myrow = mysql_fetch_array($result)){ ?>
<div align="center">
  <p>Målvakts-statistik</p>
  <table width="523" border="1" cellspacing="2" class="tcenter">
    <tr>
      <th width="95" height="17" align="center" bgcolor="#202020" scope="col"><div align="center">Games</div></th>
      <th width="67" align="center" bgcolor="#202020" scope="col"><div align="center">GAA</div></th>
      <th width="89" align="center" bgcolor="#202020" scope="col"><div align="center">Goals against</div></th>
      <th width="76" align="center" bgcolor="#202020" scope="col"><div align="center">Saves</div></th>
      <th width="61" align="center" bgcolor="#202020" scope="col"><div align="center">Save %</div></th>
      <th width="91" align="center" bgcolor="#202020" scope="col"><div align="center">Shutouts</div></th>
    </tr>
    <tr>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Gmatcher]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center">
        <?php $temp = $myrow[GGA] / $myrow[Gmatcher]; echo round($temp,2); ?>
      </div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[GGA];  ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[saves]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center">
        <?php $temp = ($myrow[saves] / ($myrow[saves] + $myrow[GGA])) * 100; echo round($temp,1); ?>
      </div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[shutouts]; ?></div></td>
    </tr>
  </table>
</div>
<p align="center">Nuvarande statistik</p>
<div align="center">
  <table width="523" border="1" align="center" cellspacing="2" class="tcenter">
    <tr>
      <th width="103" align="center" height="17" bgcolor="#202020" scope="col"><div align="center">World Rank</div></th>
      <th width="71" align="center" bgcolor="#202020" scope="col"><div align="center">Games </div></th>
      <th width="62" align="center" bgcolor="#202020" scope="col"><div align="center">Goals</div></th>
      <th width="86" align="center" bgcolor="#202020" scope="col"><div align="center">Assists</div></th>
      <th width="87" align="center" bgcolor="#202020" scope="col"><div align="center">Points</div></th>
      <th width="70" align="center" bgcolor="#202020" scope="col"><div align="center">+/-</div></th>
      </tr>
    <tr>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Rank]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Matcher]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Mal]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Assist]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[Poang]; ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php echo $myrow[plusminus]; ?></div></td>
      </tr>
  </table>
</div>
<p align="center">	Snittresultat per match</p>
<div align="center">
  <table width="523" border="1" cellspacing="2" class="tcenter">
    <tr>
      <th width="95" height="17" align="center" bgcolor="#202020" scope="col"><div align="center">Points</div></th>
      <th width="67" align="center" bgcolor="#202020" scope="col"><div align="center">+/-</div></th>
      <th width="89" align="center" bgcolor="#202020" scope="col"><div align="center">GAA *</div></th>
      <th width="76" align="center" bgcolor="#202020" scope="col"><div align="center">PIM</div></th>
      <th width="61" align="center" bgcolor="#202020" scope="col"><div align="center">Hits </div></th>
      <th width="91" align="center" bgcolor="#202020" scope="col"><div align="center">Blocked Shots</div></th>
      </tr>
    <tr>
      <td align="center" bgcolor="#202020"><div align="center"><?php $temp = $myrow[Poang] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php $temp = $myrow[plusminus] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php if($myrow[GA] == 0 || $myrow[MatcherStart] == 0) { echo 0; } else { $temp = ($myrow[GA] - $myrow[GGA]) / $myrow[Matcher]; echo round($temp,1);}  ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php $temp = $myrow[PIM] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php $temp = $myrow[Hits] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      <td align="center" bgcolor="#202020"><div align="center"><?php $temp = $myrow[BS] / $myrow[Matcher]; echo round($temp,1); ?></div></td>
      </tr>
  </table>
</div>
<p align="center">&nbsp;</p>
<p>* Statistik sedan 26/1 - 2011</p>
<p>&nbsp;</p>
<?php } ?>
                  </div>	
				</div>
				
			</div>
			
	