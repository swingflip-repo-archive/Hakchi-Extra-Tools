# Hakchi-Extra-Tools
A collection of simple tools to assist in your build of hakchi on your SNES Mini.

These are some mega basic batch tools which are powered by FART, FNR and JREN for the use on Windows. These were designed to run in conjunction with my own fork of Hakchi2 however these tools can be downloaded and used standalone in any install of hakchi.

## Featured tools:

  - Hakchi MAME Renamer - (Rename MAME roms entered into Hakchi with true ROM names)
  - Hakchi ROM Cleaner - (Cleans roms entered into Hakchi and removes hard-coded tags and special characters)

#### How to use:

All you need to do is download the files and dump them directly into your games_snes folder within your hakchi2 install.
(e.g. C:\hakchi2\games_snes)

Either run Hakchi_MAME_renamer.bat for the MAME renamer tool or Hakchi_Rom_cleaner.bat for the rom cleaner.

The scripts are autonomous and will run on their own. Just follow the basic instructions....

Please note! The MAME renamer tool covers approximately 31,000 different rom titles! Each rom usually takes around 0.5 seconds to run. So this is a one time script you want to run over night or just leave running in the background somewhere!

#### How to modify

If you open any the tools using a text edit tool (Notepad++ is a good one) you can edit the code with no issues. You don't need much coding knowledge as these files are very basic and pretty self explanatory.

In the Rom Cleaner I created 2 arrays of possible tags to look for. If you want to remove them then do so and if you want to add tags to look for then add them. Just make sure both the tag_array and escaped_tag_array have the same amount of values. Obviously escape the tags in the escaped_tag_array...

If you make any changes and you want to test add echo before FART, call jren, FNR etc.... it will echo out the commands but not run them so you can check you got it right...

## Shout Outs:
 - madmonkey1907 'madmonkey' - [Github Link](https://github.com/madmonkey1907)
 - Alexey 'Cluster' Avdyukhin - [Github Link](https://github.com/ClusterM)
 - DanTheMan827 - [Github Link](https://github.com/DanTheMan827)
 - Kyland K AKA KMFDManic - [Github Link](https://github.com/KMFDManic) - [Youtube link](https://www.youtube.com/channel/UCoRrbw6gyi4KRPGUNnVVjMQ) (Tutorial king!)
 - Lionello Lunesu - Find And Replace Text command line utility
 - Dave Benham - JREN.BAT - Rename files/folders using regular expressions
 - ENTech Solutons - FNR Find and Replace
 

#### Final Note:
I made these for personal use and they served me a purpose. I just put these up here if people want to adapt them, use them etc. It is what it is. Good luck!
