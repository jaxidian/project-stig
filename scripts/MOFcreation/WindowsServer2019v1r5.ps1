configuration WindowsServer2019v1r5
{
    param()
    Import-DscResource -ModuleName PowerSTIG
    Node localhost
    {
        WindowsServer BaseLine
        {
            OsVersion   = '2019'
            OsRole      = 'MS'
            SkipRule    = 'V-93217', 'V-93571', 'V-93335', 'V-93429' # added V-93429 for WinRM and V-93519 for local account token filter https://github.com/hashicorp/packer/issues/8658#issuecomment-606845986
            StigVersion = '1.5'
            Exception   = @{
                'V-93519' = @{
                    ValueData = '1'
                }
                'V-92965' = @{
                    Identity = 'Guests' # TODO: Check if working, I had to maually modify mof
                }
                'V-93009' = @{
                    Identity = 'Guests'
                }
                'V-93011' = @{
                    Identity = 'Guests'
                }
                'V-93015' = @{
                    Identity = 'Guests'
                }
            }
            OrgSettings = @{
                'V-93281' = @{
                    OptionValue = 'xAdmin'
                }
                'V-93283' = @{
                    OptionValue = 'xGuest'
                }
            }
        }
    }
}
WindowsServer2019v1r5