
import HandyJSON
import Alamofire
import Foundation
class ProductGetListNetwork{
    
// 参数
/* 

{
    "search": "", 
    "type": 1, 
    "page": 1, 
    "page_size": 10
}
*/
class Params:HandyJSON {
var search: String = ""
var type: Int = 0
var page: Int = 0
var pageSize: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.search <-- "search"
mapper <<<
        self.type <-- "type"
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
                "status": 1, 
                "pay_type": 1, 
                "term": 12, 
                "mileage": 123123, 
                "product_type": 1, 
                "car_brand": "", 
                "tags": [
                    "1"
                ], 
                "license_time": 1212315, 
                "cover": "http://boois-main.oss-cn-shanghai.aliyuncs.com/xqj/app_tmp_img/Tmp3.imageset/2a5d913a968687eec03d21c1bb88aa36.png", 
                "got_price": 160000, 
                "yearly": 83, 
                "name": "香江明月2期复式加急", 
                "pay_type_str": "", 
                "create_time": 12316544, 
                "worth_price": 2690000, 
                "status_str": "", 
                "user_num": 12, 
                "bid_price": 150000, 
                "product_id": 1, 
                "create_time_str": "2014-01-01 12:12:12"
            }, 
            {
                "status": 1, 
                "pay_type": 1, 
                "term": 12, 
                "mileage": 123123, 
                "product_type": 2, 
                "car_brand": "", 
                "tags": "干净,证照齐全,已质押,保证金", 
                "license_time": 1212315, 
                "cover": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507912450056&di=7d22efab7faf88d49a719ed7ffa6a805&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F902397dda144ad349c792c87daa20cf430ad85e8.jpg", 
                "got_price": 160000, 
                "yearly": 83, 
                "name": "宝马X6", 
                "create_time": 12316544, 
                "worth_price": 2690000, 
                "user_num": 12, 
                "bid_price": 150000, 
                "product_id": 2, 
                "create_time_str": "2014-01-01 12:12:12"
            }, 
            {
                "status": 1, 
                "pay_type": 1, 
                "term": 12, 
                "mileage": 123123, 
                "product_type": 1, 
                "car_brand": "", 
                "tags": "产权干净,证照齐全,已质押,保证金", 
                "license_time": 1212315, 
                "cover": "http://boois-main.oss-cn-shanghai.aliyuncs.com/xqj/app_tmp_img/Tmp3.imageset/2a5d913a968687eec03d21c1bb88aa36.png", 
                "got_price": 160000, 
                "yearly": 83, 
                "name": "香江明月3期复式加急", 
                "create_time": 12316544, 
                "worth_price": 2690000, 
                "user_num": 12, 
                "bid_price": 150000, 
                "product_id": 3, 
                "create_time_str": "2014-01-01 12:12:12"
            }, 
            {
                "status": 1, 
                "pay_type": 1, 
                "term": 12, 
                "mileage": 123123, 
                "product_type": 2, 
                "car_brand": "", 
                "tags": "干净,证照齐全,已质押,保证金", 
                "license_time": 1212315, 
                "cover": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507912450056&di=7d22efab7faf88d49a719ed7ffa6a805&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F902397dda144ad349c792c87daa20cf430ad85e8.jpg", 
                "got_price": 160000, 
                "yearly": 83, 
                "name": "宝马X7", 
                "create_time": 12316544, 
                "worth_price": 2690000, 
                "user_num": 12, 
                "bid_price": 150000, 
                "product_id": 4, 
                "create_time_str": "2014-01-01 12:12:12"
            }
        ], 
        "page": 1, 
        "page_size": 10, 
        "rs_count": 100
    }
}
*/
class List:HandyJSON {
var status: Int = 0
var payType: Int = 0
var term: Int = 0
var mileage: Int = 0
var productType: Int = 0
var carBrand: String = ""
var tags: [String]? 
var licenseTime: Int = 0
var cover: String = ""
var gotPrice: Int = 0
var yearly: Int = 0
var name: String = ""
var payTypeStr: String = ""
var createTime: Int = 0
var worthPrice: Int = 0
var statusStr: String = ""
var userNum: Int = 0
var bidPrice: Int = 0
var productId: Int = 0
var createTimeStr: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.status <-- "status"
mapper <<<
        self.payType <-- "pay_type"
mapper <<<
        self.term <-- "term"
mapper <<<
        self.mileage <-- "mileage"
mapper <<<
        self.productType <-- "product_type"
mapper <<<
        self.carBrand <-- "car_brand"
mapper <<<
        self.tags <-- "tags"
mapper <<<
        self.licenseTime <-- "license_time"
mapper <<<
        self.cover <-- "cover"
mapper <<<
        self.gotPrice <-- "got_price"
mapper <<<
        self.yearly <-- "yearly"
mapper <<<
        self.name <-- "name"
mapper <<<
        self.payTypeStr <-- "pay_type_str"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.worthPrice <-- "worth_price"
mapper <<<
        self.statusStr <-- "status_str"
mapper <<<
        self.userNum <-- "user_num"
mapper <<<
        self.bidPrice <-- "bid_price"
mapper <<<
        self.productId <-- "product_id"
mapper <<<
        self.createTimeStr <-- "create_time_str"
}
}
class Result:HandyJSON {
var list: [List]? 
var page: Int = 0
var pageSize: Int = 0
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

        Alamofire.request(NetworkConfig.Server+"/rest/product/get_list", method: .post, parameters:[
            "search" : params.search, 
"type" : params.type, 
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