//
//  SecondCollectionViewCell.swift
//  4month6lessonDz
//
//  Created by Apple on 1.3.2024.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
        private let verticalImage: UIImageView = {
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
            label.font = .boldSystemFont(ofSize: 16)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let receiptsLbl: UILabel = {
            let label = UILabel()
            label.text = ""
            label.textColor = .white
            label.font = .systemFont(ofSize: 13, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            SetupHorizontalView()
            
        }
        
        private func SetupHorizontalView(){
            
            verticalImage.layer.cornerRadius = 20
            verticalImage.layer.masksToBounds = true
            contentView.addSubview(verticalImage)
            NSLayoutConstraint.activate([
                verticalImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
                verticalImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
                verticalImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
                verticalImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
            
            contentView.addSubview(nameFoodHorLbl)
            NSLayoutConstraint.activate([
                nameFoodHorLbl.bottomAnchor.constraint(equalTo: verticalImage.bottomAnchor, constant: -25),
                nameFoodHorLbl.leadingAnchor.constraint(equalTo: verticalImage.leadingAnchor, constant: 10),
                nameFoodHorLbl.trailingAnchor.constraint(equalTo: verticalImage.trailingAnchor, constant: -10),
            ])
            contentView.addSubview(receiptsLbl)
            NSLayoutConstraint.activate([
                receiptsLbl.bottomAnchor.constraint(equalTo: verticalImage.bottomAnchor, constant: -8),
                receiptsLbl.leadingAnchor.constraint(equalTo: verticalImage.leadingAnchor, constant: 10)
            ])
            
        }
        
       
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
         func setData(setting data: SecondScreen ){
             verticalImage.image = UIImage(named: data.foodPictures)
            nameFoodHorLbl.text = data.nameFood
            receiptsLbl.text = data.numReceipts
        }
}
