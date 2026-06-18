# Cupertino Theme for MATE Desktop

A macOS Tahoe like theme for the [MATE Desktop Environment](https://mate-desktop.org/), combining Cupertino GTK and Icon themes.

Cupertino comes with a matching icon set and a curated collection of wallpapers. Everything works perfectly out of the box.

---

## Contents

| Directory | Description |
|---|---|
| `themes/Cupertino/` | GTK 2, GTK 3, Metacity/Marco window decorations (multiple variants) |
| `icons/Cupertino/` | Full icon theme |
| `wallpapers/` | Background images and XML descriptor |
| `other/` | Extra assets for Firefox and Plank |

---

## Requirements

- MATE Desktop 1.20 or later
- GTK 2 and GTK 3 libraries
- `autoconf` ≥ 2.69, `automake`, `make`
- `gtk-update-icon-cache` (usually part of `libgtk-3-bin` or `gtk3-icon-browser`)

---

## Build and Install

### 1. Generate the build system

If you cloned the repository (no pre-generated `configure` script):

```sh
./autogen.sh
```

### 2. Configure

#### For System-wide installation (requires sudo):

```sh
./configure --prefix=/usr
```

#### For Local installation (current user only):

```sh
./configure --prefix=$HOME/.local
```

#### Customizing the Start Menu logo:

You can choose a different logo for the start menu during configuration. The default is `mate`.

```sh
./configure --with-menu-logo=apple   # Use Apple logo
./configure --with-menu-logo=distro  # Auto-detect your distribution logo
./configure --with-menu-logo=arch    # Use specific distribution logo (e.g., arch, fedora, debian, etc.)
```

### 3. Build and install

```sh
make
make install
```

*Note: Use `sudo make install` if you configured with a system prefix like `/usr`.*

---

## Example: Quick Local Installation

To install the theme quickly for your user without needing root permissions:

```sh
./autogen.sh
./configure --prefix=$HOME/.local
make
make install
```

The themes will be available in `~/.local/share/themes` and icons in `~/.local/share/icons`.

---

## Installed Paths

After installation with `--prefix=/usr`:

| Asset | Path |
|---|---|
| GTK / window decoration theme | `/usr/share/themes/Cupertino/` |
| Icon theme | `/usr/share/icons/Cupertino/` |
| Wallpapers | `/usr/share/backgrounds/cupertino/` |
| Wallpaper XML descriptor (MATE) | `/usr/share/mate-background-properties/cupertino-wallpaper.xml` |
| Wallpaper XML descriptor (GNOME) | `/usr/share/gnome-background-properties/cupertino-wallpaper.xml` |

---

## Applying the Theme in MATE Desktop

### GTK theme and window decorations

Open **MATE Tweak** or go to **System → Preferences → Look and Feel → Appearance**:

- **Controls** → select `Cupertino` (or variants like `Cupertino-Dark`)
- **Window Border** → select `Cupertino`

Alternatively, set it via `gsettings`:

```sh
gsettings set org.mate.interface gtk-theme 'Cupertino'
gsettings set org.mate.Marco.general theme 'Cupertino'
```

### Icon theme

In the same **Appearance** dialog:

- **Icons** → select `Cupertino`

Or via `gsettings`:

```sh
gsettings set org.mate.interface icon-theme 'Cupertino'
```

### Wallpaper

In **System → Preferences → Look and Feel → Backgrounds**, click **Add**, then browse to `/usr/share/backgrounds/cupertino/` (or `~/.local/share/backgrounds/cupertino/`) and pick any image. The XML descriptor makes all wallpapers available directly in the background chooser after installation.

---

## Uninstall

```sh
make uninstall
```

---

## License

See the upstream projects for license details.
