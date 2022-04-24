<?php

namespace App\Http\Controllers;

use App\Coupon;
use Auth;
use App\GroceryShop;
use App\Shop;
use App\Setting;
use App\Currency;
use App\Location;
use Illuminate\Http\Request;

class GroceryCouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $s = array();
    
        $data = Coupon::where('use_for','Grocery')->orderBy('id', 'DESC')->get();

        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;

        return view('admin.coupon.viewGroceryCoupon',['coupons'=>$data,'currency'=>$currency]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $location = Location::where('status',0)->get();
        return view('admin.coupon.addGroceryCoupon',['location'=>$location]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $request->validate( [
            'name' => 'bail|required',
            'location_id' => 'bail|required',
            'type' => 'bail|required',
            'discount' => 'bail|required',
            'max_use' => 'bail|required',
            'start_date' => 'bail|required',
            'status' => 'bail|required',
        ]);
        $data = $request->all();
        $date = explode(" to ",$request->start_date);
        $data['start_date'] = $date[0];
        $data['end_date'] = $date[1];
        $data['use_for'] = 'Grocery';
        $data['code'] = chr(rand(65,90)).chr(rand(65,90)).chr(rand(65,90)).chr(rand(65,90)).'-'.rand(999,10000);

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }

        Coupon::create($data);
        return redirect('GroceryCoupon');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $data = Coupon::where('code',$id)->first();
        $location = Location::where('status',0)->get();
        return view('admin.coupon.editCoupon',['data'=>$data,'location'=>$location]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate( [
            'name' => 'bail|required',
            'location_id' => 'bail|required',
            'type' => 'bail|required',
            'discount' => 'bail|required',
            'max_use' => 'bail|required',
            'start_date' => 'bail|required',
            'status' => 'bail|required',
        ]);
        $data = $request->all();
        if($request->start_date){
            $date = explode(" to ",$request->start_date);
            $data['start_date'] = $date[0];
            $data['end_date'] = $date[1];
        }

        if ($request->hasFile('image')) {
            $c = Coupon::find($id);
            if(\File::exists(public_path('/images/upload/'. $c->image))){
                \File::delete(public_path('/images/upload/'. $c->image));
            }
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        Coupon::find($id)->update($data);
        return redirect('GroceryCoupon');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        try {
            $delete = Coupon::find($id);
            $delete->delete();
            if(\File::exists(public_path('/images/upload/'. $delete->image))){
                \File::delete(public_path('/images/upload/'. $delete->image));
            }
            return 'true';
        } catch (\Exception $e) {
            return response('Data is Connected with other Data', 400);
        }
    }
}
