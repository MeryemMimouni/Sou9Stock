@extends('principal.layouts')
@section('title', 'Service')
@section('content')

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <div class="bg-danger text-white p-3">
                <h2>Service</h2>
            </div>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <!-- Cartes pour les articles -->
            @foreach($products as $product)
                <div class="col-md-4 mb-4">
                    <div class="card">
                   
                          <img src="{{ asset($product->image) }}" alt="{{ $product->title }}">
                      
                        <div class="card-body">
                            <h5 class="card-title">{{ $product->name }}</h5>
                            <p class="card-text">{{ $product->description }}</p>
                            <p class="card-text">Prix: ${{ $product->price }}</p>
                            <a href="javascript:void(0);" data-article="{{ $product->name }}" data-prix="${{ $product->price }}" class="btn btn-primary ajouter-panier-btn mt-3 commander-btn">Commander</a>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        $(".commander-btn").click(function() {
            var article = $(this).data("article");
            var prix = $(this).data("prix");
            var message = "Bonjour, je souhaite commander " + article + " pour " + prix + ". Pouvez-vous me contacter sur WhatsApp ?";
            var numeroWhatsApp = "+212773982812"; 

            var lienWhatsApp = "https://api.whatsapp.com/send?phone=" + numeroWhatsApp + "&text=" + encodeURIComponent(message);
            window.location.href = lienWhatsApp;
        });
    });
</script>

@endsection
