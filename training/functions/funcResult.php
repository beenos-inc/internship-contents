<?php
  require('functions.php');

  /**
   * checkTheAnswer
   * 
   * 解答が正解か不正解かを判定
   * 
   * @param array $responses
   * @param array $answers
   * 
   * @return array $comments
   */
  function checkTheAnswer($responses, $answers) {
    for ($i=0; $i < NUMBER_OF_QUESTION; $i++) {
      if ($responses[$i] == $answers[$i]) {
        $comments[] = '...正解';
      } else {
        $comments[] = '...不正解。答えは'.$answers[$i];
      }
    }
    return $comments;
  }

?>