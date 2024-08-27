//
//  OnboardingView.swift
//
//  Created by Jonas B on 30.07.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//


#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingView<Destination>: View where Destination: View {
    @Binding var showOnboarding: Bool
    
    private let title: String
    private let elements: [OnboardingElement]
    private var nextView: Destination? = nil
    
    public init(showOnboarding: Binding<Bool>, title: String, elements: [OnboardingElement]) where Destination == EmptyView {
        self._showOnboarding = showOnboarding
        self.title = title
        self.elements = elements
    }
    
    public init(showOnboarding: Binding<Bool>, title: String, elements: [OnboardingElement], nextView: Destination) {
        self._showOnboarding = showOnboarding
        self.title = title
        self.elements = elements
        self.nextView = nextView
    }
    
    public var body: some View {
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
            
            Group {
                if nextView == nil {
                    Button(action: {
                        showOnboarding = false
                    } ){
                        continueButtonContent
                    }
                } else {
                    NavigationLink(destination: nextView) {
                        continueButtonContent
                    }
                }
            }
            .padding(.bottom, 45)
        }
        .frame(maxWidth: maxWidth)
        .padding(.horizontal, 25)
    }
    
    var continueButtonContent: some View {
        HStack {
            Spacer()
            Text("Continue")
            Spacer()
        }
        .bold()
        .padding()
        .foregroundColor(.white)
        .background(Color.accentColor)
        .clipShape(.rect(cornerRadius: 15))
        .frame(maxWidth: maxWidth)
    }
    
    // MARK: - Drawing constants
    
    let imageSize: CGFloat = 33
    let imageTextSpacing: CGFloat = 1
    let intraTextSpacing: CGFloat = 3
    let elementSpacing: CGFloat = 25
    let maxWidth: CGFloat = 650
}
#endif
