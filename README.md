# CommonCore

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/common_core`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
git clone git@github.com:alanzoppa/common_core.git
cd common_core
bin/setup
```

## Usage

```
bin/curriculum
```

will print something like this

```
═══════════════════════════════════════════════════════════════════════════════
║                 NAME                 ║             LESSON PLAN              ║
═══════════════════════════════════════════════════════════════════════════════
║         Albin Stanton                ║    K.RI, 1.RI, 2.RF, 2.RI, 3.RF      ║
║         Erik Purdy                   ║    1.RL, 1.RI, 2.RI, 2.RL, 2.L       ║
║         Aimee Cole                   ║    K.RF, K.RL, 1.RF, 1.RL, 1.RI      ║
║         Frederik Schulist            ║    2.RF, 3.RF, 4.RI, 4.RL, 4.L       ║
║         Addie Green                  ║    K.RI, 1.RI, 2.RF, 2.RI, 2.L       ║
║         Missouri Auer                ║    1.RI, 2.RI, 2.RL, 2.L, 3.RL       ║
║         Christopher Hayes            ║    K.RI, 1.RI, 2.RI, 2.L, 3.RI       ║
║         Enos Jacobi                  ║    K.RF, K.RL, 1.RF, 1.RL, 2.RF      ║
║         Conrad Nitzsche              ║    K.RI, 1.RF, 1.RI, 2.RF, 2.RI      ║
║         Jazlyn Wisoky                ║    3.RL, 3.L, 4.RL, 4.L, 5.RI        ║
║         Kelley Emard                 ║    K.RF, K.RI, 1.RF, 1.RI, 2.RF      ║
║         Dell Kozey                   ║    K.RF, 1.RF, 2.RF, 2.L, 3.RF       ║
║         Kraig Goldner                ║    2.RI, 3.RI, 3.L, 4.RI, 4.RL       ║
║         Stephon Ondricka             ║    2.L, 3.RI, 3.L, 4.RI, 4.L         ║
║         Tracey Lind                  ║    K.RF, 1.RF, 1.RL, 2.RF, 2.RL      ║
║         Elissa Schinner              ║    1.RI, 2.RI, 3.RL, 3.RI, 4.RI      ║
║         Orpha Bartoletti             ║    1.RF, 2.RF, 2.RI, 2.L, 3.RF       ║
║         Timmothy Torphy              ║    K.RF, K.RI, 1.RF, 1.RL, 1.RI      ║
║         Maia Torphy                  ║    K.RF, 1.RF, 2.RF, 2.RI, 2.L       ║
║         Danyka Pfeffer               ║    2.L, 3.L, 4.L, 5.RI, 5.RL         ║
║         Leo O'Connell                ║    K.RL, K.RI, 1.RL, 1.RI, 2.RI      ║
║         Scotty Kovacek               ║    K.RF, 1.RF, 2.RF, 2.L, 3.RF       ║
║         Cameron Prohaska             ║    2.RF, 2.RI, 3.RF, 3.RI, 4.RI      ║
║         Angus Torp                   ║    2.RF, 2.L, 3.RF, 3.L, 4.RL        ║
║         Douglas Feil                 ║    1.RF, 1.RL, 1.RI, 2.RF, 2.RI      ║
║         Maxime Runte                 ║    K.RL, 1.RL, 2.RF, 2.RL, 2.L       ║
║         Mortimer Denesik             ║    K.RF, K.RL, 1.RF, 1.RL, 2.RF      ║
║         Bennett Muller               ║    2.L, 3.L, 4.L, 5.RI, 5.RL         ║
║         Ayana Runolfsson             ║    K.RF, 1.RF, 2.RF, 2.RL, 2.L       ║
║         Angelina Runolfsson          ║    K.RF, 1.RF, 1.RI, 2.RF, 2.RI      ║
═══════════════════════════════════════════════════════════════════════════════
```

if you prefer to to print a bunny-bordered table, just override HORIZONTAL_CHAR and VERTICAL_CHAR

