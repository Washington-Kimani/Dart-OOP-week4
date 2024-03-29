import 'dart:io';

// Interface for printable objects
abstract class Printable {
  void printDetails();
}

// Base class for products
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);

  // Display basic product information
  void displayInfo() {
    print('Name: $name, Price: \$$price');
  }
}

// Subclass of product with additional information for a book
class Book extends Product implements Printable {
  final String author;

  Book(String name, double price, this.author) : super(name, price);

  // Override displayInfo to include author
  @override
  void displayInfo() {
    super.displayInfo();
    print('Author: $author');
  }

  // Implement printDetails to print all book information
  @override
  void printDetails() {
    displayInfo();
  }
}

// Function to load a Book object from a file
Book loadBookFromFile(String filePath) {
  final file = File(filePath);
  final lines = file.readAsLinesSync();
  final name = lines[0];
  final price = double.parse(lines[1]);
  final author = lines[2];
  return Book(name, price, author);
}

void main() {
  // Load book data from a file (replace "book_data.txt" with your file path)
  final book = loadBookFromFile("book_data.txt");

  // Print book details using the interface method
  book.printDetails();
}
