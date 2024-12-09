<?php
$currentValue = 0;
$input = [];

function calculateInput($userInput){
    $arr = [];
    $char = "";
    foreach ($userInput as $num){
        if (is_numeric($num) || $num == ".") {
            $char .= $num;
        } else {
            if (!empty($char)) {
                $arr[] = $char;
                $char = "";
            }
            $arr[] = $num;
        }
    }
    if (!empty($char)) {
        $arr[] = $char;
    } 

    $current = 0;
    $action = null;
    foreach ($arr as $value) {
        if (is_numeric($value)) {
            if ($action) {
                switch ($action) {
                    case "+":
                        $current += $value;
                        break;
                    case "-":
                        $current -= $value;
                        break;
                    case "x":
                        $current *= $value;
                        break;
                    case "/":
                        $current /= $value;
                        break;
                }
                $action = null;
            } else {
                $current = $value;
            }
        } else {
            $action = $value;
        }
    }
    return $current;
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    if (isset($_POST['input'])) {
        $input = json_decode($_POST['input']);
    }

    foreach ($_POST as $key => $value) {
        if (is_numeric($key)) {
            $input[] = $key;
        } elseif ($key == "c") {
            $input = [];
            $currentValue = 0;
        } elseif ($key == "equal") {
            $currentValue = calculateInput($input);
            $input = [];
        } elseif ($key == "back") {
            array_pop($input);
        } elseif ($key != "input") {
            $input[] = $value;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Calculator</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>
<div class="main">
    <h3>Kalkulator</h3>
    <div>
        <form method="post" id="form">
            <input class="form-control" type="text" value="<?php echo implode("", $input); ?>" readonly />
            <input class="form-control" type="hidden" name="input" value='<?php echo json_encode($input); ?>'/>
            <input class="form-control" type="text" value="<?php echo $currentValue; ?>" readonly />
            <table style="width:100%;">
                <tr>
                    <td><input class="form-control" type="submit" name="c" value="C" /></td>
                    <td><input class="form-control" type="submit" name="back" value="←" /></td>
                    <td><input class="form-control" type="submit" name="divide" value="&#247;" /></td>
                    <td><input class="form-control" type="submit" name="multiply" value="x" /></td>
                </tr>
                <tr>
                    <td><input class="form-control" type="submit" name="7" value="7" /></td>
                    <td><input class="form-control" type="submit" name="8" value="8" /></td>
                    <td><input class="form-control" type="submit" name="9" value="9" /></td>
                    <td><input class="form-control" type="submit" name="minus" value="-" /></td>
                </tr>
                <tr>
                    <td><input class="form-control" type="submit" name="4" value="4" /></td>
                    <td><input class="form-control" type="submit" name="5" value="5" /></td>
                    <td><input class="form-control" type="submit" name="6" value="6" /></td>
                    <td><input class="form-control" type="submit" name="add" value="+" /></td>
                </tr>
                <tr>
                    <td><input class="form-control" type="submit" name="1" value="1" /></td>
                    <td><input class="form-control" type="submit" name="2" value="2" /></td>
                    <td><input class="form-control" type="submit" name="3" value="3" /></td>
                    <td><input class="form-control" type="submit" name="equal" value="=" /></td>
                </tr>
                <tr>
                    <td><input class="form-control" type="submit" name="0" value="0" /></td>
                    <td><input class="form-control" type="submit" name="." value="." /></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
