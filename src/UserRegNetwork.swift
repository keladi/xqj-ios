
import HandyJSON
import Alamofire
import Foundation
class UserRegNetwork{
    
// 参数
/* 

{
    "src": "core", 
    "mobile": "13809522362", 
    "sms_code": "138095", 
    "refer": "13809522353", 
    "psw": "123456", 
    "sms_id": "6b3b044821d82d0f212a198c37fc448d"
}
*/
class Params:HandyJSON {
var src: String = ""
var mobile: String = ""
var smsCode: String = ""
var refer: String = ""
var psw: String = ""
var smsId: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.src <-- "src"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.smsCode <-- "sms_code"
mapper <<<
        self.refer <-- "refer"
mapper <<<
        self.psw <-- "psw"
mapper <<<
        self.smsId <-- "sms_id"
}
}
// 响应
/* 

{
    "info": "操作成功", 
    "code": 0, 
    "raw": null, 
    "err_msg": "", 
    "Raw": null, 
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

        Alamofire.request(NetworkConfig.Server+"/rest/user/reg", method: .post, parameters:[
            "src" : params.src, 
"mobile" : params.mobile, 
"sms_code" : params.smsCode, 
"refer" : params.refer, 
"psw" : params.psw, 
"sms_id" : params.smsId, 

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