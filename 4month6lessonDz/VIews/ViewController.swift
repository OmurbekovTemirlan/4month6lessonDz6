//
//  ViewController.swift
//  4month6lessonDz
//
//  Created by Apple on 29.2.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var details: [DetailWithApp] = []
    var verticalDetails: [SecondScreen] = []
    
    
    private let firstCollectionView: UICollectionView = {
        let layaut = UICollectionViewFlowLayout()
        layaut.itemSize = CGSize(width: UIScreen.main.bounds.width - 45, height: 170)
        layaut.scrollDirection = .horizontal
        layaut.minimumLineSpacing = 25
        layaut.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layaut)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    private let sortByLbl: UILabel = {
        let label = UILabel()
        label.text = "Sort By"
        label.textColor = UIColor(hex: "#E9E3D5")
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mostPopularLbl: UILabel = {
        let label = UILabel()
        label.text = "Most Popular 🔃"
        label.textColor = UIColor(hex: "#E9E3D5")
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let secondCollectionView: UICollectionView = {
        let layaut = UICollectionViewFlowLayout()
        layaut.itemSize = CGSize(width: (UIScreen.main.bounds.width - 65) / 2 , height: 210)
        layaut.scrollDirection = .vertical
        layaut.minimumLineSpacing = 15
        layaut.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layaut)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        titleCompany()
        setupLbls()
    }
    
    private func titleCompany(){
        
        if let navBar = self.navigationController?.navigationBar.topItem {
            navBar.title = "Burger King"
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(hex: "#E9E3D5"),
                                                                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
            
        }
        
    }
    
    
    private func setupUI(){
        view.backgroundColor = UIColor(hex: "033043")
        view.addSubview(firstCollectionView)
        NSLayoutConstraint.activate([
            firstCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            firstCollectionView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
        view.addSubview(secondCollectionView)
        NSLayoutConstraint.activate([
            secondCollectionView.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 40),
            secondCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            
        ])
        
        firstCollectionView.dataSource = self
        firstCollectionView.register(CostumCollectionViewCell.self, forCellWithReuseIdentifier: "Cell1")
        
        secondCollectionView.dataSource = self
        secondCollectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        
    }
    private func setupLbls(){
        
        view.addSubview(sortByLbl)
        NSLayoutConstraint.activate([
            sortByLbl.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 5),
            sortByLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
            
        ])
        view.addSubview(mostPopularLbl)
        NSLayoutConstraint.activate([
            mostPopularLbl.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 5),
            mostPopularLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
        
    }
    
    private func setupData(){
        
        
        details = [DetailWithApp(foodPictures: "burger",
                                 nameFood: "Salad",
                                 numReceipts: "17.292"),
                   DetailWithApp(foodPictures: "BurgerWthCola",
                                 nameFood: "Difucult Garnir",
                                 numReceipts: "20.2354"),
                   DetailWithApp(foodPictures: "ComboChizBurger",
                                 nameFood: "Fast Foods",
                                 numReceipts: "30.231")]
        
        
        
        verticalDetails = [SecondScreen(foodPictures: "food2", nameFood: "3x Combo Fast Foods", numReceipts: "@Omurbekov"),
                           SecondScreen(foodPictures: "food3", nameFood: "Steak with vechtables", numReceipts: "@MsBin"),
                           SecondScreen(foodPictures: "food4", nameFood: "ChizzBurger with free", numReceipts: "@IlonMask"),
                           SecondScreen(foodPictures: "food5", nameFood: "Burger with chikken", numReceipts: "@MirbeekAtabekov"),
                           SecondScreen(foodPictures: "food6", nameFood: "2x combo Burgers", numReceipts: "@MirbeekAtabekov"),
                           SecondScreen(foodPictures: "food7", nameFood: "Gorilla Burgers", numReceipts: "@iDontNow"),
        ]
        
    }
    
    
}
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return details.count
        }else if collectionView == secondCollectionView{
            return verticalDetails.count
        }
         return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! CostumCollectionViewCell
            
            let detail = details[indexPath.row]
            
            cell.setData(setting: detail)
            
            return cell
        }else{
            let verticalCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! SecondCollectionViewCell
            let verticalDate = verticalDetails[indexPath.row]
            verticalCell.setData(setting: verticalDate)
            return verticalCell
        }
        
    }
    
}

