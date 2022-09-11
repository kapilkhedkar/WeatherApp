//
//  WeatherDetailsTableViewCell.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import UIKit
import SDWebImage

class WeatherDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var subtitleTextLabel: UILabel!
    
    @IBOutlet weak var weatherCardView: UIView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var factorsCardView: UIView!
    @IBOutlet weak var windSpeedTextLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    @IBOutlet weak var visibilityTextLabel: UILabel!
    @IBOutlet weak var visibilityValueLabel: UILabel!
    @IBOutlet weak var precipitationTextLabel: UILabel!
    @IBOutlet weak var precipitationValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }
    
    func setupUI()
    {
        titleTextLabel.font = AppStyles.getFontStyle(style: .titleText)
        titleTextLabel.textColor = AppStyles.getAppColor(color: .itemBgColor)
        
        subtitleTextLabel.font = AppStyles.getFontStyle(style: .subtitleText)
        subtitleTextLabel.textColor = AppStyles.getAppColor(color: .itemBgColor)
        
        weatherCardView.layer.cornerRadius = AppStyles.itemCornerRadius
        weatherCardView.layer.masksToBounds = true
        weatherCardView.backgroundColor = AppStyles.getAppColor(color: .itemBgColor)
        weatherCardView.layer.shadowColor = AppStyles.getAppColor(color: .itemShadowColor).cgColor
        weatherCardView.layer.shadowOpacity = AppStyles.itemShadowOpacity
        weatherCardView.layer.shadowOffset = AppStyles.itemShadowOffset
        weatherCardView.layer.shadowRadius = AppStyles.itemShadowRadius
        
        weatherIcon.layer.cornerRadius = 30.0
        weatherIcon.layer.masksToBounds = true
        
        temperatureLabel.font = AppStyles.getFontStyle(style: .blowedUpText)
        temperatureLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        weatherDescriptionLabel.font = AppStyles.getFontStyle(style: .bodyTitleText)
        weatherDescriptionLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        factorsCardView.layer.cornerRadius = AppStyles.itemCornerRadius
        factorsCardView.layer.masksToBounds = true
        factorsCardView.backgroundColor = AppStyles.getAppColor(color: .itemBgColor)
        factorsCardView.layer.shadowColor = AppStyles.getAppColor(color: .itemShadowColor).cgColor
        factorsCardView.layer.shadowOpacity = AppStyles.itemShadowOpacity
        factorsCardView.layer.shadowOffset = AppStyles.itemShadowOffset
        factorsCardView.layer.shadowRadius = AppStyles.itemShadowRadius
        
        windSpeedTextLabel.font = AppStyles.getFontStyle(style: .bodySubtitleText)
        windSpeedTextLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        windSpeedValueLabel.font = AppStyles.getFontStyle(style: .bodyTitleText)
        windSpeedValueLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        visibilityTextLabel.font = AppStyles.getFontStyle(style: .bodySubtitleText)
        visibilityTextLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        visibilityValueLabel.font = AppStyles.getFontStyle(style: .bodyTitleText)
        visibilityValueLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        precipitationTextLabel.font = AppStyles.getFontStyle(style: .bodySubtitleText)
        precipitationTextLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
        precipitationValueLabel.font = AppStyles.getFontStyle(style: .bodyTitleText)
        precipitationValueLabel.textColor = AppStyles.getAppColor(color: .itemFontColor)
        
    }
    
    func setWeatherData(weather: WeatherResponse)
    {
        titleTextLabel.text = weather.cityName
        subtitleTextLabel.text = "("+LocalizationSystem.sharedInstance.localizedStringForKey(key: "observation_time", comment: "")+": \(weather.observationTime ?? ""))"
        
        if let url = URL(string: weather.weatherIcon ?? "") {
            weatherIcon.sd_setImage(with: url, completed: nil)
        }
        
        
        weatherDescriptionLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: weather.weatherDescription ?? "", comment: "")
        
        temperatureLabel.text = "\(weather.temperature ?? 0)°C"
        
        windSpeedTextLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "wind_speed", comment: "")
        windSpeedValueLabel.text = "\(weather.windSpeed ?? 0) m/h"
        
        visibilityTextLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "visibility", comment: "")
        visibilityValueLabel.text = "\(weather.visibility ?? 0) m"
        
        precipitationTextLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "precipitation", comment: "")
        precipitationValueLabel.text = "\(weather.precipitation ?? 0) mm"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
