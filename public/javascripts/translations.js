var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"},"not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken","in_between":"must be in between %{min} and %{max}","spoofed_media_type":"has an extension that does not match its contents","record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}},"template":{"body":"There were problems with the following fields:","header":{"one":"1 error prohibited this %{model} from being saved","other":"%{count} errors prohibited this %{model} from being saved"}}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"page_entries_info":{"one_page":{"display_entries":{"zero":"No %{entry_name} found","one":"Displaying \u003cb\u003e1\u003c/b\u003e %{entry_name}","other":"Displaying \u003cb\u003eall %{count}\u003c/b\u003e %{entry_name}"}},"more_pages":{"display_entries":"Displaying %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e of \u003cb\u003e%{total}\u003c/b\u003e in total"}}},"views":{"pagination":{"first":"\u0026laquo; First","last":"Last \u0026raquo;","previous":"\u0026lsaquo; Prev","next":"Next \u0026rsaquo;","truncate":"\u0026hellip;"}},"common":{"belonging_to":"belonging to %{company}","belong_to":"belong to %{company}","all_posts":"All posts","signed_in":"Signed in","signed_out":"Signed out","edit":"Edit","delete":"Delete","stocked":"Stocked"},"users":{"index":{"see_all_this_post":"See all this post","see_this_post":"Read this post"},"edit":{"type_your_nick_name":"Edit your nick name","submit":"Save changes","edit_profile":"Edit your profile","placeholder":"Ex. My name is Jack,  and I am currently studying abroad in Japan. I like listening musics and reading books. Nice to meet you!)","not_found":"It user is not found"},"update":{"complate_update_nick_name":"Done updating nick name"},"sign_in":"Sign In","sign_out":"Sign Out","user_name":"Nick name","not_found":"User not found","create_by":"created by %{full_name}","change_interface":"change your interface","tags":"tags often use | ","authentication_failed":"Authentication failed, please try again","stocked_notes":"Stoked notes"},"notes":{"index":{"title":"Title","content":"Content"},"tag_and_warning":"tag : タグはスペースで区切ってください","tag_list":"tag list | ","tag":"このタグの投稿一覧","stock_this_note":"Stock this note"}},"de":{"errors":{"messages":{"in_between":"muss zwischen %{min} und %{max} sein","spoofed_media_type":"trägt eine Dateiendung, die nicht mit dem Inhalt der Datei übereinstimmt"}},"number":{"human":{"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}}}}},"es":{"errors":{"messages":{"in_between":"debe estar entre %{min} y %{max}","spoofed_media_type":"tiene una extensión que no coincide con su contenido"}},"number":{"human":{"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}}}}},"ja":{"common":{"belonging_to":"%{company}で働いています","belong_to":"%{company}で働いていました","all_posts":"全ての投稿","signed_in":"サインインしました","signed_out":"サインアウトしました","edit":"編集","delete":"削除","stocked":"ストック済み"},"users":{"index":{"see_all_this_post":"続きを読む","see_this_post":"この投稿を読む"},"edit":{"type_your_nick_name":"ニックネームを入力してください","submit":"Save changes","edit_profile":"プロフィールを編集","placeholder":"(例 アメリカに留学している大森です。英語を勉強しています。趣味は映画鑑賞とブログを読むことです。よろしくお願いします。","not_found":"ユーザーが見つかりません"},"update":{"complate_update_nick_name":"ニックネームの保存が完了しました"},"sign_in":"ログイン","sign_out":"ログアウト","user_name":"ニックネーム","not_found":"ユーザーが見つかりません","created_by":"%{full_name}が作成","change_interface":"表示言語を変える","tags":"よく使ってるタグ | ","authentication_failed":"認証に失敗しました。再度認証してください","stocked_notes":"ストックした投稿"},"notes":{"index":{"title":"タイトル","content":"内容"},"tag_and_warning":"tag : タグはスペースで区切ってください","tag_list":"タグ一覧 | ","tag":"このタグの投稿一覧","stock_this_note":"このノートをストックする"},"datetime":{"distance_in_words":{"about_x_hours":{"one":"約1時間","other":"約%{count}時間"},"about_x_months":{"one":"約1ヶ月","other":"約%{count}ヶ月"},"about_x_years":{"one":"約1年","other":"約%{count}年"},"almost_x_years":{"one":"1年弱","other":"%{count}年弱"},"half_a_minute":"30秒前後","less_than_x_minutes":{"one":"1分以内","other":"%{count}分未満"},"less_than_x_seconds":{"one":"1秒以内","other":"%{count}秒未満"},"over_x_years":{"one":"1年以上","other":"%{count}年以上"},"x_days":{"one":"1日","other":"%{count}日"},"x_minutes":{"one":"1分","other":"%{count}分"},"x_months":{"one":"1ヶ月","other":"%{count}ヶ月"},"x_seconds":{"one":"1秒","other":"%{count}秒"}},"prompts":{"day":"日","hour":"時","minute":"分","month":"月","second":"秒","year":"年"}},"date":{"abbr_day_names":["日","月","火","水","木","金","土"],"abbr_month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"day_names":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"formats":{"default":"%Y/%m/%d","long":"%Y年%m月%d日(%a)","short":"%m/%d"},"month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"order":["year","month","day"]},"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","present":"は入力しないでください。","confirmation":"と%{attribute}の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","restrict_dependent_destroy":"%{record}が存在しているので削除できません。","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。","other_than":"は%{count}以外の値にしてください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}},"helpers":{"select":{"prompt":"選択してください。"},"submit":{"create":"登録する","submit":"保存する","update":"更新する"}},"number":{"currency":{"format":{"delimiter":",","format":"%n%u","precision":0,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"円"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"十億","million":"百万","quadrillion":"千兆","thousand":"千","trillion":"兆","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n%u","units":{"byte":"バイト","gb":"ギガバイト","kb":"キロバイト","mb":"メガバイト","tb":"テラバイト"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"support":{"array":{"last_word_connector":"と","two_words_connector":"と","words_connector":"と"}},"time":{"am":"午前","formats":{"default":"%Y/%m/%d %H:%M:%S","long":"%Y年%m月%d日(%a) %H時%M分%S秒 %z","short":"%y/%m/%d %H:%M"},"pm":"午後"}}};