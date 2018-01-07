//
// Created by sgzh on 2017/10/13.
// Copyright (c) 2017 xiangqianjin. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON
class AttachUploadNetwork {
    //结果
    class ResultModel:HandyJSON {
        var url: String = ""
        required init() {
        }
        
        func mapping(mapper: HelpingMapper) {
            
            mapper <<<
                self.url <-- "url"
        }
    }
    //响应
    class ResponseModel:HandyJSON {
        var info: String = ""
        var msg: String = ""
        var errMsg: String = ""
        var result: ResultModel?
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
    //上传图片接口
    public func request( acc: String, user_token: String,image : UIImage , callback: @escaping ((_ result: ResponseModel?) -> ())) {
        let parameters = [
            "ext":"jpg",
            "attach":"img",
            "acc":acc,
            "user_token":user_token
        ]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                // multipartFormData.append(unicornImageURL, withName: "file")
                    let imageName = String(describing: NSDate()) + ".png"
                    if let imageData = UIImageJPEGRepresentation(image, 0.5) {
                        print("xxxxxxxxxxxxxxxxxxxxxx---hhhh")
                        //multipartFormData.append(imageData, withName: "file")
                        //multipartFormData.append(imageData, withName: "file")
                         //multipartFormData.append(data: imageData, name: "file", fileName: "file.png", mimeType: "image/png")
                       // let data = UIImageJPEGRepresentation(image, scale)
                       // multipartFormData.append(data: imageData, withName: "file", fileName: imageName, mimeType: "image/png")
                        multipartFormData.append(imageData, withName: "file", fileName: imageName, mimeType: "image/png")
                        
                    }
                
                
                for (key, value) in parameters {
                    
                    multipartFormData.append(value.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                   //multipartFormData.append(value, withName: key)
                }
                
            },
            
            to: NetworkConfig.Server+"/rest/attach/upload",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.response { response in
                        if nil != response.error || 200 != response.response?.statusCode {
                            let err_result = ResponseModel()
                           
                            err_result.msg = "api_err"
                            err_result.info = "接口异常"
                            err_result.errMsg = "error:\(String(describing: response.error)), status_code:\(String(describing: response.response?.statusCode))"
                            print("===error:\(err_result.errMsg)")
                            callback(err_result)
                        } else {
                            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                                print("=======Data: \(utf8Text)") // original server data as UTF8 string
                                if let object = ResponseModel.deserialize(from: utf8Text) {
                                    print("------------\(object)")
                                    callback(object)
                                }else{
                                    let err_result = ResponseModel()
                                    err_result.msg = "api_data_err"
                                    err_result.info = "接口返回数据异常"
                                    err_result.errMsg = ""
                                    
                                    callback(err_result)
                                }
                            }
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    let err_result = ResponseModel()
                    
                    err_result.msg = "data_err"
                    err_result.info = "不是合法的文件"
                    err_result.errMsg = "error:\(encodingError)"
                    print("===error:\(err_result.errMsg)")
                    callback(err_result)

                }
        }
        )
    }
    
}
