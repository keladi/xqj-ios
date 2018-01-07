
import HandyJSON
import Alamofire
import Foundation
class BankCardAuthApplyNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "bank_name": "中国工商银行1", 
    "code": "62220212143434341", 
    "province": "福建1", 
    "user_token": "4477a8b7c7a63d4bb79e518e93cf78dc", 
    "mobile": "13809522353", 
    "acc_name": "黄剑峰", 
    "bank_card_img_f": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/bank_imgs/中国银行.png?x-oss-process", 
    "branch_name": "台江支行1", 
    "bank_card_img_s": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/bank_imgs/中国银行.png?x-oss-process", 
    "city": "福州1"
}
*/
class Params:HandyJSON {
var acc: String = ""
var bankName: String = ""
var code: String = ""
var province: String = ""
var userToken: String = ""
var mobile: String = ""
var accName: String = ""
var bankCardImgF: String = ""
var branchName: String = ""
var bankCardImgS: String = ""
var city: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.bankName <-- "bank_name"
mapper <<<
        self.code <-- "code"
mapper <<<
        self.province <-- "province"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.accName <-- "acc_name"
mapper <<<
        self.bankCardImgF <-- "bank_card_img_f"
mapper <<<
        self.branchName <-- "branch_name"
mapper <<<
        self.bankCardImgS <-- "bank_card_img_s"
mapper <<<
        self.city <-- "city"
}
}
// 响应
/* 

{
    "info": "操作成功", 
    "code": 0, 
    "err_msg": "", 
    "raw": null, 
    "result": null, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
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

        Alamofire.request(NetworkConfig.Server+"/rest/bank_card_auth/apply", method: .post, parameters:[
            "acc" : params.acc, 
"bank_name" : params.bankName, 
"code" : params.code, 
"province" : params.province, 
"user_token" : params.userToken, 
"mobile" : params.mobile, 
"acc_name" : params.accName, 
"bank_card_img_f" : params.bankCardImgF, 
"branch_name" : params.branchName, 
"bank_card_img_s" : params.bankCardImgS, 
"city" : params.city, 

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