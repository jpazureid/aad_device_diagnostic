# All global parameters
$global:root_folder = "C:\AAD_Logs\"
$global:folder_file = $global:root_folder+$env:COMPUTERNAME
$global:verbose_output = $false
$global:full_folder = ""
$global:full_eventlog_folder = ""
$global:full_reg_folder = ""
$global:full_cert_folder = ""
$global:full_net_folder = ""
$global:full_wam_folder = ""
$global:full_etw_folder = ""
$global:Current_Folder = (Get-Location).Path

# All functions
Function Create_Log_Folder
{
    # Creating the root folder and the file is used in creating folders
    if (!(Test-Path $global:root_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:root_folder -ForegroundColor Red}
        New-Item -Path $global:root_folder -ItemType Directory | Out-Null
    }
        
    if (Test-Path $global:folder_file)
    {
        $log_folder = Get-Content -Path $global:folder_file
        Remove-Item -Path $global:folder_file -Force
    }
    else
    {
        $log_folder = (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss")
    }

    # Local Parameters
    $global:full_folder = $global:root_folder+$log_folder
    If (!(Test-Path $global:full_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_folder -ItemType Directory | Out-Null
    }


    #Creating event logs folder
    $global:full_eventlog_folder = $global:full_folder+"\Event_Logs\"
    If (!(Test-Path $global:full_eventlog_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_eventlog_folder -ItemType Directory | Out-Null
    }

    
    #Creating registry info folder
    $global:full_reg_folder = $global:full_folder+"\Registry\"
    If (!(Test-Path $global:full_reg_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_reg_folder -ItemType Directory | Out-Null
    }


    #Creating certificate folder
    $global:full_cert_folder = $global:full_folder+"\Certificates\"
    If (!(Test-Path $global:full_cert_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_cert_folder -ItemType Directory | Out-Null
    }


    #Creating net info and net trace folder
    $global:full_net_folder = $global:full_folder+"\Network\"
    If (!(Test-Path $global:full_net_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_net_folder -ItemType Directory | Out-Null
    }


    #Creating WAM folder
    $global:full_wam_folder = $global:full_folder+"\WAM\"
    If (!(Test-Path $global:full_wam_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_wam_folder -ItemType Directory | Out-Null
    }


    #Creating ETW logs folder
    $global:full_etw_folder = $global:full_folder+"\ETW\"
    If (!(Test-Path $global:full_etw_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:full_folder -ForegroundColor Red}
        New-Item -Path $global:full_etw_folder -ItemType Directory | Out-Null
    }
}


Function Get_WAM_TokenBroker_Cache_Info
{
    If ($global:verbose_output){Write-Host "We are in Get WAM" -ForegroundColor Red}

    #Write-Host " Collecting WAM information...`n" -ForegroundColor Blue

    if ((Test-Path "$($env:LOCALAPPDATA)\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy\AC\TokenBroker\Accounts\") -eq "True") 
    {
        $WAMAccountsFullPath = Get-ChildItem "$($env:LOCALAPPDATA)\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy\AC\TokenBroker\Accounts\*.tbacct"
        foreach ($WAMAccountsFile in $WAMAccountsFullPath) {
            "File Name: " + $WAMAccountsFile.name + "`n" >> $global:full_wam_folder"tbacct.txt"
            Get-content -Path $WAMAccountsFile.FullName >> $global:full_wam_folder"tbacct.txt" -Encoding Unicode | Out-Null
            "`n`n" >> $global:full_wam_folder"tbacct.txt"
        }
    }
    #Write-Host " Done collecting WAM information...`n" -ForegroundColor Blue
}


Function Get_Other_Logs
{
    #Write-Host " Collecting all other logs...`n" -ForegroundColor Blue
    
    #dsregcmd
    dsregcmd.exe /status > $global:full_folder"\dsregcmd_status_user.txt" 2>&1 | Out-Null
    dsregcmd.exe /debug > $global:full_folder"\dsregcmd_debug_user.txt" 2>&1 | Out-Null
    dsregcmd.exe /status_old > $global:full_folder"\dsregcmd_status_old_user.txt" 2>&1 | Out-Null
    dsregcmd.exe /ListAccounts > $global:full_folder"\dsregcmd_ListAccounts_user.txt" 2>&1 | Out-Null
    dsregcmd.exe /RunSystemTests > $global:full_folder"\dsregcmd_RunSystemTests_user.txt" 2>&1 | Out-Null

    # klist
    klist.exe > $global:full_folder"\klist_user.txt" 2>&1 | Out-Null
    klist.exe cloud_debug > $global:full_folder"\klist_cloud_debug_user.txt" 2>&1 | Out-Null
    klist.exe tgt > $global:full_folder"\klist_tgt_user.txt" 2>&1 | Out-Null
    klist.exe kcd_cache > $global:full_folder"\klist_kcd_cache_user.txt" 2>&1 | Out-Null

    # Get system info
    systeminfo > $global:full_folder"\systeminfo_user.txt" 2>&1 | Out-Null

    # Get UPN info
    whoami /UPN > $global:full_folder"\whoami_UPN_user.txt" 2>&1 | Out-Null
    whoami /all > $global:full_folder"\whoami_ALL_user.txt" 2>&1 | Out-Null

    # Get user's credential Manager
    cmdkey.exe /list > $global:full_folder"\credman_user.txt" 2>&1 | Out-Null

    # Get SCP from AD
    $Root = [ADSI]"LDAP://RootDSE"
    $rootdn = $Root.rootDomainNamingContext

    if ($null -ne $rootdn)
    {
        $scp = New-Object System.DirectoryServices.DirectoryEntry
        $scp.Path = "LDAP://CN=62a0ff2e-97b9-4513-943f-0d221bd30080,CN=Device Registration Configuration,CN=Services,CN=Configuration,"+$rootdn
        #$scp.Keywords;
        $scp.Keywords | Out-File -FilePath $global:full_folder"\SCP_AD_User.txt" 2>&1 | Out-Null
    }
    else 
    {
        "Not able to query SCP on AD from here." | Out-File -FilePath $global:full_folder"\SCP_AD_User.txt" 2>&1 | Out-Null    
    }

    # Getting GPO information
    gpresult /V > $global:full_folder"\GPResult_V_user.txt" 2>&1 | Out-Null
    gpresult /H $global:full_folder"\GPResult_H_user.html"

    # Collecting file list
    Get-ChildItem -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy" -Recurse -Force 2>&1 > $global:full_folder"\FILE_LIST_AAD_BrokerPlugin.txt" | Out-Null
    Get-ChildItem -Path "$($env:LOCALAPPDATA)\Microsoft\TokenBroker" -Recurse -Force 2>&1 > $global:full_folder"\FILE_LIST_MS_TokenBroker.txt" | Out-Null
    Get-ChildItem -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.Windows.CloudExperienceHost_cw5n1h2txyewy" -Recurse -Force 2>&1 > $global:full_folder"\FILE_LIST_MSA_BrokerPlugin.txt" | Out-Null
    #Write-Host " Done collecting all other logs...`n" -ForegroundColor Blue
    
    # HKCU
    reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WorkplaceJoin" /s > $global:full_reg_folder"HKCU_WPJ.txt" 2>&1 | Out-Null
    reg query "HKCU\SOFTWARE\Microsoft\SCEP" /s > $global:full_reg_folder"HKCU_scep.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\IdentityCRL" /s > $global:full_reg_folder"HKCU_IdentityCRL.txt" 2>&1 | Out-Null
    reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\TokenBroker" /s > $global:full_reg_folder"HKCU_TokenBroker.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.aad.brokerplugin_cw5n1h2txyewy" /s > $global:full_reg_folder"HKCU_AAD_BrokerPlugIn.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /s > $global:full_reg_folder"HKCU_ContentDeliveryManager.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\AuthCookies" /s > $global:full_reg_folder"HKCU_AuthCookies.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\AAD" /s > $global:full_reg_folder"HKCU_AAD.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /s > $global:full_reg_folder"HKCU_PushNotifications.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\ActivityDataModel" /s > $global:full_reg_folder"HKCU_ActivityDataModel.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Classes\Local Settings\MrtCache" /s > $global:full_reg_folder"HKCU_MrtCache.txt" 2>&1 | Out-Null

    # WinINet
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /s > $global:full_net_folder"REG_WinINet01.txt" 2>&1 | Out-Null
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /s > $global:full_net_folder"REG_WinINet02.txt" 2>&1 | Out-Null
}


# Start script
#Added on 2023-8-2 to check if the powershell shell is running under admin context
# 2023-11-16 Add to print current user name and prompt for continue
$user_name = $env:USERNAME
$user_netBIOS_name = whoami

Write-Host "`nStart collecting logs under user $user_name ($user_netBIOS_name) context.`n" -ForegroundColor Yellow
$answer = Read-Host "Are you sure you want to proceed (Y:Yes/N:No)"
if ($answer -ne 'Y')
{
    exit
}

Write-Host "`n Preparing collecting log....." -ForegroundColor Blue

# Creating log folders
Create_Log_Folder

# Start Transcript
Start-Transcript -Path $(Join-Path -Path $global:full_folder -ChildPath "transcript-user.log") -Append -IncludeInvocationHeader

# Start functions
Write-Host " Collecting WAM information..." -ForegroundColor Blue
Get_WAM_TokenBroker_Cache_Info;

Write-Host " Collecting all other logs..." -ForegroundColor Blue
Get_Other_Logs;

# Cleaning up
Write-Host " Cleaning up...`n" -ForegroundColor Blue
Stop-Transcript
Remove-Variable verbose_output -Scope:global
Remove-Variable full_folder -Scope:global
Remove-Variable folder_file -Scope:global
Remove-Variable full_eventlog_folder -Scope:global
Remove-Variable full_reg_folder -Scope:global
Remove-Variable full_cert_folder -Scope:global
Remove-Variable full_net_folder -Scope:global
Remove-Variable full_etw_folder -Scope:global
Remove-Variable Current_Folder  -Scope:global
Remove-Variable root_folder -Scope:global

# Last Message
Write-Host "Thank you for collecting logs." -ForegroundColor Yellow
Write-Host "Please compress [C:\AAD_Logs] folder and send it to us." -ForegroundColor Yellow
#>