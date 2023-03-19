//
//  HomeCollectionViewCell.swift
//  AccentureIOS
//
//  Created by Timotius Leonardo Lianoto on 19/03/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var subtitleView: UILabel = {
        let label: UILabel = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var progStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleView, subtitleView])
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        [progStackView].forEach { subview in
            contentView.addSubview(subview)
        }
        let collectionViewContraints = [
            progStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            progStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ]
        NSLayoutConstraint.activate(collectionViewContraints)
        
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 8
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
}
