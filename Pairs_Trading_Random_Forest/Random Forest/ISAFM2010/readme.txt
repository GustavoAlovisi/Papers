The R script for the asset selection is "ISAFM2010-17.r".
It's very naive, but it should be enough to learn our procedure.
We do not guarantee it will always work when changing parameters, so use it the first time with our data ("MSCI_d.txt" and "gdl.txt").

At the beginning of the script you see a section called "SET PARAMETERS".
Each parameter has a little comment, it should be easy to understand.
When running it with our data, you should only set your working directory and do not change anything else.

It will take a rather long time to complete the procedure (about 15-20 minutes).
As you will see, the script produces a lot of files in your working directory.
The main part of them is not important from a practical point of view, because they show the step-by-step computations: they "only" help to fully understand how it works.

The important results are:

- the qqplots: this should be run only the first time (then you can write "No" in the corresponding parameter, qq). It's useful to check whether standardized residuals obey the Student's t distributional assumption (i.e. if data can be considered iid Student's t whith the given degrees of freedom)

- the graphics. In order to understand them, run with our data and see Figure 2 in the paper. Keep present that little differences are possible due to the algorithmic nature of the procedure. We carried out several trials and this did never affect the final set of selected assets.

- the last file: "selection_lower.txt", where the set of selected assets is reported.


The R script for Figures 2 and 3 of the paper is "graficiVIM.r". It uses the files created by the former script.

Of course, contact us for any problem.