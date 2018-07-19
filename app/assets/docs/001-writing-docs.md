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

You will always write documentation in `app/assets/docs` folder. Herodotus will read all `.md` files in that folder and will generate a single production file called `documentation.md`. This file will then be called via an AJAX request by the application, and parsed directly into the DOM, generating the documentation and menu links dynamically in the browser.

## Where to put images

Any media added in your documentation should go into the path:

```
/app/assets/
```

You're free to create folders at will. Anything created inside `assets/` will be sent to `public/` folder after the build runs. But it is a good practice to have specific folders for each kind of media. Example:

```
app/assets/img
 - image1.png
 - image2.jpg

app/assets/videos
 - video1.mp4
 - video2.ogg

app/assets/files
 - report1.pdf
 - report2.pdf

...
```

To link images to your documentation you can use Markdown or HTML syntax:

```
![My Image Title Here](image.jpg)

or

<img src="image.jpg" alt="My Image Title Here">
```