@extends('principal.layouts')

@section('title', 'Sou9Stock')

@section('content')
    <br>

    <div class="container-fluid">
        <div class="row">

           <div class="col-md-3">
            
                <div class="list-group">

                  @foreach($categories as $category)
                        @if ($category->title !== 'Service')
                            <a href="{{ route('category.products', $category->slug) }}" class="list-group-item">
                                {{ $category->title }}
                                @if ($category->products)
                                    ({{ $category->products->count() }})
                                @endif
                            </a>
                        @endif
                    @endforeach
                    <a href="{{ route('principale.service') }}" class="list-group-item list-group-item-active">
                        Service
                    </a>
                </div>
            </div>
            <!-- Contenu principal -->
            <main class="col-md-9">
                <!-- Carousel -->
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <!-- Indicateurs de la diapositive -->
                    <ol class="carousel-indicators">
                        @foreach($products as $key => $product)
                            <li data-target="#carouselExampleControls" data-slide-to="{{ $key }}" class="{{ $key == 0 ? 'active' : '' }}"></li>
                        @endforeach
                    </ol>

                   
                    <div class="carousel-inner">
                        @foreach($products as $key => $product)
                            <div class="carousel-item {{ $key == 0 ? 'active' : '' }}">
                                <img src="{{ asset($product->image) }}" class="d-block w-100" style="max-height: 600px;" alt="{{ $product->title }}">
                              
                            </div>
                        @endforeach
                    </div>

                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </a>
                </div>
            </main>
        </div>

        <br> <br><br><br>

        @foreach ($categories as $category)
            @if ($category->title !== 'Bonocation' && $category->title !== 'Ventes Flash' && $category->title !== 'Service')
                <div class="row">
                    <div class="col-md-12">
                        <h3>{{ $category->title }}</h3>
                    </div>
                </div>
                <div class="row">
                    @foreach ($category->products->shuffle()->take(4) as $product)
                        <div class="col-md-3 mb-4">
                            <div class="card">
                                <img src="{{ asset($product->image) }}?v={{ md5(filemtime(public_path($product->image))) }}" class="card-img-top fixed-image-size" alt="{{ $product->title }}">
                                <div class="card-body">
                                    <h5 class="card-title">{{ $product->title }}</h5>
                                    <p class="card-text">{{ $product->description }}</p>
                                    <p class="text-muted">{{ $product->price }}dh</p>
                                    @if ($product->old_price)
                                        <p class="text-danger"><strike>{{ $product->old_price }}dh</strike></p>
                                    @endif
                                    <a href="{{ route('products.show', $product->slug) }}" class="btn btn-primary">Voir le produit</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif
        @endforeach
    </div>

    <!-- Inclure la bibliothèque Bootstrap JS (optionnel) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

   
    <style>
        .fixed-image-size {
            max-height: 200px; 
            width: 100%;
        }
    </style>



@endsection
