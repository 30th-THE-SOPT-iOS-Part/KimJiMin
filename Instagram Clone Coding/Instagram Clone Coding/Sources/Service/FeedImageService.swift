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
        let url = APIConstants.feedImageURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let queryParam = [
            "client_id" : APIConstants.clientID
        ]
                
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: queryParam,
                                     encoding : URLEncoding.default,
                                     headers: header)
    
        dataRequest.responseData { response in
            print(response)
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
        print("judgeFetchAPIStatus")
        switch statusCode {
        case ..<300: return isValidData(data: data)
        case 400..<500: return .pathErr
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        print("isValidFetchAPIData")
        let decoder = JSONDecoder()
        print("isValidFetchAPIData after decoding")
        guard let decodedData = try? decoder.decode(FeedImageResponse.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
    
}
