Radiant Globalize2-Paperclipped Extension
===

About
---

An extension by [Aissac][aissac] that helps translating [Radiant Paperclipped][pc] Assets using [Radiant Globalize2 Extension][arg2].

Tested on Radiant 0.8.

Features
---

* Provides the ability to translate Paperclipped assets (title and caption) using the Radiant admin interface.
* Altered Paperclipped Radius Tags which take into account the locale

Installation
---

Globalize2-Paperclipped Extension has two dependencies:

The [Paperclipped Extension][pc]:

    git submodule add git clone git://github.com/kbingman/paperclipped.git vendor/extensions/paperclipped

And the [Radiant Globalize2 Extension][arg2]

    git submodule add git://github.com/Aissac/radiant-globalize2.git vendor/extensions/globalize2

Run the rake tasks, first for Paperclipped, then for Globalize 2:
  
    rake radiant:extensions:paperclipped:migrate
    rake radiant:extensions:paperclipped:update
  
    rake radiant:extensions:globalize2:migrate
    rake radiant:extensions:globalize2:update

Install the Radiant Globalize2-Paperclipped Extension

    git submodule add git://github.com/Aissac/radiant-globalize2-paperclipped.git vendor/extensions/globalize2_paperclipped
    
And run the rake tasks:

    rake radiant:extensions:globalize2_paperclipped:migrate
    rake radiant:extensions:globalize2_paperclipped:update
    
Configuration
---

For installation and configuration of [Paperclipped][pc] and [Globalize2][arg2] Extensions read their release notes.

Being based on these two extensions Globalize2-Paperclipped needs to be loaded after both of them.

    config.extensions = [ :paperclipped, :globalize2, :globalize2_paperclipped, :all ]
    
Usage
---

You have the possibility to change the locale either on the assets index page, or on the asset edit page. As for the Globalize2, changing the locale using either options will change the locale for the entire application.

###Available Tags

* See the "available tags" documentation built into the Radiant page admin for more details.
* Use the <r:assets:if_translation_asset /> and <r:assets:unless_translation_asset /> tags to render the asset only if/unless it is translated
* The <r:if_assets /> and <r:unless_assets /> tags render the contained elements only if/unless there are **translated** assets for the current locale.
* The <r:assets:each /> tag cycles through all the **translated** assets attached to the current page. You can force the tag to cycle through all attached assets by setting the `locale` attribute to `false`
    
Compatibility
---

### [Tiny Paper][tp]

The Globalize2-Paperclipped Extension provides compatibility for Globalize2 and Radiant Tiny Paper. You only have to be careful about the extensions load order:

    config.extensions = [ :paperclipped, :globalize2, :tiny_paper, :globalize2_paperclipped, :all ]

TODO
---

Contributors
---

[aissac]:http://aissac.ro
[radiant]:http://radiantcms.org/
[arg2p]:http://blog.aissac.ro/radiant/globalize2-paperclipped-extension/
[pc]:http://github.com/kbingman/paperclipped/
[arg2]:http://blog.aissac.ro/radiant/globalize2-extension/
[tp]:http://github.com/Aissac/radiant-tiny-paper-extension/