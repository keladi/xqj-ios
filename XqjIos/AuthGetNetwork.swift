
import HandyJSON
import Alamofire
import Foundation
class AuthGetNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "4477a8b7c7a63d4bb79e518e93cf78dc"
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
        "bank_card_auth_info": {
            "province": "福建1", 
            "bank_name": "中国工商银行1", 
            "ChangeFields": {}, 
            "user_id": 1, 
            "area": "", 
            "create_time": 1511697962, 
            "acc_name": "黄剑峰", 
            "status": 0, 
            "reason": "", 
            "bank_card_img_f": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/bank_card_imgs/m13809522355/bank_card_img_f/98030836359e745bae4dbb358ef8b3d9.jpg", 
            "card_type": 0, 
            "branch_name": "台江支行1", 
            "idcard_num": "", 
            "code": "62220212143434341", 
            "city": "福州1", 
            "approve_time": 1511697962, 
            "mobile": "13809522353", 
            "bank_card_img_s": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/bank_card_imgs/m13809522355/bank_card_img_s/951bc231fd30340a6b5429d90d8b15d6.jpg", 
            "bank_card_auth_id": 8
        }, 
        "real_name_auth_info": {
            "status": 1, 
            "idcard_img_f": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/id_card_imgs/m13809522355/idcard_img_f/18857b5ff5b50b483294efc2f0bb8ec1.jpg", 
            "user_id": 1, 
            "name": "黄剑峰", 
            "idcard_img_b": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/id_card_imgs/m13809522355/idcard_img_b/1e7109569efc4f4052609eb01aec1e65.jpg", 
            "mobile": "", 
            "ChangeFields": {}, 
            "real_name_auth_id": 7, 
            "reason": "", 
            "idcard_num": "350523199555256328", 
            "create_time": 1511697058, 
            "approve_time": 1511697958
        }
    }, 
    "msg": "ok"
}
*/
class BankCardAuthInfo:HandyJSON {
var province: String = ""
var bankName: String = ""
var userId: Int = 0
var area: String = ""
var createTime: Int = 0
var accName: String = ""
var status: Int = 0
var reason: String = ""
var bankCardImgF: String = ""
var cardType: Int = 0
var branchName: String = ""
var idcardNum: String = ""
var code: String = ""
var city: String = ""
var approveTime: Int = 0
var mobile: String = ""
var bankCardImgS: String = ""
var bankCardAuthId: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.province <-- "province"
mapper <<<
        self.bankName <-- "bank_name"
mapper <<<
        self.userId <-- "user_id"
mapper <<<
        self.area <-- "area"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.accName <-- "acc_name"
mapper <<<
        self.status <-- "status"
mapper <<<
        self.reason <-- "reason"
mapper <<<
        self.bankCardImgF <-- "bank_card_img_f"
mapper <<<
        self.cardType <-- "card_type"
mapper <<<
        self.branchName <-- "branch_name"
mapper <<<
        self.idcardNum <-- "idcard_num"
mapper <<<
        self.code <-- "code"
mapper <<<
        self.city <-- "city"
mapper <<<
        self.approveTime <-- "approve_time"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.bankCardImgS <-- "bank_card_img_s"
mapper <<<
        self.bankCardAuthId <-- "bank_card_auth_id"
}
}
class RealNameAuthInfo:HandyJSON {
var status: Int = 0
var idcardImgF: String = ""
var userId: Int = 0
var name: String = ""
var idcardImgB: String = ""
var mobile: String = ""
var realNameAuthId: Int = 0
var reason: String = ""
var idcardNum: String = ""
var createTime: Int = 0
var approveTime: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.status <-- "status"
mapper <<<
        self.idcardImgF <-- "idcard_img_f"
mapper <<<
        self.userId <-- "user_id"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.idcardImgB <-- "idcard_img_b"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.realNameAuthId <-- "real_name_auth_id"
mapper <<<
        self.reason <-- "reason"
mapper <<<
        self.idcardNum <-- "idcard_num"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.approveTime <-- "approve_time"
}
}
class Result:HandyJSON {
var bankCardAuthInfo: BankCardAuthInfo?  
var realNameAuthInfo: RealNameAuthInfo?  
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.bankCardAuthInfo <-- "bank_card_auth_info"
mapper <<<
        self.realNameAuthInfo <-- "real_name_auth_info"
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

        Alamofire.request(NetworkConfig.Server+"/rest/auth/get", method: .post, parameters:[
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