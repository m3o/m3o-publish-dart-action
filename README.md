# M3O-Dart Publisher

This action do the following necessaty steps in order to publish m3o-dart:

- create new file at `$HOME/.config/dart/pub-credentials.json`
- populate `pub-credentials.json`
- run `dart pub lish --dry-run`
- run `dart pub lish -f`
- delete `pub-credentials.json`

## Inputs

## `pub_credentials`

pub.dev credentials

## Outputs

## `success`

The result of this Action

## Example Usage

```yaml
jobs:
  generate:
    - name: Publish m3o-dart clients
      uses: m3o/m3o-publish-dart-action@main
      with:
        pub_credentials: ${{ secrets.PUB_CREDENTIASL }}  
```
