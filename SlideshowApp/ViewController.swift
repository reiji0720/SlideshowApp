//
//  ViewController.swift
//  SlideshowApp
//
//  Created by れーじ on 2017/12/10.
//  Copyright © 2017年 reijikobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let image1:UIImage = UIImage(named:"1.jpg")!
    let image2:UIImage = UIImage(named:"2.jpg")!
    let image3:UIImage = UIImage(named:"3.jpg")!
    
    @IBOutlet weak var buttonimg: UIButton!
    var defaultimg:Int = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初期画像を1に設定
        buttonimg.setImage(image1, for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //画像詳細画面へ遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているxに値を代入して渡す
        resultViewController.x = defaultimg
        
    }
    //戻るボタンのかえり
    @IBAction func okaeri(_ segue: UIStoryboardSegue){
        
    }
    //進む処理
    @IBAction func nextaction(_ sender: Any) {
        print ("0")
        if defaultimg == 1{
            print ("1")
            buttonimg.setImage(image2, for: UIControlState())
            defaultimg += 1
        }
        else if defaultimg == 2{
            print ("2")
            buttonimg.setImage(image3, for: UIControlState())
            defaultimg += 1
        }
        else if defaultimg == 3{
            print ("3")
            buttonimg.setImage(image1, for: UIControlState())
            defaultimg = 1
        }
    }
    //戻る処理
    @IBAction func backaction(_ sender: Any) {
        if defaultimg == 1{
            buttonimg.setImage(image3, for: UIControlState())
            defaultimg = 3
        }
        else if defaultimg == 2{
            buttonimg.setImage(image1, for: UIControlState())
            defaultimg -= 1
        }
        else if defaultimg == 3{
            buttonimg.setImage(image2, for: UIControlState())
            defaultimg -= 1
        }
    }
    var timer: Timer!
    var onoff = false
    //再生停止
    
    
    @IBOutlet weak var next_b: UIButton!
    @IBOutlet weak var back_b: UIButton!
    
    @IBOutlet weak var play: UIButton!
    @IBAction func playaction(_ sender: Any) {
        if onoff == false{
            //再生処理
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextaction), userInfo: nil, repeats: true)
            onoff = true
            play.setTitle("停止", for: .normal)
            next_b.isEnabled = false
            back_b.isEnabled = false
        }else{
            //停止処理
            self.timer.invalidate()
            onoff = false
            play.setTitle("再生", for: .normal)
            next_b.isEnabled = true
            back_b.isEnabled = true
        }
    }




}

