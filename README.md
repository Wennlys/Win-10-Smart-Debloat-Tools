<h1 align="center">
	<img width=30px src="src/assets/windows-11-logo.png" style="vertical-align: bottom"> Win 10+ Smart Debloat Tools
	<img width=30px src="src/assets/powershell-icon.png" style="vertical-align: bottom">
</h1>

<h2 align="center">This Project was adapted from <a href="https://github.com/W4RH4WK/Debloat-Windows-10">W4RH4WK's Project</a></h2>

[![PSScriptAnalyzer](https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools/actions/workflows/powershell-linter.yml/badge.svg)](https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools/actions/workflows/powershell-linter.yml)

## 📄 Resume

These scripts will Customize, Debloat and Improve Privacy/Performance and System Responsiveness on Windows 10+.

> _Use on a fresh windows install to note the differences._

⚠️ **Disclaimer:** You're doing this at your own risk, I am not responsible for any data loss or damage that may occur.

## 🚀 Download Latest Version

Code located in the `main` branch is always considered under development,
but you'll probably want the most recent version anyway.

<div align="center">
	<table>
		<thead>
			<tr>
				<th>Download</th>
				<th>Version(s) Supported</th>
				<th>Edition(s)</th>
				<th>PowerShell Version</th>
			</tr>
		</thead>
		<tbody>
			<tr align="center">
				<td><h3><a href="https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools/archive/main.zip">⬇️ Zip File ⬇️</a></h3></td>
				<td>21H2 or Older</td>
				<td>Home / Pro</td>
				<td><img width=20px src="src/assets/powershell-icon.png" style="vertical-align: bottom" /> v5.1+</td>
			</tr>
		</tbody>
	</table>
</div>

## 🔄️ Roll-Back

**If something breaks you can rely on:**

1. A restoration point;
2. The [`repair-windows.ps1`](./src/scripts/repair-windows.ps1) file or button on [`Win10ScriptGUI.ps1`](./Win10ScriptGUI.ps1);
3. If you want (almost) everything to it's original state, use the `Revert Tweaks` button on [`Win10ScriptGUI.ps1`](./Win10ScriptGUI.ps1).

## ❗ Usage Requirements

The `Win10Script/GUI.ps1` do not make everything automatically, follow these steps.

- Extract the `.zip` file.
- Open `OpenTerminalHere.cmd` (For beginners) or the Powershell as admin on it's folder.
- Enable execution of PowerShell scripts and Unblock PowerShell scripts and modules within this directory (Down below).

### **GUI Version**

- Copy and Paste this entire line below on **Powershell**:

```ps1
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force; ls -Recurse *.ps*1 | Unblock-File; .\"Win10ScriptGUI.ps1"
```

![Script GUI](./src/assets/script-gui.gif)

_The `Apply Tweaks` button is the main one for debloating._

### **CLI Version** (Minimal, good for automation)

- Copy and Paste this entire line below on **Powershell**:

```ps1
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force; ls -Recurse *.ps*1 | Unblock-File; .\"Win10ScriptCLI.ps1"
```

**[Scripts](./src/scripts) can be run individually, pick what you need.**

## ✅ GUI Script Features

<details>
	<summary>Click to expand</summary>

- `Apply Tweaks`: Run every Common Tweak scripts;
- `Remove Xbox from Windows`: Wipe Xbox Apps, disable Services related to Xbox and GameBar/GameDVR; ([`remove-and-disable-xbox.ps1`](./src/scripts/remove-and-disable-xbox.ps1))
- `Repair Windows`: Try to Completely fix the Windows worst problems via Command Line; ([`backup-system.ps1`](./src/scripts/backup-system.ps1) and [`repair-windows.ps1`](./src/scripts/repair-windows.ps1))
- `Reinstall Pre-Installed Apps`: Rebloat Windows with all the Pre-Installed Apps; ([`reinstall-pre-installed-apps.ps1`](./src/utils/reinstall-pre-installed-apps.ps1))
- `Revert Tweaks`: Re-apply some tweaks and [Revert] all possible ones, covering the `Scheduled Tasks`, `Services`, `Privacy and Performance`, `Personal` and `Optional Features` tweaks, then try to `Reinstall Pre-Installed Apps`;
- `Dark Theme & Light Theme`: Apply [Dark Theme](./src/utils/use-dark-theme.reg) or [Light Theme](./src/utils/use-light-theme.reg) on Windows;
- `Enable/Disable Search Indexing`: Let you choose whether the **Windows Search Service** is [enabled](./src/utils/enable-search-idx.ps1) or [disabled](src/utils/disable-search-idx.ps1);
- `Enable/Disable Background Apps`: Let you choose whether _ALL_ the **Background Apps** are [enabled](./src/utils/enable-bg-apps.reg) or [disabled](src/utils/disable-bg-apps.reg);
- `Enable Telemetry & Disable Telemetry`: Let you choose whether the **Windows Telemetry** is [enabled](./src/utils/enable-telemetry.reg) or [disabled](src/utils/disable-telemetry.reg);
- `Enable/Disable Cortana`: Let you choose whether the **Cortana** is [enabled](./src/utils/enable-cortana.reg) or [disabled](src/utils/disable-cortana.reg);
- `Enable/Disable Xbox GameBar/DVR`: Let you choose whether the **Xbox GameBar/DVR (In-Game)** is [enabled](./src/utils/enable-game-bar-dvr.reg) or [disabled](src/utils/disable-game-bar-dvr.reg);
- `Enable/Disable Clipboard History`: Let you choose whether the **Clipboard History** is [enabled](./src/utils/enable-clipboard-history.reg) or [disabled](src/utils/disable-clipboard-history.reg);
- `Enable/Disable Old Volume Control`: Let you choose whether the **Old Volume Control (Win 7/8.1)** is [enabled](./src/utils/enable-old-volume-control.reg) or [disabled](src/utils/disable-old-volume-control.reg);
- `Install CPU/GPU Driver Updater`: This **WILL NOT** install anymore the drivers, only the drivers updater. ([`install-drivers-updaters.ps1`](./src/scripts/install-drivers-updaters.ps1));
  - The Latest CPU for driver updater. For `Intel`, `Intel DSA (Winget)` (Except AMD);
  - The Latest GPU driver updater. For `Intel (DSA)` and `NVIDIA`, `NVIDIA GeForce Experience (Winget)` (Except AMD);
