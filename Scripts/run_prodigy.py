#!/usr/bin/python3

import pandas as pd
import os

experiment_results_df = pd.read_excel("pdb_paths.xlsx")
local_base_path = "./"

for index, row in experiment_results_df.iterrows():
    ## Create full path to best PDB file
    best_pdb_path = row['best_pdb_path'][1:]
    pdb_path = f'{local_base_path}{best_pdb_path}'

    ## Run PRODIGY and parse stdout
    prodigy_output = os.popen(f'~/miniconda3/bin/prodigy {pdb_path}').read()
    prodigy_output_lines = prodigy_output.split('\n')
    predicted_binding_affinity = float(prodigy_output_lines[-3].split(':')[1].replace(' ', ''))
    predicted_dissociation_constant = float(prodigy_output_lines[-2].split(':')[1].replace(' ', ''))

    ## Run PRODIGY at 37C and parse
    prodigy_output_37 = os.popen(f'~/miniconda3/bin/prodigy --temperature 37 {pdb_path}').read()
    prodigy_output_lines_37 = prodigy_output_37.split('\n')
    predicted_binding_affinity_37 = float(prodigy_output_lines_37[-3].split(':')[1].replace(' ', ''))
    predicted_dissociation_constant_37 = float(prodigy_output_lines_37[-2].split(':')[1].replace(' ', ''))

    ## Add values to DataFrame
    experiment_results_df.loc[index, 'prodigy_deltaG_kcalpermol'] = predicted_binding_affinity
    experiment_results_df.loc[index, 'prodigy_dissociation_constant_M'] = predicted_dissociation_constant
    experiment_results_df.loc[index, 'prodigy_deltaG_kcalpermol_37'] = predicted_binding_affinity_37
    experiment_results_df.loc[index, 'prodigy_dissociation_constant_M_37'] = predicted_dissociation_constant_37

experiment_results_df.to_csv('prodigy_out.csv', index=False)