let
    ソース = Csv.Document(File.Contents("C:\Users\藤井\Documents\Python\Data\StudentScore_UTF-8.csv"),[Delimiter=",", Columns=null, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    昇格されたヘッダー数 = Table.PromoteHeaders(ソース, [PromoteAllScalars=true]),
    変更された型 = Table.TransformColumnTypes(昇格されたヘッダー数,{{"学籍番号", Int64.Type}, {"テスト点数", Int64.Type}, {"出席率", type number}, {"クラス", type text}, {"受験日", type date}})
in
    変更された型