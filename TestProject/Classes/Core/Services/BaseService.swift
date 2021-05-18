//
//  BaseService.swift
//  TestProject


import Foundation

class BaseService {
    internal let httpClient: HTTPClientProtocol
    internal let mapper: MapperProtocol
    
    init(httpClient: HTTPClientProtocol = HTTPClient(), mapper: MapperProtocol = Mapper()) {
        self.httpClient = httpClient
        self.mapper = mapper
    }
}
