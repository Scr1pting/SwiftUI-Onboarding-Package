# Onboarding

Modular package recreating the onboarding experience in Apple's native app.
Written only with SwiftUI.

## Syntax

```swift
import Onboarding

struct ContentView: View {
    @State var showOnboarding = true
    
    let onboardingElements = [
        OnboardingElement(
            image: Image(systemName: "hare"),
            header: "Smart",
            description: "Full of the latest AI features"
        ),
        OnboardingElement(
            image: Image(systemName: "hare"),
            header: "Fast",
            description: "No lagging, no delays."
        ),
        OnboardingElement(
            image: Image(systemName: "lock.fill"),
            header: "Private",
            description: "Your data stays yours. Promised."
        )

    ]
    
    var body: some View {
        HomeView()
            .sheet(isPresented: $showOnboarding) {
                OnboardingView(
                    showOnboarding: $showOnboarding,
                    title: "Allrounder App"
                    elements: onboardingElements
                )
            }
    }
}
```

