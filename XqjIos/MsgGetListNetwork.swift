
import HandyJSON
import Alamofire
import Foundation
class MsgGetListNetwork{
    
// 参数
/* 

{
    "acc": "", 
    "user_token": "", 
    "msg_type": 1, 
    "page": 1, 
    "page_size": 10
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var msgType: Int = 0
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
        self.msgType <-- "msg_type"
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
                "is_read": 0, 
                "ChangeFields": {}, 
                "user_id": 8, 
                "msg_type": 1, 
                "title": "内容", 
                "msg_id": 1, 
                "content": "标题", 
                "create_time": 0
            }
        ], 
        "page": 1, 
        "page_size": 20, 
        "rs_count": 1
    }, 
    "msg": "ok"
}
*/
class List:HandyJSON {
var isRead: Int = 0
var userId: Int = 0
var msgType: Int = 0
var title: String = ""
var msgId: Int = 0
var content: String = ""
var createTime: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.isRead <-- "is_read"
mapper <<<
        self.userId <-- "user_id"
mapper <<<
        self.msgType <-- "msg_type"
mapper <<<
        self.title <-- "title"
mapper <<<
        self.msgId <-- "msg_id"
mapper <<<
        self.content <-- "content"
mapper <<<
        self.createTime <-- "create_time"
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

        Alamofire.request(NetworkConfig.Server+"/rest/msg/get_list", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"msg_type" : params.msgType, 
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