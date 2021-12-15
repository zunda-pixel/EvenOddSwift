import Foundation
import FoundationNetworking

@main
struct EvenOddSwift {
    static func main() async {
        let number = 10

        do {
            let isEven = try await isEven(number: number)
            print("\(number) is \(isEven ? "even" : "odd")")
        } catch {
            print(error)
        }
    }
}

func isEven(number: Int) async throws -> Bool {
    let baseURL: URL = .init(string: "https://api.isevenapi.xyz/api/iseven/")!
    let url: URL = baseURL.appendingPathComponent("\(number)")
    let (data, _) = try await URLSession.shared.data(from: url)
    let model = try JSONDecoder().decode(Model.self, from: data)
    return model.iseven
}