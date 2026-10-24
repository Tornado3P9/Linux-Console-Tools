# Spickzettel: Apache · PHP · Nginx · MySQL

## Apache HTTP Server

| Gesucht | Debian / Ubuntu | RHEL / Rocky / AlmaLinux |
|---|---|---|
| Hauptkonfiguration | `/etc/apache2/apache2.conf` | `/etc/httpd/conf/httpd.conf` |
| Website-/VirtualHost-Konfiguration | `/etc/apache2/sites-available/` und `/etc/apache2/sites-enabled/` | `/etc/httpd/conf.d/` |
| Module | `/etc/apache2/mods-available/`, `mods-enabled/` | `/etc/httpd/conf.modules.d/` |
| Webroot (häufiger Standard) | `/var/www/html/` | `/var/www/html/` |
| Logs | `/var/log/apache2/` | `/var/log/httpd/` |
| Dienst | `apache2` | `httpd` |

Debian/Ubuntu trennt häufig verfügbare und aktivierte Sites; die Site-Datei liegt in `sites-available`, aktiviert wird sie typischerweise mit `a2ensite`. [1]

## Nginx

| Gesucht | Häufige Paketpfade |
|---|---|
| Hauptkonfiguration | `/etc/nginx/nginx.conf` |
| Zusatzkonfiguration / Sites | `/etc/nginx/conf.d/`; auf Debian/Ubuntu oft auch `sites-available/` und `sites-enabled/` |
| Webroot (Beispiele) | `/var/www/html/`, `/usr/share/nginx/html/` |
| Logs | `/var/log/nginx/access.log`, `/var/log/nginx/error.log` |
| Dienst | `nginx` |

Die genaue Ablage kann je nach Paket und Installation abweichen; eine selbst kompilierte Installation nutzt oft `/usr/local/nginx/`. [2,3,4]

## PHP

| Gesucht | Debian / Ubuntu, häufig | RHEL-Familie, häufig |
|---|---|---|
| Hauptdatei `php.ini` | `/etc/php/<Version>/<SAPI>/php.ini` | `/etc/php.ini` |
| Zusatzdateien | `/etc/php/<Version>/<SAPI>/conf.d/` | `/etc/php.d/` |
| PHP-FPM-Konfiguration | `/etc/php/<Version>/fpm/php-fpm.conf` und `pool.d/` | `/etc/php-fpm.conf` und `/etc/php-fpm.d/` |
| Dienst | `php<Version>-fpm` (z. B. `php8.3-fpm`) | `php-fpm` |

`<SAPI>` bezeichnet die Laufzeit, z. B. `cli`, `fpm` oder `apache2`. **CLI und Webserver können unterschiedliche PHP-Konfigurationen laden**: `php --ini` zeigt die CLI-Dateien, nicht zwingend die vom Webdienst verwendeten. PHP-FPM hat außerdem eigene Pool-Konfigurationen. [5,6]

## MySQL / MariaDB

| Gesucht | Häufige Pfade |
|---|---|
| Konfiguration | `/etc/mysql/my.cnf`, `/etc/mysql/mysql.conf.d/` oder `/etc/my.cnf` |
| Datenverzeichnis (oft) | `/var/lib/mysql/` |
| Logs | Häufig im Datenverzeichnis oder im Journal; Pfad hängt von Konfiguration und Paket ab |
| Dienst | `mysql` oder `mysqld`; MariaDB häufig `mariadb` |

MySQL kann Konfiguration aus mehreren Optionsdateien lesen; das tatsächliche Datenverzeichnis und die Log-Orte sind konfigurierbar. **Datenbankdateien nicht direkt bearbeiten oder verschieben.** [7,8,9]

## Schnell prüfen

```bash
# Betriebssystem und installierte Dienste
cat /etc/os-release
systemctl --type=service --state=running | grep -E 'apache2|httpd|nginx|php.*fpm|mysql|mariadb'

# Konfiguration testen
sudo apache2ctl configtest      # Debian/Ubuntu Apache
sudo httpd -t                   # RHEL-Familie Apache
sudo nginx -t
php --ini                       # zeigt PHP-CLI-Konfiguration

# Dienststatus und letzte Meldungen
sudo systemctl status nginx
sudo journalctl -u nginx -n 50 --no-pager
sudo journalctl -u apache2 -n 50 --no-pager
sudo journalctl -u php8.3-fpm -n 50 --no-pager
```

## Praktische Tipps

- **Vor Änderungen:** Datei sichern, z. B. `sudo cp datei.conf datei.conf.bak`.
- **Nach Konfigurationsänderungen:** erst Syntaxtest, dann möglichst `reload` statt `restart`.
- **Logs zuerst ansehen:** meist verraten `error.log` oder `journalctl` direkt die Ursache.
- **PHP-Werte stimmen nicht?** Prüfen, ob die Website PHP-FPM oder `mod_php` nutzt und ob CLI und Web dieselbe PHP-Version verwenden.
- **Bei „Datei nicht gefunden“:** tatsächliche Konfiguration ausgeben lassen, statt Standardpfade vorauszusetzen: `nginx -T`, `apache2ctl -S` bzw. `httpd -S`.
- **MySQL-Datenverzeichnis:** Eigentümerrechte, SELinux-Kontext und Backups beachten; nicht mit `rm`, `mv` oder Editor an Datenbankdateien arbeiten.
- **Version im Pfad ersetzen:** Bei PHP beispielsweise `<Version>` durch die installierte Version ersetzen.

