//
//  MapDetailView.swift
//  Experiences-sprint-chanllenge
//
//  Created by Gi Pyo Kim on 12/6/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit
import AVFoundation

class MapDetailView: UIView {
    
    // MARK: - Properties
    var experience: Experience? {
        didSet {
            updateViews()
        }
    }
    
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    let view = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
                
        view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func updateViews() {
        guard let experience = experience else { return }
        
        player = AVPlayer(url: experience.videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = view.bounds
        view.layer.addSublayer(playerLayer!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
