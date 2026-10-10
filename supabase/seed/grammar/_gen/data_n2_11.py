G = [
dict(
n=101,
jp="〜に先立ち",
rd="ni sakidachi",
tr="Antes de / Previamente a / Em preparação para",
ex="""に先立ち indica que algo é feito antes de um acontecimento importante, como preparação. Equivale a "antes de" ou "previamente a".

É usado em situações formais, como eventos, lançamentos, cerimônias ou reuniões. Por exemplo, "antes do lançamento, foi feita uma apresentação para a imprensa".

A forma に先立って tem o mesmo sentido.""",
st="""Substantivo + に先立ち / に先立って
Verbo (forma dicionário) + に先立ち / に先立って
Substantivo + に先立つ + Substantivo""",
no="""É mais formal que の前に e aparece muito em notícias e anúncios.

A forma に先立つ vem antes de substantivos, como 試合に先立つ練習.""",
bf="に先立ち",
rx="に先立ち|に先立って|に先立つ|にさきだち|にさきだって",
tk=["に", "先立ち"],
va=["に先立ち", "に先立って", "に先立つ"],
E=[
("新商品の発売に先立ち、記者会見が行われた。", "しんしょうひんのはつばいにさきだち、きしゃかいけんがおこなわれた。", "Antes do lançamento do novo produto, foi realizada uma coletiva de imprensa."),
("試合に先立って、開会式が行われた。", "しあいにさきだって、かいかいしきがおこなわれた。", "Antes da partida, foi realizada a cerimônia de abertura."),
("工事を始めるに先立ち、住民への説明会を開いた。", "こうじをはじめるにさきだち、じゅうみんへのせつめいかいをひらいた。", "Antes de começar a obra, fizemos uma reunião de esclarecimento para os moradores."),
("出発に先立って、全員の荷物を確認した。", "しゅっぱつにさきだって、ぜんいんのにもつをかくにんした。", "Antes da partida, conferimos a bagagem de todos."),
("映画の公開に先立ち、試写会が開かれた。", "えいがのこうかいにさきだち、ししゃかいがひらかれた。", "Antes da estreia do filme, houve uma sessão de pré-estreia."),
],
R=[
("会議____、資料を配った。", "Antes da reunião, distribuímos os materiais.", ["に先立ち", "に先立って", "にさきだち", "にさきだって"]),
("留学する____、ビザを取った。", "Antes de estudar no exterior, tirei o visto.", ["に先立ち", "に先立って", "にさきだち", "にさきだって"]),
("新店舗のオープン____、記念イベントを行う。", "Antes da inauguração da nova loja, faremos um evento comemorativo.", ["に先立ち", "に先立って", "にさきだち", "にさきだって"]),
("手術____、医師から説明を受けた。", "Antes da cirurgia, recebi explicações do médico.", ["に先立ち", "に先立って", "にさきだち", "にさきだって"]),
("選挙____、候補者の討論会が開かれた。", "Antes da eleição, foi realizado um debate entre os candidatos.", ["に先立ち", "に先立って", "にさきだち", "にさきだって"]),
],
),
dict(
n=102,
jp="〜にせよ / 〜にしろ",
rd="ni seyo / ni shiro",
tr="Mesmo que / Ainda que / Seja como for",
ex="""にせよ e にしろ indicam que, mesmo aceitando uma situação, a conclusão não muda. Equivale a "mesmo que" ou "ainda que".

Por exemplo, "mesmo que esteja ocupado, devia pelo menos ligar". A pessoa reconhece a situação, mas mantém sua opinião.

Também aparecem com palavras interrogativas, como いずれにせよ ou 何にしろ, com o sentido de "seja como for".""",
st="""Verbo (forma simples) + にせよ / にしろ
Adjetivo い + にせよ / にしろ
Adjetivo な / Substantivo + (である) + にせよ / にしろ
Palavra interrogativa + にせよ / にしろ""",
no="""São parecidos com としても e にしても, mas mais formais.

にしろ é um pouco mais comum na fala, e にせよ é mais comum na escrita.

いずれにせよ é uma expressão muito usada para encerrar uma discussão.""",
bf="にせよ",
rx="にせよ|にしろ",
tk=["に", "せよ"],
va=["にせよ", "にしろ", "いずれにせよ", "何にしろ"],
E=[
("忙しいにせよ、電話くらいはできるだろう。", "いそがしいにせよ、でんわくらいはできるだろう。", "Mesmo ocupado, pelo menos um telefonema dá para fazer."),
("冗談にしろ、そんなことを言うべきではない。", "じょうだんにしろ、そんなことをいうべきではない。", "Mesmo que seja brincadeira, não se deve dizer uma coisa dessas."),
("いずれにせよ、明日までに決めなければならない。", "いずれにせよ、あしたまでにきめなければならない。", "Seja como for, temos que decidir até amanhã."),
("どんな理由があるにせよ、暴力は許されない。", "どんなりゆうがあるにせよ、ぼうりょくはゆるされない。", "Seja qual for o motivo, a violência não é perdoável."),
("何にしろ、無事でよかった。", "なんにしろ、ぶじでよかった。", "Seja como for, que bom que está tudo bem."),
],
R=[
("たとえ少額____、借りたお金は返すべきだ。", "Mesmo que seja pouco, dinheiro emprestado deve ser devolvido.", ["にせよ", "にしろ"]),
("行く____行かないにせよ、早く連絡して。", "Indo ou não, me avise logo.", ["にせよ", "にしろ"]),
("いずれ____、もう一度話し合いましょう。", "Seja como for, vamos conversar mais uma vez.", ["にせよ", "にしろ"]),
("知らなかった____、責任は取るべきだ。", "Mesmo que não soubesse, deve assumir a responsabilidade.", ["にせよ", "にしろ"]),
("誰が来る____、準備はしておこう。", "Seja quem for que venha, vamos deixar tudo preparado.", ["にせよ", "にしろ"]),
],
),
dict(
n=103,
jp="〜にしろ〜にしろ",
rd="ni shiro ~ ni shiro",
tr="Seja... seja / Quer... quer / Tanto... quanto",
ex="""にしろ〜にしろ apresenta duas opções ou dois exemplos e mostra que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "quer... quer".

Por exemplo, "seja de trem, seja de ônibus, leva uma hora" ou "indo ou não indo, avise".

A forma にせよ〜にせよ tem o mesmo sentido e é mais formal.""",
st="""Substantivo + にしろ + Substantivo + にしろ
Verbo + にしろ + Verbo (forma ない) + にしろ
Substantivo + にせよ + Substantivo + にせよ""",
no="""Os dois elementos costumam ser opostos ou do mesmo grupo.

É parecido com にしても〜にしても, que é mais comum na fala.""",
bf="にしろ〜にしろ",
rx="にしろ|にせよ",
tk=["に", "しろ"],
va=["にしろ〜にしろ", "にせよ〜にせよ"],
E=[
("電車にしろバスにしろ、一時間はかかる。", "でんしゃにしろバスにしろ、いちじかんはかかる。", "Seja de trem, seja de ônibus, leva uma hora."),
("行くにしろ行かないにしろ、連絡してください。", "いくにしろいかないにしろ、れんらくしてください。", "Indo ou não, entre em contato."),
("賛成にせよ反対にせよ、意見を言ってください。", "さんせいにせよはんたいにせよ、いけんをいってください。", "Sendo a favor ou contra, dê a sua opinião."),
("肉にしろ魚にしろ、新鮮なものがいい。", "にくにしろさかなにしろ、しんせんなものがいい。", "Seja carne, seja peixe, o bom é que seja fresco."),
("勝つにしろ負けるにしろ、全力を尽くそう。", "かつにしろまけるにしろ、ぜんりょくをつくそう。", "Ganhando ou perdendo, vamos dar o nosso melhor."),
],
R=[
("大人____子供にしろ、ルールは守らなければならない。", "Seja adulto, seja criança, é preciso seguir as regras.", ["にしろ", "にせよ"]),
("買う____買わないにしろ、一度見てみよう。", "Comprando ou não, vamos dar uma olhada.", ["にしろ", "にせよ"]),
("日本語にしろ英語____、毎日の練習が大切だ。", "Seja japonês, seja inglês, a prática diária é importante.", ["にしろ", "にせよ"]),
("好き____嫌いにせよ、この仕事はやるしかない。", "Gostando ou não, não há outra saída senão fazer este trabalho.", ["にせよ", "にしろ"]),
("雨____雪にしろ、試合は中止だ。", "Seja chuva, seja neve, a partida está cancelada.", ["にしろ", "にせよ"]),
],
),
dict(
n=104,
jp="〜にしたら",
rd="ni shitara",
tr="Para / Do ponto de vista de / Na posição de",
ex="""にしたら indica o ponto de vista de uma pessoa ou grupo. Equivale a "para" ou "do ponto de vista de".

A pessoa que fala imagina como o outro se sente ou pensa em determinada situação. Por exemplo, "para os pais, o filho é sempre criança".

As formas にすれば e にしてみれば têm o mesmo sentido.""",
st="""Substantivo (pessoa / grupo) + にしたら
Substantivo + にすれば / にしてみれば""",
no="""Só se usa com pessoas ou grupos de pessoas, não com coisas.

Não se usa para falar do próprio ponto de vista. Para isso, usa-se 私としては.

É parecido com の立場からすると.""",
bf="にしたら",
rx="にしたら|にすれば|にしてみれば|にしてみたら",
tk=["に", "したら"],
va=["にしたら", "にすれば", "にしてみれば", "にしてみたら"],
E=[
("親にしたら、子供はいくつになっても子供だ。", "おやにしたら、こどもはいくつになってもこどもだ。", "Para os pais, o filho é sempre criança, não importa a idade."),
("彼にすれば、それは当然のことだったのだろう。", "かれにすれば、それはとうぜんのことだったのだろう。", "Para ele, isso provavelmente era algo natural."),
("客にしてみれば、待たされるのは迷惑だ。", "きゃくにしてみれば、またされるのはめいわくだ。", "Para o cliente, ter que esperar é um incômodo."),
("先生にしたら、静かな学生のほうが楽だろう。", "せんせいにしたら、しずかながくせいのほうがらくだろう。", "Para o professor, alunos quietos devem ser mais fáceis."),
("子供にしたら、毎日の塾はつらいはずだ。", "こどもにしたら、まいにちのじゅくはつらいはずだ。", "Para uma criança, cursinho todo dia deve ser difícil."),
],
R=[
("犬____、散歩は一番楽しい時間なのだろう。", "Para um cachorro, o passeio deve ser o momento mais divertido.", ["にしたら", "にすれば", "にしてみれば"]),
("社長____、社員の気持ちはわからないかもしれない。", "Para o presidente, talvez seja difícil entender o sentimento dos funcionários.", ["にしたら", "にすれば", "にしてみれば"]),
("近所の人____、夜の騒音は困るだろう。", "Para os vizinhos, o barulho à noite deve ser um problema.", ["にしたら", "にすれば", "にしてみれば"]),
("学生____、この宿題は多すぎる。", "Para os alunos, esta lição de casa é demais.", ["にしたら", "にすれば", "にしてみれば"]),
("彼女____、あの言葉はショックだったはずだ。", "Para ela, aquelas palavras devem ter sido um choque.", ["にしたら", "にすれば", "にしてみれば"]),
],
),
dict(
n=105,
jp="〜にしても",
rd="ni shite mo",
tr="Mesmo que / Ainda assim / Mesmo para",
ex="""にしても indica que, mesmo aceitando uma situação, existe algo que não combina ou que continua sendo um problema. Equivale a "mesmo que" ou "ainda assim".

A pessoa admite um fato, mas mostra sua insatisfação ou dúvida. Por exemplo, "mesmo que estivesse ocupado, podia ter avisado".

Também pode indicar um exemplo que representa um grupo, com o sentido de "mesmo para...". Por exemplo, "mesmo para mim, isso é difícil".""",
st="""Verbo (forma simples) + にしても
Adjetivo い + にしても
Adjetivo な / Substantivo + (である) + にしても""",
no="""É parecido com にせよ e にしろ, mas にしても é mais comum na fala.

A expressão それにしても aparece no começo de frase com o sentido de "mesmo assim" ou "de qualquer forma".""",
bf="にしても",
rx="にしても",
tk=["に", "しても"],
va=["にしても", "それにしても"],
E=[
("忙しかったにしても、連絡くらいできたはずだ。", "いそがしかったにしても、れんらくくらいできたはずだ。", "Mesmo ocupado, você podia pelo menos ter avisado."),
("冗談にしても、言っていいことと悪いことがある。", "じょうだんにしても、いっていいこととわるいことがある。", "Mesmo sendo brincadeira, há coisas que se pode e não se pode dizer."),
("安いにしても、この品質ではだめだ。", "やすいにしても、このひんしつではだめだ。", "Mesmo sendo barato, com esta qualidade não serve."),
("私にしても、この問題は難しい。", "わたしにしても、このもんだいはむずかしい。", "Mesmo para mim, este problema é difícil."),
("遅れるにしても、一言言ってほしかった。", "おくれるにしても、ひとこといってほしかった。", "Mesmo que fosse se atrasar, queria que tivesse avisado."),
],
R=[
("子供のいたずら____、ひどすぎる。", "Mesmo sendo travessura de criança, passou dos limites.", ["にしても"]),
("初めて____、こんなミスはしないだろう。", "Mesmo sendo a primeira vez, ninguém cometeria um erro desses.", ["にしても"]),
("行かない____、返事はしておこう。", "Mesmo que não vá, vou pelo menos responder.", ["にしても"]),
("高い____、これは買う価値がある。", "Mesmo sendo caro, vale a pena comprar.", ["にしても"]),
("急いでいた____、走らないで。", "Mesmo com pressa, não corra.", ["にしても"]),
],
),
dict(
n=106,
jp="〜に沿って",
rd="ni sotte",
tr="Ao longo de / De acordo com / Seguindo",
ex="""に沿って tem dois usos principais.

O primeiro indica que algo segue ao longo de uma linha física, como um rio, uma rua ou uma linha de trem. Equivale a "ao longo de". Por exemplo, "andei ao longo do rio".

O segundo indica que algo é feito de acordo com um plano, uma regra, um desejo ou uma orientação. Equivale a "de acordo com" ou "seguindo". Por exemplo, "vamos seguir o manual".""",
st="""Substantivo + に沿って + Verbo
Substantivo + に沿った + Substantivo
Substantivo + に沿い""",
no="""No segundo uso, é parecido com に基づいて e に従って.

A forma に沿った vem antes de substantivos, como 希望に沿った商品.""",
bf="に沿って",
rx="に沿って|に沿い|に沿った|にそって",
tk=["に", "沿って"],
va=["に沿って", "に沿い", "に沿った", "にそって"],
E=[
("川に沿って、桜の木が並んでいる。", "かわにそって、さくらのきがならんでいる。", "Ao longo do rio, há cerejeiras enfileiradas."),
("この道に沿ってまっすぐ行くと、駅があります。", "このみちにそってまっすぐいくと、えきがあります。", "Seguindo reto por esta rua, você encontra a estação."),
("マニュアルに沿って作業を進めてください。", "マニュアルにそってさぎょうをすすめてください。", "Faça o trabalho de acordo com o manual."),
("お客様の希望に沿ったプランを用意しました。", "おきゃくさまのきぼうにそったプランをよういしました。", "Preparamos um plano de acordo com o desejo do cliente."),
("線路に沿い、細い道が続いている。", "せんろにそい、ほそいみちがつづいている。", "Uma rua estreita segue ao longo da linha do trem."),
],
R=[
("海岸____、ホテルが建っている。", "Ao longo da costa, há hotéis construídos.", ["に沿って", "に沿い", "にそって"]),
("計画____、工事を進める。", "A obra segue de acordo com o plano.", ["に沿って", "に沿い", "にそって"]),
("会社の方針____行動してください。", "Aja de acordo com a política da empresa.", ["に沿って", "に沿い", "にそって"]),
("この線____紙を切ってください。", "Corte o papel seguindo esta linha.", ["に沿って", "に沿い", "にそって"]),
("ご要望____、内容を変更いたしました。", "Atendendo ao seu pedido, alteramos o conteúdo.", ["に沿って", "に沿い", "にそって"]),
],
),
dict(
n=107,
jp="〜に相違ない",
rd="ni soui nai",
tr="Sem dúvida / Com certeza / Não há dúvida de que",
ex="""に相違ない expressa uma certeza forte, baseada em algum motivo. Equivale a "sem dúvida" ou "não há dúvida de que".

Tem o mesmo sentido de に違いない, mas é mais formal e mais usado na escrita, em documentos e em textos sérios.

Por exemplo, "o culpado é, sem dúvida, aquele homem".""",
st="""Verbo (forma simples) + に相違ない
Adjetivo い + に相違ない
Adjetivo な / Substantivo + に相違ない""",
no="""Na fala do dia a dia, usa-se mais に違いない.

A forma に相違ありません é ainda mais formal, usada em declarações e documentos oficiais.""",
bf="に相違ない",
rx="に相違ない|に相違ありません|にそういない",
tk=["に", "相違", "ない"],
va=["に相違ない", "に相違ありません"],
E=[
("犯人はあの男に相違ない。", "はんにんはあのおとこにそういない。", "O culpado é, sem dúvida, aquele homem."),
("彼の話は本当に相違ない。", "かれのはなしはほんとうにそういない。", "Não há dúvida de que a história dele é verdadeira."),
("この作品は有名な画家が描いたものに相違ない。", "このさくひんはゆうめいながかがかいたものにそういない。", "Esta obra, sem dúvida, foi pintada por um pintor famoso."),
("上記の内容に相違ありません。", "じょうきのないようにそういありません。", "O conteúdo acima está correto, sem dúvida."),
("彼女は今ごろ心配しているに相違ない。", "かのじょはいまごろしんぱいしているにそういない。", "Com certeza ela está preocupada agora."),
],
R=[
("この計画は成功する____。", "Este plano, sem dúvida, vai dar certo.", ["に相違ない", "に相違ありません"]),
("彼が書いた手紙____。", "Não há dúvida de que é uma carta escrita por ele.", ["に相違ない", "に相違ありません"]),
("あの店の料理はおいしい____。", "A comida daquela loja com certeza é gostosa.", ["に相違ない", "に相違ありません"]),
("彼は何かを隠している____。", "Sem dúvida ele está escondendo alguma coisa.", ["に相違ない", "に相違ありません"]),
("これは事実____。", "Isto, sem dúvida, é um fato.", ["に相違ない", "に相違ありません"]),
],
),
dict(
n=108,
jp="〜に過ぎない",
rd="ni suginai",
tr="Não passa de / É apenas / Não é mais que",
ex="""に過ぎない indica que algo não é tão importante ou não vai além de um certo nível. Equivale a "não passa de" ou "é apenas".

A pessoa diminui a importância de algo, seja por modéstia, seja para mostrar que é pouco. Por exemplo, "isso não passa de um boato" ou "sou apenas um estudante".

É uma expressão um pouco formal, usada tanto na fala quanto na escrita.""",
st="""Substantivo + に過ぎない
Verbo (forma simples) + に過ぎない
Número / Quantidade + に過ぎない""",
no="""É parecido com だけだ, mas に過ぎない é mais formal e tem um tom mais forte de "pouco".

Não se confunde com にほかならない, que reforça em vez de diminuir.""",
bf="に過ぎない",
rx="に過ぎない|にすぎない|に過ぎません|にすぎません|に過ぎなかった|にすぎなかった",
tk=["に", "過ぎない"],
va=["に過ぎない", "にすぎない", "に過ぎません", "に過ぎなかった"],
E=[
("それはただのうわさに過ぎない。", "それはただのうわさにすぎない。", "Isso não passa de um boato."),
("私はただの学生に過ぎません。", "わたしはただのがくせいにすぎません。", "Sou apenas um estudante."),
("参加者はわずか十人にすぎなかった。", "さんかしゃはわずかじゅうにんにすぎなかった。", "Os participantes não passaram de dez pessoas."),
("彼の言うことは言い訳に過ぎない。", "かれのいうことはいいわけにすぎない。", "O que ele diz não passa de desculpa."),
("これは問題の一部にすぎない。", "これはもんだいのいちぶにすぎない。", "Isto é apenas uma parte do problema."),
],
R=[
("それはあなたの想像____。", "Isso não passa da sua imaginação.", ["に過ぎない", "にすぎない", "に過ぎません", "にすぎません"]),
("私は自分の仕事をした____。", "Eu apenas fiz o meu trabalho.", ["に過ぎない", "にすぎない", "に過ぎません", "にすぎません"]),
("合格したのは全体の一割____。", "Os aprovados não passaram de dez por cento do total.", ["に過ぎない", "にすぎない", "に過ぎなかった", "にすぎなかった"]),
("この案はまだ計画の段階____。", "Esta proposta ainda é apenas uma fase de planejamento.", ["に過ぎない", "にすぎない", "に過ぎません", "にすぎません"]),
("彼の優しさは見せかけ____。", "A gentileza dele não passa de fachada.", ["に過ぎない", "にすぎない", "に過ぎません", "にすぎません"]),
],
),
dict(
n=109,
jp="〜に伴って",
rd="ni tomonatte",
tr="Junto com / À medida que / Com",
ex="""に伴って indica que uma mudança acontece junto com outra. Equivale a "junto com", "à medida que" ou "com".

A primeira parte mostra uma mudança ou um acontecimento, e a segunda mostra o que muda por causa disso. Por exemplo, "com o aumento da população, o trânsito também piorou".

É uma expressão formal, muito usada em notícias, relatórios e textos sobre mudanças sociais.""",
st="""Substantivo + に伴って / に伴い
Verbo (forma dicionário) + の + に伴って / に伴い
Substantivo + に伴う + Substantivo""",
no="""É parecido com につれて e とともに.

Costuma vir com palavras que indicam mudança, como 増加, 発展, 変化 e 高齢化.

A forma に伴う vem antes de substantivos, como 台風に伴う被害.""",
bf="に伴って",
rx="に伴って|に伴い|に伴う|にともなって|にともない",
tk=["に", "伴って"],
va=["に伴って", "に伴い", "に伴う"],
E=[
("人口の増加に伴って、交通渋滞がひどくなった。", "じんこうのぞうかにともなって、こうつうじゅうたいがひどくなった。", "Com o aumento da população, o trânsito piorou."),
("経済の発展に伴い、生活が豊かになった。", "けいざいのはってんにともない、せいかつがゆたかになった。", "Junto com o desenvolvimento econômico, a vida ficou mais próspera."),
("台風に伴う大雨で、川が増水した。", "たいふうにともなうおおあめで、かわがぞうすいした。", "Com a chuva forte trazida pelo tufão, o rio encheu."),
("年をとるのに伴って、体力が落ちてきた。", "としをとるのにともなって、たいりょくがおちてきた。", "À medida que envelheço, a minha resistência física vem caindo."),
("会社の移転に伴い、住所が変わります。", "かいしゃのいてんにともない、じゅうしょがかわります。", "Com a mudança da empresa, o endereço vai mudar."),
],
R=[
("高齢化____、医療費が増えている。", "Com o envelhecimento da população, os gastos com saúde estão aumentando.", ["に伴って", "に伴い", "にともなって", "にともない"]),
("技術の進歩____、仕事のやり方も変わった。", "Junto com o avanço da tecnologia, a forma de trabalhar também mudou.", ["に伴って", "に伴い", "にともなって", "にともない"]),
("気温の上昇____、海の水位も上がっている。", "À medida que a temperatura sobe, o nível do mar também está subindo.", ["に伴って", "に伴い", "にともなって", "にともない"]),
("工事____、この道は通行止めになります。", "Por causa da obra, esta rua ficará interditada.", ["に伴って", "に伴い", "にともなって", "にともない"]),
("店の拡大____、従業員を増やした。", "Com a ampliação da loja, aumentamos o número de funcionários.", ["に伴って", "に伴い", "にともなって", "にともない"]),
],
),
dict(
n=110,
jp="〜につけ",
rd="ni tsuke",
tr="Sempre que / Toda vez que / Seja... seja",
ex="""につけ indica que, sempre que algo acontece, surge naturalmente um sentimento ou uma lembrança. Equivale a "sempre que" ou "toda vez que".

Costuma vir com verbos como ver, ouvir e pensar, e a segunda parte fala de emoções ou lembranças. Por exemplo, "toda vez que vejo esta foto, lembro da minha infância".

Na forma 〜につけ〜につけ, apresenta duas situações opostas com o sentido de "seja... seja". Por exemplo, "nas coisas boas e nas ruins".""",
st="""Verbo (forma dicionário) + につけ
Adjetivo い + につけ + Adjetivo い + につけ
Substantivo + につけ + Substantivo + につけ""",
no="""A expressão 何かにつけ significa "por qualquer motivo" ou "a todo momento".

É parecido com たびに, mas につけ destaca mais os sentimentos que surgem.

Expressões comuns são いいにつけ悪いにつけ e 雨につけ風につけ.""",
bf="につけ",
rx="につけ",
tk=["に", "つけ"],
va=["につけ", "につけて", "何かにつけ"],
E=[
("この写真を見るにつけ、子供のころを思い出す。", "このしゃしんをみるにつけ、こどものころをおもいだす。", "Toda vez que vejo esta foto, lembro da minha infância."),
("彼の話を聞くにつけ、自分の甘さを感じる。", "かれのはなしをきくにつけ、じぶんのあまさをかんじる。", "Sempre que ouço a história dele, percebo como sou acomodado."),
("いいにつけ悪いにつけ、親の影響は大きい。", "いいにつけわるいにつけ、おやのえいきょうはおおきい。", "Seja para o bem, seja para o mal, a influência dos pais é grande."),
("母は何かにつけて、私のことを心配する。", "はははなにかにつけて、わたしのことをしんぱいする。", "Minha mãe se preocupa comigo a todo momento."),
("ニュースを見るにつけ、平和の大切さを考える。", "ニュースをみるにつけ、へいわのたいせつさをかんがえる。", "Toda vez que vejo o noticiário, penso na importância da paz."),
],
R=[
("この曲を聞く____、昔の恋人を思い出す。", "Toda vez que ouço esta música, lembro do meu antigo namorado.", ["につけ", "につけて"]),
("嬉しいにつけ悲しい____、彼はいつも日記を書く。", "Feliz ou triste, ele sempre escreve no diário.", ["につけ"]),
("彼女の活躍を見る____、勇気をもらう。", "Sempre que vejo o sucesso dela, ganho coragem.", ["につけ", "につけて"]),
("父は何か____、文句を言う。", "Meu pai reclama de qualquer coisa.", ["につけ", "につけて"]),
("故郷の話を聞く____、帰りたくなる。", "Toda vez que ouço falar da minha terra natal, dá vontade de voltar.", ["につけ", "につけて"]),
],
),
]
