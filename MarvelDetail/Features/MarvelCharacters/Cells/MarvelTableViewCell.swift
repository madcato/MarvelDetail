//
//  MarvelTableViewCell.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//
import Alamofire
import AlamofireImage
import UIKit

class MarvelTableViewCell: UITableViewCell {
    static public let kCellId = "MarvelCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setCharacter(_ character: Marvel.CharacterDto) {
        var content = super.defaultContentConfiguration()
        content.text = character.name
        content.secondaryText = character.description
        Alamofire.request(character.thumbnail?.urlString ?? "").responseImage { response in
            if case .success(let image) = response.result {
                content.image = image
                super.contentConfiguration = content
            }
        }
        super.contentConfiguration = content
    }
}
