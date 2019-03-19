# MultiCurse

MultiCurse is a project to replace certain aspects of the Twitch / Curse Launcher for Minecraft Modpacks.
https://www.twitch.tv/downloads

MultiCurse can download modpacks from Curseforge that follow the following format: https://minecraft.curseforge.com/projects/PROJECTNAME

It cannot process modpacks from https://www.feed-the-beast.com/, but these can be natively downloaded through the included MultiMC Instance

MultiCurse is currently out of Compliance with the Licensing Terms of MultiMC. Please do not sue me.

## Credits
MultiCurse uses the following Projects:
 - [MultiMC](https://multimc.org/), distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0). |  [Source Code](https://github.com/MultiMC/MultiMC5/)
 - [Curse ModPack Downloader](https://github.com/Vazkii/CMPDL), by Vazco Lavos (aka. Vazkii), under the [WTFPL License](http://www.wtfpl.net/about/). |  [Source Code](https://github.com/Vazkii/CMPDL)

## Usage
 - Download and extract all files from https://github.com/DSchaedler/MultiCurse/raw/master/MultiCurse.zip
 - Edit config.txt to include the name of your modpack (As formatted in the curseforge link) as well as the Mincraft version the pack runs on.
 - Run Install.bat to download the modpack files from curseforge, and create a MultiMC profile for the specified pack.
 - A shortcut to the inculded MultiMC installation will be created
 - YOU MUST MANUALLY INSTALL FORGE TO THE NEW MULTIMC INSTANCE. [Instructions](https://www.reddit.com/r/feedthebeast/comments/2xlmxx/how_to_install_forge_onto_a_new_multimc_instance/cp16q3f)
 - After Installing forge, the pack is ready to launch in MultiMC.
 - Multiple packs can be installed by changing the information in config.txt and running Install.bat again.
 - Running Install.bat for an existing modpack will overwrite the profile with the latest version of the Modpack. This will likely require you to re-install Forge.

## Why the 'zzz' Folder?
The installation scripts use the first letter of the modpack folder from CMPDL and the cursforge name to combine the two folders into a single instance. No Modpacks are named that they come after 'zzz' Alphabetically, ensuring they are found and used by the scripts. If you make a modpack called 'zzzz', this script will break and I will be sad.

 ## License
Applicable Files (Excluding the Property of MultiMC and Vazco Lavos) are Licensed under the MIT License, reproduced below.

 
MIT License

Copyright (c) 2019 D Schaedler

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
