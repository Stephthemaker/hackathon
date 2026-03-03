#!/usr/bin/env python3
"""Add all missing translation keys to translations.dart."""

EXTRA = r"""
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
    AppLocale.en: 'Research funding secured for a multi-year project on large language models for African languages.',
    AppLocale.af: 'Navorsingsbefondsing verseker vir \'n meerjarige projek oor groot taalmodelle vir Afrikatale.',
    AppLocale.xh: 'Inkxaso-mali yophando ifunyenwe kwiprojekthi yeminyaka emininzi yemodeli yeelwimi zaseAfrika.',
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
    AppLocale.en: 'Three Stellenbosch teams place in the top ten at the national ACM ICPC Southern Africa regionals.',
    AppLocale.af: 'Drie Stellenbosch-spanne plaas in die top tien by die nasionale ACM ICPC Suider-Afrika-streekskompetisie.',
    AppLocale.xh: 'Amaqela amathathu aseStellenbosch angene kwishumi lokuqala kwiACM ICPC yaseMzantsi Afrika.',
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
    AppLocale.en: 'Annual internal research colloquium. All postgrad students are invited to submit abstracts by 30 March.',
    AppLocale.af: 'Jaarlikse interne navorsingskollokwium. Alle nagraadse studente word genooi om opsommings teen 30 Maart in te dien.',
    AppLocale.xh: 'Ingxoxo yonyaka yophando lwangaphakathi. Bonke abafundi basemva kwesidanga bayamenywa ukuba bangenise izishwankathelo phambi kwe-30 Matshi.',
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
    AppLocale.en: "Thank you {name}. We'll respond to {email} within two business days.",
    AppLocale.af: "Dankie {name}. Ons sal binne twee werksdae na {email} reageer.",
    AppLocale.xh: "Enkosi {name}. Siza kuphendula ku-{email} ngeentsuku ezimbini zomsebenzi.",
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
  'contact.form.email_error': {
    AppLocale.en: 'Enter a valid email',
    AppLocale.af: 'Voer \'n geldige e-posadres in',
    AppLocale.xh: 'Faka idilesi ye-imeyile echanekileyo',
  },
  'contact.form.subject': {
    AppLocale.en: 'Subject',
    AppLocale.af: 'Onderwerp',
    AppLocale.xh: 'Isihloko',
  },
  'contact.form.message': {
    AppLocale.en: 'Message',
    AppLocale.af: 'Boodskap',
    AppLocale.xh: 'Umyalezo',
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
  'contact.info.heading': {
    AppLocale.en: 'Contact Details',
    AppLocale.af: 'Kontakbesonderhede',
    AppLocale.xh: 'Iinkcukacha Zoqhagamshelwano',
  },
  'contact.info.hours': {
    AppLocale.en: 'Mon–Fri 08:00–16:30',
    AppLocale.af: 'Ma–Vr 08:00–16:30',
    AppLocale.xh: 'Mvulo–Lwesihlanu 08:00–16:30',
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
    AppLocale.en: "The page you're looking for doesn't exist or has been moved.",
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
    AppLocale.en: 'Undergraduate degrees including a major in Computer Science covering programming fundamentals, data structures, algorithms, software engineering, and elective streams.',
    AppLocale.af: 'Voorgraadse grade insluitend \'n hoofvak in Rekenaarwetenskap wat programmeringsgrondslae, datastrukture, algoritmes, sagteware-ingenieurswese en keuserigtings dek.',
    AppLocale.xh: 'Izidanga zangaphantsi ezibandakanya isifundo esikhulu kwiNzululwazi yeKhompyutha esigubungela iziseko zokuprograma, izakhiwo zedatha, ii-algorithms, ubunjineli besoftware, kunye nezikhondo zokukhethwa.',
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
    AppLocale.en: 'An intensive 1-year programme building on the BSc, with advanced coursework in algorithms, machine learning, compilers, and a compulsory research component.',
    AppLocale.af: '\'n Intensiewe 1-jaar program wat voortbou op die BSc, met gevorderde kursuswerk in algoritmes, masjienleer, samestellers en \'n verpligte navorsingskomponent.',
    AppLocale.xh: 'Inkqubo eqinileyo yonyaka olu-1 eyakhela kwi-BSc, kunye nomsebenzi ophambili kwii-algorithms, ukufunda komatshini, ii-compilers, kunye neqhina lophando elinyanzelekileyo.',
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
    AppLocale.en: 'Thesis-based research programme allowing deep specialisation under supervision of an NRF-rated researcher.',
    AppLocale.af: 'Tesisgebaseerde navorsingsprogram wat diep spesialisasie onder toesig van \'n NNS-gegradeerde navorser toelaat.',
    AppLocale.xh: 'Inkqubo yophando engumsebenzi wethisisi evumela ukugxila kwinto ethile phantsi kokhokelo lomphandi owabelwe yi-NRF.',
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
    AppLocale.en: 'Dissertation-based programme for candidates aiming to contribute original knowledge to the field.',
    AppLocale.af: 'Proefskrifgebaseerde program vir kandidate wat beoog om oorspronklike kennis tot die veld by te dra.',
    AppLocale.xh: 'Inkqubo engumsebenzi wesidanga esiphezulu yabatyunjwa abajolise ekunikezeleni ulwazi olutsha kulo mkhakha.',
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
    AppLocale.en: 'Applications for 2027 open on 1 March. Prepare your\ndocuments and apply online through the SU portal.',
    AppLocale.af: 'Aansoeke vir 2027 open op 1 Maart. Berei jou\ndokumente voor en doen aanlyn aansoek deur die US-portaal.',
    AppLocale.xh: 'Izicelo ze-2027 zivula nge-1 kaMatshi. Lungisa\namaxwebhu akho uze ufake isicelo nge-intanethi ngeportal yeSU.',
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
    AppLocale.en: "Select a year to browse modules — tap any row to expand its description.",
    AppLocale.af: "Kies \'n jaar om modules te blaai — tik op enige ry om die beskrywing uit te brei.",
    AppLocale.xh: "Khetha unyaka ukuze ubrowse iimoduli — cofa nayiphi na irow ukuze wandise inkcazo yayo.",
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
    AppLocale.en: 'Software and platforms produced by our research groups, available for academic use.',
    AppLocale.af: 'Sagteware en platforms wat deur ons navorsingsgroepe vervaardig is, beskikbaar vir akademiese gebruik.',
    AppLocale.xh: 'IiSoftware kunye neeplatfom ezenziwe ngamaqela ethu ophando, ezifumanekayo kusetyenziswo kwezemfundo.',
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
    AppLocale.en: 'Our research groups actively supervise Honours, Masters, and PhD students. Explore our programmes or contact the department to discuss opportunities.',
    AppLocale.af: 'Ons navorsingsgroepe begelei aktief Honneurs-, Meesters- en PhD-studente. Verken ons programme of kontak die departement om geleenthede te bespreek.',
    AppLocale.xh: 'Amaqela ethu ophando avelela ngamandla abafundi bee-Honours, iMasters, kunye nePhD. Hlola iinkqubo zethu okanye uqhagamshelane nesebe ukuze uxoxe ngeethuba.',
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
    AppLocale.en: 'Course content, assignments, grades, and lecture recordings.',
    AppLocale.af: 'Kursusinhoud, opdragte, punte en lesing-opnames.',
    AppLocale.xh: 'Umxholo wekosi, imisebenzi, amanqaku, kunye neerekhodi zeeleksa.',
  },
  'res.link.lab.name': {
    AppLocale.en: 'CS Lab Booking',
    AppLocale.af: 'RW Lab-bespreking',
    AppLocale.xh: 'Ukubhukisha iLab ye-CS',
  },
  'res.link.lab.desc': {
    AppLocale.en: 'Reserve a computer lab session for practicals or project work.',
    AppLocale.af: 'Bespreek \'n rekenaarlabsessie vir praktiese werk of projekte.',
    AppLocale.xh: 'Gcina iseshoni yelab yekhompyutha yokusebenza okwenyani okanye omsebenzi weprojekthi.',
  },
  'res.link.library.name': {
    AppLocale.en: 'Library E-Resources',
    AppLocale.af: 'Biblioteek E-hulpbronne',
    AppLocale.xh: 'I-E-Resources zeThala leeNcwadi',
  },
  'res.link.library.desc': {
    AppLocale.en: 'IEEE Xplore, ACM DL, Springer, and more scholarly databases.',
    AppLocale.af: 'IEEE Xplore, ACM DL, Springer, en meer akademiese databasisse.',
    AppLocale.xh: 'IEEE Xplore, ACM DL, Springer, kunye needathabheyisi zophando.',
  },
  'res.link.eduroam.name': {
    AppLocale.en: 'eduroam Setup',
    AppLocale.af: 'eduroam-opstelling',
    AppLocale.xh: 'Ukuseta i-eduroam',
  },
  'res.link.eduroam.desc': {
    AppLocale.en: 'Wireless access across campus and partner institutions worldwide.',
    AppLocale.af: 'Draadlose toegang oor die kampus en vennootinstellings wêreldwyd.',
    AppLocale.xh: 'Ukufikelela okungenazintambo kuwo wonke ikhampasi kunye namaziko alingane kwihlabathi.',
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
    AppLocale.af: '24/7 tegniese ondersteuningsportaal vir studente en personeel.',
    AppLocale.xh: 'Iportal yenkxaso yobuchwepheshe ye-24/7 yabafundi kunye nabasebenzi.',
  },
  'res.tool.github.name': {
    AppLocale.en: 'GitHub Student Pack',
    AppLocale.af: 'GitHub-studentepakket',
    AppLocale.xh: 'IPhekethi Yomfundi ye-GitHub',
  },
  'res.tool.github.desc': {
    AppLocale.en: 'Free developer tools, domains, and cloud credits for students.',
    AppLocale.af: 'Gratis ontwikkelaargereedskap, domeine en wolkkrediete vir studente.',
    AppLocale.xh: 'Izixhobo zasimahla zomvelisi, iidomeini, kunye neekhredithi zecloud zabafundi.',
  },
  'res.tool.jetbrains.name': {
    AppLocale.en: 'JetBrains Toolbox',
    AppLocale.af: 'JetBrains-gereedskapis',
    AppLocale.xh: 'IBhokisi Yezixhobo ye-JetBrains',
  },
  'res.tool.jetbrains.desc': {
    AppLocale.en: 'Free professional IDEs (IntelliJ, PyCharm, CLion) with university email.',
    AppLocale.af: 'Gratis professionele IDE\'s (IntelliJ, PyCharm, CLion) met universiteits-e-pos.',
    AppLocale.xh: 'Ii-IDE ezisimahla zobungcali (IntelliJ, PyCharm, CLion) nge-imeyile yeyunivesithi.',
  },
  'res.tool.azure.name': {
    AppLocale.en: 'Azure for Students',
    AppLocale.af: 'Azure vir Studente',
    AppLocale.xh: 'I-Azure yaBafundi',
  },
  'res.tool.azure.desc': {
    AppLocale.en: 'Free Azure credits and services for learning cloud computing.',
    AppLocale.af: 'Gratis Azure-krediete en dienste om wolkrekenaarkunde te leer.',
    AppLocale.xh: 'Iikhredithi zesimahla ze-Azure kunye neenkonzo zokufunda nge-cloud computing.',
  },
  'res.tool.overleaf.name': {
    AppLocale.en: 'Overleaf',
    AppLocale.af: 'Overleaf',
    AppLocale.xh: 'Overleaf',
  },
  'res.tool.overleaf.desc': {
    AppLocale.en: 'Collaborative LaTeX editor for writing research papers and theses.',
    AppLocale.af: 'Samewerkende LaTeX-redakteur vir die skryf van navorsingsartikels en proefskrifte.',
    AppLocale.xh: 'Umhleli we-LaTeX wentsebenziswano wokubhala amaphepha ophando kunye neethisisi.',
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
"""

with open('lib/settings/translations.dart', 'r') as f:
    text = f.read()

idx = text.rfind('};')
text = text[:idx] + EXTRA + text[idx:]

with open('lib/settings/translations.dart', 'w') as f:
    f.write(text)

print(f"Done. File now {len(text)} chars.")
