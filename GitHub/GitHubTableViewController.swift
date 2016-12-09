//
//  ViewController.swift
//  GitHub
//
//  Created by Marco Almeida on 12/8/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

import UIKit

class GitHubTableViewController: UITableViewController, APIControllerProtocol

    {
    
    var api: APIController!
    // variable to store the API controller
    
    var albums = [Album]()
    
    
    func didReceiveAPIResults(_ dictionary: [String: Any])
    {
    let queue = DispatchQueue.main
    // Teacher will talk about this at a later time
    queue.async {
    self.albums = Album.albumsWithJSON(dictionary)
    self.tableView.reloadData()
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
    // this will turn off  the status bar activity indicator
    
    }
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // do things here before window is visible to users
    api = APIController(delegate: self)  // Number 1 step  *****************************************
//    api.searchItuneFor("IronManMAA")   // Number 3 step  *****************************************
    api.searchItuneFor("jcgohlke")
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    // this will display the status bar activity indicator
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AlbumCell")
    // given that there is no StoryBoard in this application, programaticaly register the cell with the above code line
    }
    
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
    let album = albums[indexPath.row]
    var st = ""
        if (album.name != "") { st = "Name: "+album.name }
    if (album.email != "") { st = "Email: "+album.email }
    if (album.UserURL != "") { st = "URL: "+album.UserURL }
//        + album.email + album.UserURL + album.type
    cell.textLabel?.text = st
    return cell
    }
    
    
    
} //end of Class
