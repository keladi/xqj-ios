
import HandyJSON
import Alamofire
import Foundation
class UserCenterProfileNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "0ecf64336d199db0bfe1ac2d7c55e94f"
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.userToken <-- "user_token"
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
    "result": {
        "msg_num": 0, 
        "mobile": "13809522355", 
        "sex": 2, 
        "face": "http://xqj-main.oss-cn-hangzhou.aliyuncs.com/xqj/img/f430070231d24b5907cbc6f76089328e.png", 
        "qrcode": "http://web.xiangqianjin888.com/invite.html?nickname=%E4%B8%8A%E5%AE%98&mobile=13809522355", 
        "nicname": "张三", 
        "position": "福州1", 
        "bank_card_num": 0, 
        "sign": "我的签名xxx"
    }, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
var msgNum: Int = 0
var mobile: String = ""
var sex: Int = 0
var face: String = ""
var qrcode: String = ""
var nicname: String = ""
var position: String = ""
var bankCardNum: Int = 0
var sign: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.msgNum <-- "msg_num"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.sex <-- "sex"
mapper <<<
        self.face <-- "face"
mapper <<<
        self.qrcode <-- "qrcode"
mapper <<<
        self.nicname <-- "nicname"
mapper <<<
        self.position <-- "position"
mapper <<<
        self.bankCardNum <-- "bank_card_num"
mapper <<<
        self.sign <-- "sign"
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

        Alamofire.request(NetworkConfig.Server+"/rest/user_center/profile", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 

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