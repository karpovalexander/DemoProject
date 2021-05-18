//
//  OffersNetworkRouter.swift
//  TestProject


import Alamofire

enum OffersNetworkRouter: URLRequestConvertible {
    case list
}

extension OffersNetworkRouter: NetworkRequestParams {
    var path: String {
        switch self {
        case .list:
            return "offers.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
