G = [
dict(
n=121,
jp="たとえ〜ても",
rd="tatoe ~ te mo",
tr="Mesmo que / Ainda que / Nem que",
ex="""たとえ〜ても é usado para dizer que, mesmo que uma situação hipotética aconteça, o resultado ou a decisão não muda. Equivale a "mesmo que", "ainda que" ou "nem que".

たとえ vem no começo e reforça a ideia de hipótese. O verbo ou adjetivo vai para a forma ても.

A segunda parte geralmente expressa uma decisão firme, uma regra ou uma convicção. Por exemplo, "mesmo que chova, a partida será realizada" ou "mesmo que todos sejam contra, eu vou".

Com adjetivos い, usa-se くても. Com substantivos e adjetivos な, usa-se でも.

A forma たとえ〜としても, um pouco mais formal, também é usada com o mesmo sentido.""",
st="""たとえ + Verbo na forma て + も
たとえ + Adjetivo い sem い + くても
たとえ + Substantivo / Adjetivo な + でも
たとえ + … + としても (mais formal)

Escrita: たとえ / 例え""",
no="""たとえ não é obrigatório, mas deixa claro desde o começo que a frase é uma hipótese.

Não confunda com 例えば (por exemplo), que tem a mesma origem, mas outro sentido.

É muito comum em frases de determinação e promessas fortes.""",
bf="たとえ",
rx="たとえ|例え",
tk=["たとえ", "ても"],
va=["たとえ〜ても", "たとえ〜でも", "たとえ〜としても"],
E=[
("たとえ雨が降っても、試合は行います。", "たとえあめがふっても、しあいはおこないます。", "Mesmo que chova, a partida será realizada."),
("たとえ反対されても、私は留学する。", "たとえはんたいされても、わたしはりゅうがくする。", "Mesmo que sejam contra, eu vou fazer intercâmbio."),
("たとえ高くても、いい物を買いたい。", "たとえたかくても、いいものをかいたい。", "Mesmo que seja caro, quero comprar algo bom."),
("たとえ子供でも、ルールは守らなければならない。", "たとえこどもでも、ルールはまもらなければならない。", "Mesmo sendo criança, é preciso seguir as regras."),
("たとえ失敗しても、後悔はしない。", "たとえしっぱいしても、こうかいはしない。", "Mesmo que eu fracasse, não vou me arrepender."),
],
R=[
("____忙しくても、毎日運動する。", "Mesmo que esteja ocupado, faço exercício todo dia.", ["たとえ"]),
("____冗談でも、そんなことを言ってはいけない。", "Mesmo que seja brincadeira, não se deve dizer uma coisa dessas.", ["たとえ"]),
("____みんなが反対しても、私は行く。", "Mesmo que todos sejam contra, eu vou.", ["たとえ"]),
("____お金がなくても、幸せに暮らせる。", "Mesmo sem dinheiro, dá para viver feliz.", ["たとえ"]),
("____遠くても、会いに行きます。", "Mesmo que seja longe, vou te ver.", ["たとえ"]),
],
),
dict(
n=122,
jp="例えば",
rd="tatoeba",
tr="Por exemplo / Digamos que",
ex="""例えば significa "por exemplo". Ele é usado para dar exemplos concretos de algo mais geral.

Muitas vezes, aparece depois de uma categoria, separada por vírgula: "frutas, por exemplo maçã e mexerica". Também é comum junto com や e など, que reforçam a ideia de exemplos.

No começo de uma pergunta ou hipótese, 例えば significa "digamos que" ou "suponha que", apresentando uma situação imaginária para discutir. Por exemplo, "digamos que você tivesse cem milhões de ienes, em que gastaria?".

É usado tanto na fala quanto na escrita, e é muito útil em explicações e apresentações.""",
st="""Categoria、 + 例えば + Exemplo(s) + や / など
例えば、 + Exemplo + …
例えば、 + Hipótese + たら / なら + Pergunta (digamos que...)

Escrita: 例えば / たとえば""",
no="""例えば vem de 例 (exemplo), a mesma raiz de 例文 (frase de exemplo).

Não confunda com たとえ〜ても (mesmo que), que tem a mesma origem, mas outro uso.

Em apresentações, 例えば ajuda a deixar explicações abstratas mais claras.""",
bf="例えば",
rx="例えば|たとえば",
tk=["例えば"],
va=["例えば", "たとえば"],
E=[
("私は果物、例えばりんごやみかんが好きです。", "わたしはくだもの、たとえばりんごやみかんがすきです。", "Eu gosto de frutas, por exemplo maçã e mexerica."),
("例えば、日本に住むならどこがいいですか。", "たとえば、にほんにすむならどこがいいですか。", "Digamos que você fosse morar no Japão. Onde seria bom?"),
("スポーツ、例えばサッカーやテニスをします。", "スポーツ、たとえばサッカーやテニスをします。", "Pratico esportes, por exemplo futebol e tênis."),
("例えば、一億円あったら何に使いますか。", "たとえば、いちおくえんあったらなににつかいますか。", "Digamos que você tivesse cem milhões de ienes. Em que gastaria?"),
("日本料理、例えばすしや天ぷらは外国でも人気がある。", "にほんりょうり、たとえばすしやてんぷらはがいこくでもにんきがある。", "A culinária japonesa, por exemplo sushi e tempurá, também é popular no exterior."),
],
R=[
("日本の祭り、____祇園祭は有名だ。", "Os festivais japoneses, por exemplo o Gion Matsuri, são famosos.", ["例えば", "たとえば"]),
("____、明日雨だったらどうしますか。", "Digamos que amanhã chova. O que você vai fazer?", ["例えば", "たとえば"]),
("漢字、____「山」や「川」は簡単だ。", "Alguns kanji, por exemplo \"montanha\" e \"rio\", são fáceis.", ["例えば", "たとえば"]),
("体にいい食べ物、____野菜や魚を食べましょう。", "Vamos comer alimentos saudáveis, por exemplo verduras e peixes.", ["例えば", "たとえば"]),
("____、あなたが社長だったら、何をしますか。", "Digamos que você fosse o presidente. O que faria?", ["例えば", "たとえば"]),
],
),
dict(
n=123,
jp="〜たって",
rd="tatte",
tr="Mesmo que / Por mais que (casual)",
ex="""たって é a forma falada e casual de ても. Equivale a "mesmo que" ou "por mais que".

Ele é formado pela forma た do verbo + って. Com adjetivos い, usa-se くたって. Com substantivos e adjetivos な, usa-se だって.

O sentido é o mesmo de ても: o resultado não muda, independentemente da situação. Muitas vezes, aparece com いくら ou どんなに, reforçando a ideia de "por mais que".

O tom costuma ser de resignação, impaciência ou determinação, como "por mais que eu fale, ele não escuta" ou "chorar não vai mudar nada".

Por ser coloquial, たって é usado entre amigos e família, e não em situações formais.""",
st="""Verbo na forma た + って (= ても)
Adjetivo い sem い + くたって
Substantivo / Adjetivo な + だって
いくら / どんなに + … + たって""",
no="""Com verbos cuja forma た termina em だ, como 泳ぐ e 読む, a forma fica だって: 泳いだって, 読んだって.

だって, sozinho no começo da frase, também significa "mas é que..." ao dar desculpas. É um uso diferente.

Em textos escritos e formais, use ても.""",
bf="たって",
rx="たって|だって",
tk=["たって"],
va=["たって", "だって", "くたって"],
E=[
("いくら言ったって、彼は聞かない。", "いくらいったって、かれはきかない。", "Por mais que eu fale, ele não escuta."),
("今から急いだって、間に合わないよ。", "いまからいそいだって、まにあわないよ。", "Mesmo que corra agora, não vai chegar a tempo."),
("高くたって、欲しいものは買う。", "たかくたって、ほしいものはかう。", "Mesmo que seja caro, compro o que eu quero."),
("泣いたって、何も変わらない。", "ないたって、なにもかわらない。", "Chorar não vai mudar nada."),
("そんなこと、子供だってわかる。", "そんなこと、こどもだってわかる。", "Uma coisa dessas, até uma criança entende."),
],
R=[
("いくら勉強し____、覚えられない。", "Por mais que eu estude, não consigo decorar.", ["たって"]),
("今さら謝っ____、許してもらえない。", "Mesmo que peça desculpas agora, não vão me perdoar.", ["たって"]),
("そんなに怒っ____、しょうがないよ。", "Não adianta ficar tão bravo.", ["たって"]),
("今から走っ____、もう遅い。", "Mesmo que corra agora, já é tarde.", ["たって"]),
("寒く____、毎朝ジョギングする。", "Mesmo que esteja frio, corro toda manhã.", ["たって"]),
],
),
dict(
n=124,
jp="〜てばかりいる",
rd="te bakari iru",
tr="Só fica fazendo / Não faz outra coisa a não ser",
ex="""てばかりいる é usado para criticar alguém que faz sempre a mesma coisa, de forma excessiva. Equivale a "só fica fazendo..." ou "não faz outra coisa a não ser...".

Ele junta a forma て do verbo com ばかり (só) e いる (estar). A ideia é que a pessoa passa o tempo todo naquela ação, deixando de lado o que deveria fazer.

O tom é quase sempre de reclamação ou de preocupação, como pais falando dos filhos: "ele só fica jogando videogame".

Na forma てばかりいないで, vira um pedido para que a pessoa pare: "pare de só dormir e ajude um pouco".""",
st="""Verbo na forma て + ばかりいる
Verbo na forma て + ばかりいて、 + Frase
Verbo na forma て + ばかりいないで、 + Pedido""",
no="""Compare: ゲームばかりしている (só joga videogame, foco no objeto) e ゲームをしてばかりいる (só fica jogando, foco na ação). Os dois são comuns.

てばかりいる é diferente de たばかり (acabou de), que usa a forma た.

Com verbos de sentimento, como 泣く e 怒る, a estrutura mostra que a pessoa está sempre naquele estado.""",
bf="てばかりいる",
rx="てばかり|でばかり",
tk=["て", "ばかり", "いる"],
va=["てばかりいる", "でばかりいる", "てばかりいないで"],
E=[
("弟は毎日ゲームをしてばかりいる。", "おとうとはまいにちゲームをしてばかりいる。", "Meu irmão mais novo só fica jogando videogame todo dia."),
("彼女は泣いてばかりいて、何も話さない。", "かのじょはないてばかりいて、なにもはなさない。", "Ela só fica chorando e não diz nada."),
("寝てばかりいないで、少しは手伝って。", "ねてばかりいないで、すこしはてつだって。", "Pare de só dormir e ajude um pouco."),
("父は休みの日、テレビを見てばかりいる。", "ちちはやすみのひ、テレビをみてばかりいる。", "Nos dias de folga, meu pai só fica vendo TV."),
("遊んでばかりいると、試験に落ちるよ。", "あそんでばかりいると、しけんにおちるよ。", "Se ficar só brincando, vai ser reprovado."),
],
R=[
("彼は文句を言っ____いる。", "Ele só fica reclamando.", ["てばかり"]),
("子供は漫画を読ん____いる。", "A criança só fica lendo mangá.", ["でばかり"]),
("食べ____いると、太りますよ。", "Se ficar só comendo, vai engordar.", ["てばかり"]),
("寝____いないで、勉強しなさい。", "Pare de só dormir e vá estudar.", ["てばかり"]),
("最近、仕事で失敗し____いる。", "Ultimamente, só tenho errado no trabalho.", ["てばかり"]),
],
),
dict(
n=125,
jp="〜てごらん",
rd="te goran",
tr="Experimente / Tente / Veja só",
ex="""てごらん é usado para convidar ou incentivar alguém a experimentar algo. Equivale a "experimente", "tente" ou "veja só".

Ele vem de ご覧, a forma respeitosa de 見る, mas aqui funciona como uma versão gentil de てみなさい. A ideia é "faça e veja como é".

É usado principalmente por pessoas mais velhas ou em posição superior, falando com crianças, alunos ou pessoas mais novas. Por exemplo, pais com filhos ou professores com alunos.

O tom é gentil, carinhoso e encorajador.

Com superiores, não se usa てごらん. Nesses casos, a forma respeitosa é てご覧ください ou てみてください.""",
st="""Verbo na forma て + ごらん
Verbo na forma て + ごらんなさい (um pouco mais formal)

Para superiores: Verbo て + ご覧ください / てみてください""",
no="""てごらん soa paternal ou maternal. Usá-lo com adultos que não são próximos pode parecer condescendente.

見てごらん ("olhe só") é muito comum para chamar a atenção de uma criança para algo interessante.

A forma ごらん sozinha, como em ほら、ごらん, significa "olha!".""",
bf="てごらん",
rx="てごらん|でごらん",
tk=["て", "ごらん"],
va=["てごらん", "でごらん", "てごらんなさい"],
E=[
("このケーキ、おいしいから食べてごらん。", "このケーキ、おいしいからたべてごらん。", "Este bolo é gostoso, experimente."),
("ちょっと窓の外を見てごらん。", "ちょっとまどのそとをみてごらん。", "Olhe só pela janela."),
("難しくないから、自分でやってごらん。", "むずかしくないから、じぶんでやってごらん。", "Não é difícil, tente fazer sozinho."),
("もう一度、ゆっくり言ってごらん。", "もういちど、ゆっくりいってごらん。", "Tente dizer mais uma vez, devagar."),
("この本、おもしろいから読んでごらん。", "このほん、おもしろいからよんでごらん。", "Este livro é interessante, experimente ler."),
],
R=[
("きっと似合うから、この服、着____。", "Tenho certeza de que fica bem em você, experimente esta roupa.", ["てごらん"]),
("わからなかったら、先生に聞い____。", "Se não entender, tente perguntar ao professor.", ["てごらん"]),
("空を見____。星がきれいだよ。", "Olhe para o céu. As estrelas estão lindas.", ["てごらん"]),
("手伝わないから、一人で書い____。", "Não vou ajudar, tente escrever sozinho.", ["てごらん"]),
("この歌、一緒に歌っ____。", "Tente cantar esta música junto comigo.", ["てごらん"]),
],
),
dict(
n=126,
jp="〜てはじめて",
rd="te hajimete",
tr="Só depois de / Somente quando",
ex="""てはじめて é usado para dizer que só depois de uma experiência a pessoa percebeu, entendeu ou conseguiu algo. Equivale a "só depois de" ou "somente quando".

Ele junta a forma て do verbo com はじめて (pela primeira vez). A ideia é que, antes daquela experiência, a pessoa não tinha percebido aquilo.

Muitas vezes, a frase expressa uma reflexão ou um aprendizado de vida. Por exemplo, "só depois de ficar doente entendi a importância da saúde" ou "só quando me tornei pai entendi os sentimentos dos meus pais".

A segunda parte costuma ter verbos como わかる, 気づく, 知る e 実感する.""",
st="""Verbo na forma て + はじめて、 + Percepção / Compreensão
Verbo na forma て + はじめて + Verbo potencial

Escrita: てはじめて / て初めて""",
no="""A segunda parte não costuma ser uma vontade ou um pedido. Ela descreve algo que a pessoa passou a entender ou conseguir.

É muito comum em redações e discursos sobre experiências pessoais.

A ideia de "só depois de perder, se dá valor" aparece com frequência, como em 失って初めて.""",
bf="てはじめて",
rx="てはじめて|て初めて|ではじめて|で初めて",
tk=["て", "はじめて"],
va=["てはじめて", "て初めて", "ではじめて"],
E=[
("病気になってはじめて、健康の大切さがわかった。", "びょうきになってはじめて、けんこうのたいせつさがわかった。", "Só depois de ficar doente entendi a importância da saúde."),
("親になってはじめて、親の気持ちがわかった。", "おやになってはじめて、おやのきもちがわかった。", "Só quando me tornei pai entendi os sentimentos dos meus pais."),
("外国に住んではじめて、自分の国のよさに気づいた。", "がいこくにすんではじめて、じぶんのくにのよさにきづいた。", "Só depois de morar no exterior percebi as qualidades do meu país."),
("実際にやってみてはじめて、難しさがわかる。", "じっさいにやってみてはじめて、むずかしさがわかる。", "Só quando se tenta de verdade é que se entende a dificuldade."),
("失って初めて、その大切さを知った。", "うしなってはじめて、そのたいせつさをしった。", "Só depois de perder conheci o valor daquilo."),
],
R=[
("一人暮らしをし____、家族のありがたさがわかった。", "Só depois de morar sozinho entendi o valor da família.", ["てはじめて", "て初めて"]),
("働い____、お金の大切さを知った。", "Só depois de trabalhar conheci o valor do dinheiro.", ["てはじめて", "て初めて"]),
("自分で料理を作っ____、母の苦労がわかった。", "Só quando cozinhei sozinho entendi o esforço da minha mãe.", ["てはじめて", "て初めて"]),
("日本に来____、日本の文化をよく知った。", "Só depois de vir ao Japão conheci bem a cultura japonesa.", ["てはじめて", "て初めて"]),
("ゆっくり話し合っ____、彼の考えがわかった。", "Só depois de conversar com calma entendi o que ele pensava.", ["てはじめて", "て初めて"]),
],
),
dict(
n=127,
jp="〜てからでないと",
rd="te kara de nai to",
tr="Só depois de / Enquanto não / Sem antes",
ex="""てからでないと é usado para dizer que uma ação só pode acontecer depois de outra. Se a primeira não acontecer antes, a segunda é impossível ou não deve acontecer. Equivale a "só depois de", "enquanto não..." ou "sem antes...".

A estrutura junta てから (depois de) com でないと (se não for). A ideia literal é "se não for depois de fazer isso, não dá".

A segunda parte é quase sempre negativa: não poder, não dever ou não conseguir. Por exemplo, "só depois de lavar as mãos pode comer" ou "enquanto não falar com meus pais, não posso responder".

A forma てからでなければ tem o mesmo sentido e é um pouco mais formal.""",
st="""Verbo na forma て + からでないと、 + Frase negativa
Verbo na forma て + からでなければ、 + Frase negativa (mais formal)

Fala casual: てからじゃないと""",
no="""A segunda parte normalmente tem verbos potenciais negativos (できない, 行けない) ou てはいけない.

É muito usada para explicar regras e condições, como em lojas e escolas.

Comparado a てから (depois de), てからでないと destaca a condição obrigatória.""",
bf="てからでないと",
rx="てからでないと|てからでなければ|でからでないと|でからでなければ|てからじゃないと",
tk=["て", "から", "でないと"],
va=["てからでないと", "てからでなければ", "てからじゃないと"],
E=[
("手を洗ってからでないと、ご飯を食べてはいけません。", "てをあらってからでないと、ごはんをたべてはいけません。", "Só depois de lavar as mãos é que pode comer."),
("実際に見てからでないと、買うかどうか決められない。", "じっさいにみてからでないと、かうかどうかきめられない。", "Enquanto não vir pessoalmente, não consigo decidir se compro ou não."),
("宿題をしてからでないと、遊びに行けない。", "しゅくだいをしてからでないと、あそびにいけない。", "Sem antes fazer a lição, não posso ir brincar."),
("両親に相談してからでないと、返事できません。", "りょうしんにそうだんしてからでないと、へんじできません。", "Enquanto não conversar com meus pais, não posso responder."),
("二十歳になってからでなければ、お酒は飲めない。", "はたちになってからでなければ、おさけはのめない。", "Só depois de completar vinte anos é que se pode beber."),
],
R=[
("このレストランは予約し____、入れません。", "Neste restaurante, só dá para entrar com reserva.", ["てからでないと"]),
("詳しい説明を聞い____、わかりません。", "Sem antes ouvir uma explicação detalhada, não dá para entender.", ["てからでないと"]),
("部長に聞い____、決められない。", "Enquanto não perguntar ao gerente, não posso decidir.", ["てからでないと"]),
("試験が終わっ____、遊べない。", "Só depois de a prova acabar é que vou poder me divertir.", ["てからでないと"]),
("食後の薬を飲ん____、寝てはいけない。", "Sem antes tomar o remédio de depois da refeição, não pode dormir.", ["でからでないと"]),
],
),
dict(
n=128,
jp="〜てしょうがない",
rd="te shou ga nai",
tr="Muito / Demais / Não aguentar de tanto",
ex="""てしょうがない é usado para expressar um sentimento ou uma sensação física tão forte que a pessoa não consegue controlar. Equivale a "muito", "demais" ou "não aguentar de tanto...".

A ideia literal é "não há jeito", ou seja, o sentimento é tão intenso que não tem como evitar.

Ele vem depois da forma て de adjetivos e de verbos de sentimento. Com adjetivos い, usa-se くてしょうがない; com adjetivos な, でしょうがない.

É muito usado para calor, frio, sono, fome, dor, preocupação, saudade e desejo. Por exemplo, "estou morrendo de calor" ou "não paro de pensar no resultado da prova".

A forma てしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.""",
st="""Adjetivo い sem い + くてしょうがない
Adjetivo な + でしょうがない
Verbo de sentimento na forma て + しょうがない (気になる / 心配する)
Verbo たい sem い + くてしょうがない

Variação: てしかたがない / てしようがない""",
no="""O sujeito costuma ser quem fala. Para falar de outra pessoa, acrescenta-se らしい ou ようだ.

Comparado a てたまらない (N2), que é ainda mais emocional, てしょうがない é muito comum na conversa.

A expressão sozinha しょうがない significa "não tem jeito", "fazer o quê".""",
bf="てしょうがない",
rx="てしょうがない|てしょうがありません|てしかたがない|でしょうがない",
tk=["て", "しょうがない"],
va=["てしょうがない", "てしかたがない", "でしょうがない"],
E=[
("今日は暑くてしょうがない。", "きょうはあつくてしょうがない。", "Hoje está um calor insuportável."),
("試験の結果が気になってしょうがない。", "しけんのけっかがきになってしょうがない。", "Não paro de pensar no resultado da prova."),
("眠くてしょうがないので、コーヒーを飲んだ。", "ねむくてしょうがないので、コーヒーをのんだ。", "Estava morrendo de sono, então tomei um café."),
("遠くに住んでいる彼に会いたくてしょうがない。", "とおくにすんでいるかれにあいたくてしょうがない。", "Estou louca para ver ele, que mora longe."),
("子供がかわいくてしかたがない。", "こどもがかわいくてしかたがない。", "Acho meu filho fofo demais."),
],
R=[
("朝ご飯を食べなかったので、お腹がすい____。", "Não tomei café da manhã, então estou morrendo de fome.", ["てしょうがない", "てしかたがない"]),
("明日の旅行が楽しみ____。", "Estou ansioso demais pela viagem de amanhã.", ["でしょうがない"]),
("昨日から歯が痛く____。", "Desde ontem estou com uma dor de dente insuportável.", ["てしょうがない", "てしかたがない"]),
("何もすることがなくて、退屈____。", "Não tenho nada para fazer e estou morrendo de tédio.", ["でしょうがない"]),
("疲れたので、早く家に帰りたく____。", "Estou cansado e louco para ir para casa.", ["てしょうがない", "てしかたがない"]),
],
),
dict(
n=129,
jp="〜て済む・〜で済む",
rd="te sumu / de sumu",
tr="Bastar / Resolver-se com / Ficar só em",
ex="""済む significa "resolver-se" ou "terminar". Com て ou で, a estrutura indica que algo se resolve com pouco, ou que uma situação ficou menos grave do que poderia.

Com substantivos + で, significa "basta..." ou "resolve-se com...": "se der para resolver por telefone, não precisa ir".

Também é usado para dizer que um problema ficou limitado a algo pequeno, com alívio: "por sorte, ficou só num machucado leve".

Com a forma て do verbo, aparece em expressões como 謝って済む問題ではない, que significa "não é um problema que se resolve só pedindo desculpas", com tom de crítica.

Na forma ないで済む ou なくて済む, indica que se conseguiu evitar algo: "ainda bem que não precisei...".""",
st="""Substantivo + で + 済む (resolve-se com...)
Verbo na forma て + 済む
Verbo na forma ない + で + 済む / なくて済む (conseguir evitar)
… + で済んでよかった (alívio)

Escrita: 済む / すむ""",
no="""すみません vem do mesmo verbo 済む. A ideia original é "não se resolve", ou seja, "não tenho como retribuir".

Na forma passada, 済んだ costuma expressar alívio: algo ruim não ficou pior.

ずに済む (N2) tem o mesmo sentido de ないで済む e soa mais formal.""",
bf="済む",
rx="て済|で済|てすむ|ですむ",
tk=["て", "済む"],
va=["で済む", "て済む", "ないで済む", "なくて済む"],
E=[
("電話で済むなら、わざわざ行かなくてもいい。", "でんわですむなら、わざわざいかなくてもいい。", "Se der para resolver por telefone, não precisa ir até lá."),
("これは謝って済む問題ではない。", "これはあやまってすむもんだいではない。", "Isto não é um problema que se resolve só pedindo desculpas."),
("早く病院に行ったので、軽いけがで済んだ。", "はやくびょういんにいったので、かるいけがですんだ。", "Fui logo ao hospital, então ficou só num machucado leve."),
("友達が手伝ってくれたので、一時間で済んだ。", "ともだちがてつだってくれたので、いちじかんですんだ。", "Meu amigo me ajudou, então resolvi tudo em uma hora."),
("安い修理で済んでよかった。", "やすいしゅうりですんでよかった。", "Que bom que ficou só num conserto barato."),
],
R=[
("メールで____ことなら、会わなくてもいい。", "Se for algo que se resolve por e-mail, não precisamos nos encontrar.", ["済む"]),
("大きな事故だったが、小さなけがで____。", "Foi um acidente grave, mas ficou só em ferimentos leves.", ["済んだ", "済みました"]),
("「すみません」で____問題じゃない。", "Não é um problema que se resolve com um simples \"desculpe\".", ["済む"]),
("予定より少ないお金で____。", "Consegui resolver com menos dinheiro do que o previsto.", ["済んだ", "済みました"]),
("早く気づいたので、大きな問題にならないで____。", "Percebi cedo, então consegui evitar que virasse um grande problema.", ["済んだ", "済みました"]),
],
),
dict(
n=130,
jp="〜といけないから・〜てはいけないから",
rd="to ikenai kara / te wa ikenai kara",
tr="Para não / Caso / Por precaução",
ex="""といけないから e てはいけないから são usados para explicar uma precaução: a pessoa faz algo para evitar um problema que poderia acontecer. Equivalem a "para não...", "caso..." ou "por precaução".

A primeira parte mostra o risco ("caso eu esqueça", "caso chova"), e a segunda, a ação de prevenção ("vou anotar", "vou levar o guarda-chuva").

A forma mais comum é Verbo na forma de dicionário + といけないから. A forma てはいけないから também aparece com o mesmo sentido. Com ので no lugar de から, a frase fica um pouco mais formal.

A ideia literal é "se acontecer tal coisa, não seria bom; por isso...".

É muito usada em conselhos e cuidados do dia a dia.""",
st="""Verbo na forma de dicionário + といけないから、 + Ação preventiva
Verbo na forma て + はいけないから、 + Ação preventiva
… + といけないので (um pouco mais formal)""",
no="""ないように (para que não) tem sentido parecido e também expressa prevenção: 忘れないようにメモする.

Em conselhos a outras pessoas, a segunda parte pode ser uma sugestão ou um pedido.

A expressão 念のため ("por via das dúvidas") combina bem com essa estrutura.""",
bf="といけないから",
rx="てはいけないから|といけないから|てはいけないので|といけないので",
tk=["と", "いけない", "から"],
va=["といけないから", "てはいけないから", "といけないので"],
E=[
("忘れるといけないから、メモしておこう。", "わすれるといけないから、メモしておこう。", "Para não esquecer, vou anotar."),
("雨が降るといけないから、傘を持っていこう。", "あめがふるといけないから、かさをもっていこう。", "Caso chova, vou levar o guarda-chuva."),
("遅れてはいけないから、早めに家を出た。", "おくれてはいけないから、はやめにいえをでた。", "Para não me atrasar, saí de casa mais cedo."),
("風邪をひくといけないので、暖かくして寝なさい。", "かぜをひくといけないので、あたたかくしてねなさい。", "Para não pegar resfriado, durma bem agasalhado."),
("道に迷うといけないから、地図を持っていきます。", "みちにまようといけないから、ちずをもっていきます。", "Caso me perca, vou levar um mapa."),
],
R=[
("寝坊する____、目覚ましを二つかけた。", "Para não dormir demais, coloquei dois despertadores.", ["といけないから"]),
("財布を落とす____、かばんの中に入れた。", "Para não perder a carteira, coloquei-a dentro da bolsa.", ["といけないから"]),
("遅刻し____、タクシーで行った。", "Para não chegar atrasado, fui de táxi.", ["てはいけないから"]),
("雨が降る____、洗濯物を中に入れた。", "Caso chova, recolhi a roupa do varal.", ["といけないから"]),
("約束を忘れ____、カレンダーに書いておく。", "Para não esquecer o compromisso, vou anotar no calendário.", ["るといけないから"]),
],
),
]
