# latex
This repository contains a beamer theme for making TU Dublin based presentations. The theme is broken down into three files

## Colour Theme 

The colour theme, provided by *beamercolorthemecurlew.sty* follows the standard beamer format of defining colours in a separate file. This theme uses the dark cerulean from the TU Dublin logo as its primary colour. The color theme can be used alongside any beamer theme by adding 

```latex
\usecolortheme{curlew}
```

to the preamble (after including the beamer theme).

## Main Theme

The main theme, provided by *beamerthemedublin.sty* mixes the standard beamer *miniframes* and *infoline* outer themes, and includes the curlew colour theme (TU Dublin styling). This theme can be included by adding

```latex
\usetheme{dublin}
```

to the preamble (after including the beamer package). Theme Dublin adds the curlew colour theme by default.

## Style File
*tudslides.cls* extends the beamer class, adding a table of contents after every section, and adding extended support for maintaining multiple lectures in a single document using the lecture command. It includes some packages useful for making computer science slides, such as minted, and sets up support for pdfcomments, useful for adding notes to slides done with the [presentation app](http://iihm.imag.fr/blanch/software/osx-presentation/) (MacOS only). This class can be added by changing the documentclass to

```latex
\documentclass[compress]{tudslides}
```

The class file includes all other styles by default.

# Installation
1. Create a directory to store all local latex assets, if it doesn't already exist

```bash
mkdir -p $(mkdir -p $(kpsewhich -var-value=TEXMFHOME)
```

2. Copy the tex folder at the root of this repository into the folder your just created

```bash
cp -r /path/to/repository $(kpsewhich -var-value=TEXMFHOME)
```

3. Include style files as desired

# Bugs/Support
If you find any bugs or need help getting these styles set up, please open an **Issue** on this page. Pull requests with improvements are always welcome. You can contact the author at [Jack.ONeill@TUDublin.ie](mailto:Jack.ONeill@TUDublin.ie)
