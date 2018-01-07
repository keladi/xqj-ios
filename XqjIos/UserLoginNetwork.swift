
import HandyJSON
import Alamofire
import Foundation
class UserLoginNetwork{
    
// 参数
/* 

{
    "acc": "13809522355", 
    "psw": "123456"
}
*/
class Params:HandyJSON {
var acc: String = ""
var psw: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.psw <-- "psw"
}
}
// 响应
/* 

{
    "info": "操作成功!", 
    "code": "0", 
    "raw": null, 
    "Raw": null, 
    "result": {
        "status": 0, 
        "account": "m13809522355", 
        "mobi": "13809522355", 
        "point": 0, 
        "money": 0, 
        "title": "", 
        "login_count": 0, 
        "face": "http://rs.boois.cn/?x-oss-process=image/resize,m_fixed,h_120,w_120", 
        "lv": 0, 
        "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
        "guid": "", 
        "nickname": "m13809522355", 
        "email": "test@test.com"
    }, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
var status: Int = 0
var account: String = ""
var mobi: String = ""
var point: Int = 0
var money: Int = 0
var title: String = ""
var loginCount: Int = 0
var face: String = ""
var lv: Int = 0
var userToken: String = ""
var guid: String = ""
var nickname: String = ""
var email: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.status <-- "status"
mapper <<<
        self.account <-- "account"
mapper <<<
        self.mobi <-- "mobi"
mapper <<<
        self.point <-- "point"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.title <-- "title"
mapper <<<
        self.loginCount <-- "login_count"
mapper <<<
        self.face <-- "face"
mapper <<<
        self.lv <-- "lv"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.guid <-- "guid"
mapper <<<
        self.nickname <-- "nickname"
mapper <<<
        self.email <-- "email"
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

        Alamofire.request(NetworkConfig.Server+"/rest/user/login", method: .post, parameters:[
            "acc" : params.acc, 
"psw" : params.psw, 

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