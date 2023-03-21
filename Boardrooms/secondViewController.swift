//
//  secondViewController.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 23/08/1444 AH.
//

import Foundation
import UIKit

class secondViewController:UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
    @IBOutlet weak var BOARDNAME: UILabel!
    @IBOutlet weak var FLOOR: UILabel!
    @IBOutlet weak var BokingDate: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var boardrooms : [Boardroom] = [Boardroom]()
    
    @IBOutlet weak var number: UILabel!
    let cellId = "BoardroominfoCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        image.layer.cornerRadius = 25
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        tableView.delegate = self
        tableView.dataSource = self
        getboardrooms()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getboardrooms()
    }
        
    

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "BoardroominfoCell", for: indexPath) as! TableViewCell


    let boardroomsItem = boardrooms[indexPath.row]
    print(boardroomsItem.name)
    cell.BordRoomName.text = boardroomsItem.name
    cell.floorNumb.text = "\(boardroomsItem.floorNo)"
    
    if let url = URL(string: boardroomsItem.imageURL){
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url) {
                cell.imgBoardRoom.image = UIImage(data: data)
            }
        }
    }
    return cell
}
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 110
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return boardrooms.count
   }
   
    func getboardrooms(){
        
        if let url = URL(string: "https://0a41c646-1e60-44d1-ad87-0ccd77cf9fad.mock.pstmn.io/boardrooms/") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let res = try JSONDecoder().decode([Boardroom].self, from: data)
                      self.boardrooms = res
                      DispatchQueue.main.async {
                          self.tableView.reloadData()
                      }
                      //self.boardrooms?.append(res)
                      print(res)
                  } catch let error {
                     print("error\(error)")
                  }
               }
           }.resume()
        }
    }
}


