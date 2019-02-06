//
//  ViewController.swift
//  Json_Parsing_With_ForLoop_Api_Simple
//
//  Created by DeEp KapaDia on 01/02/19.
//  Copyright © 2019 DeEp KapaDia. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    

    var ArrData = [Articles_Model]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        jsonParsing()
    
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    func jsonParsing(){
        let url = URL(string: "https://api.randomuser.me/")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do{
                let json = try JSON(data:data)
                let results = json["results"]
                for arr in results.arrayValue{
                    self.ArrData.append(Articles_Model(json: arr))
                    print(self.ArrData)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return ArrData.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustCell

        cell.id.text = ArrData[indexPath.row].location
        cell.id1.text = ArrData[indexPath.row].location1
        //cell.id1.text = ArrData[indexPath.row].email
        return cell
    }

    
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

