//
//  MarvelCharacterDetailVC.swift
//  MarvelDetail
//
//  Created by Daniel Vela on 14/4/21.
//

import UIKit
import WebKit

class MarvelCharacterDetailVC: UIViewController {
    static let segueId = "detail"
    var character: Marvel.CharacterDto!

    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: character.detailURL()) else {
            fatalError("Invalid URL")
        }
        webView.load(URLRequest(url: url))
    }

}
