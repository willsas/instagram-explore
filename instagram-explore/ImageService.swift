//
//  ImageService.swift
//  instagram-explore
//
//  Created by Willa on 06/03/21.
//

import Foundation


class ImageService {
    
    static var shared = ImageService()
    
    func getImageURLs(limit: Int) -> [URL] {
        var urls = [URL]()
        for i in 0...limit{
            urls.append(URL(string: "https://picsum.photos/id/\(i + Int.random(in: 0...100))/200")!)
        }
        return urls
    }
}
