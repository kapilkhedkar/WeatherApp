//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import UIKit

class WeatherViewController: BaseViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = AppStyles.getAppColor(color: .bgColor)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            self.view.overrideUserInterfaceStyle = .dark
            
        }
    
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
