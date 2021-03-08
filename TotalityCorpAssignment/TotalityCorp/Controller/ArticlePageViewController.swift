//
//  ArticlePageViewController.swift
//  TotalityCorp
//
//  Created by Sachin maan on 13/02/21.
//  Copyright © 2021 Sachin maan. All rights reserved.
//

import UIKit

class ArticlePageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var stopDownloadButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var GreenView: UIView!
    var yellowFrame = CGRect()
    var greenFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleName.translatesAutoresizingMaskIntoConstraints = true
        stopDownloadButton.translatesAutoresizingMaskIntoConstraints = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        yellowView.frame = yellowFrame
        setupGreenView()
        presentingSetup()
    }
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBAction func stopDownloadAction(_ sender: Any) {
        stopDownloadButton.isHidden = true
        UIView.animate(withDuration: 0.2, animations: {
            self.GreenView.frame.size.width = self.GreenView.frame.size.width + 30
        },completion: { _ in
            self.setupGreenViewGesture()
        })
    }
    
}

//MARK: All setup functions
extension ArticlePageViewController{
    
    //responsible to present all view components with animation.
    func presentingSetup(){
        UIView.animate(withDuration: 0.2, animations: {
            self.yellowView.transform = CGAffineTransform(translationX: -40 , y: -100)
            let originalTransform = self.GreenView.transform
            let scaledTransform = originalTransform.scaledBy(x: 1.2, y: 1)
            let scaledAndTranslated = scaledTransform.translatedBy(x: 0, y: 100)
            self.GreenView.transform = scaledAndTranslated
        })
        UIView.animate(withDuration: 0.4, delay: 0, options: .transitionCrossDissolve, animations: {
            self.titleName.frame.origin.x = (self.yellowView.frame.origin.x + self.yellowView.frame.width) + 10
            self.titleName.frame.origin.y = self.yellowView.frame.origin.y
            self.titleName.alpha += 0.7
            self.descLabel.alpha += 0.7
            self.readMoreButton.alpha += 0.7
            self.downloadLabel.alpha += 0.7
        },completion: {_ in
            self.titleName.alpha = 1
            self.descLabel.alpha = 1
            self.readMoreButton.alpha = 1
            self.downloadLabel.alpha = 1
        })
    }
    //setup greenView
    func setupGreenView(){
        GreenView.frame = greenFrame
        downloadLabel.frame = CGRect(x: 0, y: (GreenView.frame.height/2) - 7, width: GreenView.frame.width, height: 16)
        setupGreenViewGesture()
    }
    func setupGreenViewGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(greenButtonAction))
        GreenView.addGestureRecognizer(tap)
    }
    
    @objc func greenButtonAction(){
        UIView.animate(withDuration: 0.2, animations: {
            self.GreenView.frame.size.width = self.GreenView.frame.size.width - 30
        },completion: { _ in
            self.stopDownloadButtonSetup()
        })
        if let gesture = GreenView.gestureRecognizers?.first{
            GreenView.removeGestureRecognizer(gesture)
        }
    }
    
    //setup stopDownloadingButton
    func stopDownloadButtonSetup(){
        stopDownloadButton.frame = CGRect(x: self.view.frame.width - 60, y: GreenView.frame.origin.y + 10, width: 35, height: 35)
        stopDownloadButton.layer.cornerRadius = stopDownloadButton.frame.width/2
        UIView.animate(withDuration: 0.4, delay: .zero, options: .showHideTransitionViews, animations: {
            self.stopDownloadButton.isHidden = false
        },completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                self.setProgressView()
            })
        })
    }
    
    // Responsible to setup progressView
    func setProgressView() {
        self.downloadLabel.text = "10 MB / 30 MB"
        let BoundWidth = self.GreenView.bounds.width
        let frameWidth = self.GreenView.frame.size.width
        let progressView = UIView(frame: CGRect(x: 0, y: 0, width: BoundWidth, height: self.GreenView.frame.height))
        progressView.backgroundColor =  #colorLiteral(red: 0, green: 0.9137254902, blue: 0, alpha: 0.2375321062)
        progressView.layer.cornerRadius = progressView.frame.height/2
        progressView.clipsToBounds = true
        self.GreenView.insertSubview(progressView, at: 0)
        self.GreenView.frame.size.width = 1
        UIView.animate(withDuration: 2.0,animations: {
            self.GreenView.frame.size = CGSize(width: frameWidth, height: self.GreenView.frame.height)
        },completion: {_ in
            self.GreenView.isHidden = true
            self.stopDownloadButton.isHidden = true
            self.setupPlayButton()
        })
    }
    
    // setup play button
    func setupPlayButton(){
        let playButton = UIButton(frame: CGRect(x: 30, y: (self.view.frame.size.height) - 40, width: self.view.frame.width - 60, height: 60))
        playButton.alpha = 0
        playButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        playButton.setTitle("PLAY", for: .normal)
        playButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 18)
        playButton.setTitleColor(.white, for: .normal)
        playButton.layer.cornerRadius = playButton.frame.height/2
        playButton.clipsToBounds = true
        self.view.addSubview(playButton)
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        UIView.animate(withDuration: 0.2, animations: {
            playButton.alpha += 0.7
            playButton.center.y -= playButton.frame.height
        },completion: {_ in
            playButton.alpha = 1
        })
    }
    
    //responsible to present paymentViewController on click play button
    @objc func playButtonAction(){
        let controller = PaymentViewController.instantiate()
        controller.view.backgroundColor =  #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 0.5)
        controller.view.frame = UIScreen.main.bounds
        controller.willMove(toParent: self)
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
}

//MARK: collection view delegate
extension ArticlePageViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 186, height: 325)
    }
}
//MARK: collection view delegate functions
extension ArticlePageViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        cell.transform = CGAffineTransform(translationX: cell.frame.width / 2, y: 0)
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
        })
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : imagesCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagesCollectionViewCell", for: indexPath) as! imagesCollectionViewCell
        return cell
    }
}
