
import HandyJSON
import Alamofire
import Foundation
class UserCenterIndexNetwork{
    
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
    "msg": "ok", 
    "code": 0, 
    "err_msg": "", 
    "result": {
        "day_num": 0, 
        "sex": 2, 
        "face": "http://xqj-main.oss-cn-hangzhou.aliyuncs.com/xqj/img/f430070231d24b5907cbc6f76089328e.png", 
        "lv": 1, 
        "focus_num": 0, 
        "got_money": 0, 
        "mobile": "13809522355", 
        "qrcode": "http://web.xiangqianjin888.com/invite.html?nickname=%E5%BC%A0%E4%B8%89&mobile=13809522355", 
        "position": " 福州1", 
        "balance": 0, 
        "nickname": "张三", 
        "fans_num": 0
    }
}
*/
class Result:HandyJSON {
var dayNum: Int = 0
var sex: Int = 0
var face: String = ""
var lv: Int = 0
var focusNum: Int = 0
var gotMoney: Int = 0
var mobile: String = ""
var qrcode: String = ""
var position: String = ""
var balance: Int = 0
var nickname: String = ""
var fansNum: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.dayNum <-- "day_num"
mapper <<<
        self.sex <-- "sex"
mapper <<<
        self.face <-- "face"
mapper <<<
        self.lv <-- "lv"
mapper <<<
        self.focusNum <-- "focus_num"
mapper <<<
        self.gotMoney <-- "got_money"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.qrcode <-- "qrcode"
mapper <<<
        self.position <-- "position"
mapper <<<
        self.balance <-- "balance"
mapper <<<
        self.nickname <-- "nickname"
mapper <<<
        self.fansNum <-- "fans_num"
}
}
class Response:HandyJSON {
var info: String = ""
var msg: String = ""
var errMsg: String = ""
var result: Result?  
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.info <-- "info"
mapper <<<
        self.msg <-- "msg"
mapper <<<
        self.errMsg <-- "err_msg"
mapper <<<
        self.result <-- "result"
}
}
//请求

    func request(params: Params, callback: @escaping ((_ resp: Response?) -> ())) {

        Alamofire.request(NetworkConfig.Server+"/rest/user_center/index", method: .post, parameters:[
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