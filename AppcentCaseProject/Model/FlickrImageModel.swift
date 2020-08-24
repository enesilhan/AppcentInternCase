//
//  FlickrImageModel.swift
//  AppcentCaseProject
//
//  Created by Enes ILHAN on 21.08.2020.
//  Copyright © 2020 Enes ILHAN. All rights reserved.
//

import Foundation

struct PhotosResponse: Decodable {
    let photos: PhotosData
}

struct PhotosData: Decodable {
    var page: Int!
    var pages: Int!
    var perpage: Int!
    var total: Int!
    var photo: [Photo]!
}

struct Photo : Decodable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ownername: String
    let url_sq: String    
}
