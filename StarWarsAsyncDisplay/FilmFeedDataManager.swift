//
//  FilmFeedDataManager.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/24/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

final class FilmFeedDataManager {
    
    fileprivate var _swapiService: SwapiService?
    fileprivate var _searchTerm = "films"
    
    init(swapiService: SwapiService) {
        _swapiService = swapiService
    }
    
    func searchForFilms(completion: @escaping ( _ films: [Film]?, _ error: Error?) -> ()) {
        
        let searchTerm = _searchTerm
        
        _swapiService?.fetchSwapiData(searchTerm: searchTerm, completion: { (results, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let film = results?.flatMap(self.groupItemFromJSONDictionary)
            completion(film, nil)
        })
        
        
    }
    
    
//    _meetupService?.fetchMeetupGroupInLocation(latitude: coordinate!.latitude, longitude: coordinate!.longitude, completion: { (results, error) in
//    guard error == nil else {
//    completion(nil, error)
//    return
//    }
//    
//    let groups = results?.flatMap(self.groupItemFromJSONDictionary)
//    completion(groups, nil)
//    })
    
    //        if let rootDictionary = json as? [String: Any],
    //            let filmsArray = rootDictionary["results"] as? [[String: Any]] {
    //            var starWarsFilms = [Film]()
    //            for film in filmsArray {
    //                if let film = Film(json: film) {
    //                    print("parsed a film: \(film)")
    //                    starWarsFilms.append(film)
    //                }
    //            }
    //
    //            if starWarsFilms.count == 0 {
    //                // Present message of no results
    //            }
    
    //
    
    //    }
    
    
    func groupItemFromJSONDictionary(_ entry: JSONDictionary) -> Film? {
        guard
            let title = entry["title"] as? String,
            let episodeID = entry["episode_id"] as? Int,
            let openingCrawl = entry["opening_crawl"] as? String,
            let characters = entry["characters"] as? [String],
            let releaseDate = Date.date(yyyyMMdd: (entry["release_date"] as? String))
        else {
            return nil
        }
        
        return Film(title: title,
                    episodeID: episodeID,
                    openingCrawl: openingCrawl,
                    characters: characters,
                    releaseDate: releaseDate
        )
    }

}
