//
//  TestViewController.swift
//  test
//
//  Created by Hiren on 15/12/20.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var ivFaceImage: UIImageView!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivFaceImage.layer.shadowColor = UIColor.black.cgColor
        ivFaceImage.layer.shadowOpacity = 0.5
        ivFaceImage.layer.shadowRadius = 5
        ivFaceImage.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        faceCenterImage(UIImage(named: "123")!)
    }
    
    func faceCenterImage(_ image: UIImage) {
        
        guard let uncroppedCgImage = image.cgImage else {
            ivFaceImage.image = image
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            if #available(iOS 11.0, *) {
                uncroppedCgImage.faceCrop(completion: { [weak self] result in
                    switch result {
                    case .success(let cgImage):
                        DispatchQueue.main.async { self?.ivFaceImage.image = UIImage(cgImage: cgImage) }
                    case .notFound, .failure( _):
                        print("error")
                    }
                })
            } else {
                // Fallback on earlier versions
                self.lblError.isHidden = false
                self.ivFaceImage.isHidden = true
            }
        }
    }
}
