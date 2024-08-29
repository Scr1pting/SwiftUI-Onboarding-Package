//
//  OnboardingView.swift
//
//  Created by Jonas B on 30.07.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//


#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingView {
    @Binding var showOnboarding: Bool
    
    private let title: String
    private let elements: [OnboardingElement]
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            OnboardingContent(title: title, elements: elements)
            
            Button(action: {
                showOnboarding = false
            }) {
                ContinueButtonContent()
            }
            .padding(.bottom, 45)
        }
    }
}

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
public struct OnboardingViewLinked<Destination>: View where Destination: View {
    private let title: String
    private let elements: [OnboardingElement]
    @ViewBuilder private let nextView: Destination
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            OnboardingContent(title: title, elements: elements)
            
            NavigationLink(destination: nextView) {
                ContinueButtonContent()
            }
            .padding(.bottom, 45)
        }
    }
}

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
private struct ContinueButtonContent: View {
    var body: some View {
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
    
    let maxWidth: CGFloat = 650
}
#endif
