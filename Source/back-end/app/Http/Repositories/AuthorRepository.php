<?php


namespace App\Http\Repositories;


use App\Models\Author;

class AuthorRepository
{
  function getAll()
  {
      return Author::orderBy('id', 'DESC')->get();
  }
  function findById($id)
  {
      return Author::findOrFail($id);
  }

  function store($author)
  {
      $author->save();
  }
  function delete($author)
  {
      $author->delete();
  }
}
