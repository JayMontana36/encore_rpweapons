# encore_rpweapons
A simple framework-agnostic FiveM script to enhance weapon mechanics for roleplay servers. Disables, forces first person, and prevents the common "First Person Third Person Cover" workaround.

## Installation

Add the `encore_rpweapons` folder to your FiveM resources folder and ensure the script is started.

## Configuration

All configuration can be done in the `~/config.lua` file.

### Reticle

**`Disable`**
Disables the weapons reticle for all guns except the ones listed in `ExemptWeapons` when set to `true`.

**`ExemptVehicle`**
Enables the reticle when shooting from vehicles when set to `true`.

**`ExemptWeapons`**
A list of weapons that are exempt from having their reticles disabled. This is set to a sane default of primarily sniper rifles by default.

### ThirdPerson

**`Disable`**
Forces first person camera when aiming or firing a gun.

**`DisableFPTPCover`**
Blocks the common workaround/cheat for aiming while in cover using the "First Person Third Person Cover" option in GTA/FiveM camera settings. When set to `true`, it will black out the screen of any player who has First Person Third Person cover enabled and is aiming or firing from cover.

### Updates

**`CheckForUpdates`**
Automatically checks for updates on resource start and warns in console about outdated versions when set to to `true`.
## Support

Support for specific framework integrations is not provided. If you need general support, or have found a bug, feel free to open an issue or submit a pull request.

## Known Bugs

- With automatic weapons, if you begin firing immediately without first focusing the there is a delay between the first and second shots. PRs welcomed!

## License

encore_rpweapons is licensed under the MIT license. See [LICENSE.md](LICENSE.md) for more details.