<?php
  const NUMBER_OF_QUESTION = 5;

  /**
   * sanitize
   * 
   * POSTされた文字列をsanitizeする。
   * 
   * @param mixed array, string $target
   * @return mixed array, string
   */
  function sanitize($target) {
    if (is_array($target)) {
      foreach ($target as $value) {
        $array[] = htmlspecialchars(trim($value), ENT_QUOTES);
      }
      return $array;
    } else {
      return htmlspecialchars(trim($target), ENT_QUOTES);
    }
  }

  /**
   * errorCheck
   * 
   * 送信された解答項目に誤りがないかチェックする
   * 
   * @param array $responses
   * @param array $answers
   */
  function errorCheck($questions, $responses) {
    session_start();
    if (count($responses) != count($questions)) {
      $_SESSION['errorMessage'] = '全ての項目に解答していません';
      header('Location: exercise.php');
      exit;
    }

    foreach ($responses as $response) {
      if(!is_numeric($response)) {
        $_SESSION['errorMessage'] = '数値で解答してください。';
        header('Location: exercise.php');
        exit;
      }
    }
  }

  /**
   * showErrorMessage
   * 
   * sessionにエラーメッセージがある場合、
   * メッセージを表示し、exitする
   * 
   * @return bool
   */
  function showErrorMessage() {
    session_start();
    if (isset($_SESSION['errorMessage'])) {
      echo $_SESSION['errorMessage'];
      unset($_SESSION['errorMessage']);
      exit;
    } 
  }

  /**
   * checkTheAnswer
   * 
   * 解答が正解か不正解かを判定
   * 
   * @param array $responses
   * @param array $answers
   * 
   * @return array $explanation
   */
  function checkTheAnswer($responses, $answers) {
    for ($i = 0; $i < NUMBER_OF_QUESTION; $i++) {
      if ($responses[$i] == $answers[$i]) {
        $explanation[] = '...正解';
      } else {
        $explanation[] = '...不正解。答えは'.$answers[$i];
      }
    }
    return $explanation;
  }
?>