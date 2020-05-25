//
//  AddItemPresenter.swift
//  Qoima
//
//  Created by root user on 5/11/20.
//  Copyright © 2020 iitu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol AddItemViewProtocol : ScrollStackController {
    var presenter : AddItemPresenterProtocol? { get set }
    func succeeded()
    func getParams(params : [Parameters])
}
protocol AddItemPresenterProtocol {
    var view : AddItemViewProtocol? { get set }
    var params : [Parameters]? { get set }
    var router : MainRouter? { get set }
    var categories : [Category]? { get set }
    init(view : AddItemViewProtocol, router : MainRouter)
    func setParams() -> [Parameters]
    func getCategories()
    func addItemRequest(params : Parameters, image: UIImage)
}
class AddItemPresenter: AddItemPresenterProtocol {
    
    
    var categories: [Category]?
    
    var view: AddItemViewProtocol?
    
    var params: [Parameters]?
    
    var router: MainRouter?
    
    required init(view: AddItemViewProtocol, router: MainRouter) {
        self.view = view
        self.router = router
        self.getCategories()
    }
    
    func setParams() -> [Parameters] {
        var array = [Parameters]()
        let param = Parameters()
        
        param.paramTitle = "Категории"
        param.isDropDown = true
        array.append(param)
        
        let param1 = Parameters()
        param1.paramTitle = "Название"
        param1.keyboardType = .default
        array.append(param1)
        
        
        let param2 = Parameters()
        param2.paramTitle = "Длина (см)"
        param2.keyboardType = .numberPad
        array.append(param2)
        let param3 = Parameters()
        param3.paramTitle = "Ширина (см)"
        param3.keyboardType = .numberPad
        array.append(param3)
        let param4 = Parameters()
        param4.paramTitle = "Высота (см)"
        param4.keyboardType = .numberPad
        array.append(param4)
        let param5 = Parameters()
        param5.paramTitle = "Количество"
        param5.keyboardType = .numberPad
        array.append(param5)
//        let param6 = Parameters()
//        param6.paramTitle = "Цена"
//        param6.isFillable = false
//        array.append(param6)
        
        let param7 = Parameters()
        param7.paramTitle = "Загрузить фотографию"
        param7.isPhoto = true
        array.append(param7)
        self.params = array
        return params!
    }
    
    func addItemRequest(params: Parameters, image : UIImage) {
        var parameters: [String:Any] = params.getJson()
        parameters["id"] = Helper.shared().getValue(byKey: "id")
        parameters["unique"] = Helper.shared().getToken()
        self.uploadImage(image: image, params: parameters)
    }
    
    func getCategories() {
        self.view?.startLoading()
        NetworkLayer.shared().getCategories { (categories) in
            self.view?.stopLoading()
            self.categories = categories
            self.view?.getParams(params: self.setParams())
        }
    }
  
    func uploadImage(image: UIImage, params : [String: Any]) {
        
        
//        let dat = NSKeyedArchiver.archivedData(withRootObject: params)
        var dataExample: Data?
        do {
            let d = try NSKeyedArchiver.archivedData(withRootObject: params, requiringSecureCoding: false)
            dataExample = d
        } catch  {
            print(error)
        }
//        let d = NSKeyedArchiver.archivedData(withRootObject: params, requiringSecureCoding: false)
        
        let url = URL(string: Constants.shared().addItem)
        
        let boundary = UUID().uuidString
        
        let session = URLSession.shared
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
     
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
        
        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"photo\"; filename=\"filename\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)
        
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//        data.append(contentsOf: dataExample!)
        for (key, value) in params{
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            data.append("\(value)".data(using: .utf8)!)
        }
        
//        data.append()
        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    DispatchQueue.main.async {
                        self.view?.succeeded()
                    }
                    
                }
            }else{
                DispatchQueue.main.async {
                    self.view?.showAlert(title: "Қате", message: "Бір-екі миніттан кейін қайталаңыз")
                }
                
            }
        }).resume()
    }
}
