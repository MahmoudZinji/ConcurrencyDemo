//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Mahmoud Zinji on 09/06/21.
//  Copyright © 2020 mahmoudZinji. All rights reserved.
//

import UIKit

let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg", "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg", "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg"]

class Downloader {
    
    class func downloadImageWithURL(url:String) -> UIImage! {
        
        do {
            let data = try Data(contentsOf: URL(string: url)!)
            return UIImage(data: data)
        } catch  {
            return UIImage()
        }
//        let data = NSData(contentsOf: NSURL(string: url)! as URL)
//        return UIImage(data: data! as Data)
    }
}

class ViewController: UIViewController {

    //MARK:-IBOUTLETS
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    //MARK:-VAriables
    let queue = OperationQueue()
    
    //MARK:-FLow
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK:-IBActions
    @IBAction func didClickOnStart(_ sender: Any) {
        //MARK:-Section1
        // 1-The first code that u should start with and all below showld be  commented
//        let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//           self.imageView1.image = img1
//
//        let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//           self.imageView2.image = img2
//
//        let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//           self.imageView3.image = img3
//
//        let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//           self.imageView4.image = img4
        
        
        
        //MARK:-Section2
        // 2- Uncomment this to experience the Concurrent flow of Queue and comment all other sections (1 and 3)
        
//        ConcurrentQueue
//        let queue = DispatchQueue.global(priority: .default)
//
//        queue.async {
//            print("preparing Image 1")
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//            DispatchQueue.main.async {
//                print("Finished Image 1")
//                self.imageView1.image = img1
//            }
//        }
//
//        queue.async {
//            print("preparing Image 2")
//            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//            DispatchQueue.main.async {
//                print("Finished Image 2")
//                self.imageView2.image = img2
//            }
//        }
//
//        queue.async {
//            print("preparing Image 3")
//            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//            DispatchQueue.main.async {
//                print("Finished Image 3")
//                self.imageView3.image = img3
//            }
//        }
//
//        queue.async {
//            print("preparing Image 4")
//            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//            DispatchQueue.main.async {
//                print("Finished Image 4")
//                self.imageView4.image = img4
//            }
//        }
        
        
        //MARK:-Section3
        //SerialQueue
//        let serialQueue = DispatchQueue(label: "serialQueue")
//
//        serialQueue.async {
//            print("preparing Image 1")
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//            DispatchQueue.main.async {
//                print("Finished Image 1")
//                self.imageView1.image = img1
//            }
//        }
//
//        serialQueue.async {
//            print("preparing Image 2")
//            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//            DispatchQueue.main.async {
//                print("Finished Image 2")
//                self.imageView2.image = img2
//            }
//        }
//
//        serialQueue.async {
//            print("preparing Image 3")
//            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//            DispatchQueue.main.async {
//                print("Finished Image 3")
//                self.imageView3.image = img3
//            }
//        }
//
//        serialQueue.async {
//            print("preparing Image 4")
//            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//            DispatchQueue.main.async {
//                print("Finished Image 4")
//                self.imageView4.image = img4
//            }
//        }
        
        
        //MARK:-Section4 NSOperationQueue addOperation
//        var queue = OperationQueue()
//
//        queue.addOperation {
//            print("preparing Operation Image 1")
//            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
//            OperationQueue.main.addOperation({
//                print("Finished Operation Image 1")
//                self.imageView1.image = img1
//            })
//        }
//
//
//        queue.addOperation {
//            print("preparing Operation Image 2")
//            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
//            OperationQueue.main.addOperation({
//                print("Finished Operation Image 2")
//                self.imageView2.image = img2
//            })
//        }
//
//        queue.addOperation {
//            print("preparing Operation Image 3")
//            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
//            OperationQueue.main.addOperation({
//                print("Finished Operation Image 3")
//                self.imageView3.image = img3
//            })
//        }
//
//        queue.addOperation {
//            print("preparing Operation Image 4")
//            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
//            OperationQueue.main.addOperation({
//                print("Finished Operation Image 4")
//                self.imageView4.image = img4
//            })
//        }
        
        
        //MARK:-Section5 NSOperationQueue blockOperation
        let queue = OperationQueue()

        let operation1 = BlockOperation {
            print("Operation 1 Started")
            let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
            OperationQueue.main.addOperation {
                self.imageView1.image = img1
            }
        }
        
        operation1.completionBlock = {
            print("Operation 1 completed")
//            print("Operation 1 completed, cancelled:\(operation1.isCancelled) ")
        }
        queue.addOperation(operation1)
        
        
        let operation2 = BlockOperation {
            print("Operation 2 Started")
            let img2 = Downloader.downloadImageWithURL(url: imageURLs[1])
            OperationQueue.main.addOperation {
                self.imageView2.image = img2
            }
        }
        
        operation2.completionBlock = {
            print("Operation 2 completed")
//            print("Operation 2 completed, cancelled:\(operation2.isCancelled) ")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation {
            print("Operation 3 Started")
            let img3 = Downloader.downloadImageWithURL(url: imageURLs[2])
            OperationQueue.main.addOperation {
                self.imageView3.image = img3
            }
        }
        
        operation3.completionBlock = {
            print("Operation 3 completed")
//            print("Operation 3 completed, cancelled:\(operation3.isCancelled) ")
        }
        queue.addOperation(operation3)
        
        
        let operation4 = BlockOperation {
            print("Operation 4 Started")
            let img4 = Downloader.downloadImageWithURL(url: imageURLs[3])
            OperationQueue.main.addOperation {
                self.imageView4.image = img4
            }
        }
        
        operation4.completionBlock = {
            print("Operation 4 completed")
//            print("Operation 4 completed, cancelled:\(operation4.isCancelled) ")
        }
        queue.addOperation(operation4)
        
        
        //Next add the dependencies to test the cancel button
        //When you add these lines of code print the default statement in the completion blocks of operations and comment the print statement with isCancelled in each block.
        
        //MARK:-Section6
//        operation2.addDependency(operation1)
//        operation3.addDependency(operation2)
        
        
        
    }
    
    @IBAction func didClickOnCancel(_ sender: Any) {
        print("Cancelled")
        self.queue.cancelAllOperations()
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }
}

