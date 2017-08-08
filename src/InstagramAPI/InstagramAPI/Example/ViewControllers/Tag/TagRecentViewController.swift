//
//  TagRecentViewController.swift
//  InstagramAPI
//
//  Created by Admin on 05.06.17.
//  Copyright © 2017 ConceptOffice. All rights reserved.
//
/*
import UIKit

private let reuseIdentifier = "tagRecentCell"

class TagRecentViewController: UICollectionViewController {

    var params : Instagram.TagsEndpoint.Parameter.RecentMediaParameter?
    fileprivate var dataSource: [Instagram.Media?] = []
    fileprivate let kMaxPhotosInRaw = 4
    fileprivate let kPhotosSpacing: CGFloat = 1.0
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let request = Instagram.TagsEndpoint.Get.recentMedia(params!)
        InstagramManager.shared.networkClient.send(request, completion: {
          (media: InstagramArrayResponse<Instagram.Media>?, error: Error?) in
          if error == nil{
            self.dataSource = (media?.data)!
            self.collectionView?.reloadData()
          }
        })
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

  }

extension TagRecentViewController{
  
  // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TagCell
        let media = dataSource[indexPath.row]
        cell.imageView.af_setImage(withURL: (media?.image?.lowResolutionURL?.URL)!)
        return cell
    }

}

extension TagRecentViewController: UICollectionViewDelegateFlowLayout{
  
  // Mark: UICollectionViewDelegateFlowLayout
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let photoWidth = floor(screenWidth / CGFloat(kMaxPhotosInRaw) - kPhotosSpacing / CGFloat(kMaxPhotosInRaw) * kPhotosSpacing)
        return CGSize(width: photoWidth, height: photoWidth)
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kPhotosSpacing
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return kPhotosSpacing
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, kPhotosSpacing * 2, 0)
    }
}
*/