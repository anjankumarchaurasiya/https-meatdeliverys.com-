<?php

namespace App\Http\Controllers;

use App\User;
use App\Admin;
use App\UserAddress;
use App\Setting;
use Razorpay\Api\Api;
use App\AdminNotification;
use App\CompanySetting;
use App\NotificationTemplate;
use App\UserGallery;
use App\OwnerSetting;
use App\Currency;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Avatar;
use Auth;
use Zip;
use DB;
use App;
use Redirect;
use Twilio\Rest\Client;
use App\Mail\UserVerification;
use App\Mail\ForgetPassword;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Notification;
use App\Coupon;
use App\GroceryOrder;
use App\GroceryShop;
use App\GroceryOrderChild;
use App\GroceryReview;
use App\GrocerySubCategory;
use App\GroceryItem;
use App\Location;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        //
        $data = User::where('role',0)->orderBy('id', 'DESC')->get();

        return view('mainAdmin.users.users',['users'=>$data]);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('mainAdmin.users.addUser');
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

        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|unique:users',
            'phone' => 'bail|required|numeric',
            // 'dateOfBirth' => 'bail|required',
            'password' => 'bail|required|min:6',
            'password_confirmation' => 'bail|required|same:password|min:6'
        ]);
        $data = $request->all();
        $data['password']=Hash::make($data['password']);
        $data['role']= 0;
        $data['referral_code'] = mt_rand(1000000,9999999);
        $data['otp'] = mt_rand(100000,999999);
        if (isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        else{
            // $image = Avatar::create($request->email)->toBase64();
            // $image = str_replace('data:image/png;base64,', '', $image);
            // $image = str_replace(' ', '+', $image);
            // $imageName = str_random(10).'.'.'png';
            // $destinationPath = public_path('/images/upload');
            // \File::put($destinationPath. '/' . $imageName, base64_decode($image));
            // $data['image']=$imageName;
            $data['image'] = 'user.png';
        }

        $user_verify = Setting::where('id',1)->first()->user_verify;
        if($user_verify==1){
            $data['verify'] = 0;
        }
        else if($user_verify==0){
            $data['verify'] = 1;
        }

        $user = User::create($data);
        if($user->role==1){
            $setting['user_id'] = $user->id;
            OwnerSetting::create($setting);
        }

        return redirect('Customer');

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
        $data = User::findOrFail($id);

        return view('mainAdmin.users.editUser',['data'=>$data]);
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
        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|unique:users,email,' . $id . ',id',
            'phone' => 'bail|required|numeric',
            // 'dateOfBirth' => 'bail|required',
        ]);
        $data = $request->all();

        if (isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }

        User::findOrFail($id)->update($data);
        return redirect('Customer');
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
            $user = User::findOrFail($id);
            if($user->role==0){               
                $Order = GroceryOrder::where('customer_id',$id)->get();
                if(count($Order)>0){
                    foreach ($Order as $value) {                                                
                        $OrderChild = GroceryOrderChild::where('order_id',$value->id)->get();
                        if(count($OrderChild)>0){
                            foreach ($OrderChild as $oc) {
                                $oc->delete();
                            }
                        }                       
                        $value->delete();
                    }
                }
              
                $GroceryReview = GroceryReview::where('customer_id',$id)->get();
                if(count($GroceryReview)>0){
                    foreach ($GroceryReview as $r) {
                        $r->delete();
                    }
                }
                $Notification = Notification::where('user_id',$id)->get();
                if(count($Notification)>0){
                    foreach ($Notification as $n) {
                        $n->delete();
                    }
                }
                $UserAddress = UserAddress::where('user_id',$id)->get();
                if(count($UserAddress)>0){
                    foreach ($UserAddress as $n) {
                        $n->delete();
                    }
                }
                $UserGallery = UserGallery::where('user_id',$id)->get();
                if(count($UserGallery)>0){
                    foreach ($UserGallery as $g) {
                        $g->delete();
                    }
                }                
            }
            if($user->role==2){
              
                $GroceryOrder = GroceryOrder::where('deliveryBoy_id',$id)
                ->whereIn('order_status',['DriverApproved','PickUpGrocery','OutOfDelivery','DriverReach'])
                ->get();
                if(count($GroceryOrder)>0){
                    return response('Data is Connected with other Data', 400);   
                }
            }
            if($user->role==1){
            
                $GroceryItem = GroceryItem::where('user_id',$id)->get();
                if(count($GroceryItem)>0){
                    foreach ($GroceryItem as $value) {
                        $value->delete();
                    }
                }
                $GrocerySubCategory = GrocerySubCategory::where('owner_id',$id)->get();
                if(count($GrocerySubCategory)>0){
                    foreach ($GrocerySubCategory as $value) {
                        $value->delete();
                    }
                }
              
                    
                $GroceryOrder = GroceryOrder::where('owner_id',$id)->get();
                if(count($GroceryOrder)>0){
                    foreach ($GroceryOrder as $value) {
                        $Notification = Notification::where([['order_id',$value->id],['notification_type','Grocery']])->get();
                        if(count($Notification)>0){
                            foreach ($Notification as $n) {
                                $n->delete();
                            }
                        }
                        $GroceryReview = GroceryReview::where('order_id',$value->id)->get();
                        if(count($GroceryReview)>0){
                            foreach ($GroceryReview as $r) {
                                $r->delete();
                            }
                        }
                        $GroceryOrderChild = GroceryOrderChild::where('order_id',$value->id)->get();
                        if(count($GroceryOrderChild)>0){
                            foreach ($GroceryOrderChild as $oc) {
                                $oc->delete();
                            }
                        }                   
                        $value->delete();
                    }
                }

                $gShops = GroceryShop::where('user_id',$id)->get();
                if(count($gShops)>0){
                    foreach ($gShops as $gShop) {                                              
                        $Coupon = Coupon::where([['shop_id',$gShop->id],'use_for'=>'Grocery'])->get();
                        if(count($Coupon)>0){
                            foreach ($Coupon as $value) {
                                $value->delete();
                            }
                        }                                           
                        $gShop->delete();
                    }
                } 
            }
            $user->delete();
            return 'true';
        } catch (\Exception $e) {
            return response('Data is Connected with other Data', 400);
        }
    }

    public function addDeliveryBoy(){
        $location = Location::where('status',0)->get();
        return view('mainAdmin.users.addDriver', compact('location'));
    }

    public function addDriver(Request $request){
        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|unique:users',
            'phone' => 'bail|required|numeric',
            // 'lat' => 'bail|required|numeric',
            // 'lang' => 'bail|required|numeric',
            // 'driver_radius' => 'bail|required',
            'password' => 'bail|required|min:6',
            'password_confirmation' => 'bail|required|same:password|min:6'
        ]);
        $data = $request->all();
        $data['role']=2;
        $data['password']=Hash::make($data['password']);
        $data['driver_available'] = 1;
        $data['driver_radius'] = Setting::find(1)->default_driver_radius;
    //    dd($data);
        if (isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        else{
            // $image = Avatar::create($request->email)->toBase64();
            // $image = str_replace('data:image/png;base64,', '', $image);
            // $image = str_replace(' ', '+', $image);
            // $imageName = str_random(10).'.'.'png';
            // $destinationPath = public_path('/images/upload');
            // \File::put($destinationPath. '/' . $imageName, base64_decode($image));
            $data['image'] = 'user.png';
        }
        $data['otp'] = mt_rand(100000,999999);
        $user_verify = Setting::where('id',1)->first()->user_verify;
        if($user_verify==1){
            $data['verify'] = 0;
        }
        else if($user_verify==0){
            $data['verify'] = 1;
        }
        $user = User::create($data);
        return redirect('deliveryGuys');

    }

    public function editDriver($id){
        $data = User::findOrFail($id);
        $location = Location::where('status',0)->get();
        return view('mainAdmin.users.editDriver',['data'=>$data, 'location' => $location]);
    }

    public function assignRadius(Request $request){
        User::findOrFail($request->driver_id)->update(['driver_radius'=>$request->driver_radius]);
        return back();
    }

    public function updateDriver(Request $request,$id){
        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|unique:users,email,' . $id . ',id',
            'phone' => 'bail|required|numeric',
            'driver_radius' => 'bail|required',
        ]);
        $data = $request->all();

        if (isset($request->image) && $request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }

        User::findOrFail($id)->update($data);
        return redirect('deliveryGuys');
    }


    public function viewUsers(){
        $data = User::where('role',0)->orderBy('id', 'DESC')->get();
        return view('admin.users.users',['users'=>$data]);
    }

    public function shopOwners(){
        $users = User::where('role',1)->orderBy('id', 'DESC')->get();
        return view('mainAdmin.users.owners',['users'=>$users]);
    }

    public function deliveryGuys(){
        $users = User::where('role',2)->orderBy('id', 'DESC')->get();
        return view('mainAdmin.users.deliveryGuys',['users'=>$users]);
    }

   

    public function ownerProfileform(){
        $master = array();
        $master['shops'] = GroceryShop::where('user_id',Auth::user()->id)->get()->count();
        $master['users'] = User::where('role',0)->get()->count();
        // $master['deliveryBoy'] = User::where('role',1)->get();

        return view('admin.ownerProfile',['master'=>$master]);
    }

    public function editOwnerProfile(Request $request){
        $id = Auth::user()->id;
        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|unique:users,email,' . $id . ',id',
        ]);
        $data = $request->all();

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }

        User::findOrFail($id)->update($data);
        return redirect('ownerProfile');
    }
    public function changeOwnerPassword(Request $request){
        $request->validate([
            'old_password' => 'bail|required',
            'password' => 'bail|required|min:6',
            'password_confirmation' => 'bail|required|same:password|min:6'
        ]);

        if (Hash::check($request->old_password, Auth::user()->password)){
            User::findOrFail(Auth::user()->id)->update(['password'=>Hash::make($request->password)]);
            return back();
        }
        else{
            return Redirect::back()->with('error_msg','Current Password is wrong!');
        }
    }

    public function ResetPassword(){
        return view('auth.passwords.reset');
    }

    public function reset_password(Request $request){
        $user = User::where([['email',$request->email],['role',1]])->first();
        $password=rand(100000,999999);
        if($user){
            $content = NotificationTemplate::where('title','Forget Password')->first()->mail_content;
            $detail['name'] = $user->name;
            $detail['password'] = $password;
            $detail['shop_name'] = CompanySetting::where('id',1)->first()->name;
            try{
            Mail::to($user->email)->send(new ForgetPassword($content,$detail));
            } catch (\Exception $e) {
                
            }
            User::findOrFail($user->id)->update(['password'=>Hash::make($password)]);
            return Redirect::back()->with('success_msg','Please check your email new password will send on it.');
        }
        return Redirect::back()->with('error_msg','Invalid Email ID');
    }


    public function driverLogin(Request $request){
        $request->validate([
            'email' => 'bail|required|email',
            'password' => 'bail|required|min:6',
            'provider' => 'bail|required',
            // 'device_token' => 'bail|required'
        ]);

        $data = $request->all();
        
        if($data['provider']=='LOCAL'){
            $userdata = array(
                'email'     => $request->email,
                'password'  => $request->password,
                'role' => 2,
                'status' => 0,
            );
            if(Auth::attempt($userdata)){
                $user = Auth::user();
                if(Auth::user()->verify == 1){
                     User::findOrFail(Auth::user()->id)->update(['device_token'=>$data['device_token']]);
                    $user['token'] = $user->createToken('Gambo')->accessToken;
                    return response()->json(['msg' => null, 'data' => $user,'success'=>true], 200);
                }
                else{
                    return response()->json(['msg' => 'Please Verify Your Phone number.', 'data' => $user,'success'=>false], 200);
                }
            }
            else{
                return response()->json(['msg' => 'Invalid Username or password', 'data' => null,'success'=>false], 400);
            }
        }
    }


    public function driverRegister(Request $request){
        $request->validate([
            'name' => 'bail|required',
            'email' => 'bail|required|email|unique:users',
            'password' => 'bail|required|min:6',
            'lat' => 'bail|required|numeric',
            'lang' => 'bail|required|numeric',
            'password_confirmation' => 'bail|required|same:password|min:6'
        ]);

        $data = $request->all();
        $data['referral_code'] = mt_rand(1000000,9999999);
        $data['password']=Hash::make($data['password']);
        $data['role']=2;
        $data['otp'] = mt_rand(100000,999999);
        $data['driver_available'] = 1;
        $data['image'] = 'user.png';
        $data['driver_radius'] = Setting::find(1)->default_driver_radius;
        $user_verify = Setting::where('id',1)->first()->user_verify;
        if($user_verify==1){
            $data['verify'] = 0;
        }
        else if($user_verify==0){
            $data['verify'] = 1;
        }

        $data1 = User::create($data);
        if($user_verify==1){
            return response()->json(['msg' => 'Register Successfully!', 'data' => $data1,'success'=>true], 200);
        }
        else if($user_verify==0){
            $user = User::findOrFail($data1->id);
            $user['token'] = $user->createToken('Gambo')->accessToken;
            return response()->json(['msg' => 'Register Successfully!', 'data' => $user,'success'=>true], 200);
        }
    }

    public function verifyDriverPhone(Request $request){
        $request->validate([
            'id' => 'bail|required|numeric',
            'code' => 'bail|required',
            'phone' => 'bail|required|numeric|min:6|unique:users',
        ]);

        $user = User::findOrFail($request->id);
        if($user){
            $setting = Setting::where('id',1)->first(['id','twilio_account_id','twilio_auth_token','twilio_phone_number','phone_verify','email_verify']);
            $content = NotificationTemplate::where('title','User Verification')->first()->mail_content;
            $message = NotificationTemplate::where('title','User Verification')->first()->message_content;

            if(strlen($request->phone) == 10){
            $otp = mt_rand(100000,999999);
            $detail['name'] = $user->name;
            $detail['otp'] = $otp;
            $detail['shop_name'] = CompanySetting::where('id',1)->first()->name;
            User::findOrFail($user->id)->update(['otp'=>$otp]);

            if($setting->phone_verify==1){
                $data = ["{{name}}", "{{otp}}", "{{shop_name}}"];
                $message1 = str_replace($data, $detail, $message);

                $sid =$setting->twilio_account_id;
                $token = $setting->twilio_auth_token;
                // $client = new Client($sid, $token);
                // $client->messages->create(
                //     '+91'.$request->phone,
                //     array(
                //         'from' => $setting->twilio_phone_number,
                //         'body' => $message1
                //     )
                // );
            }
            if($setting->email_verify==1){
                try{
                Mail::to($user->email)->send(new UserVerification($content,$detail));
            } catch (\Exception $e) {
                
            }
            }

            return response()->json(['msg' => 'OTP will send in your phone, plz check it!', 'data' => null,'success'=>true], 200);
            }
            else{
                return response()->json(['msg' => 'Enter Valid Phone number!', 'data' => null,'success'=>false], 200);
            }
        }
        else{
            return response()->json(['msg' => 'Invalid User ID.', 'data' => null,'success'=>false], 400);
        }
    }


    public function checkDriverOtp(Request $request){
        $request->validate([
            'id' => 'bail|required|numeric',
            'otp' => 'bail|required|numeric',
            'phone' => 'bail|required|numeric',
            'code' => 'bail|required',
        ]);

        $user = User::where([['id',$request->id],['otp',$request->otp]])->first();
        if($user){
            User::findOrFail($user->id)->update(['verify'=>1,'phone'=>$request->phone,'phone_code'=>$request->code]);
            $user = User::findOrFail($user->id);
            $user['token'] = $user->createToken('Gambo')->accessToken;
            return response()->json(['msg' => null, 'data' => $user,'success'=>true], 200);
        }
        else{
            return response()->json(['msg' => 'Invalid OTP code.', 'data' => null,'success'=>false], 400);
        }
    }

    public function changeAvaliableStatus($status){

        $id = Auth::user()->id;
        $data = User::find($id)->update(['driver_available'=>$status]);
        return response()->json([ 'data' =>null,'success'=>true], 200);
    }


    public function getDeviceToken(Request $request){
        if(Auth::check()){
            $user =  User::findOrFail(Auth::user()->id)->update(['device_token'=>$request->id]);
            return response()->json(['msg' => null ,'data' =>$user, 'success'=>true], 200);
        }
        else{
            return response()->json(['msg' => null ,'data' =>null, 'success'=>false], 200);
        }   
    }

    
    
    public function customerReport(){
        $user = User::where('role',0)->orderBy('id', 'DESC')->get();
        return view('mainAdmin.users.userReport',['users'=>$user]);
    }

    public function saveUserSetting(Request $request){
        $request->validate( [
            'address_id' => 'bail|required',
            'enable_notification' => 'bail|required',
            'enable_location' => 'bail|required',
            'enable_call' => 'bail|required',
        ]);
        $data = $request->all();
        $data['lat'] = UserAddress::findOrFail($request->address_id)->lat;
        $data['lang'] = UserAddress::findOrFail($request->address_id)->lang;
        User::findOrFail(Auth::user()->id)->update($data);

        $user = User::findOrFail(Auth::user()->id);
        return response()->json(['msg' => null, 'data' => $user,'success'=>true], 200);
    }

    // public function userPhotos(){
    //     $data = UserGallery::where('user_id',Auth::user()->id)->orderBy('id', 'DESC')->get();
    //     return response()->json(['msg' => null, 'data' => $data,'success'=>true], 200);
    // }

    public function driverProfile(){
        $data = User::findOrFail(Auth::user()->id);
        return response()->json(['msg' => null, 'data' => $data,'success'=>true], 200);
    }

    public function editDriverProfile(Request $request){
        $request->validate( [
            'name' => 'bail|required',
            'email' => 'bail|required|email',
            'phone' => 'bail|required|numeric|min:10',
        ]);

        $data = $request->all();
        if(isset($request->image))
        {
            $img = $request->image;
            $img = str_replace('data:image/png;base64,', '', $img);
            $img = str_replace(' ', '+', $img);
            $data1 = base64_decode($img);
            $Iname = uniqid();
            $file = public_path('/images/upload/') . $Iname . ".png";
            $success = file_put_contents($file, $data1);
            $data['image']=$Iname . ".png";
        }
        if(isset($request->new_password)){
            $request->validate([
                'confirm_password' => 'bail|required|same:new_password|min:6',
            ]);
            $data['password'] = Hash::make($data['confirm_password']);
        }

        User::findOrFail(Auth::user()->id)->update($data);
        $user = User::findOrFail(Auth::user()->id);
        return response()->json(['msg' => null, 'data' => $user,'success'=>true], 200);
    }

    public function driverSetting(Request $request){
        $request->validate( [
            'enable_notification' => 'bail|required',
            'enable_location' => 'bail|required',
            'enable_call' => 'bail|required',
        ]);
        $data = $request->all();
        User::findOrFail(Auth::user()->id)->update($data);
        $user = User::findOrFail(Auth::user()->id);
        return response()->json(['msg' => null, 'data' => $user,'success'=>true], 200);
    }

    public function changeLanguage($lang){
        App::setLocale($lang);
        session()->put('locale', $lang);
        return redirect()->back();
    }

    public function viewNotifications(Request $request){
        $notification = AdminNotification::where('owner_id',Auth::user()->id)->orderBy('id', 'DESC')->get();
        return view('admin.viewNotification',['data'=>$notification]);
    }

    public function add_notification(){

        try {
            $zip = Zip::open(public_path() . '/notificationModule123.zip');

            $fileList = $zip->listFiles();

            // controller import
            foreach ($fileList as $value) {
                $result = $this->fileExits($value, 'Controllers/');
                if ($result) {
                    $extract = $zip->extract(base_path('app/Http/'), $result);
                }
            }

            // Model import
            foreach ($fileList as $value) {
                $result = $this->fileExits($value, 'app/');
                if ($result) {
                    $extract = $zip->extract(base_path('/'), $result);
                }
            }

            // view import
            foreach ($fileList as $value) {
                $result = $this->fileExits($value, 'views/mainAdmin/notification/');
                if ($result) {
                    $extract = $zip->extract(base_path('resources/'), $result);
                }
            }

            // my route same for api.php
            $routeData = $zip->getFromName('web.php');

            file_put_contents(
                '../Controllers/../routes/web.php',
                $routeData,
                FILE_APPEND
            );

             // my sql dump
             $sqlDump = $zip->getFromName('notification_template.sql');
             DB::unprepared($sqlDump);

            $msg =array(
                'icon'=>'fas fa-thumbs-up',
                'msg'=>'Data is imported successfully!',
                'heading'=>'Success',
                'type' => 'default'
            );

            return redirect()->back()->with('success',$msg);

        } catch (\Exception $e) {
            $msg =array(
                'icon'=>'fas fa-exclamation-triangle',
                'msg'=>'File not found!',
                'heading'=>'Error',
                'type' => 'danger'
            );
            return redirect()->back()->with('error', $msg);
        }

    }

    public function fileExits($fileName, $regx)
    {
        $contains = Str::startsWith($fileName, $regx);
        $after = Str::after($fileName, $regx);
        if ($contains && $after) {
            return $fileName;
        }
        return false;
    }

    public function module(){
        return view('mainAdmin.modules');
    }

    public function addCoupons(){

        $zip = Zip::open(public_path() . '/couponModule.zip');

        $fileList = $zip->listFiles();

        // controller import
        foreach ($fileList as $value) {
            $result = $this->fileExits($value, 'Controllers/');
            if ($result) {
                $extract = $zip->extract(base_path('app/Http/'), $result);
            }
        }

        // view import
        foreach ($fileList as $value) {
            $result = $this->fileExits($value, 'views/admin/coupon/');
            if ($result) {
                $extract = $zip->extract(base_path('resources/'), $result);
            }
        }

        // Model import
        foreach ($fileList as $value) {
            $result = $this->fileExits($value, 'app/');
            if ($result) {
                $extract = $zip->extract(base_path('/'), $result);
            }
        }

        // my route same for api.php
        $routeData = $zip->getFromName('web.php');
        file_put_contents(
            '../Controllers/../routes/web.php',
            $routeData,
            FILE_APPEND
        );

        // my sql dump
        $sqlDump = $zip->getFromName('coupon.sql');
        DB::unprepared($sqlDump);

        return back();
    }

}
