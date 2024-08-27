//
//  OnboardingElement.swift
//
//  Created by Jonas B on 30.07.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//
    

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingElement: Identifiable {
    public let id = UUID()
    
    let image: Image
    let header: String
    let description: String
    
    public init(image: Image, header: String, description: String) {
        self.image = image
        self.header = header
        self.description = description
    }
}
#endif
