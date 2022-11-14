//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Collin Rentz on 11/13/22.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var namesakeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var ordinalSuffixLabel: UILabel!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        favoriteButton.tintColor = .systemPurple
        updateViews()
        updateFavoriteStatus()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.detailReuseId, for: indexPath) as? DetailCollectionViewCell  else { return UICollectionViewCell() }
        
        cell.detailImageView.alpha = 0.5
        cell.detailImageView.image = UIImage(systemName: "globe")
        
        guard let planet = planet else { return UICollectionViewCell() }
        
        switch indexPath.item {
        case 0:
            cell.titleLabel.text = "Day Length"
            cell.detailLabel.text = "\(planet.dayLengthInDays) days"
            
        case 1:
            cell.titleLabel.text = "Year Length"
            cell.detailLabel.text = "\(planet.yearLengthInDays) days"
            
        case 2:
            cell.titleLabel.text = "Radius"
            cell.detailLabel.text = "\(planet.radiusInMiles) miles"
            
        case 3:
            cell.titleLabel.text = "Moon Count"
            cell.detailLabel.text = "\(planet.moonCount)"
            
        case 4:
            cell.titleLabel.text = "Ring Count"
            cell.detailLabel.text = "\(planet.ringCount)"
            
        case 5:
            cell.titleLabel.text = "Plant Type"
            cell.detailLabel.text = "\(planet.planetType)"
            
        case 6:
            cell.titleLabel.text = "Distance from Sun"
            cell.detailLabel.text = "\(planet.distanceFromSun) AU"
            
        case 7:
            cell.titleLabel.text = "Galaxy"
            cell.detailLabel.text = "Milky Way"
            
        default:
            break
        }
        
        return cell
    }
    
    func updateViews() {
        
        let attributedString = NSMutableAttributedString(string: ordinalSuffixLabel.text ?? "")
        
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(1.0), range: NSRange(location: 0, length: attributedString.length))
        
        guard let planet = planet else { return }
        
        planetImageView.image = UIImage(named: planet.imageName)
        orderNumberLabel.text = "\(planet.orderNumber)"
        ordinalSuffixLabel.text = ordinalSuffix(order: planet.orderNumber) + " planet"
        nameLabel.attributedText = attributedString
        nameLabel.text = planet.name.uppercased()
        namesakeLabel.text = planet.planetDescription
    }
    
    func ordinalSuffix(order: Int) -> String {
        switch  order {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        case 4, 5, 6, 7, 8:
            return "th"
        default:
            return ""
        }
    }
    
    func updateFavoriteStatus() {
        guard let planet = planet else {
            return
        }
        favoriteButton.image = UIImage(systemName: planet.favorite ? "star.circle.fill" : "star.circle")
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let planet = planet else {
            return
        }
        PlanetController.shared.updateFavorite(planet: planet)
        updateFavoriteStatus()
    }
    
}
