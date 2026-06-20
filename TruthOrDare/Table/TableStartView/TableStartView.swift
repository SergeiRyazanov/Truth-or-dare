//
//  TableStartView.swift
//  TruthOrDare
//
//  Created by Сергей Рязанов on 6/20/26.
//

import UIKit

final class TableStartView: UITableView {
    
    lazy var dataCellStartView = [
        
        AgeOption(emoji: "🙂", age: "12-15 лет"),
        AgeOption(emoji: "😎", age: "15-18 лет"),
        AgeOption(emoji: "🔥", age: "19-24 года"),
        AgeOption(emoji: "😈", age: "25+ лет")
    ]
    
    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: frame, style: style)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        dataSource = self
        delegate = self
        
        register(CellStartView.self, forCellReuseIdentifier: CellStartView.reuseID)
        
        backgroundColor = .clear
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableStartView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellStartView.reuseID, for: indexPath)
        as! CellStartView
        
        let cellStartView = dataCellStartView[indexPath.row]
        cell.config(post: cellStartView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        dataCellStartView.count
    }
}

extension TableStartView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dataCellStartView[indexPath.row].age)
    }
}
