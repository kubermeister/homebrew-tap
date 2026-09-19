# Kubermeister Homebrew tap

Homebrew 7 requires third-party taps to be trusted once before anything from them can be installed:

```sh
brew trust kubermeister/tap
brew install --cask kubermeister/tap/kubermeister
```

The cask is updated automatically by the release workflow in
[kubermeister/kubermeister](https://github.com/kubermeister/kubermeister).
