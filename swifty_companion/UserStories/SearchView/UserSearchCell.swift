//
//  UserSearchCell.swift
//  swifty_companion
//
//  Created by Heidi Merianne on 8/3/23.
//  Copyright © 2023 Heidi Merianne. All rights reserved.
//

import UIKit

final class UserSearchCell: UITableViewCell {
    
    private lazy var imagePreview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var kindLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.backgroundColor = .orange
        label.layer.cornerRadius = 5
        label.numberOfLines = 1
        
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 4
        stack.backgroundColor = .lightGray
        stack.layer.cornerRadius = 5
        return stack
    }()
    
//    private lazy var cellStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.spacing = 16
//        stack.backgroundColor = .blue
//        stack.layer.cornerRadius = 5
//
//        return stack
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        contentView.addSubview(imagePreview)
        NSLayoutConstraint.activate([
            imagePreview.widthAnchor.constraint(equalToConstant: 90),
            imagePreview.heightAnchor.constraint(equalToConstant: 90),
            
            imagePreview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imagePreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imagePreview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        contentView.addSubview(infoStackView)
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: imagePreview.trailingAnchor, constant: 8),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            infoStackView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
        
        infoStackView.addArrangedSubview(loginLabel)
        infoStackView.addArrangedSubview(fullNameLabel)
        infoStackView.addArrangedSubview(kindLabel)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        loginLabel.text = ""
        fullNameLabel.text = ""
        imagePreview.image = UIImage(systemName: "person")
    }
    
    func configure(with item: UserSearchResult) {
        loginLabel.text = item.login
        fullNameLabel.text = item.usualFullName
        kindLabel.text = item.kind
        imagePreview.image = UIImage(systemName: "person")
    }
}
