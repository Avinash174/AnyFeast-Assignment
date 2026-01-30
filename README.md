# AnyFeast Assignment

A modern meal planning application built with Flutter, focusing on a premium user experience and smooth onboarding flows.

## 🚀 Key Features

### Premium Onboarding Flow

A structured, 5-step onboarding process designed to maximize user retention and clarity.

- **Welcome Screen**: Immersive, full-screen intro with entrance animations.
- **Dietary Preferences**: Interactive selection with staggered card animations.
- **Location Permission**: Explains the value of location data with a pulsing visual cue.
- **Personalization**: Simple name input for a tailored experience.
- **Completion**: A "Success" state with a glowing checkmark and meal preview.

### UI & UX Enhancements ("What I Did")

I addressed several initial design gaps to improve the app's feel:

| Problem                  | Solution Implemented                                                                                                    |
| ------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| **Static Experience**    | Integrated `flutter_animate` to add smooth entrance animations (fade, slide, scale) across all screens.                 |
| **Broken Immersion**     | Removed the system status bar on the Welcome screen for a cleaner, full-screen splash experience.                       |
| **Inconsistent Visuals** | Replaced custom animations with the `AvatarGlow` widget on the Location screen to match the Completion screen's polish. |
| **High Cognitive Load**  | Broke down complex forms into single-focus steps with clear "Why I need this" subheadings.                              |

## 🛠 Tech Stack

- **Framework**: Flutter
- **Typography**: `google_fonts` (Inter)
- **Animations**: `flutter_animate`, `avatar_glow`
- **Asset Management**: `flutter_svg`
- **State Management**: `StatefulWidget` (Local state for onboarding)

## 🏃‍♂️ Getting Started

1. **Get Dependencies**

   ```bash
   flutter pub get
   ```

2. **Run the App**
   ```bash
   flutter run
   ```
