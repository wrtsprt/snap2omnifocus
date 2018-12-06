//
//  ViewController.swift
//  Snap2Omnifocus
//
//  Created by rap on 06/12/2018.
//  Copyright © 2018 me.wrtsprt.labs.rrr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.allowsEditing = false

    }

    override func viewDidAppear(_ animated: Bool) {
        self.present(imagePicker, animated: true, completion: nil)
    }


}
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        debugPrint("image got poocken")
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let imageData:Data = image.jpegData(compressionQuality: 0.7)!
        let imageString = imageData.base64EncodedString()
        
        let ofUrl = "omnifocus:///add?name=MyImage&attachment-name=img.png&attachment=" + imageString
        
        UIApplication.shared.open(URL(string: ofUrl)!)
    }
    
}
extension ViewController : UINavigationControllerDelegate {
    
}
