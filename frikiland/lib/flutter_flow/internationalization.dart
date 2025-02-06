import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

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
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '2opd1i8i': {
      'es': 'Inicio sesión',
      'en': 'Login',
    },
    '78b0tfaa': {
      'es': 'Ingrese su correo electrónico',
      'en': 'Enter your email',
    },
    'vzi06vja': {
      'es': 'Ingrese su contraseña',
      'en': 'Enter your password',
    },
    'vucpusmc': {
      'es': '¿No tiene una cuenta?',
      'en': 'Don\'t have an account?',
    },
    'shn321di': {
      'es': 'Ingrese aquí',
      'en': 'Enter here',
    },
    'puiqey4h': {
      'es': 'Iniciar Sesión',
      'en': 'Log in',
    },
    'qfl4qzsy': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Index
  {
    'jvuy4gvu': {
      'es': 'Tu tienda online \nfriki favorita',
      'en': 'Your favorite geeky online store',
    },
    'z2h6szqz': {
      'es': '¡Date el gusto de tener lo que te gusta!',
      'en': 'Treat yourself to what you like!',
    },
    '5a6erbz8': {
      'es': 'Productos',
      'en': 'Products',
    },
    't6xxsp3p': {
      'es': 'Habla con Nosotros',
      'en': 'Speak with us',
    },
    's6nxwxqh': {
      'es': 'Mensaje de Texto',
      'en': 'Text message',
    },
    'uxujvea9': {
      'es': 'Enviar',
      'en': 'Send',
    },
    'kvseaoyh': {
      'es': '¡Siguenos \nen nuestras\nredes sociales!',
      'en': 'Follow us on our social networks!',
    },
    'szmb8rh2': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Register
  {
    'nzu97dxr': {
      'es': 'Registro',
      'en': 'Record',
    },
    'fk4a3xel': {
      'es': 'Ingrese su correo electrónico',
      'en': 'Enter your email',
    },
    'iu4pmlvq': {
      'es': 'Ingrese una contraseña',
      'en': 'Please enter a password',
    },
    'wv2ri8ts': {
      'es': '¿Ya tiene una cuenta?',
      'en': 'Already have an account?',
    },
    '5jhl7ynq': {
      'es': 'Ingrese aquí',
      'en': 'Enter here',
    },
    '3v1gpoaa': {
      'es': 'Registrarme',
      'en': 'Sign up',
    },
    'htkh5za9': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Products
  {
    '3pft8ekq': {
      'es': 'Productos',
      'en': 'Products',
    },
    'p9d2g9i7': {
      'es': '¡Encuentra lo que buscas!',
      'en': 'Find what you want!',
    },
    '8xm41tga': {
      'es': 'Filtrar por',
      'en': '',
    },
    'o6tnwbfp': {
      'es': 'Search for an item...',
      'en': '',
    },
    'xshkglrg': {
      'es': '',
      'en': '',
    },
    'hog04dlw': {
      'es': 'Agregar ',
      'en': '',
    },
    '1sx2u83l': {
      'es': 'Productos',
      'en': 'Products',
    },
  },
  // Profile
  {
    '8hpvakzs': {
      'es': 'Perfil de',
      'en': 'Profile of',
    },
    'agyb26cu': {
      'es': 'usuario',
      'en': 'user',
    },
    '3z4tgi3z': {
      'es': 'Nombre ',
      'en': 'Name',
    },
    'zf2h9349': {
      'es': 'Teléfono',
      'en': 'Phone',
    },
    'taczpsmo': {
      'es': 'Creación del\nperfil',
      'en': 'Creating the\nprofile',
    },
    '0tugtw7p': {
      'es': 'Editar Foto',
      'en': 'Edit Photo',
    },
    'fmzcbgmq': {
      'es': 'Editar datos',
      'en': 'Edit data',
    },
    'pu5dt9uh': {
      'es': 'cambiar contraseña',
      'en': 'change Password',
    },
    'mocpjmtd': {
      'es': 'Escoge una imagen de nuestra Galeria',
      'en': '',
    },
    '4ypd6lvl': {
      'es': 'Agregar como Perfil',
      'en': '',
    },
    'buq3j3tm': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Cart
  {
    'pv962d6n': {
      'es': 'Carrito',
      'en': 'Trolley',
    },
    'ji6chl4n': {
      'es': 'Subtotal',
      'en': 'Subtotal',
    },
    '3tgz3wht': {
      'es': 'Envío',
      'en': 'Shipment',
    },
    't6udhjwz': {
      'es': '₡ 1500.00',
      'en': 'Shipping price',
    },
    '9csa4c38': {
      'es': 'Total',
      'en': 'Total',
    },
    'g1e5hv78': {
      'es': 'Pagar',
      'en': 'Pay',
    },
    '46zm718x': {
      'es': 'Carrito',
      'en': 'Trolley',
    },
  },
  // configPage
  {
    '3uf2an9q': {
      'es': 'Configuración',
      'en': 'Setting',
    },
    'ete0sigq': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
    },
    'ac3ibcvi': {
      'es': 'Lenguaje',
      'en': 'Language',
    },
    'l9ahzq2l': {
      'es': 'Modo',
      'en': 'Mode',
    },
    'zqko0mor': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CRUDProducts
  {
    'dkmqj9ef': {
      'es': 'Lista de\nProductos',
      'en': '',
    },
    '7pab3vj7': {
      'es': 'Agregar',
      'en': '',
    },
    '8ipr1maq': {
      'es': 'Nombre',
      'en': '',
    },
    'kctxt2v5': {
      'es': 'Precio',
      'en': '',
    },
    'lcnmdo1e': {
      'es': 'Acciones',
      'en': '',
    },
    '19gcfutg': {
      'es': 'Home',
      'en': '',
    },
  },
  // IndexAdmin
  {
    'qjxyt454': {
      'es': 'Bienvenido\nadministrador',
      'en': '',
    },
    'jfwxcfk9': {
      'es': 'Categorías',
      'en': '',
    },
    'u17xoe67': {
      'es':
          'Para que realice acciones de\n crear y eliminar \ncategorías de la tienda',
      'en': '',
    },
    'qsplkjsz': {
      'es': 'Ingresar',
      'en': '',
    },
    'g4itppxv': {
      'es': 'Productos',
      'en': '',
    },
    'y4e1ev47': {
      'es':
          'Para que realice acciones de\n crear, editar y eliminar \nproductos de la tienda',
      'en': '',
    },
    'wa0xqwwi': {
      'es': 'Ingresar',
      'en': '',
    },
    'o4sxl0oc': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // CRUDCategories
  {
    'k1en39ph': {
      'es': 'Lista de\nCategorías',
      'en': '',
    },
    'ac5s6wr9': {
      'es': 'Agregar',
      'en': '',
    },
    'u84mvzn8': {
      'es': 'Nombre',
      'en': '',
    },
    'a4pzt6wj': {
      'es': 'Acciones',
      'en': '',
    },
    '0u0397ih': {
      'es': 'Home',
      'en': '',
    },
  },
  // DeleteProduct
  {
    '2dh2hoid': {
      'es': 'Eliminar producto',
      'en': '',
    },
    'qn986lam': {
      'es': '¿Seguro que quiere eliminar \nel producto?',
      'en': '',
    },
    '6u7meqj6': {
      'es': 'Producto: ',
      'en': '',
    },
    'oit2v5o6': {
      'es': 'Eliminar',
      'en': '',
    },
  },
  // EditProduct
  {
    '2z32xb33': {
      'es': 'Editar producto',
      'en': '',
    },
    'pbxj5j3t': {
      'es': 'Nombre',
      'en': '',
    },
    'sh5cg7ns': {
      'es': 'Precio',
      'en': '',
    },
    'wd6svxjv': {
      'es': 'Descripción',
      'en': '',
    },
    'l4gimdcu': {
      'es': 'Cantidad',
      'en': '',
    },
    'lz5v0gb5': {
      'es': 'Seleccione la categoría',
      'en': '',
    },
    '66enqh9t': {
      'es': 'Search for an item...',
      'en': '',
    },
    'uma54tug': {
      'es': '',
      'en': '',
    },
    'fj1cchg9': {
      'es': 'Subir imagen aquí',
      'en': '',
    },
    '5zxem27n': {
      'es': 'Editar',
      'en': '',
    },
  },
  // AddProduct
  {
    '7qt6404x': {
      'es': 'Agregar producto',
      'en': '',
    },
    '7j529h88': {
      'es': 'Nombre',
      'en': '',
    },
    'yh5rkuyx': {
      'es': 'Precio',
      'en': '',
    },
    'imwyksvc': {
      'es': 'Descripción',
      'en': '',
    },
    '78avoren': {
      'es': 'Cantidad',
      'en': '',
    },
    '5b3t5w6z': {
      'es': 'Seleccione la categoría',
      'en': '',
    },
    'yn6ck7tq': {
      'es': 'Search for an item...',
      'en': '',
    },
    '1x29mrt7': {
      'es': '',
      'en': '',
    },
    'uko0qvmp': {
      'es': 'Select...',
      'en': '',
    },
    'yxqy342z': {
      'es': 'Search...',
      'en': '',
    },
    '3rmymnql': {
      'es': 'Subir imagen aqui',
      'en': '',
    },
    '4txnt6lx': {
      'es': 'Agregar',
      'en': '',
    },
  },
  // bsEditUserPhoto
  {
    'nnnrs27n': {
      'es': 'Editar Perfil',
      'en': '',
    },
    't1w82q2u': {
      'es': 'Ingrese los cambios',
      'en': '',
    },
    'ah12wa7z': {
      'es': 'Selecciona el recuadro...',
      'en': '',
    },
    'or1g2efx': {
      'es': 'Agregar Foto',
      'en': '',
    },
    'fi2s6fmh': {
      'es': 'Actualizar',
      'en': '',
    },
    'ay9l5du2': {
      'es': 'Field is required',
      'en': '',
    },
    'z8ufc8fm': {
      'es': 'Please enter a real name',
      'en': '',
    },
    'i5bly0sm': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'wx3b8omo': {
      'es': 'Please enter a short desription',
      'en': '',
    },
    'wqv0jkbj': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2wu96264': {
      'es': 'We have to have a URL for the project.',
      'en': '',
    },
    'lpg7765a': {
      'es': 'Please enter a valid URL...',
      'en': '',
    },
    'qobbgbun': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ixyaxece': {
      'es': 'Field is required',
      'en': '',
    },
    'lgvjh4en': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // AddCategory
  {
    'oop70qju': {
      'es': 'Agregar categoría',
      'en': '',
    },
    'newa75yg': {
      'es': 'Categoría',
      'en': '',
    },
    '80dhj31y': {
      'es': 'Agregar',
      'en': '',
    },
  },
  // DeleteCategory
  {
    'a33fsnoi': {
      'es': 'Eliminar categoría',
      'en': '',
    },
    'rfb4v81s': {
      'es': '¿Seguro que quiere eliminar \nla categoría?',
      'en': '',
    },
    'wx9heopy': {
      'es': 'Categoría: ',
      'en': '',
    },
    'flwrl00x': {
      'es': 'Eliminar',
      'en': '',
    },
  },
  // bsEditUserInfo
  {
    'a18wo3co': {
      'es': 'Editar Perfil',
      'en': '',
    },
    '9pmfdmdt': {
      'es': 'Ingrese los cambios',
      'en': '',
    },
    'zef3ps0l': {
      'es': 'Nombre de Usuario...',
      'en': '',
    },
    'diap80yx': {
      'es': 'Telefono...',
      'en': '',
    },
    '4bsizgyw': {
      'es': 'Actualizar',
      'en': '',
    },
    '83crxgfq': {
      'es': 'Field is required',
      'en': '',
    },
    'kijjj9en': {
      'es': 'Please enter a real name',
      'en': '',
    },
    '2x4zng5n': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'ta1kydr3': {
      'es': 'Please enter a short desription',
      'en': '',
    },
    '3xwz5vs5': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '2ju1uucr': {
      'es': 'We have to have a URL for the project.',
      'en': '',
    },
    '1zyuesgw': {
      'es': 'Please enter a valid URL...',
      'en': '',
    },
    'uhigzphn': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'cdwihw7e': {
      'es': 'Field is required',
      'en': '',
    },
    'lrdjmlkq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // bsEditUserInfoCopy
  {
    'g93yj2cm': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'v0c6naxy': {
      'es': 'Ingrese los cambios',
      'en': '',
    },
    '18qyu07a': {
      'es': 'Ingrese su Email...',
      'en': '',
    },
    'z32fsmvs': {
      'es': 'Revisa el Correo tras enviar',
      'en': '',
    },
    'grk37avd': {
      'es': 'Enviar',
      'en': '',
    },
    'icr4dplo': {
      'es': 'Field is required',
      'en': '',
    },
    'cth3fs00': {
      'es': 'Please enter a real name',
      'en': '',
    },
    'fcf23q3n': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '07wcwauj': {
      'es': 'Please enter a short desription',
      'en': '',
    },
    '77tc7hfe': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'l3qj2p9v': {
      'es': 'We have to have a URL for the project.',
      'en': '',
    },
    '7jz3h2nd': {
      'es': 'Please enter a valid URL...',
      'en': '',
    },
    '785enbyf': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'apg4y0g8': {
      'es': 'Field is required',
      'en': '',
    },
    '60t8w3es': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '6a4vtuee': {
      'es': '',
      'en': '',
    },
    'ln0llxsh': {
      'es': '',
      'en': '',
    },
    'ddh1die8': {
      'es': 'Porfavor habilite la localizacion para identificar su region...',
      'en': '',
    },
    'mmpj11ds': {
      'es':
          'Porfavor habilite las notificaciones para recibir nuevas noticias...',
      'en': '',
    },
    '9wgwmcd1': {
      'es': 'Porfavor habilite la galeria para subir imagenes...',
      'en': '',
    },
    'kzfbi76u': {
      'es': '',
      'en': '',
    },
    'nkshrpke': {
      'es': '',
      'en': '',
    },
    'oa0fwdxy': {
      'es': '',
      'en': '',
    },
    'uio87s8f': {
      'es': '',
      'en': '',
    },
    'y7aeldsz': {
      'es': '',
      'en': '',
    },
    '1cbgpro9': {
      'es': '',
      'en': '',
    },
    'dbftb93o': {
      'es': '',
      'en': '',
    },
    '69zfzsab': {
      'es': '',
      'en': '',
    },
    '3h0cq972': {
      'es': '',
      'en': '',
    },
    'clvy7fqm': {
      'es': '',
      'en': '',
    },
    '402n2tqu': {
      'es': '',
      'en': '',
    },
    '7fsfyue7': {
      'es': '',
      'en': '',
    },
    'mc3x47lz': {
      'es': '',
      'en': '',
    },
    '76cjshxx': {
      'es': '',
      'en': '',
    },
    'aqedo0w0': {
      'es': '',
      'en': '',
    },
    '6uh0ed44': {
      'es': '',
      'en': '',
    },
    'h35k7nbv': {
      'es': '',
      'en': '',
    },
    '2xaury67': {
      'es': '',
      'en': '',
    },
    'sbq5rt0d': {
      'es': '',
      'en': '',
    },
    '9nd242r1': {
      'es': '',
      'en': '',
    },
    'fv6y5b8w': {
      'es': '',
      'en': '',
    },
    'xr4atmvw': {
      'es': '',
      'en': '',
    },
    'edkw55vh': {
      'es': '',
      'en': '',
    },
    'u161gyvu': {
      'es': '',
      'en': '',
    },
    'dczt0sz8': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
