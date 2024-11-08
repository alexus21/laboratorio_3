import 'package:postgres/postgres.dart';

class DatabaseHandler
{
    final String host;
    final String database;
    final String username;
    final String password;
    late final Connection conn;

    DatabaseHandler({
        required this.host,
        required this.database,
        required this.username,
        required this.password
    });

    Future<void> connect() async
    {
        conn = await Connection.open(
            Endpoint(
                host: host,
                database: database,
                username: username,
                password: password
            ),
            settings: ConnectionSettings(sslMode: SslMode.disable)
        );
        print('has connection!');
    }

    Future<void> createTable() async
    {
        await conn.execute('CREATE TABLE IF NOT EXISTS a_table ('
            '  id TEXT NOT NULL, '
            '  totals INTEGER NOT NULL DEFAULT 0'
            ')');
    }

    Future<void> simpleQuery() async
    {
        final result = await conn.execute("SELECT 'foo'");
        print(result[0][0]); // first row, first column
    }

    Future<void> insertRow(String id) async
    {
        final result = await conn.execute(
            r'INSERT INTO a_table (id) VALUES ($1)',
            parameters: [id]
        );
        print('Inserted ${result.affectedRows} rows');
    }

    Future<void> namedParameterQuery(String id) async
    {
        final result = await conn.execute(
            Sql.named('SELECT * FROM a_table WHERE id=@id'),
            parameters: {'id': id}
        );
        print(result.first.toColumnMap());
    }

    Future<void> runTransaction() async
    {
        await conn.runTx((s) async
            {
                final rs = await s.execute('SELECT count(*) FROM a_table');
                await s.execute(
                    r'UPDATE a_table SET totals=$1 WHERE id=$2',
                    parameters: [rs[0][0], 'xyz']
                );
            }
        );
    }

    Future<void> preparedStatement() async
    {
        final statement = await conn.prepare(Sql("SELECT 'foo';"));
        final result = await statement.run([]);
        print(result);
        await statement.dispose();
    }

    Future<void> preparedStatementWithTypes() async
    {
        final statement =
            await conn.prepare(Sql(r'SELECT $1;', types: [Type.bigInteger]));
        final bound = statement.bind([1]);
        final subscription = bound.listen((row)
            {
                print('row: $row');
            }
        );
        await subscription.asFuture();
        await subscription.cancel();
        print(await subscription.affectedRows);
        print(await subscription.schema);
    }

    Future<void> close() async
    {
        await conn.close();
    }
}

void main() async
{
    final dbHandler = DatabaseHandler(
        host: 'localhost',
        database: 'db_gastos',
        username: 'postgres',
        password: '1234567890'
    );

    await dbHandler.connect();
    await dbHandler.createTable();
    await dbHandler.simpleQuery();
    await dbHandler.insertRow('example row');
    await dbHandler.namedParameterQuery('example row');
    await dbHandler.runTransaction();
    await dbHandler.preparedStatement();
    await dbHandler.preparedStatementWithTypes();
    await dbHandler.close();
}
