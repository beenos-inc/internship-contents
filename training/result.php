<?php
  require('functions.php');
  const NUMBER_OF_QUESTION = 5;

  $responses = sanitize($_POST['responses']);
  $questions = sanitize($_POST['questions']);
  $answers = sanitize($_POST['answers']);

  if (count($responses) != NUMBER_OF_QUESTION) {
    exit('全ての項目に解答していません。');
  }

  for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
    if ($responses[$i] == $answers[$i]) {
      $comments[] = '...正解';
    } else {
      $comments[] = '...不正解。答えは'.$answers[$i];
    }
  }
?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Trainingå</title>
</head>
<body>
  <p>計算練習結果</p>
  <?php
    for ($i=0; $i < NUMBER_OF_QUESTION; $i++) {
      $j = $i + 1;
      echo $j.'問目 '.$questions[$i].' '.$responses[$i].' '.$comments[$i].'<br>';
    }
  ?>
</body>
</html>