import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CategoryService } from 'src/app/services/admin/category.service';

@Component({
  selector: 'app-category-edit',
  templateUrl: './category-edit.component.html',
  styleUrls: ['./category-edit.component.css']
})
export class CategoryEditComponent implements OnInit {
  category:any;
  editCategoryForm: FormGroup;
  constructor(
    private route:Router,
    private routeActive: ActivatedRoute,
    private categoryService : CategoryService,
    private formbd: FormBuilder
  ) {
    this.editCategoryForm = this.formbd.group({
      name:['', Validators.required]
    })
   }

  ngOnInit(): void {
    //@ts-ignore
    let id = +this.routeActive.snapshot.paramMap.get("id");
    this.getCategory(id);
  }
  
  
  
  getCategory(id: number)
  {
     this.categoryService.adminGetCategory(id).subscribe(
       (res) => {
         this.category = res;
        //  console.log(this.category);
        this.editCategoryForm.patchValue(this.category);
       }
     );
  }

  editCategory(){
    //@ts-ignore
    let id = +this.routeActive.snapshot.paramMap.get("id");
    let data = this.editCategoryForm.value;
    this.categoryService.adminUpdateCategory(data, id).subscribe(
      (res) => {
        data = res;
        if(data.status === 'success'){
          alert('update category successfully!');
          this.route.navigate(['admin/category-list']);
        }
      }
    )
  }

}
