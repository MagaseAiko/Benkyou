G = [
dict(
n=161,
jp="〜上で",
rd="ue de",
tr="Depois de / Após / Para (fazer) / Em",
ex="""上で tem dois usos principais.

O primeiro, com o verbo na forma た ou com substantivo + の, significa "depois de" ou "após": primeiro se faz uma coisa com cuidado, e depois, com base nela, se faz outra. Por exemplo, "decida depois de pensar bem" ou "responderei depois de conversar com meus pais". O tom é formal e sério.

O segundo, com o verbo na forma de dicionário, significa "para" ou "em": indica uma área ou atividade em que algo é importante ou necessário. Por exemplo, "para viver no Japão, o japonês é importante" ou "no trabalho, o mais importante é a confiança".

Com o, a forma 上での vem antes de um substantivo: 仕事上での注意 (cuidados no trabalho).""",
st="""Verbo na forma た + 上で、 + Ação seguinte (depois de)
Substantivo + の + 上で、 + Ação seguinte
Verbo na forma de dicionário + 上で、 + Algo importante / necessário (para / em)

Escrita: 上で / うえで""",
no="""No primeiro uso, 上で destaca que a primeira ação é uma preparação necessária para a segunda.

Em contratos e formulários, よく読んだ上で ("depois de ler com atenção") é muito comum.

Não confunda com 上に (além disso), que soma informações.""",
bf="上で",
rx="上で|うえで|上での",
tk=["上", "で"],
va=["上で", "うえで", "上での"],
E=[
("よく考えた上で、決めてください。", "よくかんがえたうえで、きめてください。", "Decida depois de pensar bem."),
("両親と相談した上で、返事をします。", "りょうしんとそうだんしたうえで、へんじをします。", "Vou responder depois de conversar com meus pais."),
("説明を聞いた上で、申し込んでください。", "せつめいをきいたうえで、もうしこんでください。", "Inscreva-se depois de ouvir a explicação."),
("日本で生活する上で、日本語は大切だ。", "にほんでせいかつするうえで、にほんごはたいせつだ。", "Para viver no Japão, o japonês é importante."),
("仕事をする上で、一番大切なのは信頼です。", "しごとをするうえで、いちばんたいせつなのはしんらいです。", "No trabalho, o mais importante é a confiança."),
],
R=[
("契約書の内容を確認した____、サインしてください。", "Assine depois de conferir o conteúdo do contrato.", ["上で"]),
("家族と話し合った____、留学を決めた。", "Decidi fazer intercâmbio depois de conversar com a família.", ["上で"]),
("外国語を学ぶ____、毎日の練習が必要だ。", "Para aprender uma língua estrangeira, é preciso praticar todo dia.", ["上で"]),
("実物を見た____、買うかどうか決めます。", "Vou decidir se compro depois de ver o produto pessoalmente.", ["上で"]),
("健康に生活する____、睡眠は大切だ。", "Para viver com saúde, o sono é importante.", ["上で"]),
],
),
dict(
n=162,
jp="〜上に",
rd="ue ni",
tr="Além de / E ainda por cima / Não só... como também",
ex="""上に é usado para acrescentar uma informação a outra, indicando que as duas coisas se somam. Equivale a "além de", "e ainda por cima" ou "não só... como também".

As duas partes costumam ter o mesmo tom: duas coisas boas ("é barato e, além disso, gostoso") ou duas coisas ruins ("me perdi e, ainda por cima, perdi a carteira").

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, である ou の.

A segunda parte costuma ter も, reforçando a ideia de acúmulo.

Comparado a し, que também lista razões, 上に destaca que a segunda informação vem como algo a mais, intensificando a situação.""",
st="""Verbo / Adjetivo い (forma simples) + 上に、 + … + も
Adjetivo な + な + 上に
Substantivo + である / の + 上に

Escrita: 上に / うえに""",
no="""Não misture tons diferentes: uma qualidade boa e uma ruim não combinam com 上に. Para contraste, use が ou けど.

Em reclamações, 上に aparece muito para dizer que tudo deu errado ao mesmo tempo.

Não confunda com 上で (depois de / para), que tem outro sentido.""",
bf="上に",
rx="上に|うえに",
tk=["上", "に"],
va=["上に", "うえに"],
E=[
("この店は安い上に、おいしい。", "このみせはやすいうえに、おいしい。", "Esta loja é barata e, além disso, gostosa."),
("彼は頭がいい上に、スポーツも得意だ。", "かれはあたまがいいうえに、スポーツもとくいだ。", "Ele é inteligente e, além disso, bom em esportes."),
("雨が降っている上に、風も強い。", "あめがふっているうえに、かぜもつよい。", "Está chovendo e, ainda por cima, ventando forte."),
("旅行先で道に迷った上に、財布もなくした。", "りょこうさきでみちにまよったうえに、さいふもなくした。", "Na viagem, me perdi e, ainda por cima, perdi a carteira."),
("彼女は親切な上に、とても優しい。", "かのじょはしんせつなうえに、とてもやさしい。", "Ela é atenciosa e, além disso, muito gentil."),
],
R=[
("この部屋は広い____、駅から近い。", "Este apartamento é amplo e, além disso, perto da estação.", ["上に", "うえに"]),
("今朝は寝坊した____、電車も遅れた。", "Hoje de manhã dormi demais e, ainda por cima, o trem atrasou.", ["上に", "うえに"]),
("彼は背が高い____、ハンサムだ。", "Ele é alto e, além disso, bonito.", ["上に", "うえに"]),
("この仕事は大変な____、給料も安い。", "Este trabalho é pesado e, ainda por cima, paga mal.", ["上に", "うえに"]),
("熱がある____、頭も痛い。", "Estou com febre e, ainda por cima, com dor de cabeça.", ["上に", "うえに"]),
],
),
dict(
n=163,
jp="〜は別として",
rd="wa betsu to shite",
tr="Deixando de lado / Sem contar / Independentemente de",
ex="""は別として é usado para deixar de lado um aspecto da questão, para focar em outro. Equivale a "deixando de lado", "sem contar" ou "independentemente de".

A primeira parte indica o que não vai ser considerado agora (o preço, o resultado, os gostos pessoais). A segunda parte traz o ponto principal. Por exemplo, "deixando o preço de lado, o design é bom" ou "independentemente do resultado, você se esforçou muito".

Também é comum com かどうか ou palavras interrogativas: "se ele vem ou não, à parte, vamos nos preparar".

A forma は別にして tem o mesmo sentido.""",
st="""Substantivo + は別として、 + Ponto principal
Frase + かどうか + は別として、 + …
Palavra interrogativa + … + か + は別として

Variação: は別にして""",
no="""は別として é parecido com はともかく (N2), que também deixa algo de lado. はともかく soa um pouco mais casual.

Com pessoas, 〜は別として significa "exceto fulano": 専門家は別として ("a não ser os especialistas").

É útil para avaliar algo de forma justa, separando os aspectos.""",
bf="は別として",
rx="は別として|は別にして|はべつとして",
tk=["は", "別", "として"],
va=["は別として", "は別にして"],
E=[
("値段は別として、このデザインはいい。", "ねだんはべつとして、このデザインはいい。", "Deixando o preço de lado, este design é bom."),
("結果は別として、よく頑張った。", "けっかはべつとして、よくがんばった。", "Independentemente do resultado, você se esforçou muito."),
("好き嫌いは別として、栄養のために食べなさい。", "すききらいはべつとして、えいようのためにたべなさい。", "Gostando ou não, coma pela nutrição."),
("冗談は別として、本当にありがとう。", "じょうだんはべつとして、ほんとうにありがとう。", "Brincadeiras à parte, muito obrigado mesmo."),
("彼が来るかどうかは別として、準備をしておこう。", "かれがくるかどうかはべつとして、じゅんびをしておこう。", "Se ele vem ou não, à parte, vamos deixar tudo preparado."),
],
R=[
("味____、この店は雰囲気がいい。", "Deixando o sabor de lado, esta loja tem um ambiente bom.", ["は別として", "は別にして"]),
("勝ち負け____、楽しい試合だった。", "Ganhando ou perdendo, foi uma partida divertida.", ["は別として", "は別にして"]),
("上手か下手か____、彼はいつも楽しそうに歌う。", "Bem ou mal, ele sempre canta parecendo se divertir.", ["は別として", "は別にして"]),
("費用____、まず旅行の計画を立てよう。", "Deixando os custos de lado, vamos primeiro planejar a viagem.", ["は別として", "は別にして"]),
("専門家____、一般の人には難しい内容だ。", "A não ser os especialistas, é um conteúdo difícil para o público em geral.", ["は別として", "は別にして"]),
],
),
dict(
n=164,
jp="〜はもちろん",
rd="wa mochiron",
tr="Não só... mas também / Sem falar em / Claro que... e também",
ex="""はもちろん é usado para dizer que algo é óbvio e, além disso, outra coisa também é verdade. Equivale a "não só... mas também", "sem falar em" ou "claro que..., e também...".

A primeira parte apresenta o caso mais óbvio ou esperado, e a segunda acrescenta outro caso, geralmente com も. Por exemplo, "ele fala inglês, claro, e também chinês" ou "a loja fica cheia não só nos dias úteis, mas também nos fins de semana".

Em frases negativas, a ideia se inverte: "kanji, nem se fala; ele não sabe escrever nem hiragana".

もちろん significa "é claro", "obviamente". Por isso, a estrutura destaca que o primeiro elemento é evidente.""",
st="""A + はもちろん、 + B + も + …
A + はもちろん、 + B + も + Negativo (A nem se fala, nem B...)""",
no="""はもちろん é parecido com はもとより (N2), que é mais formal.

A ordem é importante: o elemento mais óbvio vem primeiro, e o menos óbvio, depois.

É muito comum em propagandas: "não só para crianças, mas também para adultos".""",
bf="はもちろん",
rx="はもちろん",
tk=["は", "もちろん"],
va=["はもちろん"],
E=[
("彼は英語はもちろん、中国語も話せる。", "かれはえいごはもちろん、ちゅうごくごもはなせる。", "Ele fala inglês, é claro, e também chinês."),
("この店は平日はもちろん、週末も混んでいる。", "このみせはへいじつはもちろん、しゅうまつもこんでいる。", "Esta loja fica cheia não só nos dias úteis, mas também nos fins de semana."),
("子供はもちろん、大人も楽しめる映画だ。", "こどもはもちろん、おとなもたのしめるえいがだ。", "É um filme que não só crianças, mas também adultos podem aproveitar."),
("彼は漢字はもちろん、ひらがなも書けない。", "かれはかんじはもちろん、ひらがなもかけない。", "Kanji, nem se fala; ele não sabe escrever nem hiragana."),
("このお菓子は東京はもちろん、地方でも人気がある。", "このおかしはとうきょうはもちろん、ちほうでもにんきがある。", "Este doce é popular não só em Tóquio, mas também no interior."),
],
R=[
("彼女は料理____、掃除も得意だ。", "Ela é boa não só em cozinhar, mas também em limpar.", ["はもちろん"]),
("この歌は日本____、海外でも有名だ。", "Esta música é famosa não só no Japão, mas também no exterior.", ["はもちろん"]),
("去年は夏休み____、冬休みも働いた。", "No ano passado, trabalhei não só nas férias de verão, mas também nas de inverno.", ["はもちろん"]),
("彼は日本語____、英語も話せない。", "Japonês, nem se fala; ele não fala nem inglês.", ["はもちろん"]),
("イベントには学生____、先生も参加した。", "Não só os alunos, mas também os professores participaram do evento.", ["はもちろん"]),
],
),
dict(
n=165,
jp="〜は〜で有名",
rd="wa ~ de yuumei",
tr="Ser famoso por / Ser conhecido por",
ex="""は〜で有名 é usado para dizer pelo que um lugar, uma pessoa ou uma coisa é famoso. Equivale a "ser famoso por" ou "ser conhecido por".

O tema vem com は, e o motivo da fama vem com で, antes de 有名. Por exemplo, "Kyoto é famosa pelos templos" ou "esta cidade é conhecida pelas fontes termais".

Para dizer que é famoso por uma ação ou característica, usa-se こと + で: "ele é famoso por cantar bem".

Antes de um substantivo, usa-se で有名な: ケーキで有名な店 (uma loja famosa pelos bolos).

A partícula で aqui indica o motivo ou a razão da fama.""",
st="""Lugar / Pessoa / Coisa + は + Substantivo + で有名だ / です
Frase + こと + で有名だ
Substantivo + で有名な + Substantivo""",
no="""Para "famoso entre" um grupo de pessoas, usa-se に: 若者に有名だ (famoso entre os jovens).

Também se usa として有名 para "famoso como": 観光地として有名だ.

É uma estrutura muito útil para apresentar cidades e pontos turísticos.""",
bf="で有名",
rx="で有名|でゆうめい",
tk=["は", "で", "有名"],
va=["で有名", "で有名だ", "で有名な"],
E=[
("京都はお寺で有名です。", "きょうとはおてらでゆうめいです。", "Kyoto é famosa pelos templos."),
("この町は温泉で有名だ。", "このまちはおんせんでゆうめいだ。", "Esta cidade é conhecida pelas fontes termais."),
("北海道はラーメンで有名です。", "ほっかいどうはラーメンでゆうめいです。", "Hokkaido é famosa pelo ramen."),
("ここはケーキで有名な店です。", "ここはケーキでゆうめいなみせです。", "Aqui é uma loja famosa pelos bolos."),
("彼は歌がうまいことで有名だ。", "かれはうたがうまいことでゆうめいだ。", "Ele é famoso por cantar bem."),
],
R=[
("静岡はお茶____です。", "Shizuoka é famosa pelo chá.", ["で有名"]),
("この村は桜____な場所だ。", "Esta vila é um lugar famoso pelas cerejeiras.", ["で有名"]),
("奈良は鹿____です。", "Nara é famosa pelos cervos.", ["で有名"]),
("この店は安いこと____だ。", "Esta loja é conhecida por ser barata.", ["で有名"]),
("ブラジルはサッカー____です。", "O Brasil é famoso pelo futebol.", ["で有名"]),
],
),
dict(
n=166,
jp="〜わけだ",
rd="wake da",
tr="Não é à toa que / Então é por isso que / Ou seja",
ex="""わけだ é usado para mostrar que algo faz sentido, como uma conclusão lógica a partir de um fato. Equivale a "não é à toa que", "então é por isso que" ou "ou seja".

Ele tem dois usos principais. O primeiro é entender o motivo de algo depois de descobrir um fato: "ele morou dez anos no Japão? Não é à toa que fala tão bem japonês". O tom é de "ah, agora entendi".

O segundo é tirar uma conclusão lógica ou matemática a partir de dados: "estudando três horas por dia, são vinte e uma horas por semana".

わけ significa "motivo" ou "razão". Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com の ou という.""",
st="""Verbo / Adjetivo い (forma simples) + わけだ
Adjetivo な + な + わけだ
Substantivo + の / という + わけだ

Educado: わけです
Escrita: わけ / 訳""",
no="""Expressões como どうりで e なるほど combinam muito com わけだ: どうりで寒いわけだ ("não é à toa que está frio").

Na conversa, わけだ mostra que a pessoa entendeu a situação.

わけ também aparece em outras gramáticas importantes, como わけではない, わけがない e わけにはいかない.""",
bf="わけだ",
rx="わけだ|わけです|訳だ",
tk=["わけ", "だ"],
va=["わけだ", "わけです", "訳だ"],
E=[
("彼は十年日本に住んでいたのか。日本語が上手なわけだ。", "かれはじゅうねんにほんにすんでいたのか。にほんごがじょうずなわけだ。", "Ele morou dez anos no Japão? Não é à toa que fala tão bem japonês."),
("窓が開いている。寒いわけだ。", "まどがあいている。さむいわけだ。", "A janela está aberta. Então é por isso que está frio."),
("毎日練習しているから、上手になるわけだ。", "まいにちれんしゅうしているから、じょうずになるわけだ。", "Treina todo dia, então é natural que melhore."),
("一日に三時間勉強すれば、一週間で二十一時間勉強するわけです。", "いちにちにさんじかんべんきょうすれば、いっしゅうかんでにじゅういちじかんべんきょうするわけです。", "Estudando três horas por dia, ou seja, são vinte e uma horas por semana."),
("つまり、明日は休みというわけだ。", "つまり、あしたはやすみというわけだ。", "Ou seja, amanhã é folga."),
],
R=[
("彼女はフランスに住んでいたのか。フランス語が上手な____。", "Ela morou na França? Não é à toa que fala bem francês.", ["わけだ", "わけです"]),
("エアコンがついていない。暑い____。", "O ar-condicionado não está ligado. Então é por isso que está quente.", ["わけだ", "わけです"]),
("彼は毎日走っている。体が強い____。", "Ele corre todo dia. Não é à toa que é tão resistente.", ["わけだ", "わけです"]),
("時給千円で八時間働けば、八千円もらえる____。", "Ganhando mil ienes por hora e trabalhando oito horas, ou seja, recebe oito mil ienes.", ["わけだ", "わけです"]),
("道が工事中だ。だから混んでいる____。", "A rua está em obras. Então é por isso que está congestionada.", ["わけだ", "わけです"]),
],
),
dict(
n=167,
jp="〜わけではない",
rd="wake de wa nai",
tr="Não é que / Não significa que / Não necessariamente",
ex="""わけではない é usado para negar parcialmente uma ideia, corrigindo uma conclusão que o outro poderia tirar. Equivale a "não é que...", "não significa que..." ou "não necessariamente".

A ideia é: "não é exatamente assim". Por exemplo, "não é que eu não goste de carne, mas não como muito" ou "não é que eu cozinhe todos os dias".

Ela é muito útil para evitar mal-entendidos e para suavizar opiniões. Também é comum com palavras como いつも, みんな, 全部 e 必ず, negando uma generalização.

Ela vem depois da forma simples de verbos e adjetivos, de adjetivos な com な, e de substantivos com という ou の.

Na fala, わけではない costuma virar わけじゃない.""",
st="""Verbo / Adjetivo い (forma simples) + わけではない
Adjetivo な + な + わけではない
Substantivo + という + わけではない
いつも / みんな / 全部 + … + わけではない (negação parcial)

Educado: わけではありません
Fala: わけじゃない""",
no="""わけではない é diferente de わけがない. わけではない nega parcialmente ("não é que..."); わけがない nega totalmente ("não tem como").

É muito usada para recusar convites com delicadeza: 行きたくないわけではないけど….

Em debates, ajuda a mostrar que você não está dizendo algo extremo.""",
bf="わけではない",
rx="わけではない|わけじゃない|わけではありません|訳ではない",
tk=["わけ", "では", "ない"],
va=["わけではない", "わけじゃない", "わけではありません"],
E=[
("肉が嫌いなわけではないが、あまり食べない。", "にくがきらいなわけではないが、あまりたべない。", "Não é que eu não goste de carne, mas não como muito."),
("毎日料理をするわけではない。", "まいにちりょうりをするわけではない。", "Não é que eu cozinhe todos os dias."),
("高い物がいつもいいわけではない。", "たかいものがいつもいいわけではない。", "Coisa cara não é necessariamente sempre boa."),
("彼のことが嫌いなわけじゃない。", "かれのことがきらいなわけじゃない。", "Não é que eu não goste dele."),
("日本人がみんな寿司が好きなわけではありません。", "にほんじんがみんなすしがすきなわけではありません。", "Não é que todos os japoneses gostem de sushi."),
],
R=[
("行きたくない____が、今日は忙しい。", "Não é que eu não queira ir, mas hoje estou ocupado.", ["わけではない", "わけじゃない"]),
("説明を聞いたが、全部わかった____。", "Ouvi a explicação, mas não é que eu tenha entendido tudo.", ["わけではない", "わけじゃない"]),
("この件は、彼だけが悪い____。", "Neste caso, não é que só ele tenha culpa.", ["わけではない", "わけじゃない"]),
("お金があれば幸せになれる____。", "Ter dinheiro não significa necessariamente ser feliz.", ["わけではない", "わけじゃない"]),
("フリーランスだが、いつも暇な____。", "Sou freelancer, mas não é que eu esteja sempre livre.", ["わけではない", "わけじゃない"]),
],
),
dict(
n=168,
jp="〜わけがない",
rd="wake ga nai",
tr="Não tem como / É impossível que / De jeito nenhum",
ex="""わけがない é usado para negar com muita força uma possibilidade, dizendo que algo é impossível ou absurdo. Equivale a "não tem como", "é impossível que" ou "de jeito nenhum".

A ideia literal é "não há motivo para isso acontecer". Quem fala tem certeza de que aquilo não é verdade ou não vai acontecer.

Por exemplo, "uma criança não tem como entender uma questão tão difícil" ou "ele jamais mentiria".

O sentido é parecido com はずがない. わけがない soa um pouco mais emocional e coloquial, e はずがない, um pouco mais lógico.

Na fala, わけがない costuma virar わけない.""",
st="""Verbo / Adjetivo い (forma simples) + わけがない
Adjetivo な + な + わけがない
Substantivo + の / である + わけがない

Educado: わけがありません
Fala: わけない""",
no="""わけがないでしょう, com でしょう, reforça a ideia de "é óbvio que não", com tom de indignação.

Não confunda com わけではない (não é que...), que é uma negação parcial e suave.

Por ser forte, わけがない pode soar teimoso se usado sem um bom motivo.""",
bf="わけがない",
rx="わけがない|わけない|わけがありません|訳がない",
tk=["わけ", "が", "ない"],
va=["わけがない", "わけない", "わけがありません"],
E=[
("こんな難しい問題が、子供にわかるわけがない。", "こんなむずかしいもんだいが、こどもにわかるわけがない。", "Não tem como uma criança entender uma questão tão difícil."),
("彼がうそをつくわけがない。", "かれがうそをつくわけがない。", "É impossível que ele minta."),
("一日でこの仕事が終わるわけがない。", "いちにちでこのしごとがおわるわけがない。", "Não tem como este trabalho terminar em um dia."),
("あんなに練習したのだから、負けるわけがない。", "あんなにれんしゅうしたのだから、まけるわけがない。", "Com tanto treino, não tem como perder."),
("そんな高い物、買えるわけがないでしょう。", "そんなたかいもの、かえるわけがないでしょう。", "Uma coisa tão cara dessas, é claro que não dá para comprar."),
],
R=[
("勉強していないのに、合格する____。", "Sem estudar, não tem como passar.", ["わけがない", "わけない"]),
("優しい彼女がそんなひどいことを言う____。", "É impossível que ela, tão gentil, tenha dito algo tão cruel.", ["わけがない", "わけない"]),
("こんなにたくさん、一人で全部食べられる____。", "Tanta comida assim, não tem como comer tudo sozinho.", ["わけがない", "わけない"]),
("まだ朝の五時だから、店が開いている____。", "Ainda são cinco da manhã, então não tem como a loja estar aberta.", ["わけがない", "わけない"]),
("いつも穏やかな彼が怒る____。", "É impossível que ele, sempre tão calmo, fique bravo.", ["わけがない", "わけない"]),
],
),
dict(
n=169,
jp="〜わけにはいかない",
rd="wake ni wa ikanai",
tr="Não posso / Não dá para / Não seria certo",
ex="""わけにはいかない é usado para dizer que, por razões morais, sociais ou de responsabilidade, a pessoa não pode fazer algo, mesmo que queira ou que seja fisicamente possível. Equivale a "não posso", "não dá para" ou "não seria certo".

A diferença em relação a できない é o motivo. できない indica incapacidade. わけにはいかない indica que fazer aquilo seria errado ou inadequado na situação, por causa de compromissos, regras ou o que os outros esperam.

Por exemplo, "amanhã tem prova, então não dá para ir passear" ou "vim de carro, então não posso beber".

Com a forma ない, ないわけにはいかない significa "não tenho como não fazer", ou seja, "sou obrigado a fazer".""",
st="""Verbo na forma de dicionário + わけにはいかない
Verbo na forma ない + わけにはいかない (não tenho como não fazer)

Educado: わけにはいきません
Variação: わけにもいかない (também não dá para...)""",
no="""わけにもいかない, com も, mostra que a pessoa está num dilema: não pode fazer nem uma coisa nem outra.

É muito comum no trabalho, para explicar por que não se pode faltar, recusar ou desistir.

ないわけにはいかない aparece separadamente como gramática do N3 e expressa uma obrigação social.""",
bf="わけにはいかない",
rx="わけにはいかない|わけにはいきません|わけにもいかない",
tk=["わけ", "には", "いかない"],
va=["わけにはいかない", "わけにはいきません", "わけにもいかない"],
E=[
("明日は試験だから、遊びに行くわけにはいかない。", "あしたはしけんだから、あそびにいくわけにはいかない。", "Amanhã tem prova, então não dá para ir passear."),
("約束したので、行かないわけにはいかない。", "やくそくしたので、いかないわけにはいかない。", "Eu prometi, então não tenho como não ir."),
("大切な会議なので、休むわけにはいきません。", "たいせつなかいぎなので、やすむわけにはいきません。", "É uma reunião importante, então não posso faltar."),
("車で来たから、お酒を飲むわけにはいかない。", "くるまできたから、おさけをのむわけにはいかない。", "Vim de carro, então não posso beber."),
("先輩に頼まれたら、断るわけにもいかない。", "せんぱいにたのまれたら、ことわるわけにもいかない。", "Se o veterano me pede, também não dá para recusar."),
],
R=[
("熱があるが、今日は大事な仕事があるから休む____。", "Estou com febre, mas hoje tenho um trabalho importante, então não posso faltar.", ["わけにはいかない", "わけにはいきません"]),
("これは友達に借りた物だから、捨てる____。", "Isto é emprestado de um amigo, então não dá para jogar fora.", ["わけにはいかない", "わけにはいきません"]),
("みんなが待っているので、一人で先に帰る____。", "Todos estão esperando, então não posso ir embora sozinho antes.", ["わけにはいかない", "わけにはいきません"]),
("一度約束したことを破る____。", "Não seria certo quebrar algo que prometi.", ["わけにはいかない", "わけにはいきません"]),
("子供が見ているから、親の私が泣く____。", "Meu filho está olhando, então eu, como mãe, não posso chorar.", ["わけにはいかない", "わけにはいきません"]),
],
),
dict(
n=170,
jp="〜割に",
rd="wari ni",
tr="Para (alguém que...) / Considerando que / Em proporção a",
ex="""割に é usado para dizer que algo é diferente do que se esperaria, considerando certa condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa, e a segunda mostra que o resultado não está de acordo com ela. Por exemplo, "para o preço, é gostoso" ou "considerando que estudei, a nota foi ruim".

O resultado pode ser positivo ou negativo. O importante é o desequilíbrio entre a condição e o resultado.

Com は, 割には reforça o contraste.

O sentido é parecido com にしては, mas 割に é usado para graus ou características que podem variar (preço, idade, esforço), enquanto にしては costuma vir com substantivos mais específicos (estrangeiro, primeira vez).""",
st="""Verbo / Adjetivo (forma simples) + 割に / 割には
Adjetivo な + な + 割に
Substantivo + の + 割に

Escrita: 割に / わりに""",
no="""Sozinho, わりに também é um advérbio que significa "relativamente": この店はわりに安い (esta loja é relativamente barata).

年の割に ("para a idade") é uma das combinações mais comuns.

Comparado a のに, 割に destaca mais a proporção entre a condição e o resultado.""",
bf="割に",
rx="割に|わりに|割には|わりには",
tk=["割", "に"],
va=["割に", "割には", "わりに"],
E=[
("この店は値段の割においしい。", "このみせはねだんのわりにおいしい。", "Para o preço, a comida desta loja é gostosa."),
("彼は年の割に若く見える。", "かれはとしのわりにわかくみえる。", "Para a idade, ele parece jovem."),
("勉強した割には、点数が悪かった。", "べんきょうしたわりには、てんすうがわるかった。", "Considerando que estudei, a nota foi ruim."),
("この部屋は狭い割に、家賃が高い。", "このへやはせまいわりに、やちんがたかい。", "Para um apartamento tão pequeno, o aluguel é caro."),
("彼女はたくさん食べる割に太らない。", "かのじょはたくさんたべるわりにふとらない。", "Para quem come tanto, ela não engorda."),
],
R=[
("このかばんは安い____、丈夫だ。", "Para uma bolsa barata, ela é resistente.", ["割に", "わりに"]),
("彼は体が大きい____、力が弱い。", "Para alguém tão grande, ele tem pouca força.", ["割に", "わりに"]),
("毎日練習した____、上手にならなかった。", "Considerando que pratiquei todo dia, não melhorei muito.", ["割に", "わりに"]),
("この映画は評判の____、おもしろくなかった。", "Para a fama que tinha, este filme não foi interessante.", ["割に", "わりに"]),
("父は年の____、元気だ。", "Para a idade, meu pai é bem disposto.", ["割に", "わりに"]),
],
),
]
