<?php
  require('./functions/functions.php');

  $responses = sanitize($_POST['responses']);
  $questions = sanitize($_POST['questions']);
  $answers = sanitize($_POST['answers']);

  errorCheck($questions, $responses);
  
  $comments = checkTheAnswer($responses, $answers);
  
?>

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Training</title>
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