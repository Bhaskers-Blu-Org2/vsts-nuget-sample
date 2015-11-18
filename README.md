# Package Management Sample

This is a sample repo that demonstrates a simple bootstrap flow for initializing a dev environment with `nuget.exe` and the AuthHelper. 

## To play around with it
From a command prompt, run the following:

```winbatch
git clone https://github.com/Microsoft/vsts-nuget-sample.git
cd vsts-nuget-sample
init
```

## A bit about init
The purpose of `init` is pretty straightforward. It will:
* Download the NuGet toolset from a public endpoint in your account. This only occurs if the tools aren't present or are out-of-date.
* Run the AuthHelper to provision credentials for VSO sources listed in the repo's `nuget.config`. AuthHelper uses ADAL to obtain personal access tokens non-interactively. The access tokens are stored in the user's machine-wide `nuget.config`.
* (Optionally) Restore tools packages using NuGet. There's a `packages.config` file under `.nuget\tools` which can be populated with a list of all tools to be restored during `init`.

The bootstrap flow described above is made possible by a [set of scripts](https://github.com/Microsoft/vsts-nuget-bootstrapper). If you're interested in using this flow in your codebase, you can leverage this package to install the bootstrap scripts. [Get started with that documentation](https://www.visualstudio.com/get-started/package/use/bootstrap-nuget).
