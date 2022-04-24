<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create sometshing great!
|
 */
 
//  website
Route::get('/', 'FrontendController@home');

Route::get('/setLocation/{id}', 'FrontendController@setLocation');
Route::get('/signin', 'FrontendController@signin')->name('signin');
Route::post('/signin', 'FrontendController@signinPost');

Route::get('/signup', 'FrontendController@signup');
Route::post('/signup', 'FrontendController@signupPost');

Route::get('/forgot-password', 'FrontendController@forgotPassword');
Route::post('/forgot-password', 'FrontendController@forgotPasswordPost');

Route::get('/forgot-password', 'FrontendController@forgotPassword');
Route::get('/verify-otp', 'FrontendController@verifyView')->name('otp');
Route::post('/check-otp', 'FrontendController@checkOTP');


Route::get('/contact-us', 'FrontendController@contactUs');
Route::post('/user-request', 'FrontendController@userRequest');
// Route::get('/privacy-policy', 'FrontendController@privacyPolicy');
// Route::get('/term-conditions', 'FrontendController@termConditions');
// Route::get('/refund-return-policy', 'FrontendController@refundPolicy');
Route::get('/offers', 'FrontendController@offers');
Route::get('/faq', 'FrontendController@faq');
Route::post('/products', 'FrontendController@products');

Route::post('/get-product-details', 'FrontendController@getProductDetails');


Route::get('/wishlist/{item_id}', 'FrontendController@addToWishlist');
Route::get('/wishlist/remove/{item_id}', 'FrontendController@removeFromWishlist');

Route::get('/all-categories', 'FrontendController@allCategory');

Route::match(array('GET','POST'),'/category/{id}/{name}', 'FrontendController@categotyProduct');
Route::match(array('GET','POST'),'/all-products', 'FrontendController@allProducts');
Route::match(array('GET','POST'),'/featured-products', 'FrontendController@featuredProducts');
Route::match(array('GET','POST'),'/product/{id}/{name}', 'FrontendController@singleProduct');

Route::post('/add-to-cart', 'FrontendController@addToCart');
Route::post('/remove-from-cart', 'FrontendController@removeFromCart');
Route::get('/checkout', 'FrontendController@checkout');
Route::get('/checkCoupon/{code}', 'FrontendController@checkCoupon');

Route::get('/create-payment/{id}', 'FrontendController@makePayment');
Route::get('/transction_verify/{id}', 'FrontendController@transction_verify');

Route::group(['middleware' => ['auth']], function () {
    Route::get('/profile/dashboard', 'FrontendController@dashboard');
    Route::get('/profile/wishlist', 'FrontendController@wishlist');
    Route::get('/profile/view', 'FrontendController@profileView');
    Route::get('/profile/change-password', 'FrontendController@changePassword');
    Route::post('/profile/change-password', 'FrontendController@changePasswordPost');
    Route::get('/profile/orders', 'FrontendController@profileOrders');
    Route::post('/profile/update', 'FrontendController@profileUpdate');
    Route::get('/profile/address', 'FrontendController@profileAddress');
    Route::get('/profile/addressView/{address_id}', 'FrontendController@addressView');
    Route::post('/profile/addressAdd', 'FrontendController@addressAdd');
    Route::post('/profile/addressEdit', 'FrontendController@addressEdit');
    Route::get('/profile/addressDelete/{address_id}', 'FrontendController@addressDelete');

    Route::post('/place-order', 'FrontendController@placeOrder');
    Route::get('/order-placed/{order_id}', 'FrontendController@orderPlaced');
    Route::get('/invoice/{order_id}', 'FrontendController@invoice');

});

//  website

Auth::routes();
Route::get('/login', 'LicenseController@viewAdminLogin')->name('login');
Route::post('saveEnvData', 'AdminController@saveEnvData');
Route::post('saveAdminData', 'AdminController@saveAdminData');
Route::get('/payment-confirm', 'AdminController@payment_confirm'); 
Route::post('/owner_login', 'LicenseController@owner_login');
Route::get('/ResetPassword', 'CustomerController@ResetPassword');
Route::post('/reset_password', 'CustomerController@reset_password');
Route::post('/getDeviceToken', 'CustomerController@getDeviceToken');

