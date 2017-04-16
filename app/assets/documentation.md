# Welcome to Herodotus!

This page will guide you through Herodotus features, but also works as a sample of a documentation generated with Herodotus itself. Feel free to play around.

-----

## Instalation

In order to install Herodotus you have to follow those steps:

1. Run `git clone https://github.com/kazzkiq/herodotus.git`
2. Inside your cloned repo, run `npm i -g brunch && npm i`
3. Add your documentation to `documentation.md`
4. Run `brunch watch --server`

From now on, you will be able to access your documentation from `http://localhost:3333` with auto-reloading if any change is detected.

## Production code

If you want to generated production code, simply run: `brunch build`. Now all the files in `/public` folder can be sent to your remote server.

## About AJAX calls

Herodotus loads the documentation via AJAX calls. If your server blocks AJAX requests, it may be possible that the documentation will have trouble to be shown. If your content isn't showing up, check your network tab in console to see if it isn't a server issue.

# Documentation

Herodotus uses [marked](https://github.com/chjj/marked) library for Markdown parsing and thus supports Github's flavored markdown. This means that ~~almost~~ everything that works on Github's `.md` files will also work here. You're also free to add any valid HTML markup inside your documentation file and Herodotus will also parse it accordingly.

## Configuration files

Its important to understand files in Herodotus. This way you can easily adapt the documentation to your needs, from theming (which we will be talking later on) to further deep components behavior.

### Files you may want to edit:
- `/app/assets/img/favicon-16.png` - Browser's favicon
- `/app/assets/img/favicon-32.png` - Browser's favicon for retina screens
- `/app/assets/img/logo.svg` - Documentation logo
- `/app/assets/img/og.png` - Image shown in Social Medias when your URL gets linked
- `/app/assets/index.html` - Make sure to edit documentation Title and `og` metatags

## Where do I write

There is only **one** entry point for your documentation. And it is `documentation.md`. It is located at:

```
/app/assets/documentation.md
```

For now there isn't a option for multiple `.md` files. This may be added in the future.

## Where to put images

Any media added in your documentation should go into the path:

```
/app/assets/
```

You're free to create folders at will. Anything created inside `assets/` will be sent to `public/` folder after the build runs.