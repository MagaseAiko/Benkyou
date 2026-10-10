G = [
dict(
n=51,
jp="〜ことはない",
rd="koto wa nai",
tr="Não precisa / Não há necessidade de",
ex="""ことはない é usado para dizer que não há necessidade de fazer algo. Equivale a "não precisa" ou "não há necessidade de".

Ele vem depois do verbo na forma de dicionário. A ideia é tranquilizar ou aconselhar alguém, mostrando que aquela ação, preocupação ou esforço é desnecessário.

Por exemplo, "não precisa se preocupar", "não precisa vir até aqui" ou "não precisa pedir desculpas".

Comparado a なくてもいい, ことはない soa mais firme e muitas vezes carrega um tom de consolo ou encorajamento. Ele é muito usado para animar alguém que está preocupado ou se culpando à toa.""",
st="""Verbo na forma de dicionário + ことはない
Verbo + ことはありません (educado)

Com わざわざ / そんなに: わざわざ〜ことはない (não precisa se dar ao trabalho de...)""",
no="""Não confunda com たことはない (nunca fiz), que usa a forma た e fala de experiência.

ことはない aparece muito junto com わざわざ, そんなに e 何も, reforçando que a ação é desnecessária.

Em níveis mais avançados, ないことはない significa "não é que não...", com sentido bem diferente.""",
bf="ことはない",
rx="ことはない|ことはありません|こともない",
tk=["こと", "は", "ない"],
va=["ことはない", "ことはありません", "こともない"],
E=[
("大丈夫だから、心配することはないよ。", "だいじょうぶだから、しんぱいすることはないよ。", "Está tudo bem, não precisa se preocupar."),
("メールで十分ですから、わざわざ来ることはありません。", "メールでじゅうぶんですから、わざわざくることはありません。", "Um e-mail basta, não precisa se dar ao trabalho de vir."),
("まだ時間があるから、そんなに急ぐことはない。", "まだじかんがあるから、そんなにいそぐことはない。", "Ainda temos tempo, não precisa ter tanta pressa."),
("謝ることはないよ。君は悪くない。", "あやまることはないよ。きみはわるくない。", "Não precisa pedir desculpas. Você não tem culpa."),
("小さな失敗で落ち込むことはない。", "ちいさなしっぱいでおちこむことはない。", "Não precisa ficar desanimado por causa de um errinho."),
],
R=[
("簡単な試験だから、緊張する____。", "A prova é fácil, não precisa ficar nervoso.", ["ことはない", "ことはありません"]),
("電話で済むなら、わざわざ行く____。", "Se dá para resolver por telefone, não precisa ir até lá.", ["ことはない", "ことはありません"]),
("事故は君のせいじゃないから、君が責任を感じる____。", "O acidente não foi culpa sua, não precisa se sentir responsável.", ["ことはない", "ことはありません"]),
("まだ時間があるから、焦る____よ。", "Ainda tem tempo, não precisa se afobar.", ["ことはない", "ことはありません"]),
("ただの風邪だから、高い薬を買う____。", "É só um resfriado, não precisa comprar remédio caro.", ["ことはない", "ことはありません"]),
],
),
dict(
n=52,
jp="〜ことは〜が",
rd="koto wa ~ ga",
tr="Até que... mas / É verdade que... mas",
ex="""ことは〜が é usado para admitir que algo é verdade, mas com uma ressalva. Equivale a "até que..., mas..." ou "é verdade que..., mas...".

A estrutura repete a mesma palavra duas vezes, com ことは no meio: "fazer ことは fazer, mas...". A ideia é "fazer, até que faço, mas não do jeito que você imagina".

Por exemplo, "falar japonês, até que falo, mas não muito bem" ou "é barato, é, mas a qualidade não é boa".

A segunda parte, depois de が ou けど, traz a limitação ou o lado negativo. É uma forma de responder com honestidade, sem negar totalmente nem afirmar com entusiasmo.""",
st="""Verbo + ことは + Verbo (mesmo) + が / けど
Adjetivo い + ことは + Adjetivo い + が / けど
Adjetivo な + な + ことは + Adjetivo な + だ + が / けど
Verbo た + ことは + Verbo た + が / けど""",
no="""A repetição é obrigatória: a mesma palavra aparece antes e depois de ことは.

Essa estrutura é ótima para responder perguntas com modéstia, como quando alguém pergunta se você sabe algo.

Comparado a けど sozinho, ことは〜が deixa mais clara a ideia de "sim, mas com limitações".""",
bf="ことは",
rx="ことは",
tk=["こと", "は", "が"],
va=["ことは〜が", "ことは〜けど"],
E=[
("パーティーに行くことは行くが、少し遅れる。", "パーティーにいくことはいくが、すこしおくれる。", "Até que vou à festa, mas vou chegar um pouco atrasado."),
("このパソコンは使えることは使えるけど、とても遅い。", "このパソコンはつかえることはつかえるけど、とてもおそい。", "Este computador até funciona, mas é muito lento."),
("日本語は話せることは話せますが、上手ではありません。", "にほんごははなせることははなせますが、じょうずではありません。", "Japonês, até que falo, mas não falo bem."),
("この店は安いことは安いが、品質がよくない。", "このみせはやすいことはやすいが、ひんしつがよくない。", "Esta loja é barata, é, mas a qualidade não é boa."),
("その本は読んだことは読んだけど、内容はよく覚えていない。", "そのほんはよんだことはよんだけど、ないようはよくおぼえていない。", "Até que li esse livro, mas não lembro bem do conteúdo."),
],
R=[
("料理はできる____できるが、上手ではない。", "Cozinhar, até que eu cozinho, mas não sou bom.", ["ことは"]),
("宿題はやった____やったけど、全部は終わっていない。", "A lição, até que fiz, mas não terminei tudo.", ["ことは"]),
("この部屋は広い____広いが、駅から遠い。", "Este quarto até é amplo, mas é longe da estação.", ["ことは"]),
("駅で彼に会った____会ったけど、話はしなかった。", "Até que o encontrei na estação, mas não conversamos.", ["ことは"]),
("納豆は好きな____好きですが、毎日は食べません。", "Até que gosto de natto, mas não como todo dia.", ["ことは"]),
],
),
dict(
n=53,
jp="〜くらい・〜ぐらい",
rd="kurai / gurai",
tr="Cerca de / Tanto que / Pelo menos / Ninguém tão... quanto",
ex="""くらい (ou ぐらい) tem vários usos importantes no N3.

• Quantidade aproximada: "cerca de", "mais ou menos", como "uns dez minutos".
• Grau: indica o quanto algo é intenso, com um exemplo, como "estava tão triste que queria chorar". É parecido com ほど.
• Mínimo esperado: indica algo simples que, no mínimo, deveria ser feito, com um tom de crítica, como "pelo menos o seu quarto, limpe você mesmo".
• Comparação máxima: com ない, indica que ninguém ou nada é tão... quanto aquilo, como "não há ninguém tão gentil quanto ele".

くらい e ぐらい são usadas da mesma forma. ぐらい é um pouco mais comum depois de substantivos e na fala.""",
st="""Número / Quantidade + くらい (cerca de)
Verbo / Adjetivo (forma simples) + くらい (grau: tanto que)
Substantivo + くらい + Verbo (pelo menos: crítica)
Substantivo + くらい + Adjetivo + Substantivo + は + ない (ninguém tão... quanto)

Escrita: くらい / ぐらい""",
no="""Para horários, usa-se ごろ, e não くらい: 三時ごろ (por volta das três), mas 三時間くらい (cerca de três horas).

No uso de "pelo menos", くらい costuma ter um tom de cobrança, como algo que é o mínimo esperado.

Para grau, くらい é um pouco mais coloquial que ほど.""",
bf="くらい",
rx="くらい|ぐらい",
tk=["くらい", "ぐらい"],
va=["くらい", "ぐらい"],
E=[
("家から駅まで歩いて十分くらいです。", "いえからえきまであるいてじゅっぷんくらいです。", "De casa até a estação são uns dez minutos a pé."),
("その映画は、泣きたいくらい悲しかった。", "そのえいがは、なきたいくらいかなしかった。", "Esse filme foi tão triste que deu vontade de chorar."),
("自分の部屋ぐらい自分で掃除しなさい。", "じぶんのへやぐらいじぶんでそうじしなさい。", "Pelo menos o seu quarto, limpe você mesmo."),
("彼くらい優しい人はいない。", "かれくらいやさしいひとはいない。", "Não há ninguém tão gentil quanto ele."),
("その知らせを聞いて、声が出ないくらい驚いた。", "そのしらせをきいて、こえがでないくらいおどろいた。", "Fiquei tão surpreso com a notícia que perdi a voz."),
],
R=[
("毎日二時間____勉強しています。", "Estudo cerca de duas horas todo dia.", ["くらい", "ぐらい"]),
("お腹が痛くて、立てない____だった。", "Estava com tanta dor de barriga que não conseguia ficar de pé.", ["くらい", "ぐらい"]),
("朝の挨拶____ちゃんとしなさい。", "Pelo menos o bom-dia, dê direito.", ["くらい", "ぐらい"]),
("母____料理が上手な人はいない。", "Não há ninguém que cozinhe tão bem quanto minha mãe.", ["くらい", "ぐらい"]),
("疲れて、もう一歩も歩けない____だ。", "Estou tão cansado que não consigo dar mais nem um passo.", ["くらい", "ぐらい"]),
],
),
dict(
n=54,
jp="〜くせに",
rd="kuse ni",
tr="Apesar de / Mesmo sendo / E ainda por cima",
ex="""くせに é usado para criticar ou reclamar de alguém cujo comportamento não combina com a situação. Equivale a "apesar de", "mesmo sendo" ou "e ainda por cima".

A primeira parte apresenta um fato sobre a pessoa, e a segunda mostra uma atitude que contradiz esse fato e que irrita quem fala. Por exemplo, "ele sabe, mas não me conta" ou "não faz nada e ainda reclama".

O tom é sempre de crítica, desprezo ou irritação. Por isso, くせに é bem mais forte e emocional que のに.

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

O sujeito das duas partes precisa ser o mesmo, e geralmente não é quem fala.""",
st="""Verbo / Adjetivo い (forma simples) + くせに
Adjetivo な + な + くせに
Substantivo + の + くせに

Escrita: くせに / 癖に""",
no="""Por ser crítico, くせに pode soar ofensivo. Deve ser usado com cuidado, principalmente com pessoas que não são próximas.

No final da frase, くせに sozinho expressa uma reclamação incompleta, como "e ainda por cima...!".

A palavra 癖 (くせ) sozinha significa "mania" ou "hábito".""",
bf="くせに",
rx="くせに|癖に",
tk=["くせ", "に"],
va=["くせに", "癖に"],
E=[
("彼は答えを知っているくせに、教えてくれない。", "かれはこたえをしっているくせに、おしえてくれない。", "Ele sabe a resposta e mesmo assim não me conta."),
("子供のくせに、生意気なことを言う。", "こどものくせに、なまいきなことをいう。", "É só uma criança e já fala com arrogância."),
("自分は何もしないくせに、文句ばかり言う。", "じぶんはなにもしないくせに、もんくばかりいう。", "Não faz nada e ainda vive reclamando."),
("下手なくせに、いつも自慢している。", "へたなくせに、いつもじまんしている。", "É ruim nisso e ainda vive se gabando."),
("お金がないくせに、高い物ばかり買う。", "おかねがないくせに、たかいものばかりかう。", "Não tem dinheiro e ainda só compra coisa cara."),
],
R=[
("彼は太っている____、甘い物ばかり食べる。", "Ele está acima do peso e ainda só come doce.", ["くせに"]),
("自分が悪い____、謝らない。", "A culpa é dele e mesmo assim não pede desculpas.", ["くせに"]),
("学生の____、全然勉強しない。", "É estudante e não estuda nada.", ["くせに"]),
("本当は好きな____、嫌いなふりをしている。", "No fundo gosta e mesmo assim finge que não gosta.", ["くせに"]),
("一度も行ったことがない____、知っているように話す。", "Nunca foi lá e mesmo assim fala como se conhecesse.", ["くせに"]),
],
),
dict(
n=55,
jp="まるで",
rd="marude",
tr="Como se / Parecia até / Igualzinho a",
ex="""まるで é um advérbio usado em comparações para dizer que algo se parece muito com outra coisa, mesmo não sendo. Equivale a "como se", "parecia até" ou "igualzinho a".

Ele quase sempre aparece junto com ようだ, ような, ように, みたいだ ou みたいに, reforçando a comparação.

Por exemplo, "ela parece até uma boneca", "este quadro parece uma foto" ou "parece que estou sonhando".

A ideia é de uma semelhança muito forte, quase total. Por isso, まるで é usado para descrições vivas, exageros e impressões marcantes.

Com a forma negativa, まるで〜ない significa "nem um pouco", "de jeito nenhum", com sentido parecido a 全然〜ない.""",
st="""まるで + Substantivo + の + ようだ / ような / ように
まるで + Substantivo + みたいだ / みたいな / みたいに
まるで + Frase (forma simples) + ようだ / みたいだ
まるで + Frase negativa (nem um pouco)""",
no="""まるで reforça comparações; sozinho, sem ようだ ou みたいだ, ele soa incompleto no uso de "como se".

No uso negativo, まるで〜ない é um pouco mais expressivo que 全然〜ない: まるでわからない (não entendo absolutamente nada).

É muito comum em descrições de histórias, filmes e paisagens.""",
bf="まるで",
rx="まるで",
tk=["まるで"],
va=["まるで"],
E=[
("彼女はまるで人形のようだ。", "かのじょはまるでにんぎょうのようだ。", "Ela parece até uma boneca."),
("今日はまるで夏みたいに暑い。", "きょうはまるでなつみたいにあつい。", "Hoje está quente como se fosse verão."),
("彼はまるで何も知らないような顔をした。", "かれはまるでなにもしらないようなかおをした。", "Ele fez uma cara como se não soubesse de nada."),
("この絵はまるで写真のようだ。", "このえはまるでしゃしんのようだ。", "Este quadro parece até uma foto."),
("こんなにうれしいことがあるなんて、まるで夢を見ているみたいだ。", "こんなにうれしいことがあるなんて、まるでゆめをみているみたいだ。", "Algo tão bom assim acontecer parece até que estou sonhando."),
],
R=[
("彼の日本語は____日本人のようだ。", "O japonês dele é igualzinho ao de um japonês.", ["まるで"]),
("この部屋は____ホテルみたいにきれいだ。", "Este quarto está limpo como se fosse um hotel.", ["まるで"]),
("彼は____王様のように振る舞う。", "Ele se comporta como se fosse um rei.", ["まるで"]),
("彼女は____雪のように白い肌をしている。", "Ela tem a pele branca como a neve.", ["まるで"]),
("二人は____本当の兄弟のように仲がいい。", "Os dois se dão tão bem que parecem irmãos de verdade.", ["まるで"]),
],
),
dict(
n=56,
jp="まさか",
rd="masaka",
tr="Não pode ser / Jamais imaginei que / Será possível",
ex="""まさか é usado para expressar forte surpresa ou descrença diante de algo inesperado. Equivale a "não pode ser!", "jamais imaginei que..." ou "será possível?".

Ele tem dois usos principais. O primeiro é com とは思わなかった ou なんて, para dizer que algo que aconteceu era totalmente inesperado: "jamais imaginei que ele fosse o culpado".

O segundo é para negar a possibilidade de algo, com はずがない ou ないだろう: "não é possível que...".

Sozinho, como reação, まさか! significa "não acredito!" ou "não pode ser!".

O tom é emocional e mostra que a pessoa achava aquilo improvável ou impossível.""",
st="""まさか + Frase + とは思わなかった (jamais imaginei)
まさか + Frase + なんて (não acredito que...)
まさか + … + はずがない / ないだろう (não é possível que)
まさか！ (reação: não pode ser!)""",
no="""A expressão まさかの + Substantivo, como まさかの結果, significa "um resultado inesperado" e é comum em manchetes.

Em situações de emergência, まさかの時 significa "em caso de imprevisto".

まさか tem um tom parecido com "você está brincando?" em conversas informais.""",
bf="まさか",
rx="まさか",
tk=["まさか"],
va=["まさか"],
E=[
("まさか彼が犯人だとは思わなかった。", "まさかかれがはんにんだとはおもわなかった。", "Jamais imaginei que ele fosse o culpado."),
("まさか、そんなはずはない。", "まさか、そんなはずはない。", "Não pode ser, isso não é possível."),
("まさか一位になるとは思わなかった。", "まさかいちいになるとはおもわなかった。", "Nunca imaginei que fosse ficar em primeiro lugar."),
("「彼、会社をやめたよ。」「まさか！」", "「かれ、かいしゃをやめたよ。」「まさか！」", "\"Ele saiu da empresa.\" \"Não acredito!\""),
("まさか雨が降るなんて、思っていなかった。", "まさかあめがふるなんて、おもっていなかった。", "Jamais pensei que fosse chover."),
],
R=[
("____こんなところで会うとは思わなかった。", "Jamais imaginei que fosse te encontrar num lugar destes.", ["まさか"]),
("「田中さんが結婚したって。」「____！」", "\"Dizem que o Tanaka se casou.\" \"Não pode ser!\"", ["まさか"]),
("あんなに勉強したのに、____試験に落ちるとは思わなかった。", "Estudei tanto que jamais imaginei que fosse ser reprovado.", ["まさか"]),
("____あの優しい人がそんなことを言うはずがない。", "Não é possível que aquela pessoa tão gentil tenha dito isso.", ["まさか"]),
("____宝くじが当たるなんて、信じられない。", "Ganhar na loteria? Não dá para acreditar.", ["まさか"]),
],
),
dict(
n=57,
jp="めったに〜ない",
rd="metta ni ~ nai",
tr="Raramente / Quase nunca",
ex="""めったに〜ない é usado para dizer que algo acontece muito raramente. Equivale a "raramente" ou "quase nunca".

めったに vem antes do verbo, e o verbo fica sempre na forma negativa. Sem a negação, a frase fica errada.

Ele indica uma frequência muito baixa, menor do que あまり〜ない ("não muito"). Por exemplo, "meu pai quase nunca fica bravo" ou "aqui quase nunca neva".

A expressão めったにない também é usada para dizer que algo é raro e valioso, como uma oportunidade que quase nunca aparece.""",
st="""めったに + Verbo na forma negativa
めったに + ない (raro, difícil de acontecer)
めったにない + Substantivo (algo raro)

Escrita: めったに / 滅多に""",
no="""Comparando a frequência: いつも (sempre) > よく (com frequência) > 時々 (às vezes) > あまり〜ない (não muito) > めったに〜ない (quase nunca) > 全然〜ない (nunca).

めったにないチャンス (uma oportunidade rara) é uma expressão muito comum.

O kanji 滅多 é pouco usado no dia a dia; o mais comum é escrever em hiragana.""",
bf="めったに",
rx="めったに|滅多に",
tk=["めったに", "ない"],
va=["めったに", "滅多に"],
E=[
("父はめったに怒らない。", "ちちはめったにおこらない。", "Meu pai quase nunca fica bravo."),
("この辺では、めったに雪が降りません。", "このへんでは、めったにゆきがふりません。", "Por aqui, raramente neva."),
("彼女はめったに会社を休まない。", "かのじょはめったにかいしゃをやすまない。", "Ela quase nunca falta ao trabalho."),
("こんなチャンスはめったにない。", "こんなチャンスはめったにない。", "Uma oportunidade dessas é muito rara."),
("最近は忙しくて、めったに映画を見に行かない。", "さいきんはいそがしくて、めったにえいがをみにいかない。", "Ultimamente estou ocupado e quase nunca vou ao cinema."),
],
R=[
("兄は____電話をくれない。", "Meu irmão mais velho quase nunca me liga.", ["めったに"]),
("この店は____休まない。", "Esta loja quase nunca fecha.", ["めったに"]),
("彼は体が強くて、____病気にならない。", "Ele é muito saudável e quase nunca fica doente.", ["めったに"]),
("東京では、____星が見えない。", "Em Tóquio, quase nunca dá para ver estrelas.", ["めったに"]),
("私は____お酒を飲みません。", "Eu raramente bebo álcool.", ["めったに"]),
],
),
dict(
n=58,
jp="〜も〜ば〜も",
rd="mo ~ ba ~ mo",
tr="Tanto... quanto... / Não só... como também...",
ex="""も〜ば〜も é usado para listar duas características ou situações, mostrando que as duas são verdadeiras. Equivale a "tanto... quanto..." ou "não só... como também...".

A estrutura usa も duas vezes e ば no meio: "A も + verbo ば、B も + verbo". Por exemplo, "ele fala tanto inglês quanto francês".

Ela tem dois usos principais. O primeiro é somar qualidades ou fatos, como alguém que é bom em várias coisas. O segundo é mostrar que existem situações diferentes ou opostas, como "na vida há momentos bons e também momentos ruins".

Com ある e いる, a forma もあれば〜もある e もいれば〜もいる é muito comum para falar de variedade.""",
st="""A + も + Verbo ば、 + B + も + Verbo
A + も + あれば、 + B + も + ある
A + も + いれば、 + B + も + いる
A + も + Adjetivo な + なら、 + B + も + Adjetivo な + だ""",
no="""A forma いい時もあれば、悪い時もある é uma expressão quase fixa sobre os altos e baixos da vida.

Essa estrutura é um pouco mais formal e expressiva que simplesmente usar も〜も.

É comum em textos que descrevem diversidade, como opiniões diferentes entre as pessoas.""",
bf="も",
rx="も",
tk=["も", "ば", "も"],
va=["も〜ば〜も", "もあれば〜もある", "もいれば〜もいる"],
E=[
("彼は英語も話せば、フランス語も話せる。", "かれはえいごもはなせば、フランスごもはなせる。", "Ele fala tanto inglês quanto francês."),
("この部屋は広さもあれば、日当たりもいい。", "このへやはひろさもあれば、ひあたりもいい。", "Este quarto não só é espaçoso, como também tem boa luz do sol."),
("人生にはいい時もあれば、悪い時もある。", "じんせいにはいいときもあれば、わるいときもある。", "Na vida há momentos bons e também momentos ruins."),
("彼女は歌も上手なら、ダンスも上手だ。", "かのじょはうたもじょうずなら、ダンスもじょうずだ。", "Ela canta bem e também dança bem."),
("外は雨も降れば、風も吹いている。", "そとはあめもふれば、かぜもふいている。", "Lá fora está chovendo e ventando também."),
],
R=[
("彼は料理____すれば、掃除もする。", "Ele tanto cozinha quanto limpa a casa.", ["も"]),
("晴れる日もあれば、雨の日____ある。", "Há dias de sol e também dias de chuva.", ["も"]),
("この意見に賛成する人もいれば、反対する人____いる。", "Há quem concorde com esta opinião e também há quem discorde.", ["も"]),
("この町は海____あれば、山もある。", "Esta cidade tem tanto mar quanto montanha.", ["も"]),
("彼女は頭____よければ、性格もいい。", "Ela é inteligente e também tem um ótimo caráter.", ["も"]),
],
),
dict(
n=59,
jp="もしかしたら",
rd="moshika shitara",
tr="Talvez / Pode ser que / Será que",
ex="""もしかしたら é usado para indicar uma possibilidade, sem certeza. Equivale a "talvez" ou "pode ser que".

Ele fica no começo da frase e quase sempre aparece junto com かもしれない no final, reforçando a ideia de dúvida.

Por exemplo, "talvez amanhã chova" ou "pode ser que ele já tenha ido embora".

A forma もしかすると tem o mesmo sentido e soa um pouco mais formal. A forma もしかして é usada principalmente em perguntas, quando a pessoa suspeita de algo e quer confirmar: "por acaso você é o Tanaka?".""",
st="""もしかしたら + … + かもしれない
もしかすると + … + かもしれない (um pouco mais formal)
もしかして + … + ですか / の？ (pergunta: por acaso...?)""",
no="""もしかして é muito útil para perguntar algo com delicadeza, sem afirmar diretamente, como ao reconhecer alguém.

Na fala casual, もしかしたら pode ser reduzido para もしかしたら… sozinho, deixando a frase em aberto.

Essas expressões indicam uma possibilidade baixa ou média. Para algo mais provável, usa-se たぶん.""",
bf="もしかしたら",
rx="もしかしたら|もしかすると|もしかして",
tk=["もしかしたら"],
va=["もしかしたら", "もしかすると", "もしかして"],
E=[
("空が暗いから、もしかしたら、明日は雨かもしれない。", "そらがくらいから、もしかしたら、あしたはあめかもしれない。", "O céu está escuro, talvez chova amanhã."),
("電気が消えている。もしかしたら、彼はもう帰ったかもしれません。", "でんきがきえている。もしかしたら、かれはもうかえったかもしれません。", "As luzes estão apagadas. Pode ser que ele já tenha ido embora."),
("もしかすると、この話は本当かもしれない。", "もしかすると、このはなしはほんとうかもしれない。", "Talvez esta história seja verdade."),
("すみません、もしかして、田中さんですか。", "すみません、もしかして、たなかさんですか。", "Com licença, por acaso o senhor é o Tanaka?"),
("頑張れば、もしかしたら、試験に合格できるかもしれない。", "がんばれば、もしかしたら、しけんにごうかくできるかもしれない。", "Se eu me esforçar, talvez consiga passar na prova."),
],
R=[
("____、明日行けないかもしれません。", "Talvez eu não possa ir amanhã.", ["もしかしたら", "もしかすると"]),
("____、彼女は風邪をひいたのかもしれない。", "Pode ser que ela tenha pegado um resfriado.", ["もしかしたら", "もしかすると"]),
("____、財布は家にあるかもしれない。", "Talvez a carteira esteja em casa.", ["もしかしたら", "もしかすると"]),
("____、この答えは間違っているかもしれない。", "Pode ser que esta resposta esteja errada.", ["もしかしたら", "もしかすると"]),
("雪がひどいから、____、今日は電車が遅れるかもしれない。", "A neve está forte, então talvez o trem atrase hoje.", ["もしかしたら", "もしかすると"]),
],
),
dict(
n=60,
jp="もしも〜たら",
rd="moshimo ~ tara",
tr="Se por acaso / Caso / Na hipótese de",
ex="""もしも〜たら é usado para falar de uma hipótese, uma situação imaginada ou pouco provável. Equivale a "se por acaso", "caso" ou "na hipótese de".

もしも é uma forma mais enfática de もし. Ele fica no começo da frase e reforça que aquela condição é apenas uma suposição.

A condição vem normalmente com たら, mas também pode vir com ば, なら ou と.

É usado para planos de emergência ("se por acaso houver um terremoto..."), sonhos e fantasias ("se eu ganhasse na loteria...") e situações contrárias à realidade ("se eu fosse um pássaro...").

A expressão もしもの時 significa "em caso de emergência" ou "se algo acontecer".""",
st="""もしも + … + たら / ば / なら
もしもの + 時 / 場合 (em caso de emergência)

Mais simples: もし + … + たら""",
no="""もしもし, usado ao atender o telefone, tem origem parecida, mas é uma expressão diferente.

もし e もしも podem ser trocados na maioria dos casos. もしも soa um pouco mais enfático ou dramático.

Em frases contrárias à realidade, é comum terminar com のに, expressando desejo ou pena.""",
bf="もしも",
rx="もしも|もし",
tk=["もしも", "たら"],
va=["もしも", "もし"],
E=[
("もしも宝くじが当たったら、家を買いたい。", "もしもたからくじがあたったら、いえをかいたい。", "Se por acaso eu ganhasse na loteria, queria comprar uma casa."),
("もしも明日雨が降ったら、試合は中止です。", "もしもあしたあめがふったら、しあいはちゅうしです。", "Caso chova amanhã, a partida será cancelada."),
("もしも地震が起きたら、机の下に入ってください。", "もしもじしんがおきたら、つくえのしたにはいってください。", "Se por acaso houver um terremoto, entre embaixo da mesa."),
("もしも私が鳥だったら、空を飛べるのに。", "もしもわたしがとりだったら、そらをとべるのに。", "Se eu fosse um pássaro, poderia voar pelo céu."),
("もしもの時は、この番号に電話してください。", "もしものときは、このばんごうにでんわしてください。", "Em caso de emergência, ligue para este número."),
],
R=[
("____道に迷ったら、電話してね。", "Se por acaso se perder, me ligue, tá?", ["もしも", "もし"]),
("____一億円あったら、何をしますか。", "Se você tivesse cem milhões de ienes, o que faria?", ["もしも", "もし"]),
("____明日晴れたら、ピクニックに行こう。", "Se amanhã fizer sol, vamos fazer um piquenique.", ["もしも", "もし"]),
("____の時のために、お金を貯めている。", "Estou guardando dinheiro para alguma emergência.", ["もしも"]),
("____私が社長だったら、休みを増やす。", "Se eu fosse o presidente, aumentaria as folgas.", ["もしも", "もし"]),
],
),
]