- `Install Gaming Dependencies`: Install all Gaming Dependencies required to play games (DirectX, VC++ 2005+ (x86 & x64), .NET Framework). ([`install-gaming-dependencies.ps1`](./src/scripts/install-gaming-dependencies.ps1));
- Every software installation is explicitly showed;

</details>

## ☑️ Common Script Features

<details>
	<summary>Click to expand</summary>

- Import all necessary Modules before Executing everything; ([lib folder](./src/lib/))
- Make a Restore Point and Backup the Hosts file; ([`backup-system.ps1`](./src/scripts/backup-system.ps1))
- Install _Chocolatey/Winget_ by default; ([`install-package-managers.ps1`](./src/scripts/install-package-managers.ps1))
  - Auto-Update every available software via `Winget` (12:00/day) and `Chocolatey` (13:00/day);
  - Find the Scheduled Job on `Task Scheduler > "Microsoft\Windows\PowerShell\ScheduledJobs\Chocolatey/Winget Daily Upgrade"`;
- Download AdwCleaner and Run the latest version of for Virus/Adware scan; ([`silent-debloat-softwares.ps1`](./src/scripts/silent-debloat-softwares.ps1))
- Download OOShutUp10 and import all Recommended settings;
- Disable Telemetry from Scheduled Tasks and Optimize it; ([`optimize-scheduled-tasks.ps1`](./src/scripts/optimize-scheduled-tasks.ps1))
- Disable heavy Services, but enable some on SSDs for optimum performance; ([`optimize-services.ps1`](./src/scripts/optimize-services.ps1))
- Remove Bloatware Apps that comes with Windows 10, except from my choice; ([`remove-bloatware-apps.ps1`](./src/scripts/remove-bloatware-apps.ps1))
- Optimize Privacy and Performance settings disabling more telemetry stuff and changing GPOs; ([`optimize-privacy-and-performance.ps1`](./src/scripts/optimize-privacy-and-performance.ps1))
- Apply General Personalization tweaks via Registry and Powershell commands; ([`personal-tweaks.ps1`](./src/scripts/personal-tweaks.ps1))
- Help improve the Security of Windows while maintaining performance; ([`optimize-security.ps1`](./src/scripts/optimize-security.ps1))
- Remove OneDrive completely from the System, re-install is possible via Win Store; ([`remove-onedrive.ps1`](./src/scripts/remove-onedrive.ps1))
- Disable/Enable Optional Features specially for Gaming/Work; ([`optimize-optional-features.ps1`](./src/scripts/optimize-optional-features.ps1))
- Install WSL Preview (Only works for Windows 11): ([`win11-wsl-preview-install.ps1`](./src/scripts/win11-wsl-preview-install.ps1))
- In the End it Locks Script's Usage Permission. ([`set-script-policy.psm1`](./src/lib/set-script-policy.psm1))

</details>

## ⚡ Troubleshooting Known Issues

> For each issue, expand the issue you're looking for,
> and Open PowerShell as admin to copy + paste it's content:

<details>
	<summary>Fingerprint Reader / Facial Detection not Working (<code>WbioSrvc</code> service was disabled) - See <a href="https://github.com/W4RH4WK/Debloat-Windows-10/issues/189">#189 from W4RH4WK</a></summary>

