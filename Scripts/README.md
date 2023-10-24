# Install and Run PRODIGY

## To install PRODIGY locally:

git clone https://github.com/haddocking/prodigy
pip install prodigy/.

## PRODIGY set up:

In the excel file, pdb_paths.xlsx, write the absolute path to all HADDOCK PDB structures that you wish to run through PRODIGY. 

## Running PRODIGY

Run Prodigy python script, run_prodigy.py, in the same directory as the excel file with PDB paths. 

## Output

An CSV file labeled, prodigy_out.csv, will be created containing the the original PDB path and additional columns with the PRODIGY results for each PDB structure. 

Four PRODIGY columns are added. The first two are results at the default temperature of 25C, and the last two columns are run at the temperature of 37C.