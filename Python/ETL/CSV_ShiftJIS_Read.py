import pandas as pd

# ファイルパス
file_path = r"C:\Users\藤井\Documents\Python\Data\student_data_shiftjis.csv"

# Excel 読み込み（Sheet1）
df = pd.read_csv(file_path, encoding="shift_jis")

# Power Query の「ヘッダー昇格」は、pandas では通常 read_excel 時点で自動適用される
# もし最初の行がデータになっている場合は以下のようにする
# df.columns = df.iloc[0]
# df = df[1:].reset_index(drop=True)

# 型変換（Power Query の TransformColumnTypes 相当）
df = df.astype({
    "学籍番号": "int64",
    "テスト点数": "int64",
    "出席率": "float",
    "クラス": "string"
})

# 日付列の変換
df["受験日"] = pd.to_datetime(df["受験日"])

# 確認
print(df)
print(df.dtypes)
