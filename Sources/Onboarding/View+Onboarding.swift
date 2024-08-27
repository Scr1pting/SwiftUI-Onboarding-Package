//
//
//  File.swift
//  
//
//  Created by Jonas B on 27.08.24.
//  Copyright © 2024 Jonas B. All rights reserved.
//
    

#if canImport(SwiftUI)
import SwiftUI

@available(iOS 14.0, macOS 13.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    /// Adds an onboarding sheet to a view that opens once initially.
    /// Whether the view has been shown already is saved under a custom
    /// key.
    /// - Parameters:
    ///   - title: The title of the onboarding sheet
    ///   - elements: Each element
    ///   - key: A custom key that is used for saving whether the sheet
    ///   has been already shown in UserDefault. Defaults to
    ///   "hasShownOnboarding."
    /// - Returns: a view with the attached sheet.
    public func onboarding(
        title: String,
        elements: [OnboardingElement],
        key: String = "hasShownOnboarding"
    ) -> some View {
        modifier(
            OnboardingSheet<EmptyView>(
                title: title,
                elements: elements,
                key: key
            )
        )
    }
    
    /// Adds an onboarding sheet to a view that opens once initially.
    /// Whether the view has been shown already is saved under a custom
    /// key.
    ///
    /// To dismiss the sheet in a custom view, use:
    ///
    ///     @Environment(\.dismiss) private var dismiss
    ///
    /// - Parameters:
    ///   - title: The title of the onboarding sheet
    ///   - elements: Each element
    ///   - key: A custom key that is used for saving whether the sheet
    ///   has been already shown in UserDefaults
    ///   - nextView: The next view the continue button navigates to.
    /// - Returns: a view with the attached sheet.
    public func onboarding(
        title: String,
        elements: [OnboardingElement],
        key: String,
        nextView: some View
    ) -> some View {
        modifier(
            OnboardingSheet(
                title: title,
                elements: elements,
                key: key,
                nextView: nextView
            )
        )
    }
}
#endif
