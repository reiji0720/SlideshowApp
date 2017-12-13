//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by れーじ on 2017/12/10.
//  Copyright © 2017年 reijikobayashi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:Int = 0
     let imageArray = ["1.jpg","2.jpg","3.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*if x == 1{
            
            imageview.image = UIImage(named: "1.jpg")
        }
        else if x == 2{
            imageview.image = UIImage(named: "2.jpg")
        }
        else{
            
            imageview.image = UIImage(named: "3.jpg")
        }*/
imageview.image = UIImage(named: imageArray[x])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
