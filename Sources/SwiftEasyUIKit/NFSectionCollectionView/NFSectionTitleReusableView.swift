//
//  NFSectionTitleReusableView.swift
//  ticket-uire
//
//  Created by 大場史温 on 2025/09/02.
//

import UIKit

class NFSectionTitleReusableView: UICollectionReusableView {
    static let identifier = "NFSectionTitleReusableView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        configureConstraints()
    }

    private func configureConstraints() {
        let titleLabelConstraints = [
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(nfSectionTitle: String) {
        titleLabel.text = nfSectionTitle
    }
}
