//
//  DateCellCollectionViewCell.swift
//  Boardrooms
//
//  Created by Nourah Almusaad on 22/03/2023.
//

import UIKit

class DateCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var dayName: UILabel!
    
    @IBOutlet var dayNo: UILabel!
    
    func setupCell(day: String , dayNou: String) {
        dayName.text = day
        dayNo.text = dayNou
    }
    
}
