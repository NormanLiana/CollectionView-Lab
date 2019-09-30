//
//  DetailCountryViewController.swift
//  Collection-View-Lab
//
//  Created by Liana Norman on 9/28/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class DetailCountryViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var imageOultet: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    // MARK: Properties
    var country: Country!
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        loadImage()
    }
    
    // MARK: Private Methods
    private func setUpViews() {
        view.backgroundColor = .orange
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        populationLabel.text = country.population?.description
    }
    
    private func loadImage() {
        if let unwrappedCountryCode = country.alpha2Code {
            ImageManager.shared.getImage(countryCode: unwrappedCountryCode) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let imageFromOnline):
                        self.imageOultet.image = imageFromOnline
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
