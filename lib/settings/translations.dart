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
  'home.about.label2': {
    AppLocale.en: 'About',
    AppLocale.af: 'Oor Ons',
    AppLocale.xh: 'Malunga Nathi',
  },
  'home.about.title2': {
    AppLocale.en: 'Who We Are',
    AppLocale.af: 'Wie Ons Is',
    AppLocale.xh: 'Singobani',
  },
  'home.about.p1': {
    AppLocale.en:
        'The Department of Computer Science at Stellenbosch University is one of the leading CS departments in Africa, with a strong focus on both theoretical foundations and practical applications.',
    AppLocale.af:
        'Die Departement Rekenaarwetenskap aan die Universiteit Stellenbosch is een van die voorste RS-departemente in Afrika, met \'n sterk fokus op sowel teoretiese grondslae as praktiese toepassings.',
    AppLocale.xh:
        'ISebe leSayensi yeKhompyutha kwiYunivesithi yaseStellenbosch lelinye lamasebe aphambili eSayensi yeKhompyutha e-Afrika, elinokugxila okuqinileyo kwiziseko zethiyori kunye nezicelo ezisebenzayo.',
  },
  'home.about.p2': {
    AppLocale.en:
        'Our research spans artificial intelligence, software engineering, computer vision, algorithms, information security, and networked systems — with real-world impact across numerous industries.',
    AppLocale.af:
        'Ons navorsing strek oor kunsmatige intelligensie, sagteware-ingenieurswese, rekenaarvisie, algoritmes, inligtingsekuriteit en netwerkstelsels — met werklike impak oor talle bedrywe.',
    AppLocale.xh:
        'Uphando lwethu luquka ubukrelekrele bokwenziwa, ubunjineli besoftwe, imbono yekhompyutha, ii-algorithimu, ukhuseleko lwenkcazelo, kunye neenkqubo zenethiwekhi — kunye nefuthe lokwenyani kwimizi-mveliso emininzi.',
  },
  'home.about.p3': {
    AppLocale.en:
        'We offer undergraduate and postgraduate programmes that equip students with the skills needed to thrive in a rapidly evolving digital landscape.',
    AppLocale.af:
        'Ons bied voor- en nagraadse programme wat studente toerus met die vaardighede wat nodig is om te floreer in \'n vinnig veranderende digitale landskap.',
    AppLocale.xh:
        'Sinikeza iinkqubo zabafundi abangaphantsi nabaphezu kwesidanga ezixhobisa abafundi ngezakhono ezifunekayo ukuze baphumelele kumhlaba wediijithali otshintsha ngokukhawuleza.',
  },
  'home.about.btn_admissions': {
    AppLocale.en: 'Apply Now',
    AppLocale.af: 'Dien Nou Aan',
    AppLocale.xh: 'Faka Isicelo Ngoku',
  },
  'home.about.h1.title': {
    AppLocale.en: 'Top-Ranked',
    AppLocale.af: 'Topgerangskik',
    AppLocale.xh: 'Ikwindawo Ephezulu',
  },
  'home.about.h1.body': {
    AppLocale.en:
        'Consistently rated among the top CS departments in Africa by international ranking bodies.',
    AppLocale.af:
        'Konsekwent onder die top RS-departemente in Afrika volgens internasionale ranglysliggame.',
    AppLocale.xh:
        'Ihlala iphakathi kwamasebe aphezulu eSayensi yeKhompyutha e-Afrika ngokwemibutho yamanqaku amazwe ngamazwe.',
  },
  'home.about.h2.title': {
    AppLocale.en: 'Research Impact',
    AppLocale.af: 'Navorsingsimpak',
    AppLocale.xh: 'Ifuthe loPhando',
  },
  'home.about.h2.body': {
    AppLocale.en:
        'Our seven research groups publish extensively in top-tier international conferences and journals.',
    AppLocale.af:
        'Ons sewe navorsingsgroepe publiseer uitgebreid in top internasionale konferensies en vaktydskrifte.',
    AppLocale.xh:
        'Amaqela ethu asixhenxe ophando apapasha ngokubanzi kwiinkomfa neejenali zamazwe ngamazwe ezikumgangatho ophezulu.',
  },
  'home.about.h3.title': {
    AppLocale.en: 'Global Network',
    AppLocale.af: 'Wêreldwye Netwerk',
    AppLocale.xh: 'Uthungelwano Lwehlabathi',
  },
  'home.about.h3.body': {
    AppLocale.en:
        'Strong industry partnerships and international collaborations across four continents.',
    AppLocale.af:
        'Sterk bedryfsvennootskappe en internasionale samewerkings oor vier kontinente.',
    AppLocale.xh:
        'Ubuhlakani obululo neshishini kunye nentsebenziswano yamazwe ngamazwe kwizwekazi ezine.',
  },
  'home.scroll_explore': {
    AppLocale.en: 'Scroll to explore',
    AppLocale.af: 'Blaai om te verken',
    AppLocale.xh: 'Skrola ukuze uhlole',
  },
  'home.stats.academic': {
    AppLocale.en: 'Academic Staff',
    AppLocale.af: 'Akademiese Personeel',
    AppLocale.xh: 'Abasebenzi Bezifundo',
  },
  'home.stats.students': {
    AppLocale.en: 'Students Enrolled',
    AppLocale.af: 'Studente Ingeskryf',
    AppLocale.xh: 'Abafundi Ababhalisweyo',
  },
  'home.stats.research': {
    AppLocale.en: 'Research Projects',
    AppLocale.af: 'Navorsingsprojekte',
    AppLocale.xh: 'Iiprojekthi zoPhando',
  },
  'footer.copyright': {
    AppLocale.en:
        '© 2026 Department of Computer Science, Stellenbosch University.',
    AppLocale.af:
        '© 2026 Departement Rekenaarwetenskap, Universiteit Stellenbosch.',
    AppLocale.xh:
        '© 2026 ISebe leSayensi yeKhompyutha, IYunivesithi yaseStellenbosch.',
  },
  'footer.address': {
    AppLocale.en: 'Private Bag X1, Matieland 7602',
    AppLocale.af: 'Privaatsak X1, Matieland 7602',
    AppLocale.xh: 'IPrivate Bag X1, Matieland 7602',
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

  'home.stats.inafrica': {
    AppLocale.en: 'In Africa*',
    AppLocale.af: 'In Afrika*',
    AppLocale.xh: 'E-Afrika*',
  },

  'home.quick.prog.title': {
    AppLocale.en: 'Programmes',
    AppLocale.af: 'Programme',
    AppLocale.xh: 'Iinkqubo',
  },
  'home.quick.prog.body': {
    AppLocale.en: 'BSc, Honours, Masters & PhD offerings.',
    AppLocale.af: 'BSc, Honneurs, Meesters & PhD-aanbiedinge.',
    AppLocale.xh: 'BSc, ii-Honours, ii-Masters kwaye PhD.',
  },
  'home.quick.staff.title': {
    AppLocale.en: 'Faculty & Staff',
    AppLocale.af: 'Fakulteit & Personeel',
    AppLocale.xh: 'Abasebenzi',
  },
  'home.quick.staff.body': {
    AppLocale.en: 'Meet our researchers and lecturers.',
    AppLocale.af: 'Ontmoet ons navorsers en dosente.',
    AppLocale.xh: 'Dibana nabaphandi kwakunye nabahlohli bethu.',
  },
  'home.quick.research.title': {
    AppLocale.en: 'Research',
    AppLocale.af: 'Navorsing',
    AppLocale.xh: 'Uphando',
  },
  'home.quick.research.body': {
    AppLocale.en: 'Groups, labs, and publications.',
    AppLocale.af: 'Groepe, laboratoriums, en publikasies.',
    AppLocale.xh: 'Amaqela, iilabhu, kunye nopapasho.',
  },
  'home.quick.news.title': {
    AppLocale.en: 'News & Events',
    AppLocale.af: 'Nuus & Gebeure',
    AppLocale.xh: 'Iindaba & Iziganeko',
  },
  'home.quick.news.body': {
    AppLocale.en: 'Seminars, deadlines, and announcements.',
    AppLocale.af: 'Seminare, spertye, en aankondigings.',
    AppLocale.xh: 'Iinkqubo, imida yexesha, kunye nezaziso.',
  },
  'home.quick.resources.title': {
    AppLocale.en: 'Resources',
    AppLocale.af: 'Hulpbronne',
    AppLocale.xh: 'Izixhobo',
  },
  'home.quick.resources.body': {
    AppLocale.en: 'Forms, FAQs, and student links.',
    AppLocale.af: 'Vorms, Algemene Vrae, en studenteskakels.',
    AppLocale.xh: 'Iifomu, Imibuzo Ebuzwa Rhoqo, kunye namakhonkco wabaFundi.',
  },
  'home.quick.contact.title': {
    AppLocale.en: 'Contact',
    AppLocale.af: 'Kontak',
    AppLocale.xh: 'Qhagamshela',
  },
  'home.quick.contact.body': {
    AppLocale.en: 'Find us on campus.',
    AppLocale.af: 'Vind ons op kampus.',
    AppLocale.xh: 'Sifumane kwikhampasi.',
  },

  // ── Home – remaining ──────────────────────────────────────────────
  'home.quick.label': {
    AppLocale.en: 'Navigate',
    AppLocale.af: 'Navigeer',
    AppLocale.xh: 'Zulisa',
  },
  'home.quick.heading': {
    AppLocale.en: 'What are you looking for?',
    AppLocale.af: 'Waarna soek jy?',
    AppLocale.xh: 'Ufuna ntoni?',
  },
  'home.quick.learn_more': {
    AppLocale.en: 'Learn more',
    AppLocale.af: 'Lees meer',
    AppLocale.xh: 'Funda ngakumbi',
  },
  'home.news.all_news': {
    AppLocale.en: 'All news',
    AppLocale.af: 'Alle nuus',
    AppLocale.xh: 'Zonke iindaba',
  },
  'home.news.item1.title': {
    AppLocale.en: "Prof. Smith's AI Lab receives R10M NRF Grant",
    AppLocale.af: "Prof. Smith se KI-laboratorium ontvang R10M NNS-toekenning",
    AppLocale.xh: "ILab ye-AI kaProf. Smith ifumene isixa se-R10M se-NRF",
  },
  'home.news.item1.date': {
    AppLocale.en: 'March 2026',
    AppLocale.af: 'Maart 2026',
    AppLocale.xh: 'Matshi 2026',
  },
  'home.news.item1.body': {
    AppLocale.en:
        'Research funding secured for a multi-year project on large language models for African languages.',
    AppLocale.af:
        'Navorsingsbefondsing verseker vir \'n meerjarige projek oor groot taalmodelle vir Afrikatale.',
    AppLocale.xh:
        'Inkxaso-mali yophando ifunyenwe kwiprojekthi yeminyaka emininzi yemodeli yeelwimi zaseAfrika.',
  },
  'home.news.item2.title': {
    AppLocale.en: 'CS Olympiad Finals — SU Students shine',
    AppLocale.af: 'RW-Olimpiade Finaal — US-studente blink uit',
    AppLocale.xh: 'I-CS Olympiad Finals — Abafundi beSU baqaqambe',
  },
  'home.news.item2.date': {
    AppLocale.en: 'February 2026',
    AppLocale.af: 'Februarie 2026',
    AppLocale.xh: 'Februwari 2026',
  },
  'home.news.item2.body': {
    AppLocale.en:
        'Three Stellenbosch teams place in the top ten at the national ACM ICPC Southern Africa regionals.',
    AppLocale.af:
        'Drie Stellenbosch-spanne plaas in die top tien by die nasionale ACM ICPC Suider-Afrika-streekskompetisie.',
    AppLocale.xh:
        'Amaqela amathathu aseStellenbosch angene kwishumi lokuqala kwiACM ICPC yaseMzantsi Afrika.',
  },
  'home.news.item3.title': {
    AppLocale.en: 'Upcoming: Research Colloquium 2026',
    AppLocale.af: 'Binnekort: Navorsingskollokwium 2026',
    AppLocale.xh: 'Ezayo: Ingxoxo Yophando 2026',
  },
  'home.news.item3.date': {
    AppLocale.en: '15 April 2026',
    AppLocale.af: '15 April 2026',
    AppLocale.xh: '15 Apreli 2026',
  },
  'home.news.item3.body': {
    AppLocale.en:
        'Annual internal research colloquium. All postgrad students are invited to submit abstracts by 30 March.',
    AppLocale.af:
        'Jaarlikse interne navorsingskollokwium. Alle nagraadse studente word genooi om opsommings teen 30 Maart in te dien.',
    AppLocale.xh:
        'Ingxoxo yonyaka yophando lwangaphakathi. Bonke abafundi basemva kwesidanga bayamenywa ukuba bangenise izishwankathelo phambi kwe-30 Matshi.',
  },

  // ── Staff ──────────────────────────────────────────────────────────
  'staff.filter.all': {
    AppLocale.en: 'All',
    AppLocale.af: 'Almal',
    AppLocale.xh: 'Bonke',
  },
  'staff.filter.theory': {
    AppLocale.en: 'Theory & Algorithms',
    AppLocale.af: 'Teorie & Algoritmes',
    AppLocale.xh: 'Ithiyori & Ii-algorithm',
  },
  'staff.filter.se': {
    AppLocale.en: 'Software Engineering',
    AppLocale.af: 'Sagteware-ingenieurswese',
    AppLocale.xh: 'Ubunjineli beSoftware',
  },
  'staff.filter.ai': {
    AppLocale.en: 'Artificial Intelligence',
    AppLocale.af: 'Kunsmatige Intelligensie',
    AppLocale.xh: 'Ubukrelekrele Obambekayo',
  },
  'staff.filter.cv': {
    AppLocale.en: 'Computer Vision',
    AppLocale.af: 'Rekenaarvisie',
    AppLocale.xh: 'Imbonakalo Yekhompyutha',
  },
  'staff.filter.sci': {
    AppLocale.en: 'Science & Engineering',
    AppLocale.af: 'Wetenskap & Ingenieurswese',
    AppLocale.xh: 'INzululwazi & Ubunjineli',
  },
  'staff.filter.sec': {
    AppLocale.en: 'Information Security',
    AppLocale.af: 'Inligtingsekuriteit',
    AppLocale.xh: 'Ukhuseleko Lolwazi',
  },
  'staff.filter.networks': {
    AppLocale.en: 'Networks & Systems',
    AppLocale.af: 'Netwerke & Stelsels',
    AppLocale.xh: 'Iinethiwekhi & Iinkqubo',
  },
  'staff.sort.name_asc': {
    AppLocale.en: 'Name (A–Z)',
    AppLocale.af: 'Naam (A–Z)',
    AppLocale.xh: 'Igama (A–Z)',
  },
  'staff.sort.name_desc': {
    AppLocale.en: 'Name (Z–A)',
    AppLocale.af: 'Naam (Z–A)',
    AppLocale.xh: 'Igama (Z–A)',
  },
  'staff.sort.title': {
    AppLocale.en: 'Title',
    AppLocale.af: 'Titel',
    AppLocale.xh: 'ISihloko',
  },
  'staff.sort.group': {
    AppLocale.en: 'Group',
    AppLocale.af: 'Groep',
    AppLocale.xh: 'Iqela',
  },
  'staff.section.academic': {
    AppLocale.en: 'Academic Staff',
    AppLocale.af: 'Akademiese Personeel',
    AppLocale.xh: 'Abasebenzi Bezemfundo',
  },
  'staff.search.hint': {
    AppLocale.en: 'Search by name, title, group, or focus area…',
    AppLocale.af: 'Soek volgens naam, titel, groep, of fokusarea…',
    AppLocale.xh: 'Khangela ngegama, isihloko, iqela, okanye indawo yokugxila…',
  },
  'staff.sort.label': {
    AppLocale.en: 'Sort by',
    AppLocale.af: 'Sorteer volgens',
    AppLocale.xh: 'Hlela ngoku',
  },
  'staff.section.admin': {
    AppLocale.en: 'Administrative Staff',
    AppLocale.af: 'Administratiewe Personeel',
    AppLocale.xh: 'Abasebenzi Bolawulo',
  },
  'staff.empty': {
    AppLocale.en: 'No staff found.',
    AppLocale.af: 'Geen personeel gevind nie.',
    AppLocale.xh: 'Akukho basebenzi bafumanekileyo.',
  },

  // ── Contact ────────────────────────────────────────────────────────
  'contact.subject.general': {
    AppLocale.en: 'General Enquiry',
    AppLocale.af: 'Algemene Navraag',
    AppLocale.xh: 'Umbuzo Ngokubanzi',
  },
  'contact.subject.ug_admissions': {
    AppLocale.en: 'Undergraduate Admissions',
    AppLocale.af: 'Voorgraadse Toelating',
    AppLocale.xh: 'Ukwamkelwa Kwabafundi Abangaphantsi',
  },
  'contact.subject.pg_admissions': {
    AppLocale.en: 'Postgraduate Admissions',
    AppLocale.af: 'Nagraadse Toelating',
    AppLocale.xh: 'Ukwamkelwa Kwabafundi Basemva Kwesidanga',
  },
  'contact.subject.research': {
    AppLocale.en: 'Research Collaboration',
    AppLocale.af: 'Navorsingsamewerking',
    AppLocale.xh: 'Intsebenziswano Yophando',
  },
  'contact.subject.industry': {
    AppLocale.en: 'Industry Partnership',
    AppLocale.af: 'Bedryfsvennootskap',
    AppLocale.xh: 'Intsebenziswano neZorhwebo',
  },
  'contact.subject.media': {
    AppLocale.en: 'Media / Press',
    AppLocale.af: 'Media / Pers',
    AppLocale.xh: 'Amajelo Eendaba / Oonondaba',
  },
  'contact.subject.it_support': {
    AppLocale.en: 'IT Support',
    AppLocale.af: 'IT-Ondersteuning',
    AppLocale.xh: 'Inkxaso ye-IT',
  },
  'contact.success.title': {
    AppLocale.en: 'Message Sent!',
    AppLocale.af: 'Boodskap Gestuur!',
    AppLocale.xh: 'Umyalezo Uthunyelwe!',
  },
  'contact.success.body': {
    AppLocale.en:
        "Thank you {name}. We'll respond to {email} within two business days.",
    AppLocale.af:
        "Dankie {name}. Ons sal binne twee werksdae na {email} reageer.",
    AppLocale.xh:
        "Enkosi {name}. Siza kuphendula ku-{email} ngeentsuku ezimbini zomsebenzi.",
  },
  'contact.btn.send_another': {
    AppLocale.en: 'Send another message',
    AppLocale.af: 'Stuur nog \'n boodskap',
    AppLocale.xh: 'Thumela omnye umyalezo',
  },
  'contact.form.heading': {
    AppLocale.en: 'Send a Message',
    AppLocale.af: 'Stuur \'n Boodskap',
    AppLocale.xh: 'Thumela Umyalezo',
  },
  'contact.form.email_error': {
    AppLocale.en: 'Enter a valid email',
    AppLocale.af: 'Voer \'n geldige e-posadres in',
    AppLocale.xh: 'Faka idilesi ye-imeyile echanekileyo',
  },
  'contact.btn.send': {
    AppLocale.en: 'Send Message',
    AppLocale.af: 'Stuur Boodskap',
    AppLocale.xh: 'Thumela Umyalezo',
  },
  'contact.form.required': {
    AppLocale.en: 'Required',
    AppLocale.af: 'Verpligtend',
    AppLocale.xh: 'Kuyafuneka',
  },
  'contact.form.mailto_note': {
    AppLocale.en:
        'This will open your default email client. You can also email us directly at info@cs.sun.ac.za.',
    AppLocale.af:
        'Dit sal jou versteke e-poskliënt oopmaak. Jy kan ons ook direk e-pos by info@cs.sun.ac.za.',
    AppLocale.xh:
        'Oku kuya kuvula umthumeli we-imeyile wakho. Ungathumela i-imeyile kuthi ngqo ku info@cs.sun.ac.za.',
  },
  'contact.info.heading': {
    AppLocale.en: 'Contact Details',
    AppLocale.af: 'Kontakbesonderhede',
    AppLocale.xh: 'Iinkcukacha Zoqhagamshelwano',
  },
  'contact.key_contacts.heading': {
    AppLocale.en: 'Key Contacts',
    AppLocale.af: 'Belangrike Kontakte',
    AppLocale.xh: 'Iinkcukacha Ezibalulekileyo',
  },
  'contact.key_contacts.ug_office': {
    AppLocale.en: 'Undergraduate Office',
    AppLocale.af: 'Voorgraadse Kantoor',
    AppLocale.xh: 'I-Ofisi Yabafundi Abangaphantsi',
  },
  'contact.key_contacts.pg_office': {
    AppLocale.en: 'Postgraduate Office',
    AppLocale.af: 'Nagraadse Kantoor',
    AppLocale.xh: 'I-Ofisi Yabafundi Basemva Kwesidanga',
  },
  'contact.key_contacts.research_office': {
    AppLocale.en: 'Research Office',
    AppLocale.af: 'Navorsingsekantoor',
    AppLocale.xh: 'I-Ofisi Yophando',
  },
  'contact.key_contacts.it_support': {
    AppLocale.en: 'IT & Lab Support',
    AppLocale.af: 'IT & Lab-ondersteuning',
    AppLocale.xh: 'Inkxaso ye-IT & yeLab',
  },

  // ── Not Found ──────────────────────────────────────────────────────
  'notfound.title': {
    AppLocale.en: 'Page Not Found',
    AppLocale.af: 'Bladsy Nie Gevind Nie',
    AppLocale.xh: 'Iphepha Alifumanekanga',
  },
  'notfound.body': {
    AppLocale.en:
        "The page you're looking for doesn't exist or has been moved.",
    AppLocale.af: 'Die bladsy waarna jy soek bestaan nie of is verskuif.',
    AppLocale.xh: 'Iphepha olifunayo alikho okanye lisusiwe.',
  },
  'notfound.btn.home': {
    AppLocale.en: 'Back to Home',
    AppLocale.af: 'Terug na Tuis',
    AppLocale.xh: 'Buyela eKhaya',
  },

  // ── News & Events Page ──────────────────────────────────────────────
  'news.cat.all': {
    AppLocale.en: 'All',
    AppLocale.af: 'Alles',
    AppLocale.xh: 'Konke',
  },
  'news.cat.research': {
    AppLocale.en: 'Research',
    AppLocale.af: 'Navorsing',
    AppLocale.xh: 'Uphando',
  },
  'news.cat.awards': {
    AppLocale.en: 'Awards',
    AppLocale.af: 'Toekennings',
    AppLocale.xh: 'Amabhaso',
  },
  'news.cat.events': {
    AppLocale.en: 'Events',
    AppLocale.af: 'Gebeure',
    AppLocale.xh: 'Iziganeko',
  },
  'news.cat.student_life': {
    AppLocale.en: 'Student Life',
    AppLocale.af: 'Studentelewe',
    AppLocale.xh: 'Ubomi Babafundi',
  },
  'news.cat.industry': {
    AppLocale.en: 'Industry',
    AppLocale.af: 'Bedryf',
    AppLocale.xh: 'Irhwebo',
  },
  'news.empty': {
    AppLocale.en: 'No articles in this category.',
    AppLocale.af: 'Geen artikels in hierdie kategorie nie.',
    AppLocale.xh: 'Akukho manqaku kweli qela.',
  },
  'news.events.heading': {
    AppLocale.en: 'Upcoming Events',
    AppLocale.af: 'Opkomende Gebeure',
    AppLocale.xh: 'Iziganeko Ezizayo',
  },

  // ── Programmes ──────────────────────────────────────────────────────
  'prog.level.undergrad': {
    AppLocale.en: 'Undergraduate',
    AppLocale.af: 'Voorgraads',
    AppLocale.xh: 'Ongaphantsi kweSidanga',
  },
  'prog.level.honours': {
    AppLocale.en: 'Honours',
    AppLocale.af: 'Honneurs',
    AppLocale.xh: 'Ii-Honours',
  },
  'prog.level.postgrad': {
    AppLocale.en: 'Postgraduate',
    AppLocale.af: 'Nagraads',
    AppLocale.xh: 'Emva kweSidanga',
  },
  'prog.level.doctoral': {
    AppLocale.en: 'Doctoral',
    AppLocale.af: 'Doktoraal',
    AppLocale.xh: 'EbuGqirha',
  },
  'prog.bsc.name': {
    AppLocale.en: 'BSc Computer Science',
    AppLocale.af: 'BSc Rekenaarwetenskap',
    AppLocale.xh: 'BSc yeNzululwazi yeKhompyutha',
  },
  'prog.bsc.blurb': {
    AppLocale.en:
        'Undergraduate degrees including a major in Computer Science covering programming fundamentals, data structures, algorithms, software engineering, and elective streams.',
    AppLocale.af:
        'Voorgraadse grade insluitend \'n hoofvak in Rekenaarwetenskap wat programmeringsgrondslae, datastrukture, algoritmes, sagteware-ingenieurswese en keuserigtings dek.',
    AppLocale.xh:
        'Izidanga zangaphantsi ezibandakanya isifundo esikhulu kwiNzululwazi yeKhompyutha esigubungela iziseko zokuprograma, izakhiwo zedatha, ii-algorithms, ubunjineli besoftware, kunye nezikhondo zokukhethwa.',
  },
  'prog.bsc.duration': {
    AppLocale.en: '3 years full-time',
    AppLocale.af: '3 jaar voltyds',
    AppLocale.xh: 'Iminyaka emi-3 ixesha elizeleyo',
  },
  'prog.bsc.requirements': {
    AppLocale.en: 'NSC with required Mathematics & Physical Sciences',
    AppLocale.af: 'NSS met vereiste Wiskunde & Fisiese Wetenskappe',
    AppLocale.xh: 'I-NSC kunye neMathematika & iNzululwazi yeNtlalo efunekayo',
  },
  'prog.hons.name': {
    AppLocale.en: 'BScHons Computer Science',
    AppLocale.af: 'BScHons Rekenaarwetenskap',
    AppLocale.xh: 'BScHons yeNzululwazi yeKhompyutha',
  },
  'prog.hons.blurb': {
    AppLocale.en:
        'An intensive 1-year programme building on the BSc, with advanced coursework in algorithms, machine learning, compilers, and a compulsory research component.',
    AppLocale.af:
        '\'n Intensiewe 1-jaar program wat voortbou op die BSc, met gevorderde kursuswerk in algoritmes, masjienleer, samestellers en \'n verpligte navorsingskomponent.',
    AppLocale.xh:
        'Inkqubo eqinileyo yonyaka olu-1 eyakhela kwi-BSc, kunye nomsebenzi ophambili kwii-algorithms, ukufunda komatshini, ii-compilers, kunye neqhina lophando elinyanzelekileyo.',
  },
  'prog.hons.duration': {
    AppLocale.en: '1 year full-time',
    AppLocale.af: '1 jaar voltyds',
    AppLocale.xh: 'Unyaka oyi-1 ixesha elizeleyo',
  },
  'prog.hons.requirements': {
    AppLocale.en: "BSc CS with ≥ 60% average in CS modules",
    AppLocale.af: "BSc RW met ≥ 60% gemiddeld in RW-modules",
    AppLocale.xh: "BSc CS enye-60% okanye ngaphezulu kwiimoduli ze-CS",
  },
  'prog.msc.name': {
    AppLocale.en: 'MSc Computer Science',
    AppLocale.af: 'MSc Rekenaarwetenskap',
    AppLocale.xh: 'MSc yeNzululwazi yeKhompyutha',
  },
  'prog.msc.blurb': {
    AppLocale.en:
        'Thesis-based research programme allowing deep specialisation under supervision of an NRF-rated researcher.',
    AppLocale.af:
        'Tesisgebaseerde navorsingsprogram wat diep spesialisasie onder toesig van \'n NNS-gegradeerde navorser toelaat.',
    AppLocale.xh:
        'Inkqubo yophando engumsebenzi wethisisi evumela ukugxila kwinto ethile phantsi kokhokelo lomphandi owabelwe yi-NRF.',
  },
  'prog.msc.duration': {
    AppLocale.en: '1–2 years',
    AppLocale.af: '1–2 jaar',
    AppLocale.xh: 'Iminyaka eyi-1–2',
  },
  'prog.msc.requirements': {
    AppLocale.en: "BScHons CS with ≥ 60% average",
    AppLocale.af: "BScHons RW met ≥ 60% gemiddeld",
    AppLocale.xh: "BScHons CS ene-60% okanye ngaphezulu",
  },
  'prog.phd.name': {
    AppLocale.en: 'PhD Computer Science',
    AppLocale.af: 'PhD Rekenaarwetenskap',
    AppLocale.xh: 'PhD yeNzululwazi yeKhompyutha',
  },
  'prog.phd.blurb': {
    AppLocale.en:
        'Dissertation-based programme for candidates aiming to contribute original knowledge to the field.',
    AppLocale.af:
        'Proefskrifgebaseerde program vir kandidate wat beoog om oorspronklike kennis tot die veld by te dra.',
    AppLocale.xh:
        'Inkqubo engumsebenzi wesidanga esiphezulu yabatyunjwa abajolise ekunikezeleni ulwazi olutsha kulo mkhakha.',
  },
  'prog.phd.duration': {
    AppLocale.en: '3–5 years',
    AppLocale.af: '3–5 jaar',
    AppLocale.xh: 'Iminyaka eyi-3–5',
  },
  'prog.phd.requirements': {
    AppLocale.en: 'MSc CS or equivalent research degree',
    AppLocale.af: 'MSc RW of ekwivalente navorsingsgraad',
    AppLocale.xh: 'I-MSc CS okanye isidanga sohlobo olufanayo sophando',
  },
  'prog.stats.programmes': {
    AppLocale.en: 'Degree Programmes',
    AppLocale.af: 'Graadprogramme',
    AppLocale.xh: 'Iinkqubo zeSidanga',
  },
  'prog.stats.modules': {
    AppLocale.en: 'Modules Offered',
    AppLocale.af: 'Modules Aangebied',
    AppLocale.xh: 'Iimoduli Ezinikwayo',
  },
  'prog.stats.ranking': {
    AppLocale.en: 'CS Dept in Africa',
    AppLocale.af: 'RW-departement in Afrika',
    AppLocale.xh: 'Isebe le-CS eAfrika',
  },
  'prog.stats.established': {
    AppLocale.en: 'Year Established',
    AppLocale.af: 'Jaar Gestig',
    AppLocale.xh: 'Unyaka Owasekwayo',
  },
  'prog.cta.badge': {
    AppLocale.en: 'Applications Open',
    AppLocale.af: 'Aansoeke Oop',
    AppLocale.xh: 'Izicelo Zivuliwe',
  },
  'prog.cta.title': {
    AppLocale.en: 'Ready to Apply?',
    AppLocale.af: 'Gereed om Aansoek te Doen?',
    AppLocale.xh: 'Ulungile Ukufaka Isicelo?',
  },
  'prog.cta.body': {
    AppLocale.en:
        'Applications for 2027 open on 1 March. Prepare your\ndocuments and apply online through the SU portal.',
    AppLocale.af:
        'Aansoeke vir 2027 open op 1 Maart. Berei jou\ndokumente voor en doen aanlyn aansoek deur die US-portaal.',
    AppLocale.xh:
        'Izicelo ze-2027 zivula nge-1 kaMatshi. Lungisa\namaxwebhu akho uze ufake isicelo nge-intanethi ngeportal yeSU.',
  },
  'prog.cta.btn.apply': {
    AppLocale.en: 'Apply Online',
    AppLocale.af: 'Doen Aanlyn Aansoek',
    AppLocale.xh: 'Faka Isicelo Nge-intanethi',
  },
  'prog.cta.btn.email': {
    AppLocale.en: 'Email Admissions',
    AppLocale.af: 'E-pos Toelating',
    AppLocale.xh: 'I-imeyile Yokwamkelwa',
  },
  'prog.modules.heading': {
    AppLocale.en: 'Module Catalogue',
    AppLocale.af: 'Modulekatalogus',
    AppLocale.xh: 'Ikhathalogi yeeModuli',
  },
  'prog.modules.subtitle': {
    AppLocale.en:
        "Select a year to browse modules — tap any row to expand its description.",
    AppLocale.af:
        "Kies \'n jaar om modules te blaai — tik op enige ry om die beskrywing uit te brei.",
    AppLocale.xh:
        "Khetha unyaka ukuze ubrowse iimoduli — cofa nayiphi na irow ukuze wandise inkcazo yayo.",
  },
  'prog.tab.yr1': {
    AppLocale.en: '1st Year',
    AppLocale.af: '1ste Jaar',
    AppLocale.xh: 'Unyaka woku-1',
  },
  'prog.tab.yr2': {
    AppLocale.en: '2nd Year',
    AppLocale.af: '2de Jaar',
    AppLocale.xh: 'Unyaka wesi-2',
  },
  'prog.tab.yr3': {
    AppLocale.en: '3rd Year',
    AppLocale.af: '3de Jaar',
    AppLocale.xh: 'Unyaka wesi-3',
  },
  'prog.tab.honours': {
    AppLocale.en: 'Honours',
    AppLocale.af: 'Honneurs',
    AppLocale.xh: 'Ii-Honours',
  },
  'prog.cta.docs.heading': {
    AppLocale.en: 'Documents Required',
    AppLocale.af: 'Vereiste Dokumente',
    AppLocale.xh: 'Amaxwebhu Afunekayo',
  },
  'prog.cta.docs.transcripts': {
    AppLocale.en: 'Certified academic transcripts',
    AppLocale.af: 'Gesertifiseerde akademiese transkripsies',
    AppLocale.xh: 'Iitranskripsioni zezemfundo eziqinisekisiweyo',
  },
  'prog.cta.docs.nsc': {
    AppLocale.en: 'National Senior Certificate',
    AppLocale.af: 'Nasionale Senior Sertifikaat',
    AppLocale.xh: 'ISatifiketi eSikhulu Sesizwe',
  },
  'prog.cta.docs.id': {
    AppLocale.en: 'South African ID or passport copy',
    AppLocale.af: 'Suid-Afrikaanse ID of paspoortkopie',
    AppLocale.xh: 'I-ID yaseMzantsi Afrika okanye ikopi yepaspoti',
  },
  'prog.cta.docs.english': {
    AppLocale.en: 'Proof of English proficiency',
    AppLocale.af: 'Bewys van Engelse vaardigheid',
    AppLocale.xh: 'Ubungqina bobuchule besiNgesi',
  },
  'prog.module.credits': {
    AppLocale.en: 'credits',
    AppLocale.af: 'krediete',
    AppLocale.xh: 'iikhredithi',
  },

  // ── Research Page ───────────────────────────────────────────────────
  'research.official_links': {
    AppLocale.en: 'OFFICIAL LINKS',
    AppLocale.af: 'AMPTELIKE SKAKELS',
    AppLocale.xh: 'AMAKHONKCO ASEMTHETHWENI',
  },
  'research.current_members': {
    AppLocale.en: 'CURRENT MEMBERS',
    AppLocale.af: 'HUIDIGE LEDE',
    AppLocale.xh: 'AMALUNGU AKHOYO',
  },
  'research.staff_directory': {
    AppLocale.en: 'Full staff directory →',
    AppLocale.af: 'Volledige personeelgids →',
    AppLocale.xh: 'Uluhlu olupheleleyo lwabasebenzi →',
  },
  'research.tools.label': {
    AppLocale.en: 'Tools',
    AppLocale.af: 'Gereedskap',
    AppLocale.xh: 'Izixhobo',
  },
  'research.tools.title': {
    AppLocale.en: 'Research Tools & Projects',
    AppLocale.af: 'Navorsingsgereedskap & Projekte',
    AppLocale.xh: 'Izixhobo & Iiprojekthi Zophando',
  },
  'research.tools.subtitle': {
    AppLocale.en:
        'Software and platforms produced by our research groups, available for academic use.',
    AppLocale.af:
        'Sagteware en platforms wat deur ons navorsingsgroepe vervaardig is, beskikbaar vir akademiese gebruik.',
    AppLocale.xh:
        'IiSoftware kunye neeplatfom ezenziwe ngamaqela ethu ophando, ezifumanekayo kusetyenziswo kwezemfundo.',
  },
  'research.tools.all_resources': {
    AppLocale.en: 'All Resources',
    AppLocale.af: 'Alle Hulpbronne',
    AppLocale.xh: 'Zonke Izixhobo',
  },
  'research.banner.title': {
    AppLocale.en: 'Interested in Research?',
    AppLocale.af: 'Stel jy belang in Navorsing?',
    AppLocale.xh: 'Unomdla kuPhando?',
  },
  'research.banner.body': {
    AppLocale.en:
        'Our research groups actively supervise Honours, Masters, and PhD students. Explore our programmes or contact the department to discuss opportunities.',
    AppLocale.af:
        'Ons navorsingsgroepe begelei aktief Honneurs-, Meesters- en PhD-studente. Verken ons programme of kontak die departement om geleenthede te bespreek.',
    AppLocale.xh:
        'Amaqela ethu ophando avelela ngamandla abafundi bee-Honours, iMasters, kunye nePhD. Hlola iinkqubo zethu okanye uqhagamshelane nesebe ukuze uxoxe ngeethuba.',
  },
  'research.banner.btn.programmes': {
    AppLocale.en: 'Explore Programmes',
    AppLocale.af: 'Verken Programme',
    AppLocale.xh: 'Hlola Iinkqubo',
  },
  'research.banner.btn.contact': {
    AppLocale.en: 'Contact the Department',
    AppLocale.af: 'Kontak die Departement',
    AppLocale.xh: 'Qhagamshelana neSebe',
  },

  // ── Resources Page ──────────────────────────────────────────────────
  'res.section.quick_links': {
    AppLocale.en: 'Quick Links',
    AppLocale.af: 'Vinnige Skakels',
    AppLocale.xh: 'Amakhonkco Akhawulezayo',
  },
  'res.section.dev_tools': {
    AppLocale.en: 'Developer & Study Tools',
    AppLocale.af: 'Ontwikkelaar- & Studeergereedskap',
    AppLocale.xh: 'Izixhobo Zomvelisi & Zokufunda',
  },
  'res.section.faq': {
    AppLocale.en: 'Frequently Asked Questions',
    AppLocale.af: 'Gereeld Gevraagde Vrae',
    AppLocale.xh: 'Imibuzo Ebuzwa Rhoqo',
  },
  'res.section.dates': {
    AppLocale.en: 'Important Dates — 2026',
    AppLocale.af: 'Belangrike Datums — 2026',
    AppLocale.xh: 'Imihla Ebalulekileyo — 2026',
  },
  'res.link.sunlearn.name': {
    AppLocale.en: 'SUNLearn',
    AppLocale.af: 'SUNLearn',
    AppLocale.xh: 'SUNLearn',
  },
  'res.link.sunlearn.desc': {
    AppLocale.en:
        'Course content, assignments, grades, and lecture recordings.',
    AppLocale.af: 'Kursusinhoud, opdragte, punte en lesing-opnames.',
    AppLocale.xh:
        'Umxholo wekosi, imisebenzi, amanqaku, kunye neerekhodi zeeleksa.',
  },
  'res.link.lab.name': {
    AppLocale.en: 'CS Lab Booking',
    AppLocale.af: 'RW Lab-bespreking',
    AppLocale.xh: 'Ukubhukisha iLab ye-CS',
  },
  'res.link.lab.desc': {
    AppLocale.en:
        'Reserve a computer lab session for practicals or project work.',
    AppLocale.af:
        'Bespreek \'n rekenaarlabsessie vir praktiese werk of projekte.',
    AppLocale.xh:
        'Gcina iseshoni yelab yekhompyutha yokusebenza okwenyani okanye omsebenzi weprojekthi.',
  },
  'res.link.library.name': {
    AppLocale.en: 'Library E-Resources',
    AppLocale.af: 'Biblioteek E-hulpbronne',
    AppLocale.xh: 'I-E-Resources zeThala leeNcwadi',
  },
  'res.link.library.desc': {
    AppLocale.en:
        'IEEE Xplore, ACM DL, Springer, and more scholarly databases.',
    AppLocale.af:
        'IEEE Xplore, ACM DL, Springer, en meer akademiese databasisse.',
    AppLocale.xh:
        'IEEE Xplore, ACM DL, Springer, kunye needathabheyisi zophando.',
  },
  'res.link.eduroam.name': {
    AppLocale.en: 'eduroam Setup',
    AppLocale.af: 'eduroam-opstelling',
    AppLocale.xh: 'Ukuseta i-eduroam',
  },
  'res.link.eduroam.desc': {
    AppLocale.en:
        'Wireless access across campus and partner institutions worldwide.',
    AppLocale.af:
        'Draadlose toegang oor die kampus en vennootinstellings wêreldwyd.',
    AppLocale.xh:
        'Ukufikelela okungenazintambo kuwo wonke ikhampasi kunye namaziko alingane kwihlabathi.',
  },
  'res.link.hpc.name': {
    AppLocale.en: 'Stellenbosch HPC',
    AppLocale.af: 'Stellenbosch HPC',
    AppLocale.xh: 'I-HPC yaseStellenbosch',
  },
  'res.link.hpc.desc': {
    AppLocale.en: 'High-performance computing cluster for research workloads.',
    AppLocale.af: 'Hoëprestasie-rekenaarkluster vir navorsingswerkslading.',
    AppLocale.xh: 'Iklaster yekhompyutha esebenza kakuhle yomsebenzi wophando.',
  },
  'res.link.helpdesk.name': {
    AppLocale.en: 'IT Help Desk',
    AppLocale.af: 'IT-hulptoonbank',
    AppLocale.xh: 'Idesika Yoncedo ye-IT',
  },
  'res.link.helpdesk.desc': {
    AppLocale.en: '24/7 technical support portal for students and staff.',
    AppLocale.af:
        '24/7 tegniese ondersteuningsportaal vir studente en personeel.',
    AppLocale.xh:
        'Iportal yenkxaso yobuchwepheshe ye-24/7 yabafundi kunye nabasebenzi.',
  },
  'res.tool.github.name': {
    AppLocale.en: 'GitHub Student Pack',
    AppLocale.af: 'GitHub-studentepakket',
    AppLocale.xh: 'IPhekethi Yomfundi ye-GitHub',
  },
  'res.tool.github.desc': {
    AppLocale.en:
        'Free developer tools, domains, and cloud credits for students.',
    AppLocale.af:
        'Gratis ontwikkelaargereedskap, domeine en wolkkrediete vir studente.',
    AppLocale.xh:
        'Izixhobo zasimahla zomvelisi, iidomeini, kunye neekhredithi zecloud zabafundi.',
  },
  'res.tool.jetbrains.name': {
    AppLocale.en: 'JetBrains Toolbox',
    AppLocale.af: 'JetBrains-gereedskapis',
    AppLocale.xh: 'IBhokisi Yezixhobo ye-JetBrains',
  },
  'res.tool.jetbrains.desc': {
    AppLocale.en:
        'Free professional IDEs (IntelliJ, PyCharm, CLion) with university email.',
    AppLocale.af:
        'Gratis professionele IDE\'s (IntelliJ, PyCharm, CLion) met universiteits-e-pos.',
    AppLocale.xh:
        'Ii-IDE ezisimahla zobungcali (IntelliJ, PyCharm, CLion) nge-imeyile yeyunivesithi.',
  },
  'res.tool.azure.name': {
    AppLocale.en: 'Azure for Students',
    AppLocale.af: 'Azure vir Studente',
    AppLocale.xh: 'I-Azure yaBafundi',
  },
  'res.tool.azure.desc': {
    AppLocale.en:
        'Free Azure credits and services for learning cloud computing.',
    AppLocale.af:
        'Gratis Azure-krediete en dienste om wolkrekenaarkunde te leer.',
    AppLocale.xh:
        'Iikhredithi zesimahla ze-Azure kunye neenkonzo zokufunda nge-cloud computing.',
  },
  'res.tool.overleaf.name': {
    AppLocale.en: 'Overleaf',
    AppLocale.af: 'Overleaf',
    AppLocale.xh: 'Overleaf',
  },
  'res.tool.overleaf.desc': {
    AppLocale.en:
        'Collaborative LaTeX editor for writing research papers and theses.',
    AppLocale.af:
        'Samewerkende LaTeX-redakteur vir die skryf van navorsingsartikels en proefskrifte.',
    AppLocale.xh:
        'Umhleli we-LaTeX wentsebenziswano wokubhala amaphepha ophando kunye neethisisi.',
  },
  'res.date.1.label': {
    AppLocale.en: 'Applications open for 2027 intake',
    AppLocale.af: 'Aansoeke open vir 2027-inname',
    AppLocale.xh: 'Izicelo zivuliwe ze-2027',
  },
  'res.date.2.label': {
    AppLocale.en: 'Semester 2 registration deadline',
    AppLocale.af: 'Semester 2-registrasie sperdatum',
    AppLocale.xh: 'Umhla wokugqibela wokubhalisa kweSemesta yesi-2',
  },
  'res.date.3.label': {
    AppLocale.en: 'CS Research Colloquium',
    AppLocale.af: 'RW Navorsingskollokwium',
    AppLocale.xh: 'Ingxoxo yoPhando ye-CS',
  },
  'res.date.4.label': {
    AppLocale.en: 'Honours project showcase',
    AppLocale.af: 'Honneurs-projekuitstalling',
    AppLocale.xh: 'Umboniso weprojekthi ye-Honours',
  },
  'res.date.5.label': {
    AppLocale.en: 'Graduation ceremony',
    AppLocale.af: 'Gradeseremonie',
    AppLocale.xh: 'Umsitho wesidanga',
  },
  'res.date.6.label': {
    AppLocale.en: 'Exam results released',
    AppLocale.af: 'Eksamenuitslae vrygestel',
    AppLocale.xh: 'Iziphumo zeemviwo zikhutshiwe',
  },

  // ── News Detail Page ────────────────────────────────────────────────
  'news.back': {
    AppLocale.en: '← Back to News & Events',
    AppLocale.af: '← Terug na Nuus & Geleenthede',
    AppLocale.xh: '← Buyela kwiNdaba & Imisitho',
  },
  'news.share': {
    AppLocale.en: 'Share this article',
    AppLocale.af: 'Deel hierdie artikel',
    AppLocale.xh: 'Yabelana ngenqaku',
  },
  'news.copy_link': {
    AppLocale.en: 'Copy Link',
    AppLocale.af: 'Kopieer Skakel',
    AppLocale.xh: 'Kopa Ikhonkco',
  },
  'news.link_copied': {
    AppLocale.en: 'Link copied to clipboard',
    AppLocale.af: 'Skakel gekopieer',
    AppLocale.xh: 'Ikhonkco likopelwe',
  },
  'news.related': {
    AppLocale.en: 'Related Articles',
    AppLocale.af: 'Verwante Artikels',
    AppLocale.xh: 'Amanqaku Ahlobeneyo',
  },

  // ── Events Calendar ─────────────────────────────────────────────────
  'news.events.add_cal': {
    AppLocale.en: 'Add to Calendar',
    AppLocale.af: 'Voeg by Kalender',
    AppLocale.xh: 'Yongeza kwiKhalenda',
  },

  // ── Programme Detail Page ───────────────────────────────────────────
  'prog.detail.overview': {
    AppLocale.en: 'Programme Overview',
    AppLocale.af: 'Program Oorsig',
    AppLocale.xh: 'Isishwankathelo seNkqubo',
  },
  'prog.detail.requirements': {
    AppLocale.en: 'Entry Requirements',
    AppLocale.af: 'Toelatingsvereistes',
    AppLocale.xh: 'Iimfuno zokuNgena',
  },
  'prog.detail.curriculum': {
    AppLocale.en: 'Curriculum',
    AppLocale.af: 'Kurrikulum',
    AppLocale.xh: 'IKharityhulam',
  },
  'prog.detail.careers': {
    AppLocale.en: 'Career Paths',
    AppLocale.af: 'Loopbaanpaaie',
    AppLocale.xh: 'Iindlela zomSebenzi',
  },
  'prog.detail.apply_title': {
    AppLocale.en: 'Ready to Apply?',
    AppLocale.af: 'Gereed om Aansoek te Doen?',
    AppLocale.xh: 'Ulungele ukuFaka isiCelo?',
  },
  'prog.detail.apply_body': {
    AppLocale.en:
        'Start your journey in Computer Science at Stellenbosch University.',
    AppLocale.af:
        'Begin jou reis in Rekenaarwetenskap by Universiteit Stellenbosch.',
    AppLocale.xh:
        'Qala uhambo lwakho kwiSayensi yeKhompyutha eYunivesithi yaseStellenbosch.',
  },
  'prog.detail.apply_btn': {
    AppLocale.en: 'Apply Now',
    AppLocale.af: 'Dien Nou Aansoek',
    AppLocale.xh: 'Faka isiCelo Ngoku',
  },
  'prog.detail.contact_btn': {
    AppLocale.en: 'Contact Us',
    AppLocale.af: 'Kontak Ons',
    AppLocale.xh: 'Qhagamshelana Nathi',
  },
  'prog.detail.back': {
    AppLocale.en: '← Back to Programmes',
    AppLocale.af: '← Terug na Programme',
    AppLocale.xh: '← Buyela kwiinkqubo',
  },

  // ── Alumni Page ─────────────────────────────────────────────────────
  'nav.alumni': {
    AppLocale.en: 'Alumni',
    AppLocale.af: 'Alumni',
    AppLocale.xh: 'Abafundi baNgaphambili',
  },
  'alumni.label': {
    AppLocale.en: 'ALUMNI NETWORK',
    AppLocale.af: 'ALUMNI NETWERK',
    AppLocale.xh: 'UTHUNGELWANO LWABAFUNDI',
  },
  'alumni.title': {
    AppLocale.en: 'Where Our Graduates Go',
    AppLocale.af: 'Waarheen Ons Gegradueerdes Gaan',
    AppLocale.xh: 'Apho Abaphumeleleyo Bethu Bakhona',
  },
  'alumni.subtitle': {
    AppLocale.en:
        'Our alumni are building the future across the globe — from Silicon Valley to the Western Cape.',
    AppLocale.af:
        'Ons alumni bou die toekoms regoor die wêreld — van Silicon Valley tot die Wes-Kaap.',
    AppLocale.xh:
        'Abafundi bethu bangaphambili bakha ikamva kwihlabathi lonke — ukusuka eSilicon Valley ukuya eNtshona Koloni.',
  },
  'alumni.stories.heading': {
    AppLocale.en: 'Alumni Stories',
    AppLocale.af: 'Alumni Verhale',
    AppLocale.xh: 'Amabali Abafundi',
  },
  'alumni.cta.title': {
    AppLocale.en: 'Stay Connected',
    AppLocale.af: 'Bly Verbind',
    AppLocale.xh: 'Hlala Uqhagamshelene',
  },
  'alumni.cta.body': {
    AppLocale.en:
        'Are you a CS Stellenbosch alumnus? We\'d love to hear from you and feature your story.',
    AppLocale.af:
        'Is jy \'n RW Stellenbosch alumnus? Ons wil graag van jou hoor en jou verhaal uitstal.',
    AppLocale.xh:
        'Ungumfundi wangaphambili wase-Stellenbosch CS? Singathanda ukuva kuwe kwaye sibalise ibali lakho.',
  },
  'alumni.cta.btn': {
    AppLocale.en: 'Get in Touch',
    AppLocale.af: 'Maak Kontak',
    AppLocale.xh: 'Nxibelelana Nathi',
  },

  // ── Resources FAQ ───────────────────────────────────────────────────
  'res.faq.q1': {
    AppLocale.en: 'How do I register as a new postgraduate student?',
    AppLocale.af: 'Hoe registreer ek as nuwe nagraadse student?',
    AppLocale.xh: 'Ndibhalisela njani njengomfundi omtsha wasemva kwesidanga?',
  },
  'res.faq.a1': {
    AppLocale.en:
        'Submit your online application at apply.sun.ac.za, attach certified ID and transcripts. Once accepted, register through the student portal during the designated registration period in January.',
    AppLocale.af:
        'Dien jou aanlyntoepassing in by apply.sun.ac.za, heg gesertifiseerde ID en transkripsies aan. Sodra aanvaar, registreer deur die studenteportaal gedurende die aangewese registrasietydperk in Januarie.',
    AppLocale.xh:
        'Ngenisa isicelo sakho se-intanethi ku-apply.sun.ac.za, qhoboshela isazisi esiqinisekisiweyo kunye neerekhodi. Xa wamkelwe, bhalisa ngepothali yabafundi ngexesha lobhaliso elimiselweyo ngoJanuwari.',
  },
  'res.faq.q2': {
    AppLocale.en: 'What are the laptop specifications required?',
    AppLocale.af: 'Wat is die skootrekenaar spesifikasies wat vereis word?',
    AppLocale.xh: 'Yeyiphi imiqathango yekhompyutha ephathwayo efunekayo?',
  },
  'res.faq.a2': {
    AppLocale.en:
        'We recommend at least 8 GB RAM (16 GB preferred), an Intel i5/AMD Ryzen 5 or better CPU, 256 GB SSD, and a 64-bit OS. The CS labs provide Windows 10 + Linux dual-boot workstations.',
    AppLocale.af:
        'Ons beveel ten minste 8 GB RAM aan (16 GB verkieslik), \'n Intel i5/AMD Ryzen 5 of beter SVE, 256 GB SSD, en \'n 64-bis bedryfstelsel. Die RW-laboratoriums bied Windows 10 + Linux dubbellaai-werkstasies.',
    AppLocale.xh:
        'Sincoma ubuncinci i-8 GB RAM (i-16 GB iyathandwa), i-Intel i5/AMD Ryzen 5 okanye i-CPU engcono, i-256 GB SSD, kunye ne-OS ye-64-bit. Iilabhoratri ze-CS zinikezela nge-Windows 10 + Linux dual-boot workstations.',
  },
  'res.faq.q3': {
    AppLocale.en: 'Can I defer my acceptance to next year?',
    AppLocale.af: 'Kan ek my aanvaarding na volgende jaar uitstel?',
    AppLocale.xh: 'Ngaba ndinganqumamisa ukwamkelwa kwam kulo nyaka uzayo?',
  },
  'res.faq.a3': {
    AppLocale.en:
        'Deferral requests must be submitted in writing to the Undergraduate Office before 28 February. Approvals are granted per-faculty at its discretion.',
    AppLocale.af:
        'Uitstelversoeke moet skriftelik voor 28 Februarie by die Voorgraadse Kantoor ingedien word. Goedkeurings word per fakulteit na goeddunke toegestaan.',
    AppLocale.xh:
        'Izicelo zokumisa kufuneka zingeniswe ngokubhaliweyo kwiOfisi yaBafundi beSidanga phambi kowe-28 Februwari. Imvume inikezelwa ngokwefakhalthi ngokubona kwayo.',
  },
  'res.faq.q4': {
    AppLocale.en: 'Where is the department located?',
    AppLocale.af: 'Waar is die departement geleë?',
    AppLocale.xh: 'Isebe likweyiphi indawo?',
  },
  'res.faq.a4': {
    AppLocale.en:
        'The CS Department is situated in the Engineering A Building on the main Stellenbosch campus. Reception is on the ground floor, Room A001.',
    AppLocale.af:
        'Die RW-departement is in die Ingenieurswese A-gebou op die hoof Stellenbosch-kampus. Ontvangs is op die grondverdieping, Kamer A001.',
    AppLocale.xh:
        'ISebe le-CS sihleli kwiSakhiwo se-Engineering A kwikampasi ephambili yaseStellenbosch. Ukwamkelwa kukumgangatho wokuqala, iGumbi A001.',
  },
  'res.faq.q5': {
    AppLocale.en: 'How do I access the CS labs after hours?',
    AppLocale.af: 'Hoe kry ek toegang tot die RW-laboratoriums na-ure?',
    AppLocale.xh: 'Ndifikelela njani kwiilabhoratri ze-CS emva kwamaxesha?',
  },
  'res.faq.a5': {
    AppLocale.en:
        'After-hours access requires a valid student card and prior approval from your lecturer. The labs are open until 22:00 on weekdays and 17:00 on Saturdays during term time.',
    AppLocale.af:
        'Na-ure toegang vereis \'n geldige studentekaart en vooraf goedkeuring van jou dosent. Die laboratoriums is tot 22:00 op weeksdae en 17:00 op Saterdae gedurende kwartaaltyd oop.',
    AppLocale.xh:
        'Ukufikelela emva kwamaxesha kufuna ikhadi labafundi elisemthethweni kunye nemvume engaphambili evela kumhlohli wakho. Iilabhoratri zivuliwe ukuya nge-22:00 ngentsuku zeveki kunye nango-17:00 ngoMgqibelo ngexesha letherm.',
  },
  'res.faq.q6': {
    AppLocale.en: 'What programming languages are taught?',
    AppLocale.af: 'Watter programmeertale word onderrig?',
    AppLocale.xh: 'Zeziphi iilwimi zenkqubo ezifundiswayo?',
  },
  'res.faq.a6': {
    AppLocale.en:
        'First-year modules use Python and Java. Upper years introduce C++, JavaScript, Haskell, and others depending on the module. Honours students may work with any language suitable for their project.',
    AppLocale.af:
        'Eerstejaar-modules gebruik Python en Java. Hoër jare stel C++, JavaScript, Haskell en ander voor afhangende van die module. Honneursstudente kan met enige geskikte taal vir hul projek werk.',
    AppLocale.xh:
        'Iimoduli zonyaka wokuqala zisebenzisa iPython noJava. Iminyaka ephakamileyo yazisa iC++, iJavaScript, iHaskell, nezinye ngokuxhomekeke kwimoduli. Abafundi beHonours bangasebenza nalo naluphi ulwimi olufanelekileyo kwiprojekthi yabo.',
  },
  'res.faq.q7': {
    AppLocale.en: 'Is financial aid available for postgraduate students?',
    AppLocale.af: 'Is finansiële hulp beskikbaar vir nagraadse studente?',
    AppLocale.xh:
        'Ngaba uncedo lwezimali luyafumaneka kubafundi basemva kwesidanga?',
  },
  'res.faq.a7': {
    AppLocale.en:
        'Yes. The university offers NRF bursaries, faculty merit awards, and departmental assistantships. International students may also apply for the African Scholarship Programme.',
    AppLocale.af:
        'Ja. Die universiteit bied NRF-beurse, fakulteitmeriettoekennings en departementele assistentskappe aan. Internasionale studente kan ook vir die Afrika-beursprogram aansoek doen.',
    AppLocale.xh:
        'Ewe. Iyunivesithi inikeza iibhasari ze-NRF, amabhaso amafakhalthi, kunye neesekethe zesebe. Abafundi bamazwe angaphandle banokufaka isicelo seNkqubo yeBhasari yaseAfrika.',
  },
  'res.faq.q8': {
    AppLocale.en: 'How do I get involved in research?',
    AppLocale.af: 'Hoe raak ek betrokke by navorsing?',
    AppLocale.xh: 'Ndibandakanyeka njani kuphando?',
  },
  'res.faq.a8': {
    AppLocale.en:
        'Speak to any academic staff member whose research interests align with yours. Many research groups welcome undergraduate volunteers. Formal research begins in the Honours year with the CS 771 project.',
    AppLocale.af:
        'Praat met enige akademiese personeellid wie se navorsingsbelangstellings by joune pas. Baie navorsingsgroepe verwelkom voorgraadse vrywilligers. Formele navorsing begin in die Honneursjaar met die RW 771-projek.',
    AppLocale.xh:
        'Thetha nalo naluphi ilungu labasebenzi bezifundo oluthanda uphando lwalo luhambelana nolwakho. Amaqela ophando amaninzi amkela abavolontiya abangabafundi besidanga. Uphando olunges ngokusemthethweni luqala ngonyaka weHonours ngeprojekthi ye-CS 771.',
  },
};

/// Look up a translated string for the given [locale].
/// Falls back to English when a key is missing.
String translate(AppLocale locale, String key) {
  final entry = _strings[key];
  if (entry == null) return key;
  return entry[locale] ?? entry[AppLocale.en] ?? key;
}
