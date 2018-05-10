<?php
  require('functions.php');

  class funcExercise {
    private $max;
    private $output;
    private $num1 = 0;
    private $num2 = 0;
    function __construct($max, $output) {
      $this->max = $max;
      $this->output = $output;
    }

    public function generateFormula() {
      $formula = [];
      for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
        $formula += $this->decideFormulaBranch();
      }
      return $formula;
    }

    private function decideFormulaBranch() {
      $this->rand();
      switch ($this->output) {
        case 1:
            return $this->generateAdditionFormula();
          break;
        case 2:
            return $this->generateSubtractionFormula();
          break;
        case 3:
            return $this->generateUnsettledFormula();
          break;
        
        default:
            return array();
          break;
      }
    }

    private function generateAdditionFormula() {
      return array($this->num1.' + '.$this->num2.' = ' => $this->num1 + $this->num2);
    }
    private function generateSubtractionFormula() {
      return array($this->num1.' - '.$this->num2.' = ' => $this->num1 - $this->num2);
    }
    private function generateUnsettledFormula() {
      return rand(0 ,1) ? $this->generateAdditionFormula() : $this->generateSubtractionFormula();;
    }

    private function rand() {
      $this->num1 = rand(0, $this->max);
      $this->num2 = rand(0, $this->max);
    }
  }
?>