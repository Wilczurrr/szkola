<!DOCTYPE html>
<html lang="pl">
<head>
    <link rel="stylesheet" href="style.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <header class="header">
        <h1>Portal dla wędkarzy</h1>
    </header>
    <div class="lewy1">
        <h3>Ryby zamieszkujące rzeki</h3>
    <ol>     
    <?php
    $servername = "localhost";
    $dbase = "wedkowanie";
    $username = "root";
    $password = "";

    $conn = mysqli_connect($servername, $username, $password, $dbase);



    $sql = "SELECT nazwa,akwen,wojewodztwo FROM ryby INNER JOIN lowisko ON ryby.id = lowisko.ryby_id WHERE rodzaj=3; ";
    $wynik = $conn->query($sql);
    while($row = mysqli_fetch_array($wynik)){

        echo "<li>$row[0] pływa w rzece $row[1], $row[2]</li>";

    }
    ?> 
    </ol>

    
    </div>
    <div class="lewy2">
        <h3>Ryby drapieżne naszych wód</h3>
        <table>
            <tr>
                <td>L.p</td>
                <td>Gatunek</td>
                <td>Wystepowanie</td>
            </tr>
        <?php 
        
        $sql1 = "SELECT `id`,`nazwa`,`wystepowanie` FROM `ryby` WHERE `styl_zycia` = 1;";
        $wynik1 = $conn->query($sql1);
        while($row1 = mysqli_fetch_array($wynik1)){

        echo "<tr><td>$row1[0]</td><td>$row1[1]</td><td>$row1[2]</td></tr>";

        }

        mysqli_close($conn);  
        ?>
        </table>
    </div>
    <div class="prawy">
        <img src="ryba1.jpg" class="ryba">
        <a href="Kwerendy.txt">Kwerendy.txt</a>
    </div>
    <footer class="stopka">
        <p>Stornę wykonał:123456789</p>
    </footer>


    
</body>


</html>