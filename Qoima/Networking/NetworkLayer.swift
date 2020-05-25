//
//  NetworkLayer.swift
//  Qoima
//
//  Created by root user on 5/9/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NetworkLayer {
    private static var sharedReference : NetworkLayer{
          let headers = NetworkLayer()
          return headers
    }
    class func shared() -> NetworkLayer {
          return sharedReference
    }
    
    func register(params : [String: AnyObject], callback: @escaping (LoginResponse?) -> ()) {
        Alamofire.request(Constants.shared().registerRequest, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{
                 (response: DataResponse<LoginResponse>) in
                 if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }
    
    func login(params : [String: AnyObject], callback: @escaping (LoginResponse?) -> ()) {
      Alamofire.request(Constants.shared().loginRequest, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{
               (response: DataResponse<LoginResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
    
    
    func getCategories(callback: @escaping ([Category]?) -> ()) {
        Alamofire.request(Constants.shared().getCategories, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseArray{
                 (response: DataResponse<[Category]>) in
                 if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }
    
    func addItem(params : [String: AnyObject], callback: @escaping (AddItemResponse?) -> ()) {
      Alamofire.request(Constants.shared().addItem, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{
               (response: DataResponse<AddItemResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
    
    func postImageRequestWithURL(withUrl strURL: String,withParam postParam: Dictionary<String, Any>,withImages imageArray:NSMutableArray,completion:@escaping (_ isSuccess: Bool, _ response:NSDictionary) -> Void)
    {

        Alamofire.upload(multipartFormData: { (MultipartFormData) in

            // Here is your Image Array
            for (imageDic) in imageArray
            {
                let imageDic = imageDic as! NSDictionary

                for (key,valus) in imageDic
                {
                    MultipartFormData.append(valus as! Data, withName:key as! String,fileName: "file.jpg", mimeType: "image/jpg")
                }
            }

            // Here is your Post paramaters
            for (key, value) in postParam
            {
                MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }

        }, usingThreshold: UInt64.init(), to: strURL, method: .post) { (result) in

            switch result {
            case .success(let upload, _, _):

                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })

                upload.responseJSON { response in

                    if response.response?.statusCode == 200
                    {
                        let json = response.result.value as? NSDictionary

                        completion(true,json!);
                    }
                    else
                    {
                        completion(false,[:]);
                    }
                }

            case .failure(let encodingError):
                print(encodingError)

                completion(false,[:]);
            }

        }
    }
    
    func getItems(params : [String: AnyObject], callback: @escaping (ItemsResponse?) -> ()) {
      Alamofire.request(Constants.shared().getItems, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject{
               (response: DataResponse<ItemsResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
    
    func planItem(id : Int, callback: @escaping (PlanResponse?) -> ()) {
        Alamofire.request(Constants.shared().planitem + "?id=\(Helper.shared().getValue(byKey: "id") ?? "")&unique=\(Helper.shared().getToken())&item_id=\(id)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
               (response: DataResponse<PlanResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
    func deliverItem(id : Int, callback: @escaping (PlanResponse?) -> ()) {
          Alamofire.request(Constants.shared().deliverItem + "?id=\(Helper.shared().getValue(byKey: "id") ?? "")&unique=\(Helper.shared().getToken())&item_id=\(id)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
                 (response: DataResponse<PlanResponse>) in
                 if let _ = response.response{
                     let model = response.result
                     callback(model.value ?? nil)
                 }
             }
      }
    
    func getQoimaList(callback: @escaping (QoimaResponse?) -> ()) {
        Alamofire.request(Constants.shared().qoimaList + "?id=\(Helper.shared().getValue(byKey: "id") ?? "")&unique=\(Helper.shared().getToken())", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
               (response: DataResponse<QoimaResponse>) in
               if let _ = response.response{
                   let model = response.result
                   callback(model.value ?? nil)
               }
           }
    }
}
