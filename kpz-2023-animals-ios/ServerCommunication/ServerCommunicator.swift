//
//  ServerCommunicator.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 30/05/2023.
//
import Foundation

class ServerCommunicator {
    private let serverAddress = "http://localhost:8080/"

    func get<T: Codable>(endpoint: String) async throws -> T {
        let url = URL(string: serverAddress + endpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func getAll<T: Codable>(endpoint: String) async throws -> [T] {
        let url = URL(string: serverAddress + endpoint)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([T].self, from: data)
    }

    func post<T: Encodable>(endpoint: String, item: T) async throws -> Bool {
        let url = URL(string: serverAddress + endpoint)!
        let data = try JSONEncoder().encode(item)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let (_, response) = try await URLSession.shared.data(for: request)
        return (response as? HTTPURLResponse)?.statusCode == 200
    }
}

