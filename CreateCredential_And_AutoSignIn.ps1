# �F�؏���ۑ�
Set-ExecutionPolicy RemoteSigned

mkdir "C:\Users\y\.creds"
$Credential = Get-Credential
$Username = $Credential.Username
$FilePath = "C:\Users\y\.creds\${Username}.sec"
$Credential.Password | ConvertFrom-SecureString | Set-Content $FilePath



# �ڑ��ɕK�v�ȃ��W���[���̏���
Install-Module -Name MSOnline -AllowClobber
Import-Module MSOnline


# �T�C���C��
$Username = "admin"
$FilePath = "C:\Users\y\.creds\${Username}.sec"
$encryptedCred = Get-Content $FilePath | ConvertTo-SecureString
$pscredential = New-Object System.management.Automation.PsCredential($Username, $encryptedCred)
$tenantid = '88888888-8888-8888-8888-888888888888'
$n = 10000
for ( $i = 0; $i -lt $n; $i++ )
{
  Connect-MsolService -Credential $pscredential
}
