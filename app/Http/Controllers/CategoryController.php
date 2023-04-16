<?php

namespace App\Http\Controllers;

use App\Category;
use App\Product;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index()
  {
    return view('category.category');
  }

  public function CategoryList(Request $request)
  {


    $category = Category::orderBy('name', 'ASC');

    if ($request->name != '') {

      $category->where('name', 'LIKE', '%' . $request->name . '%');
    }

    $category = $category->paginate(10);

    return $category;
  }



  public function AllCategory()
  {

    $cat   = Category::all();


    return $cat;
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
    $request->validate([
      'name' => 'required|unique:categories'
    ]);


    try {
      $category = new Category;

      $category->name = $request->name;

      $category->save();

      return response()->json(['status' => 'success', 'message' => 'Categoría agregada']);
    } catch (\Exception $e) {

      return response()->json(['status' => 'error', 'message' => '¡Algo salió mal!']);
    }
  }

  /**
   * Display the specified resource.
   *
   * @param  \App\Category  $category
   * @return \Illuminate\Http\Response
   */
  public function show(Category $category)
  {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  \App\Category  $category
   * @return \Illuminate\Http\Response
   */
  public function edit(Category $category)
  {
    return $category;
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  \App\Category  $category
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request, $id)
  {
    $request->validate([
      'name' => 'required|unique:categories,name,' . $id,
    ]);


    try {

      $category = Category::find($id);
      $category->name = $request->name;
      $category->update();

      return response()->json(['status' => 'success', 'message' => 'Categoría actualizada']);
    } catch (\Exception $e) {

      return response()->json(['status' => 'error', 'message' => '¡Algo salió mal!']);
    }
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  \App\Category  $category
   * @return \Illuminate\Http\Response
   */
  public function destroy($id)
  {
    $category = Category::find($id);
    $check = Product::where('category_id', '=', $category->id)->count();

    if ($check > 0) {

      return response()->json(['status' => 'error', 'message' => 'Esta categoría no esta vacía, debe eliminar primero los productos']);
    }
    try {

      $category->delete();

      return response()->json(['status' => 'success', 'message' => 'Categoría eliminada']);
    } catch (\Exception $e) {

      return response()->json(['status' => 'error', 'message' => '¡Algo salió mal!']);
    }
  }
}
