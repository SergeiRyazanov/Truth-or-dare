//
//  CellStartView.swift
//  TruthOrDare
//
//  Created by Сергей Рязанов on 6/20/26.
//

import UIKit

final class CellStartView: UITableViewCell {

    static var reuseID = "CellStartView"
    
    var emojiInsideCell: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 30)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    var textInsideCell: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = UIColor(named: "MainTextColor")
        $0.font = .systemFont(ofSize: 18)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    var cellColor: UIView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(named: "CellColor")
        return $0
    }(UIView())
    
    var checkMark: UIImageView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = UIColor(named: "CellColor")
        $0.image = UIImage(systemName: "checkmark.circle.fill")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private var selectionOverlayView: UIView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.orange.withAlphaComponent(0.07) // прозрачность 10%
        $0.layer.cornerRadius = 15
        $0.isHidden = true
        
        $0.layer.borderColor = UIColor(named: "OrangeColor")?.cgColor
        $0.layer.borderWidth = 2

        // "свечение"
        $0.layer.shadowColor = UIColor(named: "OrangeColor")?.cgColor
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowRadius = 20
        $0.layer.shadowOffset = .zero

        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupCell()
        setupConstraints()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        selectionOverlayView.isHidden = !selected

        if selected {
            checkMark.tintColor = UIColor(named: "OrangeColor")
        } else {
            checkMark.tintColor = UIColor(named: "CellColor")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        
        contentView.addSubview(cellColor)
        contentView.addSubview(selectionOverlayView) // 👈 поверх cellColor
        contentView.addSubview(emojiInsideCell)
        contentView.addSubview(textInsideCell)
        contentView.addSubview(checkMark)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
     func config(post: AgeOption) {
        
        emojiInsideCell.text = post.emoji
        textInsideCell.text = post.age
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalToConstant: 65),
            
            cellColor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: 0),
            cellColor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: 0),
            cellColor.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 5),
            cellColor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -5),
            
            emojiInsideCell.centerYAnchor.constraint(equalTo: cellColor.centerYAnchor),
            emojiInsideCell.leadingAnchor.constraint(equalTo: cellColor.leadingAnchor,
                                                     constant: 15),
            emojiInsideCell.widthAnchor.constraint(equalToConstant: 40),
            emojiInsideCell.heightAnchor.constraint(equalToConstant: 40),
            
            textInsideCell.centerYAnchor.constraint(equalTo: emojiInsideCell.centerYAnchor),
            textInsideCell.leadingAnchor.constraint(equalTo: emojiInsideCell.trailingAnchor,
                                                    constant: 15),
            textInsideCell.trailingAnchor.constraint(equalTo: checkMark.leadingAnchor,
                                                     constant: -15),
            
            checkMark.centerYAnchor.constraint(equalTo: cellColor.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: cellColor.trailingAnchor,
                                                constant: -15),
            checkMark.widthAnchor.constraint(equalToConstant: 30),
            checkMark.heightAnchor.constraint(equalToConstant: 30),
            
            selectionOverlayView.leadingAnchor.constraint(equalTo: cellColor.leadingAnchor),
            selectionOverlayView.trailingAnchor.constraint(equalTo: cellColor.trailingAnchor),
            selectionOverlayView.topAnchor.constraint(equalTo: cellColor.topAnchor),
            selectionOverlayView.bottomAnchor.constraint(equalTo: cellColor.bottomAnchor),
        ])
    }
}
