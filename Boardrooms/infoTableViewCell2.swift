
//  infoTableViewCell2.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 28/08/1444 AH.


import UIKit

class infoTableViewCell2: UITableViewCell {


    @IBOutlet weak var imgBoardRoom: UIImageView!
    
    @IBOutlet weak var BordRoomName: UILabel!
    
    @IBOutlet weak var floorNumb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
