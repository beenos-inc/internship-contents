<?php
  require('functions.php');

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