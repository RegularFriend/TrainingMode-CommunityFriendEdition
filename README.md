<img  src="Logos/Uncle-Punch-Training-Mode-banner.png"  alt=""  width="300"/>

# Training Mode - A Melee Modpack for Practicing Tech

Training Mode is a modpack for Super Smash Bros. Melee that aims to streamline practice by providing pre-made individual training scenarios. This mod utilizes the event mode present in Super Smash Bros. Melee and reworks them to focus around specific techniques,complete with automatic savestate functionality to allow for rapid-fire practice. Some events have included video tutorials playable in-game (ISO version only) to teach the player about the tech and how to perform it. In addition to these events, Training Mode also includes onscreen text displays which provide you with information otherwise unavailable to you mid-game.

## How To Compile the ISO on Windows

### Option 1. Use the training pack builder (recommended)

1.) Download the [training pack builder](https://smashboards.com/threads/training-mode-v3-0-updated-12-26-20.456449/), extract the zip, open the `TM ISO Builder` folder then open the folder that represents your operating system.

2.)  
**(Windows)** Find your v1.02 Melee.iso file and click and drag your v1.02 Melee.iso file onto the `Drag Melee v1.02 Here.bat` as if it was a folder that you were putting a file into. A terminal window will come up, informing you that this build process will take a couple minutes.
**(Mac/Linux)** Follow the instructions in the .txt file.

3.) Move your newly generated `Training Mode v3.0 Alpha 7.2.iso` file into the same folder that your melee ISO was in (should be the folder Dolphin looks at for ISO files).

4.) Refresh dolphin to see the new Training Pack in your list of games on Dolphin.

### Option 2. Build the ISO with GCRebuilder

1.) Download this repository, open the `Build TM Codeset` folder and run the `Build Training Mode Codeset.bat` file. This will generate a file called `codes.gct` in the `Additional ISO Files` folder. _Thanks to Fizzi36 for this tool_

2.) Due to copyright issues, I cannot post the necessary Melee v1.02 `Start.dol` file for this next step - you must either _find_ or _extract_ your own `Start.dol` file. Once you have your `Start.dol` file, open the `Build TM Start.dol` folder. Click and drag your `Start.dol` file onto the `Drag Melee v1.02 Start.dol Here.bat` as if it was a folder that you were putting a file into. A terminal window will appear saying that your newly created files should be available in the `Additional ISO Files` folder.

3.) Download [GCRebuilder](https://www.romhacking.net/utilities/619/) and copy the contents of `Additional ISO Files` to an NTSC 1.02 Melee root folder and rebuild the ISO.

## How To Compile The ISO on MacOS

Note: I haven't tested this on Linux.

### Things you'll need

1.) Install [brew](https://brew.sh/)

2.) Run `brew install go wine xdelta`. This will install `wine` for running GCR, `go` for building our mass assembler, and `xdelta` for patching the .iso.

3.) Download a copy of [GCRebuilder](http://www.romhacking.net/utilities/619/)

4.) Clone or download the [JLaferri/gecko repo](https://github.com/JLaferri/gecko)

### Before your first build

Note: `$PROJECTROOT` prefers to the root of this project

1.) `cd` into wherever you downloaded the JLaferri/gecko repo (e.x `~/Downloads/gecko`)

2.) Run `go build`. This will generate a an executable called `gecko`. Place that executable in the `$PROJECTROOT/Build TM Codeset/mac` directory of this project

3.) You'll need the `Start.dol` file from your Melee iso, this is where `wine` comes in handy. Run `wine $PATH_TO_GCREBUILDER.exe`, GCRebuilder should open its own window, from there you can extract your `Start.dol`. **Your Melee iso md5 hash should be equal to 0e63d4223b01d9aba596259dc155a174**.

### Building

1.) cd into `$PROJECTROOT/Build TM Codeset/mac`, and run `./gecko build`. This will mass assemble the `.asm` files in the `$PROJECTDIR/ASM` directory, you should end up with a `codes.gct` file in `$PROJECTDIR/Additional ISO files`.

Example output:

```none

Writing to ../../Additional ISO Files//codes.gct...

Successfuly wrote codes to ../../Additional ISO Files//codes.gct

Process time was 25.577666254s

```

2.) Run `./modifyStartDol.sh $PATH_TO_YOUR_START.DOL`, where `$PATH_TO_YOUR_START.DOL` is where the `Start.dol` you extracted is located. This will generate a new `Start.dol` at `$PROJECTROOT/Additional ISO Files/Start.dol`

3.) You can now copy the contents of `$PROJECTROOT/Additional ISO Files` to an NTSC 1.02 Melee root folder and rebuild the ISO, using GCRebuilder as we did in Step 3 in _Before your first build_.

### Common Errors

1.) When running GCRebuilder with wine it crashes with **dyld: Symbol not found: \_gliCreateContextWithShared**

A) [this](https://stackoverflow.com/questions/22732381/dyld-symbol-not-found-but-nm-reports-otherwise-os-x-update-issue) solves the issue.

2.) **xdelta3: target window checksum mismatch: XD3_INVALID_INPUT**

A) Your `Start.dol` you extracted from Melee isn't correct. Make sure your .iso has a md5 hash equal to `0e63d4223b01d9aba596259dc155a174`.
