//
//  ViewController.swift
//  Boardrooms
//
//  Created by ARWA ALSALEM on 21/08/1444 AH.
//

import UIKit

class ViewController:

    UIViewController {
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var field2: UITextField!
    var emlpoye : [Employee]?
//    var employes : [Employees]?
    //    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        field.returnKeyType = .done
        field.autocapitalizationType = .words
        field.autocorrectionType = .no
        field.becomeFirstResponder()
        getData()
    }
    
    
    
    @IBAction func buttonTapped() {
        // do stuff
        let employName = field.text
        let employPassword = field2.text

        field.resignFirstResponder()
        guard let emlpoye = emlpoye else { return }
        for i in emlpoye {
            if i.name == employName && i.password == employPassword {
                
                getBookingsData(ID: i.id)
                performSegue(withIdentifier: "goToHome", sender: nil)
            }
        }
            // renmirated for loop
        

        
        
    }
    
    func getData(){
        
        if let url = URL(string: "https://0a41c646-1e60-44d1-ad87-0ccd77cf9fad.mock.pstmn.io/employees/") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let res = try JSONDecoder().decode([Employee].self, from: data)
                      self.emlpoye = res
                      //self.employes?.append(res)
                      print(res)
                  } catch let error {
                     print("error\(error)")
                  }
               }
           }.resume()
        }
    }
    
    func getBookingsData(ID:Int){
        
        var urlComponents = URLComponents(string: "https://ac2b02b3-cede-4dfd-90df-aa78f688cb6e.mock.pstmn.io/bookings/employee/")
            
            let queryItems = [URLQueryItem(name: "empID", value: "\(ID)")]

        urlComponents?.queryItems = queryItems

        if let url = urlComponents?.url{
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                         let res = try JSONDecoder().decode(BookingElement.self, from: data)
                        
                        print(res[1])
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}
