# Cookbook recipe-2mk Class
Generate stylized recipes and other cookbook pages with a [custom LaTeX class](/recipe-2mk.cls). I originally made this for a recipe binder, where most are typed in shorthand to fit a single page. You can see a sample recipe I made for [Miso Fish and Mushrooms](/misofish.pdf).
## Organization
It inherits structure from `article` but modifies font and margins. The page is configured in two unqeual columns via `minipage` environments, which should extend onto a second page. *That said, I haven't tested a long recipe with this exact template yet*.

A [template file](/recipe_template.tex) is provided with minipages already configured.
### Title and Subtitle
This class replaces `\maketitle` with `\makerecipetitle[subtitle]` provided you have already defined `\title{myrecipename}`. Adding a subtitle is optional, and the spacing will be fixed if you leave out the `[]` argument. 
### Ingredients Lists
Each list of ingredients (e.g main items and garnishes) sits within its own `ingredients` environment. Retitling is optional: the default `\begin{ingredients}` creates **Ingredients** as a header, while `\begin{ingredients}[Garnishes]` will appear as **Garnishes**. Each list item is either a `\seasoning{}` or an `\ingredient{}{}`, the only difference being formatting:

![Different item styles](/recipevsseasoning.png)
### Header Notes
The header notes environment is optimized for three lines of small text, where you might explain the cooking time, serving size, and possible substitutions. Make sure to put newlines after each internal line break, but not at the end of the section.
### Directions
The `directions` environment works a lot like `ingredients` but uses a default `enumerate` sub-environment from the enumitem package. It also has optional retitling if you use `\begin{directions}[text]`. Steps within the section are each `\item text` blocks.
### Credits
Reference the cookbook or website (or friend!) the recipe came from with `\credits{}{}`. The first entry is italicized, while the second is not: ***Book*, Author**.
## Usage and Other Notes
This began as a personal project and I don't expect it to grow much in users or functionality, so I haven't made it a proper package.

To get started, make sure [recipe_template.tex](/recipe_template.tex),  [recipe-2mk.cls](/recipe-2mk.cls), and a fonts folder containing Source Sans Pro from [fonts-20240805T220951Z-001.zip](/fonts-20240805T220951Z-001.zip) are present in your project directory. Then begin editing the template to make your own recipe.
### Command Autocompletion
If you want code completion for the custom commands, I recommend adding them to your editor's list of macros. For LaTeX Workshop, add the following entries to `latex-workshop.intellisense.command.user`:
```
    makerecipetitle[] : makerecipetitle[${1:subtitle}]
    makrecipetitle    : makerecipetitle
    seasoning         : seasoning{${1:text}}
    ingredient        : ingredient{${1:qty}}{${2:text}}
    credits           : credits{${1:source}}{${2:author}}
```
### Further Development and Licensing
Feel free to use these classes and templates however you wish, and modify them as you see fit. If you notice a bug or would like to request a feature, please send me a message and/or make a pull request.
