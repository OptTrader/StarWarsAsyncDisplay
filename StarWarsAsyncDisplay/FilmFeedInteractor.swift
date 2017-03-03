//
//  FilmFeedInteractor.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 3/1/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

final class FilmFeedInteractor: FilmFeedInteractorInput {
    var dataManager: FilmFeedDataManager?
    var output: FilmFeedInteractorOutput?
    
    func findFilms() {
        dataManager?.searchForFilms(completion: output!.foundFilmItems)
    }
}
