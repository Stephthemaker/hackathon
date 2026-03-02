// Translation strings for English, Afrikaans, and isiXhosa.
//
// Usage: `translate(locale, 'key')` returns the translated string for the
// currently active locale stored in AppSettings.

enum AppLocale { en, af, xh }

extension AppLocaleLabel on AppLocale {
  String get label {
    switch (this) {
      case AppLocale.en:
        return 'English';
      case AppLocale.af:
        return 'Afrikaans';
      case AppLocale.xh:
        return 'isiXhosa';
    }
  }

  String get flag {
    switch (this) {
      case AppLocale.en:
        return '🇬🇧';
      case AppLocale.af:
        return '🇿🇦';
      case AppLocale.xh:
        return '🇿🇦';
    }
  }
}

const Map<String, Map<AppLocale, String>> _strings = {
  // ── Navigation ──────────────────────────────────────────────────────
  'nav.overview': {
    AppLocale.en: 'Overview',
    AppLocale.af: 'Oorsig',
    AppLocale.xh: 'Isishwankathelo',
  },
  'nav.staff': {
    AppLocale.en: 'Staff',
    AppLocale.af: 'Personeel',
    AppLocale.xh: 'Abasebenzi',
  },
  'nav.research': {
    AppLocale.en: 'Research',
    AppLocale.af: 'Navorsing',
    AppLocale.xh: 'Uphando',
  },
  'nav.programmes': {
    AppLocale.en: 'Programmes',
    AppLocale.af: 'Programme',
    AppLocale.xh: 'Iinkqubo',
  },
  'nav.news': {
    AppLocale.en: 'News & Events',
    AppLocale.af: 'Nuus & Geleenthede',
    AppLocale.xh: 'Iindaba & Imisitho',
  },
  'nav.resources': {
    AppLocale.en: 'Resources',
    AppLocale.af: 'Hulpbronne',
    AppLocale.xh: 'Izixhobo',
  },
  'nav.contact': {
    AppLocale.en: 'Contact',
    AppLocale.af: 'Kontak',
    AppLocale.xh: 'Qhagamshelana',
  },

  // ── App Shell / Brand ───────────────────────────────────────────────
  'brand.cs': {
    AppLocale.en: 'Computer Science',
    AppLocale.af: 'Rekenaarwetenskap',
    AppLocale.xh: 'ISayensi yeKhompyutha',
  },
  'brand.su': {
    AppLocale.en: 'Stellenbosch University',
    AppLocale.af: 'Universiteit Stellenbosch',
    AppLocale.xh: 'IYunivesithi yaseStellenbosch',
  },

  // ── Home Page ───────────────────────────────────────────────────────
  'home.badge': {
    AppLocale.en: 'STELLENBOSCH UNIVERSITY',
    AppLocale.af: 'UNIVERSITEIT STELLENBOSCH',
    AppLocale.xh: 'IYUNIVESITHI YASESTELLENBOSCH',
  },
  'home.title': {
    AppLocale.en: 'Department of\nComputer Science',
    AppLocale.af: 'Departement\nRekenaarwetenskap',
    AppLocale.xh: 'ISebe leSayensi\nyeKhompyutha',
  },
  'home.subtitle': {
    AppLocale.en:
        'Advancing computing knowledge through world-class research, innovative education, and meaningful impact across Africa and beyond.',
    AppLocale.af:
        'Ons bevorder rekenaarkennis deur wêreldklas-navorsing, innoverende onderwys en betekenisvolle impak oor Afrika en verder.',
    AppLocale.xh:
        'Siqhubela phambili ulwazi lweekhompyutha ngophando olukumgangatho ophezulu, imfundo entsha, kunye nefuthe elilandelekayo kuyo yonke iAfrika nangaphaya.',
  },
  'home.btn.programmes': {
    AppLocale.en: 'Explore Programmes',
    AppLocale.af: 'Verken Programme',
    AppLocale.xh: 'Hlola Iinkqubo',
  },
  'home.btn.research': {
    AppLocale.en: 'Our Research',
    AppLocale.af: 'Ons Navorsing',
    AppLocale.xh: 'Uphando Lwethu',
  },
  'home.about.label': {
    AppLocale.en: 'About',
    AppLocale.af: 'Oor Ons',
    AppLocale.xh: 'Malunga Nathi',
  },
  'home.about.title': {
    AppLocale.en: 'Who We Are',
    AppLocale.af: 'Wie Ons Is',
    AppLocale.xh: 'Singobani',
  },
  'home.quicklinks.label': {
    AppLocale.en: 'Explore',
    AppLocale.af: 'Verken',
    AppLocale.xh: 'Hlola',
  },
  'home.quicklinks.title': {
    AppLocale.en: 'Quick Links',
    AppLocale.af: 'Vinnige Skakels',
    AppLocale.xh: 'Amakhonkco Akhawulezayo',
  },
  'home.news.label': {
    AppLocale.en: 'Stay Updated',
    AppLocale.af: 'Bly Op Hoogte',
    AppLocale.xh: 'Hlala Usazi',
  },
  'home.news.title': {
    AppLocale.en: 'Latest News',
    AppLocale.af: 'Jongste Nuus',
    AppLocale.xh: 'Iindaba Zakutshanje',
  },

  // ── Stats ───────────────────────────────────────────────────────────
  'stats.faculty': {
    AppLocale.en: 'Faculty Members',
    AppLocale.af: 'Fakulteitslede',
    AppLocale.xh: 'Amalungu eFakhalthi',
  },
  'stats.students': {
    AppLocale.en: 'Students',
    AppLocale.af: 'Studente',
    AppLocale.xh: 'Abafundi',
  },
  'stats.groups': {
    AppLocale.en: 'Research Groups',
    AppLocale.af: 'Navorsingsgroepe',
    AppLocale.xh: 'Amaqela oPhando',
  },
  'stats.years': {
    AppLocale.en: 'Years of Excellence',
    AppLocale.af: 'Jare van Uitnemendheid',
    AppLocale.xh: 'Iminyaka yoBugcisa',
  },

  // ── Staff Page ──────────────────────────────────────────────────────
  'staff.label': {
    AppLocale.en: 'Our Team',
    AppLocale.af: 'Ons Span',
    AppLocale.xh: 'Iqela Lethu',
  },
  'staff.title': {
    AppLocale.en: 'Department Staff',
    AppLocale.af: 'Departementspersoneel',
    AppLocale.xh: 'Abasebenzi beSebe',
  },
  'staff.subtitle': {
    AppLocale.en:
        'Meet the academics and support staff who drive our teaching and research mission.',
    AppLocale.af:
        'Ontmoet die akademici en ondersteuningspersoneel wat ons onderwys- en navorsingsmissie dryf.',
    AppLocale.xh:
        'Diba nabasebenzi bezemfundo nabasebenzi abaxhasayo abaqhuba umsebenzi wethu wokufundisa nophando.',
  },
  'staff.search': {
    AppLocale.en: 'Search staff...',
    AppLocale.af: 'Soek personeel...',
    AppLocale.xh: 'Khangela abasebenzi...',
  },
  'staff.all': {
    AppLocale.en: 'All',
    AppLocale.af: 'Almal',
    AppLocale.xh: 'Bonke',
  },
  'staff.academic': {
    AppLocale.en: 'Academic Staff',
    AppLocale.af: 'Akademiese Personeel',
    AppLocale.xh: 'Abasebenzi beZemfundo',
  },
  'staff.admin': {
    AppLocale.en: 'Administrative Staff',
    AppLocale.af: 'Administratiewe Personeel',
    AppLocale.xh: 'Abasebenzi boLawulo',
  },

  // ── Research Page ───────────────────────────────────────────────────
  'research.label': {
    AppLocale.en: 'Research',
    AppLocale.af: 'Navorsing',
    AppLocale.xh: 'Uphando',
  },
  'research.title': {
    AppLocale.en: 'Research Groups',
    AppLocale.af: 'Navorsingsgroepe',
    AppLocale.xh: 'Amaqela oPhando',
  },
  'research.subtitle': {
    AppLocale.en:
        'Our department hosts several active research groups working on foundational and applied problems in computer science.',
    AppLocale.af:
        'Ons departement huisves verskeie aktiewe navorsingsgroepe wat werk aan grondliggende en toegepaste probleme in rekenaarwetenskap.',
    AppLocale.xh:
        'Isebe lethu lineqela ezininzi zophando ezisebenzayo kwimiba esisiseko nasekusetyenzisweni kwisayensi yekhompyutha.',
  },
  'research.focusareas': {
    AppLocale.en: 'Focus Areas',
    AppLocale.af: 'Fokusareas',
    AppLocale.xh: 'Iindawo zoKuqwalasela',
  },
  'research.members': {
    AppLocale.en: 'Members',
    AppLocale.af: 'Lede',
    AppLocale.xh: 'Amalungu',
  },
  'research.resources.label': {
    AppLocale.en: 'Resources',
    AppLocale.af: 'Hulpbronne',
    AppLocale.xh: 'Izixhobo',
  },
  'research.resources.title': {
    AppLocale.en: 'Research Resources',
    AppLocale.af: 'Navorsings Hulpbronne',
    AppLocale.xh: 'Izixhobo zoPhando',
  },

  // ── Programmes Page ─────────────────────────────────────────────────
  'prog.label': {
    AppLocale.en: 'Academics',
    AppLocale.af: 'Akademie',
    AppLocale.xh: 'Ezemfundo',
  },
  'prog.title': {
    AppLocale.en: 'Our Programmes',
    AppLocale.af: 'Ons Programme',
    AppLocale.xh: 'Iinkqubo Zethu',
  },
  'prog.subtitle': {
    AppLocale.en:
        'From undergraduate to doctoral level — rigorous, research-driven education in Computer Science.',
    AppLocale.af:
        'Van voorgraads tot doktorale vlak — streng, navorsingsgedrewe onderwys in rekenaarwetenskap.',
    AppLocale.xh:
        'Ukusuka kwinqanaba laseyunivesithi ukuya kwelezifundo zobugqirha — imfundo eqinileyo, eqhutywa luphando kwisayensi yekhompyutha.',
  },
  'prog.duration': {
    AppLocale.en: 'Duration',
    AppLocale.af: 'Tydsduur',
    AppLocale.xh: 'Ixesha',
  },
  'prog.entry': {
    AppLocale.en: 'Entry Requirements',
    AppLocale.af: 'Toelatingsvereistes',
    AppLocale.xh: 'Izidingo zoKungena',
  },
  'prog.modules.label': {
    AppLocale.en: 'Curriculum',
    AppLocale.af: 'Kurrikulum',
    AppLocale.xh: 'IKharityhulamu',
  },
  'prog.modules.title': {
    AppLocale.en: 'Module Catalogue',
    AppLocale.af: 'Modulekatalogus',
    AppLocale.xh: 'IKhathalogu yeModyuli',
  },

  // ── News & Events Page ──────────────────────────────────────────────
  'news.label': {
    AppLocale.en: 'Latest',
    AppLocale.af: 'Jongste',
    AppLocale.xh: 'Okutsha',
  },
  'news.title': {
    AppLocale.en: 'News & Events',
    AppLocale.af: 'Nuus & Geleenthede',
    AppLocale.xh: 'Iindaba & Imisitho',
  },
  'news.subtitle': {
    AppLocale.en:
        'Stay up to date with research breakthroughs, student milestones, and upcoming department events.',
    AppLocale.af:
        'Bly op hoogte met navorsingdeurbrake, studentemylpale en komende departementele geleenthede.',
    AppLocale.xh:
        'Hlala usazi ngeempumelelo zophando, iimeko zabalulekileyo zabafundi, kunye nemisitho esezayo yesebe.',
  },
  'news.all': {
    AppLocale.en: 'All',
    AppLocale.af: 'Alles',
    AppLocale.xh: 'Konke',
  },
  'news.upcoming': {
    AppLocale.en: 'Upcoming Events',
    AppLocale.af: 'Komende Geleenthede',
    AppLocale.xh: 'Imisitho Ezayo',
  },
  'news.noitems': {
    AppLocale.en: 'No items in this category.',
    AppLocale.af: 'Geen items in hierdie kategorie nie.',
    AppLocale.xh: 'Akukho zinto kolu luhlu.',
  },

  // ── Resources Page ──────────────────────────────────────────────────
  'res.label': {
    AppLocale.en: 'Student Hub',
    AppLocale.af: 'Studentesentrum',
    AppLocale.xh: 'Iziko Labafundi',
  },
  'res.title': {
    AppLocale.en: 'Student Resources',
    AppLocale.af: 'Studentehulpbronne',
    AppLocale.xh: 'Izixhobo Zabafundi',
  },
  'res.subtitle': {
    AppLocale.en:
        'Everything you need — from campus platforms to developer tools — in one place.',
    AppLocale.af:
        'Alles wat jy nodig het — van kampusplatforms tot ontwikkelaargereedskap — op een plek.',
    AppLocale.xh:
        'Yonke into oyidingayo — ukusuka kumaqonga ekhampasi ukuya kwizixhobo zophuhliso — kwindawo enye.',
  },
  'res.platforms': {
    AppLocale.en: 'Campus Platforms',
    AppLocale.af: 'Kampusplatforms',
    AppLocale.xh: 'Amaqonga eKhampasi',
  },
  'res.tools': {
    AppLocale.en: 'Developer Tools',
    AppLocale.af: 'Ontwikkelaargereedskap',
    AppLocale.xh: 'Izixhobo zoPhuhliso',
  },
  'res.faq': {
    AppLocale.en: 'Frequently Asked Questions',
    AppLocale.af: 'Gereelde Vrae',
    AppLocale.xh: 'Imibuzo Ebuzwa Rhoqo',
  },

  // ── Contact Page ────────────────────────────────────────────────────
  'contact.label': {
    AppLocale.en: 'Contact',
    AppLocale.af: 'Kontak',
    AppLocale.xh: 'Qhagamshelana',
  },
  'contact.title': {
    AppLocale.en: 'Get in Touch',
    AppLocale.af: 'Kontak Ons',
    AppLocale.xh: 'Siqhagamshelane',
  },
  'contact.subtitle': {
    AppLocale.en:
        'Reach out to the department for admissions enquiries, research collaboration, or general information.',
    AppLocale.af:
        'Skakel die departement vir toelatingsnavrae, navorsingssamewerking of algemene inligting.',
    AppLocale.xh:
        'Qhagamshelana nesebe malunga nemibuzo yokuvunywa, intsebenziswano yophando, okanye ulwazi ngokubanzi.',
  },
  'contact.form.title': {
    AppLocale.en: 'Send a Message',
    AppLocale.af: 'Stuur \'n Boodskap',
    AppLocale.xh: 'Thumela Umyalezo',
  },
  'contact.form.name': {
    AppLocale.en: 'Full Name',
    AppLocale.af: 'Volle Naam',
    AppLocale.xh: 'Igama Elipheleleyo',
  },
  'contact.form.email': {
    AppLocale.en: 'Email Address',
    AppLocale.af: 'E-posadres',
    AppLocale.xh: 'Idilesi ye-imeyile',
  },
  'contact.form.subject': {
    AppLocale.en: 'Subject',
    AppLocale.af: 'Onderwerp',
    AppLocale.xh: 'Isihloko',
  },
  'contact.form.message': {
    AppLocale.en: 'Your Message',
    AppLocale.af: 'Jou Boodskap',
    AppLocale.xh: 'Umyalezo Wakho',
  },
  'contact.form.send': {
    AppLocale.en: 'Send Message',
    AppLocale.af: 'Stuur Boodskap',
    AppLocale.xh: 'Thumela Umyalezo',
  },
  'contact.form.success': {
    AppLocale.en: 'Message Sent!',
    AppLocale.af: 'Boodskap Gestuur!',
    AppLocale.xh: 'Umyalezo Uthunyelwe!',
  },
  'contact.form.another': {
    AppLocale.en: 'Send another message',
    AppLocale.af: 'Stuur nog \'n boodskap',
    AppLocale.xh: 'Thumela omnye umyalezo',
  },
  'contact.info.title': {
    AppLocale.en: 'Contact Information',
    AppLocale.af: 'Kontakinligting',
    AppLocale.xh: 'Ulwazi Loqhagamshelwano',
  },
  'contact.info.address': {
    AppLocale.en: 'Address',
    AppLocale.af: 'Adres',
    AppLocale.xh: 'Idilesi',
  },
  'contact.info.phone': {
    AppLocale.en: 'Phone',
    AppLocale.af: 'Telefoon',
    AppLocale.xh: 'Ifoni',
  },
  'contact.info.email': {
    AppLocale.en: 'Email',
    AppLocale.af: 'E-pos',
    AppLocale.xh: 'I-imeyile',
  },
  'contact.info.hours': {
    AppLocale.en: 'Office Hours',
    AppLocale.af: 'Kantoorure',
    AppLocale.xh: 'Iiyure Zaseofisini',
  },

  // ── Footer ──────────────────────────────────────────────────────────
  'footer.brand': {
    AppLocale.en:
        'Advancing computer science through world-class research, innovative teaching, and community impact in Africa.',
    AppLocale.af:
        'Ons bevorder rekenaarwetenskap deur wêreldklas-navorsing, innoverende onderwys en gemeenskapsimpak in Afrika.',
    AppLocale.xh:
        'Siqhubela phambili isayensi yekhompyutha ngophando olukumgangatho ophezulu, ukufundisa okutsha, kunye nefuthe kuluntu eAfrika.',
  },
  'footer.department': {
    AppLocale.en: 'Department',
    AppLocale.af: 'Departement',
    AppLocale.xh: 'Isebe',
  },
  'footer.resources': {
    AppLocale.en: 'Resources',
    AppLocale.af: 'Hulpbronne',
    AppLocale.xh: 'Izixhobo',
  },
  'footer.links': {
    AppLocale.en: 'Useful Links',
    AppLocale.af: 'Nuttige Skakels',
    AppLocale.xh: 'Amakhonkco Aluncedo',
  },
  'footer.overview': {
    AppLocale.en: 'Overview',
    AppLocale.af: 'Oorsig',
    AppLocale.xh: 'Isishwankathelo',
  },
  'footer.academic': {
    AppLocale.en: 'Academic Staff',
    AppLocale.af: 'Akademiese Personeel',
    AppLocale.xh: 'Abasebenzi beZemfundo',
  },
  'footer.researchgroups': {
    AppLocale.en: 'Research Groups',
    AppLocale.af: 'Navorsingsgroepe',
    AppLocale.xh: 'Amaqela oPhando',
  },
  'footer.programmes': {
    AppLocale.en: 'Programmes',
    AppLocale.af: 'Programme',
    AppLocale.xh: 'Iinkqubo',
  },
  'footer.newsevents': {
    AppLocale.en: 'News & Events',
    AppLocale.af: 'Nuus & Geleenthede',
    AppLocale.xh: 'Iindaba & Imisitho',
  },
  'footer.studentres': {
    AppLocale.en: 'Student Resources',
    AppLocale.af: 'Studentehulpbronne',
    AppLocale.xh: 'Izixhobo Zabafundi',
  },
  'footer.contactus': {
    AppLocale.en: 'Contact Us',
    AppLocale.af: 'Kontak Ons',
    AppLocale.xh: 'Qhagamshelana Nathi',
  },

  // ── Settings Panel ──────────────────────────────────────────────────
  'settings.title': {
    AppLocale.en: 'Settings',
    AppLocale.af: 'Instellings',
    AppLocale.xh: 'Iisetingi',
  },
  'settings.language': {
    AppLocale.en: 'Language',
    AppLocale.af: 'Taal',
    AppLocale.xh: 'Ulwimi',
  },
  'settings.appearance': {
    AppLocale.en: 'Appearance',
    AppLocale.af: 'Voorkoms',
    AppLocale.xh: 'Imbonakalo',
  },
  'settings.darkmode': {
    AppLocale.en: 'Dark Mode',
    AppLocale.af: 'Donkermodus',
    AppLocale.xh: 'Imowudi Emnyama',
  },
  'settings.highcontrast': {
    AppLocale.en: 'High Contrast',
    AppLocale.af: 'Hoë Kontras',
    AppLocale.xh: 'Ukuchasana Okuphezulu',
  },
  'settings.fontsize': {
    AppLocale.en: 'Font Size',
    AppLocale.af: 'Lettergrootte',
    AppLocale.xh: 'Ubungakanani Bomfanekiso',
  },
  'settings.fontsize.small': {
    AppLocale.en: 'Small',
    AppLocale.af: 'Klein',
    AppLocale.xh: 'Encinane',
  },
  'settings.fontsize.medium': {
    AppLocale.en: 'Medium',
    AppLocale.af: 'Medium',
    AppLocale.xh: 'Ephakathi',
  },
  'settings.fontsize.large': {
    AppLocale.en: 'Large',
    AppLocale.af: 'Groot',
    AppLocale.xh: 'Enkulu',
  },
  'settings.reducemotion': {
    AppLocale.en: 'Reduce Motion',
    AppLocale.af: 'Verminder Beweging',
    AppLocale.xh: 'Nciphisa Intshukumo',
  },
  'settings.accessibility': {
    AppLocale.en: 'Accessibility',
    AppLocale.af: 'Toeganklikheid',
    AppLocale.xh: 'Ukufikeleleka',
  },
};

/// Look up a translated string for the given [locale].
/// Falls back to English when a key is missing.
String translate(AppLocale locale, String key) {
  final entry = _strings[key];
  if (entry == null) return key;
  return entry[locale] ?? entry[AppLocale.en] ?? key;
}
