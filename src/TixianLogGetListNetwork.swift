
import HandyJSON
import Alamofire
import Foundation
class TixianLogGetListNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "4477a8b7c7a63d4bb79e518e93cf78dc", 
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
    "msg": "ok", 
    "code": 0, 
    "err_msg": "", 
    "result": {
        "list": [
            {
                "status": 0, 
                "bank_name": "中国农业发展银行", 
                "operator_id": 0, 
                "ChangeFields": {}, 
                "user_id": 1, 
                "money": 1, 
                "acc_name": "黄剑锋", 
                "remark": "", 
                "tixian_log_id": 1, 
                "branch_name": "泉州汇金支行", 
                "card_num": "6228450688003969872", 
                "create_time": 1510588220, 
                "approve_time": 0, 
                "operator": "", 
                "balance": 0
            }
        ], 
        "page": "1", 
        "page_size": "10", 
        "rs_count": 1
    }
}
*/
class List:HandyJSON {
var status: Int = 0
var bankName: String = ""
var operatorId: Int = 0
var userId: Int = 0
var money: Int = 0
var accName: String = ""
var remark: String = ""
var tixianLogId: Int = 0
var branchName: String = ""
var cardNum: String = ""
var createTime: Int = 0
var approveTime: Int = 0
var operator1: String = ""
var balance: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.status <-- "status"
mapper <<<
        self.bankName <-- "bank_name"
mapper <<<
        self.operatorId <-- "operator_id"
mapper <<<
        self.userId <-- "user_id"
mapper <<<
        self.money <-- "money"
mapper <<<
        self.accName <-- "acc_name"
mapper <<<
        self.remark <-- "remark"
mapper <<<
        self.tixianLogId <-- "tixian_log_id"
mapper <<<
        self.branchName <-- "branch_name"
mapper <<<
        self.cardNum <-- "card_num"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.approveTime <-- "approve_time"
mapper <<<
        self.operator1 <-- "operator"
mapper <<<
        self.balance <-- "balance"
}
}
class Result:HandyJSON {
var list: [List]? 
var page: String = ""
var pageSize: String = ""
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

        Alamofire.request(NetworkConfig.Server+"/rest/tixian_log/get_list", method: .post, parameters:[
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