<?php

namespace App\Http\Controllers;

use App\Coupon;
use App\Setting;
use Carbon\Carbon;
use App\Currency;
use App\User;
use DB;
use App\GroceryShop;
use Auth;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
      
       
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
       
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
        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function show(Coupon $coupon)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $data = Coupon::where('code',$id)->first();
        // $shop = Shop::where('user_id',Auth::user()->id)->get();
        $groceryShop = GroceryShop::where('user_id',Auth::user()->id)->get();
        return view('admin.coupon.editCoupon',['data'=>$data,'groceryShop'=>$groceryShop ]);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate( [
            'name' => 'bail|required',
            'shop_id' => 'bail|required',
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
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        Coupon::find($id)->update($data);
        return redirect('Coupon');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        try {
            $delete = Coupon::find($id);
            $delete->delete();
            return 'true';
        } catch (\Exception $e) {
            return response('Data is Connected with other Data', 400);
        }
    }
}
