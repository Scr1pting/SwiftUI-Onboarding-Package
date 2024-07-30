//
//  OnboardingView.swift
//
//  Created by Jonas B on 30.07.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//


#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    
    let title: String
    let elements: [OnboardingElement]
    
    public init(showOnboarding: Binding<Bool>, title: String, elements: [OnboardingElement]) {
        self._showOnboarding = showOnboarding
        self.title = title
        self.elements = elements
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Spacer()
                    
                    if geometry.size.width > maxWidth  {
                        Text(title)
                            .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            .padding(.top, 50)
                            .padding(.bottom, 50)
                    } else {
                        Text(title)
                            .font(.title)
                            .padding(.top, 35)
                            .padding(.bottom, 40)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(elements) { element in
                            HStack(spacing: imageTextSpacing) {
                                element.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: imageSize, height: imageSize)
                                    .foregroundColor(.accentColor)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(element.header)
                                        .font(.headline)
                                    Text(element.description)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 23)
                    
                    Spacer()
                    Spacer()
                    
                    Button(action: {
                        showOnboarding = false
                    } ){
                        Text("Continue")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .padding()
                            .frame(width: geometry.size.width > 450 ? 450 : geometry.size.width)
                        
                    }
                    .padding(.bottom, 40)
                }
                .frame(maxWidth: maxWidth)
            }
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Drawing constants
    
    let imageSize: CGFloat = 50
    let imageTextSpacing: CGFloat = 20
    let maxWidth: CGFloat = 650
}
#endif
