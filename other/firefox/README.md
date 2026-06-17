
## <p align="center"> <b> Firefox Safari theme </b> </p>
![01](preview.png?raw=true)
<p align="center">A MacOSX Tahoe Safari theme for Firefox 120+</p>

## Description

This is a collection of CSS code to make Firefox look closer to the MacOSX Tahoe Safari theme.
Based on [firefox-gnome-theme](https://github.com/rafaelmardojai/firefox-gnome-theme).

**Note:** This is a CSS-based theme (userChrome.css). It will **not** appear in `about:addons`. It directly modifies the browser's user interface.

## Installation

### Automatic Installation (Recommended)

The included `tweaks.sh` script automatically detects your Firefox profiles (including Flatpak and Snap versions) and installs the theme.

1. Open your terminal in this directory.
2. Run: `./tweaks.sh -f`
3. Restart Firefox.

**Variants:**
- For the adaptive version: `./tweaks.sh -f adaptive`
- For the darker version: `./tweaks.sh -f darker`
- For the nord version: `./tweaks.sh -f nord`

*Note: For the adaptive version, you need to install the [Adaptive Tab Bar Colour](https://addons.mozilla.org/firefox/addon/adaptive-tab-bar-colour/) plugin first.*

### Manual Installation

1. Go to `about:support` in Firefox.
2. Under **Application Basics**, find **Profile Directory** and click **Open Directory**.
3. Copy the contents of the `chrome` folder from this directory into your Firefox profile directory. (You should end up with a folder named `chrome` inside your profile, containing `userChrome.css`, `userContent.css`, and the `Cupertino` folder).
4. Enable legacy stylesheets:
	1. Go to `about:config` in Firefox.
	2. Search for `toolkit.legacyUserProfileCustomizations.stylesheets`.
	3. Set it to `true`.
5. Restart Firefox.

## UI Configuration

To complete the look, open the Firefox customization panel (Right-click toolbar > Customize Toolbar):
1. Toggle the **Title bar** option according to your preference (usually disabled for a cleaner look).
2. Move the **New Tab** button to the headerbar.
3. Select Light or Dark variants in the Firefox theme switcher.

## Known bugs

### CSD have sharp corners
See upstream [bug](https://bugzilla.mozilla.org/show_bug.cgi?id=1408360).

#### Wayland fix:
1. Go to `about:config`.
2. Set `layers.acceleration.force-enabled` to `true`.
3. Restart Firefox.

#### X11 fix:
1. Go to `about:config`.
2. Search for `mozilla.widget.use-argb-visuals`.
3. Set it as a `boolean` and click the add button (+).
4. Restart Firefox.

## Development

To debug the UI using the Browser Toolbox:
1. Open Developer Tools (F12) > Settings.
2. Check:
   - "Enable browser chrome and add-on debugging toolboxes"
   - "Enable remote debugging"
3. Press `Ctrl+Alt+Shift+I` to inspect the browser UI.
