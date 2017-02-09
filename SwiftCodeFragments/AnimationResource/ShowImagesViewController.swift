//
//  ShowImagesViewController.swift
//  SwiftCodeFragments
//
//  Created by zhangmingwei on 2017/2/9.
//  Copyright © 2017年 SpeedX. All rights reserved.
//

import UIKit
import ImageViewer

// 添加延展。。。

extension ShowImagesViewController: GalleryDisplacedViewsDatasource {
    
    func provideDisplacementItem(atIndex index: Int) -> DisplaceableView? {
        
        return index < items.count ? items[index].imageView : nil
    }
}

extension ShowImagesViewController: GalleryItemsDatasource {
    
    func itemCount() -> Int {
        
        return items.count
    }
    
    func provideGalleryItem(_ index: Int) -> GalleryItem {
        
        return items[index].galleryItem
    }
}

//extension ShowImagesViewController: GalleryItemsDelegate {
//    
//    func removeGalleryItem(at index: Int) {
//        
//        print("remove item at \(index)")
//        
//        let imageView = items[index].imageView
//        imageView.removeFromSuperview()
//        items.remove(at: index)
//    }
//}

// Some external custom UIImageView we want to show in the gallery
class FLSomeAnimatedImage: UIImageView {
}

// Extend ImageBaseController so we get all the functionality for free
//class AnimatedViewController: ItemBaseController<FLSomeAnimatedImage> {
//}

extension UIImageView: DisplaceableView {}

struct DataItem {
    
    let imageView: UIImageView
    let galleryItem: GalleryItem
}

class ShowImagesViewController: BaseViewController {

    var imageV1: UIImageView!
    var imageV2: UIImageView!
    var imageV3: UIImageView!
    
    var items: [DataItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initAllView()
        
    }
    
    func initAllView() -> Void {
        imageV1 = UIImageView(frame: CGRect(x: 0, y: 10, width: 100, height: 100))
        imageV1.image = UIImage(named: "1")
        self.view.addSubview(imageV1)
        imageV1.tag = 1
        let galleryItem1 = GalleryItem.video(fetchPreviewImageBlock: { $0(UIImage(named: "1")!) }, videoURL: URL (string: "http://video.dailymail.co.uk/video/mol/test/2016/09/21/5739239377694275356/1024x576_MP4_5739239377694275356.mp4")!)
        imageV2 = UIImageView(frame: CGRect(x: 0, y: 120, width: 120, height: 100))
        self.view.addSubview(imageV2)
        imageV2.image = UIImage(named: "2")
        imageV2.tag = 2
        let galleryItem2 = GalleryItem.image {  $0(UIImage(named: "2"))}
        
        imageV3 = UIImageView(frame: CGRect(x: 0, y: 260, width: 110, height: 100))
        self.view.addSubview(imageV3)
        imageV3.image = UIImage(named: "3")
        imageV3.tag = 3
        let galleryItem3 = GalleryItem.image{ $0(UIImage(named: "3"))}
        items.append(DataItem(imageView: imageV1, galleryItem: galleryItem1))
        items.append(DataItem(imageView: imageV2, galleryItem: galleryItem2))
        items.append(DataItem(imageView: imageV3, galleryItem: galleryItem3))
        
        // 点击事件
        imageV1.isUserInteractionEnabled = true
        imageV2.isUserInteractionEnabled = true
        imageV3.isUserInteractionEnabled = true
        imageV1.backgroundColor = UIColor.red
        imageV2.backgroundColor = UIColor.blue
        imageV3.backgroundColor = UIColor.gray
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(sender:)))
        imageV1.addGestureRecognizer(tap)
        imageV2.addGestureRecognizer(tap)
        imageV3.addGestureRecognizer(tap)
        
    }
    
    func tapAction(sender: UITapGestureRecognizer) -> Void {
            // 点击第一个图片
            guard let displacedView = sender.view as? UIImageView else { return }
            
            guard let displacedViewIndex = items.index(where: { $0.imageView == displacedView }) else { return }
            
            let frame = CGRect(x: 0, y: 0, width: 200, height: 24)
            let headerView = CounterView(frame: frame, currentIndex: displacedViewIndex, count: items.count)
            let footerView = CounterView(frame: frame, currentIndex: displacedViewIndex, count: items.count)
            let galleryViewController = GalleryViewController(startIndex: displacedViewIndex, itemsDatasource: self, displacedViewsDatasource: self, configuration: galleryConfiguration())
            galleryViewController.headerView = headerView
            galleryViewController.footerView = footerView
            galleryViewController.launchedCompletion = { print("LAUNCHED") }
            galleryViewController.closedCompletion = { print("CLOSED") }
            galleryViewController.swipedToDismissCompletion = { print("SWIPE-DISMISSED") }
            galleryViewController.landedPageAtIndexCompletion = { index in
                print("LANDED AT INDEX: \(index)")
                headerView.count = self.items.count
                headerView.currentIndex = index
                footerView.count = self.items.count
                footerView.currentIndex = index
            }
            self.presentImageGallery(galleryViewController)
            
    }
    
    // 配置信息
    func galleryConfiguration() -> GalleryConfiguration {
        
        return [
            
            GalleryConfigurationItem.closeButtonMode(.builtIn),
            
            GalleryConfigurationItem.pagingMode(.standard),
            GalleryConfigurationItem.presentationStyle(.displacement),
            GalleryConfigurationItem.hideDecorationViewsOnLaunch(false),
            
//            GalleryConfigurationItem.swipeToDismissMode(.vertical),
//            GalleryConfigurationItem.toggleDecorationViewsBySingleTap(false),
            
            GalleryConfigurationItem.overlayColor(UIColor(white: 0.035, alpha: 1)),
            GalleryConfigurationItem.overlayColorOpacity(1),
            GalleryConfigurationItem.overlayBlurOpacity(1),
            GalleryConfigurationItem.overlayBlurStyle(UIBlurEffectStyle.light),
            
            GalleryConfigurationItem.maximumZoolScale(8),
            GalleryConfigurationItem.swipeToDismissThresholdVelocity(500),
            
            GalleryConfigurationItem.doubleTapToZoomDuration(0.15),
            
            GalleryConfigurationItem.blurPresentDuration(0.5),
            GalleryConfigurationItem.blurPresentDelay(0),
            GalleryConfigurationItem.colorPresentDuration(0.25),
            GalleryConfigurationItem.colorPresentDelay(0),
            
            GalleryConfigurationItem.blurDismissDuration(0.1),
            GalleryConfigurationItem.blurDismissDelay(0.4),
            GalleryConfigurationItem.colorDismissDuration(0.45),
            GalleryConfigurationItem.colorDismissDelay(0),
            
            GalleryConfigurationItem.itemFadeDuration(0.3),
            GalleryConfigurationItem.decorationViewsFadeDuration(0.15),
            GalleryConfigurationItem.rotationDuration(0.15),
            
            GalleryConfigurationItem.displacementDuration(0.55),
            GalleryConfigurationItem.reverseDisplacementDuration(0.25),
            GalleryConfigurationItem.displacementTransitionStyle(.springBounce(0.7)),
            GalleryConfigurationItem.displacementTimingCurve(.linear),
            
            GalleryConfigurationItem.statusBarHidden(true),
            GalleryConfigurationItem.displacementKeepOriginalInPlace(false),
            GalleryConfigurationItem.displacementInsetMargin(50)
        ]
    }
    
}
