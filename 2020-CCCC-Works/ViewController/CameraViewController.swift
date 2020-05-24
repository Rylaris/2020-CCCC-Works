//
//  CameraViewController.swift
//  2020-CCCC-Works
//
//  Created by 温蟾圆 on 2020/5/24.
//  Copyright © 2020 温蟾圆. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIImagePickerController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override  func viewDidAppear(_ animated: Bool) {
        detectedPermission()
    }
    
    func detectedPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .denied, .restricted:
            let alertView = UIAlertController(title: "缺少必要的相机权限", message: "", preferredStyle: .alert)
            let settingAction = UIAlertAction(title: "前往设置", style: .default, handler: {(action) -> Void in
                UIApplication.shared.open(URL.init(string: UIApplication.openSettingsURLString)!)
            })
            let cancelAction = UIAlertAction(title: "取消", style: .destructive, handler: nil)
            alertView.addAction(cancelAction)
            alertView.addAction(settingAction)
            self.present(alertView, animated: true, completion: nil)
        default: break
        }
    }
}
