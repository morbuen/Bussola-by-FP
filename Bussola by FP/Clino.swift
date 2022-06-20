//
//  Clino.swift
//  Bussola by FP
//
//  Created by Francesco Puzone on 20/06/22.
//

import Foundation
import CoreMotion
import SwiftUI

class MotionManager: UIViewController, ObservableObject {
    private var motionManager = CMMotionManager()
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
    @Published var yawLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard motionManager.isDeviceMotionAvailable else { return }
    }
    
    func attitude() {
        
        motionManager.deviceMotionUpdateInterval = 1 / 60
        
        motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue.current!, withHandler: { [weak self] (motion, error) in
            guard let motion = motion, error == nil else { return }
            
            let pitchAngle = motion.attitude.pitch * 180 / Double.pi
            let rollAngle = motion.attitude.roll * 180 / Double.pi
            @State var yawAngle = motion.attitude.yaw * 180 / Double.pi
            
            self?.pitchLabel.text = String(pitchAngle)
            self?.rollLabel.text = String(rollAngle)
            self?.yawLabel.text = String(yawAngle)
        })
    }
}
