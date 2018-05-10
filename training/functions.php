<?php
  const NUMBER_OF_QUESTION = 5;

  function sanitize($target) {
    if (is_array($target)) {
      foreach ($target as $value) {
        $array[] = trim(htmlspecialchars($value, ENT_QUOTES));
      }
      return $array;
    } else {
      return trim(htmlspecialchars($target, ENT_QUOTES));
    }
  }
?>