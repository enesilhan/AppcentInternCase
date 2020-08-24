//
//  PhotoViewModel.swift
//  AppcentCaseProject
//
//  Created by Enes ILHAN on 21.08.2020.
//  Copyright © 2020 Enes ILHAN. All rights reserved.
//

import Foundation

struct PhotoListViewModel {
    let flickrImageList : [Photo]
    
    func numberOfRowsInSection() -> Int {
        return self.flickrImageList.count
    }
    
    func photoAtIndex(_ index: Int) -> photoVModel {
        let photo = self.flickrImageList[index]
        return photoVModel(flickrImage: photo)
    }
}

struct photoVModel {
    let flickrImage : Photo
    
    
    var id : String {
        return self.flickrImage.id
    }
    
    var owner : String {
        return self.flickrImage.owner
    }

    var secret : String {
        return self.flickrImage.secret
    }
    
    var server : String {
        return self.flickrImage.server
    }
    
    var farm : Int {
        return self.flickrImage.farm
    }
    
    var title : String {
        return self.flickrImage.title
    }
    
    var ownername : String {
        return self.flickrImage.ownername
    }
    
    var url_l : String {
        return self.flickrImage.url_sq
    }
}
