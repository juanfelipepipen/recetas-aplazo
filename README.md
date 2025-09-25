# Recetas Aplazo

App de búsqueda de recetas para experimentar en la cocina con todos sus detalles para hacer una
preparación genial.

## **Descripción**

Recetas Aplazo proporciona una forma simple, elegante y rápida para descubrir nuevas recetas para
preparar y experimentar en la cocina, conocimientos.

## **Información técnica**

### **Arquitectura**

Mediante el uso de Clean Architecture y una separación eficiente del estado, se logró un
resultado que combina fluidez con robustez para el control de estados complejos.

Para BLoC, se utilizó una librería que provee de herramientas para una gestión eficiente y
predecible de funciones asíncronas utilizando BLoC y Cubit; de este modo, se simplifican
operaciones que, de forma manual, solo provocarían código repetido en cada State de cada
Bloc desarrollado.

### **Patrones usados**

1. **BLoC**: Control del State Management (Cubit + CubitFetch)
2. **CubitFetch**: Wrapper de BLoC para obtener clases FetchSuccess<T>, FetchLoading<T> y FetchFailed<T>
3. **Repository**: Abstracción para el acceso de datos
4. **Injection**: Inyección de dependencias con GetIt

### **Estructura de carpetas**

```
lib/
├── src/
│   ├── core/             # Configuraciones de app
│   ├── data/             # Modelos de datos
│   │   └── entities/
│   ├── feature/          # Funcionalidades principales (pages)
│   │   └── pages/
│   │       ├── home/
│   │       │   ├── data
│   │       │   │   ├── repository // Implementación de repositorios
│   │       │   │   └── services   // Servicios utilizados en repositorios
│   │       │   ├── domain
│   │       │   │   ├── bloc       // Bloc classes
│   │       │   │   ├── listener   // BlocListeners
│   │       │   │   └── repository // Repositorios base
│   │       │   └── presentation
│   │       └── recipe/
│   │       └── search/
│   │       └── root/
│   ├── shared/           # Shared features (componentes reutilizables)
│   │   ├── components/   // Widgets reutilizables
│   │   ├── di/           // Dependency Injection
│   │   ├── dio/          // Dio service
│   │   ├── extensions/   // Extensions
│   │   ├── I10n/         // Localization
│   │   ├── router/       // Router (GoRouter) y PageRoute classes
│   │   └── storage/      // Servicios de storage con ObjectBox y cache
```

## **Ejecutar app**

### **Requisitos**
- Flutter SDK 3.0+

### **Instalación**
En la raíz del proyecto, se encuentra el apk compilado de la app, listo para ser instalado en dispositivos Android con versión

```
app-release.apk
```

#### **Ejecutar app**
Para poder ejecutar la aplicación, es necesario seguir los siguientes pasos:

```shell
flutter pub get               # Instalar dependencias
flutter run                   # Ejecutar app en modo desarrollo
```

#### **Compilar app**

```shell
flutter build apk --release   # Compilar app en modo release
```

## **Pantallas**

### **Home**
- Listado de recetas con scroll infinito y paginado por orden alfabético
- Recetas con Skeleton
- Manejo simple de errores en fetch
- Caché para no realizar peticiones repetidas
- Acceso a la pantalla de búsqueda
- Datos generales de recetas y marcador de favoritos

### **Search**
- Input para búsqueda de receta
- Debounce de 1 segundo antes de realizar la búsqueda
- Listado de resultados (mismo card de receta del Home)
- Manejo simple de errores en fetch
- Información de búsqueda en casos vacios

### **Receta (Detalle)**
- Fetch de datos de receta
- Skeleton de carga en pantalla
- Manejo simple de errores en fetch
- Agregar a favoritos

## **Decisiones técnicas**

### **BLoC**

Para el uso de la gestión del estado en la app, se utilizó flutter_bloc, con una diferencia simple
pero que permite un uso eficiente de recurosos, el uso de la librería
[pipen_bloc](https://pub.dev/packages/pipen_bloc) es una herramienta de autoría propia, que
funciona como un wrapper con esteroides para flutter_bloc, ya que, simplifica el manejo del estado
en casos donde necesitamos consistencia y control de operaciones asincronas, esto nos permite:

- **FetchSuccess<T>, FetchLoading<T> y FetchFailed<T>**: Estas clases, agrupan posibles resultados
  y manejo del estado en casos de carga, exito o falla, además de ser estrictamente del tipo que
  indiquemos.
- **Builders**: La librería ya cuenta con componentes reutilizables y adaptables para hacer
  BlocBuilder pero con Blocs que exienten de CubitFetch o CubitFetchResolverPending
- **Listeners**: Es muy sencillo el escuchar cambios del estado y conocer que tipo de cambio

### **GoRouter**
- **Ruteo de pantallas**: Indicadores visuales mientras se cargan los datos
- **Route classes**: Clase a modo con parámetros y funciones de navegación para consistencia en
  parámetros de ruta ej. Recipe(id: 1).go(context) [pipen_library](https://pub.dev/packages/pipen)

## **¿Qué son las librerías pipen?**

Son librerías disponibles en pub.dev desarrolladas por mí, las cuales, simplifican mucho funcionalidades
indispensables en un app Flutter, de forma elegante, concisa y sencilla de usar. Va desde lo más simple
hasta temas complejos de manejar en un entorno basado en Widgets. Fueron pensadas para ser utilizadas
en cualquier tipo de proyecto, ya sea Flutter o DartNative, además de ser un aporte para la comunidad,
desarrolladas en mis tiempos libres, han logrado en apps productivas, un ahorro significativo de tiempo
de desarrollo al tener muchísimos componentes ya listos para ser integrados (documentación pendiente),
algunos ejemplos son:

- **pipen (core library)**: Librería centralizada con componentes para (graphql wrapper,
  animations, routing, storage, extensions)
- **pipen_bloc**: Implementación BLoC para fetch asíncrono con (error manager, listen fetch,
  exception translator, builders)
- **pipen_echo**: Implementación BLoC para fetch asíncrono
- **cloux**: Wrapper para operaciones REST con DIO
- **formux**: Manejo completo de componentes de tipo field (validaciones, state management con BLoC,
  componentes de formulario, custom inputs, error translations)

### **Herramientas utilizadas**

1. **bloc_test**: Testing para BLoC
2. **mocktail**: Mocking de instancias para tests
3. **dio**: HTTP client
4. **objectbox**: ORM para almacenamiento de datos localmente

### **Estructura de testing**

```
test/
├── feature/                  # Tests por feature
│   ├── home/
│   │   ├── domain/
│   │   │   ├── bloc/        # Tests de BLoCs
│   │   └── data/
│   │       └── repository/  # Tests de repositorios
│   ├── recipe/
│   └── search/
```
## **Limitaciones de proyecto**

- **Categorización de recetas**: Debido a contratiempos, no se incluyó una personalización en el
  identificador de la categoría y area de cada receta (colores diferentes).
- **Testing**: El feature de testing para pipen_bloc, actualmente en desarrollo, no pudo ser
  incluido en pruebas de unidad por problemas de estabilidad.
- **Pruebas de unidad**: Nuevamente, debido a contratiempos, no se incluyeron unit test en extenso
  para servicios específicos.