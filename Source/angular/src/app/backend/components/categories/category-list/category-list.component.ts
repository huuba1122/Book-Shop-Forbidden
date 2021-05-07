import { Component, OnChanges, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CategoryService } from 'src/app/services/admin/category.service';

@Component({
  selector: 'app-category-list',
  templateUrl: './category-list.component.html',
  styleUrls: ['./category-list.component.css']
})
export class CategoryListComponent implements OnInit {

  createCategoryForm: FormGroup;
  updateCategoryForm: FormGroup;
  categories:any = [];
  category:any;
  page = 1;
  count = 0;
  pageSize = 3;
  isUpdateForm = false;
  constructor(
    private categoryService : CategoryService,
    private router : Router,
    private formbd : FormBuilder,
    private toastr: ToastrService
  ) { 
    this.createCategoryForm = this.formbd.group({
      name:['', Validators.required]
    });
    this.updateCategoryForm = this.formbd.group({
      id: [''],
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
    // console.log(data);
    let isUnique = this.checkUniqueCategory(data.name);
    // console.log(isUnique.length);
    if(isUnique.length == 0){
        this.categoryService.adminCreateCategory(data).subscribe(
          (res) => {
            if(res.status == 'success'){
              this.getAllCategory();
             this.toastr.success('Thêm thể loại thành công!', 'Thông báo');
              this.createCategoryForm.reset();
            }
          }
        )
    }else{
      this.toastr.warning(data.name + ' đã tồn tại ', 'Thông báo');
      
    }
  }

  updateCategory(){
    let data = this.updateCategoryForm.value;
    this.categoryService.adminUpdateCategory(data, data.id).subscribe(
      (res) => {
        data = res;
        if(data.status === 'success'){
          this.toastr.success('Cập nhập thể loại thành công!', 'Thông báo');
          this.isUpdateForm = false;
          this.getAllCategory();
        }
      }
    )
  }

  showFormEditCategory(id:number){
    this.isUpdateForm = true;
    this.categoryService.adminGetCategory(id).subscribe(
      (res) => {
        this.category = res;
        this.updateCategoryForm.patchValue(this.category);
      }
    )
    
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

  searchCategory(e: any)
  {
    let data = {
      "name": e.target.value
    }
    if(data.name){
      this.categoryService.adminSearchCategory(data).subscribe(
        (res) => {
          this.categories = res;
          this.count = this.categories.length;
        }
      )
    }else{
      this.getAllCategory();
    }
    
  }

  deleteCategory(id:number, name:string)
  {
    console.log(id, name);
    if(confirm('Are you sure category name: ' + name)){
      this.categoryService.adminDeleteCategory(id).subscribe(
        (res) => {
          if(res.status === 'success'){
            this.toastr.success('Xóa thể loại thành công!', 'Thông báo');
            this.getAllCategory();
          }
        }
      )
    }
  }
}
