//
//  BannersNetworkRouter.swift
//  TestProject


import Alamofire

enum BannersNetworkRouter: URLRequestConvertible {
    case list
}

extension BannersNetworkRouter: NetworkRequestParams {
    var path: String {
        switch self {
        case .list:
            return "banners.json"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}

