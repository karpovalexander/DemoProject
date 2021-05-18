//
//  Mapper.swift
//  TestProject


import Foundation
import ReactiveSwift

protocol MapperProtocol {
    func map<MappingResult: Codable>(data: Data, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) -> SignalProducer<MappingResult, Error>
}

extension MapperProtocol {
    func map<MappingResult: Codable>(data: Data) -> SignalProducer<MappingResult, Error> {
        return map(data: data, dateDecodingStrategy: .deferredToDate)
    }
}


final class Mapper : MapperProtocol {
    func map<MappingResult>(data: Data, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) -> SignalProducer<MappingResult, Error> where MappingResult : Decodable, MappingResult : Encodable {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            let result = try decoder.decode(MappingResult.self, from: data)
            return SignalProducer(value: result)
        } catch DecodingError.dataCorrupted(let context) {
            print(DecodingError.dataCorrupted(context))
        } catch DecodingError.keyNotFound(let key, let context) {
            print(DecodingError.keyNotFound(key,context))
        } catch DecodingError.typeMismatch(let type, let context) {
            print(DecodingError.typeMismatch(type,context))
        } catch DecodingError.valueNotFound(let value, let context) {
            print(DecodingError.valueNotFound(value,context))
        } catch let error{
            print(error)
            return SignalProducer(error: Error.parsing)
        }
        return SignalProducer(error: Error.parsing)
    }
}
