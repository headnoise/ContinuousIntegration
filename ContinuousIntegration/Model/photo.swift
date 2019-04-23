//
//  Event.swift
//  MVVMPlayground
//
//  Created by Maximilian on 04/15/2019.
//  Copyright © 2019 Sonntag. All rights reserved.
//

import Foundation
import Firebase

class Photos: Codable {
    var photos = [Photo]()
    
    init(photos: [Photo]) {
        self.photos = photos
    }
}

class Photo: Codable {
    var id: String?
    var name: String? = nil
    var description: String?  = nil
    var created_at: Date?  = nil
    var image_url: String
    var for_sale: Bool? = true
    var camera: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case description
        case image_url
        case for_sale
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.image_url = try values.decode(String.self, forKey: .image_url)
        if let description = try values.decodeIfPresent(String.self, forKey: .description) {
            self.description = description
        }
        if let for_sale = try values.decodeIfPresent(Bool.self, forKey: .for_sale) {
            self.for_sale = for_sale
        }
    }
    
    init(id: String, name: String?, description: String?, created_at: Date?, image_url: String, for_sale: Bool? = true, camera: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.created_at = created_at
        self.image_url = image_url
        self.for_sale = for_sale
        self.camera = camera
    }
    
    convenience init?(snapshot: DataSnapshot) {
        do {
            guard let value = snapshot.data else { return nil }
            let photo = try JSONDecoder().decode(Photo.self, from: value)
            self.init(id: snapshot.key, name: photo.name, description: photo.description, created_at: photo.created_at, image_url: photo.image_url, for_sale: photo.for_sale, camera: photo.camera)
        } catch {
            print(error)
            return nil
        }
    }
}
