//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 10/09/22.
//

import UIKit
import KSToastView
import CoreLocation

class WeatherViewController: BaseViewController {
    
    @IBOutlet weak var navBarView: UIView!
    @IBOutlet weak var navBarTextLabel: UILabel!
    @IBOutlet weak var languageIcon: UIImageView!
    @IBOutlet weak var themeModeIcon: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //
    private var weatherVM : WeatherViewModel!
    
    var isLocationFound : Bool = false
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        
        getLocation()
        
    }
    
    func getLocation()
    {
        if isLocationPermGranted()
        {
            if CLLocationManager.locationServicesEnabled()
            {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                
            }
            
        }else
        {
            locationManager.requestAlwaysAuthorization()
            
        }
        
    }
    
    private func setupUI()
    {
        if CommonFunctions.getThemeMode() == AppConstants.themeModeLight
        {
            self.view.overrideUserInterfaceStyle = .light
            
        }else
        {
            self.view.overrideUserInterfaceStyle = .dark
            
        }
        
        if CommonFunctions.getLanguage() == AppConstants.languageEnglish
        {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: AppConstants.languageEnglish)
            
        }else
        {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: AppConstants.languageHindi)
            
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.registerCell(type: EmptyLocationTableViewCell.self)
        tableView.registerCell(type: WeatherDetailsTableViewCell.self)
        
        self.view.backgroundColor = AppStyles.getAppColor(color: .bgColor)
        
        navBarTextLabel.font = AppStyles.getFontStyle(style: .navBarText)
        navBarTextLabel.textColor = AppStyles.getAppColor(color: .itemBgColor)
        
        navBarTextLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "navBar_header", comment: "")
        
        let languageIconTGR = UITapGestureRecognizer(target: self, action: #selector(languageIconTapped(tapGestureRecognizer:)))
        languageIcon.isUserInteractionEnabled = true
        languageIcon.addGestureRecognizer(languageIconTGR)
        
        let themeModeIconTGR = UITapGestureRecognizer(target: self, action: #selector(themeModeIconTapped(tapGestureRecognizer:)))
        themeModeIcon.isUserInteractionEnabled = true
        themeModeIcon.addGestureRecognizer(themeModeIconTGR)
        
    }
    
    private func getWeatherData()
    {
        weatherVM = WeatherViewModel()
        
        self.showLoader()
        self.weatherVM.isWeatherDataLoaded = { [weak self] (_, status, failureMsg) in
            self?.hideLoader()
            if status == .success {
                self?.tableView.reloadData()
            } else {
                KSToastView.ks_showToast(failureMsg, duration: 2.0)
            }
        }
        
    }
    
    // MARK: - Clicks
    @objc func languageIconTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let optionMenu = UIAlertController(title: nil, message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "choose_language", comment: ""), preferredStyle: .actionSheet)
        
        let englishAction = UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "english", comment: ""), style: .default, handler: {_ in
            
            CommonFunctions.setLanguage(language: AppConstants.languageEnglish)
            LocalizationSystem.sharedInstance.setLanguage(languageCode: AppConstants.languageEnglish)
            self.setupUI()
            self.tableView.reloadData()
            
        })
        
        let hindiAction = UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "hindi", comment: ""), style: .default, handler: {_ in
            
            CommonFunctions.setLanguage(language: AppConstants.languageHindi)
            LocalizationSystem.sharedInstance.setLanguage(languageCode: AppConstants.languageHindi)
            self.setupUI()
            self.tableView.reloadData()
            
        })
        
        let cancelAction = UIAlertAction(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "cancel", comment: ""), style: .cancel)
        
        optionMenu.addAction(englishAction)
        optionMenu.addAction(hindiAction)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    @objc func themeModeIconTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if CommonFunctions.getThemeMode() == AppConstants.themeModeLight
        {
            //Switch to Dark
            CommonFunctions.setThemeMode(mode: AppConstants.themeModeDark)
            self.view.overrideUserInterfaceStyle = .dark
            
        }else
        {
            //Switch to Light
            CommonFunctions.setThemeMode(mode: AppConstants.themeModeLight)
            self.view.overrideUserInterfaceStyle = .light
            
        }
        
    }
    
    @objc func getLocationButtonTapped(sender: UIButton)
    {
        if Connectivity.isConnectedToInternet
        {
            locationManager.requestAlwaysAuthorization()
            
            if CLLocationManager.locationServicesEnabled()
            {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                
            }
            
            
        }else
        {
            KSToastView.ks_showToast(AppConstants.noInternetMsg, duration: 2.0)
            
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

extension WeatherViewController : CLLocationManagerDelegate
{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location: CLLocation = manager.location else { return }
        fetchCity(from: location) { city, error in
            guard let city = city, error == nil else { return }
            
            CommonFunctions.setCityName(city: city)
            
            self.isLocationFound = true
            self.getWeatherData()
            
        }
        
    }
    
    func fetchCity(from location: CLLocation, completion: @escaping (_ city: String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality,
                       error)
        }
    }
    
    func isLocationPermGranted()->Bool
    {
        let status = CLLocationManager.authorizationStatus()

        switch status {
        case .authorizedAlways:
            
            return true
        case .authorizedWhenInUse:
            
            return true
        case .denied:
            
            return false
        case .notDetermined:
            
            return false
        case .restricted:
            
            return false
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.isLocationFound = false
        KSToastView.ks_showToast("Please grant Location permission from Settings!", duration: 2.0)
        
    }
    
}

extension WeatherViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isLocationFound
        {
            guard let cell = tableView.dequeueCell(withType: WeatherDetailsTableViewCell.self, for: indexPath) as? WeatherDetailsTableViewCell, let weatherData = self.weatherVM.weatherData else {
                
                return UITableViewCell()
            }
            
            cell.setWeatherData(weather: weatherData)
            return cell
            
        }else
        {
            guard let cell = tableView.dequeueCell(withType: EmptyLocationTableViewCell.self, for: indexPath) as? EmptyLocationTableViewCell else {
                
                return UITableViewCell()
            }
            
            cell.setupUI()
            
            cell.getLocationButton.addTarget(self, action: #selector(getLocationButtonTapped(sender:)), for: .touchUpInside)
            
            return cell
            
        }
        
    }
    
}

extension WeatherViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
