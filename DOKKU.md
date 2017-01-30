## Dokku Ghost Blog

A Dokku Ghost setup for Dokku >= 0.8.x.

Most of this has been stolen from https://github.com/jacobmarshall-etc/dokku-ghost

### Database Setup (optional)

```
dokku mariadb:create ghost-blog
dokku mariadb:link ghost-blog ghost-blog
```

### Storage Setup

You must configure a persistent storage, otherwise every time you restart
the container, you will lose your Ghost apps, uploads and -- if you're not
using a real database -- your SQLite database file as well.

```
mkdir -p /var/lib/dokku/data/storage/ghost-blog/{apps,data,images}
chown -R 32767:32767 /var/lib/dokku/data/storage/ghost-blog
dokku storage:mount ghost-blog /var/lib/dokku/data/storage/ghost-blog/apps:/app/content/apps
dokku storage:mount ghost-blog /var/lib/dokku/data/storage/ghost-blog/data:/app/content/data
dokku storage:mount ghost-blog /var/lib/dokku/data/storage/ghost-blog/images:/app/content/images
dokku ps:rebuild ghost-blog
```

### Node Setup

```
dokku config:set ghost-blog NODE_ENV=production
```

### Website Setup

```
dokku config:set ghost-blog SITE_URL=http://example.com
```

### Email Setup

Remember to set a from address... (regardless of the driver you choose)

```
dokku config:set ghost-blog MAIL_FROM=ghost@example.com
```

**Mailgun**

```
dokku config:set ghost-blog MAIL_DRIVER=mailgun
dokku config:set ghost-blog MAIL_USER=ghost@example.com
dokku config:set ghost-blog MAIL_PASSWORD=(the mailgun password)
```

**SES**

```
dokku config:set ghost-blog MAIL_DRIVER=ses
dokku config:set ghost-blog MAIL_AWS_ACCESS_KEY=(the aws access key)
dokku config:set ghost-blog MAIL_AWS_SECRET_KEY=(the aws secret key)
```

**SES (alternative)**

```
dokku config:set ghost-blog MAIL_DRIVER=ses
dokku config:set ghost-blog MAIL_SERVER=ses.example.com
dokku config:set ghost-blog MAIL_PORT=465
dokku config:set ghost-blog MAIL_USER=ghost@example.com
dokku config:set ghost-blog MAIL_PASSWORD=(the ses email password)
```

**Gmail**

```
dokku config:set ghost-blog MAIL_DRIVER=gmail
dokku config:set ghost-blog MAIL_USER=ghost@gmail.com
dokku config:set ghost-blog MAIL_PASSWORD=(your gmail password)
```
