//
//  FilmFeedTableDataProvider.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 3/1/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FilmFeedTableDataProvider: NSObject, ASTableDataSource {

    var _films: [Film]?
    weak var _tableNode: ASTableNode?
    
    // MARK: Table Data Source
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return _films?.count ?? 0
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let film = _films![indexPath.row]
        let cellNodeBlock = { () -> ASCellNode in
            return FilmCellNode(film: film)
        }
        return cellNodeBlock
    }
    
    // MARK: Helper
    
    func insertNewFilmsInTableView(_ films: [Film]) {
        _films = films
        
        let section = 0
        var indexPaths = [IndexPath]()
        films.enumerated().forEach { (row, group) in
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        _tableNode?.insertRows(at: indexPaths, with: .none)
    }
}
