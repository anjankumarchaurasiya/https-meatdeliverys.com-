<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('user')->group(function()
{
    Route::post('/login','UserApiController@login');
    Route::post('/register','UserApiController@register');
    Route::post('/sendotp','UserApiController@sendotp');
    Route::post('/checkotp','UserApiController@checkotp');
    Route::post('/forgetpassword','UserApiController@forgetpassword');
    Route::get('/settings','UserApiController@settings');

    Route::get('/all-locations','UserApiController@location');
    Route::get('/all-category','UserApiController@category');
    Route::get('/banners','UserApiController@banners');
    Route::get('/faq','UserApiController@faq');
    
    Route::post('coupons','UserApiController@coupons');
    Route::post('check-coupon','UserApiController@checkCoupon');
    Route::post('/home','UserApiController@home');    

    Route::group(['middleware' => ['auth:api']], function () {
        Route::get('/view-profile','UserApiController@viewProfile');
        Route::post('/edit-profile','UserApiController@editProfile'); 
        Route::post('/change-image','UserApiController@changeImage');
        Route::post('/change-password','UserApiController@changePassword');
        Route::get('/view-address','UserApiController@allAddress');
        Route::post('/add-address','UserApiController@addAddress');
        Route::post('/edit-address','UserApiController@editAddress');
        Route::get('/delete-address/{id}','UserApiController@deleteAddress');
        Route::get('/view-wishlist','UserApiController@viewWishlist');
        Route::get('/update-wishlist/{id}','UserApiController@updateWishlist');
        Route::get('/notifications','UserApiController@notifications');

        Route::get('/all-orders','UserApiController@orders');
    });
});



Route::group(['middleware' => ['auth:api']], function () {
    // grocery
    Route::post('/user/createGroceryOrder','GroceryController@createGroceryOrder');
    Route::post('/user/addGroceryReview','GroceryController@addGroceryReview');
    Route::get('/user/groceryOrder','GroceryController@groceryOrder');
    Route::get('/user/singleGroceryOrder/{order_id}','GroceryController@singleGroceryOrder' );
    Route::get('/user/trackGroceryOrder/{id}','GroceryController@trackOrder' );   
    Route::get('/user/paytabPayment/{order_id}','GroceryController@paytabPayment' );
    Route::post('/user/deliveredProduct','GroceryController@deliveredProduct' );
    Route::get('/user/viewReview','GroceryReviewController@viewUserReview' ); 
   
    Route::post('/user/saveSetting','CustomerController@saveUserSetting' );
   
    Route::group(['prefix' => 'driver'], function () {
        Route::get('/driverTrip','OrderController@driverTrip' );
        Route::get('/driverReview','GroceryReviewController@driverReview' );       
        Route::get('/driverProfile','CustomerController@driverProfile' );
        Route::get('/changeAvaliableStatus/{status}','CustomerController@changeAvaliableStatus' );
        Route::post('/editDriverProfile','CustomerController@editDriverProfile' );
        Route::post('/driverSetting','CustomerController@driverSetting' );
        Route::post('/earningHistroy','OrderController@earningHistroy' );
        Route::get('/viewnotification','OrderController@viewnotification' );
        Route::post('/saveDriverLocation','OrderController@saveDriverLocation' );
        //  grocery orders
        Route::get('/groceryOrderRequest','GroceryController@groceryOrderRequest' );
        Route::post('/acceptGroceryOrderRequest','GroceryController@acceptGroceryOrderRequest' );
        Route::post('/driverGroceryStatus','GroceryController@driverGroceryStatus' );
        Route::get('/collectGroceryPayment/{id}','GroceryController@collectGroceryPayment' );
        Route::post('/pickupGrocery','GroceryController@pickupGrocery' );
        Route::get('/viewGroceryOrder/{id}','GroceryController@viewGroceryOrderDetail' );        
        Route::post('/driverCancelGroceryOrder','GroceryController@driverCancelGroceryOrder' );
        Route::get('/rejectGroceryOrder/{order_id}','GroceryController@rejectGroceryOrder' );
        Route::post('/earningGroceryHistroy','GroceryController@earningGroceryHistroy' );
        
    });
});
 
// grocery api

