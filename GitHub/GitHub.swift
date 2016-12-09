//
//  GitHub.swift
//  GitHub
//
//  Created by Marco Almeida on 12/8/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

import Foundation

struct Album
{
    let name: String
    let email: String
    let UserURL: String
    let type: String
    
    static func albumsWithJSON(_ dictionary: [String: Any]) -> [Album]
        // static because the func is part of the Album Struct
    {
        var albums = [Album]()
        // initialize an empty Array
        if dictionary.count > 0
        {
                     if let nameT = dictionary["name"] as? String
                    {
                        let emailT = dictionary["email"] as? String  ?? "Unavailable"
                        let htmlurlT = dictionary["html_url"] as? String ?? "Unavailable"
                        let typeT = dictionary["type"] as? String ?? "Unavailable"
//                        let anAlbum = Album(name: "Name:\(nameT)", email: "", UserURL: "", type: "")
                        let anAlbum = Album(name: nameT, email: "", UserURL: "", type: "")
                        albums.append(anAlbum)
                        let anAlbum2 = Album(name: "", email: emailT, UserURL: "", type: "")
                        albums.append(anAlbum2)
                        let anAlbum3 = Album(name: "", email: "", UserURL: htmlurlT, type: "")
                        albums.append(anAlbum3)
                        let anAlbum4 = Album(name: "", email: "", UserURL: "", type: typeT)
                        albums.append(anAlbum4)
                    }
         }
        return albums
    }
}

