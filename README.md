# Kubermeister Homebrew tap

Homebrew 7 requires third-party taps to be trusted once before anything from them can be installed:

```sh
brew trust kubermeister/tap
brew install --cask kubermeister/tap/kubermeister        # stable
brew install --cask kubermeister/tap/kubermeister@tip    # nightly, separate app
```

The stable cask is updated automatically by the release workflow in
[kubermeister/kubermeister](https://github.com/kubermeister/kubermeister). The tip cask
points at the rolling nightly build and never changes; the app updates itself, or refresh it with
`brew reinstall --cask kubermeister@tip`.
