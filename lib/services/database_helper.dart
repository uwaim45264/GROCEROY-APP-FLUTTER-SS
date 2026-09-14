import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('grocery.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        price TEXT NOT NULL,
        weight TEXT NOT NULL,
        imagePath TEXT NOT NULL,
        quantity INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE wishlist (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        price TEXT NOT NULL,
        weight TEXT NOT NULL,
        imagePath TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL UNIQUE,
          password TEXT NOT NULL
        )
      ''');
    }
  }

  // --- User Operations ---

  Future<int> registerUser(String name, String email, String password) async {
    final db = await instance.database;
    return await db.insert('users', {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await instance.database;
    final results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  // --- Cart Operations --- ITS ONLY FOR ME TO REMEMBER .... UWAIM

  Future<void> addToCart(Product product, int quantity) async {
    final db = await instance.database;
    await db.insert(
      'cart',
      {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'weight': product.weight,
        'imagePath': product.imagePath,
        'quantity': quantity,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await instance.database;
    return await db.query('cart');
  }

  Future<void> removeFromCart(String id) async {
    final db = await instance.database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  // --- Wishlist Operations --- THIS IS ONLY FOR ME TO REMEMBER .... UWAIM

  Future<void> toggleWishlist(Product product) async {
    final db = await instance.database;
    final maps = await db.query('wishlist', where: 'id = ?', whereArgs: [product.id]);
    
    if (maps.isEmpty) {
      await db.insert('wishlist', {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'weight': product.weight,
        'imagePath': product.imagePath,
      });
    } else {
      await db.delete('wishlist', where: 'id = ?', whereArgs: [product.id]);
    }
  }

  Future<List<Map<String, dynamic>>> getWishlistItems() async {
    final db = await instance.database;
    return await db.query('wishlist');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
