//
//  BannersService.swift
//  TestProject


import ReactiveSwift

protocol BannersServiceProtocol {
    func list() -> SignalProducer<[Banner], Error>
}

final class BannersService: BaseService, BannersServiceProtocol {
    
    // MARK: - BannersServiceProtocol
    
    func list() -> SignalProducer<[Banner], Error> {
        let request = BannersNetworkRouter.list
        return self.httpClient.load(request: request)
            .flatMap(.latest, mapper.map)
    }
    
}
