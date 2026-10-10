G = [
dict(
n=151,
jp="〜として",
rd="to shite",
tr="Como / Na condição de / Na qualidade de",
ex="""として é usado para indicar o papel, a função, a posição ou a qualidade em que alguém ou algo atua. Equivale a "como", "na condição de" ou "na qualidade de".

Por exemplo, "ele trabalha como médico", "vim ao Japão como estudante estrangeiro" ou "aprendo piano como hobby".

Com は, a forma としては indica um ponto de vista: 私としては significa "da minha parte" ou "do meu ponto de vista".

Antes de um substantivo, usa-se としての: リーダーとしての責任 (a responsabilidade como líder).

Com も, としても significa "também como" ou, em outro uso, "mesmo que".""",
st="""Substantivo (papel / função) + として + Verbo
Substantivo + としては + Opinião (do ponto de vista de)
Substantivo + としての + Substantivo
Substantivo + としても + … (também como)""",
no="""Não confunda com とする (supor), que aparece em としたら e とすれば.

Em apresentações de trabalho, 〜として参加します ("participo como...") é muito comum.

A expressão 人として significa "como ser humano" e aparece em frases sobre ética e comportamento.""",
bf="として",
rx="として|としては|としても|としての",
tk=["と", "して"],
va=["として", "としては", "としての", "としても"],
E=[
("彼は医者として病院で働いている。", "かれはいしゃとしてびょういんではたらいている。", "Ele trabalha como médico no hospital."),
("私は留学生として日本に来ました。", "わたしはりゅうがくせいとしてにほんにきました。", "Vim ao Japão como estudante estrangeiro."),
("趣味として、ピアノを習っています。", "しゅみとして、ピアノをならっています。", "Estou aprendendo piano como hobby."),
("私としては、この案に賛成です。", "わたしとしては、このあんにさんせいです。", "Da minha parte, concordo com esta proposta."),
("彼はリーダーとしての責任を感じている。", "かれはリーダーとしてのせきにんをかんじている。", "Ele sente a responsabilidade de ser líder."),
],
R=[
("彼女は通訳____会議に参加した。", "Ela participou da reunião como intérprete.", ["として"]),
("父は教師____三十年働いた。", "Meu pai trabalhou trinta anos como professor.", ["として"]),
("このお茶は、お土産____人気がある。", "Este chá é popular como lembrancinha.", ["として"]),
("私____は、その計画には反対です。", "Da minha parte, sou contra esse plano.", ["として"]),
("新入社員は、社会人____のマナーを学ぶ。", "Os novos funcionários aprendem as boas maneiras de um profissional.", ["として"]),
],
),
dict(
n=152,
jp="とても〜ない",
rd="totemo ~ nai",
tr="De jeito nenhum / Impossível / Não dá para",
ex="""Quando とても aparece com uma forma negativa, especialmente com verbos potenciais, ele não significa "muito", e sim "de jeito nenhum" ou "é impossível". Equivale a "não dá para... de jeito nenhum".

A ideia é que algo está tão além da capacidade ou da realidade que não há a menor chance. Por exemplo, "tanto trabalho assim não dá para terminar em um dia, de jeito nenhum" ou "não consigo acreditar na história dele de jeito nenhum".

O verbo costuma estar na forma potencial negativa, como 終わらない, 解けない, 信じられない e 買えない. Também é comum com 無理だ (impossível).

Esse uso é diferente de とても no N5, que intensifica adjetivos em frases afirmativas.""",
st="""とても + Verbo potencial negativo (できない / 買えない / 信じられない)
とても + 無理だ
とても + Verbo negativo (終わらない)""",
no="""O contexto é importante: とても大きい significa "muito grande", mas とても食べられない significa "não dá para comer de jeito nenhum".

Esse uso soa um pouco mais formal e expressivo que 全然〜ない.

É comum para recusar algo com educação, mostrando que é realmente impossível: そんな大役はとても務まりません.""",
bf="とても",
rx="とても",
tk=["とても", "ない"],
va=["とても〜ない"],
E=[
("こんなにたくさんの仕事は、一日ではとても終わらない。", "こんなにたくさんのしごとは、いちにちではとてもおわらない。", "Tanto trabalho assim não dá para terminar em um dia, de jeito nenhum."),
("この問題は難しくて、とても解けない。", "このもんだいはむずかしくて、とてもとけない。", "Esta questão é difícil demais, não consigo resolver de jeito nenhum."),
("彼の話はとても信じられない。", "かれのはなしはとてもしんじられない。", "Não consigo acreditar na história dele de jeito nenhum."),
("この値段では、とても買えません。", "このねだんでは、とてもかえません。", "Com esse preço, é impossível comprar."),
("一人でこの荷物を運ぶのは、とても無理だ。", "ひとりでこのにもつをはこぶのは、とてもむりだ。", "Carregar esta bagagem sozinho é totalmente impossível."),
],
R=[
("こんなに高い車は、____買えない。", "Um carro tão caro assim, não dá para comprar de jeito nenhum.", ["とても"]),
("この量は一人では____食べられない。", "Esta quantidade, sozinho, é impossível de comer.", ["とても"]),
("あの正直な彼がうそをついたなんて、____思えない。", "Não consigo imaginar de jeito nenhum que ele, tão honesto, tenha mentido.", ["とても"]),
("勉強していないから、こんな難しい試験には____合格できない。", "Não estudei, então não tem como passar numa prova tão difícil.", ["とても"]),
("今日中に全部終わらせるのは____無理です。", "Terminar tudo ainda hoje é totalmente impossível.", ["とても"]),
],
),
dict(
n=153,
jp="〜とは限らない",
rd="to wa kagiranai",
tr="Nem sempre / Não necessariamente / Não é garantido que",
ex="""とは限らない é usado para dizer que algo não é sempre verdade, ou que existem exceções. Equivale a "nem sempre", "não necessariamente" ou "não é garantido que".

限る significa "limitar". A ideia literal é "não se limita a ser assim", ou seja, pode ser diferente.

É muito usado para corrigir generalizações ou ideias comuns, como "coisa cara nem sempre é boa" ou "nem todo japonês é bom em linguagem honorífica".

Para reforçar, a frase costuma ter palavras como いつも, 必ず, みんな ou 全部. Por exemplo, "a previsão do tempo nem sempre está certa".

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, é comum usar だ antes.""",
st="""Frase (forma simples) + とは限らない
Substantivo / Adjetivo な + (だ) + とは限らない
いつも / 必ず / みんな + … + とは限らない

Educado: とは限りません""",
no="""とは限らない é uma forma suave e lógica de discordar de uma generalização, sem dizer que ela é totalmente falsa.

A forma ないとも限らない (N1) significa "não é impossível que..." e expressa um risco.

Em debates e redações, essa estrutura é muito útil para mostrar pensamento crítico.""",
bf="とは限らない",
rx="とは限らない|とは限りません|とはかぎらない|とも限らない",
tk=["とは", "限らない"],
va=["とは限らない", "とは限りません", "とはかぎらない"],
E=[
("高い物がいい物とは限らない。", "たかいものがいいものとはかぎらない。", "Coisa cara nem sempre é coisa boa."),
("日本人がみんな敬語が上手だとは限らない。", "にほんじんがみんなけいごがじょうずだとはかぎらない。", "Nem todo japonês é bom em linguagem honorífica."),
("有名な店がおいしいとは限りません。", "ゆうめいなみせがおいしいとはかぎりません。", "Loja famosa não é necessariamente gostosa."),
("お金持ちが幸せだとは限らない。", "おかねもちがしあわせだとはかぎらない。", "Ser rico não garante ser feliz."),
("天気予報がいつも正しいとは限らない。", "てんきよほうがいつもただしいとはかぎらない。", "A previsão do tempo nem sempre está certa."),
],
R=[
("先生の言うことがいつも正しい____。", "O que o professor diz nem sempre está certo.", ["とは限らない", "とは限りません"]),
("勉強すれば必ず合格する____。", "Estudar não garante necessariamente a aprovação.", ["とは限らない", "とは限りません"]),
("安い物が悪い物だ____。", "Coisa barata nem sempre é coisa ruim.", ["とは限らない", "とは限りません"]),
("外国人がみんな英語を話せる____。", "Nem todo estrangeiro fala inglês.", ["とは限らない", "とは限りません"]),
("大人がいつも子供より賢い____。", "Os adultos nem sempre são mais sábios que as crianças.", ["とは限らない", "とは限りません"]),
],
),
dict(
n=154,
jp="つい",
rd="tsui",
tr="Sem querer / Acabar fazendo / Por impulso",
ex="""つい é um advérbio que indica que a pessoa fez algo sem querer, por impulso, mesmo sabendo que não deveria. Equivale a "sem querer", "acabar fazendo" ou "por impulso".

Ele quase sempre aparece junto com てしまう, que reforça a ideia de algo feito sem controle ou com arrependimento.

Por exemplo, "estava tão gostoso que acabei comendo demais" ou "estava barato e comprei por impulso".

É muito usado para hábitos que a pessoa tenta evitar, mas não consegue, como ficar acordado até tarde, gastar demais ou falar o que não devia.""",
st="""つい + Verbo na forma て + しまう
つい + Verbo na forma て + しまった (passado)""",
no="""つい também aparece em つい先日 ("outro dia mesmo") e つい今 ("agora há pouco"), com sentido de tempo bem recente. É um uso diferente.

つい é parecido com 思わず (sem pensar), mas つい destaca mais a falta de autocontrole ou o hábito.

É uma forma natural de se justificar com leveza: "acabei fazendo, não resisti".""",
bf="つい",
rx="つい",
tk=["つい"],
va=["つい"],
E=[
("おいしくて、つい食べすぎてしまった。", "おいしくて、ついたべすぎてしまった。", "Estava tão gostoso que acabei comendo demais."),
("つい本当のことを言ってしまった。", "ついほんとうのことをいってしまった。", "Sem querer, acabei dizendo a verdade."),
("面白くて、つい夜遅くまでテレビを見てしまう。", "おもしろくて、ついよるおそくまでテレビをみてしまう。", "É tão interessante que acabo vendo TV até tarde da noite."),
("安かったので、つい買ってしまった。", "やすかったので、ついかってしまった。", "Estava barato e acabei comprando por impulso."),
("つい昔の癖が出てしまった。", "ついむかしのくせがでてしまった。", "Sem querer, voltei ao meu velho hábito."),
],
R=[
("疲れていて、電車で____寝てしまった。", "Estava cansado e acabei dormindo no trem sem querer.", ["つい"]),
("腹が立って、____大きな声を出した。", "Fiquei irritado e, sem querer, levantei a voz.", ["つい"]),
("ダイエット中なのに、____ケーキを食べてしまった。", "Estou de dieta, mas acabei comendo bolo.", ["つい"]),
("友達との話が楽しくて、____時間を忘れてしまった。", "A conversa com os amigos estava tão boa que acabei perdendo a noção do tempo.", ["つい"]),
("スマホを見ていて、____駅を乗り過ごしてしまった。", "Estava olhando o celular e acabei passando da minha estação.", ["つい"]),
],
),
dict(
n=155,
jp="ついに",
rd="tsui ni",
tr="Finalmente / Afinal / Por fim",
ex="""ついに é um advérbio que indica que algo finalmente aconteceu, depois de muito tempo, esforço ou de uma longa série de acontecimentos. Equivale a "finalmente", "afinal" ou "por fim".

O resultado pode ser positivo, como realizar um sonho depois de dez anos, ou negativo, como um computador velho que finalmente quebrou.

A diferença em relação a やっと é que やっと quase sempre expressa alívio por algo desejado. ついに é mais neutro e dramático, e pode ser usado tanto para coisas boas quanto ruins.

Também aparece em frases negativas, com o sentido de "no fim, nunca...": ついに来なかった (no fim, ele nunca veio).""",
st="""ついに + Verbo no passado
ついに + Verbo negativo no passado (no fim, nunca...)

Escrita: ついに / 遂に""",
no="""Em notícias e anúncios, ついに aparece muito para lançamentos e conquistas: ついに発売!

Para resultados negativos, ついに é mais natural que やっと: ついに壊れた (finalmente quebrou).

ついに soa mais forte e solene que やっと, por isso é comum em histórias e narrativas.""",
bf="ついに",
rx="ついに|遂に",
tk=["ついに"],
va=["ついに", "遂に"],
E=[
("十年かかって、ついに夢がかなった。", "じゅうねんかかって、ついにゆめがかなった。", "Depois de dez anos, finalmente meu sonho se realizou."),
("長い工事が終わって、ついに新しい駅ができた。", "ながいこうじがおわって、ついにあたらしいえきができた。", "A longa obra terminou e, finalmente, a nova estação ficou pronta."),
("何度も失敗したが、ついに成功した。", "なんどもしっぱいしたが、ついにせいこうした。", "Fracassei muitas vezes, mas por fim consegui."),
("不満が多かった彼は、ついに会社をやめてしまった。", "ふまんがおおかったかれは、ついにかいしゃをやめてしまった。", "Ele, que tinha muitas insatisfações, acabou saindo da empresa."),
("待ちに待った夏休みが、ついに来た。", "まちにまったなつやすみが、ついにきた。", "As tão esperadas férias de verão finalmente chegaram."),
],
R=[
("三回目の挑戦で、____試験に合格した。", "Na terceira tentativa, finalmente passei na prova.", ["ついに", "遂に"]),
("十年使った古いパソコンが____壊れてしまった。", "O computador velho que usei por dez anos finalmente quebrou.", ["ついに", "遂に"]),
("長い戦争が____終わった。", "A longa guerra finalmente acabou.", ["ついに", "遂に"]),
("何年も探していた本が、____見つかった。", "O livro que eu procurava havia anos finalmente foi encontrado.", ["ついに", "遂に"]),
("ずっと黙っていた彼女は、____本当のことを話してくれた。", "Ela, que ficou calada o tempo todo, finalmente me contou a verdade.", ["ついに", "遂に"]),
],
),
dict(
n=156,
jp="〜ついでに",
rd="tsuide ni",
tr="Aproveitando que / De quebra / Já que vai",
ex="""ついでに é usado para dizer que, aproveitando uma ação principal, a pessoa faz outra coisa a mais. Equivale a "aproveitando que", "de quebra" ou "já que vai...".

A ação principal vem antes de ついでに, e a ação extra vem depois. Por exemplo, "aproveitando que fui fazer compras, passei no correio" ou "já que vai à estação, coloca esta carta no correio?".

Ele vem depois de substantivos com の e de verbos na forma de dicionário ou た.

Sozinho, no meio da frase, ついでに significa "de quebra", "já que está nisso". É muito comum em pedidos casuais: "se for à loja, compra um chá pra mim também?".""",
st="""Substantivo + の + ついでに + Ação extra
Verbo (forma de dicionário / た) + ついでに + Ação extra
ついでに + Verbo (de quebra, já que está nisso)""",
no="""ついでに é muito usado em pedidos entre amigos e família, deixando o pedido leve.

A ação extra é geralmente pequena e fácil de encaixar na principal.

A expressão お出かけのついでに ("aproveitando que vai sair") aparece em propagandas de lojas.""",
bf="ついでに",
rx="ついでに|ついで",
tk=["ついで", "に"],
va=["ついでに", "のついでに"],
E=[
("買い物のついでに、郵便局に寄った。", "かいもののついでに、ゆうびんきょくによった。", "Aproveitando que fui fazer compras, passei no correio."),
("駅に行くついでに、この手紙を出してくれる？", "えきにいくついでに、このてがみをだしてくれる？", "Já que vai à estação, pode colocar esta carta no correio?"),
("東京に出張したついでに、友達に会った。", "とうきょうにしゅっちょうしたついでに、ともだちにあった。", "Aproveitando a viagem de trabalho a Tóquio, encontrei um amigo."),
("掃除のついでに、窓も拭いた。", "そうじのついでに、まどもふいた。", "Aproveitando a faxina, limpei as janelas também."),
("コンビニに行くなら、ついでにお茶を買ってきて。", "コンビニにいくなら、ついでにおちゃをかってきて。", "Se for à loja de conveniência, compra um chá para mim de quebra."),
],
R=[
("散歩の____、パンを買ってきた。", "Aproveitando a caminhada, comprei pão.", ["ついでに"]),
("図書館へ行く____、この本を返してください。", "Já que vai à biblioteca, devolva este livro, por favor.", ["ついでに"]),
("京都に行った____、奈良にも寄った。", "Aproveitando que fui a Kyoto, passei também em Nara.", ["ついでに"]),
("お茶を入れる____、私の分もお願い。", "Já que vai fazer chá, faz o meu também, por favor.", ["ついでに"]),
("銀行に行った____、買い物もした。", "Aproveitando que fui ao banco, fiz compras também.", ["ついでに"]),
],
),
dict(
n=157,
jp="つまり",
rd="tsumari",
tr="Ou seja / Quer dizer / Em resumo",
ex="""つまり é usado para resumir, explicar com outras palavras ou tirar uma conclusão. Equivale a "ou seja", "quer dizer" ou "em resumo".

Ele tem três usos principais:
• Explicar quem ou o que é algo: "ele é o irmão mais velho da minha mãe, ou seja, meu tio".
• Tirar uma conclusão: "ele não respondeu. Quer dizer, ele é contra".
• Pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".

つまり tem o mesmo sentido de すなわち, mas é muito mais comum na conversa do dia a dia. すなわち soa formal e literário.

Muitas vezes, a frase com つまり termina com ということだ, reforçando a ideia de conclusão.""",
st="""A、 + つまり + B (A, ou seja, B)
Frase 1 (com ponto final) + つまり、 + Conclusão + ということだ
つまり、 + Pergunta (afinal...?)""",
no="""Em perguntas, つまり pode soar impaciente se o tom for forte, como se a pessoa quisesse que o outro fosse logo ao ponto.

つまり é muito usado em explicações, aulas e apresentações para resumir uma ideia.

Na fala, também aparece つまりさ ou つまりね, de forma casual.""",
bf="つまり",
rx="つまり",
tk=["つまり"],
va=["つまり"],
E=[
("彼は母の兄、つまり私のおじです。", "かれはははのあに、つまりわたしのおじです。", "Ele é o irmão mais velho da minha mãe, ou seja, meu tio."),
("明日は祝日、つまり会議はないということだ。", "あしたはしゅくじつ、つまりかいぎはないということだ。", "Amanhã é feriado, ou seja, não vai ter reunião."),
("話が長いね。つまり、何が言いたいの？", "はなしがながいね。つまり、なにがいいたいの？", "Que conversa longa. Afinal, o que você quer dizer?"),
("彼は返事をしなかった。つまり、反対ということだ。", "かれはへんじをしなかった。つまり、はんたいということだ。", "Ele não respondeu. Quer dizer, ele é contra."),
("一週間の休み、つまり七日間の旅行だ。", "いっしゅうかんのやすみ、つまりなのかかんのりょこうだ。", "Uma semana de folga, ou seja, uma viagem de sete dias."),
],
R=[
("父の妹、____私のおばは東京に住んでいる。", "A irmã mais nova do meu pai, ou seja, minha tia, mora em Tóquio.", ["つまり"]),
("彼は来なかった。____、約束を忘れたということだ。", "Ele não veio. Quer dizer, esqueceu o compromisso.", ["つまり"]),
("____、あなたは反対なんですか。", "Então, em resumo, você é contra?", ["つまり"]),
("締め切りは今月三十日まで、____あと五日しかない。", "O prazo vai até o dia 30 deste mês, ou seja, só faltam cinco dias.", ["つまり"]),
("彼女は母の母、____私の祖母です。", "Ela é a mãe da minha mãe, ou seja, minha avó.", ["つまり"]),
],
),
dict(
n=158,
jp="〜つもりだった",
rd="tsumori datta",
tr="Pretendia / Tinha a intenção de / Achava que tinha",
ex="""つもりだった é o passado de つもり e tem dois usos principais.

O primeiro é falar de uma intenção que não se realizou: "eu pretendia..., mas...". Por exemplo, "ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde". Muitas vezes vem seguido de が, けど ou のに.

O segundo é dizer que a pessoa achava que tinha feito algo, mas na realidade não fez, ou fez errado. Nesse caso, usa-se o verbo na forma た antes de つもりだった: "eu achava que tinha trancado a porta, mas estava aberta".

Com substantivos e の, つもりだった mostra que a intenção era uma, mas o efeito foi outro: "era para ser uma brincadeira, mas ela ficou brava".""",
st="""Verbo na forma de dicionário + つもりだった + が / のに (pretendia, mas)
Verbo na forma た + つもりだった + が (achava que tinha feito)
Substantivo + の + つもりだった (era para ser...)

Educado: つもりでした""",
no="""たつもり, sem だった, também significa "fazer de conta" ou "imaginar que fez", como em 旅行したつもりで貯金する.

つもりだった é muito útil para se justificar com educação quando algo deu errado.

No uso de "achava que tinha feito", a frase mostra um engano ou esquecimento.""",
bf="つもりだった",
rx="つもりだった|つもりでした",
tk=["つもり", "だった"],
va=["つもりだった", "つもりでした", "たつもりだった"],
E=[
("昨日は早く寝るつもりだったが、遅くなってしまった。", "きのうははやくねるつもりだったが、おそくなってしまった。", "Ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde."),
("今日は勉強するつもりだったのに、一日中寝てしまった。", "きょうはべんきょうするつもりだったのに、いちにちじゅうねてしまった。", "Hoje eu pretendia estudar, mas acabei dormindo o dia inteiro."),
("電話するつもりでしたが、忘れてしまいました。", "でんわするつもりでしたが、わすれてしまいました。", "Eu tinha a intenção de ligar, mas acabei esquecendo."),
("冗談のつもりだったが、彼女を怒らせてしまった。", "じょうだんのつもりだったが、かのじょをおこらせてしまった。", "Era para ser uma brincadeira, mas acabei deixando ela brava."),
("鍵をかけたつもりだったが、開いていた。", "かぎをかけたつもりだったが、あいていた。", "Eu achava que tinha trancado, mas estava aberto."),
],
R=[
("週末は旅行に行く____が、雨で中止になった。", "Eu pretendia viajar no fim de semana, mas foi cancelado por causa da chuva.", ["つもりだった", "つもりでした"]),
("引っ越しを手伝う____のに、寝坊してしまった。", "Eu pretendia ajudar na mudança, mas acabei dormindo demais.", ["つもりだった"]),
("親切の____が、迷惑だったようだ。", "Era para ser uma gentileza, mas parece que foi um incômodo.", ["つもりだった"]),
("早く起きる____が、起きられなかった。", "Eu pretendia acordar cedo, mas não consegui.", ["つもりでした", "つもりだった"]),
("窓を閉めた____が、開いていた。", "Achava que tinha fechado a janela, mas estava aberta.", ["つもりだった", "つもりでした"]),
],
),
dict(
n=159,
jp="〜つもりで",
rd="tsumori de",
tr="Como se / Com a ideia de / Fazendo de conta que",
ex="""つもりで é usado para dizer que alguém faz algo imaginando estar em certa situação, ou com uma certa disposição mental. Equivale a "como se", "com a ideia de" ou "fazendo de conta que".

Com o verbo na forma た, a ideia é imaginar que algo já aconteceu. Por exemplo, "fazendo de conta que viajei, guardei o dinheiro" ou "explique como se você fosse o professor".

Com substantivos e の, a ideia é encarar algo com certa atitude: "faça este exercício como se fosse uma prova de verdade".

Com o verbo na forma de dicionário, indica uma disposição forte: "esforçando-se como se fosse morrer" (ou seja, dando tudo de si).

É muito usado em conselhos e incentivos.""",
st="""Verbo na forma た + つもりで + Verbo (imaginando que já...)
Verbo na forma de dicionário + つもりで + Verbo (com a disposição de...)
Substantivo + の + つもりで + Verbo (encarando como...)""",
no="""A expressão 自分の家にいるつもりで ("como se estivesse em casa") é uma forma gentil de deixar a visita à vontade.

本番のつもりで ("como se fosse pra valer") é comum em treinos e ensaios.

Não confunda com つもりだった, que indica uma intenção passada que não se realizou.""",
bf="つもりで",
rx="つもりで",
tk=["つもり", "で"],
va=["つもりで"],
E=[
("旅行に行ったつもりで、そのお金を貯金した。", "りょこうにいったつもりで、そのおかねをちょきんした。", "Fazendo de conta que tinha viajado, guardei esse dinheiro."),
("死ぬつもりで頑張れば、何でもできる。", "しぬつもりでがんばれば、なんでもできる。", "Se você se esforçar dando tudo de si, consegue qualquer coisa."),
("先生になったつもりで、説明してみてください。", "せんせいになったつもりで、せつめいしてみてください。", "Tente explicar como se você fosse o professor."),
("遊びに行くつもりで、気軽に来てください。", "あそびにいくつもりで、きがるにきてください。", "Venha à vontade, como se fosse um passeio."),
("試験のつもりで、この問題を解いてください。", "しけんのつもりで、このもんだいをといてください。", "Resolva estas questões como se fosse uma prova."),
],
R=[
("本番の____、練習しましょう。", "Vamos treinar como se fosse pra valer.", ["つもりで"]),
("外国人と話す____、日本語で話してみよう。", "Vamos tentar falar em japonês como se estivéssemos conversando com um estrangeiro.", ["つもりで"]),
("その服を買ったつもり____、そのお金を貯金した。", "Fazendo de conta que tinha comprado a roupa, guardei o dinheiro.", ["で"]),
("自分の家にいる____、ゆっくりしてください。", "Fique à vontade, como se estivesse em casa.", ["つもりで"]),
("社長になった____、この問題を考えてみてください。", "Tente pensar neste problema como se você fosse o presidente.", ["つもりで"]),
],
),
dict(
n=160,
jp="〜うちに",
rd="uchi ni",
tr="Enquanto / Antes que / No decorrer de",
ex="""うちに tem dois usos principais.

O primeiro é "enquanto ainda": fazer algo aproveitando que uma situação ainda existe, antes que ela mude. Por exemplo, "enquanto é jovem, é bom ter várias experiências" ou "coma enquanto está quente". Com a forma ない, ないうちに significa "antes que": "vamos voltar antes que escureça".

O segundo é "no decorrer de": enquanto uma ação continua, uma mudança acontece naturalmente, sem a pessoa perceber. Por exemplo, "conversando com ele, acabei gostando dele" ou "lendo, acabei dormindo".

No primeiro uso, うちに vem depois de adjetivos, de verbos de estado (いる) e da forma ない. No segundo, vem depois de verbos na forma ている.""",
st="""Adjetivo い + うちに (enquanto ainda está...)
Adjetivo な + な + うちに
Substantivo + の + うちに
Verbo de estado (いる / ある) + うちに
Verbo na forma ない + うちに (antes que)
Verbo na forma ている + うちに + Mudança (no decorrer de)

Escrita: うちに / 内に""",
no="""Comparado a 間に, うちに destaca mais a ideia de "aproveitar enquanto dá", com a ideia de que a situação vai mudar.

A expressão 熱いうちにどうぞ ("coma enquanto está quente") é muito comum ao servir comida.

No segundo uso, a mudança na segunda parte costuma ser algo que aconteceu sem a pessoa planejar.""",
bf="うちに",
rx="うちに|内に",
tk=["うち", "に"],
va=["うちに", "ないうちに", "ているうちに"],
E=[
("若いうちに、いろいろな経験をしたほうがいい。", "わかいうちに、いろいろなけいけんをしたほうがいい。", "Enquanto é jovem, é bom ter várias experiências."),
("どうぞ、熱いうちに食べてください。", "どうぞ、あついうちにたべてください。", "Por favor, coma enquanto está quente."),
("暗くならないうちに、帰りましょう。", "くらくならないうちに、かえりましょう。", "Vamos voltar antes que escureça."),
("話しているうちに、彼のことが好きになった。", "はなしているうちに、かれのことがすきになった。", "No decorrer das conversas, acabei gostando dele."),
("日本にいるうちに、富士山に登りたい。", "にほんにいるうちに、ふじさんにのぼりたい。", "Enquanto estiver no Japão, quero subir o Monte Fuji."),
],
R=[
("元気な____、旅行に行きたい。", "Quero viajar enquanto ainda tenho saúde.", ["うちに"]),
("雨が降らない____、洗濯物を取り込もう。", "Vamos recolher a roupa antes que chova.", ["うちに"]),
("本を読んでいる____、寝てしまった。", "Enquanto lia o livro, acabei dormindo.", ["うちに"]),
("冷めない____、どうぞ。", "Coma antes que esfrie, por favor.", ["うちに"]),
("忘れない____、メモしておこう。", "Vou anotar antes que eu esqueça.", ["うちに"]),
],
),
]
