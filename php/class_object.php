<?php
class Solution {
    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    // public $nums;
    public $target;
    public $nums = array(2,7,11,15);

    public function twoSum($target) {
    // public function twoSum($nums, $target) {
        // echo "第一個數字".$this->nums[0]."<br>";
        // echo "第二個數字為".$this->nums[1]."<br>";
        // // echo "目標數字".$this->target."<br>";//錯誤表示
        // echo "目標數字".$target."<br>"; 

        if($target==($this->nums[0]+$this->nums[1])){
            return 1;
        }else{
            return 0;
        }
    }
}

$abcd = new Solution();
echo "答案為".$abcd->twoSum(9);
// 正確的class以及this的使用方式(內涵array的部分)
// function外，class內的變數引用是使用this，如果是function裡面的則是直接使用變數。
?>