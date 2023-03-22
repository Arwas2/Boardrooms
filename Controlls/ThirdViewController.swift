//
//  ThirdViewController.swift
//  Boardrooms
//
//  Created by Nourah Almusaad on 22/03/2023.
//

import UIKit

class ThirdViewController: UIViewController,
                               UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        var arrDates = [Date]()
        
        
        @IBOutlet var collectionView: UICollectionView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.setHidesBackButton(true, animated: false)
            collectionView.delegate = self
            collectionView.dataSource = self
//            collectionView.selectItem(at: NSIndexPath(item: 0, sectionitemsectionitemsectionitemsectionitemsectionitemsectionitemsection: 0) as IndexPath, animated: false, scrollPosition: .None)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            arrDates.append(Date(dayName: "Thu", dayNo: "16"))
            arrDates.append(Date(dayName: "Sun", dayNo: "19"))
            arrDates.append(Date(dayName: "Wed", dayNo: "20"))
            arrDates.append(Date(dayName: "Thr", dayNo:"21"))
            arrDates.append(Date(dayName: "Wed", dayNo: "22"))
            arrDates.append(Date(dayName: "Thr", dayNo: "23"))
            arrDates.append(Date(dayName: "Sun", dayNo: "26"))
            arrDates.append(Date(dayName: "Mon", dayNo: "27"))
            arrDates.append(Date(dayName: "Tue", dayNo: "28"))
            collectionView.reloadData()
           
        }
        
             func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                 return  arrDates.count
             }
             
             func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "datcell", for: indexPath) as! DateCellCollectionViewCell

                 let dates = arrDates[indexPath.row]

                 cell.setupCell(day: dates.dayName, dayNou: dates.dayNo )

                 return cell
             }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.88
        }
        func createLayout() -> UICollectionViewLayout {
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.333), heightDimension: .fractionalHeight(1)))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
           section.orthogonalScrollingBehavior = .continuous
            
            return UICollectionViewCompositionalLayout(section: section)
        }

        
    }
    struct Date {
        let dayName : String
        let dayNo : String
    }
