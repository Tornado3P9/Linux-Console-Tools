# IT-Spickzettel: NGINX-Server

NGINX wird häufig als Webserver für statische Dateien und als Reverse Proxy vor Anwendungen oder PHP-FPM eingesetzt. Die Konfiguration besteht aus Direktiven in Blöcken wie `http`, `server` und `location`; Direktiven enden mit einem Semikolon. [1]

## Dienst steuern und prüfen

| Aufgabe | Befehl |
|---|---|
| Status ansehen | `sudo systemctl status nginx` |
| Starten / stoppen | `sudo systemctl start nginx` / `sudo systemctl stop nginx` |
| Neustarten | `sudo systemctl restart nginx` |
| Konfiguration testen | `sudo nginx -t` |
| Konfiguration neu laden | `sudo systemctl reload nginx` |
| Logs verfolgen | `sudo tail -f /var/log/nginx/error.log` |

Vor dem Reload immer `sudo nginx -t` ausführen. `nginx -t` prüft Syntax und referenzierte Dateien; ein Reload übernimmt eine gültige Konfiguration, ohne laufende Verbindungen unnötig abzubrechen. [1,2]

## Typische Pfade

- Hauptkonfiguration: `/etc/nginx/nginx.conf`
- Zusätzliche Konfigurationen: `/etc/nginx/conf.d/`
- Sites auf Debian/Ubuntu oft: `/etc/nginx/sites-available/` und `/etc/nginx/sites-enabled/`
- Webdateien häufig: `/var/www/html`
- Logs häufig: `/var/log/nginx/access.log` und `/var/log/nginx/error.log`

Die konkreten Pfade können je nach Distribution und Installation abweichen.

## Einfacher Server-Block

```nginx
server {
    listen 80;
    server_name beispiel.de www.beispiel.de;

    root /var/www/beispiel;
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/beispiel-access.log;
    error_log  /var/log/nginx/beispiel-error.log;
}
```

Ein `server`-Block legt unter anderem Domain und Port fest; `location`-Blöcke bestimmen, wie passende URL-Pfade behandelt werden. [1]

## Reverse Proxy zu einer Anwendung

```nginx
server {
    listen 80;
    server_name app.beispiel.de;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Die Anwendung muss auf `127.0.0.1:3000` erreichbar sein. Bei PHP wird häufig PHP-FPM über `fastcgi_pass` angebunden; Socket oder Port müssen zur installierten PHP-FPM-Konfiguration passen.

## Ports & Fehlersuche

- HTTP: TCP **80**
- HTTPS: TCP **443**
- Lauscht NGINX? `sudo ss -ltnp`
- Lokal testen: `curl -I http://localhost`
- Dienstmeldungen: `sudo journalctl -u nginx -f`
- **403:** Dateirechte, `root` und `location` prüfen.
- **404:** URL-Pfad und Dateipfad unter `root` prüfen.
- **502/504:** Backend oder PHP-FPM erreichbar? `proxy_pass`/`fastcgi_pass` und Logs prüfen.
- **„address already in use“:** Prüfen, welcher Dienst den Port belegt.

## Sicherheits-Basics

- System und NGINX regelmäßig aktualisieren.
- HTTPS mit gültigem Zertifikat einrichten.
- Nur benötigte Ports freigeben; Datenbankports nicht unnötig öffentlich erreichbar machen.
- Dateirechte und Zugriffsregeln eng halten; keine Verzeichnisauflistung aktivieren, wenn sie nicht gebraucht wird.
- Konfiguration testen, Logs überwachen und Backups regelmäßig auf Wiederherstellbarkeit prüfen.

Read More
[1] Beginner's Guide — https://nginx.org/en/docs/beginners_guide.html
[2] Command-line parameters — https://nginx.org/en/docs/switches.html
