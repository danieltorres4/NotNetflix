//
//  APICaller.swift
//  NotNetflix
//
//  Created by Daniel Sanchez Torres on 14/11/23.
//
// https://api.themoviedb.org/3/trending/all/day?api_key=aac68339b14a798e91c45b11fd82e3ee
import Foundation

struct Constants {
    static let API_KEY = "aac68339b14a798e91c45b11fd82e3ee"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print("RESULTS: \n\(results)")
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
