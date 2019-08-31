//
//  ViewController.swift
//  Assignment4
//
//  Created by Htoo Aung Kyaw on 8/31/19.
//  Copyright © 2019 Htoo Aung Kyaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    let numberofItemPerRow:CGFloat = 3.0
    let spacing:CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        
        let nib = UINib(nibName: String(describing: BooksItemCollectionViewCell.self), bundle: nil)
        booksCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: BooksItemCollectionViewCell.self))
        
        let totalPadding:CGFloat = numberofItemPerRow * spacing
        let itemWidth = (self.view.frame.width - totalPadding)/numberofItemPerRow
        
        let layout = booksCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 2)
        
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BooksItemCollectionViewCell.self)
            , for: indexPath) as! BooksItemCollectionViewCell
        return item
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
   
}