Route::get('/user/groceryCategory','GroceryController@groceryCategory' );
Route::get('/user/grocerySubCategory/{category_id}','GroceryController@grocerySubCategory' );
Route::get('/user/groceryShop','GroceryController@groceryShop' );
Route::get('/user/groceryShopDetail/{shop_id}','GroceryController@groceryShopDetail' );
Route::get('/user/groceryItem/{shop_id}','GroceryController@groceryItem' );
Route::get('/user/groceryItemDetail/{item_id}','GroceryController@groceryItemDetail' );
Route::get('/user/groceryShopCategory/{shop_id}','GroceryController@groceryShopCategory' );
Route::get('/user/groceryShop/{category_id}','GroceryController@groceryCategoryShop' );


Route::post('/driver/forgetPassword','CustomerController@forgerUserPassword' );
Route::get('/driver/keySetting','CompanySettingController@keySetting' );
Route::post('/driver/login','CustomerController@driverLogin' );
Route::post('/driver/verifyPhone','CustomerController@verifyDriverPhone' );
Route::post('/driver/register','CustomerController@driverRegister' );
Route::post('/driver/resendOTP','CustomerController@resendOTP' );
Route::post('/driver/checkOtp','CustomerController@checkDriverOtp' );

// admin Api

Route::post('/admin/login','AdminApiController@ownerLogin' );
Route::post('/admin/resetPassword','AdminApiController@resetOwnerPassword');
Route::group(['middleware' => ['auth:adminApi']], function () {
    Route::get('/admin/allShops','AdminApiController@allShops');    
    Route::get('/admin/allItem','AdminApiController@allItem');
    Route::get('/admin/allCategory','AdminApiController@allCategory'); 
    Route::get('/admin/locations','AdminApiController@locations');           
    Route::get('/admin/allSubCategory','AdminApiController@allSubCategory');
    Route::get('/admin/groceryCoupon','AdminApiController@groceryCoupon');
    Route::get('/admin/imageSlider','AdminApiController@imageSlider');
    Route::get('/admin/allUsers','AdminApiController@allUsers'); 
    Route::get('/admin/allDrivers','AdminApiController@allDrivers');             
    Route::get('/admin/shopItem/{id}','AdminApiController@shopItem');

    Route::post('/admin/addCategory','AdminApiController@addCategory');
    Route::post('/admin/addSubCategory','AdminApiController@addSubCategory');
    Route::post('/admin/addShop','AdminApiController@addShop');
    Route::post('/admin/addItem','AdminApiController@addItem');
    Route::post('/admin/addCoupon','AdminApiController@addCoupon');
    Route::post('/admin/addBanner','AdminApiController@addBanner');
    Route::post('/admin/addLocation','AdminApiController@addLocation');

    Route::get('/admin/viewCategory/{id}','AdminApiController@viewCategory');
    Route::get('/admin/viewSubCategory/{id}','AdminApiController@viewSubCategory');
    Route::get('/admin/viewShop/{id}','AdminApiController@viewShop');
    Route::get('/admin/viewItem/{id}','AdminApiController@viewItem');
    Route::get('/admin/viewCoupon/{id}','AdminApiController@viewCoupon');
    Route::get('/admin/viewBanner/{id}','AdminApiController@viewBanner');
    Route::get('/admin/viewLocation/{id}','AdminApiController@viewLocation');

    Route::get('/admin/category/delete/{id}','AdminApiController@deleteCategory');
    Route::get('/admin/SubCategory/delete/{id}','AdminApiController@deleteSubCategory');
    Route::get('/admin/Shop/delete/{id}','AdminApiController@deleteShop');
    Route::get('/admin/Item/delete/{id}','AdminApiController@deleteItem');
    Route::get('/admin/Coupon/delete/{id}','AdminApiController@deleteCoupon');
    Route::get('/admin/Banner/delete/{id}','AdminApiController@deleteBanner');
    Route::get('/admin/Location/delete/{id}','AdminApiController@deleteLocation');

    Route::post('/admin/Location/edit','AdminApiController@editLocation');
    Route::post('/admin/Banner/edit','AdminApiController@editBanner');
    Route::post('/admin/Coupon/edit','AdminApiController@editCoupon');
    Route::post('/admin/Item/edit','AdminApiController@editItem');
    Route::post('/admin/Shop/edit','AdminApiController@editShop');
    Route::post('/admin/Category/edit','AdminApiController@editCategory');
    Route::post('/admin/subCategory/edit','AdminApiController@editsubCategory');
    
    Route::get('/admin/viewOrders','AdminApiController@viewOrders');
    Route::get('/admin/singleOrder/{order_id}','AdminApiController@singleOrder');
});