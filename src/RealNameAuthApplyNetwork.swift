
import HandyJSON
import Alamofire
import Foundation
class RealNameAuthApplyNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "idcard_img_f": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/tmp_not_del/id_f.jpg", 
    "name": "戴一秒", 
    "idcard_img_b": "http://mmzf-main.oss-cn-hangzhou.aliyuncs.com/tmp_not_del/id_s.jpg", 
    "user_token": "4477a8b7c7a63d4bb79e518e93cf78dc", 
    "idcard_num": "350523199555256328"
}
*/
class Params:HandyJSON {
var acc: String = ""
var idcardImgF: String = ""
var name: String = ""
var idcardImgB: String = ""
var userToken: String = ""
var idcardNum: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.idcardImgF <-- "idcard_img_f"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.idcardImgB <-- "idcard_img_b"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.idcardNum <-- "idcard_num"
}
}
// 响应
/* 

{
    "info": "操作成功", 
    "code": 0, 
    "err_msg": "", 
    "raw": null, 
    "result": null, 
    "msg": "ok"
}
*/
class Result:HandyJSON {
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
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

        Alamofire.request(NetworkConfig.Server+"/rest/real_name_auth/apply", method: .post, parameters:[
            "acc" : params.acc, 
"idcard_img_f" : params.idcardImgF, 
"name" : params.name, 
"idcard_img_b" : params.idcardImgB, 
"user_token" : params.userToken, 
"idcard_num" : params.idcardNum, 

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