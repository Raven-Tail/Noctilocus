# Noctilocus

[![Build Action](https://github.com/Raven-Tail/Noctilocus/actions/workflows/build.yaml/badge.svg)](https://github.com/Raven-Tail/Noctilocus/actions/workflows/build.yaml)
[![Publish Action](https://github.com/Raven-Tail/Noctilocus/actions/workflows/publish.yaml/badge.svg)](https://github.com/Raven-Tail/Noctilocus/actions/workflows/publish.yaml)
[![License](https://img.shields.io/github/license/raven-tail/Noctilocus?style=flat)](https://github.com/raven-tail/Noctilocus/blob/main/LICENSE)
[![.NET 8](https://img.shields.io/badge/.NET%208-%23512bd4?style=flat)](https://dotnet.microsoft.com/)
[![.NET 9](https://img.shields.io/badge/.NET%209-%23512bd4?style=flat)](https://dotnet.microsoft.com/)
[![Downloads](https://img.shields.io/nuget/dt/Noctilocus?style=flat)](https://www.nuget.org/packages/Noctilocus.Contracts/)

A C# port of the [ngx-translate](https://github.com/ngx-translate/core). The port is not one to one and also aims to be more C# friendly where possible.

The library provides you with a `TranslateService` which combined with a `TranslateLoader` (HttpLoader built in) enables you to load, compile and display your translations using formatting with keys. For much stronger formatting there exists a supporting package that uses the awesome [SmartFormat](https://github.com/axuno/SmartFormat/) package.

## Packages

| Package | Stable | Pre |
|:--|:--|:--|
| **Noctilocus** | [![Noctilocus](https://img.shields.io/nuget/v/Noctilocus)](https://www.nuget.org/packages/Noctilocus) | [![Noctilocus](https://img.shields.io/nuget/vpre/Noctilocus)](https://www.nuget.org/packages/Noctilocus) |
| **Noctilocus.SmartFormat** | [![Noctilocus.SmartFormat](https://img.shields.io/nuget/v/Noctilocus.SmartFormat)](https://www.nuget.org/packages/Noctilocus.SmartFormat) | [![Noctilocus.SmartFormat](https://img.shields.io/nuget/vpre/Noctilocus.SmartFormat)](https://www.nuget.org/packages/Noctilocus.SmartFormat) |

# Usage

Description
- Noctilocus
    - Contains the `abstractions`, `defaults`, `primitives`, `http loader` and the `service`.
- Noctilocus.SmartFormat
    - Contains the `SmartFormatParser`.

Installation:
- `Noctilocus` in projects that you want to use the service or any of the primitives.
- `Noctilocus.SmartFormat` in projects that use the service and you want to replace the default parser.

# Getting Started

The section will describe how to get started with Noctilocus in a `Blazor Wasm` using the `HttpLoader` storing the language files at `wwwroot/i18n`.

1. Add the `Noctilocus` package.
```console
dotnet add package Noctilocus
```
2. Add the appropriate services to the service provider.
```csharp
services.AddScoped(sp => new HttpClient() { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
services.AddScoped<TranslateLoader, TranslateHttpLoader>(); // This will use the default options
services.AddScoped<TranslateService>(); // This will use the default parser
```
3. Use the service

`TranslateService` also supports a "pipe" syntax to get your translation values.

For the tanslation `key: hello` and `value: Hello` you can do:
```csharp
translate.Instant("hello") // prints "Hello"
translate | "hello" // prints "Hello"
```

For the translation `key: welcome`, `value: Welcome {user}!` and `param: user`.
```csharp
translate.Instant("hello", new { user = "panos" }) // prints "Welcome panos"!
translate | "hello" | new { user = "panos" } // prints "Welcome panos"!
```

# Contributing

For general contribution information you can read the [Raven Tail Contributing document](https://github.com/Raven-Tail/.github/blob/main/CONTRIBUTING.md).

## Local Development

To develop you need:
1. dotnet 9.0 SDK
2. Visual Studio or VS Code with the C# extension.
3. Configured your IDE for the [TUnit](https://thomhurst.github.io/TUnit/) library.
