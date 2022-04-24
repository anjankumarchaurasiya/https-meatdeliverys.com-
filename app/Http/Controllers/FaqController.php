<?php

namespace App\Http\Controllers;

use App\Faq;
use Illuminate\Http\Request;

class FaqController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $data = Faq::orderBy('id', 'DESC')->paginate(7);
        return view('mainAdmin.faq.viewFaq',['faq'=>$data]);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('mainAdmin.faq.addFaq');
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
            'title' => 'bail|required',
            'description' => 'bail|required',
            'status' => 'bail|required',
        ]);
        $data = $request->all();
        Faq::create($data);
        return redirect('Faq');
       
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Faq  $faq
     * @return \Illuminate\Http\Response
     */
    public function show(Faq $faq)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Faq  $faq
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $data = Faq::findOrFail($id);
        return view('mainAdmin.faq.editFaq',['data'=>$data]);
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Faq  $faq
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate([
            'title' => 'bail|required',
            'description' => 'bail|required',
            'status' => 'bail|required',
        ]);
        $data = $request->all();
        Faq::findOrFail($id)->update($data);
        
        return redirect('Faq');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Faq  $faq
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $delete = Faq::find($id);
            $delete->delete();
            return 'true';
           
        } catch (\Exception $e) {
            return response('Data is Connected with other Data', 400);
        }
    }
}
