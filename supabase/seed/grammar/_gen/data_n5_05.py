G = [
dict(
n=41,
jp="〜なくちゃ",
rd="nakucha",
tr="Tenho que / Preciso / Devo",
ex="""なくちゃ é uma forma falada e casual de dizer que algo precisa ser feito. Equivale a "tenho que" ou "preciso".

Ela vem da forma completa なくては, que na fala rápida vira なくちゃ. A frase completa seria なくてはいけない ou なくてはならない, mas, na conversa, o final いけない é muitas vezes omitido, porque o sentido de obrigação já fica claro.

Por ser bem informal, なくちゃ é usada com amigos, família ou quando a pessoa fala consigo mesma, lembrando de algo que precisa fazer.

Existe ainda outra forma curta muito comum, なきゃ, que vem de なければ e tem exatamente o mesmo sentido.""",
st="""Verbo na forma ない sem い + くちゃ
Verbo na forma ない sem い + くちゃ + いけない / ならない

Forma completa: なくては + いけない / ならない
Variação: Verbo na forma ない sem い + きゃ (なきゃ)""",
no="""なくちゃ e なきゃ são extremamente comuns na fala do dia a dia, principalmente entre jovens.

Por serem contrações, não são adequadas para situações formais, como falar com um chefe ou escrever um e-mail de trabalho. Nesses casos, usa-se なければなりません ou なくてはいけません.

O mesmo tipo de contração aparece em ちゃいけない, onde ては vira ちゃ.""",
bf="なくちゃ",
rx="なくちゃ|なきゃ",
tk=["なくちゃ"],
va=["なくちゃ", "なきゃ", "なくちゃいけない", "なくちゃならない", "なきゃいけない"],
E=[
("あ、もう行かなくちゃ。", "あ、もういかなくちゃ。", "Ah, já tenho que ir."),
("明日は早く起きなくちゃ。", "あしたははやくおきなくちゃ。", "Amanhã tenho que acordar cedo."),
("今日は宿題をしなくちゃいけない。", "きょうはしゅくだいをしなくちゃいけない。", "Hoje tenho que fazer a lição."),
("寝る前に薬を飲まなくちゃ。", "ねるまえにくすりをのまなくちゃ。", "Preciso tomar o remédio antes de dormir."),
("牛乳がない。買いに行かなきゃ。", "ぎゅうにゅうがない。かいにいかなきゃ。", "Acabou o leite. Tenho que ir comprar."),
],
R=[
("あ、もう八時だ。急が____。", "Ah, já são oito horas. Tenho que me apressar.", ["なくちゃ", "なきゃ"]),
("来週テストだから、勉強し____。", "Semana que vem tem prova, então tenho que estudar.", ["なくちゃ", "なきゃ"]),
("部屋が汚いから、掃除し____。", "O quarto está sujo, então preciso limpar.", ["なくちゃ", "なきゃ"]),
("今晩、母に電話し____いけない。", "Hoje à noite tenho que ligar para minha mãe.", ["なくちゃ", "なきゃ"]),
("明日は大事な会議だから、早く寝____。", "Amanhã tem uma reunião importante, então tenho que dormir cedo.", ["なくちゃ", "なきゃ"]),
],
),
dict(
n=42,
jp="〜なくてはいけない",
rd="nakute wa ikenai",
tr="Ter que / Precisar / Dever",
ex="""なくてはいけない é usado para dizer que algo é obrigatório ou necessário. Equivale a "ter que" ou "precisar".

A lógica da estrutura é uma dupla negação: "se não fizer, não está bem". Ou seja, não fazer é proibido, então é preciso fazer.

Ela é formada pela forma ない do verbo, trocando o い final por くては, seguida de いけない. Na forma educada, fica なくてはいけません.

なくてはいけない costuma expressar uma obrigação ligada à situação ou ao senso pessoal de dever, como regras do dia a dia, compromissos e coisas que a pessoa sente que precisa fazer. É mais comum na conversa que なくてはならない, que soa mais formal.""",
st="""Verbo na forma ない sem い + くてはいけない
Adjetivo い sem い + くなくてはいけない
Substantivo / Adjetivo な + でなくてはいけない

Educado: なくてはいけません
Passado: なくてはいけなかった / なくてはいけませんでした""",
no="""Na fala, なくては costuma virar なくちゃ, formando なくちゃいけない. Essa é a versão casual da mesma ideia.

As formas なければいけない e なければならない também expressam obrigação e são muito comuns. Elas aparecem no N4.

Para dizer que algo não é necessário, o oposto é なくてもいい.""",
bf="なくてはいけない",
rx="なくてはいけない|なくてはいけません|なくてはいけなかった",
tk=["なくて", "は", "いけない"],
va=["なくてはいけない", "なくてはいけません", "なくてはいけなかった", "なくてはいけませんでした"],
E=[
("毎日薬を飲まなくてはいけません。", "まいにちくすりをのまなくてはいけません。", "Tenho que tomar remédio todo dia."),
("明日までにレポートを出さなくてはいけない。", "あしたまでにレポートをださなくてはいけない。", "Tenho que entregar o relatório até amanhã."),
("この学校では制服を着なくてはいけません。", "このがっこうではせいふくをきなくてはいけません。", "Nesta escola, é preciso usar uniforme."),
("昨日は遅くまで働かなくてはいけなかった。", "きのうはおそくまではたらかなくてはいけなかった。", "Ontem tive que trabalhar até tarde."),
("日本では車は左側を走らなくてはいけません。", "にほんではくるまはひだりがわをはしらなくてはいけません。", "No Japão, os carros precisam andar pela esquerda."),
],
R=[
("毎朝六時に起き____。", "Tenho que acordar às seis toda manhã.", ["なくてはいけません", "なくてはいけない"]),
("今日中に宿題をし____。", "Tenho que fazer a lição ainda hoje.", ["なくてはいけません", "なくてはいけない"]),
("図書館の本は今週返さ____。", "Tenho que devolver os livros da biblioteca esta semana.", ["なくてはいけません", "なくてはいけない"]),
("昨日は病院に行か____。", "Ontem tive que ir ao hospital.", ["なくてはいけなかった", "なくてはいけませんでした"]),
("車を運転するときは、免許を持ってい____。", "Quando dirige, você precisa estar com a carteira de motorista.", ["なくてはいけません", "なくてはいけない"]),
],
),
dict(
n=43,
jp="〜なくてはならない",
rd="nakute wa naranai",
tr="Ter que / Ser obrigatório / Precisar",
ex="""なくてはならない também significa "ter que" e expressa obrigação ou necessidade, assim como なくてはいけない.

A lógica é a mesma dupla negação: "se não fizer, não dá certo". Por isso, o resultado é uma obrigação.

A diferença está no tom. なくてはならない soa mais formal e objetivo. Ele é muito usado para obrigações gerais, regras sociais, leis e necessidades que não dependem da opinião de quem fala. Também aparece mais na escrita e em discursos.

Já なくてはいけない é mais comum na conversa e costuma refletir uma obrigação sentida pela própria pessoa. Na prática, as duas formas muitas vezes podem ser trocadas.""",
st="""Verbo na forma ない sem い + くてはならない
Adjetivo い sem い + くなくてはならない
Substantivo / Adjetivo な + でなくてはならない

Educado: なくてはなりません
Passado: なくてはならなかった / なくてはなりませんでした""",
no="""Na fala casual, なくてはならない pode virar なくちゃならない, mas essa forma é menos comum do que なくちゃいけない.

なくてはならない também pode ser usado como adjetivo antes de um substantivo, com o sentido de "indispensável", como algo sem o qual não se vive.

As formas なければならない e なければなりません têm o mesmo sentido e são muito usadas em textos formais.""",
bf="なくてはならない",
rx="なくてはならない|なくてはなりません|なくてはならなかった",
tk=["なくて", "は", "ならない"],
va=["なくてはならない", "なくてはなりません", "なくてはならなかった", "なくてはなりませんでした"],
E=[
("社員は毎朝九時までに会社に来なくてはなりません。", "しゃいんはまいあさくじまでにかいしゃにこなくてはなりません。", "Os funcionários precisam chegar à empresa até as nove toda manhã."),
("外国に行くとき、パスポートを持っていなくてはならない。", "がいこくにいくとき、パスポートをもっていなくてはならない。", "Quando se vai ao exterior, é preciso ter passaporte."),
("来月、引っ越さなくてはならない。", "らいげつ、ひっこさなくてはならない。", "Mês que vem, vou ter que me mudar."),
("試験では、黒いペンを使わなくてはなりません。", "しけんでは、くろいペンをつかわなくてはなりません。", "Na prova, é obrigatório usar caneta preta."),
("父が病気で、仕事を休まなくてはならなかった。", "ちちがびょうきで、しごとをやすまなくてはならなかった。", "Meu pai ficou doente, e eu tive que faltar ao trabalho."),
],
R=[
("国民は税金を払わ____。", "Os cidadãos têm que pagar impostos.", ["なくてはなりません", "なくてはならない"]),
("会議の前に資料を読ま____。", "É preciso ler os documentos antes da reunião.", ["なくてはなりません", "なくてはならない"]),
("留学生はビザを持ってい____。", "Os estudantes estrangeiros precisam ter visto.", ["なくてはなりません", "なくてはならない"]),
("先週は毎日残業し____。", "Semana passada, tive que fazer hora extra todo dia.", ["なくてはならなかった", "なくてはなりませんでした"]),
("約束は守ら____。", "Promessas devem ser cumpridas.", ["なくてはならない", "なくてはなりません"]),
],
),
dict(
n=44,
jp="〜なる",
rd="naru",
tr="Tornar-se / Ficar / Virar",
ex="""なる significa "tornar-se", "ficar" ou "virar". Ele mostra uma mudança: algo passa de um estado para outro.

A forma de ligar なる depende da palavra que vem antes. Com substantivos e adjetivos な, usa-se に antes de なる. Com adjetivos い, troca-se o い final por く.

なる é usado para mudanças de profissão, idade, estação do ano, clima, sentimentos e habilidades, entre muitas outras coisas.

Um ponto importante é que なる indica uma mudança que acontece naturalmente ou como resultado de algo. Quando alguém provoca a mudança de propósito, o japonês usa する no lugar de なる.""",
st="""Substantivo + に + なる
Adjetivo な (sem な) + に + なる
Adjetivo い sem い + く + なる

Educado: なります
Passado: なった / なりました
Desejo: になりたい / くなりたい""",
no="""A diferença entre なる e する é importante: きれいになる é "ficar limpo", enquanto きれいにする é "deixar limpo", ou seja, alguém limpou.

Para idade, usa-se なる para dizer quantos anos alguém vai fazer ou fez.

Em lojas e restaurantes, frases com になります aparecem muito como uma forma educada de apresentar algo, como o valor da conta. É um uso típico do atendimento ao cliente.""",
bf="なる",
rx="になる|になります|になりました|になった|になって|になりたい|くなる|くなります|くなりました|くなった|くなって",
tk=["に", "く", "なる"],
va=["になる", "になります", "になった", "になりました", "くなる", "くなります", "くなった", "くなりました"],
E=[
("弟は医者になりました。", "おとうとはいしゃになりました。", "Meu irmão mais novo virou médico."),
("掃除して、部屋がきれいになった。", "そうじして、へやがきれいになった。", "Limpei, e o quarto ficou limpo."),
("十一月になって、寒くなりました。", "じゅういちがつになって、さむくなりました。", "Chegou novembro e esfriou."),
("将来、先生になりたいです。", "しょうらい、せんせいになりたいです。", "No futuro, quero ser professor."),
("日本語が上手になりましたね。", "にほんごがじょうずになりましたね。", "Seu japonês melhorou bastante, hein."),
],
R=[
("姉は来年二十歳に____。", "Minha irmã mais velha vai fazer vinte anos no ano que vem.", ["なります", "なる"]),
("薬を飲んで、元気に____。", "Tomei o remédio e fiquei bem.", ["なりました", "なった"]),
("急に空が暗く____。", "De repente, o céu ficou escuro.", ["なりました", "なった"]),
("大人になったら、何に____たいですか。", "Quando crescer, o que você quer ser?", ["なり"]),
("毎日練習して、ピアノが上手に____。", "Pratiquei todo dia e fiquei bom no piano.", ["なりました", "なった"]),
],
),
dict(
n=45,
jp="〜んです",
rd="n desu",
tr="É que / Acontece que / Sabe",
ex="""んです é usado para explicar uma situação, dar um motivo ou pedir uma explicação. Ele dá à frase o sentido de "é que...", "acontece que...".

A diferença entre uma frase normal e uma frase com んです é o foco. Uma frase normal só informa um fato. Com んです, a pessoa está ligando aquele fato ao contexto: explicando por que algo aconteceu, justificando algo ou mostrando interesse em entender a situação.

Em perguntas, んですか mostra que quem pergunta percebeu algo e quer uma explicação, como "o que aconteceu?" ao ver alguém triste.

Também é muito usado antes de um pedido ou pergunta, apresentando a situação primeiro: "é que eu queria ir à estação...".

んです é a forma falada de のです. Na fala informal, usa-se んだ ou の.""",
st="""Verbo / Adjetivo い (forma simples) + んです
Substantivo / Adjetivo な + な + んです

Pergunta: 〜んですか
Antes de pedido: 〜んですが / 〜んですけど

Informal: 〜んだ / 〜の
Forma escrita: 〜のです""",
no="""Usar んです demais pode soar insistente, porque toda frase vira uma explicação. Ele deve aparecer quando existe um contexto a ser explicado.

Em perguntas, んですか pode soar como cobrança se o tom for forte, principalmente em perguntas negativas.

Com substantivos e adjetivos な, não se esqueça do な: 休みなんです, e não 休みんです.""",
bf="んです",
rx="んです|んだ",
tk=["ん", "です"],
va=["んです", "んですか", "んだ", "のです"],
E=[
("すみません、頭が痛いんです。", "すみません、あたまがいたいんです。", "Desculpe, é que estou com dor de cabeça."),
("どうしたんですか。", "どうしたんですか。", "O que aconteceu?"),
("明日は休みなんです。", "あしたはやすみなんです。", "É que amanhã é folga."),
("実は、来月結婚するんです。", "じつは、らいげつけっこんするんです。", "Na verdade, vou me casar no mês que vem."),
("駅に行きたいんですが、どう行けばいいですか。", "えきにいきたいんですが、どういけばいいですか。", "Eu queria ir à estação. Como faço para chegar?"),
],
R=[
("「どうして食べないんですか。」「お腹が痛い____。」", "\"Por que você não está comendo?\" \"É que estou com dor de barriga.\"", ["んです"]),
("元気がないですね。どうした____。", "Você está desanimado, hein. O que houve?", ["んですか"]),
("「昨日、休みましたね。」「ええ、熱があった____。」", "\"Você faltou ontem, né?\" \"Sim, é que eu estava com febre.\"", ["んです"]),
("このかばん、すごく高かった____よ。", "Esta bolsa foi muito cara, sabia?", ["んです", "んだ"]),
("「すみません、遅れて。」「いいえ、私も今来た____。」", "\"Desculpe o atraso.\" \"Não tem problema, eu também acabei de chegar.\"", ["んです", "んだ"]),
],
),
dict(
n=46,
jp="ね",
rd="ne",
tr="Né / Não é? / Hein / Certo?",
ex="""ね é uma partícula de final de frase usada para buscar a concordância ou a confirmação de quem está ouvindo. Equivale ao nosso "né?", "não é?" ou "certo?".

Ela é usada quando quem fala acredita que o ouvinte também sabe ou sente o mesmo. Por isso, aparece muito em comentários sobre o tempo, sobre comida e sobre coisas que as duas pessoas estão vendo juntas.

ね também serve para confirmar uma informação, como um horário ou um combinado, e para deixar a frase mais suave e simpática.

Ela funciona depois de frases formais e informais. Com substantivos e adjetivos な, na forma simples, usa-se だね.""",
st="""Frase (forma educada) + ね
Frase (forma simples) + ね
Substantivo / Adjetivo な + ですね / だね""",
no="""ね é diferente de よ: ね busca concordância sobre algo compartilhado, enquanto よ passa uma informação nova que o outro talvez não saiba.

A combinação よね mistura as duas ideias: quem fala tem quase certeza, mas quer confirmar.

Usar ね com frequência deixa a conversa mais calorosa. Uma frase sem ね pode soar mais seca em certas situações.

Prolongar para ねえ pode expressar emoção ou chamar a atenção de alguém.""",
bf="ね",
rx="ね",
tk=["ね"],
va=["ね", "ねえ"],
E=[
("今日は暑いですね。", "きょうはあついですね。", "Hoje está quente, né?"),
("このケーキ、おいしいね。", "このケーキ、おいしいね。", "Este bolo é gostoso, né?"),
("明日の会議は十時からですね。", "あしたのかいぎはじゅうじからですね。", "A reunião de amanhã é a partir das dez, certo?"),
("じゃ、また明日ね。", "じゃ、またあしたね。", "Então, até amanhã, tá?"),
("日本語が上手ですね。", "にほんごがじょうずですね。", "Você fala bem japonês, hein."),
],
R=[
("「いい天気ですね。」「そうです____。」", "\"Que dia bonito, né?\" \"É mesmo.\"", ["ね"]),
("会議は三時からです____。", "A reunião é a partir das três, certo?", ["ね"]),
("この花、きれいだ____。", "Esta flor é bonita, né?", ["ね"]),
("じゃ、駅の前で待ってる____。", "Então vou te esperar em frente à estação, tá?", ["ね"]),
("田中さんはまだ来ていません____。", "O Tanaka ainda não chegou, né?", ["ね"]),
],
),
dict(
n=47,
jp="に",
rd="ni",
tr="Em / Para / A / Às",
ex="""に é uma das partículas mais versáteis do japonês. A ideia central é marcar um "ponto": um ponto no tempo, um ponto no espaço ou o ponto de chegada de uma ação.

Os principais usos são:
• Tempo específico: horários, dias e datas em que algo acontece.
• Lugar de existência: onde algo ou alguém está, com ある e いる.
• Destino: para onde se vai, se vem ou se volta.
• Pessoa que recebe a ação: a quem se dá algo, com quem se encontra, para quem se telefona.
• Ponto de chegada: onde se entra, onde se senta, em que veículo se sobe.
• Frequência: quantas vezes algo acontece em um período.

Para tempos relativos, como hoje, amanhã e toda semana, normalmente não se usa に. Ele é usado com tempos "marcados", como horas, datas e dias da semana.""",
st="""Tempo específico + に
Lugar + に + ある / いる
Destino + に + 行く / 来る / 帰る
Pessoa + に + あげる / 会う / 電話する / 聞く
Lugar / Veículo + に + 入る / 乗る / 座る
Período + に + Número de vezes""",
no="""A diferença entre に e で para lugares é um ponto clássico: に marca onde algo está ou para onde vai, e で marca onde uma ação acontece.

Com destinos, に e へ podem ser trocados na maioria dos casos. に destaca o ponto de chegada, e へ destaca a direção.

Palavras como 今日, 明日, 毎日 e 来週 normalmente não levam に.""",
bf="に",
rx="に",
tk=["に"],
va=["に"],
E=[
("毎朝七時に起きます。", "まいあさしちじにおきます。", "Acordo às sete toda manhã."),
("猫は机の下にいます。", "ねこはつくえのしたにいます。", "O gato está embaixo da mesa."),
("来年、日本に行きます。", "らいねん、にほんにいきます。", "Ano que vem, vou para o Japão."),
("友達に手紙を書きました。", "ともだちにてがみをかきました。", "Escrevi uma carta para um amigo."),
("一週間に三回、ジムに行きます。", "いっしゅうかんにさんかい、ジムにいきます。", "Vou à academia três vezes por semana."),
],
R=[
("授業は九時____始まります。", "A aula começa às nove.", ["に"]),
("銀行は駅の前____あります。", "O banco fica em frente à estação.", ["に"]),
("駅で電車____乗ります。", "Pego o trem na estação.", ["に"]),
("昨日、町で先生____会いました。", "Ontem encontrei o professor na cidade.", ["に"]),
("一日____二回、薬を飲みます。", "Tomo o remédio duas vezes por dia.", ["に"]),
],
),
dict(
n=48,
jp="〜に行く",
rd="ni iku",
tr="Ir (fazer algo) / Ir para",
ex="""に行く é usado para dizer que alguém vai a algum lugar com um objetivo. Equivale a "ir fazer algo" ou "ir para fazer algo".

A estrutura junta o verbo da ação que a pessoa vai fazer, na forma ます sem ます, com に e o verbo de movimento. Assim, o に aqui marca a finalidade do deslocamento.

Além de 行く, a mesma estrutura funciona com 来る (vir) e 帰る (voltar), sempre com a ideia de "ir, vir ou voltar para fazer algo".

Com verbos do tipo "substantivo + する", como 買い物する ou 散歩する, é comum usar só o substantivo antes de に, como 買い物に行く.

O lugar para onde se vai pode aparecer antes, marcado com へ ou に.""",
st="""Verbo na forma ます sem ます + に + 行く / 来る / 帰る
Substantivo de ação + に + 行く / 来る / 帰る
Lugar + へ / に + Verbo sem ます + に + 行く""",
no="""Quando o lugar e a finalidade aparecem juntos, é comum usar へ para o lugar, evitando repetir に duas vezes seguidas.

Essa construção funciona só com verbos de movimento. Para outras finalidades, usa-se ために, que aparece em níveis seguintes.

Em convites, ela combina muito bem com ませんか, como ao chamar alguém para ir comer ou ver algo.""",
bf="に行く",
rx="に行|にいく|にいき|にいっ|に来|にきます|にきました|にきた|に帰",
tk=["に", "行く"],
va=["に行く", "に行きます", "に行った", "に行きました", "に来る", "に来ます", "に帰る", "に帰ります"],
E=[
("友達と映画を見に行きました。", "ともだちとえいがをみにいきました。", "Fui ver um filme com um amigo."),
("昼ご飯を食べに行きませんか。", "ひるごはんをたべにいきませんか。", "Quer ir almoçar?"),
("週末、デパートへ買い物に行きます。", "しゅうまつ、デパートへかいものにいきます。", "No fim de semana, vou fazer compras na loja de departamentos."),
("日本へ日本語を勉強しに来ました。", "にほんへにほんごをべんきょうしにきました。", "Vim ao Japão para estudar japonês."),
("忘れ物を取りに家に帰りました。", "わすれものをとりにいえにかえりました。", "Voltei para casa para pegar uma coisa que esqueci."),
],
R=[
("図書館へ本を借り____。", "Vou à biblioteca pegar um livro emprestado.", ["に行きます", "にいきます", "に行く", "にいく"]),
("週末、海へ泳ぎ____。", "No fim de semana, fui nadar na praia.", ["に行きました", "にいきました", "に行った", "にいった"]),
("駅まで友達を迎え____。", "Vou buscar meu amigo na estação.", ["に行きます", "にいきます", "に行く", "にいく"]),
("夕方、公園へ散歩____。", "No fim da tarde, vou passear no parque.", ["に行きます", "にいきます", "に行く", "にいく"]),
("母が東京へ私に会い____。", "Minha mãe veio a Tóquio para me ver.", ["に来ました", "にきました", "に来た", "にきた"]),
],
),
dict(
n=49,
jp="〜にする",
rd="ni suru",
tr="Escolher / Decidir por / Ficar com",
ex="""にする é usado para dizer que você escolheu ou decidiu algo entre várias opções. Equivale a "escolher", "decidir por" ou "ficar com".

É muito usado em restaurantes, lojas e na hora de combinar planos. Por exemplo, ao pedir uma bebida, dizer "vou ficar com café".

A coisa escolhida vem antes de に, e する indica a decisão. Na forma educada, usa-se にします para a escolha no momento e にしました para uma decisão já tomada.

Em perguntas, 何にしますか é a forma natural de perguntar "o que você vai querer?" ou "o que você escolhe?".

Com ましょう e よう, a estrutura vira uma proposta de escolha para o grupo.""",
st="""Substantivo + に + する
Substantivo + に + します / しました
何 / どれ / いつ + に + しますか
Substantivo + に + しましょう / しよう""",
no="""Não confunda essa にする com a にする que indica transformação, como deixar algo limpo ou silencioso. A diferença é que aqui a palavra antes de に é uma opção escolhida.

Em lanchonetes e restaurantes, にします é uma forma mais delicada de pedir do que ください, porque soa como uma escolha pessoal.

Para decisões sobre ações, o japonês usa ことにする, que aparece no N4.""",
bf="にする",
rx="にする|にします|にしました|にした|にしよう|にしましょう",
tk=["に", "する"],
va=["にする", "にします", "にしました", "にした", "にしよう", "にしましょう"],
E=[
("私はコーヒーにします。", "わたしはコーヒーにします。", "Vou querer café."),
("飲み物は何にしますか。", "のみものはなににしますか。", "O que você vai querer de bebida?"),
("旅行は来週にしました。", "りょこうはらいしゅうにしました。", "Decidi fazer a viagem na semana que vem."),
("プレゼントはこのかばんにしよう。", "プレゼントはこのかばんにしよう。", "Vou escolher esta bolsa como presente."),
("会議は三時からにしましょう。", "かいぎはさんじからにしましょう。", "Vamos marcar a reunião a partir das três."),
],
R=[
("「飲み物は何にしますか。」「紅茶____。」", "\"O que vai querer de bebida?\" \"Vou querer chá.\"", ["にします"]),
("今日の晩ご飯はカレー____。", "Vamos de curry no jantar de hoje.", ["にしましょう", "にしよう"]),
("迷ったけど、色は赤____。", "Fiquei em dúvida, mas escolhi a cor vermelha.", ["にしました", "にした"]),
("待ち合わせは駅の前____か。", "Que tal nos encontrarmos em frente à estação?", ["にしましょう", "にします"]),
("「どれにしますか。」「じゃ、これ____。」", "\"Qual você vai querer?\" \"Então, vou ficar com este.\"", ["にします", "にする"]),
],
),
dict(
n=50,
jp="に・へ",
rd="ni / e",
tr="Para / A / Em direção a",
ex="""に e へ são usadas para indicar o destino de um movimento, com verbos como ir, vir, voltar e virar. As duas podem ser traduzidas como "para" ou "a".

Na maioria das frases com verbos de movimento, as duas funcionam e o sentido é praticamente o mesmo. A diferença é de foco: に destaca o ponto de chegada, o lugar exato aonde se chega; へ destaca a direção, o caminho em direção a algum lugar.

Por causa dessa ideia de direção, へ combina bem com cartas, mensagens e palavras de direção, como "à direita" ou "para cá".

Uma diferença prática importante: só へ pode ser seguida por の para formar um modificador, como "uma carta para minha mãe". Com に, isso não é possível.""",
st="""Lugar + に + Verbo de movimento
Lugar + へ + Verbo de movimento
Substantivo + への + Substantivo (só へ)""",
no="""A partícula へ é escrita com o caractere へ, mas é pronunciada "e". É a mesma situação de は, que é lida "wa" quando é partícula.

Em frases educadas de recepção, como こちらへどうぞ, へ é a escolha natural.

Para usos que não são de movimento, como horário, existência e pessoa que recebe algo, só に funciona.""",
bf="に",
rx="に|へ",
tk=["に", "へ"],
va=["に", "へ"],
E=[
("明日、東京へ行きます。", "あした、とうきょうへいきます。", "Amanhã vou para Tóquio."),
("毎日八時に会社に行きます。", "まいにちはちじにかいしゃにいきます。", "Todo dia vou para a empresa às oito."),
("夏休みに国へ帰りました。", "なつやすみにくにへかえりました。", "Nas férias de verão, voltei para o meu país."),
("こちらへどうぞ。", "こちらへどうぞ。", "Por aqui, por favor."),
("これは母への手紙です。", "これはははへのてがみです。", "Esta é uma carta para minha mãe."),
],
R=[
("来週、大阪____行きます。", "Semana que vem, vou para Osaka.", ["に", "へ"]),
("何時に家____帰りますか。", "A que horas você volta para casa?", ["に", "へ"]),
("昨日、友達が私の家____来ました。", "Ontem, um amigo veio à minha casa.", ["に", "へ"]),
("これは先生____のプレゼントです。", "Este é um presente para o professor.", ["へ"]),
("次の角を右____曲がってください。", "Vire à direita na próxima esquina, por favor.", ["に", "へ"]),
],
),
]
