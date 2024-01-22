# Translate

Translation is an important part of games, since your game can be played by many players from different countries. For this purpose, I wrote the `Translate` package, which provides developers with basic translation functionality.

You may also encounter the term `locale` in the engine, it is identical in meaning and is used to bypass the names for fields and methods already occupied by the package.

## Setting up

You can find the basic parameters for customization in `TranslateConfig.gml`. Next, I will look at what each one is responsible for.

|Macro                                  |Type           |Typical value        |Purpose                                                                                                        |
|---------------------------------------|---------------|---------------------|---------------------------------------------------------------------------------------------------------------|
|`translate_directory`                  |`String`       |`"translate/"`       |Path to the folder where other language folders will be automatically loaded from |
|`translate_language_info`              |`String`       |`"info.json"`        |Path to the file in the language folder where the basic information about the language is stored  |
|`translate_language_main`              |`String`       |`"translate.json"`   |Path to the file in the language folder where the main translations of the language are stored  |
|`translate_language_default`           |`Real`         |`0`                  |ID of the language that will be loaded by default, it is better not to touch this value, and just reload the language, or disable automatic language loading |
|`translate_languages_offical`          |`Array<String>`|`[]`                 |Platforms such as **Android** may not support language autoloading, so it will take all available languages from this array |

## Language package

To create your own language pack you need to create a folder in the path specified in `translate_directory`.

### Naming

I suggest using **Local naming conventions** to name it, as an example you will see the ``en_us`` package with American English translation built into the engine.

The name of the locale is the same as the name of the source file of its definition. The name of this file is specified depending on the language, country, and charset it contains. The name of the locale definition file is specified in the following format: `language[_country][.code_page][@modifier]`

### Structure

The package itself consists of two main files `main` and `info`. The path to them is set in `translate_language_main` and `translate_language_info` respectively.
Both files are a regular JSON file, which has all their advantages and disadvantages.

As an example, a standard structure with normal settings:
```md
- translate
    - en_us
        - info.json
        - translate.json
    - ru_ru
        - info.json
        - translate.json
```

For your work you can use nesting, or other data types returned by trying to get values by key.
For example: 

```json
{
    "Example": {
        "Foo": {
            "A": "That A!",
            "AB": [
                "That A!",
                "That B!"
            ] 
        },
        "Bar": {
            "A": "That other A!"
        }
    }
}
```

```gml
translate_get("Example.Foo.A"); // Return: "That A!"
translate_get("Example.Foo.AB"); // Return: ["That A!", "That B!"]

translate_get("Example.Bar.A"); // Return: "That other A!"
translate_get("Example.Bar.AB"); // Return: "Example.Bar.AB"
```

Just as you may have noticed, if the key is not found in the file, it will return as a result of getting a translation so that you can easily fix this error. I'll talk more about this when we look at the functions.

## Events

### `on_translate_update`

Is called when the language is updated, you can use it to implement dynamic language change in the project.

## Functions

To work and interact with the system, a number of functions are presented.

&nbsp;

### `translate_get(key)`

**Returns:** translated string (`String|Array<String>`)

|Name    |Datatype|Purpose                                                      |
|--------|--------|-------------------------------------------------------------|
|`key`   |String  |The path to a string or array in the translation file, read more in the section about Structure |

**CALL STRICTLY AFTER `translate_load()`**

Returns a string/array of strings, and if for some reason the string could not be retrieved (Language pack is not loaded or it does not have the given path, etc.), it will return `key`. 

&nbsp;

### `translate_get_lang_count()`

**Returns:** number of languages loaded (`Real`)

Shows how many languages have been downloaded. Can be used to select them in the settings. If the value is `0`, then no language has been loaded.

&nbsp;

### `translate_load()`

**Returns:** N/A (`Undefined`)

Loads all languages from the default folder (`translate_directory`) if possible.

Since some platforms do not support the technologies used to automatically load all languages, e.g. **Android**, there is a set of "official" languages that are set in `translate_languages_offical`. It is important to note that if they are NOT there, the engine will not notice this and will think they are there.

**It should also be called before all other functions for translation work.**

&nbsp;

### `translate_set_lang(id)`

**Returns:** N/A (`Undefined`)

|Name    |Datatype|Purpose                                                      |
|--------|--------|-------------------------------------------------------------|
|`id`    |Real    |ID of loaded language |

**CALL STRICTLY AFTER `translate_load()`**

Sets up and loads all information and translations from the new language, or when loading an already loaded language, will update it in the engine if there are changes in the file.

Also calls the `on_translate_update` event
