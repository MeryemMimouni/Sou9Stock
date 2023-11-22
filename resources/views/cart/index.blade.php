@extends('principal.layouts')
@section('title', 'Sou9Stock')
@section('content')
<br>

<div class="container">
    <!-- 5 cartes de même niveau -->
    <div class="row">
        <div class="col-md-12 card p-3">
            <h4 class="text-dark">Votre panier</h4>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Titre</th>
                        <th>Quantite</th>
                        <th>Prix</th>
                        <th>Totale</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item) 
                        <tr>
                            <td>
                                <img src="{{$item->associatedModel->image}}" alt="{{$item->title}}" width="50" height="50" class="img-fluid rounded">
                            </td>
                            <td>{{$item->name}}</td>
                            <td>
                                <form class="d-flex flex-row justify-content-center align-items-center" action="{{route('update.cart',$item->associatedModel->slug)}}" method="post">
                                    @csrf
                                    @method("PUT")
                                    <div class="form-group">
                                        <input type="number" name="qty" id="qty" value="{{ $item->quantity }}" placeholder="Quantite" max="{{$item->associatedModel->inStock}}" min="1" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </div>
                                </form>
                            </td>
                            <td>{{$item->price}}DH</td>
                            <td> {{$item->price*$item->quantity}}DH</td>
                            <td>
                                <form class="d-flex flex-row justify-content-center align-items-center" action="{{route('remove.cart',$item->associatedModel->slug)}}" method="post">
                                    @csrf
                                    @method("delete")
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                    <tr class="text-dark font-weight-bold">
                        <td colspan="3" class="border border-success">
                            Total
                        </td>
                        <td colspan="3" class="border border-success">
                            {{ Cart::getSubtotal() }} DH
                        </td>
                    </tr>
                </tbody>
            </table>
           
        </div>
    </div>
    
 <form action="{{ route('confirm.order') }}" method="post" id="confirm-command-form">
    @csrf
    <button type="submit" class="btn btn-primary ajouter-panier-btn mt-3 commander-btn">Confirmer la commande</button>
</form>
</div>
<br><br><br><br><br><br><br><br><br>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

@endsection
<style>
      
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            background-color: #F1EAFF;
            padding: 20px 0;
        }
    </style>