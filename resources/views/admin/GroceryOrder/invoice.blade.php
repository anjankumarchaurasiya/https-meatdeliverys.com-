@extends('admin.master', ['title' => __('Invoice')])

@section('content')
    @include('admin.layout.topHeader', [
        'title' => __('Invoice') ,
        'headerData' => __('Orders') ,
        'url' => 'GroceryOrder' ,
        'class' => 'col-lg-7'
    ]) 
    <div class="container-fluid mt--7">
           
        <div class="row">
            <div class="col">
                <div class="card form-card shadow" id="printarea">
                    <div class="card-header border-0">
                        <div class="row align-items-center">
                            <div class="col-12 text-right" >
                                <a href="{{url('printGroceryInvoice/'.$data->id.$data->order_no)}}"  target="_blank"><button class="btn btn-primary" type="button">{{__("Print")}}</button></a>
                                {{-- <h3 class="mb-0">{{ __('Invoice') }}</h3> --}}
                            </div>
                            {{-- <div class="col-4 text-right">
                                <a href="{{url('Shop/create')}}" class="btn btn-sm btn-primary">{{ __('Add New Shop') }}</a>
                            </div> --}}
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                             <div class="col-4">
                                <h3>{{__("Order Details")}} </h3>
                                <p class="mb-0"><span><b>{{__('Order Date :')}}</b> </span>{{$data->created_at->format('Y-m-d')}}</p>
                                <p class="mb-0"><span><b>{{__('Order Status :')}}</b> </span>{{$data->order_status}}</p>
                                <p class="mb-0"><span><b>{{__('Order Id :')}} </b></span>{{$data->order_no}}</p>
                                <p class="mb-0"><span><b>{{__('Payment Type :')}}</b> </span>{{$data->payment_type}}</p>
                                <p class="mb-0"><span><b>{{__('Payment Status :')}}</b> </span>{{$data->payment_status==0?'Pending' : 'Complete'}}</p>
                                @if($data->payment_token!=null)
                                <p class="mb-0"><span>{{__('Payment ID :')}} </span>{{$data->payment_token}}</p>
                                @endif
                                    
                            </div>
                            <div class="col-4">
                                <h3>{{__("Delivery Address")}} </h3>
                                <p class="mb-0"><b>Address type</b> : {{$deliveryaddress->address_type}}</p>
                                <p class="mb-0"><b>Soc name</b> : {{$deliveryaddress->soc_name}}</p>
                                <p class="mb-0"><b>Street</b> : {{$deliveryaddress->street}}</p>
                                <p class="mb-0"><b>City</b> : {{$deliveryaddress->city}}</p>
                                <p class="mb-0"><b>Zipcode</b> : {{$deliveryaddress->zipcode}}</p>
                                
                            </div>
                            <div class="col-4 text-left">
                                <h3>{{__("User Details")}} </h3>
                                <p class="mb-0"><b>Name</b> : {{$data->customer->name}}</p>
                                <p class="mb-0"><b>Email</b> : {{$data->customer->email}}</p>
                                <p class="mb-0"><b>Phone</b> : {{$data->customer->phone}}</p>
                                <p class="mb-0"><b>Delivery time</b> : 9AM - 1 PM</p>
                                <p class="mb-0"><b>Delivery otp</b> : {{ $data->order_otp }}</p>
                            </div>
                        </div>

                        <div class="item-table table-responsive mt-5">
                            <table class="table align-items-center table-flush">
                                <thead class="thead-light">
                                   
                                    <tr>
                                        <th scope="col">{{ __('#') }}</th>
                                        <th scope="col">{{ __('Product') }}</th>
                                        <th scope="col">{{ __('Item') }}</th>
                                        <th scope="col">{{ __('Quantity') }}</th>
                                        <th scope="col">{{ __('Price') }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $total = 0; ?>
                                    @foreach ($data->orderItem as $item) 
                                    @php 
                                            $item_image = \App\GroceryItem::where('id',$item->item_id)->first();
                                    @endphp                                       
                                        <tr>
                                            <td>{{$loop->iteration}}</td>
                                            <td><img src="{{url('images/upload/'.$item_image->image)}}" alt="{{ $item->itemName }}" class="adapt-img" title="{{ $item->itemName }}" width="89"/></td>
                                            <td>{{ $item->itemName }}</td>
                                            
                                            <td>{{ $item->quantity}}</td>
                                            <td>{{ $currency.$item->price.'.00'}}</td>                                               
                                        </tr> 
                                        <?php $total = $total + $item->price; ?>
                                    @endforeach                                            
                                </tbody>
                            </table>
                            
                        </div>
                        <div class="table-bottom mt-5  mb-5">
                            <div class="row">
                                <div class="col-12 text-right">
                                    <h3><span>{{__('Items Total :')}} </span>{{$currency.$total.'.00'}}</h3>                                      
                                    <h3><span>{{__('Delivery Charge :')}} </span>{{$currency.$data->delivery_charge.'.00'}}</h3>
                                    <h3><span>{{__('Coupon Discount :')}} </span>{{$currency.$data->coupon_price.'.00'}}</h3>
                                    <h3><span>{{__('Total Payment :')}} </span>{{$currency}}{{$total  + $data->delivery_charge - $data->coupon_price}}.00</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>

@endsection