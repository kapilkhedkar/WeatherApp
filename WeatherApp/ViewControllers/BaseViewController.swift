//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import UIKit
import RappleProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    func showLoader()
    {
        RappleActivityIndicatorView.startAnimating()
        
    }
    
    func hideLoader()
    {
        RappleActivityIndicatorView.stopAnimation()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
