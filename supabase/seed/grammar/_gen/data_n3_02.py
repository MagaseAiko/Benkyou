G = [
dict(
n=11,
jp="〜べきだ",
rd="beki da",
tr="Deve / Deveria / É preciso",
ex="""べきだ é usado para expressar um dever moral, uma obrigação de bom senso ou uma recomendação forte. Equivale a "deve", "deveria" ou "é preciso".

A ideia é de algo que é o certo a fazer, segundo a opinião de quem fala, as regras sociais ou a moral. Por exemplo, "promessas devem ser cumpridas" ou "se errou, deve pedir desculpas".

Ele vem depois do verbo na forma de dicionário. Com する, existem duas formas: するべき e すべき, sendo a segunda mais formal.

No passado, べきだった expressa arrependimento: "eu devia ter feito".

Como é uma opinião forte, べきだ pode soar impositivo se dito diretamente a alguém, principalmente a superiores. É comum suavizar com と思う.""",
st="""Verbo na forma de dicionário + べきだ / べきです
する → するべき / すべき
Adjetivo い sem い + くあるべき
Substantivo / Adjetivo な + であるべき

Passado (arrependimento): べきだった
Antes de substantivo: べき + Substantivo""",
no="""べきだ é mais forte que ほうがいい. ほうがいい é um conselho prático; べきだ é um dever, quase moral.

べきだ não é usado para regras e leis oficiais. Para isso, usa-se なければならない.

Em textos argumentativos, べきだ aparece muito para defender opiniões.""",
bf="べきだ",
rx="べきだ|べきです|べき",
tk=["べき", "だ"],
va=["べきだ", "べきです", "べきだった", "すべき"],
E=[
("約束は守るべきだ。", "やくそくはまもるべきだ。", "Promessas devem ser cumpridas."),
("学生はもっと勉強するべきです。", "がくせいはもっとべんきょうするべきです。", "Os estudantes deveriam estudar mais."),
("悪いと思ったら、すぐ謝るべきだ。", "わるいとおもったら、すぐあやまるべきだ。", "Se achar que errou, deve pedir desculpas logo."),
("若いうちに、いろいろな経験をするべきだと思う。", "わかいうちに、いろいろなけいけんをするべきだとおもう。", "Acho que devemos ter várias experiências enquanto somos jovens."),
("あの時、本当のことを言うべきだった。", "あのとき、ほんとうのことをいうべきだった。", "Naquela hora, eu devia ter dito a verdade."),
],
R=[
("人の話はよく聞く____。", "Devemos ouvir bem o que os outros dizem.", ["べきだ", "べきです"]),
("困っている人がいたら、助ける____です。", "Se houver alguém em dificuldade, devemos ajudar.", ["べき"]),
("自分の部屋は自分で掃除す____だ。", "Cada um deve limpar o próprio quarto.", ["べき"]),
("こんなに悪くなる前に、もっと早く医者に行く____。", "Eu devia ter ido ao médico antes de piorar tanto.", ["べきだった"]),
("子供の意見も大切にする____だと思う。", "Acho que devemos valorizar também a opinião das crianças.", ["べき"]),
],
),
dict(
n=12,
jp="〜べきではない",
rd="beki de wa nai",
tr="Não deve / Não deveria",
ex="""べきではない é a forma negativa de べきだ. Ela expressa que algo não deve ser feito, segundo a moral, o bom senso ou a opinião de quem fala. Equivale a "não deve" ou "não deveria".

É usada para criticar comportamentos, dar conselhos fortes ou expressar princípios. Por exemplo, "não se deve falar mal dos outros" ou "não se deve dirigir depois de beber".

Ela vem depois do verbo na forma de dicionário. Na fala, べきではない costuma virar べきじゃない.

No passado, べきではなかった expressa arrependimento por algo que a pessoa fez: "eu não devia ter dito aquilo".

Atenção: o negativo fica em べき, e não no verbo. Diz-se 言うべきではない, e não 言わないべきだ.""",
st="""Verbo na forma de dicionário + べきではない
Verbo + べきではありません (educado)
Verbo + べきじゃない (fala)

Passado (arrependimento): べきではなかった""",
no="""Como べきではない é forte, é comum suavizar com と思う ao dar opinião.

Para proibições oficiais, como regras de um lugar, o japonês usa てはいけない ou 禁止.

Em debates e textos de opinião, べきではない aparece com frequência para argumentar contra algo.""",
bf="べきではない",
rx="べきではない|べきじゃない|べきではありません|べきではなかった",
tk=["べき", "では", "ない"],
va=["べきではない", "べきじゃない", "べきではありません", "べきではなかった"],
E=[
("人の悪口を言うべきではない。", "ひとのわるくちをいうべきではない。", "Não se deve falar mal dos outros."),
("子供は夜遅くまで外にいるべきではありません。", "こどもはよるおそくまでそとにいるべきではありません。", "Crianças não deveriam ficar na rua até tarde da noite."),
("お酒を飲んだら、運転するべきではない。", "おさけをのんだら、うんてんするべきではない。", "Depois de beber, não se deve dirigir."),
("簡単にあきらめるべきではないと思う。", "かんたんにあきらめるべきではないとおもう。", "Acho que não devemos desistir tão fácil."),
("彼にあんなことを言うべきではなかった。", "かれにあんなことをいうべきではなかった。", "Eu não devia ter dito aquilo para ele."),
],
R=[
("他人のプライバシーに入る____。", "Não se deve invadir a privacidade dos outros.", ["べきではない", "べきではありません"]),
("授業中は携帯を使う____。", "Não se deve usar o celular durante a aula.", ["べきではない", "べきではありません"]),
("食べ物を無駄にする____。", "Não se deve desperdiçar comida.", ["べきではない", "べきではありません"]),
("疲れているときに、大事なことを決める____。", "Não se deve tomar decisões importantes quando se está cansado.", ["べきではない", "べきではありません"]),
("彼にあの秘密を話す____。", "Eu não devia ter contado aquele segredo para ele.", ["べきではなかった"]),
],
),
dict(
n=13,
jp="別に〜ない",
rd="betsu ni ~ nai",
tr="Não especialmente / Não em particular / Nada demais",
ex="""別に〜ない é usado para dizer que algo não é especial, não tem nada de mais ou não é bem assim. Equivale a "não especialmente", "não em particular" ou "nada demais".

別に vem antes de uma frase negativa e suaviza ou minimiza a situação. Por exemplo, "não estou especialmente bravo" ou "não tenho pressa nenhuma".

Sozinho, como resposta curta, 別に significa "nada" ou "não, nada especial". Mas, dependendo do tom, essa resposta curta pode soar fria, desinteressada ou até rude.

Também é muito usado com わけではない, formando 別に〜わけではない, para negar uma interpretação: "não é que eu não goste...".""",
st="""別に + Verbo / Adjetivo negativo
別に + 〜わけではない (não é que...)
別に (resposta curta: nada / não especialmente)

Escrita: 別に / べつに""",
no="""Responder só 別に a uma pergunta pode passar a impressão de má vontade. Em situações educadas, é melhor dar uma resposta completa.

別に também aparece em frases como 別にいい ("tanto faz", "não precisa").

Sem a negação, 別に significa "separadamente", como em 別に払う (pagar separadamente).""",
bf="別に",
rx="別に|べつに",
tk=["別に", "ない"],
va=["別に", "べつに"],
E=[
("「どうしたの？」「別に何でもないよ。」", "「どうしたの？」「べつになんでもないよ。」", "\"O que foi?\" \"Nada demais.\""),
("別に急いでいないので、ゆっくりでいいですよ。", "べつにいそいでいないので、ゆっくりでいいですよ。", "Não estou com pressa, pode ir com calma."),
("別に怒っていません。", "べつにおこっていません。", "Não estou bravo, não."),
("私は別に肉が嫌いなわけではない。", "わたしはべつににくがきらいなわけではない。", "Não é que eu não goste de carne."),
("「何か欲しいものある？」「別に。」", "「なにかほしいものある？」「べつに。」", "\"Quer alguma coisa?\" \"Nada em especial.\""),
],
R=[
("____困っていないから、心配しないで。", "Não estou com nenhum problema, então não se preocupe.", ["別に", "べつに"]),
("「何かあったの？」「いや、____何もないよ。」", "\"Aconteceu alguma coisa?\" \"Não, nada demais.\"", ["別に", "べつに"]),
("____行きたくないわけじゃない。", "Não é que eu não queira ir.", ["別に", "べつに"]),
("みんなは褒めていたけど、その映画は____おもしろくなかった。", "Todo mundo elogiou, mas esse filme não foi nada de especial.", ["別に", "べつに"]),
("「何か質問は？」「____ありません。」", "\"Alguma pergunta?\" \"Nenhuma em especial.\"", ["別に", "べつに"]),
],
),
dict(
n=14,
jp="〜ぶりに",
rd="buri ni",
tr="Pela primeira vez em / Depois de (tempo sem)",
ex="""ぶりに é usado para dizer que algo aconteceu de novo depois de um longo intervalo. Equivale a "pela primeira vez em... (tempo)" ou "depois de... sem".

Ele vem depois de uma expressão de tempo. Por exemplo, 三年ぶりに significa "pela primeira vez em três anos", ou seja, a última vez foi há três anos.

A expressão 久しぶりに é a mais comum e significa "depois de muito tempo".

Antes de um substantivo, usa-se ぶりの, como em 十年ぶりの大雪 ("a maior nevasca em dez anos").

Sozinho, 久しぶり! é uma saudação muito comum para alguém que não se vê há muito tempo, como "quanto tempo!".""",
st="""Período de tempo + ぶりに + Verbo
Período de tempo + ぶりの + Substantivo
久しぶりに / 久しぶりの / 久しぶり！

Escrita: ぶり / 振り""",
no="""ぶり também aparece em outras palavras com sentido de "jeito", como 話しぶり (jeito de falar). São usos diferentes.

Para intervalos muito curtos, como um dia, ぶりに soa estranho, a não ser que a pessoa queira mostrar que sentiu muita falta.

お久しぶりです é a versão educada da saudação.""",
bf="ぶりに",
rx="ぶりに|振りに|ぶりの|ぶり",
tk=["ぶり", "に"],
va=["ぶりに", "ぶりの", "久しぶり"],
E=[
("三年ぶりに国へ帰りました。", "さんねんぶりにくにへかえりました。", "Voltei para o meu país pela primeira vez em três anos."),
("週末、久しぶりに友達に会った。", "しゅうまつ、ひさしぶりにともだちにあった。", "No fim de semana, encontrei um amigo depois de muito tempo."),
("昨日は十年ぶりの大雪だった。", "きのうはじゅうねんぶりのおおゆきだった。", "Ontem foi a maior nevasca em dez anos."),
("一週間ぶりに雨が降った。", "いっしゅうかんぶりにあめがふった。", "Choveu pela primeira vez em uma semana."),
("五年ぶりに会った彼は、全然変わっていなかった。", "ごねんぶりにあったかれは、ぜんぜんかわっていなかった。", "Encontrei-o depois de cinco anos, e ele não tinha mudado nada."),
],
R=[
("二年____日本へ行きました。", "Fui ao Japão pela primeira vez em dois anos.", ["ぶりに"]),
("久し____、いい天気ですね。", "Finalmente, depois de muito tempo, um dia bonito, né?", ["ぶりに"]),
("三か月____髪を切りました。", "Cortei o cabelo pela primeira vez em três meses.", ["ぶりに"]),
("あの二人にとって、二十年____の再会でした。", "Para aqueles dois, foi um reencontro depois de vinte anos.", ["ぶり"]),
("一か月____に家族と食事をした。", "Jantei com a família pela primeira vez em um mês.", ["ぶり"]),
],
),
dict(
n=15,
jp="〜中（ちゅう・じゅう）",
rd="chuu / juu",
tr="Durante / Em andamento / O... inteiro / Por todo",
ex="""中 é um sufixo com dois sentidos principais, e a leitura muda conforme o uso.

Lido ちゅう, ele indica que algo está em andamento ou que algo acontece durante um período. Por exemplo, 会議中 (em reunião), 電話中 (ao telefone), 工事中 (em obras). Também indica um prazo: 今週中に significa "dentro desta semana".

Lido じゅう, ele indica "inteiro" ou "por todo". Com tempo, significa "o tempo todo": 一日中 (o dia inteiro). Com lugares, significa "por todo o lugar": 世界中 (no mundo inteiro).

A leitura depende da palavra que vem antes, e muitas combinações já são fixas no vocabulário.""",
st="""Substantivo de ação + 中 (ちゅう): em andamento (会議中 / 電話中 / 授業中)
Período + 中 (ちゅう) + に: dentro do prazo (今週中に / 今日中に)
Período + 中 (じゅう): o tempo todo (一日中 / 一年中 / 一晩中)
Lugar + 中 (じゅう): por todo o lugar (世界中 / 日本中 / 町中)""",
no="""Algumas palavras admitem as duas leituras com sentidos diferentes: 今日中 lido きょうじゅう significa "ainda hoje", com a ideia de prazo, e é a leitura mais comum.

Em placas, 営業中 (aberto) e 準備中 (em preparação) são muito comuns em lojas e restaurantes.

Para "dentro de" um espaço físico, usa-se の中 (なか), e não esse sufixo.""",
bf="中",
rx="中",
tk=["中"],
va=["中", "ちゅう", "じゅう"],
E=[
("会議中は携帯電話を切ってください。", "かいぎちゅうはけいたいでんわをきってください。", "Durante a reunião, desliguem o celular."),
("すみません、父は今、電話中です。", "すみません、ちちはいま、でんわちゅうです。", "Desculpe, meu pai está ao telefone agora."),
("昨日は一日中雨が降っていた。", "きのうはいちにちじゅうあめがふっていた。", "Ontem choveu o dia inteiro."),
("この歌は世界中で人気がある。", "このうたはせかいじゅうでにんきがある。", "Esta música é popular no mundo inteiro."),
("今週中にレポートを出してください。", "こんしゅうちゅうにレポートをだしてください。", "Entregue o relatório até o fim desta semana."),
],
R=[
("授業____は静かにしてください。", "Durante a aula, fiquem em silêncio.", ["中"]),
("夏休み____、ずっとアルバイトをしていた。", "Durante as férias de verão, trabalhei meio período o tempo todo.", ["中"]),
("このエレベーターは今、点検____です。", "Este elevador está em inspeção agora.", ["中"]),
("一晩____、赤ちゃんが泣いていた。", "O bebê chorou a noite inteira.", ["中"]),
("今月____に引っ越しを終わらせたい。", "Quero terminar a mudança ainda este mês.", ["中"]),
],
),
dict(
n=16,
jp="〜だけ（限度）",
rd="dake (gendo)",
tr="O máximo possível / Tudo o que / Tanto quanto",
ex="""No N3, だけ aparece com o sentido de limite máximo, indicando "tudo o que é possível" ou "tanto quanto se quiser". É diferente do だけ do N5, que significa "só".

Os usos mais comuns são:
• できるだけ: "o máximo possível", "sempre que possível".
• 好きなだけ / 〜たいだけ: "o quanto quiser".
• Verbo + だけ + mesmo verbo: "fazer tudo o que dá", como em やるだけやった (fiz tudo o que podia).
• Verbo potencial + だけ: "tudo o que é possível", como em 持てるだけ (tudo o que dá para carregar).

Com の, だけ pode vir antes de um substantivo: 持てるだけの荷物.

A ideia comum é chegar ao limite: fazer ou aproveitar tudo até onde é possível ou desejado.""",
st="""できるだけ + Verbo / Advérbio
好きな / Verbo たい + だけ + Verbo
Verbo (dicionário) + だけ + Verbo (passado)
Verbo potencial + だけ (の + Substantivo)""",
no="""できるだけ e なるべく têm sentido parecido. できるだけ soa um pouco mais enfático.

A expressão やるだけやってみる significa "tentar dar o máximo de si" e é muito usada antes de desafios.

Esse uso de だけ é positivo ou neutro, sem a ideia de "só isso" do N5.""",
bf="だけ",
rx="だけ",
tk=["だけ"],
va=["だけ", "できるだけ", "好きなだけ"],
E=[
("明日は、できるだけ早く来てください。", "あしたは、できるだけはやくきてください。", "Amanhã, venha o mais cedo possível."),
("好きなだけ食べていいですよ。", "すきなだけたべていいですよ。", "Pode comer o quanto quiser."),
("やるだけやったから、後悔はない。", "やるだけやったから、こうかいはない。", "Fiz tudo o que podia, então não tenho arrependimentos."),
("地震のとき、持てるだけの荷物を持って逃げた。", "じしんのとき、もてるだけのにもつをもってにげた。", "No terremoto, fugi levando toda a bagagem que conseguia carregar."),
("言いたいだけ言って、彼は帰ってしまった。", "いいたいだけいって、かれはかえってしまった。", "Ele disse tudo o que queria e foi embora."),
],
R=[
("できる____毎日運動するようにしています。", "Procuro fazer exercício todo dia, sempre que possível.", ["だけ"]),
("欲しい____持っていってください。", "Leve o quanto quiser.", ["だけ"]),
("結果はわからないけど、やれる____やってみよう。", "Não sei o resultado, mas vamos fazer tudo o que der.", ["だけ"]),
("考えられる____の方法を試した。", "Tentei todos os métodos possíveis.", ["だけ"]),
("泣きたい____泣いたら、すっきりした。", "Chorei o quanto quis e me senti aliviado.", ["だけ"]),
],
),
dict(
n=17,
jp="〜だけでなく",
rd="dake de naku",
tr="Não só... mas também / Além de",
ex="""だけでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio, e a segunda acrescenta outro, geralmente com も.

Por exemplo, "ele fala não só japonês, mas também coreano" ou "este exercício faz bem não só para o corpo, mas também para a mente".

É muito comum na conversa e na escrita. A versão ばかりでなく tem o mesmo sentido, mas soa um pouco mais formal.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.""",
st="""Substantivo + だけでなく、 + … + も
Verbo / Adjetivo い (forma simples) + だけでなく
Adjetivo な + な + だけでなく

Variações: だけではなく / だけじゃなく (fala)""",
no="""Com partículas, だけでなく pode vir depois delas: 東京にだけでなく, ou antes, conforme a frase.

だけじゃなく é a forma mais comum na fala do dia a dia.

Para um tom mais forte, como "não só isso, como até...", usa-se ばかりか, que aparece no N2.""",
bf="だけでなく",
rx="だけでなく|だけではなく|だけじゃなく",
tk=["だけ", "で", "なく"],
va=["だけでなく", "だけではなく", "だけじゃなく"],
E=[
("彼は日本語だけでなく、韓国語も話せる。", "かれはにほんごだけでなく、かんこくごもはなせる。", "Ele fala não só japonês, mas também coreano."),
("この店は料理だけでなく、サービスもいい。", "このみせはりょうりだけでなく、サービスもいい。", "Este restaurante tem não só boa comida, mas também bom atendimento."),
("子供だけでなく、大人もこのゲームに夢中だ。", "こどもだけでなく、おとなもこのゲームにむちゅうだ。", "Não só as crianças, mas também os adultos estão viciados neste jogo."),
("彼女はきれいなだけでなく、頭もいい。", "かのじょはきれいなだけでなく、あたまもいい。", "Ela não só é bonita, como também é inteligente."),
("運動は体だけじゃなく、心にもいい。", "うんどうはからだだけじゃなく、こころにもいい。", "O exercício faz bem não só para o corpo, mas também para a mente."),
],
R=[
("この町は夏____、冬も観光客が多い。", "Esta cidade tem muitos turistas não só no verão, mas também no inverno.", ["だけでなく", "だけではなく", "だけじゃなく"]),
("彼は歌う____、曲も作る。", "Ele não só canta, como também compõe músicas.", ["だけでなく", "だけではなく", "だけじゃなく"]),
("その店は東京____、大阪にもある。", "Essa loja existe não só em Tóquio, mas também em Osaka.", ["だけでなく", "だけではなく", "だけじゃなく"]),
("この部屋は広い____、明るい。", "Este quarto não só é amplo, como também é claro.", ["だけでなく", "だけではなく", "だけじゃなく"]),
("漢字を読む____、書く練習もしましょう。", "Vamos praticar não só a leitura, mas também a escrita dos kanji.", ["だけでなく", "だけではなく", "だけじゃなく"]),
],
),
dict(
n=18,
jp="〜だけど",
rd="da kedo",
tr="Mas / Porém / Só que",
ex="""だけど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "porém". É a combinação de だ (forma simples de です) com けど.

Ele aparece depois de substantivos e adjetivos な, na forma simples. Por exemplo, "hoje é folga, mas vou trabalhar".

Também pode ser usado no começo de uma frase, sozinho, como conjunção: "está chovendo. Mas tenho que sair". Nesse uso, é parecido com でも, porém um pouco mais informal.

Na forma んだけど, ele suaviza pedidos e explicações, como "eu queria ir, mas...", deixando a frase mais delicada.

Por ser casual, だけど é usado em conversas informais. Em situações educadas, usa-se ですが ou ですけど.""",
st="""Substantivo / Adjetivo な + だけど + Frase
Frase 1 (com ponto final) + だけど、 + Frase 2
Frase + んだけど (suavização / introdução de pedido)

Educado: ですが / ですけど""",
no="""だけど no começo da frase é comum na fala, mas, na escrita, prefira でも ou しかし.

A forma んだけど… deixa a frase em aberto e é uma maneira muito natural de começar um pedido ou uma explicação.

だけど soa um pouco mais suave que だが, que é mais formal e literário.""",
bf="だけど",
rx="だけど",
tk=["だ", "けど"],
va=["だけど", "んだけど"],
E=[
("今日は休みだけど、仕事に行きます。", "きょうはやすみだけど、しごとにいきます。", "Hoje é folga, mas vou trabalhar."),
("彼は学生だけど、とても忙しい。", "かれはがくせいだけど、とてもいそがしい。", "Ele é estudante, mas é muito ocupado."),
("この町は静かだけど、少し不便だ。", "このまちはしずかだけど、すこしふべんだ。", "Esta cidade é tranquila, mas um pouco inconveniente."),
("外は雨だ。だけど、出かけなければならない。", "そとはあめだ。だけど、でかけなければならない。", "Lá fora está chovendo. Mas eu tenho que sair."),
("行きたいんだけど、時間がないんだ。", "いきたいんだけど、じかんがないんだ。", "Eu queria ir, mas não tenho tempo."),
],
R=[
("このかばんは便利____、ちょっと重い。", "Esta bolsa é prática, mas um pouco pesada.", ["だけど"]),
("彼女は外国育ちの日本人____、日本語があまり上手じゃない。", "Ela é japonesa criada no exterior, mas não fala japonês muito bem.", ["だけど"]),
("明日は日曜日____、学校に行く。", "Amanhã é domingo, mas vou à escola.", ["だけど"]),
("もう疲れた。____、もう少し頑張ろう。", "Já estou cansado. Mas vamos nos esforçar mais um pouco.", ["だけど"]),
("「その本、借りたいん____。」「いいよ。」", "\"Eu queria pegar esse livro emprestado...\" \"Pode pegar.\"", ["だけど"]),
],
),
dict(
n=19,
jp="〜だらけ",
rd="darake",
tr="Cheio de / Coberto de / Repleto de",
ex="""だらけ é usado para dizer que algo está cheio ou coberto de alguma coisa, geralmente algo indesejado. Equivale a "cheio de", "coberto de" ou "repleto de".

Ele vem diretamente depois de um substantivo. Por exemplo, 泥だらけ (coberto de lama), 間違いだらけ (cheio de erros), ゴミだらけ (cheio de lixo).

O tom é quase sempre negativo ou de reclamação. A ideia é que há uma quantidade excessiva daquilo, a ponto de ser um problema.

だらけ funciona como um substantivo ou adjetivo な: pode ser seguido de です, だ, の, で e になる.""",
st="""Substantivo + だらけ + です / だ
Substantivo + だらけ + の + Substantivo
Substantivo + だらけ + になる
Substantivo + だらけ + で、 + …""",
no="""だらけ não é usado para coisas positivas. Para "cheio de coisas boas", usa-se いっぱい ou 満ちた.

Comparado a ばかり, que indica "só isso", だらけ destaca que algo está coberto ou tomado por aquilo.

Palavras comuns com だらけ são 泥, 傷, 血, ほこり, ゴミ, 間違い e 借金.""",
bf="だらけ",
rx="だらけ",
tk=["だらけ"],
va=["だらけ"],
E=[
("子供は泥だらけになって帰ってきた。", "こどもはどろだらけになってかえってきた。", "A criança voltou para casa coberta de lama."),
("このテストは間違いだらけだ。", "このテストはまちがいだらけだ。", "Esta prova está cheia de erros."),
("部屋がゴミだらけで、足の踏み場もない。", "へやがゴミだらけで、あしのふみばもない。", "O quarto está tão cheio de lixo que não dá nem para pisar."),
("彼の机の上は本だらけだ。", "かれのつくえのうえはほんだらけだ。", "A mesa dele está cheia de livros."),
("転んで、足が傷だらけになった。", "ころんで、あしがきずだらけになった。", "Caí e fiquei com a perna cheia de machucados."),
],
R=[
("雨の中でサッカーをして、服が泥____になった。", "Joguei futebol na chuva e minha roupa ficou coberta de lama.", ["だらけ"]),
("この作文は間違い____ですね。", "Esta redação está cheia de erros, hein.", ["だらけ"]),
("長い間掃除していないので、部屋がほこり____だ。", "Faz muito tempo que não limpo, e o quarto está cheio de poeira.", ["だらけ"]),
("父の手は長年の仕事で傷____だ。", "As mãos do meu pai estão cheias de cicatrizes de anos de trabalho.", ["だらけ"]),
("借金____の生活は大変だ。", "Uma vida cheia de dívidas é difícil.", ["だらけ"]),
],
),
dict(
n=20,
jp="どんなに〜ても",
rd="donna ni ~ te mo",
tr="Por mais que / Não importa o quanto",
ex="""どんなに〜ても é usado para dizer que o resultado não muda, por maior que seja o esforço ou a intensidade de algo. Equivale a "por mais que" ou "não importa o quanto".

どんなに vem no começo, indicando um grau extremo, e o verbo ou adjetivo vai para a forma ても.

A segunda parte pode mostrar determinação ("por mais ocupado que esteja, escrevo meu diário") ou frustração ("por mais que pratique, não melhoro").

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.""",
st="""どんなに + Verbo na forma て + も
どんなに + Adjetivo い sem い + くても
どんなに + Adjetivo な / Substantivo + でも""",
no="""いくら〜ても tem o mesmo sentido e também é muito comum. いくら é usado com frequência para quantidades e esforço repetido.

A segunda parte não muda por causa da primeira. Por isso, frases com どんなに〜ても costumam expressar persistência ou impossibilidade.

Na escrita, também aparece たとえ〜ても, que destaca uma hipótese ("mesmo que").""",
bf="どんなに",
rx="どんなに",
tk=["どんなに", "ても"],
va=["どんなに〜ても"],
E=[
("どんなに忙しくても、毎日日記を書いています。", "どんなにいそがしくても、まいにちにっきをかいています。", "Por mais ocupado que eu esteja, escrevo meu diário todo dia."),
("どんなに練習しても、上手にならない。", "どんなにれんしゅうしても、じょうずにならない。", "Por mais que eu pratique, não melhoro."),
("どんなに高くても、この時計が欲しい。", "どんなにたかくても、このとけいがほしい。", "Por mais caro que seja, quero este relógio."),
("どんなに疲れていても、彼は笑顔を忘れない。", "どんなにつかれていても、かれはえがおをわすれない。", "Por mais cansado que esteja, ele nunca deixa de sorrir."),
("どんなに頼んでも、彼は許してくれなかった。", "どんなにたのんでも、かれはゆるしてくれなかった。", "Por mais que eu implorasse, ele não me perdoou."),
],
R=[
("____雨が強くても、試合は行われます。", "Por mais forte que seja a chuva, a partida será realizada.", ["どんなに"]),
("____勉強しても、この問題はわからない。", "Por mais que eu estude, não entendo esta questão.", ["どんなに"]),
("____遠くても、会いに行きます。", "Por mais longe que seja, vou te ver.", ["どんなに"]),
("____謝っても、彼女は許してくれない。", "Por mais que eu peça desculpas, ela não me perdoa.", ["どんなに"]),
("____つらくても、あきらめないでください。", "Por mais difícil que seja, não desista.", ["どんなに"]),
],
),
]
