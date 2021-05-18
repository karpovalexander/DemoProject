//
//  NetworkRequestParams.swift
//  TestProject


import Alamofire

protocol NetworkRequestParams {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension NetworkRequestParams {
    var encoding: ParameterEncoding {
        return URLEncoding.methodDependent
    }
    
    var parameters: Parameters? {
        return nil
    }
}

extension URLRequestConvertible where Self:NetworkRequestParams  {
    func asURLRequest() throws -> URLRequest {
        let baseUrl = URL(string: Constants.Network.apiBaseUrl)!
        let url = baseUrl.appendingPathComponent(self.path)
        var request = try! URLRequest(url: url, method: self.method, headers: nil)
        request.cachePolicy = .reloadIgnoringLocalCacheData
        request.timeoutInterval = 30
        return try self.encoding.encode(request, with: self.parameters)
    }
}

