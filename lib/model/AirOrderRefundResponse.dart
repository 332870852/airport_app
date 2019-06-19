
class AirOrderRefundResponse{
  /**
   * 操作结果 1 成功 0 失败
   */
   String result;

   AirOrderRefundResponse(this.result);

   @override
   String toString() {
     return 'AirOrderRefundResponse{result: $result}';
   }

}