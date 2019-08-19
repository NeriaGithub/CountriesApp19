//
//  CountyCell.swift
//  CountriesApp19
//
//  Created by Neria Jerafi on 19/08/2019.
//  Copyright © 2019 Neria Jerafi. All rights reserved.
//

import UIKit

class CountyCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var NativeName: UILabel!
    @IBOutlet var Name: UILabel!
    
    func setLabels(county: Country){
        self.Name.text = county.name!
        self.NativeName.text = county.nativeName!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
