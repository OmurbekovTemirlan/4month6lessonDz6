//
//  CollectionViewCell.swift
//  4month6lessonDz
//
//  Created by Apple on 29.2.2024.
//

import UIKit

class CostumCollectionViewCell: UICollectionViewCell {
    
    private let horizontalImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameFoodHorLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold )
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let receiptsLbl: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        SetupHorizontalView()
        
    }
    
    private func SetupHorizontalView(){
        
        horizontalImage.layer.cornerRadius = 25
        horizontalImage.layer.masksToBounds = true
        contentView.addSubview(horizontalImage)
        NSLayoutConstraint.activate([
            horizontalImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            horizontalImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            horizontalImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            horizontalImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
        
        contentView.addSubview(nameFoodHorLbl)
        NSLayoutConstraint.activate([
            nameFoodHorLbl.bottomAnchor.constraint(equalTo: horizontalImage.bottomAnchor, constant: -40),
            nameFoodHorLbl.leadingAnchor.constraint(equalTo: horizontalImage.leadingAnchor, constant: 10),
            nameFoodHorLbl.trailingAnchor.constraint(equalTo: horizontalImage.trailingAnchor, constant: -10),
        ])
        contentView.addSubview(receiptsLbl)
        NSLayoutConstraint.activate([
            receiptsLbl.bottomAnchor.constraint(equalTo: horizontalImage.bottomAnchor, constant: -15),
            receiptsLbl.leadingAnchor.constraint(equalTo: horizontalImage.leadingAnchor, constant: 10)
        ])
        
    }
    
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func setData(setting data: DetailWithApp ){
        horizontalImage.image = UIImage(named: data.foodPictures)
        nameFoodHorLbl.text = data.nameFood
        receiptsLbl.text = data.numReceipts
    }
  
}
