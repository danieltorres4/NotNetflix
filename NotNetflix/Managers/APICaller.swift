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

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print("RESULTS: \n\(results.results)")
                completion(.success(results.results))
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                print("TV RESULTS: \n\(results.results)")
                completion(.success(results.results))
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print("UPCOMING MOVIES RESULTS: \n\(results.results)")
                completion(.success(results.results))
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print("POPULAR MOVIES RESULTS: \n\(results.results)")
                completion(.success(results.results))
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print("TOP RATED MOVIES RESULTS: \n\(results.results)")
                completion(.success(results.results))
            } catch {
                print("ERROR: \n\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
