control 'linux-servicios' do
  impact 1.0
  title 'Verificar servicios instalados en sistemas Linux'

  only_if { os.linux? }

  describe package('nginx') do
    it { should be_installed }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe package('git') do
    it { should be_installed }
  end

  describe package('docker.io') do
    it { should be_installed }
  end

  describe package('mysql-server') do
    it { should be_installed }
  end

  describe package('vim') do
    it { should be_installed }
  end

  describe package('ufw') do
    it { should be_installed }
  end
end

control 'windows-servicios' do
  impact 1.0
  title 'Verificar servicios instalados en Windows'

  only_if { os.windows? }

  describe powershell('Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer') do
    its('stdout') { should match /Enabled/ }
  end

  describe service('W3SVC') do
    it { should be_installed }
    it { should be_running }
  end

  describe chocolatey_package('git') do
    it { should be_installed }
  end

  describe chocolatey_package('docker-desktop') do
    it { should be_installed }
  end

  describe service('com.docker.service') do
    it { should be_installed }
    it { should be_running }
  end

  describe service('MSSQL$SQLEXPRESS') do
    it { should be_installed }
    it { should be_running }
  end

  describe file('C:\\inetpub\\wwwroot\\index.html') do
    it { should exist }
    its('content') { should match /Bienvenido al servidor IIS/ }
  end
end
