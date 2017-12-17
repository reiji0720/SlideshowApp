//
//  ViewController.swift
//  SlideshowApp
//
//  Created by れーじ on 2017/12/10.
//  Copyright © 2017年 reijikobayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let imageArray = ["1.jpg","2.jpg","3.jpg"]
    
    @IBOutlet weak var buttonimg: UIButton!
    
    var changeimage:UIImage!
    
    
    var nownumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初期画像を1に設定
        changeimage = UIImage(named:imageArray[nownumber])
        buttonimg.setImage(changeimage, for: UIControlState())
        
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
        resultViewController.x = nownumber //defaultimg
        
    }
    //戻るボタンのかえり
    @IBAction func okaeri(_ segue: UIStoryboardSegue){
        
    }
    //進む処理
    @IBAction func nextaction(_ sender: Any) {
        if nownumber < imageArray.count-1{
            nownumber += 1
            changeimage = UIImage(named:imageArray[nownumber])
            buttonimg.setImage(changeimage, for: UIControlState())
        }
        else{
            nownumber = 0
            changeimage = UIImage(named:imageArray[nownumber])
            buttonimg.setImage(changeimage, for: UIControlState())
        }
    }
    //戻る処理
    @IBAction func backaction(_ sender: Any) {
        if nownumber > 0{
            nownumber -= 1
            changeimage = UIImage(named:imageArray[nownumber])
            buttonimg.setImage(changeimage, for: UIControlState())
        }
        else{
            nownumber = imageArray.count-1
            changeimage = UIImage(named:imageArray[nownumber])
            buttonimg.setImage(changeimage, for: UIControlState())
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

