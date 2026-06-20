//
//  GradientView.swift
//  TruthOrDare
//
//  Created by Сергей Рязанов on 6/20/26.
//

import UIKit

final class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()

    var colors: [UIColor] = [] {
        
        didSet { updateColors() }
    }

    var startPoint: CGPoint = CGPoint(x: 0, y: 0.5) {
        
        didSet { gradientLayer.startPoint = startPoint }
    }

    var endPoint: CGPoint = CGPoint(x: 1, y: 0.5) {
        
        didSet { gradientLayer.endPoint = endPoint }
    }

    var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
            gradientLayer.cornerRadius = cornerRadius
        }
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        
        layer.insertSublayer(gradientLayer, at: 0)
    }

    private func updateColors() {
        
        gradientLayer.colors = colors.map { $0.cgColor }
    }

    override func layoutSubviews() {
        
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
