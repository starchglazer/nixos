# nixos go brrr :fire:

## What in the nix is going on here?

### The foundations

Basically, I just ~~yoinked~~ adapted some cutie's nixos configuration, namely, [@Rexcrazy804]'s [dandelion setup], and made changes of my own according to my needs.

What is that, you may ask, then may I suggest you go stop being a dummy and head to the two links above instead of making me explain things I don't completely understand? Smh :pensive:

### What I've changed

#### Enforced common setup of single user

This specific setup is assuming and restricting the system to be a single user only like most common systems, derived from whatever the host's networking hostname is. For example, the host [inspiron] has a networking hostname of inspiron, so in turn, will have a single user named inspiron.

Why? For convenience, simplicity, and my personal realistic usage. My machines are only used by me, will only used by me, and can only be used by me in the first place.

Besides, defining a separate name just for username outside hostname is unfortunately beyond my capabilities, and I have little care whatever these machines are called. The name inspiron, which is for my first laptop, literally came from Dell itself as one of their product lines that I thought sounded unique, random, and cool; [veradeon], my soon-to-be™ personal computer, is literally just 'vega' + 'radeon' and has a good mix of the three traits I mentioned earlier xdd.

#### Defining 'common'

While it should be the same thing in the eventual evaluation essentially, I made structural decisions to refine the definition and usage of 'common,' or in other terms, 'default.'

As I briefly mentioned earlier, the setup enforces a common system of single-user only. This goes hand in hand with common profiles, where a [common user] will likely have [common profile(s)], e.g, [barebones], [development], and [workstation] that one may want on every host that they may have. I, for one, currently only have non-server machines defined by this flake, so GUIs are a necessity, which in turn, makes those profiles common to all my hosts.

Anyway, point is, host definitions should be cleaner and less boilerplate.

#### Defining profiles, modules/programs, dots

I dislike repeating things if possible, e.g, importing:

> ```nix
> imports = [
>   self.dandelion.modules.vscode
>   self.dandelion.dots.vscode
> ];
> ```

when it could simply be just:

> ```nix
> imports = [
>   self.dandelion.modules.vscode # dots already inside the module
> ];
> ```

to import the module *as well* as the dots config for that module, if any.

## Licensing

All code in this repository is under the GPL3 license
except wherever an explicit licensing is included.

[@Rexcrazy804]: https://github.com/Rexcrazy804
[barebones]: ./modules/profiles/barebones.nix
[common profile(s)]: ./modules/profiles/common.nix
[common user]: ./modules/users/common.nix
[dandelion setup]: https://github.com/Rexcrazy804/Zaphkiel
[development]: ./modules/profiles/development.nix
[dots]: ./dots
[inspiron]: ./modules/host/inspiron.nix
[modules]: ./modules/
[programs]: ./modules/programs/
[profiles]: ./modules/profiles/
[veradeon]: ./modules/host/veradeon.nix
[workstation]: ./modules/profiles/workstation.nix
