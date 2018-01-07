
import HandyJSON
import Alamofire
import Foundation
class LoanOrderGetListNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
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
                "title": "23万", 
                "money": "11111.00", 
                "tag": "进行中", 
                "huankuandate": "每月0日", 
                "date": "2017-10-17 12:09:53", 
                "touzirenshu": 0, 
                "type": 0, 
                "id": 2, 
                "yiwanchengmoney": "0.00"
            }
        ], 
        "rs_count": 1
    }, 
    "msg": "ok"
}
*/
class List:HandyJSON {
var title: String = ""
var money: String = ""
var tag: String = ""
var huankuandate: String = ""
var date: String = ""
var touzirenshu: Int = 0
var type: Int = 0
var id: Int = 0
var yiwanchengmoney: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.title <-- "title"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.tag <-- "tag"
mapper <<<
        self.huankuandate <-- "huankuandate"
mapper <<<
        self.date <-- "date"
mapper <<<
        self.touzirenshu <-- "touzirenshu"
mapper <<<
        self.type <-- "type"
mapper <<<
        self.id <-- "id"
mapper <<<
        self.yiwanchengmoney <-- "yiwanchengmoney"
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

        Alamofire.request(NetworkConfig.Server+"/rest/loan_order/get_list", method: .post, parameters:[
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