Route::get('/changeLanguage/{locale}', 'CustomerController@changeLanguage');
Route::group(['middleware' => ['auth','admin']], function () {
    
    Route::resources([      
        'GrocerySubCategory' => 'GrocerySubCategoryController',
        'GroceryShop'=>'GroceryShopController',
        'GroceryItem' => 'GroceryItemController',
        'GroceryOrder' => 'GroceryOrderController',
        'ShopOrder' => 'OrderController',
        'Gallery' => 'GalleryController',
        'GroceryCoupon' => 'GroceryCouponController',
        'OwnerSetting' => 'OwnerSettingController',
        'Coupon' => 'CouponController',
        'NotificationTemplate' => 'NotificationTemplateController',
        'Location' => 'LocationController',
        'Role' => 'RoleController',
        'Permission' => 'PermissionController',
        'Customer' => 'CustomerController',
        'Order' => 'OrderController',
        'adminSetting' => 'CompanySettingController',
        'Language' => 'LanguageController',
        'GroceryCategory'=> 'GroceryCategoryController',
        'Banner' => 'BannerController',
        'Faq' => 'FaqController',
    ]);

    Route::get('/home', 'HomeController@index')->name('home');
    Route::get('/viewUsers', 'CustomerController@viewUsers');
    Route::get('/paytabsPayment', 'HomeController@paytabsPayment');
    Route::post('/check_payment', 'HomeController@check_payment'); 
    Route::get('/customerReport', 'CustomerController@customerReport');
    Route::get('/ownerProfile', 'CustomerController@ownerProfileform');
    Route::post('/editOwnerProfile', 'CustomerController@editOwnerProfile');
    Route::post('/changeOwnerPassword', 'CustomerController@changeOwnerPassword');
    Route::post('/changeGroceryOrderStatus', 'GroceryOrderController@changeGroceryOrderStatus');
    Route::get('/accept-grocery-order/{id}', 'GroceryOrderController@accpetOrder');
    Route::get('/reject-grocery-order/{id}', 'GroceryOrderController@rejectOrder');
    Route::get('/viewGroceryOrder/{id}', 'GroceryOrderController@viewsingleOrder');
    Route::get('/groceryOrderInvoice/{id}', 'GroceryOrderController@orderInvoice');
    Route::get('/printGroceryInvoice/{id}', 'GroceryOrderController@printGroceryInvoice');
    Route::get('/shopReview/{shop_id}', 'GroceryReviewController@shopReviews');
    Route::get('/notifications', 'CustomerController@viewNotifications');
    Route::get('/groceryRevenueReport', 'GroceryOrderController@groceryRevenueReport');
    Route::post('/groceryRevenueFilter', 'CustomerController@groceryRevenueFilter');
    Route::get('/shopCategory/{shop_id}', 'GroceryShopController@shopCategory');
    Route::get('/itemSubcategory/{category_id}', 'GroceryShopController@itemSubcategory');   
    Route::get('/assignProductToShop/{shop_id}', 'GroceryShopController@assignProductToShop');
    Route::get('/downloadSampleJson', 'CompanySettingController@downloadSampleJson');
 
    Route::post('/saveWebNotificationSettings', 'CompanySettingController@saveWebNotificationSettings');
    Route::get('/shopOwners', 'CustomerController@shopOwners');
    Route::get('/deliveryGuys', 'CustomerController@deliveryGuys'); 
    Route::post('/savePaymentSetting', 'CompanySettingController@savePaymentSetting');
    Route::post('/savePointSettings', 'CompanySettingController@savePointSettings');
    Route::post('/saveLicense', 'LicenseController@saveLicenseSettings');    
    Route::post('/saveNotificationSettings', 'CompanySettingController@saveNotificationSettings');
    Route::post('/saveMailSettings', 'CompanySettingController@saveMailSettings');
    Route::post('/saveSMSSettings', 'CompanySettingController@saveSMSSettings');
    Route::post('/saveSettings', 'CompanySettingController@saveSettings');
    Route::post('/saveMapSettings', 'CompanySettingController@saveMapSettings');
    Route::post('/saveCommissionSettings', 'CompanySettingController@saveCommissionSettings');
    Route::post('/saveVerificationSettings', 'CompanySettingController@saveVerificationSettings');
    Route::post('/addDriver', 'CustomerController@addDriver');
    Route::get('/Delivery-guy/create', 'CustomerController@addDeliveryBoy');
    Route::get('/Driver/edit/{id}', 'CustomerController@editDriver');
    Route::post('/updateDriver/{id}', 'CustomerController@updateDriver');
    Route::post('/assignRadius', 'CustomerController@assignRadius');
    Route::post('/savePermission', 'RoleController@savePermission');
    Route::get('/add_notification', 'CustomerController@add_notification');
    Route::get('/module', 'CustomerController@module');
    Route::get('/addCoupons', 'CustomerController@addCoupons');
    Route::post('/changelangStatus', 'LanguageController@changelangStatus');
    Route::post('/sendTestMail', 'NotificationTemplateController@sendTestMail');

    // pranali
    Route::get('/GroceryItem/gallery/{id}/edit', 'GroceryItemController@viewGallery');
    Route::get('/GroceryItem/gallery/{id}/add', 'GroceryItemController@addGallery');
    Route::post('/GroceryItem/gallery/{id}/store', 'GroceryItemController@storeGallery');
    Route::delete('/GroceryItem/gallery/{id}/delete/{name}', 'GroceryItemController@deleteGallery');

    Route::post('/changeGroceryOrderDriver', 'GroceryOrderController@changeGroceryOrderDriver');
    // testing of user generate pdf
    Route::get('/generatepdftesting', 'FrontendController@testingofpdfgenerate');
});
