import Foundation

#if os(Linux)
import FoundationNetworking
#endif

#if compiler(>=5.5.2) && canImport(_Concurrency)
extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = dataTask(with: url) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: (data!, response!))
                }
            }
            task.resume()
        }
    }

    func data(for urlRequest: URLRequest) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            let task = dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: (data!, response!))
                }
            }
            task.resume()
        }
    }
}

#endif
