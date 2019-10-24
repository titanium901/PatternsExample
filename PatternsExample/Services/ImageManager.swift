//
//  ImageManager.swift
//  PatternsExampleMVC
//
//  Created by Yury Popov on 24.10.2019.
//  Copyright © 2019 Iurii Popov. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    func getImageData(from imageURL: String?) -> Data? {
        guard let stringURL = imageURL else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
