
import HandyJSON
import Alamofire
import Foundation
class OrdersGetListNetwork{
    
// 参数
/* 

{
    "acc": "m1380952253", 
    "user_token": "xxxxxxxxxx", 
    "search": "", 
    "page": 1, 
    "page_size": 10
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var search: String = ""
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
        self.search <-- "search"
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
                "jiesuanfangshi": "按月还息", 
                "yuexi": "0.00", 
                "title": "融信大卫城单身公寓", 
                "money": "1000.00", 
                "shuhuiriqi": "1970-01-01 00:00:00", 
                "tag": "未付款", 
                "date": "2018-01-06 06:35:55", 
                "type": 1, 
                "id": 44
            }, 
            {
                "jiesuanfangshi": "按月还息", 
                "yuexi": "0.00", 
                "title": "茶亭 宝龙，百福苑，闹中取静，电梯3房，居家装，南北通透", 
                "money": "0.01", 
                "shuhuiriqi": "1970-01-01 00:00:00", 
                "tag": "未付款", 
                "date": "2017-10-27 13:29:54", 
                "type": 0, 
                "id": 2
            }
        ], 
        "rs_count": 2
    }, 
    "msg": "ok"
}
*/
class List:HandyJSON {
var jiesuanfangshi: String = ""
var yuexi: String = ""
var title: String = ""
var money: String = ""
var shuhuiriqi: String = ""
var tag: String = ""
var date: String = ""
var type: Int = 0
var id: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.jiesuanfangshi <-- "jiesuanfangshi"
mapper <<<
        self.yuexi <-- "yuexi"
mapper <<<
        self.title <-- "title"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.shuhuiriqi <-- "shuhuiriqi"
mapper <<<
        self.tag <-- "tag"
mapper <<<
        self.date <-- "date"
mapper <<<
        self.type <-- "type"
mapper <<<
        self.id <-- "id"
}
}
class Result:HandyJSON {
var list: [List]? 
var rsCount: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.list <-- "list"
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

        Alamofire.request(NetworkConfig.Server+"/rest/orders/get_list", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"search" : params.search, 
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