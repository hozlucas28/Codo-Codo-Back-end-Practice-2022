package ar.com.codoacodo.dao;

import ar.com.codoacodo.domain.Product;
import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
	public void add(Product product) throws SQLException; // Añade un nuevo producto.

	public void delete(int id) throws SQLException; // Elimina un producto.

	public void update(Product product) throws SQLException; // Actualiza los datos de un producto.

	public Product getByID(int id) throws SQLException; // Devuelve el producto que coindice con la ID.

	public List<Product> getAll() throws SQLException; // Devuelve un listado con todos los productos.
}