```Powershell
Get-Service WbioSrvc | Set-Service -StartupType Automatic -PassThru | Start-Service
```

</details>

<details>
	<summary>Issues with Skype (<code>Microsoft.SkypeApp</code> app was uninstalled) - See <a href="https://github.com/W4RH4WK/Debloat-Windows-10/issues/79">#79 from W4RH4WK</a></summary>

```Powershell
winget install --silent --source "msstore" --id "Microsoft.Skype"
```

</details>

<details>
	<summary>Bring back Taskbar <code>Widgets</code> (Windows 11) - See <a href="https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools/issues/7">#7</a></summary>

1. Press `Win + R` then paste this protocol: `ms-windows-store://pdp/?ProductId=9MSSGKG348SP`
2. Then click `Get`/`Install`
3. After this, open the `Taskbar Settings` and enable the `Widgets` button again

</details>

<details>
	<summary>Sysprep will hang (Not Tested).</summary>

> _No solution yet, do a Google search_

</details>

## ➕ Contribute

I would be happy to extend the collection of scripts.
Just open an issue or send me a pull request. (Yes, if it's useful, you can).

> TIP: To clone quickly, use this command:

```sh
git clone --filter=tree:0 https://github.com/LeDragoX/Win-10-Smart-Debloat-Tools.git
```

## 🤍 Credits

- Special thanks to the [LowSpecGamer](https://youtu.be/IU5F01oOzQQ?t=324), he is the reason i've adapted this script.

- [W4RH4WK](https://github.com/W4RH4WK) (For his project ^^);
- [O&O Software GmbH](https://www.oo-software.com/en/company) (_ShutUp10 Company_);
- [MalwareBytes](https://br.malwarebytes.com/company/) (_AdwCleaner Company_);
- [Adamx's](https://www.youtube.com/channel/UCjidjWX76LR1g5yx18NSrLA) - by [_this video_](https://youtu.be/hQSkPmZRCjc);
- [Baboo's](https://www.youtube.com/user/baboo) - by [_this video_](https://youtu.be/qWESrvP_uU8);
- [ChrisTitusTech](https://www.youtube.com/channel/UCg6gPGh8HU2U01vaFCAsvmQ) - gave me more confidence to mess with PowerShell after [_this 🔴 LIVE_](https://youtu.be/ER27pGt5wH0)
- [Daniel Persson](https://www.youtube.com/channel/UCnG-TN23lswO6QbvWhMtxpA) - by [_this video_](https://youtu.be/EfrT_Bvgles);
- [matthewjberger](https://gist.github.com/matthewjberger) - by [_this script_](https://gist.github.com/matthewjberger/2f4295887d6cb5738fa34e597f457b7f).

## 🔧 Tweak Testers

- [yCr-shiddy](https://github.com/yCr-shiddy) - Helped giving more ideas and fixes;

## 🏅 More Debloat Scripts (Community)

<details>
    <summary>Click to expand</summary>
<p>The scripts are designed to run With/Without (GUI/CLI) any user interaction. Modify them beforehand. If you want a more interactive approach check out:</p>

- [win10script](https://github.com/ChrisTitusTech/win10script) from [ChrisTitusTech](https://github.com/ChrisTitusTech) (Recommended);
- [Windows10Debloater](https://github.com/Sycnex/Windows10Debloater) from [Sycnex](https://github.com/Sycnex);
- [Sophia-Script-for-Windows](https://github.com/farag2/Sophia-Script-for-Windows) from [farag2](https://github.com/farag2);
- [Windows-Optimize-Harden-Debloat](https://github.com/simeononsecurity/Windows-Optimize-Harden-Debloat);
- [Windows-Optimize-Debloat](https://github.com/simeononsecurity/Windows-Optimize-Debloat).

</details>

## 🔎 How did i find specific Tweaks?

<details>
	<summary>Click to expand</summary>
	<p>How To (Advanced Users)</p>

By using [SysInternal Suite](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite) `Procmon(64).exe` i could track the `SystemSettings.exe` by filtering per Process Name `(Ctrl + L)`.

- But, not every time filtering the application you want will show the registry tweaks that were applied, so make sure other processes appear.
- Then use `Clearing the list (Ctrl + X)` (But make sure it is `Capturing the Events (Ctrl + E)`) and finally, applying an option of the Windows Configurations
  and searching the Registry Key inside `Procmon(64).exe`.
- Also make sure to disable the Events being captured `(Ctrl + E)` after applying a specific config.

![Grab the current tweak on registry with Procmon64.exe](./src/assets/grab-the-current-tweak-on-registry-with-procmon64.png)

After finding the right register Key, you just need to Right-Click and select `Jump To... (Ctrl + J)` to get on it's directory.

![Showing on regedit](./src/assets/showing-on-regedit.png)

</details>

## 📝 License

Licensed under the [MIT](LICENSE.txt) license.
