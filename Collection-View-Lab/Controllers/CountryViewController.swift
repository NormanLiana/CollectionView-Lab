//
//  CountryViewController.swift
//  Collection-View-Lab
//
//  Created by Liana Norman on 9/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var collectionViewOutlet: UICollectionView!

    // MARK: Properties
    var countries = [Country]() {
        didSet {
            collectionViewOutlet.reloadData()
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        loadData()
    }
    
    // MARK: Private Methods
    private func loadData() {
        CountryAPIManager.shared.getCountries { (result) in
            switch result {
            case .success(let countriesFromOnline):
                self.countries = countriesFromOnline
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

// MARK: Extensions
extension CountryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCollectionViewCell {
            let country = countries[indexPath.row]
            cell.backgroundColor = .green
            cell.countryNameOutlet.text = country.name
            cell.countryCapitalOutlet.text = country.capital
            cell.countryPopulationOutlet.text = country.population?.description
            if let unwrappedCountryCode = country.alpha2Code {
                ImageManager.shared.getImage(countryCode: unwrappedCountryCode) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let imageFromOnline):
                            cell.flagImageOutlet.image = imageFromOnline
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailCountryVC") as! DetailCountryViewController
        detailVC.country = countries[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CountryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}

extension CountryViewController: UICollectionViewDelegate {}
