
import HandyJSON
import Alamofire
import Foundation
class UserCenterFansListNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "page": 1, 
    "page_size": 10
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var page: Int = 0
var pageSize: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.page <-- "page"
mapper <<<
        self.pageSize <-- "page_size"
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
        "list": [
            {
                "lv": 1, 
                "mobile": "13599445586", 
                "sign": "这个人很懒,没有填写签名", 
                "nickname": "13599445586", 
                "face": ""
            }, 
            {
                "lv": 1, 
                "mobile": "18960923225", 
                "sign": "这个人很懒,没有填写签名", 
                "nickname": "18960923225", 
                "face": ""
            }
        ], 
        "page": 1, 
        "page_size": 10, 
        "rs_count": 2
    }, 
    "msg": "ok"
}
*/
class List:HandyJSON {
var lv: Int = 0
var mobile: String = ""
var sign: String = ""
var nickname: String = ""
var face: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.lv <-- "lv"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.sign <-- "sign"
mapper <<<
        self.nickname <-- "nickname"
mapper <<<
        self.face <-- "face"
}
}
class Result:HandyJSON {
var list: [List]? 
var page: Int = 0
var pageSize: Int = 0
var rsCount: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.list <-- "list"
mapper <<<
        self.page <-- "page"
mapper <<<
        self.pageSize <-- "page_size"
mapper <<<
        self.rsCount <-- "rs_count"
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

        Alamofire.request(NetworkConfig.Server+"/rest/user_center/fans_list", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"page" : params.page, 
"page_size" : params.pageSize, 

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