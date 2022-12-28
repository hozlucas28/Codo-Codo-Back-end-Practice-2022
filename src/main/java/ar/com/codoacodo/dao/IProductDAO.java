package ar.com.codoacodo.dao;

import ar.com.codoacodo.domain.Product;
import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
	public void add(Product product) throws SQLException; // Añade un nuevo producto.

	public boolean delete(int ID) throws SQLException; // Elimina un producto.

	public void deleteAll() throws SQLException; // Elimina todos los productos.

	public void update(Product product) throws SQLException; // Actualiza los datos de un producto.

	public Product getByID(int ID) throws SQLException; // Devuelve el producto que coindice con la ID.

	public List<Product> getAllByBrand(String brand) throws SQLException; // Devuelve todos los productos que coindicen con la marca.

	public List<Product> getAll() throws SQLException; // Devuelve todos los productos.
}
