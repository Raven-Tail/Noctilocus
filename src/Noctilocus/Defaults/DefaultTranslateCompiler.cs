﻿using Noctilocus.Abstract;
using Noctilocus.Primitives;

namespace Noctilocus.Defaults;

/// <summary>
/// A default implementation of the <see cref="TranslateCompiler"/> class that basically does nothing.
/// </summary>
public sealed class DefaultTranslateCompiler : TranslateCompiler
{
    /// <summary>
    /// Gets the singleton instance of the <see cref="DefaultTranslateCompiler"/> class.
    /// </summary>
    public static DefaultTranslateCompiler Instance { get; } = new();

    /// <inheritdoc/>
    public override Translations CompileTranslations(Translations translations, string lang)
    {
        return translations;
    }
}
