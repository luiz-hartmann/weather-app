//
//  WeatherViewController.swift
//  Weather
//
//  Created by Luiz Hartmann on 12/07/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    lazy var weatherView: WeatherView = {
        let view = WeatherView()
        
        return view
    }()
    
    override func loadView() {
        self.view = weatherView
    }
}
