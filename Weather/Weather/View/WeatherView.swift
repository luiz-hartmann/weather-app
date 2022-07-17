//
//  WeatherView.swift
//  Weather
//
//  Created by Luiz Hartmann on 13/07/22.
//

import UIKit

class WeatherView: UIView {
    
    // MARK: - Components
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.addArrangedSubview(locationButton)
        stackView.addArrangedSubview(searchTextField)
        stackView.addArrangedSubview(searchButton)
        
        return stackView
    }()
    
    private lazy var backgroundView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "day-background")
        image.contentMode = .scaleAspectFill
        
        return image
    }()

    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.preferredFont(forTextStyle: .title1)
        textField.placeholder = "Search"
        textField.textAlignment = .right
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemFill
        
        return textField
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var conditionImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "sun.max")
        image.tintColor = .label
        
        return image
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 80)
        label.text = "22°C"
        
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "Cupertino"
        
        return label
    }()
    
    private lazy var temperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 10
        stackView.addArrangedSubview(conditionImageView)
        stackView.addArrangedSubview(temperatureLabel)
        stackView.addArrangedSubview(cityLabel)
        
        return stackView
    }()
    
    private func makeTemperatureText(with temperature: String) -> NSAttributedString {
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.boldSystemFont(ofSize: 100)
        
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.systemFont(ofSize: 80)
        
        let text = NSMutableAttributedString(string: temperature, attributes: boldTextAttributes)
        text.append(NSAttributedString(string: "°C", attributes: plainTextAttributes))
        return text
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(backgroundView)
        addSubview(searchStackView)
        addSubview(temperatureStackView)
    }
    
    private func setupLayoutConstraints() {
        setBackgroundView()
        setSearchStackView()
        setLocationButton()
        setSearchButton()
        setConditionImageView()
        setTemperatureStackView()
    }
    
    // MARK: - Constraints
    private func setBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setSearchStackView() {
        NSLayoutConstraint.activate([
            searchStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: searchStackView.trailingAnchor, multiplier: 1)
        ])
    }
    
    private func setLocationButton() {
        NSLayoutConstraint.activate([
            locationButton.widthAnchor.constraint(equalToConstant: 44),
            locationButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setSearchButton() {
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalToConstant: 44),
            searchButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setConditionImageView() {
        NSLayoutConstraint.activate([
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    private func setTemperatureStackView() {
        NSLayoutConstraint.activate([
            temperatureStackView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 20),
            temperatureStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            temperatureStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}
