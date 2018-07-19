# Welcome to Herodotus!

This page will guide you through Herodotus features, but also works as a sample of a documentation generated with Herodotus itself. Feel free to play around.

-----

## Instalation & Usage

In order to install Herodotus you have to follow those steps:

1. Run `git clone https://github.com/kazzkiq/herodotus.git`
2. Inside your cloned repo, run `npm i -g brunch && npm i`
3. Add your documentation to `app/assets/docs`
4. Run `npm run start`

From now on, you will be able to access your documentation from `http://localhost:3333` with auto-reloading if any change is detected.

Any file with `.md` extension added to `app/assets/docs` folder will be automatically appended to your documentation. Since Herodotus reads those files in alphabetic order, its a good practice to start your file names with the order number they're going to be loaded in. Example:

```
app/assets/docs
  - 000-welcome.md
  - 001-getting-started.md
  - 002-instalation.md
  ...
```

## Production code

If you want to generate production code, simply run: `npm run build`. Now all the files in `/public` folder can be sent to your remote server. **Herodotus generates static docs**, so there is no need to configure your static server to handle routes, path params and alike.

## About AJAX calls

Herodotus loads the documentation via AJAX calls. If your server blocks AJAX requests, it may be possible that the documentation will have trouble to be shown. If your content isn't showing up, check the Network tab in your browser devtools to make sure it isn't a server-side issue.