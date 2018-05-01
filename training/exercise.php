<?php
  const RANGE_OF_DIGIT_9 = 9;
  const RANGE_OF_DIGIT_99 = 99;

  require('funcExercise.php');

  $digit = sanitize($_POST['digit']);
  $calculation = sanitize($_POST['calculation']);

  if ($digit == 1) {
    $max = RANGE_OF_DIGIT_9;
  } else {
    $max = RANGE_OF_DIGIT_99;
  }

  if (in_array(1, $calculation) && in_array(2, $calculation)) {
    $output = 1;
  } else if (in_array(2, $calculation)) {
    $output = 2;
  } else {
    $output = 3;
  }

  $question = new GenerateQuestions($max, $output);
  $formula = $question->generateFormula();

?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <script src="sample.js" type="text/javascript"></script>
  <title>Training</title>
</head>
<body>
  <p>計算演習</p>
  <p>
    選択したのは0-<?php echo $max; ?>までの問題です。<br>
    全部で<?php echo NUMBER_OF_QUESTION ?>問出題します。
  </p>
  <form action="result.php" method="post" onsubmit="return validation()">
    <?php 
      foreach ($formula as $key => $value) {
        $count++;
        echo $count.'問目  '.$key.'<input type="text" name="responses[] value=""><br>';
        echo '<input type="hidden" name="questions[]" value="'.$key.'">';
        echo '<input type="hidden" name="answers[]" value="'.$value.'">';
      }
    ?>
    <input type="submit" value="送信">
  </form>
  <button type="button" onclick="clearInput()">リセット</button>
</body>
</html>