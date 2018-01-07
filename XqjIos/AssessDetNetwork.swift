
import HandyJSON
import Alamofire
import Foundation
class AssessDetNetwork{
    
// 参数
/* 

{
    "acc": "m13809522355", 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "assess_id": 23
}
*/
class Params:HandyJSON {
var acc: String = ""
var userToken: String = ""
var assessId: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.assessId <-- "assess_id"
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
        "car_age": 0, 
        "car_brand": "大众", 
        "id_card_img2": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "car_no": "", 
        "years": 0, 
        "create_time": 1111213121, 
        "assess_id": 23, 
        "img2": "", 
        "img1": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "id_card_img1": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "house_img2": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "house_img3": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "house_img1": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "user_id": 8, 
        "buy_time": 1508169600, 
        "mileage": 12211, 
        "create_time_str": "2005-03-19 06:18:41", 
        "car_img2": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "car_img1": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "car_model": "", 
        "acreage": 0, 
        "house_buy_time": 1, 
        "car_lic_img1": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "house_type": "", 
        "car_lic_img2": "http://core.serv.xiangqianjin888.com/static/upload_imgs/assess/22/img1_0.jpg", 
        "product_type": 1, 
        "name": "张三", 
        "assess_res": "", 
        "mobile": "13096522363", 
        "age": 11, 
        "house_addr": "湖东路22号", 
        "status": 1
    }
}
*/
class Result:HandyJSON {
var carAge: Int = 0
var carBrand: String = ""
var idCardImg2: String = ""
var carNo: String = ""
var years: Int = 0
var createTime: Int = 0
var assessId: Int = 0
var img2: String = ""
var img1: String = ""
var idCardImg1: String = ""
var houseImg2: String = ""
var houseImg3: String = ""
var houseImg1: String = ""
var userId: Int = 0
var buyTime: Int = 0
var mileage: Int = 0
var createTimeStr: String = ""
var carImg2: String = ""
var carImg1: String = ""
var carModel: String = ""
var acreage: Int = 0
var houseBuyTime: Int = 0
var carLicImg1: String = ""
var houseType: String = ""
var carLicImg2: String = ""
var productType: Int = 0
var name: String = ""
var assessRes: String = ""
var mobile: String = ""
var age: Int = 0
var houseAddr: String = ""
var status: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.carAge <-- "car_age"
mapper <<<
        self.carBrand <-- "car_brand"
mapper <<<
        self.idCardImg2 <-- "id_card_img2"
mapper <<<
        self.carNo <-- "car_no"
mapper <<<
        self.years <-- "years"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.assessId <-- "assess_id"
mapper <<<
        self.img2 <-- "img2"
mapper <<<
        self.img1 <-- "img1"
mapper <<<
        self.idCardImg1 <-- "id_card_img1"
mapper <<<
        self.houseImg2 <-- "house_img2"
mapper <<<
        self.houseImg3 <-- "house_img3"
mapper <<<
        self.houseImg1 <-- "house_img1"
mapper <<<
        self.userId <-- "user_id"
mapper <<<
        self.buyTime <-- "buy_time"
mapper <<<
        self.mileage <-- "mileage"
mapper <<<
        self.createTimeStr <-- "create_time_str"
mapper <<<
        self.carImg2 <-- "car_img2"
mapper <<<
        self.carImg1 <-- "car_img1"
mapper <<<
        self.carModel <-- "car_model"
mapper <<<
        self.acreage <-- "acreage"
mapper <<<
        self.houseBuyTime <-- "house_buy_time"
mapper <<<
        self.carLicImg1 <-- "car_lic_img1"
mapper <<<
        self.houseType <-- "house_type"
mapper <<<
        self.carLicImg2 <-- "car_lic_img2"
mapper <<<
        self.productType <-- "product_type"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.assessRes <-- "assess_res"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.age <-- "age"
mapper <<<
        self.houseAddr <-- "house_addr"
mapper <<<
        self.status <-- "status"
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

        Alamofire.request(NetworkConfig.Server+"/rest/assess/det", method: .post, parameters:[
            "acc" : params.acc, 
"user_token" : params.userToken, 
"assess_id" : params.assessId, 

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