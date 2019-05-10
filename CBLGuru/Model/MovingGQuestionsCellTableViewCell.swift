//
//  MovingGQuestionsCellTableViewCell.swift
//  CBLplanner
//
//  Created by Luma Gabino Vasconcelos on 23/04/19.
//  Copyright © 2019 Ignácio Espinoso Ribeiro. All rights reserved.
//

import UIKit

class MovingGQuestionsCell: UITableViewCell {


    @IBOutlet weak var guidingQuestion: UILabel!
    @IBOutlet weak var guidingResource: UILabel!
    @IBOutlet weak var guidingActivity: UILabel!
    
    @IBOutlet var guidingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onClick(){
        guidingConstraint.constant = guidingConstraint.constant == CGFloat(9.0) ? CGFloat(-40.0) : CGFloat(9.0)
    }

}
