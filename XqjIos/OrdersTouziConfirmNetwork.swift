
import HandyJSON
import Alamofire
import Foundation
class OrdersTouziConfirmNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "product_id": 2
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var productId: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.productId <-- "product_id"
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
        "shengYuGuShu": -32, 
        "nianHua": 12, 
        "zongRongZi": "3200.00", 
        "wanChengLv": "0.38", 
        "name": "2016款 RS 限量版 3.6L", 
        "jiazhi": "3600.00", 
        "yiRongZi": "1230.00", 
        "yiTouGuShu": 0, 
        "zongGuShu": 0, 
        "zuiXiaoDanBiTouZi": "0.00", 
        "yiTouRenShu": 32, 
        "liXiZhiFu": "每月付息"
    }, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
var shengYuGuShu: Int = 0
var nianHua: Int = 0
var zongRongZi: String = ""
var wanChengLv: String = ""
var name: String = ""
var jiazhi: String = ""
var yiRongZi: String = ""
var yiTouGuShu: Int = 0
var zongGuShu: Int = 0
var zuiXiaoDanBiTouZi: String = ""
var yiTouRenShu: Int = 0
var liXiZhiFu: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.shengYuGuShu <-- "shengYuGuShu"
mapper <<<
        self.nianHua <-- "nianHua"
mapper <<<
        self.zongRongZi <-- "zongRongZi"
mapper <<<
        self.wanChengLv <-- "wanChengLv"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.jiazhi <-- "jiazhi"
mapper <<<
        self.yiRongZi <-- "yiRongZi"
mapper <<<
        self.yiTouGuShu <-- "yiTouGuShu"
mapper <<<
        self.zongGuShu <-- "zongGuShu"
mapper <<<
        self.zuiXiaoDanBiTouZi <-- "zuiXiaoDanBiTouZi"
mapper <<<
        self.yiTouRenShu <-- "yiTouRenShu"
mapper <<<
        self.liXiZhiFu <-- "liXiZhiFu"
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

        Alamofire.request(NetworkConfig.Server+"/rest/orders/touzi_confirm", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"product_id" : params.productId, 

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