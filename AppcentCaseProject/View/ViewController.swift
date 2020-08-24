//
//  ViewController.swift
//  AppcentCaseProject
//
//  Created by Enes ILHAN on 21.08.2020.
//  Copyright © 2020 Enes ILHAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var images = [Photo]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private var photoListViewModel: PhotoListViewModel!
    var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        getPhotos()
    }
    
    func getPhotos() {
        let urlPhoto = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=36d7f10489b33d970b180897d9dbb209&page=\(page)&per_page=20&extras=url_sq,owner_name&format=json&nojsoncallback=?")!
        FlickrService().getPhoto(url: urlPhoto) { (photos) in
            if let photos = photos {
                DispatchQueue.main.async {
                    self.images.append(contentsOf: photos)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
        cell.titleLabel.text = images[indexPath.row].title
        cell.imageView?.downloaded(from: images[indexPath.row].url_sq)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == images.count - 5 {
            self.page += 1
            self.getPhotos()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
            let vc = segue.destination as? FullScreenViewController,
            let indexPath = sender as? IndexPath {
            vc.imageURL = images[indexPath.row].url_sq
        }
    }
}
