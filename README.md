
# README - Proyecto Final de Estadística

## Descripción del Proyecto

Este proyecto implementa un análisis estadístico completo desarrollado para el curso de Estadística en IPAO 2024. [1](#0-0)  El sistema utiliza R como motor principal de análisis para procesar datos de encuestas estudiantiles y realizar múltiples pruebas estadísticas.

## Objetivo

El proyecto analiza variables relacionadas con el estrés estudiantil, rendimiento académico y factores socioeconómicos mediante técnicas estadísticas avanzadas, incluyendo pruebas de hipótesis, pruebas de normalidad y análisis de independencia.

## Estructura del Proyecto

```
ESTADISTICA-PROYECTO/
├── Proyecto Final/
│   ├── Proyecto Final Estadística.R    # Script principal de análisis
│   ├── .Rhistory                        # Historial de comandos R
│   ├── .RData                          # Espacio de trabajo R
│   └── Info/
│       └── Info.xlsx                   # Dataset principal
└── README.md                           # Documentación del proyecto
``` [2](#0-1) 

## Variables Analizadas

El dataset principal contiene las siguientes variables clave:

- **Estrés**: Nivel de estrés estudiantil
- **Promedio**: Promedio académico de los estudiantes
- **Materias**: Número de materias cursadas
- **Dificultad**: Percepción de dificultad académica
- **Economía**: Situación económica del estudiante [3](#0-2) 

## Análisis Estadísticos Realizados

### 1. Pruebas de Hipótesis
- **Pruebas Z** para medias de las variables Estrés, Promedio y Materias
- Cálculo de estadísticos de prueba: `z_statE`, `z_statP`, `z_statM`

### 2. Pruebas de Normalidad
- **Test de Kolmogorov-Smirnov** para evaluar normalidad de las distribuciones
- Aplicado a variables Estrés, Promedio y Materias

### 3. Pruebas de Independencia
- **Test Chi-cuadrado** para analizar independencia entre variables categóricas
- Análisis de relación entre Dificultad y Economía [4](#0-3) 

## Requisitos del Sistema

### Dependencias de R
- `readxl`: Para importación de archivos Excel
- `ggplot2`: Para visualización de datos
- `dplyr`: Para manipulación de datos
- `summarytools`: Para estadísticas descriptivas
- `stats`: Para funciones estadísticas [5](#0-4) 

### Instalación de Dependencias

```r
install.packages(c("readxl", "ggplot2", "dplyr", "summarytools"))
```

## Instrucciones de Uso

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/DERS0214/ESTADISTICA-PROYECTO.git
   ```

2. **Abrir R/RStudio** y establecer el directorio de trabajo:
   ```r
   setwd("path/to/ESTADISTICA-PROYECTO/Proyecto Final")
   ```

3. **Ejecutar el script principal**:
   ```r
   source("Proyecto Final Estadística.R")
   ``` [6](#0-5) 

## Visualizaciones Generadas

El proyecto genera múltiples visualizaciones estadísticas:

- **Gráficos de línea y área** para representar distribuciones
- **Curvas normales superpuestas** para comparar con distribuciones teóricas
- **Gráficos de pruebas de hipótesis** con resultados estadísticos [7](#0-6) 

## Metodología

El análisis sigue un pipeline estructurado:

1. **Importación de datos** desde Excel usando `readxl`
2. **Análisis descriptivo** con cálculo de medias, desviaciones estándar y longitudes
3. **Pruebas estadísticas** aplicando Z-tests, KS-tests y Chi-squared tests
4. **Visualización** de resultados con ggplot2
5. **Interpretación** y documentación de resultados [8](#0-7) 

## Resultados del Análisis

### Estadísticas Descriptivas
- Cálculo de medias, desviaciones estándar y tamaños de muestra para todas las variables
- Análisis de distribuciones mediante histogramas y gráficos Q-Q

### Pruebas de Hipótesis
- Evaluación de hipótesis sobre medias poblacionales
- Determinación de significancia estadística con niveles de confianza establecidos

### Pruebas de Normalidad
- Verificación de supuestos de normalidad para la aplicación de pruebas paramétricas
- Identificación de distribuciones que requieren pruebas no paramétricas [9](#0-8) 

## Archivos de Salida

- **`.RData`**: Espacio de trabajo con todas las variables y objetos creados
- **`.Rhistory`**: Historial completo de comandos ejecutados
- **Gráficos**: Visualizaciones estadísticas generadas durante el análisis

## Consideraciones Técnicas

### Gestión de Datos
- Los datos se cargan directamente desde Excel manteniendo la integridad original
- Se implementa control de acceso concurrente mediante archivos de bloqueo de Excel

### Entorno de Desarrollo
- Compatible con R base y RStudio IDE
- Gestión de dependencias mediante paquetes CRAN estándar
- Persistencia de sesión a través de archivos .RData [10](#0-9) 

## Autor

Proyecto desarrollado para el curso de Estadística - IPAO 2024

## Licencia

Este proyecto es de uso académico y educativo.

---

**Nota**: Para ejecutar exitosamente el análisis, asegúrate de que todos los archivos estén en sus ubicaciones correctas y que las dependencias de R estén instaladas antes de ejecutar el script principal.

## Notas

Este README está basado en un análisis completo del proyecto que incluye un sistema de análisis estadístico robusto con arquitectura por capas. [11](#0-10)  El proyecto implementa múltiples metodologías estadísticas y genera visualizaciones profesionales para la interpretación de resultados. La estructura modular permite fácil mantenimiento y extensión del análisis.
