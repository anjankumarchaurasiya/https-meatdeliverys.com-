<!DOCTYPE html>
<html lang="en">

	<head>
		@php
			$company = \App\CompanySetting::first(['name','favicon']);
		@endphp
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="base_url" content="{{ url('/') }}">
		<title> {{$company->name}}  | @yield('title') </title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="{{ url('images/upload/'.$company->favicon) }}">
		
		<!-- Stylesheets -->
		<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link href='{{ asset('frontend/css/unicons.css') }}' rel='stylesheet'>
		<link href='{{ asset('frontend/css/style.css') }}' rel='stylesheet'>
		<link href='{{ asset('frontend/css/responsive.css') }}' rel='stylesheet'>
		<link href='{{ asset('frontend/css/night-mode.css') }}' rel='stylesheet'>
		<link href='{{ asset('frontend/css/step-wizard.css') }}' rel='stylesheet'>
		
		<!-- Vendor Stylesheets -->
		<link href="{{ asset('frontend/css/all.min.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/owl.carousel.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/owl.theme.default.min.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/bootstrap.min.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/semantic.min.css') }}" rel="stylesheet">
		<!-- select2 -->
      <link href="{{ asset('frontend/css/select2.min.css') }}" rel="stylesheet">
      <!-- toaster -->
      <link href="{{ asset('frontend/toaster/notific.css') }}" rel="stylesheet">

	</head>
<body>
	@php
		if(Auth::check())
		{
			if(Auth::user()->role != 0)
				Auth::logout();
		}
	@endphp
	<!-- start per-loader -->
	<div class="loader-container">
		<div class="loader-ripple">
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- end per-loader -->

	@include('frontend.layout.header')

	@yield('content')

	@include('frontend.model.cart')
	@include('frontend.model.category')
	
	@include('frontend.layout.footer')

	
	<!-- Javascripts -->
	<script src="{{ asset('frontend/js/jquery-3.3.1.min.js') }}"></script>
	<script src="{{ asset('frontend/js/bootstrap.bundle.min.js') }}"></script>
	<script src="{{ asset('frontend/js/owl.carousel.js') }}"></script>
	<script src="{{ asset('frontend/js/semantic.min.js') }}"></script>
	<script src="{{ asset('frontend/js/jquery.countdown.min.js') }}"></script>
	<script src="{{ asset('frontend/js/product.thumbnail.slider.js') }}"></script>
	<script src="{{ asset('frontend/js/offset_overlay.js') }}"></script>
	<script src="{{ asset('frontend/js/night-mode.js') }}"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	 <?php 
		$key = \App\Setting::find(1)->map_key;
		$paypal_on = \App\PaymentSetting::find(1)->paypal;
		$sendbox = \App\PaymentSetting::find(1)->paypalSendbox;
		$cur = \App\Setting::find(1)->currency;

	?>
   <script type="text/javascript">
      var bewsiteurl = "{{ url('images/upload/'.$company->favicon) }}";
      var commpanyname = "{{$company->name}}";
   </script>
	@if($paypal_on)
		<script src="https://www.paypal.com/sdk/js?client-id={{$sendbox}}&currency={{$cur}}"  data-namespace="paypal_sdk"></script>
	@endif
   <script src="{{ asset('frontend/toaster/notific.js') }}"></script>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
	<script src="https://js.paystack.co/v1/inline.js"></script> 
	<script src="{{ asset('frontend/js/custom.js') }}"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key={{$key}}" async defer></script>
	<script src="{{ asset('frontend/js/frontend.js') }}"></script>
   <script src="{{ asset('frontend/js/select2.min.js') }}"></script>
   
   <script type="text/javascript">
      $(".select2").select2();
   </script>
</body>
</html>