# Vorbereitung

Mache die folgenden Abschnitte von http://guides.rubyonrails.org/index.html offline verfügbar:

  * Models
  * Views
  * Controllers
  * Other Components
     * Active Support Core Extensions
  * Digg Deeper
     * Rails Internationalization API
     * Securing Rails Applications
     * Debugging Rails Applications
     * Configuring Rails Applications
     * The Rails Command Line
     * The Asset Pipeline
     * Working with JavaScript in Rails
     * Caching with Rails: An Overview

Diese Website gibt es auch in einer Offline-Version (incl. Suche) http://devdocs.io
Setze dein System auf und stelle sicher, dass der Test läuft und grün ist. (`rake test`)
Diese Themen werden behandelt:

  * CSS-Selektoren
  * Scaffolding
  * Verwendung regulärer Ausdrücke in Ruby
  * ActiveRecord (Associations, Validations)
    
# Anfangszustand

```bash
git clone https://github.com/DHBW-KA/rails_klausur_2020.git
cd rails_klausur_2020
bin/setup
rails test
```

Sollte am Ende diese Ausgabe haben:

`1 tests, 1 assertions, 0 failures, 0 errors, 0 skips`

# Abgabe

Kopiere diesen ganzen Ordner auf den USB-Stick. Benenne den Ordner in deine Matrikelnummer um!

# Aufgabe

Erstelle ein Programm zur Verwaltung von Infektionen z.B. mit COVID-19
Dazu sind folgende Modelle notwendig (Beim Generator die Option -s nicht vergessen!):

* Patient
    * name:string
    * email:string
    * mobile:string
    * Hat keine, eine oder mehrere Infektionen
    * Gehört zu einem Doctor und damit auch zu einem Laboratory
* Infection
    * name:string
    * Gehört zu einem Patienten
* Doctor
    * name:string
    * Hat viele Patienten
    * Gehört zu einem Laboratory
* Laboratory
   * name:string
   * Weist Infektion bei Patient nach
   * Hat mehrere Doctors

## Weiteres Vorgehen

* Erzeuge die notwendigen Modelle, Tabellen und Join-Tabellen
* Lege die Rückwärts-Relationen an
* Zu einigen Tests finden sich in den jeweiligen Kommentaren zu dem Test weitere Hinweise zur Implementierung. 
* Bearbeitungszeit: 60 Minuten

# Kompatibilität
Die Klausur wurde getestet mit 
 * Ubuntu (in Docker): ruby 2.7.0 `docker build -t klausur . && docker run --rm -it -v $(pwd):/app klausur`
 * MacOS: ruby 2.7.0 und 2.6.5

Mit Ruby 2.7.0 und 2.7.1 erscheinen einige deprecation warnings.