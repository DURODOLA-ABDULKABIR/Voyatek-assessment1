//
//  AddFood + ImagePicker.swift
//  Menu
//
//  Created by Abdulkabir MAc on 22/02/2025.
//

import UIKit
import AVFoundation

extension AddFoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func openPicker(isCamera : Bool) {
        let picker = UIImagePickerController()
        
        if isCamera {
            if UIImagePickerController.isCameraDeviceAvailable(.front) || UIImagePickerController.isCameraDeviceAvailable(.rear) {
                picker.sourceType = .camera
            }
            else if AVCaptureDevice.authorizationStatus(for: .video) == .denied || AVCaptureDevice.authorizationStatus(for: .video) == .restricted {
                self.openAlert(message: "no permission to open camera")
            }
            else {
                self.openAlert(message: "no camera detected")
            }
        }
        else {
            picker.sourceType = .photoLibrary
        }
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) {
            picker.dismiss(animated: true, completion: nil)
            images.append(image)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func openAlert(message: String) {
        let alertController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