## Apache - aktive Konfiguration checken

Am zuverlässigsten sind **zwei Schritte**: erst Apache zeigen lassen, welche VirtualHosts aktiv sind; dann deren effektive Direktiven und Includes prüfen.

### 1. Aktive VirtualHosts und zuständige Dateien anzeigen

```bash
# Debian/Ubuntu
sudo apache2ctl -S

# RHEL/Rocky/AlmaLinux
sudo httpd -S
```

Die Ausgabe zeigt die VirtualHosts nach Adresse und Port, ihre `ServerName`-Zuordnung und meist auch **Datei und Zeilennummer**. Der erste VirtualHost für eine Adresse/einen Port ist der Standard-Fallback, falls kein Hostname passt. <citation src="1"></citation>

### 2. DocumentRoot und Logs in der Konfiguration suchen

```bash
# Debian/Ubuntu
sudo grep -RInE '^[[:space:]]*(DocumentRoot|ErrorLog|CustomLog|ServerName|ServerAlias|Include|IncludeOptional)\b' \
  /etc/apache2

# RHEL/Rocky/AlmaLinux
sudo grep -RInE '^[[:space:]]*(DocumentRoot|ErrorLog|CustomLog|ServerName|ServerAlias|Include|IncludeOptional)\b' \
  /etc/httpd
```

Achte besonders auf die **VirtualHost-Datei**, die `apache2ctl -S` oder `httpd -S` nennt:

- `DocumentRoot` – Verzeichnis, aus dem dieser VirtualHost Dateien ausliefert.
- `ErrorLog` – Fehlerprotokoll.
- `CustomLog` – Zugriffsprotokoll.
- `ServerName` / `ServerAlias` – welche Hostnamen zum VirtualHost passen.
- `Include` / `IncludeOptional` – weitere Konfigurationsdateien, die Apache einliest.

Die Direktiven können innerhalb eines VirtualHost-Blocks eigene Werte setzen; fehlt dort etwa `ErrorLog`, greifen die allgemeinen Server-Standards. Auf Ubuntu ist der Standard für `DocumentRoot` häufig `/var/www/html`, aber ein VirtualHost kann einen anderen Pfad definieren. <citation src="1"></citation>

### 3. Variablen und Standardwerte auflösen

Ein Log-Eintrag kann zum Beispiel so aussehen:

```apache
ErrorLog ${APACHE_LOG_DIR}/example-error.log
CustomLog ${APACHE_LOG_DIR}/example-access.log combined
```

Unter Debian/Ubuntu ist `APACHE_LOG_DIR` üblicherweise in der Apache-Umgebung gesetzt. Den tatsächlichen Wert kannst du so prüfen:

```bash
sudo grep -RIn 'APACHE_LOG_DIR' /etc/apache2
```

Auch relative Logpfade sind möglich; sie werden relativ zum `ServerRoot` ausgewertet. Bei fehlenden `ErrorLog`- oder `CustomLog`-Direktiven gelten konfigurierte globale Standardwerte. Ubuntu dokumentiert beispielsweise `/var/log/apache2/error.log` und `/var/log/apache2/access.log` als häufige Standards. <citation src="1"></citation>

### 4. Konfiguration prüfen und Logs ansehen

```bash
# Syntax prüfen – je nach Distribution
sudo apache2ctl configtest
sudo httpd -t

# Logs live verfolgen – Pfade gegebenenfalls anpassen
sudo tail -F /var/log/apache2/error.log /var/log/apache2/access.log
sudo journalctl -u apache2 -f   # Debian/Ubuntu
sudo journalctl -u httpd -f     # RHEL-Familie
```

**Wichtig:** `grep` zeigt, was in Dateien steht, aber `apache2ctl -S`/`httpd -S` hilft dir zuerst, den passenden VirtualHost für den gewünschten Hostnamen und Port zu bestimmen. Bei mehreren Sites kann der Default-VirtualHost für IP-Aufrufe oder unbekannte Hostnamen eine andere Seite ausliefern als erwartet. <citation src="1"></citation>

Read More
[1] Install and Configure Apache — https://ubuntu.com/tutorials/install-and-configure-apache
[2] Chapter 2. Configuring NGINX | Deploying web servers ... — https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/deploying_web_servers_and_reverse_proxies/setting-up-and-configuring-nginx
[3] Beginner's Guide — https://nginx.org/en/docs/beginners_guide.html
[4] Installing NGINX Open Source — https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/
[5] Configuration - Manual — https://www.php.net/manual/en/install.fpm.configuration.php
[6] PHP Configuration Tips — https://developers.redhat.com/blog/2017/10/25/php-configuration-tips
[7] MySQL 9.7 Reference Manual :: 6.2.2.2 Using Option Files — https://dev.mysql.com/doc/refman/9.5/en/option-files.html
[8] 7.2 The MySQL Data Directory — https://dev.mysql.com/doc/refman/9.6/en/data-directory.html
[9] 9.4. Configuration Examples | Managing Confined Services — https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/managing_confined_services/sect-managing_confined_services-mysql-configuration_examples

