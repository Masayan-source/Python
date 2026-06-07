let
    ソース = Excel.Workbook(File.Contents("C:\Users\藤井\Documents\Python\Data\StudentScore.xlsx"), null, true),
    Sheet1_Sheet = ソース{[Item="Sheet1",Kind="Sheet"]}[Data],
    昇格されたヘッダー数 = Table.PromoteHeaders(Sheet1_Sheet, [PromoteAllScalars=true]),
    変更された型 = Table.TransformColumnTypes(昇格されたヘッダー数,{{"学籍番号", Int64.Type}, {"テスト点数", Int64.Type}, {"出席率", type number}, {"クラス", type text}, {"受験日", type date}})
in
    変更された型