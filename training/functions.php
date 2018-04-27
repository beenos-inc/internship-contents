<?php
  function sanitize($target) {
    if (is_array($target)) {
      foreach ($target as $value) {
        $array[] = htmlspecialchars($value, ENT_QUOTES);
      }
      return $array;
    } else {
      return htmlspecialchars($target, ENT_QUOTES);
    }
  }
?>