
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <title>Document</title>
</head>
<body>
    
<div class="container">
    <h1>Modifier la visibilité de la catégorie "Ventes Flash"</h1>
    <form method="post" action="{{ route('admin.categories.updateVisibility', $category->id) }}">
        @csrf
        @method('PUT')
        <div class="form-group">
            <label for="visible">Catégorie visible</label>
            <input type="checkbox" name="visible" id="visible" {{ $category->visible ? 'checked' : '' }}>
        </div>
        <button type="submit" class="btn btn-primary">Enregistrer</button>
    </form>
</div>
</body>
</html>
