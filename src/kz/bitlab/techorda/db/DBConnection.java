package kz.bitlab.techorda.db;
import com.mysql.cj.jdbc.Driver;
import javax.servlet.jsp.tagext.JspTag;
import java.sql.*;
import java.util.ArrayList;
public class DBConnection {
    private static Connection connection;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/online-shop",
                    "root",
                    "Pa$$w0rd");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Item> getItems() {
        ArrayList<Item> items = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "select * from items");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                items.add(item);
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    public static ArrayList<User> getUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(
                    "select * from users");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                User user = new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
                users.add(user);
            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public static Long checkUsers(String email, String password) {
        Long id = null;

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "select id from users where u_email like ? and u_password like ?");

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                id = resultSet.getLong("id");

            }
            statement.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("email" + email);
        System.out.println("password" + password);
        System.out.println("id" + id);
        return id;
    }

    public static User getUser(long id) {
        User user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "select * from users where id = ? limit 1");
            statement.setLong(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("full_name"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
