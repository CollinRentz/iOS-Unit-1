//
//  PlanetTableViewController.swift
//  SolarSystem
//
//  Created by Collin Rentz on 11/13/22.
//

import UIKit

class PlanetViewController: UITableViewController {
    
    let backgroundView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Solar System"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlanetController.shared.planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.planetReuseId, for: indexPath)
        
        let planet = PlanetController.shared.planets[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = planet.name
        content.textProperties.color = .label
        content.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        content.textToSecondaryTextVerticalPadding = 4
        
        content.secondaryText = planet.planetType
        content.secondaryTextProperties.color = .secondaryLabel
        content.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .subheadline)
        
        content.image = UIImage(systemName: (planet.favorite) ? "circle.fill": "circle")
        content.imageProperties.tintColor = .systemPurple
        content.imageToTextPadding = 16
        
        backgroundView.backgroundColor = UIColor.systemGray6
        cell.selectedBackgroundView = backgroundView
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.planetSegueId {
            
            guard let destinationVC = segue.destination as? DetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let planet = PlanetController.shared.planets[indexPath.row]
            
            destinationVC.planet = planet
        }
    }
    
}
