# IT-Spickzettel: LAMP-Stack & Apache

**LAMP** = Linux + Apache + MySQL/MariaDB + PHP. Apache nimmt HTTP(S)-Anfragen entgegen und liefert Dateien aus oder reicht PHP-Anfragen zur Verarbeitung weiter. MariaDB/MySQL speichert die Daten.

## Apache schnell prüfen

| Aufgabe | Debian/Ubuntu | RHEL/AlmaLinux |
|---|---|---|
| Dienststatus | `systemctl status apache2` | `systemctl status httpd` |
| Starten / stoppen | `sudo systemctl start apache2` / `stop apache2` | `sudo systemctl start httpd` / `stop httpd` |
| Neustart | `sudo systemctl restart apache2` | `sudo systemctl restart httpd` |
| Konfiguration neu laden | `sudo systemctl reload apache2` | `sudo systemctl reload httpd` |
| Konfiguration testen | `sudo apache2ctl configtest` | `sudo apachectl configtest` |
| Logs verfolgen | `sudo tail -f /var/log/apache2/error.log` | `sudo journalctl -u httpd -f` |

Nach Konfigurationsänderungen erst den Konfigurationstest ausführen; bei Erfolg reicht meist ein Reload. Apache heißt unter Debian/Ubuntu `apache2`, unter RHEL-basierten Systemen `httpd`.

## Wichtige Pfade

- **Webdateien:** `/var/www/html`
- **Debian/Ubuntu-Konfiguration:** `/etc/apache2/`
  - Sites: `sites-available/`, `sites-enabled/`
  - Module: `mods-available/`, `mods-enabled/`
- **RHEL/AlmaLinux-Konfiguration:** `/etc/httpd/`
  - Zusatzkonfiguration: `/etc/httpd/conf.d/`
- **Logs:** `/var/log/apache2/` oder `/var/log/httpd/`

## Virtual Host – Grundgerüst

```apache
<VirtualHost *:80>
    ServerName beispiel.de
    ServerAlias www.beispiel.de
    DocumentRoot /var/www/beispiel

    <Directory /var/www/beispiel>
        Options -Indexes
        AllowOverride None
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/beispiel-error.log
    CustomLog ${APACHE_LOG_DIR}/beispiel-access.log combined
</VirtualHost>
```

Debian/Ubuntu: Site aktivieren mit `sudo a2ensite beispiel.conf`, danach `sudo apache2ctl configtest` und `sudo systemctl reload apache2`. Auf RHEL-basierten Systemen liegt die Datei üblicherweise in `/etc/httpd/conf.d/`.

## Netzwerk & Firewall

- HTTP: TCP **80**
- HTTPS: TCP **443**
- Nur benötigte Ports freigeben; SSH-Zugriff separat und möglichst eng beschränken.
- MariaDB/MySQL nicht öffentlich erreichbar machen, sofern die Anwendung keinen externen Datenbankzugriff benötigt.

## Fehlersuche

1. **Dienst läuft?** `systemctl status apache2` oder `systemctl status httpd`
2. **Konfiguration gültig?** `apachectl configtest` bzw. `apache2ctl configtest`
3. **Port belegt?** `sudo ss -ltnp`
4. **Logs prüfen:** Apache-Fehlerlog und `journalctl -u apache2` bzw. `journalctl -u httpd`
5. **Zugriff lokal testen:** `curl -I http://localhost`
6. **Bei 403:** Dateirechte und `<Directory>`-Regeln kontrollieren.
7. **Bei 404:** `DocumentRoot`, Dateiname und Virtual-Host-Zuordnung prüfen.
8. **Bei 502/503:** PHP-FPM oder den Backend-Dienst prüfen.

## Sicherheits-Basics

- Betriebssystem und Pakete regelmäßig aktualisieren.
- HTTPS mit gültigem TLS-Zertifikat verwenden.
- Verzeichnisauflistung deaktivieren (`Options -Indexes`); `AllowOverride` nur einschalten, wenn die Anwendung `.htaccess` benötigt.
- PHP-Info-Testdateien wie `phpinfo()` nach dem Test wieder löschen.
- Datenbankkonten mit minimal nötigen Rechten nutzen; SQL-Abfragen in PHP parametrisieren.
- Backups und Wiederherstellung regelmäßig testen.

Apache und PHP-Integration unterscheiden sich je nach Distribution und Setup; PHP-FPM ist eine gängige Möglichkeit, PHP getrennt von Apache auszuführen. [1,2,3]

Read More
[1] Turning on the LAMP: Linux, Apache, MySQL, and PHP — https://www.redhat.com/en/blog/lamp-server
[2] The LAMP Stack & Web Servers: A Complete Guide to ... — https://www.alessioligabue.it/en/blog/lamp-stack-complete-guide
[3] Deploy a LAMP server — https://wiki.almalinux.org/series/LAMP-server.html
