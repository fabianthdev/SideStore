//
//  AppScreenshot.swift
//  SideStore
//
//  Created by Fabian Thies on 20.12.22.
//  Copyright © 2022 SideStore. All rights reserved.
//

import SwiftUI
import UIKit
import AsyncImage

struct AppScreenshot: View {
    let url: URL
    var apectRatio: CGFloat = 9/16
    
    static let processor = Self.ScreenshotProcessor()
    
    var body: some View {
        Text("")
//        AsyncImage(url: self.url, processor: Self.processor) { image in
//            image
//                .resizable()
//        } placeholder: {
//            Rectangle()
//                .foregroundColor(.secondary)
//        }
//        .aspectRatio(aspectRatio, contentMode: .fit)
//        .cornerRadius(8)
    }
}

extension AppScreenshot {
    class ScreenshotProcessor: ImageProcessor {
        func process(image: UIImage) -> UIImage {
            guard let cgImage = image.cgImage, image.size.width > image.size.height else { return image }
            
            let rotatedImage = UIImage(cgImage: cgImage, scale: image.scale, orientation: .right)
            return rotatedImage
        }
    }
}
