<?php
  require('./functions/funcResult.php');

  $responses = sanitize($_POST['responses']);
  $questions = sanitize($_POST['questions']);
  $answers = sanitize($_POST['answers']);

  // 入力された解答に誤りがある場合
  // sessionにエラーメッセージを入れて
  // exercise.phpにリダイレクトする
  session_start();
  if (count($responses) != count($questions)) {
    $_SESSION['errorMessage'] = '全ての項目に解答していません';
    header('Location: exercise.php');
  }

  foreach ($responses as $response) {
    if(!is_numeric($response)) {
      $_SESSION['errorMessage'] = '数値で解答してください。';
      header('Location: exercise.php');
    }
  }

  $comments = checkTheAnswer($responses, $answers);
  
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