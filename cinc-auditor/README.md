# Ansible Verification Profile

Este perfil de auditoría está diseñado para verificar la correcta instalación y configuración de servicios en sistemas Windows 10 Home y Ubuntu Desktop 22.04, tras la ejecución de un playbook de Ansible.

## Plataformas soportadas

- ✅ Windows 10 Home  
- ✅ Ubuntu Desktop 22.04

## Controles incluidos

- `linux-servicios`: Verifica la instalación y estado de servicios como Nginx, Docker, Git, MySQL, UFW y otros en Linux.
- `windows-servicios`: Comprueba que IIS, Git, Docker Desktop, SQL Server Express y otros servicios estén correctamente instalados y funcionando en Windows.

## Uso

Desde Kali Linux, puedes ejecutar este perfil con Cinc Auditor:

```bash
# Para Linux
cinc-auditor exec . --target ssh://usuario@IP --password 'contraseña'

# Para Windows
cinc-auditor exec . -t 'winrm://usuario:contraseña@IP:puerto'
