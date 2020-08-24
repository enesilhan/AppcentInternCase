//
//  FlickrService.swift
//  AppcentCaseProject
//
//  Created by Enes ILHAN on 21.08.2020.
//  Copyright © 2020 Enes ILHAN. All rights reserved.
//

import Foundation

class FlickrService {
    func getPhoto(url: URL, completion: @escaping ([Photo]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                
                do {
                    let photoList = try JSONDecoder().decode(PhotosResponse.self, from: data)
                    print(photoList)
                    completion(photoList.photos.photo)
                } catch {
                    print(error)
                }
                
            }
        }.resume()
    }
}
