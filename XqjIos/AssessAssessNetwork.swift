
import HandyJSON
import Alamofire
import Foundation
class AssessAssessNetwork{
    
// 参数
/* 

{
    "car_age": 10, 
    "id_card_img1": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "id_card_img2": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "car_no": "闽A00000", 
    "years": 1, 
    "user_token": "654a6b4a103e06e65a17d3ab719e8008", 
    "mileage": 12234, 
    "img2": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "img1": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "car_brand": "大众", 
    "house_img2": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "house_img3": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "house_img1": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "buy_time": 1231254234, 
    "car_img2": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "car_img1": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "car_model": 3008, 
    "house_buy_time": 1, 
    "car_lic_img1": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "house_type": "3室1厅", 
    "car_lic_img2": "https://www.baidu.com/img/baidu_jgylogo3.gif", 
    "acc": "m13809522355", 
    "product_type": 1, 
    "name": "张三", 
    "mobile": "13809522363", 
    "age": 23, 
    "house_addr": "湖东路"
}
*/
class Params:HandyJSON {
var carAge: Int = 0
var idCardImg1: String = ""
var idCardImg2: String = ""
var carNo: String = ""
var years: Int = 0
var userToken: String = ""
var mileage: Int = 0
var img2: String = ""
var img1: String = ""
var carBrand: String = ""
var houseImg2: String = ""
var houseImg3: String = ""
var houseImg1: String = ""
var buyTime: Int = 0
var carImg2: String = ""
var carImg1: String = ""
var carModel: Int = 0
var houseBuyTime: Int = 0
var carLicImg1: String = ""
var houseType: String = ""
var carLicImg2: String = ""
var acc: String = ""
var productType: Int = 0
var name: String = ""
var mobile: String = ""
var age: Int = 0
var houseAddr: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.carAge <-- "car_age"
mapper <<<
        self.idCardImg1 <-- "id_card_img1"
mapper <<<
        self.idCardImg2 <-- "id_card_img2"
mapper <<<
        self.carNo <-- "car_no"
mapper <<<
        self.years <-- "years"
mapper <<<
        self.userToken <-- "user_token"
mapper <<<
        self.mileage <-- "mileage"
mapper <<<
        self.img2 <-- "img2"
mapper <<<
        self.img1 <-- "img1"
mapper <<<
        self.carBrand <-- "car_brand"
mapper <<<
        self.houseImg2 <-- "house_img2"
mapper <<<
        self.houseImg3 <-- "house_img3"
mapper <<<
        self.houseImg1 <-- "house_img1"
mapper <<<
        self.buyTime <-- "buy_time"
mapper <<<
        self.carImg2 <-- "car_img2"
mapper <<<
        self.carImg1 <-- "car_img1"
mapper <<<
        self.carModel <-- "car_model"
mapper <<<
        self.houseBuyTime <-- "house_buy_time"
mapper <<<
        self.carLicImg1 <-- "car_lic_img1"
mapper <<<
        self.houseType <-- "house_type"
mapper <<<
        self.carLicImg2 <-- "car_lic_img2"
mapper <<<
        self.acc <-- "acc"
mapper <<<
        self.productType <-- "product_type"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.mobile <-- "mobile"
mapper <<<
        self.age <-- "age"
mapper <<<
        self.houseAddr <-- "house_addr"
}
}
// 响应
/* 

{
    "info": "操作成功", 
    "msg": "ok", 
    "code": 0, 
    "err_msg": "", 
    "result": {}
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

        Alamofire.request(NetworkConfig.Server+"/rest/assess/assess", method: .post, parameters:[
            "car_age" : params.carAge, 
"id_card_img1" : params.idCardImg1, 
"id_card_img2" : params.idCardImg2, 
"car_no" : params.carNo, 
"years" : params.years, 
"user_token" : params.userToken, 
"mileage" : params.mileage, 
"img2" : params.img2, 
"img1" : params.img1, 
"car_brand" : params.carBrand, 
"house_img2" : params.houseImg2, 
"house_img3" : params.houseImg3, 
"house_img1" : params.houseImg1, 
"buy_time" : params.buyTime, 
"car_img2" : params.carImg2, 
"car_img1" : params.carImg1, 
"car_model" : params.carModel, 
"house_buy_time" : params.houseBuyTime, 
"car_lic_img1" : params.carLicImg1, 
"house_type" : params.houseType, 
"car_lic_img2" : params.carLicImg2, 
"acc" : params.acc, 
"product_type" : params.productType, 
"name" : params.name, 
"mobile" : params.mobile, 
"age" : params.age, 
"house_addr" : params.houseAddr, 

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