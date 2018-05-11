<?php
  const NUMBER_OF_QUESTION = 5;

  /**
   * sanitize
   * 
   * POSTされた文字列をsanitizeする。
   * 
   * @param mixed array, string $target
   * 
   * @return mixed array, string
   */
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