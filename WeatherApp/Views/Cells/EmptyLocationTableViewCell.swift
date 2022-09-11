//
//  EmptyLocationTableViewCell.swift
//  WeatherApp
//
//  Created by Kapil Khedkar on 11/09/22.
//

import UIKit

class EmptyLocationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var msgTextLabel: UILabel!
    @IBOutlet weak var getLocationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupUI()
    {
        msgTextLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "empty_location_msg", comment: "")
        getLocationButton.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "get_location_button_text", comment: ""), for: .normal)
        
        msgTextLabel.font = AppStyles.getFontStyle(style: .titleText)
        msgTextLabel.textColor = AppStyles.getAppColor(color: .itemBgColor)
        
        getLocationButton.tintColor = AppStyles.getAppColor(color: .itemFontColor)
        getLocationButton.backgroundColor = AppStyles.getAppColor(color: .itemBgColor)
        getLocationButton.titleLabel?.font = AppStyles.getFontStyle(style: .buttonText)
        getLocationButton.layer.cornerRadius = AppStyles.itemCornerRadius
        getLocationButton.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
