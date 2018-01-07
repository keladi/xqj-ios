
import HandyJSON
import Alamofire
import Foundation
class UserCenterResetProfileNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "province": "福建1", 
    "area": "鼓楼1", 
    "face": "https://o1wh05aeh.qnssl.com/image/view/app_icons/c81bf1465ff9891a2885600534faa8e1/120", 
    "sex": 2, 
    "user_token": "0ecf64336d199db0bfe1ac2d7c55e94f", 
    "sign": "我的签名1", 
    "nickname": "张三1", 
    "city": "福州1"
}
*/
class Params:HandyJSON {
var acc: String = ""
var province: String = ""
var area: String = ""
var face: String = ""
var sex: Int = 0
var userToken: String = ""
var sign: String = ""
var nickname: String = ""
var city: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.province <-- "province"
mapper <<<
        self.area <-- "area"
mapper <<<
        self.face <-- "face"
mapper <<<
        self.sex <-- "sex"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.sign <-- "sign"
mapper <<<
        self.nickname <-- "nickname"
mapper <<<
        self.city <-- "city"
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

        Alamofire.request(NetworkConfig.Server+"/rest/user_center/reset_profile", method: .post, parameters:[
            "acc" : params.acc, 
"province" : params.province, 
"area" : params.area, 
"face" : params.face, 
"sex" : params.sex, 
"user_token" : params.userToken, 
"sign" : params.sign, 
"nickname" : params.nickname, 
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