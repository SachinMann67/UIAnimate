//
//  MainViewController.swift
//  TotalityCorp
//
//  Created by Sachin maan on 13/02/21.
//  Copyright © 2021 Sachin maan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var qrCodeImage: UIImageView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = generateQRCode(from: "https://linkedin.com/in/sachinmann")
        qrCodeImage.image = image
    }
    
    //MARK: button action trigger on click of orange view
    @IBAction func openButtonAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ArticlePageViewController") as! ArticlePageViewController
        vc.yellowFrame = orangeView.convert(yellowView.frame, to: self.view) // sharing frame
        vc.greenFrame = orangeView.convert(greenView.frame, to: self.view)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    

}
func generateQRCode(from string: String) -> UIImage? {
    let data = string.data(using: String.Encoding.ascii)

    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 3, y: 3)

        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
    }

    return nil
}
