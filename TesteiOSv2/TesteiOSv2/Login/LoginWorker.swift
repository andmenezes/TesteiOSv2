//
//  LoginWorker.swift
//  TesteiOSv2
//
//  Created by André Menezes on 09/03/20.
//  Copyright (c) 2020 André Menezes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire

class LoginWorker
{
    func tryLogin(user: String, password: String, success: @escaping (User) -> Void, failure: @escaping (Error) -> Void) {
        let parameters = ["user":"a","password":"a"]
        
        APIService().APIRequest(urlString: "https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: parameters) { response in
            
            debugPrint(response)
            print(response)
            
            let decoder = JSONDecoder()
            
            do {
                let response = try decoder.decode(LoginResponse.self, from: response.value!)
                if let user = response.userAccount, let _ = user.userId {
                    success(user)
                }else if let error = response.error, let message = response.error?.message, message.count > 0 {
                    failure(error)
                }
                
            } catch {
                print(error.localizedDescription)
                let error = Error(code: 99, message: "Tivemos um erro desconhecido")
                failure(error)
            }
        }
    }
}

