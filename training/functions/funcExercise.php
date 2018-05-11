<?php
  const RANGE_OF_DIGIT_9 = 9;
  const RANGE_OF_DIGIT_99 = 99;

  const ADDITION_FORMULA = 1;
  const SUBTRACTION_FORMULA = 2;
  const UNSETTELED_FORMULA = 3;

  require('functions.php');

  /**
   * 
   * @author 河崎鷹大
   * 
   */
  class funcExercise {
    private $max;
    private $output;
    private $num1 = 0;
    private $num2 = 0;
    
    function __construct($digit, $calculation) {
      $this->max = ($digit == 1) ? RANGE_OF_DIGIT_9 : RANGE_OF_DIGIT_99;

      if (count($calculation) == 2) {
        $this->output = UNSETTELED_FORMULA;
      }  else {
        $this->output = empty($calculation) ?  ADDITION_FORMULA : $calculation[0];
      }
    }

    /**
     * public
     * generateFormula
     * 
     * 表示する計算式を出力する
     * 
     * @return array
     */
    public function generateFormula() {
      $formula = [];
      for ($i=0; $i < NUMBER_OF_QUESTION; $i++) { 
        $formula += $this->decideFormulaBranch();
      }
      return $formula;
    }

    /**
     * private
     * decideFormulaBranch
     * 
     * 出力する計算式が足し算か引き算のみか
     * 足し算と引き算を混ぜるか判定する
     * 
     * @return array
     */
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

    /**
     * private
     * generateAdditionFormula
     * 
     * 足し算の式を作成
     * 
     * @return array
     */
    private function generateAdditionFormula() {
      return array($this->num1.' + '.$this->num2.' = ' => $this->num1 + $this->num2);
    }
    /**
     * private
     * generateSubtractionFormula
     * 
     * 引き算の式を作成
     * 
     * @return array
     */
    private function generateSubtractionFormula() {
      return array($this->num1.' - '.$this->num2.' = ' => $this->num1 - $this->num2);
    }
    /**
     * private
     * generateUnsettledFormula
     * 
     * 足し算か引き算の式を作成
     * 
     * @return array
     */
    private function generateUnsettledFormula() {
      return rand(0 ,1) ? $this->generateAdditionFormula() : $this->generateSubtractionFormula();;
    }

    /**
     * private
     * rand
     * 
     * 0から$maxまでの数字をnum1とnum2に格納
     */
    private function rand() {
      $this->num1 = rand(0, $this->max);
      $this->num2 = rand(0, $this->max);
    }
  }
?>