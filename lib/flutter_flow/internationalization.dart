import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'ar': 'مرحبًا بعودتك',
      'de': 'Willkommen zurück',
      'es': 'Bienvenido de nuevo',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بتسجيل الدخول للوصول إلى حسابك أدناه.',
      'de': 'Melden Sie sich unten an, um auf Ihr Konto zuzugreifen.',
      'es': 'Inicie sesión ',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein.',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'أدخل كلمة المرور الخاصة بك...',
      'de': 'Geben Sie Ihr Passwort ein.',
      'es': 'Introduzca su contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Login',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben noch kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'يخلق',
      'de': 'Erstellen',
      'es': 'Crear',
    },
    '1zqiw31h': {
      'en': 'Continue as Guest',
      'ar': 'متابعة كضيف',
      'de': 'Weiter als Gast',
      'es': 'Continuar como invitado',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Erste Schritte',
      'es': 'Empezar',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein.',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'أدخل كلمة المرور الخاصة بك...',
      'de': 'Geben Sie Ihr Passwort ein.',
      'es': 'Introduzca su contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Passwort bestätigen',
      'es': 'confirmar Contraseña',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'أدخل كلمة المرور الخاصة بك...',
      'de': 'Geben Sie Ihr Passwort ein.',
      'es': 'Introduzca su contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Login',
      'es': 'Acceso',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب بالفعل؟',
      'de': 'Hast du schon ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '3ugmx2zp': {
      'en': 'Continue as Guest',
      'ar': 'متابعة كضيف',
      'de': 'Weiter als Gast',
      'es': 'Continuar como invitado',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا حتى نتمكن من التعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que podamos identificarte fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Ihr Name',
      'es': 'Su nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'd.h. 34',
      'es': 'es decir 34',
    },
    '72ii0waq': {
      'en': 'Your Title',
      'ar': 'عنوانك',
      'de': 'Ihr Titel',
      'es': 'Tu titulo',
    },
    'pf8glhkg': {
      'en': 'What is your position?',
      'ar': 'ما هو موقفك؟',
      'de': 'Was ist Ihre Position?',
      'es': '¿Cual es tu posición?',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'ar': 'تخطي الآن',
      'de': 'Vorerst überspringen',
      'es': 'Saltar por ahora',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Das Feld ist erforderlich',
      'es': 'El campo es obligatorio',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Das Feld ist erforderlich',
      'es': 'El campo es obligatorio',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'de': 'Das Feld ist erforderlich',
      'es': 'El campo es obligatorio',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Ingresa el email asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein.',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'إرسال رابط إعادة الضبط',
      'de': 'Link zum Zurücksetzen senden',
      'es': 'Enviar enlace de restablecimiento',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Budgets erstellen',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar': 'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها لتسهيل تتبعها.',
      'de':
          'Erstellen Sie Budgets, denen Sie zur einfacheren Nachverfolgung Transaktionen zuordnen können.',
      'es':
          'Crea presupuestos a los que puedas vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie den Überblick über Ihre Ausgaben',
      'es': 'Realice un seguimiento de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis del presupuesto',
    },
    'q30ina4f': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانيتك وكيف يمكن تعديلها.',
      'de':
          'Wissen Sie, wo Ihre Budgets liegen und wie sie angepasst werden können.',
      'es': 'Conozca dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Create Your Budget',
      'ar': 'إنشاء الميزانية الخاصة بك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'wih71x51': {
      'en': 'Amount',
      'ar': 'كمية',
      'de': 'Menge',
      'es': 'Cantidad',
    },
    'qk15nsmc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'iphvcuwc': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    'v2shqq3z': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'knu0nxbp': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '79au6dyg': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // MY_Card
  {
    'xn2so8km': {
      'en': 'My Card',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '6t7n9ugd': {
      'en': 'Balance',
      'ar': 'توازن',
      'de': 'Gleichgewicht',
      'es': 'Balance',
    },
    'h3086ma4': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
      'de': '7.630 \$',
      'es': '\$7,630',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '25/05',
      'de': '25.05.',
      'es': '25/05',
    },
    '9b0j67se': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'axrvkhrv': {
      'en': '+\$12,402',
      'ar': '+12,402 دولار',
      'de': '+12.402 USD',
      'es': '+\$12,402',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'ar': '4.5%',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'mggh8wu7': {
      'en': 'Spending',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'c5bszisf': {
      'en': '-\$8,392',
      'ar': '-8,392 دولار',
      'de': '-8.392 USD',
      'es': '-\$8,392',
    },
    '85pb8msl': {
      'en': '4.5% ',
      'ar': '4.5%',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rápido',
    },
    '8bnd6lco': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Überweisen',
      'es': 'Transferir',
    },
    'roobc02h': {
      'en': 'Pause Card',
      'ar': 'بطاقة الإيقاف المؤقت',
      'de': 'Karte pausieren',
      'es': 'Tarjeta de pausa',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'nd57lnti': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'hfynfrek': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    'evhprbi0': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    'm8rhanhc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_Budgets
  {
    'cd0zp71n': {
      'en': 'My Budget',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'hfwbiivj': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'jjj3ydb1': {
      'en': '+\$12,402',
      'ar': '+12,402 دولار',
      'de': '+12.402 USD',
      'es': '+\$12,402',
    },
    'ns4vt604': {
      'en': '4.5% ',
      'ar': '4.5%',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'wcsc04wg': {
      'en': 'Spending',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'a5zzlh8f': {
      'en': '-\$8,392',
      'ar': '-8,392 دولار',
      'de': '-8.392 USD',
      'es': '-\$8,392',
    },
    '8xnbsdnb': {
      'en': '4.5% ',
      'ar': '4.5%',
      'de': '4,5 %',
      'es': '4,5%',
    },
    '9il8u06k': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto de publicidad',
    },
    'yvhhudxi': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 US-Dollar',
      'es': '\$3,000',
    },
    'okyphbdu': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    'c81i1ybg': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'rrbwd2z6': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
      'de': '2.502 USD',
      'es': '\$2,502',
    },
    'ah4t7cpx': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto de publicidad',
    },
    '0tsohlub': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 US-Dollar',
      'es': '\$3,000',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
      'de': '2.502 USD',
      'es': '\$2,502',
    },
    'fn6kvat8': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto de publicidad',
    },
    '6uht91yb': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 US-Dollar',
      'es': '\$3,000',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
      'de': '2.502 USD',
      'es': '\$2,502',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // budgetDetails
  {
    '9yi3zs3z': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    '92alvg49': {
      'en': '\$25,000',
      'ar': '25000 دولار',
      'de': '25.000 US-Dollar',
      'es': '\$25,000',
    },
    'p0gf1lfy': {
      'en': 'Per Month',
      'ar': 'كل شهر',
      'de': 'Pro Monat',
      'es': 'Por mes',
    },
    'akubzhk3': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    'ti7ipegi': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o7a8ijm4': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
      'de': '2.502 USD',
      'es': '\$2,502',
    },
    'ifi6fmsa': {
      'en': 'Transactions',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'es': 'Actas',
    },
    'h6hqhujt': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas para llegar lejos',
    },
    'ak9m8szp': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '3doa1muw': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    'osq1v3c0': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'تم النقل بالكامل',
      'de': 'Übertragung abgeschlossen',
      'es': 'Transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع، لقد نجحت في تحويل الأموال. قد يستغرق الأمر بضعة أيام حتى تخرج الأموال من حسابك.',
      'de':
          'Gute Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, has transferido los fondos con éxito. Puede que los fondos tarden unos días en salir de tu cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Bueno',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'توازن',
      'de': 'Gleichgewicht',
      'es': 'Balance',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
      'de': '7.630 \$',
      'es': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '25/05',
      'de': '25.05.',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغيير الحساب',
      'de': 'Konto ändern',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'نقل داخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
      'de': 'Externer Transfer',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'الدفع عن طريق ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago ACH',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': 'نوع النقل',
      'de': 'Übertragungstyp',
      'es': 'Tipo de transferencia',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد الحساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب ****2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب ****2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب ****2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': 'اختر حساب',
      'de': 'Wählen Sie ein Konto',
      'es': 'Elija una cuenta',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ \$',
      'de': '\$ Betrag',
      'es': '\$ Cantidad',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
      'de': '7.630 \$',
      'es': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'إرسال التحويل',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'انقر أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Request Funds',
      'ar': 'طلب الأموال',
      'de': 'Mittel anfordern',
      'es': 'Solicitar fondos',
    },
    'xvj3fan8': {
      'en': '\$ Amount',
      'ar': 'المبلغ \$',
      'de': '\$ Betrag',
      'es': '\$ Cantidad',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de la oficina',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
      'de': 'Externer Transfer',
      'es': 'Transferencia externa',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'ar': 'الدفع عن طريق ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago ACH',
    },
    'wo9cebk7': {
      'en': 'Select Transfer',
      'ar': 'حدد النقل',
      'de': 'Wählen Sie Übertragen',
      'es': 'Seleccionar Transferencia',
    },
    'rcevwwju': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uvrt7im0': {
      'en': 'Request Funds',
      'ar': 'طلب الأموال',
      'de': 'Mittel anfordern',
      'es': 'Solicitar fondos',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // createBudget
  {
    'smbfunwu': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'fcgw57wj': {
      'en': 'Amount',
      'ar': 'كمية',
      'de': 'Menge',
      'es': 'Cantidad',
    },
    'onjddqdc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'g83gfmaf': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    '0iex13x2': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'jy5q09h1': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '8hzaiw1r': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'mos068mm': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Add Transaction',
      'ar': 'إضافة معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'كمية',
      'de': 'Menge',
      'es': 'Cantidad',
    },
    'ohewrgsv': {
      'en': 'Spent At',
      'ar': 'تم إنفاقه في',
      'de': 'Verbrachte bei',
      'es': 'Gastado en',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de la oficina',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'ar': 'نقل خارجي',
      'de': 'Externer Transfer',
      'es': 'Transferencia externa',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'ar': 'الدفع عن طريق ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago ACH',
    },
    '861el4k4': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Budget auswählen',
      'es': 'Seleccione Presupuesto',
    },
    'swxms7ln': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uqfgu088': {
      'en': 'Add Transaction',
      'ar': 'إضافة معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '9stmpsf0': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال المبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambiar la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein. Wir senden Ihnen dann einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingresa el correo electrónico asociado a tu cuenta y te enviaremos un enlace para restablecer tu contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
      'de': 'E-Mail-Adresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein.',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'إرسال رابط إعادة الضبط',
      'de': 'Link zum Zurücksetzen senden',
      'es': 'Enviar enlace de restablecimiento',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutzrichtlinie',
      'es': 'Agenda',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'So verwenden wir Ihre Daten',
      'es': 'Cargos en el ultimo mes',
    },
    '1ngqbizb': {
      'en': 'Button',
      'ar': '',
      'de': '',
      'es': 'Aceptar cargos',
    },
    'cwyi6ulm': {
      'en': '50%',
      'ar': '',
      'de': '',
      'es': '50% de la meta mensual',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'o6prpb1q': {
      'en': 'Create Budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Budgets erstellen',
      'es': 'Crear presupuestos',
    },
    '292pbdw7': {
      'en':
          'Create budgets that you can tie transactions too in order for easy tracking.',
      'ar': 'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها لتسهيل تتبعها.',
      'de':
          'Erstellen Sie Budgets, denen Sie zur einfacheren Nachverfolgung Transaktionen zuordnen können.',
      'es':
          'Crea presupuestos a los que puedas vincular transacciones para facilitar el seguimiento.',
    },
    'b10xvuf9': {
      'en': 'Keep Track of Spending',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie den Überblick über Ihre Ausgaben',
      'es': 'Realice un seguimiento de los gastos',
    },
    't6k1smsm': {
      'en':
          'Easily add transactions and associate them with budgets that have been created.',
      'ar': 'يمكنك بسهولة إضافة المعاملات وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    'u8xxj427': {
      'en': 'Budget Analysis',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis del presupuesto',
    },
    'iqi0pkmb': {
      'en': 'Know where your budgets are and how they can be adjusted.',
      'ar': 'تعرف على مكان ميزانيتك وكيف يمكن تعديلها.',
      'de':
          'Wissen Sie, wo Ihre Budgets liegen und wie sie angepasst werden können.',
      'es': 'Conozca dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // homePage
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
      'de': 'Willkommen,',
      'es': 'Bienvenido,',
    },
    'c10wb3ot': {
      'en': 'Your account Details are below.',
      'ar': 'تفاصيل حسابك موجودة أدناه.',
      'de': 'Ihre Kontodetails finden Sie unten.',
      'es': 'Los detalles de su cuenta .',
    },
    '6z1sm34j': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
      'de': 'Gesamtsaldo',
      'es': 'Saldo total',
    },
    'c0dls4u5': {
      'en': '\$25,202',
      'ar': '25202 دولار',
      'de': '25.202 USD',
      'es': '\$25,202',
    },
    '30yef7fj': {
      'en': 'Payroll Due',
      'ar': 'الرواتب المستحقة',
      'de': 'Lohn- und Gehaltsabrechnung fällig',
      'es': 'Nómina vencida',
    },
    'zrx9e6tv': {
      'en': '\$12,245',
      'ar': '12,245 دولار',
      'de': '12.245 USD',
      'es': '\$12,245',
    },
    '1cjqanzg': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    '726vrs60': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    '4dgbx46t': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    'n87v5tth': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Marketingbudget',
      'es': 'Presupuesto de marketing',
    },
    'l5pw5c8c': {
      'en': '\$4,000',
      'ar': '4000 دولار',
      'de': '4.000 US-Dollar',
      'es': '\$4,000',
    },
    '7i0a44qa': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '9a2ya1la': {
      'en': '\$3,402',
      'ar': '3,402 دولار',
      'de': '3.402 USD',
      'es': '\$3,402',
    },
    'n1o498d9': {
      'en': '4 Days Left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    'lmo3ko2i': {
      'en': 'Quick Services',
      'ar': 'خدمات سريعة',
      'de': 'Schnellservice',
      'es': 'Servicios rápidos',
    },
    '774itrkn': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'xs2as0vf': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Überweisen',
      'es': 'Transferir',
    },
    'g8yaaa7f': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'nb29ps2o': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Warnung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'شاهد الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'pnvkw3b7': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar': 'لقد لاحظنا رسومًا صغيرة خارجة عن طابع هذا الحساب، يرجى المراجعة.',
      'de':
          'Uns ist eine geringe Belastung aufgefallen, die für dieses Konto nicht üblich ist. Bitte überprüfen Sie die Belastung.',
      'es':
          'Notamos un pequeño cargo que está fuera de lo común en esta cuenta, por favor reviselo.',
    },
    '2d6kakwk': {
      'en': 'Button',
      'ar': '',
      'de': '',
      'es': 'Tareas mensuales',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // homePage_alt
  {
    'xdh0z8qh': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
      'de': 'Willkommen,',
      'es': 'Bienvenido,',
    },
    'v74pa882': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    'rzpg3cvh': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك موجودة أدناه.',
      'de': 'Ihre neuesten Updates finden Sie unten.',
      'es': 'Tus últimas actualizaciones se encuentran a continuación.',
    },
    'flto6ti8': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
      'de': 'Gesamtsaldo',
      'es': 'Saldo total',
    },
    'g07h0azf': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
      'de': '25.281 USD',
      'es': '\$25,281',
    },
    'v9ghmn0y': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
      'de': 'Gesamtsaldo',
      'es': 'Saldo total',
    },
    '7vf40ybo': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
      'de': '25.281 USD',
      'es': '\$25,281',
    },
    'k4scs2cu': {
      'en': 'Total Balance',
      'ar': 'الرصيد الإجمالي',
      'de': 'Gesamtsaldo',
      'es': 'Saldo total',
    },
    'cvrbfozm': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
      'de': '25.281 USD',
      'es': '\$25,281',
    },
    'a33ldz0h': {
      'en': 'Next Payroll',
      'ar': 'الرواتب القادمة',
      'de': 'Nächste Gehaltsabrechnung',
      'es': 'Próxima nómina',
    },
    '3dgzzz79': {
      'en': '\$25,281',
      'ar': '25,281 دولار',
      'de': '25.281 USD',
      'es': '\$25,281',
    },
    'hp28r17l': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    'k04gl6sz': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    'd5tcdo3w': {
      'en': '4 days left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    '8wofym4i': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Warnung',
      'es': '1 nueva alerta',
    },
    'kaq4nzj6': {
      'en': 'Fraud Alert',
      'ar': 'تنبيه الاحتيال',
      'de': 'Betrugswarnung',
      'es': 'Alerta de fraude',
    },
    '7zcrtqx6': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar': 'لقد لاحظنا رسومًا صغيرة خارجة عن طابع هذا الحساب، يرجى المراجعة.',
      'de':
          'Uns ist eine geringe Belastung aufgefallen, die für dieses Konto nicht üblich ist. Bitte überprüfen Sie die Belastung.',
      'es':
          'Notamos un pequeño cargo que está fuera de lo común en esta cuenta, por favor reviselo.',
    },
    '23yxoc9m': {
      'en': 'View Now',
      'ar': 'شاهد الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'a86mwddx': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Marketingbudget',
      'es': 'Presupuesto de marketing',
    },
    '6c2o39hz': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 US-Dollar',
      'es': '\$3,000',
    },
    '5subrra4': {
      'en': 'Total Spent',
      'ar': 'إجمالي الإنفاق',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '0wtm2m51': {
      'en': '\$2,502',
      'ar': '2,502 دولار',
      'de': '2.502 USD',
      'es': '\$2,502',
    },
    'bp9d56pc': {
      'en': '4 days left',
      'ar': '4 أيام متبقية',
      'de': 'Noch 4 Tage',
      'es': 'Quedan 4 días',
    },
    'b8oj0pck': {
      'en': 'Team Name',
      'ar': 'اسم الفريق',
      'de': 'Teamname',
      'es': 'Nombre del equipo',
    },
    '87ospwsq': {
      'en': '\$5,000',
      'ar': '5000 دولار',
      'de': '5.000 US-Dollar',
      'es': '\$5,000',
    },
    'jzfejglt': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'de': 'Leiter Design',
      'es': 'Jefe de diseño',
    },
    'zm0lhm2a': {
      'en': '[Time Stamp]',
      'ar': '[الطابع الزمني]',
      'de': '[Zeitstempel]',
      'es': '[Sello de tiempo]',
    },
    '8hu2v2im': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Welcome,',
      'ar': 'مرحباً،',
      'de': 'Willkommen,',
      'es': 'Bienvenido,',
    },
    'izgc0c6r': {
      'en': 'Andrew',
      'ar': 'أندرو',
      'de': 'Andreas',
      'es': 'Andrés',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك موجودة أدناه.',
      'de': 'Ihre neuesten Updates finden Sie unten.',
      'es': 'Tus últimas actualizaciones se encuentran a continuación.',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'توازن',
      'de': 'Gleichgewicht',
      'es': 'Balance',
    },
    'syy689nt': {
      'en': '\$7,630',
      'ar': '7,630 دولار',
      'de': '7.630 \$',
      'es': '\$7,630',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'ar': '25/05',
      'de': '25.05.',
      'es': '25/05',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rápido',
    },
    'rfozud9v': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Überweisen',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'zmjsfzgg': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas de Go Far',
    },
    'vupu5y5p': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'bj5qnrj5': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    'd1n5mbq7': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '2thn73jc': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas de Go Far',
    },
    '1fjdiibo': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'ld7s2fpn': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    'ft8bu1we': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '8t6ddwco': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas de Go Far',
    },
    'td15kjsa': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'qmjqp9a6': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    '9qc797et': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '8pdmehj2': {
      'en': 'Go Far Rewards',
      'ar': 'مكافآت Go Far',
      'de': 'Go Far-Belohnungen',
      'es': 'Recompensas de Go Far',
    },
    'krrhjgc4': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '53m2u0s2': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'de': '50,00 USD',
      'es': '\$50.00',
    },
    'aks5zz4f': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // profilepage
  {
    'hhb6veym': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
      'de': 'Wallet-Guthaben',
      'es': 'Saldo de la billetera',
    },
    'fgf8icmv': {
      'en': '\$23,000',
      'ar': '23000 دولار',
      'de': '23.000 US-Dollar',
      'es': '\$23,000',
    },
    '2rrr446m': {
      'en': '3 currencies',
      'ar': '3 عملات',
      'de': '3 Währungen',
      'es': '3 tarjetas registradas',
    },
    'r04m9nxs': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '8nac51xz': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Überweisen',
      'es': 'Transferir',
    },
    's56t3xya': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'vewa5op5': {
      'en': 'Bitcoin',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Tarjeta de debito',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
      'de': '7.302 USD',
      'es': '\$7,302',
    },
    'yla7uncg': {
      'en': '32% of portfolio',
      'ar': '32% من المحفظة',
      'de': '32 % des Portfolios',
      'es': '32% de la cartera',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opob20j8': {
      'en': 'Solona',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Tarjeta de credito',
    },
    'fi3cleyj': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
      'de': '7.302 USD',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% of portfolio',
      'ar': '40% من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2io5lul': {
      'en': 'Dogecoin',
      'ar': 'دوجكوين',
      'de': 'Dogecoin',
      'es': 'Tarjeta de nomina',
    },
    'krsyyttw': {
      'en': '\$7,302',
      'ar': '7,302 دولار',
      'de': '7.302 USD',
      'es': '\$10,302',
    },
    '4mvfe3pe': {
      'en': '40% of portfolio',
      'ar': '40% من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // SelectAgent
  {
    'sld7fobg': {
      'en': 'My Stats',
      'ar': 'إحصائياتي',
      'de': 'Meine Statistiken',
      'es': 'Selecciona un agente',
    },
    'id61lrd9': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    'r171bpmn': {
      'en': 'Home',
      'ar': 'بيت',
      'de': 'Heim',
      'es': 'Hogar',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة الإيقاف المؤقت',
      'de': 'Karte pausieren',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Estás seguro de que deseas pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا تهتم',
      'de': 'Egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم، توقف مؤقتًا',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // assistant
  {
    'rlx601ex': {
      'en': 'Update Task',
      'ar': '',
      'de': '',
      'es': 'Quirky',
    },
    '1jdn6a76': {
      'en': 'Type here to respond...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8g5be9pc': {
      'en': '',
      'ar': '',
      'de': '',
      'es': 'Woff!! Hola mi nombre es Quirky, ¿En que puedo ayudarte?',
    },
    'rotqc96r': {
      'en': 'Post',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mxma5pov': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'shgxb49n': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5doq1624': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p3k4yh4m': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hm9wynm5': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e1mvsgrd': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2h34nbcd': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3ax5j2hv': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'znp2pw8p': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wzmc4d8u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z58wr82y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
