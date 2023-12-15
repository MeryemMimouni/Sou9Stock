<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des commandes</title>
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> 
</head>
<body>
    
<div class="container">
    <div class="row justify-content-center">
    <div class="col-md-4">
            @include('layouts.sidebar')
        </div>
        <div class="col-md-8">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Client</th>
                        <th>Produit</th>
                        <th>Qté</th>
                        <th>Prix</th>
                        <th>Total</th>
                        <th>Payé</th>
                        <th>Livré</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($orders as $order)
                        <tr>
                            <td>{{ $order->id }}</td>
                          
                            <td>{{ \App\Models\User::find($order->user_id)->name }}</td>

                            <td>{{ $order->product_name }}</td>
                            <td>{{ $order->qty }}</td>
                            <td>{{ $order->price }} $</td>
                            <td>{{ $order->total }} $</td>
                            <td>
                                @if($order->paid)
                                    <i class="fa fa-check text-success"></i>
                                @else
                                    <i class="fa fa-times text-danger"></i>
                                @endif
                            </td>
                            <td>
                                @if($order->delivered)
                                    <i class="fa fa-check text-success"></i>
                                @else
                                    <i class="fa fa-times text-danger"></i>
                                @endif
                            </td>
                            <td class="d-flex flex-row justify-content-center align-items-center">
                            <form id="updateForm-{{ $order->id }}" method="POST" action="{{ route("orders.update", $order->id )}}">
    @csrf
    @method("PUT")
    <button class="btn btn-sm btn-success">
        <i class="fa fa-check"></i>
    </button>
</form>

<form id="deleteForm-{{ $order->id }}" method="POST" action="{{ route("orders.destroy", $order->id) }}">
    @csrf
    @method("DELETE")
    <button onclick="event.preventDefault();
        if(confirm('Do you really want to delete the order {{ $order->id  }} ?'))
            document.getElementById('deleteForm-{{ $order->id }}').submit();
        " class="btn btn-sm btn-danger">
        <i class="fa fa-trash"></i>
    </button>
</form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <hr>
                        </tr>
                 
                </tbody>
            </table>
            <hr>
            <div class="justify-content-center d-flex">
                {{ $orders->links() }}
            </div>
        </div>
    </div>
</div>
</body>
</html>
