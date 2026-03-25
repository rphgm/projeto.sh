#!/usr/bin/env bash

# Autor:      Raphael Góes
# Descrição:  Automatizador de estrutura de pastas para projetos com interface Zenity
# Versão:     1.0
# Licença:    MIT

## Checagem de dependência
if ! command -v zenity &>>/dev/null; then
	notify-send "Erro ao rodar $0" "Esse script requer o zenity" 
	exit 1
fi

## Formatação do projeto (diretórios)
 # Caso precise criar um terceiro nível, use "/" para separar os níveis.
 # Lembre de separar as pastas com espaços.
 # Exemplo: pasta1/subpasta1 pasta2/subpasta2
 # 				  fica assim:
 #					
 #								  Nome do	Projeto     
 #					_____________________________				
 #					|_Pasta1					|_pasta2
 #						 |_subpasta1			 |_subpasta2
 #
## Edite a linha abaixo para personalizar sua estrutura de pastas
dirs=(01.Assets/IDs 02.Audios 03.Videos 04.Renders 05.Exports)

## Interface Gráfica e Validações
get_name() {
	while [[ -z $name ]]; do
		if ! name=$(zenity --entry --title="Qual o nome do projeto?"\
		--text="O nome do projeto será usado como a pasta raiz.\nVerifique se o nome já foi usado"\
		--width=400 --height=200); then
			exit 1
		fi
	done
}

get_path() {
	if ! path=$(zenity --title="Onde criar o projeto?" --file-selection --directory); then
		exit 1
	fi
}

# Evita a criação de pastas redundantes (projeto dentro de pasta de mesmo nome)
verif_redund() {
	if [[ "$(basename "$path")" == "$name" ]]; then
		if ! zenity --question --title="Verifique o nome do projeto"\
		 	--text="Você está criando a pasta $name dentro de $path.\nTem certeza que deseja continuar?"; then
			unset name
			get_name; verif_redund
		fi
	fi	
}

## Fluxo Principal de Execução
if [[ -n "$1" && -d "$1" ]]; then 
		path="$1"
		for d in "${dirs[@]}"; do mkdir -p "$path/$d"; done
		exit 0
else
		get_name; get_path; verif_redund
		for d in "${dirs[@]}"; do mkdir -p "$path/$name/$d"; done
		nautilus -w "$path"/"$name" &
		exit 0
fi
