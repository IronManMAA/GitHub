//
//  APIController.swift
//  GitHub
//
//  Created by Marco Almeida on 12/8/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
    func didReceiveAPIResults(_ dictionary: [String: Any])
}


class APIController
{
    var delegate: APIControllerProtocol
    init(delegate: APIControllerProtocol)
    {
        self.delegate = delegate
    }
    // Number 2 step  *****************************************
    
    
    func searchItuneFor(_ ironyardMember: String)
    {
        let iTunesSearchTerm = ironyardMember.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.caseInsensitive, range: nil)
        // format search term as required by the API ... empty spaces must be represented by + sign
        if let escapedSearchTerm = iTunesSearchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
            // convert all unfriendly Web URL characters to their Friendly corresponding format
        {
//            let urlPath = "https://itunes.apple.com/search?term=\(escapedSearchTerm)&media=music&entity=album"
//            https://api.github.com/users/\(escapedSearchTerm)
            let urlPath = "https://api.github.com/users/\(escapedSearchTerm)"
//              let urlPath = "https://api.github.com/users/IronManMAA"
            let url = URL(string: urlPath)!
            // convert the urlPath string into a URL
            let session = URLSession.shared
            // session information returned by apple
            let task = session.dataTask(with: url, completionHandler: {
                data, response, error in
//                print("Task Completed")
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else if let dictionary = self.parseJSON(data!)
                {
 //                   if let results = dictionary["results"] as? [Any]
 //                   {
                        self.delegate.didReceiveAPIResults(dictionary)   // Number 4 step  *****************************************
//                        // need to create a delegate. ( see a top of this page protocal that was created
//                print("Task Completed up to here")
//                    }
                }
            })
            task.resume()
//            print("Search fired off")

            // fire off the above search query
        }
    } // end of searchItunesFor
    
    
    func parseJSON(_ datavals: Data) -> [String: Any]?
        // Data type is a bukect of data in the a binary format
    {
        do
        {
            let json = try JSONSerialization.jsonObject(with: datavals, options:[] )
            // convert the binary Data into readable format
            if let dictionary = json as? [String: Any]
            {
                return dictionary
            }
            else   // if nothing is returned
            {
                return nil
            }
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
    // to catch an error, include in a DO block, enter the word TRY and include the catch block as above
}  // end of Class
