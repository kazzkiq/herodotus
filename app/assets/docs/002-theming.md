# Theming

Style and structure changes should feel painless in Herodotus. With a ridiculously simple source-code and easy to understand stylesheets users should be able to make changes as small as changing colors to as big as modifying or adding new components to the documentation.

Herodotus uses Svelte for componentization. If you're not familiarized with this library syntax, you could read more [about it here](https://svelte.technology/).

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

### Main Component

`/src/components/main.component.svelte`

This is the root component. It is responsible for loading other components, fetching the `documentation.md` file and mounting it to the page.

### Menu Component

`/src/components/menu.component.svelte`

This is the component responsible for navigation. It generates the navigation links from MainComp information (after fetching the documentation) and is also responsible for listening scroll events to trigger "active" states to menu items based on scroll position.

This component is also responsible for the mobile off-canvas menu and its actions.

### Topbar Component

`/src/components/topbar.component.svelte`

This component is responsible for the actions of changing font sizes and by providing an optional "outside" link to a Github Page, or Website.

## Creating a new Component

In order to add a new custom component to your documentation you should follow this convention:

1. Create a component file at `/app/components/{NAME}.component.svelte`;
2. Create a SCSS file at `/app/styles/components/{NAME}.component.scss`;
3. Insert this component inside `main.component.svelte` component;

----

This documentation is still a WIP...