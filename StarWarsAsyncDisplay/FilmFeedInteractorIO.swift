//
//  FilmFeedInteractorIO.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/24/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

protocol FilmFeedInteractorInput {
    func findFilms()
}

protocol FilmFeedInteractorOutput {
    func foundFilmItems(_ films: [Film]?, error: Error?)
}
