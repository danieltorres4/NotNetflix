//
//  TitleTableViewCell.swift
//  NotNetflix
//
//  Created by Iván Sánchez Torres on 01/02/24.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    static let identifier = "TitleTableViewCell"
    
    private let titlePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlePoster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        let titlePosterConstraint = [
            titlePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlePoster.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePoster.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(titlePosterConstraint)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(model.posterURL) else { return }
        titlePoster.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
        
    }
    
}
