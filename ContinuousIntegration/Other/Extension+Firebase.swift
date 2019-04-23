//
//  Extension+Firebase.swift
//  ContinuousIntegration
//
//  Created by Maximilian Sonntag on 4/22/19.
//  Copyright © 2019 Sonntag. All rights reserved.
//

import Foundation
import Firebase

extension DataSnapshot {
    var data: Data? {
        guard let value = value else { return nil }
        return try? JSONSerialization.data(withJSONObject: value)
    }
    var json: String? {
        return data?.string
    }
}
extension Data {
    var string: String? {
        return String(data: self, encoding: .utf8)
    }
}
