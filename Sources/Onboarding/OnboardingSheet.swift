//
//
//  SwiftUIView.swift
//  
//
//  Created by Jonas B on 27.08.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//
    

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
internal struct OnboardingSheet<Destination>: ViewModifier where Destination: View {
    private let title: String
    private let elements: [OnboardingElement]
    private let key: String
    private var nextView: Destination? = nil

    @State var showOnboarding: Bool {
        didSet {
            UserDefaults.standard.setValue(!showOnboarding, forKey: key)
        }
    }
    
    init(title: String, elements: [OnboardingElement], key: String) {
        self.title = title
        self.elements = elements
        self.key = key
        self.showOnboarding = !UserDefaults.standard.bool(forKey: key)
    }
    
    init(title: String, elements: [OnboardingElement], key: String, nextView: Destination) {
        self.title = title
        self.elements = elements
        self.key = key
        self.nextView = nextView
        self.showOnboarding = !UserDefaults.standard.bool(forKey: key)
    }
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $showOnboarding) {
                OnboardingView(
                    showOnboarding: $showOnboarding,
                    title: title,
                    elements: elements,
                    nextView: nextView
                )
            }
            .interactiveDismissDisabled()
    }
}
#endif
