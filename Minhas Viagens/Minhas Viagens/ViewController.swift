//
//  ViewController.swift
//  Minhas Viagens
//
//  Created by Lucas on 25/07/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String, String> = [:]
    var indiceSelecionado: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let indice = indiceSelecionado {
            if indice == -1 {
                // adicionando
                
                configuraGerenciadorLocalizacao()
                
            } else {
                // listando
                exibirAnotacao( viagem: viagem)
            }
        }
        reconhecedorGesto()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let local = locations.last!
        
        // exibi local
        let localizacao = CLLocationCoordinate2D(latitude: local.coordinate.latitude, longitude: local.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: span)
        self.mapa.setRegion(regiao, animated: true)
    }
    
    func exibirLocal(latitude: Double, longitude: Double) {
        
        // exibi local
        let localizacao = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: span)
        self.mapa.setRegion(regiao, animated: true)    }
    
    func exibirAnotacao( viagem: Dictionary<String, String> ) {
        
        // exibe anotação com os dados de endereço
        if let localViagem = viagem["local"] {
            if let latitude2 = viagem["latitude"] {
                if let longitude2 = viagem["longitude"] {
                    
                    if let latitude = Double(latitude2) {
                        if let longitude = Double(longitude2) {
                            
                            // adiciona anotacao
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation( anotacao )
                            
                            // exibi local
                            exibirLocal(latitude: latitude, longitude: longitude)
                        }
                    }
                }
            }
        }
        
    }
    
    func reconhecedorGesto() {
        
        let gesto = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.marcar(gesture:)))
        gesto.minimumPressDuration = 1.5
        
        mapa.addGestureRecognizer( gesto )
    }
    
    @objc func marcar(gesture: UIGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizer.State.began {
            
            // recupera as coordenadas do ponto selecionado
            let pontoSelecionado = gesture.location(in: self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)

            // recuperar o endereço selecionado
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            var localCompleto = "Endereço não encontrado!"
            
            CLGeocoder().reverseGeocodeLocation(localizacao) { (local, erro) in
                
                if erro == nil {
                    
                    if let dadosLocal = local?.first {
                        
                        if let nome = dadosLocal.name {
                            localCompleto = nome
                            
                        } else {
                            if let endereco = dadosLocal.thoroughfare {
                                localCompleto = endereco
                            }
                            
                        }
                    }
                    
                    // salvar dados no dispositivo
                    self.viagem = ["local": localCompleto , "latitude": String(coordenadas.latitude) , "longitude": String(coordenadas.longitude) ]
                    ArmazenamentoDados().salvarViagens(viagem: self.viagem)
                    
                    // exibe anotação com os dados de endereço
                    self.exibirAnotacao(viagem: self.viagem)
                    
                } else {
                    print(erro)
                }
            }
        }
        
    }
    
    func configuraGerenciadorLocalizacao() {
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
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

