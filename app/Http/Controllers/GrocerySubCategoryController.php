<?php

namespace App\Http\Controllers;

use App\GrocerySubCategory;
use App\GroceryCategory;
use Auth;
use App\GroceryItem;
use Illuminate\Http\Request;

class GrocerySubCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //        
        $data = GrocerySubCategory::orderBy('id', 'DESC')->where('owner_id',Auth::user()->id)->paginate(7);
        return view('admin.SubCategory.viewSubCategory',['categories'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $category = GroceryCategory::orderBy('id', 'DESC')->get();
        return view('admin.SubCategory.addSubCategory',['category'=>$category]);
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
            'name' => 'bail|required|unique:grocery_sub_category',
            'status' => 'bail|required',
            'category_id' => 'bail|required',
            'image' => 'bail|required',
        ]);
        $data = $request->all();
        $data['owner_id'] =Auth::user()->id;        
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        GrocerySubCategory::create($data);
        return redirect('GrocerySubCategory');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\GrocerySubCategory  $grocerySubCategory
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\GrocerySubCategory  $grocerySubCategory
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

        $data = GrocerySubCategory::findOrFail($id);        
        $category = GroceryCategory::where('status',0)->get();
        return view('admin.SubCategory.editSubCategory',['category'=>$category,'data'=>$data]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\GrocerySubCategory  $grocerySubCategory
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate([
            'name' => 'bail|required|unique:grocery_sub_category,name,' . $id . ',id',
            'status' => 'bail|required',
            'category_id' => 'bail|required',
        ]);
        $data = $request->all();
        $data['owner_id'] =Auth::user()->id;
        $gc = GrocerySubCategory::find($id);
        if ($request->hasFile('image')) {
            if(\File::exists(public_path('/images/upload/'. $gc->image))) {
                \File::delete(public_path('/images/upload/'. $gc->image));
            }
            $image = $request->file('image');
            $name = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/images/upload');
            $image->move($destinationPath, $name);
            $data['image'] = $name;
        }
        GrocerySubCategory::findOrFail($id)->update($data);
        return redirect('GrocerySubCategory');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\GrocerySubCategory  $grocerySubCategory
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        //
        try {
            $item = GroceryItem::where('subcategory_id',$id)->get();           
            if(count($item)==0){
                $delete = GrocerySubCategory::find($id);
                $delete->delete();  
                if(\File::exists(public_path('/images/upload/'. $delete->image))){
                    \File::delete(public_path('/images/upload/'. $delete->image));
                }
                return 'true';
            }     
            else{
                return response('Data is Connected with other Data', 400);
            }                               
        } catch (\Exception $e) {
            return response('Data is Connected with other Data', 400);
        }
    }
}
