# galleery-app

In questo progetto vedremo praticamente i concetti appresi nella sezione UI/UX Avanzata del mio corso su Flutter e Dart su Udemy. L'obiettivo è sviluppare un'app di galleria fotografica che si adatti a diverse dimensioni e orientazioni dello schermo, utilizzeremo un tema personalizzato con estensioni e supporti la modalità scura. Inoltre anche animazioni per le transizioni tra le immagini e le schermate.

## Layout Responsive:
- Utilizzo di LayoutBuilder e MediaQuery;
- Gestione delle orientazioni;
- SafeArea e spaziatura.
## Theming Avanzato:
- Creazione di un tema personalizzato;
- Implementazione della Dark Mode;
- Utilizzo di Theme Extensions.
## Animazioni:
- Hero Animations;
- Animated Widgets;
- Custom Animations.
## Gestione dei Dati UI:
- FutureBuilder o StreamBuilder;
- Gestione degli errori.

## Struttura dei File

lib/

├── main.dart

├── theme/

│   ├── app_theme.dart

│   └── custom_theme_extensions.dart

├── models/

│   └── photo_item.dart

├── pages/

│   ├── gallery_page.dart

│   └── photo_detail_page.dart

├── widgets/

│   └── photo_grid_item.dart

└── services/
    └── photo_service.dart
