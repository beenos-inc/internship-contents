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
  <p>どの範囲で問題を出題しますか？</p>
  <form action="exercise.php" method="post">
    <p>
      問題桁数<br>
      <input type="radio" name="digit" value="1" checked="checked">0-9まで<br>
      <input type="radio" name="digit" value="2">0-99まで
    </p>
    <p>
      演算指定（指定がないときは足し算のみ行われます）<br>
      <input type="checkbox" name="calculation[]" value="1">足し算<br>
      <input type="checkbox" name="calculation[]" value="2">引き算
    </p>
    <input type="submit">
  </form>
  <button type="button" onclick="clearInput()">リセット</button>
</body>
</html>