//
//  ViewController.swift
//  ClujBikeLite
//
//  Created by Vincze David on 1/11/19.
//  Copyright © 2019 Zsebe Akos. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let ALL_CELL_ID = "all_cell_id"
    let FAVORITES_CELL_ID = "favorites_cell_id"
    let MAP_CELL_ID = "map_cell_id"
    
    let searchView = UIView()
    var input = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        
        let title = "ClujBikeLite"
        
        let titleLable =  UILabel(frame: CGRect(x: 0, y: 0, width: title.count, height: Int(view.frame.height)))
        titleLable.text = title
        titleLable.textColor = UIColor.mainTextColor()
        titleLable.font = UIFont.systemFont(ofSize: 23)
        navigationItem.titleView = titleLable
        
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
        floatingSearch()
        floatingButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        input.delegate? = self as! UITextFieldDelegate
        input.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        BaseStationCell().searchDo(text: textField.text!)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y -= keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(AllCell.self, forCellWithReuseIdentifier: ALL_CELL_ID)
        collectionView?.register(FavoritesCell.self, forCellWithReuseIdentifier: FAVORITES_CELL_ID)
        collectionView?.register(MapCell.self, forCellWithReuseIdentifier: MAP_CELL_ID)
        
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0,  0,  0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0,  0,  0)
        
        collectionView?.isPagingEnabled = true
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
    }()
    
    private func setupMenuBar(){
        navigationController?.hidesBarsOnSwipe = false
        
        let redView = UIView()
        redView.backgroundColor = UIColor.mainColor()
        view.addSubview(redView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: redView)
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
        
        menuBar.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    let floatingbutton = UIButton(type: .custom)
    func floatingButton(){
        
        self.floatingbutton.frame = CGRect(x: view.frame.width - 72 , y: view.frame.height - 72 - 70, width: 56, height: 56)
        self.floatingbutton.backgroundColor = UIColor.mainColor()
        self.floatingbutton.clipsToBounds = true
        let btnImage = UIImage(named: "baseline_search_white_24pt_2x")
        self.floatingbutton.setImage(btnImage , for: UIControlState.normal)
        self.floatingbutton.layer.cornerRadius = 28
        self.floatingbutton.addTarget(self,action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        view.addSubview(floatingbutton)
    }
    
    @objc func buttonTapped(){
        if self.searchView.alpha == 0.0 {
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.floatingbutton.transform = CGAffineTransform(translationX: 0, y: -20)
                self.searchView.alpha = 1.0
            }) { (succeed) -> Void in
                self.floatingbutton.setImage(UIImage(named: "baseline_close_white_24pt_2x"), for: UIControlState.normal)
            }
        } else {
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.floatingbutton.transform = CGAffineTransform(translationX: 0, y: 0)
                self.searchView.alpha = 0.0
            }) { (succeed) -> Void in
                self.floatingbutton.setImage(UIImage(named: "baseline_search_white_24pt_2x"), for: UIControlState.normal)
            }
        }
    }
    
    func floatingSearch(){
        self.searchView.frame = CGRect(x: 0 , y: view.frame.height-130, width: view.frame.width, height: 70)
        self.searchView.backgroundColor = UIColor.colorLightBlue()
        self.searchView.clipsToBounds = true
        self.searchView.alpha = 0.0
        input.textColor = UIColor.white
        self.searchView.addSubview(input)
        self.searchView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: input)
        self.searchView.addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: input)
        view.addSubview(self.searchView)
    }
    
    
    private func setupNavBarButtons(){
        let moreImage = UIImage(named: "baseline_more_vert_white_48pt_2x")?.withRenderingMode(.alwaysOriginal)
        let moreBarButtonImage = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreBarButtonImage]
    }

    let settingLauncher: SettingLauncher = {
        let launcher = SettingLauncher()
        return launcher
    }()
    
    @objc func handleMore(){
        settingLauncher.homeController = self
        settingLauncher.showSettingsMenu()
    }
    
    func showControllerForSettings(setting: String) {
        let settingsViewController = SettingsInfoController()
        settingsViewController.navigationItem.title = setting
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 23)]
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func showControllerForAbout(setting: String) {
        let settingsViewController = AboutController()
        settingsViewController.navigationItem.title = setting
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 23)]
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    func showControllerForItemInfo(station: Station){
        let stationInfoController = StationInfoController()
        stationInfoController.navigationItem.title = station.stationName
        stationInfoController.bikesNumber = station.ocuppiedSpots
        stationInfoController.parkingsNumber = station.emptySpots
        stationInfoController.latitude = station.latitude
        stationInfoController.longitude = station.longitude
        stationInfoController.id = station.id
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 23)]
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
        navigationController?.pushViewController(stationInfoController, animated: true)
    }
    
    func scrollToMenuIndex(menuIndex: Int){
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ALL_CELL_ID, for: indexPath) as! BaseStationCell
                cell.homeController = self
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FAVORITES_CELL_ID, for: indexPath) as! BaseStationCell
                cell.homeController = self
                return cell
            case 2:
                return collectionView.dequeueReusableCell(withReuseIdentifier: MAP_CELL_ID, for: indexPath)
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ALL_CELL_ID, for: indexPath) as! BaseStationCell
                cell.homeController = self
                return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 50)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarAnchor?.constant = scrollView.contentOffset.x / 3
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }

}

