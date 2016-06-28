Northem Dark - Atom Syntax
==========================

## 0.20.0 (2016-05-04)
### Features
#### Language Support
  - Implemented language support for [LaTeX](https://atom.io/packages/language-latex) (@arcticicestudio, [GHI #6][ghi-6])

### [backlog][backlog-language-library-framework-support]
This version completes the backlog item
  - [x] <img src="http://www.latex-project.org/favicon.ico" width=16 height=16/> [LaTeX](https://atom.io/packages/language-latex) (@arcticicestudio, [GHI #6][ghi-6])

## 0.19.0 (2016-04-12)
### Features
#### Language Support
  - Implemented language support for the [React JSX](https://atom.io/packages/react) syntax extension (@Pszek, [GHI #3][ghi-northem-light-atom-syntax-3])

#### Package Support
  - Implemented package support for the <img src="https://avatars3.githubusercontent.com/u/7209979" width=16 height=16/> [minimap-git-diff](https://atom.io/packages/minimap-git-diff) package (@Pszek, [GHI #4][ghi-northem-light-atom-syntax-4])

### [backlog][backlog-language-library-framework-support]
This version completes the backlog items
  - [x] <img src="https://facebook.github.io/react/favicon.ico" width=16 height=16/> [React.js](https://atom.io/packages/react) (@Pszek, [GHI #3][ghi-northem-light-atom-syntax-3])

## 0.18.0 (2016-04-10) - `apm` package reconstruction and reinitialization
The project repository has been reconstructed and reinitialized for a clean migration to [gitflow](http://nvie.com/posts/a-successful-git-branching-model).  
This is only relevant for the git history and does **NOT** impact the source code!

### Maintenance
#### Dependencies
**Development**
<u>Skeletons</u>
  - Migrated to [`glacier-git@0.21.0`](https://github.com/arcticicestudio/glacier-git)

## 0.17.0 (2016-03-05)
### Features
#### Language Support
  - Implemented language support for [Java Properties](https://atom.io/packages/language-java). This also includes `.properties` files like `build.properties` for [Apache Ant](http://ant.apache.org) or `ivy.properties` for [Apache Ivy](http://ant.apache.org/ivy) since these files are interpreted as [Java Properties](https://atom.io/packages/language-java).

## 0.16.0 (2016-03-01)
### Improvements
#### Language Support
**HTML** (`language-html`)  
  - [[#3](https://github.com/arcticicestudio/northem-dark-atom-syntax/issues/3)] Improved the readability:
    - Attribute names are now underlined for a better emphasis
    - Attribute values are now colored `light-blue` for a better differentiation between attribute names and values and to differ from normal text

#### Gutter
  - Line numbers in the gutter are now left-aligned

## 0.15.0 (2016-02-15)
### Features
#### Language Support
  - Implemented language support for the [HTML](https://atom.io/packages/language-html) responsive-email preprocessor [MJML](https://atom.io/packages/language-mjml) (@caseymhunt, [GHI #2][ghi-2])

## 0.14.0 (2016-02-04) - Refactoring & Performance
### Refactoring
  - Refactored all package files for performance by removing redundancy and improving nesting (~`10ms`/`11ms` to ~ `9ms`/`8ms` startup time)

### Bug Fixes
  - Fixed all file modes/permissions (linux *umask*)

### Improvements
#### Documentation
  - Edited license file to valid markdown

### Maintenance
#### Dependencies
  - Updated to [`northem@1.0.1`](https://github.com/arcticicestudio/northem)

<u>Specifications</u>
  - Updated to [`arcver@0.8.0`](https://github.com/arcticicestudio/arcver)

**Development**
<u>Skeletons</u>
  - Migrated to [`glacier-git@0.8.0`](https://github.com/arcticicestudio/glacier-git)

## 0.13.0 (2016-01-27)
### Features
#### Language Support
  - Implemented language support for [SQL](https://atom.io/packages/language-sql)

## 0.12.0 (2016-01-24)
### Features
#### Language Support
  - Implemented language support for [C++](https://atom.io/packages/language-c) (@rkhunter, [GHI #2][ghi-northem-light-atom-syntax-2])

## 0.11.0 (2015-10-04)
### Improvements
#### Package Support
  - Added a customized background color for the `markdown-preview` package codeblocks

### Bug Fixes
#### Package Support
  - Fixed a deprecation warning for the outdated `.editor` class

## 0.10.0 (2015-09-24)
### Features
#### Package Support
  - Implemented support for the [color-picker](https://atom.io/packages/color-picker) package

### Improvements
#### Package Support
  - Code elements are now colored `light-blue` in the preview of the [markdown-preview](https://atom.io/packages/markdown-preview) package

#### Documentation
  - Added a list of supported packages and the corresponding version range

### Bug Fixes
#### Package Support
  - Fixed the background color for code blocks of the [markdown-preview](https://atom.io/packages/markdown-preview) package

## 0.9.1 (2015-08-31)
### Bug Fixes
  - Fixed multiple basic color variable names caused a crash on theme loading
  - Fixed misplaced basic color variables caused by the reorded `colors.less` file

## 0.9.0 (2015-08-29)
### Features
#### Language Support
  - Implemented language support for [Generic Config (dotfiles)](https://atom.io/packages/language-generic-config), provides syntax highlighting for all files containing comments and/or non-comments without a particular structure like
      - `.gitignore`
      - `.env`
  - Implemented language support for [git](https://atom.io/packages/language-git), includes
      - Git Commit Messages (`COMMIT_EDITMSG`,`MERGE_MSG`)
      - Git Configuration `.gitconfig`,`.gitmodules`,`.git/config`,`/etc/gitconfig`)
      - Git Rebase Messages
  - Implemented language support for [PropertyList](https://atom.io/packages/language-property-list), includes the formats
      - ASCII (Old-Style)
      - XML

### Improvements
#### Language Support
**Jade** (`language-jade`)  
Better differentiation for `HTML` tags:
  - Control keywords (`if`, `each`, `unless` etc.) now highlighted in `dark-blue` instead of `blue`
  - Embedded JavaScript block- and line indicators (`- var`, `script.` etc.) now highlighted in `dark-blue` instead of `blue`
  - Inline tags and control flows (`#[]`, `#{}`) now highlighted in `dark-blue` instead of `blue`
  - Preprocessor keywords (`block`, `append`, `prepend`, `include` etc.) now highlighted in bolded `dark-blue` instead of `blue`

## 0.8.0 (2015-08-16)
### Features
#### Language Support
  - Implemented language support for [`C`](https://atom.io/packages/language-c)
  - Implemented language support for [`Clojure`](https://atom.io/packages/language-clojure)
  - Implemented language support for [`C#`](https://atom.io/packages/language-csharp) (CS,CSharp)

### Improvements
#### Language Support
**Haskell** (`language-haskell`)
  - Improved highlighting for tags and the `runhaskell`-shebang

## 0.7.0 (2015-08-16)
### Features
#### Language Support
  - Implemented language support for [`D`](https://atom.io/packages/language-d)

## 0.6.0 (2015-08-12)
### Features
#### Language Support
  - Implemented language support for [`GLSL`](https://atom.io/packages/language-glsl)
  - Implemented language support for [R](https://atom.io/packages/language-r)

## 0.5.0 (2015-08-08)
### Features
#### Language Support
  - Implemented language support for [`HAML`](https://atom.io/packages/language-haml)

## 0.4.1 (2015-08-10)
### Bug Fixes
  - Fixed color variable name for Java caused a crash on theme loading (@paulidealiste, [GHI #1][ghi-northem-light-atom-syntax-1])

## 0.4.0 (2015-08-02)
### Features
#### Language Support
  - Implemented language support for [`Java`](https://atom.io/packages/language-java)

## 0.3.0 (2015-06-03)
### Features
#### Language Support
  - Implemented language support for [Haskell](https://atom.io/packages/language-haskell)

### Bug Fixes
#### Documentation
  - Fixed favicon sizes in `README.md`
  - Fixed missing notice for the [`file-icons`](https://atom.io/packages/file-icons) package in [`README.md`](README.md)

## 0.2.0 (2015-05-23)
### Features
#### Language Support
  - Implemented language support for [Julia](https://atom.io/packages/language-julia)
  - Implemented language support for [ShellScript](https://atom.io/packages/language-shellscript)

## 0.1.0 (2016-04-10) - Project Reconstruction

## 0.0.0 (2016-04-10) - Repository Reinitialization

[backlog-language-library-framework-support]: https://github.com/arcticicestudio/northem-light-atom-syntax/issues/5

[ghi-2]: https://github.com/arcticicestudio/northem-dark-atom-syntax/issues/2
[ghi-6]: https://github.com/arcticicestudio/northem-dark-atom-syntax/issues/6

[ghi-northem-atom-syntax-1]: https://github.com/arcticicestudio/northem-atom-syntax/issues/1

[ghi-northem-light-atom-syntax-1]: https://github.com/arcticicestudio/northem-light-atom-syntax/issues/1
[ghi-northem-light-atom-syntax-2]: https://github.com/arcticicestudio/northem-light-atom-syntax/issues/2
[ghi-northem-light-atom-syntax-3]: https://github.com/arcticicestudio/northem-light-atom-syntax/issues/3
[ghi-northem-light-atom-syntax-4]: https://github.com/arcticicestudio/northem-light-atom-syntax/issues/4
