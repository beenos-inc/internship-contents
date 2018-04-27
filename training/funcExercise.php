<?php
  require('functions.php');

  class GenerateQuestions {
    private $max;
    private $output;
    function __construct($max, $output) {
      $this->max = $max;
      $this->output = $output;
    }

    private function generateAdditionFormula($num1, $num2) {
      $formula[$num1.' + '.$num2.' = '] = $num1 + $num2;
      return $formula;
    }
    private function generateSubtractionFormula($num1, $num2) {
      $formula[$num1.' - '.$num2.' = '] = $num1 - $num2;
      return $formula;
    }
    private function generateUnsettledFormula($num1, $num2) {
      return rand(0 ,1) ? $this->generateAdditionFormula($num1, $num2) : $this->generateSubtractionFormula($num1, $num2);;
    }

    public function generateFormula() {
      $formula = [];
      switch ($this->output) {
        case 1:
          for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
            $formula[] = $this->generateUnsettledFormula(rand(0, $this->max), rand(0, $this->max));
          }
          break;
        case 2:
          for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
            $formula[] = $this->generateSubtractionFormula(rand(0, $this->max), rand(0, $this->max));
          }
          break;
        case 3:
          for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
            $formula = $this->generateAdditionFormula(rand(0, $this->max), rand(0, $this->max));
          }
          break;
        
        default:
          break;
      }
      return $formula;
    }
  }
?>