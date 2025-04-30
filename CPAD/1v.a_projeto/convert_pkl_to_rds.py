import os
import pickle
import pandas as pd
import pyreadr
import numpy as np

# Função para carregar o arquivo .pkl
def load_pkl(file_path):
    with open(file_path, 'rb') as f:
        data = pickle.load(f)
    return data

import pandas as pd
import numpy as np

def try_parse_list(val):
    if isinstance(val, str) and val.strip().startswith('[') and val.strip().endswith(']'):
        try:
            val = val.strip('[]')
            return [float(x) for x in val.split()]
        except Exception:
            return val
    return val

def expand_lists(df):
    new_cols = {}
    for col in df.columns:
        if isinstance(df[col].iloc[0], list):  # Verifica se é lista
            list_len = len(df[col].iloc[0])
            for i in range(list_len):
                new_col_name = f"{col}_{i+1}"
                new_cols[new_col_name] = df[col].apply(lambda x: x[i] if isinstance(x, list) and len(x) > i else np.nan)
        else:
            new_cols[col] = df[col]
    return pd.DataFrame(new_cols)

def convert_numpy_array(val):
    if isinstance(val, np.ndarray):
        return val.tolist()  # Converte numpy array para lista normal
    return val

def prepare_data(data):
    if not isinstance(data, pd.DataFrame):
        data = pd.DataFrame(data)

    for col in data.columns:
        data[col] = data[col].apply(convert_numpy_array)
        
        if data[col].dtype == 'object':
            data[col] = data[col].apply(try_parse_list)

    data = expand_lists(data)

    for col in data.columns:
        if np.issubdtype(data[col].dtype, np.number):
            # Só arredonda, sem limitar
            data[col] = np.round(data[col], 8)
    
    return data





# Função para salvar dados como RDS
def save_rds(data, output_path):
    pyreadr.write_rds(output_path, data)

# Caminhos
input_pkl_dir = '/Users/lucasaraujo/Projects/R_Projects/CPAD/1v.a_projeto/pkl_datasets/'
output_rds_dir = '/Users/lucasaraujo/Projects/R_Projects/CPAD/1v.a_projeto/pkl_datasets/'

# Listar arquivos .pkl
pkl_files = [f for f in os.listdir(input_pkl_dir) if f.endswith('.pkl')]

# Processar cada arquivo .pkl
for pkl_file in pkl_files:
    input_pkl_path = os.path.join(input_pkl_dir, pkl_file)
    
    data = load_pkl(input_pkl_path)
    
    data_prepared = prepare_data(data)  # <= Prepara antes de salvar
    
    output_rds_path = os.path.join(output_rds_dir, f"{os.path.splitext(pkl_file)[0]}.rds")
    
    save_rds(data_prepared, output_rds_path)
    
    print(f"Arquivo RDS '{output_rds_path}' salvo com sucesso!")

print("Todos os arquivos .pkl foram convertidos para .rds com sucesso!")
