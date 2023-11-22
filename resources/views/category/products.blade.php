@extends('principal.layouts')
@section('title', 'Sou9Stock')
@section('content')
<br>
 
<h1> {{$category->title}}</h1>


<div class="row">
    @foreach ($products as $product)
        <div class="col-md-3 mb-4">
            <div class="card">
                <img src="{{ asset($product->image) }}" class="card-img-top" alt="{{ $product->title }}">
                <div class="card-body">
                    <h5 class="card-title">{{ $product->title }}</h5>
                    <p class="card-text">{{ $product->description }}</p>
                    <p class="text-muted">{{ $product->price }} DH</p>
                    @if ($product->old_price)
                        <p class="text-danger"><strike>{{ $product->old_price }} DH</strike></p>
                    @endif
                    <a href="{{ route('products.show', $product->slug) }}" class="btn btn-primary">Voir le produit</a>
                </div>
            </div>
        </div>
    @endforeach
</div>
@endsection
