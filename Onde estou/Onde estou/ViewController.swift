//
//  ViewController.swift
//  Onde estou
//
//  Created by Lucas on 24/07/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario = locations.last!
        
        let latitude = localizacaoUsuario.coordinate.latitude
        let longitude = localizacaoUsuario.coordinate.longitude
        
        latitudeLabel.text = String(latitude)
        longitudeLabel.text = String(longitude)
        
        if localizacaoUsuario.speed > 0 {
        velocidadeLabel.text = String(localizacaoUsuario.speed)
        }
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let areaExibicao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLat, longitudeDelta: deltaLon)
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaExibicao)
        
        mapa.setRegion(regiao, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario) { (detalhesLocal, erro) in
           
            if erro == nil {
                
                let dadosLocal = detalhesLocal?.first
                
                var thoroughfare = ""
                if dadosLocal?.thoroughfare != nil {
                    thoroughfare = (dadosLocal?.thoroughfare!)!
                }
                
                var subThoroughfare = ""
                if dadosLocal?.subThoroughfare != nil {
                    subThoroughfare = (dadosLocal?.subThoroughfare!)!
                }
                
                var locality = ""
                if dadosLocal?.locality != nil {
                    locality = (dadosLocal?.locality!)!
                }
                
                var subLocality = ""
                if dadosLocal?.subLocality != nil {
                    subLocality = (dadosLocal?.subLocality!)!
                }
                
                var postalCode = ""
                if dadosLocal?.postalCode != nil {
                    postalCode = (dadosLocal?.postalCode!)!
                }
                
                var country = ""
                if dadosLocal?.country != nil {
                    country = (dadosLocal?.country!)!
                }
                
                var administrativeArea = ""
                if dadosLocal?.administrativeArea != nil {
                    administrativeArea = (dadosLocal?.administrativeArea!)!
                }
                
                self.enderecoLabel.text = thoroughfare + " - "
                    + subThoroughfare + "\n" + locality + " / " + country
                
                print("Via pública: " + thoroughfare + "\n" +
                      "Número: " + subThoroughfare + "\n" +
                    "Cidade: " + locality + "\n" +
                    "Bairro: " + subLocality + "\n" +
                    "CEP: " + postalCode + "\n" +
                    "País: " + country + "\n" +
                    "Estado: " + administrativeArea + "\n"
                )
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {
            
            let alerta = UIAlertController(title: "Permissão de localização", message: "Por favor, permita acesso a localização!", preferredStyle: .alert)
            
            let config = UIAlertAction(title: "Abrir Configurações", style: .default) { (alertaConfig) in
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(configuracoes as URL)
                }
            }
            let cancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
            
            alerta.addAction(config)
            alerta.addAction(cancelar)
            
            present(alerta, animated: true, completion: nil)
            
            
        }
    }


}

