//
//  OngkirView.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import UIKit

class OngkirView: UIView {
    
    var ProvinceData: [String] = []
    
    var CityData: [String] = []
    
    lazy var LocationView: UIView = {
        
        let view = UIView()
        
        view.backgroundColor = .green
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    lazy var ProvinceTextView: UITextField = {
       
        let ui = UITextField()
        
        ui.placeholder = "Province"
        
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
        
    }()
    
    lazy var CityTextView: UITextField = {
       
        let ui = UITextField()
        
        ui.placeholder = "City"
        
        ui.translatesAutoresizingMaskIntoConstraints = false
       
        return ui
        
    }()
    
    lazy var ProvinceView: UIPickerView = {
        let data = UIPickerView()
        
        data.translatesAutoresizingMaskIntoConstraints = false
        
        return data
    }()
    
    lazy var CityView: UIPickerView = {
       
        let data = UIPickerView()
        
        data.translatesAutoresizingMaskIntoConstraints = false
        
        return data
        
    }()
    
    lazy var TombolView: UIButton = {
       
        let Tombol = UIButton()
        
        Tombol.translatesAutoresizingMaskIntoConstraints = false
        Tombol.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        Tombol.layer.cornerRadius = 2
        Tombol.setTitle("Check Ongkir", for: .normal)
        
        return Tombol
    }()
    
    lazy var ProvinceDestinationView: UITextField = {
        let ui = UITextField()
        
        ui.placeholder = "Province Destination"
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
    }()
    
    lazy var CityDestinationView: UITextField = {
        let ui = UITextField()
        
        ui.placeholder = "City Destination"
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
    }()
    
    lazy var FromTextLabel: UILabel = {
        let ui = UILabel()
        ui.text = "From"
        ui.font = UIFont(name: "System", size: 20)
        ui.font = UIFont.boldSystemFont(ofSize: 17)
        ui.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
    }()
    
    
    lazy var ToTextLabel: UILabel = {
        let ui = UILabel()
        ui.text = "To"
        ui.font = UIFont(name: "System", size: 20)
        ui.font = UIFont.boldSystemFont(ofSize: 17)
        ui.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        ui.translatesAutoresizingMaskIntoConstraints = false
        
        return ui
    }()

    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    private func setupView() {
        
        ProvinceView.dataSource = self
        ProvinceView.delegate = self
          
        CityView.dataSource = self
        CityView.delegate = self
          
        ProvinceTextView.inputView = ProvinceView
        CityTextView.inputView = CityView
        
        ProvinceDestinationView.inputView = ProvinceView
        CityDestinationView.inputView = CityView
    
        self.addSubview(TombolView)
        self.addSubview(ProvinceTextView)
        self.addSubview(CityTextView)
        self.addSubview(ProvinceDestinationView)
        self.addSubview(CityDestinationView)
        self.addSubview(FromTextLabel)
        self.addSubview(ToTextLabel)
        
        dismissPickerView()
        prepareProvinceData()
    }
    
    private func prepareProvinceData()
    {
        let url = URL(string: RajaOngkir.mainHost.rawValue + RajaOngkir.provincePath.rawValue)!
        
        var request = URLRequest(url: url)
        
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
           return
        }
        
        request.addValue(RajaOngkir.apiKey.rawValue, forHTTPHeaderField: "key")
        request.addValue(deviceID, forHTTPHeaderField: "ios-key")

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let result = data else { return }
            
            do {
                
                if error != nil {
                    print(error)
                }
                
                let json = try JSONDecoder().decode(ProvinceModel.self, from: result )
                let province = json.rajaongkir.results
                self.ProvinceData.removeAll()
                
                for n in 0..<province.count {
                    self.ProvinceData.append(province[n].province)
                }
        
            } catch {
                print("error", error)
            }
            
        }

        task.resume()
    }
    
    
    private func prepareCityData(province_id: Int)
    {
        let url = URL(string: RajaOngkir.mainHost.rawValue + RajaOngkir.cityPath.rawValue + "?province=" + String(province_id))!
        
        var request = URLRequest(url: url)
        
        guard let deviceID = UIDevice.current.identifierForVendor?.uuidString else {
           return
        }
        
        request.addValue(RajaOngkir.apiKey.rawValue, forHTTPHeaderField: "key")
        request.addValue(deviceID, forHTTPHeaderField: "ios-key")

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let result = data else { return }
            
            do {
                
                if error != nil {
                    print(error)
                }
                
                let json = try JSONDecoder().decode(CityModel.self, from: result )
                let city = json.rajaongkir.results
                
                self.CityData.removeAll()
                
                for n in 0..<city.count {
                    self.CityData.append(city[n].city_name)
                }
        
            } catch {
                print("error", error)
            }
            
        }

        task.resume()
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.endEditingProvince))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        ProvinceTextView.inputAccessoryView = toolBar
        CityTextView.inputAccessoryView = toolBar
        ProvinceDestinationView.inputAccessoryView = toolBar
        CityDestinationView.inputAccessoryView = toolBar
    }
    
    @objc func endEditingProvince() {
          self.endEditing(true)
    }
    
    override func updateConstraints() {
        
        FromTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        FromTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        FromTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        
        ProvinceTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        ProvinceTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        ProvinceTextView.topAnchor.constraint(equalTo: FromTextLabel.bottomAnchor, constant: 30).isActive = true
        
        CityTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        CityTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        CityTextView.topAnchor.constraint(equalTo: ProvinceTextView.bottomAnchor, constant: 20).isActive = true
        
        ToTextLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        ToTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        ToTextLabel.topAnchor.constraint(equalTo: CityTextView.bottomAnchor, constant: 30).isActive = true
        
        ProvinceDestinationView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        ProvinceDestinationView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        ProvinceDestinationView.topAnchor.constraint(equalTo: ToTextLabel.bottomAnchor, constant: 30).isActive = true
        
        CityDestinationView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        CityDestinationView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        CityDestinationView.topAnchor.constraint(equalTo: ProvinceDestinationView.bottomAnchor, constant: 20).isActive = true
        
        
        TombolView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        TombolView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        TombolView.topAnchor.constraint(equalTo: CityDestinationView.bottomAnchor, constant: 20).isActive = true
        TombolView.widthAnchor.constraint(lessThanOrEqualToConstant: self.frame.width).isActive = true
        
        super.updateConstraints()
    }
    
}

extension OngkirView: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
   }
       
   func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        if ProvinceTextView.isFirstResponder || ProvinceDestinationView.isFirstResponder {
            return ProvinceData.count
        }
    
        return CityData.count
   }
   
   func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        if ProvinceTextView.isFirstResponder || ProvinceDestinationView.isFirstResponder {
            return ProvinceData[row]
        }
    
        return CityData[row]
   }
   
   func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        if ProvinceTextView.isFirstResponder{
            ProvinceTextView.text = ProvinceData[row]
            prepareCityData(province_id: row+1)
        }
    
        if ProvinceDestinationView.isFirstResponder {
            ProvinceDestinationView.text = ProvinceData[row]
            prepareCityData(province_id: row+1)
        }
    
        if CityTextView.isFirstResponder {
            CityTextView.text = CityData[row]
        }
    
        if CityDestinationView.isFirstResponder {
            CityDestinationView.text = CityData[row]
        }
   }
    
}
