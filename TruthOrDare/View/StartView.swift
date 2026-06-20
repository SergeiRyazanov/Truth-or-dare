//
//  ViewController.swift
//  TruthOrDare
//
//  Created by Сергей Рязанов on 6/18/26.
//

import UIKit

final class StartView: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(chooseAgeLabel)
        view.addSubview(chooseAgeDescriptionLabel)
        view.addSubview(table)
        view.addSubview(confirmView)
        confirmView.addSubview(confirmButton)
        view.addSubview(warningMSG)
        setupConstraints()
    }
    
    private let warningMSG: UILabel = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textAlignment = .center
        $0.textColor = UIColor(named: "BackgroundColor")
        return $0
    }(UILabel())
    
    private let chooseAgeLabel: UILabel = {
        
        $0.text = "Выбери возраст игроков"
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        $0.textColor = UIColor(named: "MainTextColor")
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let chooseAgeDescriptionLabel: UILabel = {
        
        $0.text = "Мы подберем задания, которые подходят для вашей компании"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        $0.textColor = UIColor(named: "AddTextColor")
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let confirmButton: UIButton = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Продолжить", for: .normal)
        $0.tintColor = UIColor(named: "MainTextColor")
        $0.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return $0
    }(UIButton())
    
    private let confirmView: GradientView = {
        
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.cornerRadius = 15
        $0.colors = [
            UIColor(named: "AccentGradientStart") ?? .blue,
            UIColor(named: "AccentGradientEnd") ?? .purple
        ]
        $0.startPoint = CGPoint(x: 0, y: 0.5)
        $0.endPoint = CGPoint(x: 1, y: 0.5)
        return $0
    }(GradientView())
    
    private let table = TableStartView()
    
    @objc func nextPage() {

        guard let selectedIndexPath = table.indexPathForSelectedRow else {

            warningMSG.text = "Хмм, я не знаю ваш возраст 🤔"
            warningMSG.textColor = UIColor(named: "AddTextColor")
            return
        }

//        print(table.dataCellStartView[selectedIndexPath.row].age)

        let vc = MainVew()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            chooseAgeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: 16),
            chooseAgeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: 35),
            chooseAgeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: -35),
            
            
            chooseAgeDescriptionLabel.topAnchor.constraint(equalTo: chooseAgeLabel.bottomAnchor,
                                                           constant: 30),
            chooseAgeDescriptionLabel.leadingAnchor.constraint(equalTo: chooseAgeLabel.leadingAnchor),
            chooseAgeDescriptionLabel.trailingAnchor.constraint(equalTo: chooseAgeLabel.trailingAnchor),
            
            
            table.topAnchor.constraint(equalTo: chooseAgeDescriptionLabel.bottomAnchor,
                                       constant: 40),
            table.bottomAnchor.constraint(equalTo: confirmView.topAnchor,
                                          constant: -20),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                           constant: 20),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                            constant: -20),
            
            
            confirmView.heightAnchor.constraint(equalToConstant: 65),
            confirmView.leadingAnchor.constraint(equalTo: table.leadingAnchor),
            confirmView.trailingAnchor.constraint(equalTo: table.trailingAnchor),
            confirmView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                               constant: -50),
            
            
            confirmButton.leadingAnchor.constraint(equalTo: confirmView.leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: confirmView.trailingAnchor),
            confirmButton.centerYAnchor.constraint(equalTo: confirmView.centerYAnchor),
            
            warningMSG.bottomAnchor.constraint(equalTo: confirmView.topAnchor,
                                               constant: -40),
            warningMSG.centerXAnchor.constraint(equalTo: table.centerXAnchor)
        ])
    }
}

