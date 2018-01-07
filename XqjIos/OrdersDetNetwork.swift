
import HandyJSON
import Alamofire
import Foundation
class OrdersDetNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "orders_id": 1
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var ordersId: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.ordersId <-- "orders_id"
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
        "huiShou": "-", 
        "jieChu": "-", 
        "yueXi": "0.00", 
        "logs": [
            {
                "date": "-", 
                "money": "-"
            }
        ], 
        "title": "茶亭 宝龙，百福苑，闹中取静，电梯3房，居家装，南北通透", 
        "money": "0.01", 
        "jieSuanFangShi": "按月付息", 
        "liXi": "-", 
        "tag": "未付款", 
        "date": "2017-10-27 13:29:54", 
        "type": 0, 
        "id": 2, 
        "shuHuiDate": "1970-01-01 00:00:00"
    }, 
    "msg": "ok"
}
*/
class Logs:HandyJSON {
var date: String = ""
var money: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.date <-- "date"
mapper <<<
        self.money <-- "money"
}
}
class Result:HandyJSON {
var huiShou: String = ""
var jieChu: String = ""
var yueXi: String = ""
var logs: [Logs]? 
var title: String = ""
var money: String = ""
var jieSuanFangShi: String = ""
var liXi: String = ""
var tag: String = ""
var date: String = ""
var type: Int = 0
var id: Int = 0
var shuHuiDate: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.huiShou <-- "huiShou"
mapper <<<
        self.jieChu <-- "jieChu"
mapper <<<
        self.yueXi <-- "yueXi"
mapper <<<
        self.logs <-- "logs"
mapper <<<
        self.title <-- "title"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.jieSuanFangShi <-- "jieSuanFangShi"
mapper <<<
        self.liXi <-- "liXi"
mapper <<<
        self.tag <-- "tag"
mapper <<<
        self.date <-- "date"
mapper <<<
        self.type <-- "type"
mapper <<<
        self.id <-- "id"
mapper <<<
        self.shuHuiDate <-- "shuHuiDate"
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

        Alamofire.request(NetworkConfig.Server+"/rest/orders/det", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"orders_id" : params.ordersId, 

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