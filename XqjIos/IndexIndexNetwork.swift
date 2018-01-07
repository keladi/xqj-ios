
import HandyJSON
import Alamofire
import Foundation
class IndexIndexNetwork{
    
// 参数
/* 

{
    "page": 1, 
    "page_size": 10
}
*/
class Params:HandyJSON {
var page: Int = 0
var pageSize: Int = 0
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
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
        "products": {
            "list": [
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 12, 
                    "mileage": "12000", 
                    "product_type": 2, 
                    "car_brand": "雪佛兰科迈罗", 
                    "tags": "科迈罗 豪华跑车 剪刀门  限量版", 
                    "license_time": 1507852800, 
                    "cover": "", 
                    "got_price": 123000, 
                    "yearly": 12, 
                    "name": "2016款 RS 限量版 3.6L", 
                    "rat": 14, 
                    "create_time": 1507957872, 
                    "worth_price": 360000, 
                    "user_num": 32, 
                    "bid_price": 320000, 
                    "product_id": 2, 
                    "create_time_str": "2017-10-14 05:11:12"
                }, 
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 10, 
                    "mileage": "", 
                    "product_type": 1, 
                    "car_brand": "", 
                    "tags": "融信 大卫城 高档住宅 豪华装修", 
                    "license_time": 1512950400, 
                    "cover": "http://core.serv.xiangqianjin888.com/static/upload_imgs/product/tmp_249a771aee9bf4f22c673072004b03b8_dir/cover_0.jpg", 
                    "got_price": 320000, 
                    "yearly": 7, 
                    "name": "融信大卫城单身公寓", 
                    "rat": 0, 
                    "create_time": 1512978617, 
                    "worth_price": 2100000, 
                    "user_num": 14, 
                    "bid_price": 1800000, 
                    "product_id": 3, 
                    "create_time_str": "2017-12-11 07:50:17"
                }, 
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 10, 
                    "mileage": "", 
                    "product_type": 1, 
                    "car_brand": "", 
                    "tags": "豪华住宅 豪华装修", 
                    "license_time": 1512950400, 
                    "cover": "http://core.serv.xiangqianjin888.com/static/upload_imgs/product/4/cover_0.jpg", 
                    "got_price": 598000, 
                    "yearly": 7, 
                    "name": "台江区 世茂茶亭俪园", 
                    "rat": 0, 
                    "create_time": 1512979231, 
                    "worth_price": 3789000, 
                    "user_num": 37, 
                    "bid_price": 3560000, 
                    "product_id": 4, 
                    "create_time_str": "2017-12-11 08:00:31"
                }, 
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 10, 
                    "mileage": "", 
                    "product_type": 1, 
                    "car_brand": "", 
                    "tags": "豪华住宅 三面江景 独栋别墅", 
                    "license_time": 1512950400, 
                    "cover": "http://core.serv.xiangqianjin888.com/static/upload_imgs/product/5/cover_0.jpg", 
                    "got_price": 398000, 
                    "yearly": 7, 
                    "name": "闽侯上街 阳光美墅 独栋别墅", 
                    "rat": 0, 
                    "create_time": 1512979471, 
                    "worth_price": 3864000, 
                    "user_num": 53, 
                    "bid_price": 3680000, 
                    "product_id": 5, 
                    "create_time_str": "2017-12-11 08:04:31"
                }, 
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 10, 
                    "mileage": "40000", 
                    "product_type": 2, 
                    "car_brand": "奥迪", 
                    "tags": "奥迪A7 四门轿跑 2.5自然吸气 无钥匙进入", 
                    "license_time": 1431648000, 
                    "cover": "http://core.serv.xiangqianjin888.com/static/upload_imgs/product/tmp_f016f03df9146032a657233d5560de30_dir/cover_0.jpg", 
                    "got_price": 145300, 
                    "yearly": 7, 
                    "name": "14款奥迪A7 四门轿跑", 
                    "rat": 0, 
                    "create_time": 1512978099, 
                    "worth_price": 385000, 
                    "user_num": 29, 
                    "bid_price": 360000, 
                    "product_id": 6, 
                    "create_time_str": "2017-12-11 07:41:39"
                }, 
                {
                    "status": 0, 
                    "pay_type": 1, 
                    "term": 10, 
                    "mileage": "40000", 
                    "product_type": 2, 
                    "car_brand": "奥迪", 
                    "tags": "奥迪A7 四门轿跑 2.5自然吸气 无钥匙进入", 
                    "license_time": 1431648000, 
                    "cover": "http://core.serv.xiangqianjin888.com/static/upload_imgs/product/tmp_f2269e3aa08b66697d3f1529680f400e_dir/cover_0.jpg", 
                    "got_price": 145300, 
                    "yearly": 7, 
                    "name": "14款奥迪A7 四门轿跑", 
                    "rat": 0, 
                    "create_time": 1512978099, 
                    "worth_price": 385000, 
                    "user_num": 29, 
                    "bid_price": 360000, 
                    "product_id": 7, 
                    "create_time_str": "2017-12-11 07:41:39"
                }
            ], 
            "page": 1, 
            "page_size": 10, 
            "rs_count": 6
        }, 
        "lunbo": [
            {
                "url": "http://web.xiangqianjin888.com/about_us.html", 
                "text": "", 
                "img_url": "http://boois-main.oss-cn-shanghai.aliyuncs.com/xqj/app_tmp_img/banner1.imageset/banner1.jpg"
            }, 
            {
                "url": "http://web.xiangqianjin888.com/about_us.html", 
                "text": "", 
                "img_url": "http://boois-main.oss-cn-shanghai.aliyuncs.com/xqj/app_tmp_img/banner2.imageset/banner2.jpg"
            }, 
            {
                "url": "http://web.xiangqianjin888.com/about_us.html", 
                "text": "", 
                "img_url": "http://boois-main.oss-cn-shanghai.aliyuncs.com/xqj/app_tmp_img/banner3.imageset/banner3.jpg"
            }
        ]
    }
}
*/
class List:HandyJSON {
var status: Int = 0
var payType: Int = 0
var term: Int = 0
var mileage: String = ""
var productType: Int = 0
var carBrand: String = ""
var tags: String = ""
var licenseTime: Int = 0
var cover: String = ""
var gotPrice: Int = 0
var yearly: Int = 0
var name: String = ""
var rat: Int = 0
var createTime: Int = 0
var worthPrice: Int = 0
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
        self.rat <-- "rat"
mapper <<<
        self.createTime <-- "create_time"
mapper <<<
        self.worthPrice <-- "worth_price"
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
class Products:HandyJSON {
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
class Lunbo:HandyJSON {
var url: String = ""
var text: String = ""
var imgUrl: String = ""
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.url <-- "url"
mapper <<<
        self.text <-- "text"
mapper <<<
        self.imgUrl <-- "img_url"
}
}
class Result:HandyJSON {
var products: Products?  
var lunbo: [Lunbo]? 
required init() {
        }

        func mapping(mapper: HelpingMapper) {
    
mapper <<<
        self.products <-- "products"
mapper <<<
        self.lunbo <-- "lunbo"
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

        Alamofire.request(NetworkConfig.Server+"/rest/index/index", method: .post, parameters:[
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