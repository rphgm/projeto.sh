**Script Bash simples para criar estruturas de pastas em uma hierarquia pré-definida num clique.**

USO 1:

https://github.com/user-attachments/assets/51e9d57d-c6c6-437d-a243-8f8151bb60c2

USO 2:

https://github.com/user-attachments/assets/4c3ff735-de18-4407-b6f8-d1dd9a09ef3f

**Estrutura criada por padrão:**

Nome do Projeto - 
	01.Assets/IDs
	02.Audios
	03.Videos
	04.Renders
	05.Exports

**Como Customizar:**
Edite a linha 26 do script:

- dirs=(Pasta1 Pasta2/Subpasta "Pasta com Espaço")

Use / para criar subpastas.
Use " " (aspas) para nomes com espaços.

**Pré-requisito**
Zenity (Geralmente já vem no Ubuntu/Debian, se não: sudo apt install zenity
