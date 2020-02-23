echo "Starting to Configure PC"

echo "Show Hidden Files"
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 0x1 /f
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden

echo "Show Files Extension"
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0x0 /f
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt

echo "Setting Execution Policy For Chocolatey"
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned -Force

echo "Remove Bloatware Windows 10"

# This script de-bloats unwanted apps from Windows 10.
# To keep certain apps insert a '#' at the beginning of the line 
# and it will be skipped. 

Write-Output "Uninstalling provisioned apps"
$ProvisionedApps = @(
    "Microsoft.BingWeather"
    #"Microsoft.DesktopAppInstaller"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    #"Microsoft.HEIFImageExtension"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    #"Microsoft.MicrosoftStickyNotes"
    "Microsoft.MixedReality.Portal"
    #"Microsoft.MSPaint"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.Print3D"
    "Microsoft.ScreenSketch"
    "Microsoft.SkypeApp"
    #"Microsoft.StorePurchaseApp"
    #"Microsoft.VP9VideoExtensions"
    "Microsoft.Wallet"
    #"Microsoft.WebMediaExtensions"
    #"Microsoft.WebpImageExtension"
    #"Microsoft.Windows.Photos"
    #"Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    "Microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
)

foreach ($app in $ProvisionedApps) {
    Write-Output "REMOVING $app"

    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $ProvisionedApps | Remove-AppxProvisionedPackage -Online -AllUsers
}

Write-Output "Uninstalling user apps"
$UserApps = @(
    #"Microsoft.AccountsControl"
    "Microsoft.Advertising.Xaml"
    #"Microsoft.AsyncTextService"
    "Microsoft.BingWeather"
    #"Microsoft.BioEnrollment"
    #"Microsoft.CredDialogHost"
    #"Microsoft.DesktopAppInstaller"
    #"Microsoft.ECApp"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted"
    #"Microsoft.HEIFImageExtension"
    #"Microsoft.LockApp"
    "Microsoft.Messaging"
    "Microsoft.Microsoft3DViewer"
    "Microsoft.MicrosoftEdge"
    "Microsoft.MicrosoftEdgeDevToolsClient"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MicrosoftStickyNotes"
    "Microsoft.MixedReality.Portal"
    #"Microsoft.MSPaint"
    #"Microsoft.NET.Native.Framework.1.7"
    #"Microsoft.NET.Native.Framework.1.7"
    #"Microsoft.NET.Native.Framework.2.2"
    #"Microsoft.NET.Native.Runtime.1.7"
    #"Microsoft.NET.Native.Runtime.1.7"
    #"Microsoft.NET.Native.Runtime.2.2"
    "Microsoft.Office.OneNote"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.PPIProjection"
    "Microsoft.Print3D"
    "Microsoft.ScreenSketch"
    #"Microsoft.Services.Store.Engagement"
    "Microsoft.SkypeApp"
    #"Microsoft.StorePurchaseApp"
    #"Microsoft.UI.Xaml.2.0"
    #"Microsoft.VCLibs.140.00"
    #"Microsoft.VCLibs.140.00"
    #"Microsoft.VCLibs.140.00.UWPDesktop"
    #"Microsoft.VP9VideoExtensions"
    "Microsoft.Wallet"
    #"Microsoft.WebMediaExtensions"
    #"Microsoft.WebpImageExtension"
    #"Microsoft.Win32WebViewHost"
    #"Microsoft.Windows.Apprep.ChxApp"
    #"Microsoft.Windows.CallingShellApp"
    #"Microsoft.Windows.CapturePicker"
    #"Microsoft.Windows.CloudExperienceHost"
    #"Microsoft.Windows.ContentDeliveryManager"
    "Microsoft.Windows.Cortana"
    "Microsoft.Windows.NarratorQuickStart"
    #"Microsoft.Windows.OOBENetworkCaptivePortal"
    #"Microsoft.Windows.OOBENetworkConnectionFlow"
    "Microsoft.Windows.ParentalControls"
    "Microsoft.Windows.PeopleExperienceHost"
    #"Microsoft.Windows.Photos"
    #"Microsoft.Windows.PinningConfirmationDialog"
    #"Microsoft.Windows.SecHealthUI"
    #"Microsoft.Windows.ShellExperienceHost"
    #"Microsoft.Windows.StartMenuExperienceHost"
    #"Microsoft.Windows.XGpuEjectDialog"
    #"Microsoft.WindowsAlarms"
    #"Microsoft.WindowsCalculator"
    #"Microsoft.WindowsCamera"
    "Microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    #"Microsoft.WindowsStore"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameCallableUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
    #"Windows.CBSPreview"
    #"windows.immersivecontrolpanel"
    #"Windows.PrintDialog"
)

foreach ($app in $UserApps) {
    Write-Output "REMOVING $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
}
