//
//  UserService.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/05/15.
//

import Foundation

import Alamofire

final class FeedImageService {
    static let shared = FeedImageService()
    private init() {}
    
    func fetchImage( completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        
//        MARK: Lorem Picsum API
//        let url = APIConstants.feedImageURL
//        let queryParam = [
//                 "page" : 2,
//                 "limit":20
//             ]
        
        //MARK: Unsplash API
        let url = APIConstants.feedImageURL_unsplash
        let queryParam = [
            "client_id" : APIConstants.clientID
        ]
                
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: queryParam,
                                     encoding : URLEncoding.default,
                                     headers: header)
    
        dataRequest.responseData { response in
            print("RESPONSE:",response)
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode,
                      let value = response.value
                else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                print(statusCode)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
    }
    

    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case ..<300: return isValidData(in: data)
        case 400..<500: return isUsedPathErr(in: data)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(in data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode([ImageModel].self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    
    private func isUsedPathErr(in data:Data)-> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode([ImageModel].self, from: data)
        else { return .pathErr }
        return .requestErr(decodedData)
    }
}
