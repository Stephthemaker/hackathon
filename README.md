# CS Department — Stellenbosch University

A modern, animated Flutter Web application showcasing the Department of Computer Science at Stellenbosch University. Built for the **Terrain Analysis Lecture Slides: 2026** hackathon.

## Features

- **7 fully designed pages** — Home, Staff, Research, Programmes, News & Events, Resources, Contact
- **Custom 3D animations** — Interactive hero background with node-graph physics, scroll-responsive wireframe globe, parallax 3D elements
- **3D tilt-on-hover cards** — Mouse-tracking perspective transforms on all interactive cards
- **Scroll-triggered reveal animations** — Sections animate in with fade/slide/fold effects
- **Responsive design** — Desktop, tablet, and mobile layouts with adaptive navigation
- **Frosted-glass nav bar** — Morphs from transparent to floating pill on scroll
- **Embedded Google Maps** — Contact page with interactive location embed
- **Clean URL routing** — `go_router` with fade page transitions and 404 error page

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter Web (Dart) |
| Design System | Material 3 + custom SU brand theme |
| Routing | go_router 17.x |
| Typography | Google Fonts (Playfair Display + Inter) |
| Animations | flutter_animate + custom `CustomPainter` |
| Links | url_launcher |

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run in Chrome
flutter run -d chrome

# Build for production
flutter build web
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── pages/                 # 7 content pages + 404
├── router/                # GoRouter configuration
├── theme/                 # SU brand colors & typography
└── ui/
    ├── layout/            # AppShell with nav bar
    └── widgets/           # Reusable animated components
```

## Pages

| Route | Description |
|-------|-------------|
| `/` | Hero section, stats, about, quick links, news preview |
| `/staff` | Searchable staff directory with filter chips |
| `/research` | Tabbed view: research groups, publications, labs |
| `/programmes` | Programme cards + expandable module catalogue |
| `/news` | News articles with category filters + events sidebar |
| `/resources` | Student resource links + FAQ accordion |
| `/contact` | Contact form, department info, Google Maps embed |

## Brand

Uses official Stellenbosch University colours:
- **Confident Maroon** `#61223B`
- **Brilliant Gold** `#B79962`
