<?php
  require('functions.php');
  const NUMBER_OF_QUESTION = 5;

  $digit = sanitize($_POST['digit']);
  $calculation = sanitize($_POST['calculation']);

  if ($digit == '') {
    exit('問題桁数が選択されていません');
  }

  if ($digit == 1) {
    $max = 9;
  } else {
    $max = 99;
  }

  for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
    $number1[] = rand(0, $max);
    $number2[] = rand(0, $max);
  }

  // 足し算と引き算の式作成、および解答を記録
  if (in_array(1, $calculation) && in_array(2, $calculation)) {
    for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
      $operator = rand(0, 1);
      if ($operator == 0) {
        $answers[] = $number1[$i] + $number2[$i];
        $questions[] = $number1[$i].' + '.$number2[$i].' = ';
      } else {
        $answers[] = $number1[$i] - $number2[$i];
        $questions[] = $number1[$i].' - '.$number2[$i].' = ';
      }
    }
  } else if (in_array(2, $calculation)) {
    for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
      $answers[] = $number1[$i] - $number2[$i];
      $questions[] = $number1[$i].' - '.$number2[$i].' = ';
    }
  } else {
    for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
      $answers[] = $number1[$i] + $number2[$i];
      $questions[] = $number1[$i].' + '.$number2[$i].' = ';
    }
  }

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
  <form action="result.php" method="post">
    <?php 
      for ($i=0; $i < NUMBER_OF_QUESTION; $i++) {
        $j = $i + 1;
        echo $j.'問目  '.$questions[$i].'<input type="text" name="responses[]"><br>';
        echo '<input type="hidden" name="questions[]" value="'.$questions[$i].'">';
        echo '<input type="hidden" name="answers[]" value="'.$answers[$i].'">';
      }
    ?>
    <input type="submit" value="送信">
  </form>
</body>
</html>