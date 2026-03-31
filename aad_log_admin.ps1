# All global parameters

# Set the output encoding to UTF8 to avoid encoding issues when exporting logs to files
[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Setting the output width buffer of Out-File to 10000
$PSDefaultParameterValues['out-file:width'] = 10000

# Get the log folder
$global:root_folder = "C:\AAD_Logs\"
$global:folder_file = $global:root_folder+$env:COMPUTERNAME

# Get the current working folder
$global:current_Folder = (Get-Location).Path
$global:full_eventlog_folder = ""
$global:full_reg_folder = ""
$global:full_cert_folder = ""
$global:full_net_folder = ""
$global:full_wam_folder = ""
$global:full_etw_folder = ""

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Check !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$global:verbose_output = $false
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Check !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

$global:WAM_Trace_Name = "WAM_Trace"
$global:NGC_Trace_Name = "NGC_Trace"
$global:BIO_Trace_Name = "BIO_Trace"
$global:LSA_Trace_Name = "LSA_Trace"
$global:NTLM_Trace_Name = "NTLM_Trace"
$global:KRB_Trace_Name = "KRB_Trace"
$global:KDC_Trace_Name = "KDC_Trace"
$global:SAM_Trace_Name = "SAM_Trace"
$global:SSL_Trace_Name = "SSL_Trace"
$global:CRYPT_Trace_Name = "CRYPT_Trace"
$global:SMART_CARD_Trace_Name = "SMART_CARD_Trace"
$global:CRED_Trace_Name = "CRED_Trace"
$global:APPX_Trace_Name = "APPX_Trace"


$global:event_list = @(
    "Microsoft-Windows-AAD/Operational",
    "Microsoft-Windows-AAD/Analytic", #Not
    "Microsoft-Windows-Biometrics/Operational", 
    "Microsoft-Windows-CAPI2/Operational",
    "Microsoft-Windows-HelloForBusiness/Operational",
    "Microsoft-Windows-Kerberos/Operational",
    "Microsoft-Windows-User Device Registration/Admin",
    "Microsoft-Windows-User Device Registration/Debug",
    "Microsoft-Windows-Workplace Join/Admin",
    "Microsoft-Windows-WebAuth/Operational",
    "Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin",
    #"Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Autopilot",
    "Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Operational",
    "Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Enrollment",
    "Microsoft-Windows-TaskScheduler/Operational"
    "Microsoft-Windows-Store/Operational"
)

$global:event_log_disabled_by_default = @()
$global:CAPI2_Default_Size = 1052672

# All EWT GUID
####################################################
#                ETW Providers
####################################################
#=================================================== WAM_Providers ===================================================
$WAM_Providers = 
@(
    '{B1108F75-3252-4b66-9239-80FD47E06494}!0x2FF'                  #IDCommon
    '{82c7d3df-434d-44fc-a7cc-453a8075144e}!0x2FF'                  #IdStoreLib
    '{D93FE84A-795E-4608-80EC-CE29A96C8658}!0x7FFFFFFF'             #idlisten
    '{EC3CA551-21E9-47D0-9742-1195429831BB}!0xFFFFFFFF'             #cloudap
    '{bb8dd8e5-3650-5ca7-4fea-46f75f152414}!0xffffffffffffffff'     #Microsoft.Windows.Security.CloudAp
    '{7fad10b2-2f44-5bb2-1fd5-65d92f9c7290}!0xffffffffffffffff'     #Microsoft.Windows.Security.CloudAp.Critical
    '{077b8c4a-e425-578d-f1ac-6fdf1220ff68}!0xFFFFFFFF'             #Microsoft.Windows.Security.TokenBroker
    '{7acf487e-104b-533e-f68a-a7e9b0431edb}!0xFFFFFFFF'             #Microsoft.Windows.Security.TokenBroker.BrowserSSO
    '{5836994d-a677-53e7-1389-588ad1420cc5}!0xFFFFFFFF'             #Microsoft.Windows.MicrosoftAccount.TBProvider
    '{3F8B9EF5-BBD2-4C81-B6C9-DA3CDB72D3C5}!0x7'                    #wlidsvc
    '{C10B942D-AE1B-4786-BC66-052E5B4BE40E}!0x3FF'                  #livessp
    '{05f02597-fe85-4e67-8542-69567ab8fd4f}!0xffffffffffffffff'             #Microsoft-Windows-LiveId, MSAClientTraceLoggingProvider
    '{74D91EC4-4680-40D2-A213-45E2D2B95F50}!0xFFFFFFFF'             #Microsoft.AAD.CloudAp.Provider
    '{4DE9BC9C-B27A-43C9-8994-0915F1A5E24F}!0xFFFFFFFF'             #Microsoft-Windows-AAD
    '{bfed9100-35d7-45d4-bfea-6c1d341d4c6b}!0xFFFFFFFF'             #AADPlugin
    '{556045FD-58C5-4A97-9881-B121F68B79C5}!0xFFFFFFFF'             #AadCloudAPPlugin
    '{F7C77B8D-3E3D-4AA5-A7C5-1DB8B20BD7F0}!0xFFFFFFFF'             #AadWamExtension
    '{9EBB3B15-B094-41B1-A3B8-0F141B06BADD}!0xFFF'                  #AadAuthHelper
    '{6ae51639-98eb-4c04-9b88-9b313abe700f}!0xFFFFFFFF'             #AadWamPlugin
    '{7B79E9B1-DB01-465C-AC8E-97BA9714BDA2}!0xFFFFFFFF'             #AadTB
    '{86510A0A-FDF4-44FC-B42F-50DD7D77D10D}!0xFFFFFFFF'             #AadBrokerPluginApp
    '{5A9ED43F-5126-4596-9034-1DCFEF15CD11}!0xFFFFFFFF'             #AadCloudAPPluginBVTs
    '{08B15CE7-C9FF-5E64-0D16-66589573C50F}!0xFFFFFF7F'             #Microsoft.Windows.Security.Fido
    '{5AF52B0D-E633-4ead-828A-4B85B8DAAC2B}!0xFFFF'                 #negoexts
    '{2A6FAF47-5449-4805-89A3-A504F3E221A6}!0xFFFF'                 #pku2u
    '{EF98103D-8D3A-4BEF-9DF2-2156563E64FA}!0xFFFF'                 #webauth
    '{2A3C6602-411E-4DC6-B138-EA19D64F5BBA}!0xFFFF'                 #webplatform
    '{FB6A424F-B5D6-4329-B9B5-A975B3A93EAD}!0x000003FF'             #wdigest
    '{2745a526-23f5-4ef1-b1eb-db8932d43330}!0xffffffffffffffff'     #Microsoft.Windows.Security.TrustedSignal
    '{c632d944-dddb-599f-a131-baf37bf22ef0}!0xffffffffffffffff'     #Microsoft.Windows.Security.NaturalAuth.Service
    '{63b6c2d2-0440-44de-a674-aa51a251b123}!0xFFFFFFFF'             #Microsoft.Windows.BrokerInfrastructure
    '{4180c4f7-e238-5519-338f-ec214f0b49aa}!0xFFFFFFFF'             #Microsoft.Windows.ResourceManager
    '{EB65A492-86C0-406A-BACE-9912D595BD69}!0xFFFFFFFF'             #Microsoft-Windows-AppModel-Exec
    '{d49918cf-9489-4bf1-9d7b-014d864cf71f}!0xFFFFFFFF'             #Microsoft-Windows-ProcessStateManager
    '{072665fb-8953-5a85-931d-d06aeab3d109}!0xffffffffffffffff'     #Microsoft.Windows.ProcessLifetimeManager
    '{EF00584A-2655-462C-BC24-E7DE630E7FBF}!0xffffffffffffffff'     #Microsoft.Windows.AppLifeCycle
    '{d48533a7-98e4-566d-4956-12474e32a680}!0xffffffffffffffff'     #RuntimeBrokerActivations
    '{0b618b2b-0310-431e-be64-09f4b3e3e6da}!0xffffffffffffffff'     #Microsoft.Windows.Security.NaturalAuth.wpp << Exist in Auth Logs Until this

    '{d0034f5e-3686-5a74-dc48-5a22dd4f3d5b}!0xFFFFFFFF'             #CXH Cloud Experience
    '{3C49678C-14AE-47FD-9D3A-4FEF5D796DB9}!0xFFFFFFFF'

    '{acc49822-f0b2-49ff-bff2-1092384822b6}!0xffffffffffffffff' # Microsoft.CAndE.ADFabric.CDJ
    '{5AA2DC10-E0E7-4BB2-A186-D230D79442D7}!0xffffffffffffffff' # Microsoft.CAndE.ADFabric.CDJ.Recovery
    '{7ae961f7-1262-48e2-b237-acba331cc970}!0xffffffffffffffff' # Microsoft.CAndE.ADFabric.CDJ.AzureSecureVMJoin
    '{519B3601-C289-44FB-B3E4-A05841D2790D}!0xffffffffffffffff' # Microsoft.CAndE.ADFabric.WinRT.NGC

    # These three providers are added on Windows client OS, which are related to WAM but not included in the Auth logs. So we need to add them manually to cover more WAM related events.
    #'{20f61733-57f1-4127-9f48-4ab7a9308ae2}!0xffffffffffffffff'     #InternetServer_wpp
    #'{b3a7698a-0c45-44da-b73d-e181c9b5c8e6}!0xffffffffffffffff'     #WinHttpWPP
    #'{4e749B6A-667D-4C72-80EF-373EE3246B08}!0xffffffffffffffff'     #WinINetWPP
)

# Add additional WAM providers on Windows client OS
$ProductType = (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\ProductOptions").ProductType
if ($ProductType -eq "WinNT") {
    $WAM_Providers += @(
        '{20f61733-57f1-4127-9f48-4ab7a9308ae2}!0xffffffffffffffff'     #InternetServer_wpp
        '{b3a7698a-0c45-44da-b73d-e181c9b5c8e6}!0xffffffffffffffff'     #WinHttpWPP
        '{4e749B6A-667D-4C72-80EF-373EE3246B08}!0xffffffffffffffff'     #WinINetWPP
        '{E16EC3D2-BB0F-4E8F-BDB8-DE0BEA82DC3D}!0x3F0000054404'     #Edge_WebView
    )
}

<# REmove     
'{1941f2b9-0939-5d15-d529-cd333c8fed83}!0xffffffffffffffff'     #Microsoft.Windows.BackgroundManager
'{0001376b-930d-50cd-2b29-491ca938cd54}!0xffffffffffffffff'     #Microsoft.Windows.ProcessStateManager
'{f6a774e5-2fc7-5151-6220-e514f1f387b6}!0xffffffffffffffff'     #Microsoft.Windows.HostActivityManager
'{a48e7274-bb8f-520d-7e6f-1737e9d68491}!0xffffffffffffffff'     #Microsoft.Windows.System.RemoteSystem
'{88cd9180-4491-4640-b571-e3bee2527943}!0xffffffffffffffff'     #Microsoft.Windows.PushNotifications.Platform
'{833e7812-d1e2-5172-66fd-4dd4b255a3bb}!0xffffffffffffffff'     #Microsoft.Windows..C97111CB69Model.UserActivities
'{30ad9f59-ec19-54b2-4bdf-76dbfc7404a6}!0xffffffffffffffff'     #Microsoft.Windows.CDP.Session
'{d229987f-edc3-5274-26bf-82be01d6d97e}!0xffffffffffffffff'     #Microsoft.Windows.System.RemoteSystemSession
'{8cde46fc-ca33-50ff-42b3-c64c1c731037}!0xffffffffffffffff'     #Microsoft.Windows.Application.SharePlatform
'{25756703-e23b-4647-a3cb-cb24d473c193}!0xffffffffffffffff'     #Microsoft.Windows.Application.NearSharePlatform
'{569cf830-214c-5629-79a8-4e9b58ea24bc}!0xffffffffffffffff'     #Microsoft.Windows.Shell.ShareUX
#>
#=================================================== WAM_Providers ===================================================


#=================================================== NGC_Providers ===================================================
$NGC_Providers=
@(
'{B66B577F-AE49-5CCF-D2D7-8EB96BFD440C}!0x0'                # Microsoft.Windows.Security.NGC.KspSvc
'{CAC8D861-7B16-5B6B-5FC0-85014776BDAC}!0x0'                # Microsoft.Windows.Security.NGC.CredProv
'{6D7051A0-9C83-5E52-CF8F-0ECAF5D5F6FD}!0x0'                # Microsoft.Windows.Security.NGC.CryptNgc
'{0ABA6892-455B-551D-7DA8-3A8F85225E1A}!0x0'                # Microsoft.Windows.Security.NGC.NgcCtnr
'{9DF6A82D-5174-5EBF-842A-39947C48BF2A}!0x0'                # Microsoft.Windows.Security.NGC.NgcCtnrSvc
'{9B223F67-67A1-5B53-9126-4593FE81DF25}!0x0'                # Microsoft.Windows.Security.NGC.KeyStaging
'{89F392FF-EE7C-56A3-3F61-2D5B31A36935}!0x0'                # Microsoft.Windows.Security.NGC.CSP
'{CDD94AC7-CD2F-5189-E126-2DEB1B2FACBF}!0x0'                # Microsoft.Windows.Security.NGC.LocalAccountMigPlugin
'{1D6540CE-A81B-4E74-AD35-EEF8463F97F5}!0xffff'             # Microsoft-Windows-Security-NGC-PopKeySrv
'{CDC6BEB9-6D78-5138-D232-D951916AB98F}!0x0'                # Microsoft.Windows.Security.NGC.NgcIsoCtnr
'{C0B2937D-E634-56A2-1451-7D678AA3BC53}!0x0'                # Microsoft.Windows.Security.Ngc.Truslet
'{9D4CA978-8A14-545E-C047-A45991F0E92F}!0x0'                # Microsoft.Windows.Security.NGC.Recovery
'{3b9dbf69-e9f0-5389-d054-a94bc30e33f7}!0x0'                # Microsoft.Windows.Security.NGC.Local
'{34646397-1635-5d14-4d2c-2febdcccf5e9}!0x0'                # Microsoft.Windows.Security.NGC.KeyCredMgr
'{c12f629d-37d4-58f7-22a8-94ac45ad8648}!0x0'                # Microsoft.Windows.Security.NGC.Utils
'{3A8D6942-B034-48e2-B314-F69C2B4655A3}!0xffffffff'         # TPM
'{5AA9A3A3-97D1-472B-966B-EFE700467603}!0xffffffff'         # TPM Virtual Smartcard card simulator
'{EAC19293-76ED-48C3-97D3-70D75DA61438}!0xffffffff'         # Cryptographic TPM Endorsement Key Services
'{23B8D46B-67DD-40A3-B636-D43E50552C6D}!0x0'                # Microsoft-Windows-User Device Registration (event)
'{2056054C-97A6-5AE4-B181-38BC6B58007E}!0x0'                # Microsoft.Windows.Security.DeviceLock
'{7955d36a-450b-5e2a-a079-95876bca450a}!0x0'                # Microsoft.Windows.Security.DevCredProv
'{c3feb5bf-1a8d-53f3-aaa8-44496392bf69}!0x0'                # Microsoft.Windows.Security.DevCredSvc
'{78983c7d-917f-58da-e8d4-f393decf4ec0}!0x0'                # Microsoft.Windows.Security.DevCredClient
'{36FF4C84-82A2-4B23-8BA5-A25CBDFF3410}!0x0'                # Microsoft.Windows.Security.DevCredWinRt
'{86D5FE65-0564-4618-B90B-E146049DEBF4}!0x0'                # Microsoft.Windows.Security.DevCredTask
'{D5A5B540-C580-4DEE-8BB4-185E34AA00C5}!0x0'                # MDM SCEP Trace
'{9FBF7B95-0697-4935-ADA2-887BE9DF12BC}!0x0'                # Microsoft-Windows-DM-Enrollment-Provider (event)
'{3DA494E4-0FE2-415C-B895-FB5265C5C83B}!0x0'                # Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider (event)
'{73370BD6-85E5-430B-B60A-FEA1285808A7}!0x0'                # Microsoft-Windows-CertificateServicesClient (event)
'{F0DB7EF8-B6F3-4005-9937-FEB77B9E1B43}!0x0'                # Microsoft-Windows-CertificateServicesClient-AutoEnrollment (event)
'{54164045-7C50-4905-963F-E5BC1EEF0CCA}!0x0'                # Microsoft-Windows-CertificateServicesClient-CertEnroll (event)
'{89A2278B-C662-4AFF-A06C-46AD3F220BCA}!0x0'                # Microsoft-Windows-CertificateServicesClient-CredentialRoaming (event)
'{BC0669E1-A10D-4A78-834E-1CA3C806C93B}!0x0'                # Microsoft-Windows-CertificateServicesClient-Lifecycle-System (event)
'{BEA18B89-126F-4155-9EE4-D36038B02680}!0x0'                # Microsoft-Windows-CertificateServicesClient-Lifecycle-User (event)
'{B2D1F576-2E85-4489-B504-1861C40544B3}!0x0'                # Microsoft-Windows-CertificateServices-Deployment (event)
'{98BF1CD3-583E-4926-95EE-A61BF3F46470}!0x0'                # Microsoft-Windows-CertificationAuthorityClient-CertCli (event)
'{AF9CC194-E9A8-42BD-B0D1-834E9CFAB799}!0x0'                # Microsoft-Windows-CertPolEng (event)
'{d0034f5e-3686-5a74-dc48-5a22dd4f3d5b}!0xFFFFFFFF'         # Microsoft.Windows.Shell.CloudExperienceHost
'{99eb7b56-f3c6-558c-b9f6-09a33abb4c83}!0xFFFFFFFF'         # Microsoft.Windows.Shell.CloudExperienceHost.Common
'{aa02d1a4-72d8-5f50-d425-7402ea09253a}!0x0'                # Microsoft.Windows.Shell.CloudDomainJoin.Client
'{507C53AE-AF42-5938-AEDE-4A9D908640ED}!0x0'                # Microsoft.Windows.Security.Credentials.UserConsentVerifier
'{02ad713f-20d4-414f-89d0-da5a6f3470a9}!0xffffffffffffffff' # Microsoft.Windows.Security.CFL.API
'{acc49822-f0b2-49ff-bff2-1092384822b6}!0xffffffffffffffff' # Microsoft.CAndE.ADFabric.CDJ
'{f245121c-b6d1-5f8a-ea55-498504b7379e}!0xffffffffffffffff' # Microsoft.Windows.DeviceLockSettings
 #{6ad52b32-d609-4be9-ae07-ce8dae937e39} 0xffffffffffffffff     # Microsoft-Windows-RPC
 #{f4aed7c7-a898-4627-b053-44a7caa12fcd} 0xffffffffffffffff     # Microsoft-Windows-RPC-Events
 #{ac01ece8-0b79-5cdb-9615-1b6a4c5fc871} 0xffffffffffffffff     # Microsoft.Windows.Application.Service
)
#=================================================== NGC_Providers ===================================================

#=================================================== Biometric_Providers ===================================================
$BIOM_Providers=
@(
    '{34BEC984-F11F-4F1F-BB9B-3BA33C8D0132}!0xffff'
    '{225b3fed-0356-59d1-1f82-eed163299fa8}!0x0'
    '{9dadd79b-d556-53f2-67c4-129fa62b7512}!0x0'
    '{1B5106B1-7622-4740-AD81-D9C6EE74F124}!0x0'
    '{1d480c11-3870-4b19-9144-47a53cd973bd}!0x0'
    '{e60019f0-b378-42b6-a185-515914d3228c}!0x0'
    '{48CAFA6C-73AA-499C-BDD8-C0D36F84813E}!0x0'
    '{add0de40-32b0-4b58-9d5e-938b2f5c1d1f}!0x0'
    '{e92355c0-41e4-4aed-8d67-df6b2058f090}!0x0'
    '{85be49ea-38f1-4547-a604-80060202fb27}!0x0'
    '{F4183A75-20D4-479B-967D-367DBF62A058}!0x0'
    '{0279b50e-52bd-4ed6-a7fd-b683d9cdf45d}!0x0'
    '{39A5AA08-031D-4777-A32D-ED386BF03470}!0x0'
    '{22eb0808-0b6c-5cd4-5511-6a77e6e73a93}!0x0'
    '{63221D5A-4D00-4BE3-9D38-DE9AAF5D0258}!0x0'
    '{9df19cfa-e122-5343-284b-f3945ccd65b2}!0x0'
    '{beb1a719-40d1-54e5-c207-232d48ac6dea}!0x0'
    '{8A89BB02-E559-57DC-A64B-C12234B7572F}!0x0'
    '{a0e3d8ea-c34f-4419-a1db-90435b8b21d0}!0xffffffffffffffff'
)
#=================================================== Biometric_Providers ===================================================

#=================================================== LSA_Providers ===================================================
$LSA_Providers=
@(
    '{D0B639E0-E650-4D1D-8F39-1580ADE72784}!0xC43EFF'               # (WPP)LsaTraceControlGuid
    '{169EC169-5B77-4A3E-9DB6-441799D5CACB}!0xffffff'               # LsaDs
    '{DAA76F6A-2D11-4399-A646-1D62B7380F15}!0xffffff'               # (WPP)LsaAuditTraceControlGuid
    '{366B218A-A5AA-4096-8131-0BDAFCC90E93}!0xfffffff'              # (WPP)LsaIsoTraceControlGuid
    '{4D9DFB91-4337-465A-A8B5-05A27D930D48}!0xff'                   # (TL)Microsoft.Windows.Security.LsaSrv
    '{7FDD167C-79E5-4403-8C84-B7C0BB9923A1}!0xFFF'                  # (WPP)VaultGlobalDebugTraceControlGuid
    '{CA030134-54CD-4130-9177-DAE76A3C5791}!0xfffffff'              # (WPP)NETLOGON
    '{5a5e5c0d-0be0-4f99-b57e-9b368dd2c76e}!0xffffffffffffffff'     # (WPP)VaultCDSTraceGuid
    '{2D45EC97-EF01-4D4F-B9ED-EE3F4D3C11F3}!0xffffffffffffffff'     # (WPP)GmsaClientTraceControlGuid
    '{C00D6865-9D89-47F1-8ACB-7777D43AC2B9}!0xffffffffffffffff'     # (WPP)CCGLaunchPadTraceControlGuid
    '{7C9FCA9A-EBF7-43FA-A10A-9E2BD242EDE6}!0xffffffffffffffff'     # (WPP)CCGTraceControlGuid
    '{794FE30E-A052-4B53-8E29-C49EF3FC8CBE}!0xffffffffffffffff'
    '{ba634d53-0db8-55c4-d406-5c57a9dd0264}!0xffffffffffffffff'     # (TL)Microsoft.Windows.Security.PasswordlessPolicy
    '{45E7DBC5-E130-5CEF-9353-CC5EBF05E6C8}!0xFFFF'                 # (EVT)Microsoft-Windows-Containers-CCG/Admin
    '{A4E69072-8572-4669-96B7-8DB1520FC93A}!0xffffffffffffffff'
    '{C5D12E1B-84A0-4fe6-9E5F-FEBA123EAE66}!0xffffffffffffffff'     # (WPP)RoamingSecurityDebugTraceControlGuid
    '{E2E66F29-4D71-4646-8E58-20E204C3C25B}!0xffffffffffffffff'     # (WPP)RoamingSecurityDebugTraceControlGuid
    '{6f2c1ee5-1dfd-519b-2d55-702756f5964d}!0xffffffffffffffff'
    '{FB093D76-8964-11DF-9EA1-CB38E0D72085}!0xFFFF'                 # (WPP)KDSSVCCtlGuid
    '{3353A14D-EE30-436E-8FF5-575A4351EA80}!0xFFFF'                 # (WPP)KDSPROVCtlGuid
    '{afda4fd8-2fe5-5c75-ba0e-7d5c0b225e12}!0xffffffffffffffff'
    '{cbb61b6d-a2cf-471a-9a58-a4cd5c08ffba}!0xff'                   # (WPP)UACLog
)
#=================================================== LSA_Providers ===================================================

#=================================================== NTLM_Providers ===================================================
$NTLM_Prodivers=
@(
    '{5BBB6C18-AA45-49b1-A15F-085F7ED0AA90}!0x5ffDf'
    '{AC69AE5B-5B21-405F-8266-4424944A43E9}!0xffffffff'
    '{6165F3E2-AE38-45D4-9B23-6B4818758BD9}!0xffffffff'
    '{AC43300D-5FCC-4800-8E99-1BD3F85F0320}!0xffffffffffffffff'
    '{DAA6CAF5-6678-43f8-A6FE-B40EE096E06E}!0xffffffffffffffff'
)
#=================================================== NTLM_Providers ===================================================

#=================================================== KRB_Providers ===================================================
$KRB_Providers=
@(
    '{6B510852-3583-4e2d-AFFE-A67F9F223438}!0x7ffffff'
    '{60A7AB7A-BC57-43E9-B78A-A1D516577AE3}!0xffffff'
    '{FACB33C4-4513-4C38-AD1E-57C1F6828FC0}!0xffffffff'
    '{97A38277-13C0-4394-A0B2-2A70B465D64F}!0xff'
    '{8a4fc74e-b158-4fc1-a266-f7670c6aa75d}!0xffffffffffffffff'
    '{98E6CFCB-EE0A-41E0-A57B-622D4E1B30B1}!0xffffffffffffffff'
)
#=================================================== KRB_Providers ===================================================

#=================================================== KDC_Providers ===================================================
$KDC_Providers=
@(
'{1BBA8B19-7F31-43c0-9643-6E911F79A06B}!0xfffff'
'{f2c3d846-1d17-5388-62fa-3839e9c67c80}!0xffffffffffffffff'
'{6C51FAD2-BA7C-49b8-BF53-E60085C13D92}!0xffffffffffffffff'
)
#=================================================== KDC_Providers ===================================================

#=================================================== SAM_Providers ===================================================
$SAM_Providers=
@(
'{8E598056-8993-11D2-819E-0000F875A064}!0xffffffffffffffff'
'{0D4FDC09-8C27-494A-BDA0-505E4FD8ADAE}!0xffffffffffffffff'
'{BD8FEA17-5549-4B49-AA03-1981D16396A9}!0xffffffffffffffff'
'{F2969C49-B484-4485-B3B0-B908DA73CEBB}!0xffffffffffffffff'
'{548854B9-DA55-403E-B2C7-C3FE8EA02C3C}!0xffffffffffffffff'
)
#=================================================== SAM_Providers ===================================================

#=================================================== SSL_Providers ===================================================
$SSL_Providers=
@(
'{37D2C3CD-C5D4-4587-8531-4696C44244C8}!0x4000ffff'
)
#=================================================== SSL_Providers ===================================================

#=================================================== Crypt_Providers ===================================================
$CRYPT_Providers=
@(
'{EA3F84FC-03BB-540e-B6AA-9664F81A31FB}!0xFFFFFFFF'
'{A74EFE00-14BE-4ef9-9DA9-1484D5473302}!0xFFFFFFFF'
'{A74EFE00-14BE-4ef9-9DA9-1484D5473301}!0xFFFFFFFF'
'{A74EFE00-14BE-4ef9-9DA9-1484D5473303}!0xFFFFFFFF'
'{A74EFE00-14BE-4ef9-9DA9-1484D5473305}!0xFFFFFFFF'
'{786396CD-2FF3-53D3-D1CA-43E41D9FB73B}!0x0'
'{a74efe00-14be-4ef9-9da9-1484d5473304}!0xffffffffffffffff'
'{9d2a53b2-1411-5c1c-d88c-f2bf057645bb}!0xffffffffffffffff'
)
#=================================================== Crypt_Providers ===================================================

#=================================================== SMART_CARD_Providers ===================================================
$SMART_Providers=
@(
'{30EAE751-411F-414C-988B-A8BFA8913F49}!0xffffffffffffffff'
'{13038E47-FFEC-425D-BC69-5707708075FE}!0xffffffffffffffff'
'{3FCE7C5F-FB3B-4BCE-A9D8-55CC0CE1CF01}!0xffffffffffffffff'
'{FB36CAF4-582B-4604-8841-9263574C4F2C}!0xffffffffffffffff'
'{133A980D-035D-4E2D-B250-94577AD8FCED}!0xffffffffffffffff'
'{EED7F3C9-62BA-400E-A001-658869DF9A91}!0xffffffffffffffff'
'{27BDA07D-2CC7-4F82-BC7A-A2F448AB430F}!0xffffffffffffffff'
'{15DE6EAF-EE08-4DE7-9A1C-BC7534AB8465}!0xffffffffffffffff'
'{31332297-E093-4B25-A489-BC9194116265}!0xffffffffffffffff'
'{4fcbf664-a33a-4652-b436-9d558983d955}!0xffffffffffffffff'
'{DBA0E0E0-505A-4AB6-AA3F-22F6F743B480}!0xffffffffffffffff'
'{125f2cf1-2768-4d33-976e-527137d080f8}!0xffffffffffffffff'
'{beffb691-61cc-4879-9cd9-ede744f6d618}!0xffffffffffffffff'
'{545c1f45-614a-4c72-93a0-9535ac05c554}!0xffffffffffffffff'
'{AEDD909F-41C6-401A-9E41-DFC33006AF5D}!0xffffffffffffffff'
'{09AC07B9-6AC9-43BC-A50F-58419A797C69}!0xffffffffffffffff'
'{AAEAC398-3028-487C-9586-44EACAD03637}!0xffffffffffffffff'
'{9F650C63-9409-453C-A652-83D7185A2E83}!0xffffffffffffffff'
'{F5DBD783-410E-441C-BD12-7AFB63C22DA2}!0xffffffffffffffff'
'{a3c09ba3-2f62-4be5-a50f-8278a646ac9d}!0xffffffffffffffff'
'{15f92702-230e-4d49-9267-8e25ae03047c}!0xffffffffffffffff'
'{179f04fd-cf7a-41a6-9587-a3d22d5e39b0}!0xffffffffffffffff'
)
#=================================================== SMART_CARD_Providers ===================================================

#=================================================== CRED_PROVIDERS_Providers ===================================================
$CRED_PROVIDERS_Providers=
@(
'{5e85651d-3ff2-4733-b0a2-e83dfa96d757}!0xffffffffffffffff'
'{D9F478BB-0F85-4E9B-AE0C-9343F302F9AD}!0xffffffffffffffff'
'{462a094c-fc89-4378-b250-de552c6872fd}!0xffffffffffffffff'
'{8db3086d-116f-5bed-cfd5-9afda80d28ea}!0xffffffffffffffff'
'{a55d5a23-1a5b-580a-2be5-d7188f43fae1}!0xFFFF'
'{4b8b1947-ae4d-54e2-826a-1aee78ef05b2}!0xFFFF'
'{176CD9C5-C90C-5471-38BA-0EEB4F7E0BD0}!0xffffffffffffffff'
'{3EC987DD-90E6-5877-CCB7-F27CDF6A976B}!0xffffffffffffffff'
'{41AD72C3-469E-5FCF-CACF-E3D278856C08}!0xffffffffffffffff'
'{4F7C073A-65BF-5045-7651-CC53BB272DB5}!0xffffffffffffffff'
'{A6C5C84D-C025-5997-0D82-E608D1ABBBEE}!0xffffffffffffffff'
'{C0AC3923-5CB1-5E37-EF8F-CE84D60F1C74}!0xffffffffffffffff'
'{DF350158-0F8F-555D-7E4F-F1151ED14299}!0xffffffffffffffff'
'{FB3CD94D-95EF-5A73-B35C-6C78451095EF}!0xffffffffffffffff'
'{d451642c-63a6-11d7-9720-00b0d03e0347}!0xffffffffffffffff'
'{b39b8cea-eaaa-5a74-5794-4948e222c663}!0xffffffffffffffff'
'{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}!0xffffffffffffffff'
'{c2ba06e2-f7ce-44aa-9e7e-62652cdefe97}!0xffffffffffffffff'
'{5B4F9E61-4334-409F-B8F8-73C94A2DBA41}!0xffffffffffffffff'
'{a789efeb-fc8a-4c55-8301-c2d443b933c0}!0xffffffffffffffff'
'{301779e2-227d-4faf-ad44-664501302d03}!0xffffffffffffffff'
'{557D257B-180E-4AAE-8F06-86C4E46E9D00}!0xffffffffffffffff'
'{D33E545F-59C3-423F-9051-6DC4983393A8}!0xffffffffffffffff'
'{19D78D7D-476C-47B6-A484-285D1290A1F3}!0xffffffffffffffff'
'{EB7428F5-AB1F-4322-A4CC-1F1A9B2C5E98}!0xffffffffffffffff'
'{D9391D66-EE23-4568-B3FE-876580B31530}!0xffffffffffffffff'
'{D138F9A7-0013-46A6-ADCC-A3CE6C46525F}!0xffffffffffffffff'
'{2955E23C-4E0B-45CA-A181-6EE442CA1FC0}!0xffffffffffffffff'
'{012616AB-FF6D-4503-A6F0-EFFD0523ACE6}!0xffffffffffffffff'
'{5A24FCDB-1CF3-477B-B422-EF4909D51223}!0xffffffffffffffff'
'{63D2BB1D-E39A-41B8-9A3D-52DD06677588}!0xffffffffffffffff'
'{4B812E8E-9DFC-56FC-2DD2-68B683917260}!0xffffffffffffffff'
'{169CC90F-317A-4CFB-AF1C-25DB0B0BBE35}!0xffffffffffffffff'
'{041afd1b-de76-48e9-8b5c-fade631b0dd5}!0xffffffffffffffff'
'{39568446-adc1-48ec-8008-86c11637fc74}!0xffffffffffffffff'
'{d1731de9-f885-4e1f-948b-76d52702ede9}!0xffffffffffffffff'
'{d5272302-4e7c-45be-961c-62e1280a13db}!0xffffffffffffffff'
'{55f422c8-0aa0-529d-95f5-8e69b6a29c98}!0xffffffffffffffff'
)
#=================================================== CRED_PROVIDERS_Providers ===================================================

#=================================================== APPX_Providers ===================================================
$APPX_Providers=
@(
'{f0be35f8-237b-4814-86b5-ade51192e503}!0xffffffffffffffff'
'{8127F6D4-59F9-4abf-8952-3E3A02073D5F}!0xffffffffffffffff'
'{3ad13c53-cf84-4522-b349-56b81ffcd939}!0xffffffffffffffff'
'{b89fa39d-0d71-41c6-ba55-effb40eb2098}!0xffffffffffffffff'
'{fe762fb1-341a-4dd4-b399-be1868b3d918}!0xffffffffffffffff'
)
#=================================================== APPX_Providers ===================================================



####################################################
#                All Functions
####################################################
Function Start-Logman {
    param(
        [string]$TraceName,
        [string]$LogName,
        [bool]$Persist,
        [switch]$Circ,
        [int]$Size = 1024
    )
        logman start "$TraceName" -ow -o "$LogName" -nb 16 16 -bs 1024 -mode Circular -f bincirc -max $Size -ets
}

Function Update-Logman {
    param(
        [string]$TraceName,
        [string]$ProviderId,
        [string]$ProviderFlags,
        [string]$Options = "",
        [bool]$Persist
    )
    if($Persist) {
        # NOTE(will): Autologger will have it's path updated on EVERY logman update trace...
        Push-Location $_LOG_DIR
        logman update trace "autosession\$TraceName" -p "$ProviderId" $ProviderFlags 0xff -ets | Out-Null
        Pop-Location
    }
    else {
        logman update trace "$TraceName" -p "$ProviderId" $ProviderFlags 0xff -ets | Out-Null
    }
}

Function Wait_for_User
{
    Write-Host "`nPress Enter key to stop logging.....`n" -ForegroundColor Yellow
    Read-Host
}


####################################################
#                Functions at start
####################################################
Function Create_Log_Folder
{
    # Creating the root folder and the file is used in creating folders
    if (!(Test-Path $global:root_folder))
    {
        If ($global:verbose_output){Write-Host "Creating Folder" $global:root_folder -ForegroundColor Red}
        New-Item -Path $global:root_folder -ItemType Directory | Out-Null
    }

    (Get-Date).ToString("yyyy-MM-dd_HH-mm-ss") | Out-File $global:folder_file
    $log_folder = Get-Content -Path $global:folder_file

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


Function Start_PSR
{
    psr.exe /start /output $global:full_folder"\psr.zip" /gui 0 /sc 1 /maxsc 100
}


Function Enable_Start_Event_Logs
{
    #Write-Host " Starting all event logs.....`n" -ForegroundColor Blue
    If ($global:verbose_output){Write-Host "WE are in Start_Event_Logs" -ForegroundColor Red}

    foreach ($each_log in $global:event_list)
    {
        $each_log_settings = Get-WinEvent -ListLog $each_log

        if($each_log_settings.IsEnabled -eq $false)
        {
            #Write-Host $each_log "is disable and we are enabling it"
            $global:event_log_disabled_by_default += $each_log

            if($each_log.Contains("CAPI2"))
            {
                If ($global:verbose_output){Write-Host "Enabling $each_log, Change size and the original log size is" $each_log_settings.MaximumSizeInBytes -ForegroundColor Red}
                $global:CAPI2_Default_Size = $each_log_settings.MaximumSizeInBytes
                wevtutil.exe set-log $each_log /enabled:true /ms:102400000 /q:true
            }
            else
            {
                If ($global:verbose_output){Write-Host "Enabling" $each_log -ForegroundColor Red}
                wevtutil.exe set-log $each_log /enabled:true /q:true
            }
        }
        else
        {
            If ($global:verbose_output){Write-Host $each_log "is enabled" -ForegroundColor Red}

            if($each_log.Contains("CAPI2"))
            {
                If ($global:verbose_output){Write-Host "Change size of $each_log logs and the original log size is" $each_log_settings.MaximumSizeInBytes -ForegroundColor Red}
                $global:CAPI2_Default_Size = $each_log_settings.MaximumSizeInBytes
                wevtutil.exe set-log $each_log /ms:102400000 /q:true
            }
            elseif ($each_log.Contains("Analytic") -or $each_log.Contains("User Device Registration/Debug"))
            {
                If ($global:verbose_output){Write-Host "Disable $each_log log, backup the log and enable the log." -ForegroundColor Red}
                
                # Create file name for back up
                $file_name = $each_log.Replace(" ", "_").Replace("/","_")
                $event_file_path = $global:full_eventlog_folder+$file_name+"_backup.evtx"

                # Disable the log, save for backup and enable the log
                wevtutil.exe set-log $each_log /enabled:false /q:true | Out-Null
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null

                # Enable the log
                wevtutil.exe set-log $each_log /enabled:true /q:true
            }
        }
    }
}


Function Start_ETW_Traces
{
    If ($global:verbose_output){Write-Host "We are starting all ETW logs....." -ForegroundColor Red}
    #Write-Host " Starting all ETW logs.....`n" -ForegroundColor Blue
    
    #================================ WAM ETW ================================
    $traceFile_WAM = Join-Path $global:full_etw_folder -ChildPath "WAM.etl"
    Start-Logman -TraceName $global:WAM_Trace_Name -LogName $traceFile_WAM

    ForEach ($WAM_Provider in $WAM_Providers) 
    {
        # Update Logman WAM
        $WAM_Params = $WAM_Provider.Split('!')
        $WAM_TraceGUID = $WAM_Params[0]
        $WAM_TraceFlags = $WAM_Params[1]
        Update-Logman -TraceName $global:WAM_Trace_Name -ProviderId $WAM_TraceGUID -ProviderFlags $WAM_TraceFlags -Persist $false
    }

    If ($global:verbose_output){Write-Host "WAM_Trace started....." -ForegroundColor Red}
    #================================ WAM ETW ================================

    #================================ NGC ETW ================================
    $traceFile_NGC = Join-Path $global:full_etw_folder -ChildPath "NGC.etl"
    Start-Logman -TraceName $global:NGC_Trace_Name -LogName $traceFile_NGC   

    ForEach ($NGC_Provider in $NGC_Providers) 
    {
        # Update Logman NGC
        $NGC_Params = $NGC_Provider.Split('!')
        $NGC_TraceGUID = $NGC_Params[0]
        $NGC_TraceFlags = $NGC_Params[1]
        Update-Logman -TraceName $global:NGC_Trace_Name -ProviderId $NGC_TraceGUID -ProviderFlags $NGC_TraceFlags -Persist $false
    }

    If ($global:verbose_output){Write-Host "NGC_Trace started....." -ForegroundColor Red}
    #================================ NGC ETW ================================

    #================================ BIOM ETW ================================
    $traceFile_BIO = Join-Path $global:full_etw_folder -ChildPath "Biometric.etl"
    Start-Logman -TraceName $global:BIO_Trace_Name -LogName $traceFile_BIO    

    ForEach ($BIOM_Provider in $BIOM_Providers) 
    {
        # Update Logman BIO
        $BIO_Params = $BIOM_Provider.Split('!')
        $BIO_TraceGUID = $BIO_Params[0]
        $BIO_TraceFlags = $BIO_Params[1]
        Update-Logman -TraceName $global:BIO_Trace_Name -ProviderId $BIO_TraceGUID -ProviderFlags $BIO_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "BIOM_Trace started....." -ForegroundColor Red}
    #================================ BIOM ETW ================================
    
    #================================ LSA ETW ================================
    $traceFile_LSA = Join-Path $global:full_etw_folder -ChildPath "LSA.etl"
    Start-Logman -TraceName $global:LSA_Trace_Name -LogName $traceFile_LSA    

    ForEach ($LSA_Provider in $LSA_Providers) 
    {
        # Update Logman LSA
        $LSA_Params = $LSA_Provider.Split('!')
        $LSA_TraceGUID = $LSA_Params[0]
        $LSA_TraceFlags = $LSA_Params[1]
        Update-Logman -TraceName $global:LSA_Trace_Name -ProviderId $LSA_TraceGUID -ProviderFlags $LSA_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "LSA_Trace started....." -ForegroundColor Red}
    #================================ LSA ETW ================================

    #================================ NTLM ETW ================================
    $traceFile_NTLM = Join-Path $global:full_etw_folder -ChildPath "NTLM.etl"
    Start-Logman -TraceName $global:NTLM_Trace_Name -LogName $traceFile_NTLM    

    ForEach ($NTLM_Prodiver in $NTLM_Prodivers) 
    {
        # Update Logman NTLM
        $NTLM_Params = $NTLM_Prodiver.Split('!')
        $NTLM_TraceGUID = $NTLM_Params[0]
        $NTLM_TraceFlags = $NTLM_Params[1]
        Update-Logman -TraceName $global:NTLM_Trace_Name -ProviderId $NTLM_TraceGUID -ProviderFlags $NTLM_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "NTLM_Trace started....." -ForegroundColor Red}
    #================================ NTLM ETW ================================ 

    #================================ KRB ETW ================================
    $traceFile_KRB = Join-Path $global:full_etw_folder -ChildPath "Kerberos.etl"
    Start-Logman -TraceName $global:KRB_Trace_Name -LogName $traceFile_KRB    

    ForEach ($KRB_Provider in $KRB_Providers) 
    {
        # Update Logman Kerberos
        $KRB_Params = $KRB_Provider.Split('!')
        $KRB_TraceGUID = $KRB_Params[0]
        $KRB_TraceFlags = $KRB_Params[1]
        Update-Logman -TraceName $global:KRB_Trace_Name -ProviderId $KRB_TraceGUID -ProviderFlags $KRB_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "KRB_Trace started....." -ForegroundColor Red}
    #================================ KRB ETW ================================ 
    
    <#================================ KDC ETW ================================
    $providerFile_KDC = Join-Path $global:full_etw_folder -ChildPath "KDC.txt"
    Set-Content -LiteralPath $providerFile_KDC  -Value $KDC_Providers -Encoding Ascii -ErrorAction Stop
    $traceFile_KDC = Join-Path $global:full_etw_folder -ChildPath "KDC.etl"
    
    logman.exe start trace "KDC_Trace" -pf $providerFile_KDC  -o $traceFile_KDC -ets | Out-Null
    If ($global:verbose_output){Write-Host "KDC_Trace started....." -ForegroundColor Red}
    #================================ KDC ETW ================================#>

    #================================ SAM ETW ================================
    $traceFile_SAM = Join-Path $global:full_etw_folder -ChildPath "SAM.etl"
    Start-Logman -TraceName $global:SAM_Trace_Name -LogName $traceFile_SAM    

    ForEach ($SAM_Provider in $SAM_Providers) 
    {
        # Update Logman NGC
        $SAM_Params = $SAM_Provider.Split('!')
        $SAM_TraceGUID = $SAM_Params[0]
        $SAM_TraceFlags = $SAM_Params[1]
        Update-Logman -TraceName $global:SAM_Trace_Name -ProviderId $SAM_TraceGUID -ProviderFlags $SAM_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "SAM_Trace started....." -ForegroundColor Red}
    #================================ SAM ETW ================================ 

    #================================ SSL ETW ================================
    $traceFile_SSL = Join-Path $global:full_etw_folder -ChildPath "SSL.etl"
    Start-Logman -TraceName $global:SSL_Trace_Name -LogName $traceFile_SSL    

    ForEach ($SSL_Provider in $SSL_Providers) 
    {
        # Update Logman NGC
        $SSL_Params = $SSL_Provider.Split('!')
        $SSL_TraceGUID = $SSL_Params[0]
        $SSL_TraceFlags = $SSL_Params[1]
        Update-Logman -TraceName $global:SSL_Trace_Name -ProviderId $SSL_TraceGUID  -ProviderFlags $SSL_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "SSL_Trace started....." -ForegroundColor Red}
    #================================ SSL ETW ================================ 

    #================================ CRYPT ETW ================================
    $traceFile_CRYPT = Join-Path $global:full_etw_folder -ChildPath "CRYPT.etl"
    Start-Logman -TraceName $global:CRYPT_Trace_Name -LogName $traceFile_CRYPT    

    ForEach ($CRYPT_Provider in $CRYPT_Providers) 
    {
        # Update Logman CRYPT
        $CRYPT_Params = $CRYPT_Provider.Split('!')
        $CRYPT_TraceGUID = $CRYPT_Params[0]
        $CRYPT_TraceFlags = $CRYPT_Params[1]
        Update-Logman -TraceName $global:CRYPT_Trace_Name -ProviderId $CRYPT_TraceGUID  -ProviderFlags $CRYPT_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "CRYPT_Trace started....." -ForegroundColor Red}
    #================================ CRYPT ETW ================================ 

    #================================ SMART ETW ================================
    $traceFile_SMART = Join-Path $global:full_etw_folder -ChildPath "SMART.etl"
    Start-Logman -TraceName $global:SMART_CARD_Trace_Name -LogName $traceFile_SMART    

    ForEach ($SMART_Provider in $SMART_Providers) 
    {
        # Update Logman SMART
        $SMART_Params = $SMART_Provider.Split('!')
        $SMART_TraceGUID = $SMART_Params[0]
        $SMART_TraceFlags = $SMART_Params[1]
        Update-Logman -TraceName $global:SMART_CARD_Trace_Name -ProviderId $SMART_TraceGUID  -ProviderFlags $SMART_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "SMART_Trace started....." -ForegroundColor Red}
    #================================ SMART ETW ================================ 

    #================================ CRED PROVIDERs ETW ================================
    $traceFile_CRED = Join-Path $global:full_etw_folder -ChildPath "CRED.etl"
    Start-Logman -TraceName $global:CRED_Trace_Name -LogName $traceFile_CRED

    ForEach ($CRED_PROVIDERS_Provider in $CRED_PROVIDERS_Providers) 
    {
        # Update Logman CRED_PROVIDERS
        $CRED_PROVIDERS_Params = $CRED_PROVIDERS_Provider.Split('!')
        $CRED_PROVIDERS_TraceGUID = $CRED_PROVIDERS_Params[0]
        $CRED_PROVIDERS_TraceFlags = $CRED_PROVIDERS_Params[1]
        Update-Logman -TraceName $global:CRED_Trace_Name -ProviderId $CRED_PROVIDERS_TraceGUID  -ProviderFlags $CRED_PROVIDERS_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "CRED_Trace started....." -ForegroundColor Red}
    #================================ CRED PROVIDERs ETW ================================ 

    #================================ APPX ETW ================================
    $traceFile_APPX = Join-Path $global:full_etw_folder -ChildPath "APPX.etl"
    Start-Logman -TraceName $global:APPX_Trace_Name -LogName $traceFile_APPX

    ForEach ($APPX_Provider in $APPX_Providers) 
    {
        # Update Logman APPX
        $APPX_Params = $APPX_Provider.Split('!')
        $APPX_TraceGUID = $APPX_Params[0]
        $APPX_TraceFlags = $APPX_Params[1]
        Update-Logman -TraceName $global:APPX_Trace_Name -ProviderId $APPX_TraceGUID  -ProviderFlags $APPX_TraceFlags -Persist $false
    }
    If ($global:verbose_output){Write-Host "APPX_Trace started....." -ForegroundColor Red}
    #================================ APPX ETW ================================
}


Function Start_Network_Trace
{
    #Write-Host " Starting network trace.....`n" -ForegroundColor Blue
    If ($global:verbose_output){Write-Host "We are starting network trace." -ForegroundColor Red}
    netsh trace start capture=yes maxsize=1 report=disabled | Out-Null
    netsh trace stop | Out-Null
    netsh trace start capture=yes scenario=InternetClient_dbg maxsize=4096 tracefile=$global:full_net_folder"Network_Trace.etl" | Out-Null
}


####################################################
#                Functions at end
####################################################
Function Stop_NetTrace_Get_NetInfo
{
    If ($global:verbose_output){Write-Host "We are stopping network trace..." -ForegroundColor Red}
    #Write-Host " Stopping network trace and collecting network related information...`n" -ForegroundColor Blue

    #Stopping nertwork trace
    netsh trace stop | Out-Null

    # Geting result of network connectivity
    # 2023/4/14 Change from RemoteSigned to Bypass
    Powershell.exe -ExecutionPolicy Bypass -File $global:current_Folder"\Test-DeviceRegConnectivity.ps1" | Out-File -FilePath $global:full_net_folder"Test_DeviceRegConnectivity_Output.txt" 2>&1 | Out-Null
    Copy-Item $global:current_Folder"\Test-DeviceRegConnectivity.log" -Destination $global:full_net_folder | Out-Null
    Remove-Item $global:current_Folder"\Test-DeviceRegConnectivity.log" -Force  | Out-Null
    
    #.\Test-DeviceRegConnectivity.ps1 | Out-Null
    #Move-Item $global:current_Folder"\Test-DeviceRegConnectivity.log" -Destination $global:full_net_folder | Out-Null
    
    # WinhTTP Proxy
    netsh winhttp show proxy > $global:full_net_folder"winhttp_proxy.txt" 2>&1 | Out-Null

    # WinINet
    # 2023/7/13 Move this to user context
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /s > $global:full_net_folder"REG_WinINet01.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /s > $global:full_net_folder"REG_WinINet02.txt" 2>&1 | Out-Null

    # ipconfig
    ipconfig /all > $global:full_net_folder"IPCofig_ALL.txt" 2>&1 | Out-Null
    ipconfig /displayDNS > $global:full_net_folder"IPCofig_Display_DNS.txt" 2>&1 | Out-Null

    # netstat
    netstat -anoi > $global:full_net_folder"netstat_anoi.txt" 2>&1 | Out-Null
    netstat -r > $global:full_net_folder"netstat_routingTable.txt" 2>&1 | Out-Null

    # bitsadmin proxy of system, networkservice and localservice
    bitsadmin /util /getieproxy LOCALSYSTEM > $global:full_net_folder"LOCAL_SYSTEM_proxy.txt" 2>&1 | Out-Null
    bitsadmin /util /getieproxy NETWORKSERVICE > $global:full_net_folder"NETWORK_SERVICE_proxy.txt" 2>&1 | Out-Null
    bitsadmin /util /getieproxy LOCALSERVICE > $global:full_net_folder"LOCAL_SERVICE_proxy.txt" 2>&1 | Out-Null
}


function Stop_ETW_Trace 
{
    If ($global:verbose_output){Write-Host "We are in Stop_ETW_Trace...." -ForegroundColor Red}
    #Write-Host " Stopping and collecting ETW logs.....`n" -ForegroundColor Blue

    logman stop $global:WAM_Trace_Name -ets | Out-Null
    #Write-Host "WAM_Trace stopped....."

    logman stop $global:NGC_Trace_Name -ets | Out-Null
    #Write-Host "NGC_Trace stopped....."
    
    logman stop $global:BIO_Trace_Name -ets | Out-Null
    #Write-Host "BIOM_Trace stopped....."
    
    logman stop $global:LSA_Trace_Name -ets | Out-Null
    #Write-Host "LSA_Trace stopped....."

    logman stop $global:NTLM_Trace_Name -ets | Out-Null
    #Write-Host "NTLM_Trace stopped....."

    logman stop $global:KRB_Trace_Name -ets | Out-Null
    #Write-Host "KRB_Trace stopped....."

    #logman stop "KDC_Trace" -ets | Out-Null
    #Write-Host "KDC_Trace stopped....."

    logman stop $global:SAM_Trace_Name -ets | Out-Null
    #Write-Host "SAM_Trace stopped....."

    logman stop $global:SSL_Trace_Name -ets | Out-Null
    #Write-Host "SSL_Trace stopped....."

    logman stop $global:CRYPT_Trace_Name -ets | Out-Null
    #Write-Host "CRYPT_Trace stopped....."

    logman stop $global:SMART_CARD_Trace_Name -ets | Out-Null
    #Write-Host "SMART_Trace stopped....."

    logman stop $global:CRED_Trace_Name -ets | Out-Null
    #Write-Host "CRED_Trace stopped....."

    logman stop $global:APPX_Trace_Name -ets | Out-Null
    #Write-Host "APPX_Trace stopped....."
}


Function Stop_Event_Logs
{
    If ($global:verbose_output){Write-Host "We are in Stop_Event_Logs" -ForegroundColor Red}
    #Write-Host " Stopping and collecting Event logs...`n" -ForegroundColor Blue

    foreach ($each_log in $global:event_list)
    {
        $file_name = $each_log.Replace(" ", "_").Replace("/","_")
        $event_file_path = $global:full_eventlog_folder+$file_name+".evtx"

        if ($global:event_log_disabled_by_default.Contains($each_log))
        {
            if ($each_log.Contains("CAPI2"))
            {
                If ($global:verbose_output){Write-Host "Saving CAPI2 to" $event_file_path ", change size back to" $global:CAPI2_Default_Size ",and disable it" -ForegroundColor Red}
                wevtutil.exe set-log $each_log /enabled:false /ms:$global:CAPI2_Default_Size /q:true | Out-Null
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null
            }
            else
            {
                If ($global:verbose_output){Write-Host "Disabling" $each_log "and save to" $event_file_path -ForegroundColor Red}
                wevtutil.exe set-log $each_log /enabled:false /q:true | Out-Null
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null
            }
        }
        else
        {
            if ($each_log.Contains("CAPI2"))
            {
                If ($global:verbose_output){Write-Host "Saving CAPI2 to" $event_file_path ", change size back to" $global:CAPI2_Default_Size -ForegroundColor Red}
                wevtutil.exe set-log $each_log /ms:$global:CAPI2_Default_Size /q:true | Out-Null
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null
            }
            elseif ($each_log.Contains("Analytic") -or $each_log.Contains("User Device Registration/Debug"))
            {
                If ($global:verbose_output){Write-Host "Disabling $each_log log, save the log and enable the log." -ForegroundColor Red}

                # Disable the log, save the log and enable the log
                wevtutil.exe set-log $each_log /enabled:false /q:true | Out-Null
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null

                # Enable the log again
                wevtutil.exe set-log $each_log /enabled:true /q:true
            }
            else
            {
                if ($global:verbose_output){Write-Host "$each_log is enabled and save to" $event_file_path -ForegroundColor Red}
                wevtutil.exe export-log $each_log $event_file_path /overwrite:true | Out-Null
            }
        }
    }

    wevtutil.exe epl System $global:full_eventlog_folder"System_Event_Logs.evtx" | Out-Null
    wevtutil.exe epl Application $global:full_eventlog_folder"Application_Event_Logs.evtx" | Out-Null
    wevtutil.exe epl Security $global:full_eventlog_folder"Security_Event_Logs.evtx" | Out-Null
}


# Gathering information from registry keys
Function Get_Reg
{
    If ($global:verbose_output){Write-Host "Entering Get-Reg" -ForegroundColor Red}

    # Getting build info
    reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v BuildLabEx > $global:full_reg_folder"HKLM_BUILD_VERSION.txt" 2>&1 | Out-Null

    # Getting information
    # HKLM
    reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication" /s > $global:full_reg_folder"HKLM_authentication.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Winbio" /s > $global:full_reg_folder"HKLM_winbio.txt" 2>&1 | Out-Null
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /s > $global:full_reg_folder"HKLM_wbiosrvc.txt" 2>&1 | Out-Null
    reg query "HKLM\SYSTEM\CurrentControlSet\Control\EAS\Policies" /s > $global:full_reg_folder"HKLM_eas.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Biometrics" /s > $global:full_reg_folder"HKLM_policies.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Microsoft\SQMClient" /s > $global:full_reg_folder"HKLM_MachineId.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Microsoft\Policies\PassportForWork" /s > $global:full_reg_folder"HKLM_NgcPolicyIntune.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Policies\Microsoft\PassportForWork" /s > $global:full_reg_folder"HKLM_NgcPolicyGp.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\DeviceLock" /s > $global:full_reg_folder"HKLM_DeviceLockPolicy.txt" 2>&1 | Out-Null
    reg query "HKLM\SYSTEM\CurrentControlSet\Control\CloudDomainJoin" /s > $global:full_reg_folder"HKLM_CloudDomainJoin.txt" 2>&1 | Out-Null
    reg query "HKLM\Software\Microsoft\IdentityStore" /s > $global:full_reg_folder"HKLM_idstore_config.txt" 2>&1 | Out-Null
    reg query "HKLM\Software\Microsoft\IdentityCRL" /s > $global:full_reg_folder"HKLM_IdentityCRL.txt" 2>&1 | Out-Null
    reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\TokenBroker" /s > $global:full_reg_folder"HKLM_TOkenBroker.txt" 2>&1 | Out-Null
    reg query "HKLM\Software\Microsoft\Enrollments" /s > $global:full_reg_folder"HKLM_Enrollments.txt" 2>&1 | Out-Null
    reg query "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\pku2u" /s > $global:full_reg_folder"HKLM_pku2u.txt" 2>&1 | Out-Null
    reg query "HKLM\Software\Policies\Microsoft\Windows\WorkplaceJoin" /s > $global:full_reg_folder"HKLM_WPJ_GPO.txt" 2>&1 | Out-Null

    # HKU
    reg query "HKEY_USERS\.Default\Software\Microsoft\IdentityCRL" /s >> $global:full_reg_folder"HKU_idstore_config.txt" 2>&1 | Out-Null

    # HKCU
    # 2023/7/13 Move to user context
    #reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WorkplaceJoin" /s > $global:full_reg_folder"HKCU_WPJ.txt" 2>&1 | Out-Null
    #reg query "HKCU\SOFTWARE\Microsoft\SCEP" /s > $global:full_reg_folder"HKCU_scep.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\IdentityCRL" /s > $global:full_reg_folder"HKCU_IdentityCRL.txt" 2>&1 | Out-Null
    #reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\TokenBroker" /s > $global:full_reg_folder"HKCU_TokenBroker.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.aad.brokerplugin_cw5n1h2txyewy" /s > $global:full_reg_folder"HKCU_AAD_BrokerPlugIn.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /s > $global:full_reg_folder"HKCU_ContentDeliveryManager.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\AuthCookies" /s > $global:full_reg_folder"HKCU_AuthCookies.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\AAD" /s > $global:full_reg_folder"HKCU_AAD.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /s > $global:full_reg_folder"HKCU_PushNotifications.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\ActivityDataModel" /s > $global:full_reg_folder"HKCU_ActivityDataModel.txt" 2>&1 | Out-Null
    #reg query "HKCU\Software\Classes\Local Settings\MrtCache" /s > $global:full_reg_folder"HKCU_MrtCache.txt" 2>&1 | Out-Null
    #reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AAD" /s > $global:full_reg_folder"HKCU_AAD.txt" 2>&1 | Out-Null

    If ($global:verbose_output){Write-Host "Exiting Get-Reg" -ForegroundColor Red}
}


# Gathering certificate information
Function Get_Certs
{
    If ($global:verbose_output){Write-Host "Entering Get_Certs" -ForegroundColor Red}

    certutil -v -silent -store ROOT > $global:full_cert_folder"CERT_Root.txt" 2>&1 | Out-Null
    certutil -v -silent -store -user ROOT > $global:full_cert_folder"CERT_Root_User.txt" 2>&1 | Out-Null
    certutil -v -silent -store CA > $global:full_cert_folder"CERT_CA.txt" 2>&1 | Out-Null
    certutil -v -silent -store AUTHROOT > $global:full_cert_folder"CERT_AUTHROOT.txt" 2>&1 | Out-Null
    certutil -v -silent -store -enterprise ROOT > $global:full_cert_folder"CERT_Enterprise_Root.txt" 2>&1 | Out-Null
    certutil -v -silent -store -enterprise NTAUTH > $global:full_cert_folder"CERT_Enterprise_NTAuth.txt" 2>&1 | Out-Null
    certutil -v -silent -store -grouppolicy ROOT > $global:full_cert_folder"CERT_GPO_ROOT.txt" 2>&1 | Out-Null
    certutil -v -silent -store MY > $global:full_cert_folder"CERT_Machine_MY.txt" 2>&1 | Out-Null
    certutil -v -silent -store -user MY > $global:full_cert_folder"CERT_User_MY.txt" 2>&1 | Out-Null
    certutil -v -silent -scinfo > $global:full_cert_folder"CERT_smart_card_info.txt" 2>&1 | Out-Null # Displays information about the smart card.
    certutil -tpminfo > $global:full_cert_folder"CERT_TPM_Info.txt" 2>&1 | Out-Null
    certutil -v -silent -user -key -csp > $global:full_cert_folder"CERT_MS_Passport_Key.txt" 2>&1 | Out-Null
    certutil -v -silent -user -store my > $global:full_cert_folder"CERT_MS_Passport_Provider.txt" 2>&1 | Out-Null

    If ($global:verbose_output){Write-Host "Exiting Get_Certs" -ForegroundColor Red}
}


Function Get_SCP
{
    If ($global:verbose_output){Write-Host "Entering Get_SCP" -ForegroundColor Red}

    # Get local SCP info
    reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CDJ" /s > $global:full_folder"\SCP_REG.txt" 2>&1 | Out-Null

    # Get SCP on AD
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
        "Not able to query SCP on AD from here" | Out-File -FilePath $global:full_folder"\SCP_AD_Admin.txt" 2>&1 | Out-Null
    }
    If ($global:verbose_output){Write-Host "Exiting Get_SCP" -ForegroundColor Red}
}

Function Get_ALL_Other_INFO
{
    If ($global:verbose_output){Write-Host "Entering Get_ALL_Other_INFO" -ForegroundColor Red}

    #dsregcmd
    dsregcmd.exe /status > $global:full_folder"\dsregcmd_status_admin.txt" 2>&1 | Out-Null
    dsregcmd.exe /debug > $global:full_folder"\dsregcmd_debug_admin.txt" 2>&1 | Out-Null
    dsregcmd.exe /status_old > $global:full_folder"\dsregcmd_status_old_admin.txt" 2>&1 | Out-Null
    dsregcmd.exe /ListAccounts > $global:full_folder"\dsregcmd_ListAccounts_admin.txt" 2>&1 | Out-Null
    dsregcmd.exe /RunSystemTests > $global:full_folder"\dsregcmd_RunSystemTests_admin.txt" 2>&1 | Out-Null
   
    # GPO
    gpresult /V > $global:full_folder"\GPResult_V_admin.txt" 2>&1 | Out-Null
    gpresult /H $global:full_folder"\GPResult_H_admin.html" 2>&1 | OUt-Null
    
    # Credential Manager
    cmdkey.exe /list > $global:full_folder"\credman_admin.txt" 2>&1 | Out-Null
    
    # klist
    klist.exe > $global:full_folder"\klist_admin.txt" 2>&1 | Out-Null
    klist.exe cloud_debug > $global:full_folder"\klist_cloud_debug_admin.txt" 2>&1 | Out-Null
    klist.exe tgt > $global:full_folder"\klist_tgt_admin.txt" 2>&1 | Out-Null
    klist.exe sessions > $global:full_folder"\klist_sessions_admin.txt" 2>&1 | Out-Null
    klist.exe kcd_cache > $global:full_folder"\klist_kcd_cache_admin.txt" 2>&1 | Out-Null
    klist.exe query_bind > $global:full_folder"\klist_query_bind_admin.txt" 2>&1 | Out-Null
    
    # QFE
    # wmic qfe list > $global:full_folder"\qfe_installed.txt" 2>&1 | Out-Null
    Get-HotFix | Out-File -FilePath $global:full_folder"\qfe_installed.txt" 2>&1 | Out-Null

    # whoami
    whoami /UPN > $global:full_folder"\whoami_upn_admin.txt" 2>&1 | Out-Null
    whoami /ALL > $global:full_folder"\whoami_all_admin.txt" 2>&1 | Out-Null

    # Task scheduler
    schtasks /query > $global:full_folder"\schtasks_query.txt" 2>&1 | Out-Null
    If ($global:verbose_output){Write-Host "Exiting Get_ALL_Other_INFO" -ForegroundColor Red}

    # List of applications installed
    #winget list --accept-source-agreements > $global:full_folder"\apps_installed.txt" 2>&1 | Out-Null
    get-package | Select-Object Name,Version,Source,ProviderName | Out-File -FilePath $global:full_folder"\apps_installed.txt" 2>&1 | Out-Null

    # List of processes running
    tasklist /svc > $global:full_folder"\tasklist_svc.txt" 2>&1 | Out-Null
}

Function Stop_PSR
{
    psr.exe /stop
}

####################################################
#               Run All Functions
####################################################
# Start script
#Added on 2023-8-2 to check if the powershell shell is running under admin context
# 2023-11-16 Add to print current user name and prompt for continue
$user_name = $env:USERNAME
$user_netBIOS_name = whoami

Write-Host "`nStart collecting logs under user $user_name ($user_netBIOS_name) context." -ForegroundColor Yellow
Write-Host "Please make sure this user $user_name ($user_netBIOS_name) has administrator priviledge.`n" -ForegroundColor Yellow
$answer = Read-Host "Are you sure you want to proceed (Y:Yes/N:No)"
if ($answer -ne 'Y')
{
    exit
}


Write-Host "`n Preparing for logging....." -ForegroundColor Blue

# Creating log folders
Create_Log_Folder;

# Start Transcript
Start-Transcript -Path $(Join-Path -Path $global:full_folder -ChildPath "transcript-admin.log") -Append -IncludeInvocationHeader

#Write-Host "We are starting PSR log.....`n" -ForegroundColor Blue
Write-Host " Starting PSR log....." -ForegroundColor Blue
Start_PSR;

#Write-Host "We are starting all event logs.....`n" -ForegroundColor Blue
Write-Host " Starting all event logs....." -ForegroundColor Blue
Enable_Start_Event_Logs;

#Write-Host "We are starting all ETW logs.....`n" -ForegroundColor Blue
Write-Host " Starting all ETW logs....." -ForegroundColor Blue
Start_ETW_Traces;

#Write-Host "We are starting network trace.....`n" -ForegroundColor Blue
Write-Host " Starting network trace....." -ForegroundColor Blue
Start_Network_Trace;

# Wait for user to enter
Wait_for_User;

# Stop Logs
#Write-Host "We are stopping and collecting network trace.....This could take several minutes depends on the log size.`n" -ForegroundColor Blue
Write-Host " Stopping network trace and collecting network related information..." -ForegroundColor Blue
Stop_NetTrace_Get_NetInfo;

#Write-Host "We are stopping and collecting ETW logs.....`n" -ForegroundColor Blue
Write-Host " Stopping and collecting ETW logs....." -ForegroundColor Blue
Stop_ETW_Trace;

#Write-Host "We are stopping and collecting Event logs.....`n" -ForegroundColor Blue
Write-Host " Stopping and collecting Event logs..." -ForegroundColor Blue
Stop_Event_Logs;

# Get all informations
Write-Host " Gathering all other information..." -ForegroundColor Blue
Get_Reg;
Get_Certs;
Get_SCP;
Get_ALL_Other_INFO;
#Write-Host "Done collecting all other information...`n" -ForegroundColor Blue

Write-Host " Stopping and collecing PSR log..." -ForegroundColor Blue
Stop_PSR;


# Clean up variables
Write-Host " Cleaning up..." -ForegroundColor Blue
Stop-Transcript
Remove-Variable full_folder -Scope:global
Remove-Variable folder_file -Scope:global
Remove-Variable full_eventlog_folder -Scope:global
Remove-Variable full_reg_folder -Scope:global
Remove-Variable full_cert_folder -Scope:global
Remove-Variable full_net_folder -Scope:global
Remove-Variable event_list -Scope:global
Remove-Variable event_log_disabled_by_default -Scope:global
Remove-Variable CAPI2_Default_Size -Scope:global
Remove-Variable full_etw_folder -Scope:global

Write-Host "Collecting log by administrator context is done.`n" -ForegroundColor Yellow
