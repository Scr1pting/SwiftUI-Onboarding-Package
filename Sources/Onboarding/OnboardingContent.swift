//
//
//  OnboardingContent.swift
//
//
//  Created by Jonas B on 29.08.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//
    

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
struct OnboardingContent {
    private let title: String
    private let elements: [OnboardingElement]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 80)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: elementSpacing) {
                    ForEach(elements) { element in
                        HStack(spacing: imageTextSpacing) {
                            element.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: imageSize, height: imageSize)
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading, spacing: intraTextSpacing) {
                                Text(element.header)
                                    .bold()
                                Text(element.description)
                                    .foregroundColor(.secondary)
                            }
                            .font(.callout)
                            .padding(.horizontal)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.leading, 13)
            
            Spacer()
            Spacer()
        }
        .frame(maxWidth: maxWidth)
        .padding(.horizontal, 25)
    }
    
    // MARK: - Drawing constants
    
    let imageSize: CGFloat = 33
    let imageTextSpacing: CGFloat = 1
    let intraTextSpacing: CGFloat = 3
    let elementSpacing: CGFloat = 25
    let maxWidth: CGFloat = 650
}
