# Gloss Testapplicatie

## Stap 1: repository afhalen

Maak een kopie van deze repository op je lokale schijf. Hiervoor voer je
bijvoorbeeld volgend commando uit (in je favoriete shell op GNU/Linux,
BSD of macOS; in Git Bash op Windows):

```sh
git clone https://github.com/ninewise/glosstest.git
```

## Stap 2: dependencies resolven

Navigeer naar je kopie van deze repository in je shell (op Windows
gebruik je de command prompt, niet je Git Bash). Initialiseer een nieuw
stackproject met onderstaand commando:

```sh
stack init
```

## Stap 3: compileren en test uitvoeren

Vervolgens wil je de gevonden dependencies installeren, alles
compileren, en je programma uitvoeren. Dit alles kan je combineren met
het `run` commando. De eerste keer dat je dit uitvoert kan dit even
duren, omdat stack een aantal grafische bibliotheken zal downloaden en
compileren.

```sh
stack run
```

Als alles goed gegaan is, krijg je nu een trillende cirkel te zien
in een nieuw venster, dewelke je kan bewegen met behulp van je
pijltjestoetsen.

## Als niet alles goed gaat

* Je krijgt tijdens de compilatie of uitvoering foutmeldingen over
  GLUT functies: er staat geen OpenGL geïnstalleerd op je systeem.
  Installeer [freeglut](http://freeglut.sourceforge.net/) of een andere
  implementatie.
