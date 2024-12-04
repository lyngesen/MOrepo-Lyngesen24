# Minkowski sum problems 

The Minkowski sum problem (MSP) over $S$ subsets/subproblems can be stated as 
$$\min\{y \mid y \in Y = \oplus_{s \in \{1,\ldots,S\}} Y^s  \}$$
Each subset $Y^s$ contain a set of nondominated vectors with $p$ objectives.
Note, the MSP is multi-objective in nature, since a solution to MSP is the nondominated set $Y_N$
(the nondominated sum), of the Minkowski sum $Y$. 

For source code and further results see this [repository](https://github.com/lyngesen/MSP-generators).

## How to cite

To cite this repository use 

```
@Electronic{MOrepo-Lyngesen24,
  Title = {Minkowski sum problems (MOrepo-Lyngesen24)},
  Author = {M. Lyngesen and L. R. Nielsen},
  Url = {https://github.com/MCDMSociety/MOrepo-Lyngesen24},
  Year = {2024},
  Note = {Instance and result files at MOrepo.}
}
```

To cite the Multi-Objective Optimization Repository use

```
@Electronic{MOrepo,
  Title = {Multi-Objective Optimization Repository (MOrepo)},
  Author = {L. R. Nielsen},
  Url = {https://github.com/MCDMSociety/MOrepo},
  Year = {2017},
}
```


## Test instances

Since an MSP instance is defined by a set of subsets $Y^s$, $s = 1,\ldots,S$, we first have to 
generate subsets.

### Subset instances

Each  subset/subproblem is generated using either method l, u or m:

  - Points generated on the upper (u) part of a sphere resulting in many unsupported points.
  - Points generated between to hyperplanes in the middle (m) of the hypercube, resulting in both 
    supported and unsupported points near to the hull.
  - Points generated on the lower (l) part of a sphere resulting in many supported points.

In total 600 subset instances was generated. A subset instance is named `Lyngesen24-sp-<p>-<subset
size>-<method>_<id>.json` and stored in the `sp` folder. The json file is structured like
e.g. ´Lyngesen24-sp-2-10-m_1.json`:

```
{
  "points": [
    {
      "z1": 1813,
      "z2": 8622,
      "cls": "us"
    },
    {
      "z1": 5997,
      "z2": 3449,
      "cls": "us"
    },

    ...

    {
      "z1": 9922,
      "z2": 1059,
      "cls": "se"
    },
    {
      "z1": 3078,
      "z2": 7170,
      "cls": "us"
    }
  ],
  "statistics": {
    "p": [2],
    "card": [10],
    "supported": [4],
    "extreme": [4],
    "unsupported": [6],
    "min": [1599, 1059],
    "max": [9922, 8734],
    "width": [8323, 7675],
    "method": ["m"]
  }
}
```

The `cls` entry contains strings `us` (unsupported), `se` (supported extreme) and `sne` (supported
non-extreme). We use the R package `gMOIP` to generate subproblems. A subproblem is generated such
that all nondominated points is integer and in the hypercube $[0, 10000]^p$. Ten instances were
generated for each $p=2,\ldots, 5$, subset size 10, 50, 100, 200, 300 and method u, l and m. For 
further details see this [report](https://mcdmsociety.github.io/MOrepo-Lyngesen24/msp-gen.html). 


### MSP instances

An MSP instances is defined by a set of subsets $Y^s$, $s = 1,\ldots,S$. Instances are named 

`Lyngesen24-msp-<objectives>-<subset 1 size>|...|<subset S size>-<subset 1 gen method>...<subset S gen method>-S_<id>.json`. 

The json file is structured like e.g. ´Lyngesen24-msp-4-200|200|200|200|200-lllll-5_1.json`:

```
[
  {
    "V1": "subproblems/sp-4-200-l_6.json",
    "V2": "subproblems/sp-4-200-l_10.json",
    "V3": "subproblems/sp-4-200-l_3.json",
    "V4": "subproblems/sp-4-200-l_4.json",
    "V5": "subproblems/sp-4-200-l_5.json"
  }
]
```

Five instances for each objective $p=2,\ldots, 5$, number of subsets $S = 2, \ldots 5$, subset size 
50, 100, 200, 300 and method u, l, m and lu are generated, resulting in 1280 MSP instances in 
total. For further details see this [report](https://mcdmsociety.github.io/MOrepo-Lyngesen24/msp-gen.html). 


## Results 

The `results` folder contains subfolders with the non dominated sum (files end with `_Yn`). Under
the `misc` entry the sizes of the generators are included in entry `genSize`. For further details 
see this [report](https://mcdmsociety.github.io/MOrepo-Lyngesen24/results.html). 






