About plumed
============

Home: http://www.plumed.org/

Package license: LGPL-3.0

Feedstock license: [BSD-3-Clause](https://github.com/deepmd-kit-recipes/plumed-feedstock/blob/master/LICENSE.txt)

Summary: Free energy calculations in molecular systems

Development: https://github.com/plumed/plumed2

Documentation: https://www.plumed.org/doc

PLUMED is an open source library for free energy calculations in
molecular systems which works together with some of the most
popular molecular dynamics engines.


Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=6&branchName=master">
            <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/plumed-feedstock?branchName=master">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=6&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/plumed-feedstock?branchName=master&jobName=linux&configuration=linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>linux_ppc64le</td>
              <td>
                <a href="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_build/latest?definitionId=6&branchName=master">
                  <img src="https://dev.azure.com/deepmd-kit-recipes/feedstock-builds/_apis/build/status/plumed-feedstock?branchName=master&jobName=linux&configuration=linux_ppc64le_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-plumed-green.svg)](https://anaconda.org/deepmodeling/plumed) | [![Conda Downloads](https://img.shields.io/conda/dn/deepmodeling/plumed.svg)](https://anaconda.org/deepmodeling/plumed) | [![Conda Version](https://img.shields.io/conda/vn/deepmodeling/plumed.svg)](https://anaconda.org/deepmodeling/plumed) | [![Conda Platforms](https://img.shields.io/conda/pn/deepmodeling/plumed.svg)](https://anaconda.org/deepmodeling/plumed) |

Installing plumed
=================

Installing `plumed` from the `deepmodeling` channel can be achieved by adding `deepmodeling` to your channels with:

```
conda config --add channels deepmodeling
conda config --set channel_priority strict
```

Once the `deepmodeling` channel has been enabled, `plumed` can be installed with `conda`:

```
conda install plumed
```

or with `mamba`:

```
mamba install plumed
```

It is possible to list all of the versions of `plumed` available on your platform with `conda`:

```
conda search plumed --channel deepmodeling
```

or with `mamba`:

```
mamba search plumed --channel deepmodeling
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search plumed --channel deepmodeling

# List packages depending on `plumed`:
mamba repoquery whoneeds plumed --channel deepmodeling

# List dependencies of `plumed`:
mamba repoquery depends plumed --channel deepmodeling
```




Updating plumed-feedstock
=========================

If you would like to improve the plumed recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`deepmodeling` channel, whereupon the built conda packages will be available for
everybody to install and use from the `deepmodeling` channel.
Note that all branches in the deepmd-kit-recipes/plumed-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@GiovanniBussi](https://github.com/GiovanniBussi/)

