<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Livros</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Cadastro de Livro</h1>
    
    <form method="post" action="{% url 'cadastro_livro' %}">
        {% csrf_token %}
        <label for="titulo">Título do Livro:</label>
        <input type="text" id="titulo" name="titulo" required><br><br>
        
        <label for="autor">Autor:</label>
        <input type="text" id="autor" name="autor" required><br><br>
        
        <label for="categoria">Categoria:</label>
        <input type="text" id="categoria" name="categoria" required><br><br>
        
        <label for="ano">Ano de Publicação:</label>
        <input type="number" id="ano" name="ano" required><br><br>
        
        <label for="editora">Editora:</label>
        <input type="text" id="editora" name="editora" required><br><br>
        
        <label for="ativo">Ativo:</label>
        <input type="checkbox" id="ativo" name="ativo"><br><br>
        
        <button type="submit">Cadastrar Livro</button>
    </form>

    <h2>Lista de Livros</h2>
    <table>
        <thead>
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Categoria</th>
                <th>Ano</th>
                <th>Editora</th>
                <th>Ativo</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            {% for livro in lista_de_livros %}
            <tr>
                <td>{{ livro.titulo }}</td>
                <td>{{ livro.autor }}</td>
                <td>{{ livro.categoria }}</td>
                <td>{{ livro.ano }}</td>
                <td>{{ livro.editora }}</td>
                <td>{{ 'Sim' if livro.ativo else 'Não' }}</td>
                <td>
                    <!-- Links ou botões para ações, como editar ou excluir -->
                    <a href="{% url 'editar_livro' livro.id %}">Editar</a> |
                    <a href="{% url 'excluir_livro' livro.id %}" onclick="return confirm('Tem certeza que deseja excluir este livro?');">Excluir</a>
                </td>
            </tr>
            {% empty %}
            <tr>
                <td colspan="7">Nenhum livro encontrado.</td>
            </tr>
            {% endfor %}
        </tbody>
    </table>
</body>
</html>

