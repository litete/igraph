import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.neo4j.jdbc.Driver;

/**
 * Created by Sang on 2/17/17.
 */
public class Neo4jConnection {
    public static void main(String[] args) throws Exception {
        Connection con = null;
        Class.forName("org.neo4j.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:neo4j://27.148.153.1:7474", "neo4j", "nlp4");
        String word = "中国";
        String query = "match(n{content:'"
                + word
                + "'})-[r]-(f) RETURN n as node, r as dis ORDER by r.weight DESC limit 30";
        ResultSet rs = null;
        PreparedStatement statement = null;
        statement = con.prepareStatement(query);
        rs = statement.executeQuery();

        while (rs.next()) {
            System.out.println(rs.getString(1));
            System.out.println(rs.getString(2));
            System.out.println(rs.getString(3));
            System.out.println(rs.getString(4));
            System.out.println(rs.getString(5));

        }
    }

}
