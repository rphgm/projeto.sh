**Script Bash simples para criar estruturas de pastas em uma hierarquia pré-definida num clique.**

USO 1:


https://github.com/user-attachments/assets/566b255d-916a-47f1-beb8-a1873d8f967e



USO 2:


https://github.com/user-attachments/assets/363d8ba7-ec70-4d1e-9ff7-9dfc202bed2a



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
