//
//  UserService.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

import Alamofire

class SignInService {
    static let shared = SignInService()
    private init() {}
    
    func signIn(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.signInURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in

            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode,
                      let value = response.value
                else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
    }
    

    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print("judgeSignInStatus")
        switch statusCode {
        case ..<300: return isValidData(data: data)
        case 400..<500: return .pathErr
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        print("isValidSignInData")
        let decoder = JSONDecoder()
        print("isValidSignInData after decoding")
        guard let decodedData = try? decoder.decode(SignInResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    
}