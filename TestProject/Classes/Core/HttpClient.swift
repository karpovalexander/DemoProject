//
//  HttpClient.swift
//  TestProject


import ReactiveSwift
import Alamofire

protocol HTTPClientProtocol {
    func load(request: NetworkRequestParams & URLRequestConvertible) -> SignalProducer<Data, Error>
}

final class HTTPClient : HTTPClientProtocol {
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager = _sessionManager()) {
        self.sessionManager = sessionManager
    }
    
    deinit {
        sessionManager.session.getAllTasks { (tasks) in
            tasks.forEach { $0.cancel() }
        }
    }
    
    func load(request: NetworkRequestParams & URLRequestConvertible) -> SignalProducer<Data, Error> {
        let urlRequest = try! request.asURLRequest()
        return SignalProducer { sink, disposable in
            self.sessionManager.request(urlRequest).responseData(queue: DispatchQueue.global(qos: .utility), completionHandler: { (response) in
                if let error = response.error {
                    if (error as NSError).code == NSURLErrorNotConnectedToInternet {
                        sink.send(error: Error.noConnection)
                        return
                    }
                    sink.send(error: Error.somethingWentsWrong)
                    return
                }
                guard let httpResponse = response.response else {
                    sink.send(error: Error.noData)
                    return
                }
                
                switch(httpResponse.statusCode) {
                case 200...205:
                    guard let data = response.data else {
                        sink.send(error: Error.noData)
                        return
                    }
                    sink.send(value: data)
                    sink.sendCompleted()
                case 400..<600:
                    sink.send(error: Error.somethingWentsWrong)
                default:
                    sink.sendInterrupted()
                }
            })
        }
    }
}

fileprivate func _sessionManager() -> Alamofire.SessionManager {
    let configuration = URLSessionConfiguration.default
    configuration.httpMaximumConnectionsPerHost = 1
    configuration.urlCache = nil
    configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
    configuration.timeoutIntervalForResource = 30
    let manager = Alamofire.SessionManager(configuration: configuration)
    return manager
}

