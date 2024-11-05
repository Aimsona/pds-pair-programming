import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'to-do-list',
  templateUrl: './to-do-list.component.html',
  styleUrls: ['./to-do-list.component.scss']
})
export class ToDoListComponent implements OnInit {

  toDoItems: ToDoItem[];

  constructor() { }

  ngOnInit(): void {

    this.toDoItems = this.getToDoItems();
  }

  private getToDoItems(): ToDoItem[] {

    var item2: ToDoItem = {
      id: 2,
      completed: true,
      title: "Have a cup of tea"
    }

    var item1: ToDoItem = {
      id: 1,
      completed: false,
      title: "Complete code test"
    }

    return [
      item1,
      item2
    ];

  }

}

export class ToDoItem {
  id: number;
  title: string;
  completed: boolean;
}