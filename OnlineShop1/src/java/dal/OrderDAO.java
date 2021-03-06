/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dbcontext.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author VINH
 */
public class OrderDAO extends DBContext {

    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet results = null;

    public int getNumberOfRows() throws Exception {

        int rows = 0;
        String sql = "select COUNT(orderId) from Orders;";

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                rows = results.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }

        return rows;
    }

    public List<Order> getOrderByPage(int currentPage, int recordsPerPage) {

        List<Order> orders = new ArrayList<>();
        int start = currentPage * recordsPerPage - recordsPerPage;
        Order order = null;

        try {
            String sql = "select * from orders LIMIT " + start + " ," + recordsPerPage;
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setCustomerId(results.getInt("customerId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setSalesId(results.getInt("salesId"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                order.setSalesNote(results.getString("salesNote"));
                orders.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return orders;
    }

    public List<Order> searchOrder(String key, String from, String to, int salesId, int status, int orderId) throws Exception {
        List<Order> orders = new ArrayList<>();
        String sql = "select o.orderId,o.orderDate,o.customerId,o.totalCost,o.salesId,o.orderStatus ,u.fullname\n"
                + "from Orders o join User u on u.uid = o.customerId where ";
        if (orderId != 0) {
            sql += "o.orderId = " + orderId;
        } else {
            sql += "u.fullname like '%" + key + "%' ";
        }
        if (salesId != 0) {
            sql += " and o.salesId = " + salesId;
        }
        if (status != 0) {
            sql += " and o.orderStatus = " + status;
        }
        if (!from.isEmpty() && !to.isEmpty()) {
            sql += " and (o.orderDate between '" + from + "' and '" + to + "');";
        }

        System.out.println(sql);
        Order order = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setCustomerId(results.getInt("customerId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setSalesId(results.getInt("salesId"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                orders.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return orders;
    }

    public Order getOrderByOrderId(int orderId) throws Exception {

        String sql = "select * from orders where orderId = " + orderId;
        System.out.println(sql);
        Order order = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setCustomerId(results.getInt("customerId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setSalesId(results.getInt("salesId"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                order.setSalesNote(results.getString("salesNote"));
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (SQLException | IOException ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return order;
    }

    public int updateOrderSaleInfor(int saleId, int orderStatus, String salesNote,
            int orderId) throws SQLException {

        String sql = "";
        if (saleId != 0) {
            sql = "UPDATE `onlineshop1`.`orders`\n"
                    + "SET `salesId` = ?,`orderStatus` = ?,`salesNote` = ?\n"
                    + "WHERE `orderId` = ? ;";
        } else {
            sql = "UPDATE `onlineshop1`.`orders`\n"
                    + "SET `orderStatus` = ?,`salesNote` = ?\n"
                    + "WHERE `orderId` = ? ;";
        }
        int row = 0;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            if (saleId != 0) {
                preparedStatement.setInt(1, saleId);
                preparedStatement.setInt(2, orderStatus);
                preparedStatement.setString(3, salesNote);
                preparedStatement.setInt(4, orderId);

            } else {
                preparedStatement.setInt(1, orderStatus);
                preparedStatement.setString(2, salesNote);
                preparedStatement.setInt(3, orderId);
            }
            row = preparedStatement.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return row;
    }

    public int updateTotalCost(int orderId, float totalCost) throws SQLException {
        String sql = "UPDATE `onlineshop1`.`orders`\n"
                + "SET `totalCost` = ? WHERE `orderId` = ? ;";
        int row = 0;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setFloat(1, totalCost);
            preparedStatement.setInt(2, orderId);
            row = preparedStatement.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return row;
    }

    public List<Order> getOrdersByCustomerId(int customerId) {

        List<Order> orders = new ArrayList<>();
        Order order = null;

        try {
            String sql = "select * from orders where customerId = ? order by orderDate desc";
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, customerId);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                order.setUpdatedDate(results.getDate("lastUpdated"));
                orders.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return orders;
    }

    public List<Order> filterCustomerOrders(String from, String to,
            int status, int customerId) throws Exception {
        List<Order> orders = new ArrayList<>();
        String sql = "select * from orders where customerId = " + customerId;
        if (status != 0) {
            sql += " and orderStatus = " + status;
        }
        if (!from.isEmpty() && !to.isEmpty()) {
            sql += " and (orderDate between '" + from + "' and '" + to + "') ";
        }
        sql += " order by orderDate desc";
        System.out.println(sql);
        Order order = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                order.setUpdatedDate(results.getDate("lastUpdated"));
                orders.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return orders;
    }

    public int cancelCustomerOrder(int orderId) throws SQLException {

        String sql = "UPDATE orders\n"
                + " SET orderStatus = 22, lastUpdated = CURDATE() "
                + " WHERE `orderId` = ? ;";

        int row = 0;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderId);
            row = preparedStatement.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return row;
    }
    
    public Order getLastOrder() throws Exception {
        String sql = "select * from orders ORDER BY orderId DESC LIMIT 1;";
        System.out.println(sql);
        Order order = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            results = preparedStatement.executeQuery();

            while (results.next()) {
                order = new Order();
                order.setOrderId(results.getInt("orderId"));
                order.setCustomerId(results.getInt("customerId"));
                order.setTotalCost(results.getFloat("totalCost"));
                order.setSalesId(results.getInt("salesId"));
                order.setOrderStatus(results.getInt("orderStatus"));
                order.setOrderDate(results.getDate("orderDate"));
                order.setSalesNote(results.getString("salesNote"));
            }
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (SQLException | IOException ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
        return order;
    }
    
    public int addOrder(int cid, float totalCost, int sid) throws Exception {
    String sql = "INSERT INTO `onlineshop1`.`orders` (`customerId`, `totalCost`, `salesId`, `orderStatus`, `orderDate`, `lastUpdated`)"
                + "VALUES (?,?,?,25,CURRENT_DATE(),CURRENT_DATE())";
    int row = 0;
    try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cid);
            preparedStatement.setFloat(2, totalCost);
            preparedStatement.setInt(3, sid);
            row = preparedStatement.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception ==== " + ex);
        } finally {
            try {
                closeConnection(connection);
                closePrepareStatement(preparedStatement);
                //closeResultSet(results);

            } catch (Exception ex) {
                System.out.println("Exception ==== " + ex);
            }
        }
    return row;
    }
}
