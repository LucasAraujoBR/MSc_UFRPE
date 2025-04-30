import os
import pandas as pd

# Caminho da pasta com os arquivos .pkl
pasta = 'pkl_datasets/'

# Percorre todos os arquivos na pasta
for nome_arquivo in os.listdir(pasta):
    if nome_arquivo.endswith('.pkl'):
        caminho_completo = os.path.join(pasta, nome_arquivo)
        
        # Carrega o conteúdo do .pkl
        try:
            data = pd.read_pickle(caminho_completo)
            
            # Converte em DataFrame, se necessário
            if not isinstance(data, pd.DataFrame):
                data = pd.DataFrame(data)
            
            # Salva como .csv
            novo_nome = nome_arquivo.replace('.pkl', '.csv')
            caminho_csv = os.path.join(pasta, novo_nome)
            data.to_csv(caminho_csv, index=False)
            print(f'Convertido: {nome_arquivo} → {novo_nome}')
        
        except Exception as e:
            print(f'Erro ao processar {nome_arquivo}: {e}')
