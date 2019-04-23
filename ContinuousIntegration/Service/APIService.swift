//  APIService.swift
//  MVVMPlayground
//
//  Created by Maximilian Sonntag on 03/10/2019.
//  Copyright © 2019 Sonntag. All rights reserved.

import Foundation
import Firebase

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->() )
}

class APIService: APIServiceProtocol {
    // Simulate a long waiting for fetching 
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->() ) {
        Database.database().reference().child("images").observeSingleEvent(of: .value) { (snapshot) in
            var photos = [Photo]()
            for child in snapshot.children {
                guard let snap = child as? DataSnapshot else { continue }
                guard let photo = Photo(snapshot: snap) else { continue }
                photos.append(photo)
            }
            print("PHOTOS: \(photos.count)")
            complete(true, photos, nil)
        }
    }
}







