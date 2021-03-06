//
//  FeedViewController.swift
//  Flo_DesignSystem
//
//  Created by Andrei Malyhin on 12/4/18.
//  Copyright © 2018 Andrei Malyhin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()
    
    private let viewModel: FeedViewModel
    private var cellStyleProvider = FeedCardCellStyleProvider()
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        title = "Feed"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 10
        tableView.register(FeedCardCell.self, forCellReuseIdentifier: "FeedCell")
        tableView.tableFooterView = UIView()
        
        let toggleThemeBarButtonItem = UIBarButtonItem(title: "Change Theme", style: .plain, target: self, action: #selector(toggleTheme))
        navigationItem.leftBarButtonItem = toggleThemeBarButtonItem
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func toggleTheme() {
        FuckingSigleton.instance.toggle()
        tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCardCell
        cell.set(feedCard: viewModel.feedCard(forRow: indexPath.row))
        cell.apply(style: cellStyleProvider.default)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
