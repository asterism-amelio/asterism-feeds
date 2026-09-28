# Asterism shared feeds

Asterism内で共有するRSS / Atom配信元一覧の正本です。

正本URL: <https://raw.githubusercontent.com/asterism-amelio/asterism-feeds/main/feeds.opml>

配信元を追加・削除・URL変更するときは、`feeds.opml` の該当する`outline`を編集してください。ここには既に公開されている配信元の表示名と公開RSS / Atom URLだけを置きます。

変更後は、`make check` でXMLとしてparseでき、各配信元に表示名と`xmlUrl`があり、`xmlUrl`が重複していないことを確認します。
