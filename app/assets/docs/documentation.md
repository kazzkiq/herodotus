# Welcome to Herodotus!

This page will guide you through Herodotus features, but also works as a sample of a documentation generated with Herodotus itself. Feel free to play around.

-----

## Instalation & Usage

In order to install Herodotus you have to follow those steps:

1. Run `git clone https://github.com/kazzkiq/herodotus.git`
2. Inside your cloned repo, run `npm i -g brunch && npm i`
3. Add your documentation to `documentation.md`
4. Run `npm run start`

From now on, you will be able to access your documentation from `http://localhost:3333` with auto-reloading if any change is detected.

## Production code

If you want to generate production code, simply run: `npm run build`. Now all the files in `/public` folder can be sent to your remote server.

## About AJAX calls

Herodotus loads the documentation via AJAX calls. If your server blocks AJAX requests, it may be possible that the documentation will have trouble to be shown. If your content isn't showing up, check your network tab in console to see if it isn't a server issue.

# Writing Docs

Herodotus uses [marked](https://github.com/chjj/marked) library for Markdown parsing and thus supports Github's flavored markdown. This means that ~~almost~~ everything that works on Github's `.md` files will also work here. You're also free to add any valid HTML markup inside your documentation file and Herodotus will also parse it accordingly.

## Configuration files

Its important to understand files in Herodotus. This way you can easily adapt the documentation to your needs, from theming (which we will be talking later on) to further deep components behavior.

### Files you may want to edit:
- `/app/assets/img/favicon-16.png` - Browser's favicon
- `/app/assets/img/favicon-32.png` - Browser's favicon for retina screens
- `/app/assets/img/logo.svg` - Documentation logo
- `/app/assets/img/og.png` - Image shown in Social Medias when your URL gets linked
- `/app/assets/index.html` - Make sure to edit documentation `<title>` and `og` metatags

## Where do I write

There is only **one** entry point for your documentation, and its called `documentation.md`. It is located at:

```
/app/assets/documentation.md
```

Everything you write inside this file will be sent to your documentation and may also affect your documentation navigation (that is generated from `<h1>` and `<h2>` tags in your `documentation.md` file).

For now there isn't a option for multiple `.md` files. This may be added in the future.

## Where to put images

Any media added in your documentation should go into the path:

```
/app/assets/
```

You're free to create folders at will. Anything created inside `assets/` will be sent to `public/` folder after the build runs.

To link images to your documentation you can use Markdown or HTML syntax:

```
![My Image Title Here](image.jpg)

or

<img src="image.jpg" alt="My Image Title Here">
```

# Theming

Style and structure changes should feel painless in Herodotus. With a ridiculously simple source-code and easy to understand stylesheets users should be able to make changes as small as changing colors to as big as modifying or adding new components to the documentation.

Herodotus uses Riot.js for componentization. If you're not familiarized with this library syntax, you could read more [about it here](http://riotjs.com/).

## Documentation colors

All colors used in Herodotus are by default derivated from `_variables.scss` file. There are basically five main colors:

- `$color-fonts` - Default color for fonts
- `$color-neutral` - Darker neutral color
- `$color-lightneutral` - Lighter neutral color (used in backgrounds)
- `$color-primary` - Main theme color (purple in this page)
- `$color-secondary` - Second theme color (blue in this page)

By editing those variables you can generate a whole new look to your documentation.

## Fonts & Font-family

By default Herodotus uses **Noto Sans** for documentation and **Inconsolata** for code snippets, but you can easily change that my importing your desired font and by changing the variables `$app-font` and `$app-font-mono` in `_variables.scss`.

## Components

By default, Herodotus only needs three build-in components in order to work, they are located at `/app/components` folder. Lets learn what each one does.

The `.tag` extension is a convention from Riot.js, those files are basically HTML snippets, which means that you could simply config your code editor to highlight them as HTML files.

### MainComp

`/src/components/MainComp.tag`

This is the root component. It is responsible for loading other components, fetching the `documentation.md` file and mounting it to the page.

### MenuComp

`/src/components/MenuComp.tag`

This is the component responsible for navigation. It generates the navigation links from MainComp information (after fetching the documentation) and is also responsible for listening scroll events to trigger "active" states to menu items based on scroll position.

This component is also responsible for the mobile off-canvas menu and its actions.

### TopbarComp

`/src/components/TopbarComp.tag`

This component is responsible for the actions of changing font sizes and by providing an optional "outside" link to a Github Page, or Website.

## Creating a new Component

In order to add a new custom component to your documentation you should follow this convention:

1. Create a component file at `/app/components/{NAME}Comp.tag`;
2. Create a SCSS file at `/app/styles/components/{NAME}Comp.scss`;
3. Insert this component inside `MainComp` component;
4. Import this component at `/app/initialize.js`.