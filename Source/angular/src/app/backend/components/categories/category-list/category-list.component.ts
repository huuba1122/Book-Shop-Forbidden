import { Component, OnChanges, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CategoryService } from 'src/app/services/admin/category.service';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent implements OnInit {

  createCategoryForm: FormGroup;
  categories:any;
  page = 1;
  count = 0;
  pageSize = 3;
  constructor(
    private categoryService : CategoryService,
    private router : Router,
    private formbd : FormBuilder
  ) { 
    this.createCategoryForm = this.formbd.group({
      name:['', Validators.required]
    })
  }

  ngOnInit(): void {
    this.getAllCategory();
  }

  // ngOnChanges():void{
  //   this.getAllCategory();
  // }

  getAllCategory(){
    
    this.categoryService.adminGetAllCategory().subscribe(
      (res) => {
        this.categories = res;
        // console.log(this.categories);
        this.count = this.categories.length;
        // console.log(this.count);
      }
    )
  }

  createCategory(){
    let data = this.createCategoryForm.value;
    let isUnique = this.checkUniqueCategory(data.name);
    console.log(isUnique.length);
    if(isUnique.length == 0){
        this.categoryService.adminCreateCategory(data).subscribe(
          (res) => {
            if(res.status == 'success'){
              this.getAllCategory();
              alert("create category successfully");
            }
          }
        )
    }else{
      alert(data.name + ' had exits!')
    }
  }

  checkUniqueCategory(data:any)
  {
    data = data.toLocaleLowerCase();
    return this.categories.filter((product: any) =>
        product.name.toLocaleLowerCase().indexOf(data) !== -1);
  }

  onTableDataChange(e:any){
    this.page = e;
    // console.log(e);
  }

}
