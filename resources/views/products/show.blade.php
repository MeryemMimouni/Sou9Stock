@extends('principal.layouts')

@section('title', 'Sou9Stock')

@section('content')
<br><br><br>
<div class="container">
        <!-- 5 cartes de même niveau -->
        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <h3 class="card-header">
                        {{ $product->title }}
                    </h3>

                    <div class="card-img-top">
                        <img src="{{ asset($product->image) }}" alt="{{ $product->title }}" style="width: 100%; height: auto;">
                        <!-- Ajustez la largeur et la hauteur selon vos besoins -->
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">
                            {{ $product->title }}
                        </h5>
                        <p class="text-dark font-weight-bold">
                            {{ $product->category->title }}
                        </p>
                        <p class="d-flex-row justify-content-between align-items-center">
                            <span class="text-muted">
                                {{ $product->price }}dh
                            </span>
                            <span class="text-danger">
                                <strike>
                                    {{ $product->old_price }}dh
                                </strike>
                            </span>
                        </p>
                        <p class="card-text">
                            {{ $product->description }}
                        </p>
                        <p class="font-weight-bold">
                            @if ($product->inStock > 0)
                                <span class="text-success">
                                    Disponible
                                </span>
                            @else
                                <span class="text-danger">
                                    Non Disponible
                                </span>
                            @endif
                        </p>
                    </div>
                </div>
            </div>

        <div class="col-md-4">
            <div class="card bg-light">
                <div class="card-body">
                    <form action="{{ route('add.cart', $product->slug) }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="qty" class="label-input">
                                Quantity:
                            </label>
                            <input type="number" name="qty" id="qty" value="1" placeholder="Quantity" max="{{ $product->inStock }}" min="1" class="form-control">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-block">
                                Add to Cart <i class="fa fa-shopping-cart"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
