<?php


namespace App\Http\Services;


use App\Http\Repositories\CategoryRepository;
use App\Http\Repositories\BookRepository;

class CategoryService
{
    protected $categoryRepo;
    protected $bookRepo;
    public function __construct(CategoryRepository $categoryRepository, BookRepository $bookRepo)
    {
        $this->categoryRepo = $categoryRepository;
        $this->bookRepo = $bookRepo;
    }

    function getAll(){
        return $this->categoryRepo->getAll();
    }

    function findById($id)
    {
        return $this->categoryRepo->findById($id);
    }

    function store($data)
    {
        return $this->categoryRepo->store($data);
    }

    function updateQuantity($quantity, $id){
        $category = $this->categoryRepo->findById($id);
        $oldQuantity = $category->quantity;
        $category->quantity = $quantity + $oldQuantity;
        $this->categoryRepo->update($category);
    }

    function update($data, $id)
    {
        $category = $this->categoryRepo->findById($id);
        $category->name = $data['name'];
        $this->categoryRepo->update($category);
    }

    function delete($id)
    {
        $category = $this->categoryRepo->findById($id);
        $books = $this->bookRepo->findByCategoryId($id);
        foreach($books as $key => $value)
        {
            $book = $this->bookRepo->findById($value->id);
            $book->category_id = 1;
            $quantity = $value->stock;
            $this->updateQuantity($quantity, 1);
            $this->bookRepo->update($book);
        }
        $this->categoryRepo->delete($category);
    }

    function search($search)
    {
//        print_r($search['name']);
        return $this->categoryRepo->search($search['name']);
    }

}
