---
title: sFTP Deployment Add-On
linkTitle: sftp
weight: 35
slug: sftp
draft: true
---

Auto-deploy your generated static site via sFTP protocol.

### Configuration

#### via UI

Input your sFTP connection settings via the WP2Static > sFTP menu.

#### via WP-CLI

`wp wp2static sftp options set name value`


|Available option | Example input                     |
| --------------- |:---------------------------------:|
| dir_permissions | 0755                              |
| file_permissions| 0755                              |
| group           | group                             |
| host            | example.com                       |
| owner           | user                              |
| passphrase      | passphrase-for-privateKey         |
| password        | password                          |
| port            | 22                                |
| private_key     | path/to/privatekey                |
| remote_root     | /path/to/root                     |
| username        | username                          |


### Troubleshooting

 - check WP2Static's Logs for any errors
 - check webserver/PHP's error logs on server
 - check sFTP logs on server
 - test your sFTP credentials:
   - via CLI: `sftp user@host` (do this from your webserver to confirm certificates)
   - via GUI with [FileZilla](https://filezilla-project.org)
 - test with a fresh sFTP server:
  - `docker run -p 2222:22 -d atmoz/sftp user:pass:::dir`



