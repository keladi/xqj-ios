
import HandyJSON
import Alamofire
import Foundation
class ProductDetNetwork{
    
// 参数
/* 

{
    "product_id": 1
}
*/
class Params:HandyJSON {
var productId: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.productId <-- "product_id"
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
        "product": {
            "yearly": 0, 
            "user_num": 0, 
            "car_brand": "", 
            "got_price": 0, 
            "rate": 30, 
            "create_time": 0, 
            "img3": "", 
            "img2": "", 
            "img1": "", 
            "status_str": "投标中", 
            "pay_type": 0, 
            "worth_price": 0, 
            "create_time_str": "1970-01-01 00:00:00", 
            "status": 0, 
            "mileage": "", 
            "pay_type_str": "每月付息", 
            "tags": [
                "333", 
                "444"
            ], 
            "imgs": [
                "111", 
                "222"
            ], 
            "bid_price": 0, 
            "product_id": 0, 
            "term": 0, 
            "product_type": 0, 
            "name": "", 
            "license_time": 0, 
            "cover": ""
        }, 
        "investor": [
            {
                "inverst_amount": 1165000, 
                "got_amount": 345000, 
                "name": "张三", 
                "face": ""
            }, 
            {
                "inverst_amount": 1165000, 
                "got_amount": 345000, 
                "name": "张四", 
                "face": "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1229233613,1232336907&fm=27&gp=0.jpg"
            }, 
            {
                "inverst_amount": 1165000, 
                "got_amount": 345000, 
                "name": "张五", 
                "face": "https://ss3.bdstatic.com/6Ls0a8Sm2Q5IlBGlnYG/timg?video&quality=100&size=f130_98&sec=1366351082&di=58438bd49eb81dab9d2e94b3523874e6&src=http%3A%2F%2Fhiphotos.baidu.com%2Fbaidu%2Fpic%2Fitem%2Fac345982b2b7d0a22e6c7284c0ef76094b369a05.jpg"
            }
        ]
    }
}
*/
class Product:HandyJSON {
var yearly: Int = 0
var userNum: Int = 0
var carBrand: String = ""
var gotPrice: Int = 0
var rate: Int = 0
var createTime: Int = 0
var img3: String = ""
var img2: String = ""
var img1: String = ""
var statusStr: String = ""
var payType: Int = 0
var worthPrice: Int = 0
var createTimeStr: String = ""
var status: Int = 0
var mileage: String = ""
var payTypeStr: String = ""
var tags: [String]? 
var imgs: [String]? 
var bidPrice: Int = 0
var productId: Int = 0
var term: Int = 0
var productType: Int = 0
var name: String = ""
var licenseTime: Int = 0
var cover: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.yearly <-- "yearly"
mapper <<<
        self.userNum <-- "user_num"
mapper <<<
        self.carBrand <-- "car_brand"
mapper <<<
        self.gotPrice <-- "got_price"
mapper <<<
        self.rate <-- "rate"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.img3 <-- "img3"
mapper <<<
        self.img2 <-- "img2"
mapper <<<
        self.img1 <-- "img1"
mapper <<<
        self.statusStr <-- "status_str"
mapper <<<
        self.payType <-- "pay_type"
mapper <<<
        self.worthPrice <-- "worth_price"
mapper <<<
        self.createTimeStr <-- "create_time_str"
mapper <<<
        self.status <-- "status"
mapper <<<
        self.mileage <-- "mileage"
mapper <<<
        self.payTypeStr <-- "pay_type_str"
mapper <<<
        self.tags <-- "tags"
mapper <<<
        self.imgs <-- "imgs"
mapper <<<
        self.bidPrice <-- "bid_price"
mapper <<<
        self.productId <-- "product_id"
mapper <<<
        self.term <-- "term"
mapper <<<
        self.productType <-- "product_type"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.licenseTime <-- "license_time"
mapper <<<
        self.cover <-- "cover"
}
}
class Investor:HandyJSON {
var inverstAmount: Int = 0
var gotAmount: Int = 0
var name: String = ""
var face: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.inverstAmount <-- "inverst_amount"
mapper <<<
        self.gotAmount <-- "got_amount"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.face <-- "face"
}
}
class Result:HandyJSON {
var product: Product?  
var investor: [Investor]? 
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.product <-- "product"
mapper <<<
        self.investor <-- "investor"
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

        Alamofire.request(NetworkConfig.Server+"/rest/product/det", method: .post, parameters:[
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