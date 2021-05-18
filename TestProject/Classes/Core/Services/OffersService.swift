//
//  OffersService.swift
//  TestProject


import ReactiveSwift

protocol OffersServiceProtocol {
    func list() -> SignalProducer<[Offer], Error>
}

final class OffersService: BaseService, OffersServiceProtocol {
    
    // MARK: - OffersServiceProtocol
    
    func list() -> SignalProducer<[Offer], Error> {
        let request = OffersNetworkRouter.list
        return self.httpClient.load(request: request)
            .flatMap(.latest, mapper.map)
    }
    
}
