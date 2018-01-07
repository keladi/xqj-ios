
import HandyJSON
import Alamofire
import Foundation
class LoanOrderDetNetwork{
    
// 参数
/* 

{
    "loan_order_id": 2, 
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008"
}
*/
class Params:HandyJSON {
var loanOrderId: Int = 0
var acc: String = ""
var userToken: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.loanOrderId <-- "loan_order_id"
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
        "yihuan": "-", 
        "yiWanChengMoney": "0.00", 
        "yueXi": "122.22", 
        "logs": [
            {
                "date": "-", 
                "money": "-"
            }
        ], 
        "title": "23万", 
        "money": "11111.00", 
        "id": 2, 
        "lixi": "-", 
        "tag": "进行中", 
        "huanKuanDate": "每月0日", 
        "shuHuiDate": "1970-01-01 00:00:00", 
        "date": "2017-10-17 12:09:53", 
        "touZiRenShu": 0, 
        "type": 0, 
        "jieSuanFangShi": "每月还息", 
        "jiekuan": "-"
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
var yihuan: String = ""
var yiWanChengMoney: String = ""
var yueXi: String = ""
var logs: [Logs]? 
var title: String = ""
var money: String = ""
var id: Int = 0
var lixi: String = ""
var tag: String = ""
var huanKuanDate: String = ""
var shuHuiDate: String = ""
var date: String = ""
var touZiRenShu: Int = 0
var type: Int = 0
var jieSuanFangShi: String = ""
var jiekuan: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.yihuan <-- "yihuan"
mapper <<<
        self.yiWanChengMoney <-- "yiWanChengMoney"
mapper <<<
        self.yueXi <-- "yueXi"
mapper <<<
        self.logs <-- "logs"
mapper <<<
        self.title <-- "title"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.id <-- "id"
mapper <<<
        self.lixi <-- "lixi"
mapper <<<
        self.tag <-- "tag"
mapper <<<
        self.huanKuanDate <-- "huanKuanDate"
mapper <<<
        self.shuHuiDate <-- "shuHuiDate"
mapper <<<
        self.date <-- "date"
mapper <<<
        self.touZiRenShu <-- "touZiRenShu"
mapper <<<
        self.type <-- "type"
mapper <<<
        self.jieSuanFangShi <-- "jieSuanFangShi"
mapper <<<
        self.jiekuan <-- "jiekuan"
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

        Alamofire.request(NetworkConfig.Server+"/rest/loan_order/det", method: .post, parameters:[
            "loan_order_id" : params.loanOrderId, 
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