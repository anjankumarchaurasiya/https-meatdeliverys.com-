<?php

namespace App\Http\Controllers;

use App\GroceryOrder;
use App\GroceryOrderChild;
use App\Setting;
use App\GroceryShop;
use Config;
use Auth;
use OneSignal;
use App\Currency;
use App\User;
use App\CompanySetting;
use App\Notification;
use App\NotificationTemplate;
use App\UserAddress;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderStatus;
use App\Location;
use App\Mail\AdminorderList;
use Illuminate\Http\Request;
class GroceryOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() 
    {
        $data = GroceryOrder::with(['customer','deliveryGuy'])->orderBy('id', 'DESC')->paginate(10);
        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;
        $drivers = User::where('role',2)->orderBy('id', 'DESC')->get();
        return view('admin.GroceryOrder.orders',['orders'=>$data,'currency'=>$currency, 'drivers'=>$drivers]);
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
     * @param  \App\GroceryOrder  $groceryOrder
     * @return \Illuminate\Http\Response
     */
    public function show(GroceryOrder $groceryOrder)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\GroceryOrder  $groceryOrder
     * @return \Illuminate\Http\Response
     */
    public function edit(GroceryOrder $groceryOrder)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\GroceryOrder  $groceryOrder
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroceryOrder $groceryOrder)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\GroceryOrder  $groceryOrder
     * @return \Illuminate\Http\Response
     */
    public function destroy(GroceryOrder $groceryOrder)
    {
        //
    }

    public function viewsingleOrder($id){
        $data = GroceryOrder::with(['customer','deliveryGuy','orderItem'])->find($id);

        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;
      
        return view('admin.GroceryOrder.singleOrder',['data'=>$data,'currency'=>$currency]);
    }

    public function orderInvoice($id){
        $data = GroceryOrder::with(['customer','deliveryGuy','orderItem'])->find($id);
        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;
        $deliveryaddress = UserAddress::where('id',$data->address_id)->first();
        return view('admin.GroceryOrder.invoice',['data'=>$data,'currency'=>$currency,'deliveryaddress'=>$deliveryaddress]);
    }

    public function printGroceryInvoice($id){
        $data = GroceryOrder::with(['customer','deliveryGuy','orderItem'])->where('id',$id)->first();
        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;
        $deliveryaddress = UserAddress::where('id',$data->address_id)->first();
        // echo '<pre>';
        // print_r($data);
        //  die();
         // return view('admin.Email.mobile-testing',['details'=>['data'=>$data,'currency'=>$currency,'deliveryaddress'=>$deliveryaddress]]);

         return view('admin.Email.orderlist',['details'=>['data'=>$data,'currency'=>$currency,'deliveryaddress'=>$deliveryaddress]]);
        // return view('admin.GroceryOrder.invoicePrint',['data'=>$data,'currency'=>$currency,'deliveryaddress'=>$deliveryaddress]);
    }

    public function groceryRevenueReport(){
        $currency_code = Setting::where('id',1)->first()->currency;
        $currency = Currency::where('code',$currency_code)->first()->symbol;
        $data = GroceryOrder::with(['customer'])->where([['payment_status',1]])->orderBy('id', 'DESC')->get();
        // $data = GroceryOrder::with(['customer'])->orderBy('id', 'DESC')->get();
        $shops = GroceryShop::where('user_id',Auth::user()->id)->orderBy('id', 'DESC')->get();
        return view('admin.GroceryOrder.revenueReport',['data'=>$data,'currency'=>$currency,'shops'=>$shops]);
    }

    public function accpetOrder($id){
        
        $order = GroceryOrder::findOrFail($id)->update(['order_status'=>'Approved']);
        $msg =array(
            'icon'=>'fas fa-thumbs-up',
            'msg'=>'Order is Accepted Successfully',
            'heading'=>'Success',
            'type' => 'default'
        );

       return redirect()->back()->with('success',$msg);
   }

   
   public function rejectOrder($id) {
       GroceryOrder::findOrFail($id)->update(['order_status'=>'Cancel']);
       $order = GroceryOrder::findOrFail($id);
       $user = User::findOrFail($order->customer_id);
        $notification = Setting::findOrFail(1);
        $shop_name = CompanySetting::where('id',1)->first()->name;
        $message = NotificationTemplate::where('title','Cancel Order')->first()->message_content;
        
        $detail['name'] = $user->name;
        $detail['order_no'] = $order->order_no;
        $detail['shop'] = Location::findOrFail($order->location_id)->name;
        $detail['shop_name'] = $shop_name;
        $data = ["{{name}}","{{order_no}}", "{{shop}}","{{shop_name}}"];
        $message1 = str_replace($data, $detail, $message);
        if($notification->push_notification ==1){
            if($user->enable_notification ==1){
                if($user->device_token!=null){
                    $device_token=$user->device_token;
                    try{
                    OneSignal::sendNotificationToUser(
                        $message1,
                        $device_token,
                        $url = null,
                        $data = null,
                        $buttons = null,
                        $schedule = null
                    );
                    }
                    catch(\Exception $e){
                        
                    }
                }
            }
        }

        $image = NotificationTemplate::where('title','Cancel Order')->first()->image;
        $data1 = array();
        $data1['user_id']= $order->customer_id;
        $data1['order_id']= $order->id;
        $data1['title']= 'Grocery Order Cancled';
        $data1['message']= $message1;
        $data1['image'] = $image;
        $data1['notification_type'] = "Grocery";

        Notification::create($data1);

        $msg =array(
            'icon'=>'fas fa-thumbs-up',
            'msg'=>'Order is Cancel Successfully',
            'heading'=>'Success',
            'type' => 'default'
        );
        return redirect()->back()->with('success',$msg);
    }

    public function changeGroceryOrderStatus(Request $request){
        $order = GroceryOrder::findOrFail($request->id);
        $status = $request->status;
        if($order->payment_status == 0 && $status=="Delivered"){
            return response()->json(['data' =>$order ,'success'=>true  ], 200);
        }
        else{
            GroceryOrder::findOrFail($request->id)->update(['order_status'=>$request->status]);
            $order = GroceryOrder::findOrFail($request->id);
            $user = User::findOrFail($order->customer_id);

            if($status=='Cancel' || $status=='Approved' || $status=='Delivered' || $status =="OrderReady")
            {
                if( $status =='Delivered'){
                    GroceryOrder::find($request->id)->update(['payment_status'=>1]); 
                }
                // return 'gvxd';
                $notification = Setting::findOrFail(1);
                $shop_name = CompanySetting::where('id',1)->first()->name;
                $content = NotificationTemplate::where('title','Order Status')->first()->mail_content;
                $message = NotificationTemplate::where('title','Order Status')->first()->message_content;
                $detail['name'] = $user->name;
                $detail['order_no'] = $order->order_no;
                $detail['shop'] = Location::findOrFail($order->location_id)->name;
                $detail['status'] =$status;
                $detail['shop_name'] = $shop_name;
                if($notification->mail_notification==1){
                    Mail::to($user->email)->send(new OrderStatus($content,$detail));
                }
                if($notification->sms_twilio ==1){
                    $sid = $notification->twilio_account_id;
                    $token = $notification->twilio_auth_token;
                    // $client = new Client($sid, $token);
                    // $data = ["{{name}}", "{{order_no}}", "{{shop}}","{{status}}", "{{shop_name}}"];
                    // $message1 = str_replace($data, $detail, $message);
                    // $client->messages->create(
                    // '+918758164348',
                    //     array(
                    //         'from' => $notification->twilio_phone_number,
                    //         'body' =>  $message1
                    //     )
                    // );
                }
                if($notification->push_notification ==1){
                    if($user->device_token!=null){
                        try{
                            Config::set('onesignal.app_id', env('APP_ID'));
                            Config::set('onesignal.rest_api_key', env('REST_API_KEY'));
                            Config::set('onesignal.user_auth_key', env('USER_AUTH_KEY'));
                            $data = ["{{name}}", "{{order_no}}", "{{shop}}","{{status}}", "{{shop_name}}"];
                            $message1 = str_replace($data, $detail, $message);
                            $device_token = $user->device_token;
                            OneSignal::sendNotificationToUser(
                                $message1,
                                $device_token,
                                $url = null,
                                $data = null,
                                $buttons = null,
                                $schedule = null
                            );
                        } catch(\Exception $e){}
                    }
                }
                $data = ["{{name}}", "{{order_no}}", "{{shop}}","{{status}}", "{{shop_name}}"];
                $message1 = str_replace($data, $detail, $message);
                $image = NotificationTemplate::where('title','Order Status')->first()->image;

                $data1 = array();
                $data1['user_id']= $order->customer_id;
                $data1['order_id']= $order->id;
                $data1['title']= 'Order '.$status;
                $data1['message']= $message1;
                $data1['image'] = $image;
                $data1['notification_type'] = "Grocery";
                Notification::create($data1);
            }
            
            return response()->json(['data' =>$order ,'success'=>true], 200);
        }

    }

    public function changeGroceryOrderDriver(Request $request){
        $order = GroceryOrder::find($request->order_id)->update(['deliveryBoy_id'=>$request->driver_id]);
        return response()->json(['success'=>true ], 200);
    }

}
