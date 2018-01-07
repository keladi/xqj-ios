
import HandyJSON
import Alamofire
import Foundation
class PayPayNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "pay_type": "alipay", 
    "order_type": "touzi_order", 
    "order_id": 1, 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "pay_method": "alipay"
}
*/
class Params:HandyJSON {
var acc: String = ""
var payType: String = ""
var orderType: String = ""
var orderId: Int = 0
var userToken: String = ""
var payMethod: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.payType <-- "pay_type"
mapper <<<
        self.orderType <-- "order_type"
mapper <<<
        self.orderId <-- "order_id"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.payMethod <-- "pay_method"
}
}
// 响应
/* 

{
    "info": "操作成功", 
    "code": 0, 
    "raw": null, 
    "Raw": null, 
    "result": {
        "order_str": "alipay_sdk=alipay-sdk-php-20161101&app_id=2017122301104679&biz_content=%7B%22body%22%3A%22%5Cu5411%5Cu524d%5Cu8fdb%22%2C%22subject%22%3A%22%5Cu5411%5Cu524d%5Cu8fdb%22%2C%22out_trade_no%22%3A%2250f0517a1796b0eb52ad2852bd5787eb%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A1234%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&charset=UTF-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Falipay.serv.xiangqianjin888.com%2Fnotify.php&sign_type=RSA2&timestamp=2017-12-23+14%3A22%3A04&version=1.0&sign=IzR%2BpQ6OJqjDZ%2BaSX7Xkv%2BTNmLIrTJUR6PH1T5mmohl%2BFMRhmOBwPQYWbQIGwiqKOZaOmaMCgJEUrKKWcRfXE6riiX5q4kCWUUx7edSfdHcpdfQjzqTt6xQYEP4DlvSJAsgswllEJMN1YoO7ShDm%2BU50XGtyWwUVWka4gHaMM8vKbGtJhgwDhZTqgpZ7jlismUr37db6XFhv7ExVkO%2Bjnk0rASBoDzhoZrI%2BBlavpMIwSRxqohEdw4TEFcPUF9%2BJ3lal8k6mbzZhkg8cCQXsbEeQmwa7OLKHA%2FXRz7mOLMOy2mne7N303siz%2F1fdtpxAN%2BawH6oGm6CCkNKuiWf4%2Bw%3D%3D"
    }, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
var orderStr: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.orderStr <-- "order_str"
}
}
class Response:HandyJSON {
var info: String = ""
var errMsg: String = ""
var result: Result?  
var msg: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.info <-- "info"
mapper <<<
        self.errMsg <-- "err_msg"
mapper <<<
        self.result <-- "result"
mapper <<<
        self.msg <-- "msg"
}
}
//请求

    func request(params: Params, callback: @escaping ((_ resp: Response?) -> ())) {

        Alamofire.request(NetworkConfig.Server+"/rest/pay/pay", method: .post, parameters:[
            "acc" : params.acc, 
"pay_type" : params.payType, 
"order_type" : params.orderType, 
"order_id" : params.orderId, 
"user_token" : params.userToken, 
"pay_method" : params.payMethod, 

        ]).response { response in

            if nil != response.error || 200 != response.response?.statusCode {
                let err_result = Response()
                err_result.msg = "api_err"
                err_result.info = "接口异常"
                err_result.errMsg = "error:\(String(describing: response.error)), status_code:\(String(describing: response.response?.statusCode))"
                print("===error:\(err_result.errMsg)")
                callback(err_result)
            } else {
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("=======Data: \(utf8Text)") // original server data as UTF8 string
                    if let object = Response.deserialize(from: utf8Text) {
                        print("------------\(object)")
                        callback(object)
                    }else{
                        let err_result = Response()
                        err_result.msg = "api_err"
                        err_result.info = "接口返回数据异常"
                        err_result.errMsg = utf8Text
                        print("===error:\(utf8Text)")
                        callback(err_result)
                    }
                }
            }
        }

    }
    
}