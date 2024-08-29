//
//  OnboardingView.swift
//
//  Created by Jonas B on 30.07.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//


#if canImport(SwiftUI)
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingView {
    @Binding var showOnboarding: Bool
    
    let title: String
    let elements: [OnboardingElement]
    
    public init(showOnboarding: Binding<Bool>, title: String, elements: [OnboardingElement]) {
        self._showOnboarding = showOnboarding
        self.title = title
        self.elements = elements
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            OnboardingContent(title: title, elements: elements)
            
            Button(action: {
                showOnboarding = false
            }) {
                ContinueButtonContent(title: "Continue")
            }
            .padding(.bottom, 45)
        }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingViewLinked<Destination>: View where Destination: View {
    let title: String
    let elements: [OnboardingElement]
    @ViewBuilder let nextView: Destination
    
    public init(title: String, elements: [OnboardingElement], nextView: Destination) {
        self.title = title
        self.elements = elements
        self.nextView = nextView
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            OnboardingContent(title: title, elements: elements)
            
            NavigationLink(destination: nextView) {
                ContinueButtonContent(title: "Continue")
            }
            .padding(.bottom, 45)
        }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct ContinueButtonContent: View {
    let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        HStack {
            Spacer()
            Text(title)
            Spacer()
        }
        .bold()
        .padding()
        .foregroundColor(.white)
        .background(Color.accentColor)
        .clipShape(.rect(cornerRadius: 15))
        .frame(maxWidth: maxWidth)
    }
    
    let maxWidth: CGFloat = 650
}
#endif
