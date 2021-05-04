<?php


namespace App\Http\Services;


use App\Http\Repositories\CategoryRepository;

class CategoryService
{
    protected $categoryRepo;
    public function __construct(CategoryRepository $categoryRepository)
    {
        $this->categoryRepo = $categoryRepository;
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
        $category->quantity = $quantity;
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
        $this->categoryRepo->delete($category);
    }

    function search($search)
    {
//        print_r($search['name']);
        return $this->categoryRepo->search($search['name']);
    }
}
