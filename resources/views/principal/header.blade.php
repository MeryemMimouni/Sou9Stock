<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- Logo à gauche -->
        <a class="navbar-brand" href="/">
           <h3>SOU9STOCK</h3>
        </a>
        
        <!-- Zone de recherche -->
        
        <form action="{{ route('search') }}" method="GET"   class="form-inline my-2 my-lg-0">
    <div class="input-group mb-3">
        <input type="text" name="query" class="form-control" placeholder="Rechercher...">
        <div class="input-group-append">
            <button class="btn btn-primary" type="submit">Rechercher</button>
        </div>
    </div>
</form>
    

        <!-- Icônes de connexion et de panier -->
        <ul class="navbar-nav ml-auto">
            @auth
                <!-- Si l'utilisateur est connecté -->
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('confirm.order') }}">
                        <i class="bi bi-person-fill"></i> {{ Auth::user()->name }}
                    </a>
                </li>
                <li class="nav-item">
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="nav-link btn btn-link">
                            <i class="bi bi-box-arrow-right"></i> Déconnexion
                        </button>
                    </form>
                </li>
            @else
                <!-- Si l'utilisateur n'est pas connecté -->
                <li class="nav-item">
                    <a class="nav-link" href="register">
                        <i class="bi bi-person-fill"></i> Connexion
                    </a>
                </li>
            @endauth
            <li class="nav-item">
    <a class="nav-link" href="{{ route('cart.index') }}">
        <i class="bi bi-cart3"></i> Panier ({{ \Cart::getTotalQuantity() }})
    </a>
</li>

        </ul>
       
        <!-- Liens "Nouveau" et "Bonocation" séparés par une barre verticale -->
       
        </div>
    </div>
</nav>
