//
//  FilmFeedViewController.swift
//  StarWarsAsyncDisplay
//
//  Created by Chris Kong on 2/24/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import AsyncDisplayKit

class FilmFeedViewController: ASViewController<ASTableNode>, FilmFeedInteractorOutput {

    var handler: FilmFeedInteractorInput?
    var _activityIndicatorView: UIActivityIndicatorView!
    var _dataProvider: FilmFeedTableDataProvider!
    var _tableNode: ASTableNode
    
    init() {
        _tableNode = ASTableNode()
        super.init(node: _tableNode)
        setInitialState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        _activityIndicatorView.hidesWhenStopped = true
        _activityIndicatorView.sizeToFit()
        
        var refreshRect = _activityIndicatorView.frame
        refreshRect.origin = CGPoint(
            x: (view.bounds.size.width - _activityIndicatorView.frame.width) / 2.0,
            y: _activityIndicatorView.frame.midY)
        
        _activityIndicatorView.frame = refreshRect
        view.addSubview(_activityIndicatorView)
        
        _tableNode.view.allowsSelection = false
        _tableNode.view.separatorStyle = UITableViewCellSeparatorStyle.none
        
        _activityIndicatorView.startAnimating()
        handler?.findFilms()
    }
    
    func foundFilmItems(_ films: [Film]?, error: Error?) {
        guard error == nil else { return }
        
        _dataProvider.insertNewFilmsInTableView(films!)
        _activityIndicatorView.stopAnimating()
    }
    
    func setInitialState() {
        title = "Star Wars"
        
        _dataProvider = FilmFeedTableDataProvider()
        _dataProvider._tableNode = _tableNode
        _tableNode.dataSource = _dataProvider
    }
    
}