```
$ HORIZONTAL_CHAR=🐇  VERTICAL_CHAR=🐇  bin/curriculum

🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇
🐇                 NAME                 🐇             LESSON PLAN              🐇
🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇
🐇         Albin Stanton                🐇    K.RI, 1.RI, 2.RF, 2.RI, 3.RF      🐇
🐇         Erik Purdy                   🐇    1.RL, 1.RI, 2.RI, 2.RL, 2.L       🐇
🐇         Aimee Cole                   🐇    K.RF, K.RL, 1.RF, 1.RL, 1.RI      🐇
🐇         Frederik Schulist            🐇    2.RF, 3.RF, 4.RI, 4.RL, 4.L       🐇
🐇         Addie Green                  🐇    K.RI, 1.RI, 2.RF, 2.RI, 2.L       🐇
🐇         Missouri Auer                🐇    1.RI, 2.RI, 2.RL, 2.L, 3.RL       🐇
🐇         Christopher Hayes            🐇    K.RI, 1.RI, 2.RI, 2.L, 3.RI       🐇
🐇         Enos Jacobi                  🐇    K.RF, K.RL, 1.RF, 1.RL, 2.RF      🐇
🐇         Conrad Nitzsche              🐇    K.RI, 1.RF, 1.RI, 2.RF, 2.RI      🐇
🐇         Jazlyn Wisoky                🐇    3.RL, 3.L, 4.RL, 4.L, 5.RI        🐇
🐇         Kelley Emard                 🐇    K.RF, K.RI, 1.RF, 1.RI, 2.RF      🐇
🐇         Dell Kozey                   🐇    K.RF, 1.RF, 2.RF, 2.L, 3.RF       🐇
🐇         Kraig Goldner                🐇    2.RI, 3.RI, 3.L, 4.RI, 4.RL       🐇
🐇         Stephon Ondricka             🐇    2.L, 3.RI, 3.L, 4.RI, 4.L         🐇
🐇         Tracey Lind                  🐇    K.RF, 1.RF, 1.RL, 2.RF, 2.RL      🐇
🐇         Elissa Schinner              🐇    1.RI, 2.RI, 3.RL, 3.RI, 4.RI      🐇
🐇         Orpha Bartoletti             🐇    1.RF, 2.RF, 2.RI, 2.L, 3.RF       🐇
🐇         Timmothy Torphy              🐇    K.RF, K.RI, 1.RF, 1.RL, 1.RI      🐇
🐇         Maia Torphy                  🐇    K.RF, 1.RF, 2.RF, 2.RI, 2.L       🐇
🐇         Danyka Pfeffer               🐇    2.L, 3.L, 4.L, 5.RI, 5.RL         🐇
🐇         Leo O'Connell                🐇    K.RL, K.RI, 1.RL, 1.RI, 2.RI      🐇
🐇         Scotty Kovacek               🐇    K.RF, 1.RF, 2.RF, 2.L, 3.RF       🐇
🐇         Cameron Prohaska             🐇    2.RF, 2.RI, 3.RF, 3.RI, 4.RI      🐇
🐇         Angus Torp                   🐇    2.RF, 2.L, 3.RF, 3.L, 4.RL        🐇
🐇         Douglas Feil                 🐇    1.RF, 1.RL, 1.RI, 2.RF, 2.RI      🐇
🐇         Maxime Runte                 🐇    K.RL, 1.RL, 2.RF, 2.RL, 2.L       🐇
🐇         Mortimer Denesik             🐇    K.RF, K.RL, 1.RF, 1.RL, 2.RF      🐇
🐇         Bennett Muller               🐇    2.L, 3.L, 4.L, 5.RI, 5.RL         🐇
🐇         Ayana Runolfsson             🐇    K.RF, 1.RF, 2.RF, 2.RL, 2.L       🐇
🐇         Angelina Runolfsson          🐇    K.RF, 1.RF, 1.RI, 2.RF, 2.RI      🐇
🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇🐇
```
