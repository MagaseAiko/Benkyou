G = [
dict(
n=21,
jp="どうしても",
rd="doushitemo",
tr="De qualquer jeito / A todo custo / De jeito nenhum",
ex="""どうしても é um advérbio que expressa um desejo ou uma situação muito forte, que não muda por nada. O sentido depende de a frase ser afirmativa ou negativa.

Em frases afirmativas, principalmente com たい, ほしい ou obrigações, significa "de qualquer jeito" ou "a todo custo". Por exemplo, "quero entrar nesta faculdade de qualquer jeito".

Em frases negativas, principalmente com a forma potencial, significa "de jeito nenhum", mostrando que algo é impossível apesar do esforço. Por exemplo, "não consigo lembrar o nome dele de jeito nenhum".

A expressão どうしてもと言うなら significa "se você insiste tanto" e é usada quando alguém cede a um pedido.""",
st="""どうしても + Verbo たい / ほしい (de qualquer jeito)
どうしても + Verbo なければならない (a todo custo)
どうしても + Verbo potencial negativo (de jeito nenhum)
どうしてもと言うなら (se você insiste)""",
no="""Não confunda com どうして (por quê). どうしても tem も no final e muda completamente o sentido.

Em recusas educadas, どうしても都合がつかない significa "de jeito nenhum consigo encaixar na agenda".

どうしても transmite emoção forte, então é comum em pedidos sinceros e em desabafos.""",
bf="どうしても",
rx="どうしても",
tk=["どうしても"],
va=["どうしても"],
E=[
("どうしてもこの大学に入りたい。", "どうしてもこのだいがくにはいりたい。", "Quero entrar nesta faculdade de qualquer jeito."),
("どうしても彼の名前が思い出せない。", "どうしてもかれのなまえがおもいだせない。", "Não consigo lembrar o nome dele de jeito nenhum."),
("明日は大事な会議があるので、どうしても休めません。", "あしたはだいじなかいぎがあるので、どうしてもやすめません。", "Amanhã tenho uma reunião importante, então não posso faltar de jeito nenhum."),
("どうしてもと言うなら、行ってもいいよ。", "どうしてもというなら、いってもいいよ。", "Se você insiste tanto, pode ir."),
("どうしても納豆が食べられない。", "どうしてもなっとうがたべられない。", "De jeito nenhum consigo comer natto."),
],
R=[
("____日本で働きたいです。", "Quero trabalhar no Japão de qualquer jeito.", ["どうしても"]),
("この漢字が____覚えられない。", "Não consigo decorar este kanji de jeito nenhum.", ["どうしても"]),
("この仕事は____今日中に終わらせなければならない。", "Este trabalho tem que ser terminado hoje a todo custo.", ["どうしても"]),
("引っ越す前に、彼に____会いたい。", "Antes da mudança, quero ver ele de qualquer jeito.", ["どうしても"]),
("鍵が壊れて、ドアが____開かない。", "A fechadura quebrou e a porta não abre de jeito nenhum.", ["どうしても"]),
],
),
dict(
n=22,
jp="〜ふりをする",
rd="furi wo suru",
tr="Fingir / Fazer de conta",
ex="""ふりをする é usado para dizer que alguém finge estar em certa situação, ou finge fazer algo, sem que seja verdade. Equivale a "fingir" ou "fazer de conta".

ふり significa "aparência" ou "comportamento". Assim, ふりをする é "fazer a aparência de...".

Ele vem depois da forma simples de verbos e adjetivos. Com adjetivos な, usa-se な, e com substantivos, の.

A forma do verbo antes de ふり faz diferença. Com ている ou た, a pessoa finge um estado: 寝ているふり (fingir que está dormindo), 寝たふり (fingir que dormiu). Com ない, finge que não faz algo: 聞こえないふり (fingir que não ouve).""",
st="""Verbo (forma simples: ている / た / ない) + ふりをする
Adjetivo い + ふりをする
Adjetivo な + な + ふりをする
Substantivo + の + ふりをする

Escrita: ふり / 振り""",
no="""Na fala casual, を costuma ser omitido: 寝たふりする.

A expressão 知らないふりをする (fingir que não sabe) é muito comum.

ふり também aparece em 見て見ぬふり, que significa "fazer vista grossa".""",
bf="ふりをする",
rx="ふりをし|ふりをす|振りをし|ふりして",
tk=["ふり", "を", "する"],
va=["ふりをする", "ふりをした", "ふりをしている", "ふりする"],
E=[
("彼は聞こえないふりをした。", "かれはきこえないふりをした。", "Ele fingiu que não ouviu."),
("弟は寝たふりをしていた。", "おとうとはねたふりをしていた。", "Meu irmão mais novo estava fingindo que dormia."),
("知っているふりをするのはやめなさい。", "しっているふりをするのはやめなさい。", "Pare de fingir que sabe."),
("彼女は元気なふりをしているが、本当は悲しんでいる。", "かのじょはげんきなふりをしているが、ほんとうはかなしんでいる。", "Ela finge estar bem, mas na verdade está triste."),
("犬が死んだふりをして遊んでいる。", "いぬがしんだふりをしてあそんでいる。", "O cachorro está brincando de se fingir de morto."),
],
R=[
("母に呼ばれたが、寝ている____。", "Minha mãe me chamou, mas fingi que estava dormindo.", ["ふりをした", "ふりをしました"]),
("彼は何も知らない____いる。", "Ele está fingindo que não sabe de nada.", ["ふりをして"]),
("子供は勉強している____けど、漫画を読んでいた。", "A criança fingia que estudava, mas estava lendo mangá.", ["ふりをしていた"]),
("彼女は平気な____が、本当は怖かった。", "Ela fingiu estar tranquila, mas na verdade estava com medo.", ["ふりをした"]),
("道で先生に会ったが、見なかった____。", "Encontrei o professor na rua, mas fingi que não vi.", ["ふりをした"]),
],
),
dict(
n=23,
jp="ふと",
rd="futo",
tr="De repente / Sem querer / Por acaso",
ex="""ふと é um advérbio que indica que algo aconteceu de forma espontânea, sem intenção nem motivo especial. Equivale a "de repente", "sem querer" ou "por acaso".

Ele é muito usado com ações mentais ou de percepção, como lembrar, pensar, perceber, olhar ou acordar. Por exemplo, "de repente me lembrei de um amigo antigo" ou "acordei de repente no meio da noite".

A diferença em relação a 急に é o tom. 急に destaca uma mudança brusca e rápida. ふと tem um tom mais suave e poético, ligado a pensamentos e sensações que surgem naturalmente.

A expressão ふと気がつくと significa "quando dei por mim" e é muito comum em narrativas.""",
st="""ふと + Verbo de percepção ou pensamento (思い出す / 気づく / 見る / 思う)
ふと + 目が覚める
ふと気がつくと、 + Frase""",
no="""ふと aparece muito em romances, músicas e textos literários, porque transmite uma sensação delicada.

Com verbos de ação física e intensa, como correr ou gritar, ふと soa estranho. Nesses casos, usa-se 急に ou 突然.

A expressão ふとした + Substantivo, como ふとしたきっかけ, significa "um motivo casual" ou "um acaso".""",
bf="ふと",
rx="ふと",
tk=["ふと"],
va=["ふと"],
E=[
("ふと空を見上げると、虹が出ていた。", "ふとそらをみあげると、にじがでていた。", "Quando olhei para o céu por acaso, havia um arco-íris."),
("ふと昔の友達のことを思い出した。", "ふとむかしのともだちのことをおもいだした。", "De repente, me lembrei de um velho amigo."),
("夜中にふと目が覚めた。", "よなかにふとめがさめた。", "Acordei de repente no meio da noite."),
("歩いているとき、ふといいアイデアが浮かんだ。", "あるいているとき、ふといいアイデアがうかんだ。", "Enquanto andava, de repente me veio uma boa ideia."),
("ふと気がつくと、もう夜になっていた。", "ふときがつくと、もうよるになっていた。", "Quando dei por mim, já tinha anoitecido."),
],
R=[
("____窓の外を見ると、雪が降っていた。", "Quando olhei pela janela por acaso, estava nevando.", ["ふと"]),
("電車の中で、____母の顔が浮かんだ。", "No trem, de repente me veio à mente o rosto da minha mãe.", ["ふと"]),
("____時計を見たら、もう十二時だった。", "Quando olhei o relógio sem querer, já era meia-noite.", ["ふと"]),
("散歩中に、____子供のころを思い出した。", "Durante a caminhada, de repente me lembrei da infância.", ["ふと"]),
("彼は____立ち止まって、後ろを振り返った。", "De repente, ele parou e olhou para trás.", ["ふと"]),
],
),
dict(
n=24,
jp="〜がち",
rd="gachi",
tr="Tender a / Ter a tendência de / Com frequência",
ex="""がち é usado para dizer que algo tende a acontecer com frequência, geralmente algo negativo ou indesejado. Equivale a "tender a" ou "ter a tendência de".

Ele vem depois do verbo na forma ます sem ます, ou diretamente depois de alguns substantivos. Por exemplo, 休みがち (tende a faltar), 病気がち (vive doente), 曇りがち (tempo frequentemente nublado).

O tom costuma ser de crítica, preocupação ou constatação de algo ruim. Por isso, é usado com coisas como esquecer, faltar, ficar doente ou descuidar da alimentação.

がち funciona como um adjetivo な: pode ser seguido de だ, です, な, で e になる.""",
st="""Verbo na forma ます sem ます + がち + だ / です
Substantivo + がち + だ / です (病気がち / 曇りがち / 遠慮がち)
〜がち + な + Substantivo
〜がち + になる""",
no="""がち é muito parecido com やすい no sentido de tendência, mas がち foca na frequência com que algo acontece, enquanto やすい foca na facilidade.

Para tendências positivas, がち soa estranho. Nesses casos, prefira よく ou 傾向がある.

Na gíria jovem, ガチ (em katakana) significa "sério" ou "de verdade", e não tem relação com essa gramática.""",
bf="がち",
rx="がち",
tk=["がち"],
va=["がち", "がちだ", "がちな", "がちになる"],
E=[
("冬は風邪をひきがちだ。", "ふゆはかぜをひきがちだ。", "No inverno, a gente tende a pegar resfriado."),
("彼は最近、学校を休みがちです。", "かれはさいきん、がっこうをやすみがちです。", "Ultimamente, ele tem faltado à escola com frequência."),
("雨の日は家にこもりがちになる。", "あめのひはいえにこもりがちになる。", "Em dias de chuva, a gente tende a ficar trancado em casa."),
("母は病気がちで、よく入院している。", "はははびょうきがちで、よくにゅういんしている。", "Minha mãe vive doente e é internada com frequência."),
("忙しいと、食事が不規則になりがちだ。", "いそがしいと、しょくじがふきそくになりがちだ。", "Quando estamos ocupados, a alimentação tende a ficar irregular."),
],
R=[
("一人暮らしだと、野菜が不足し____だ。", "Morando sozinho, a gente tende a comer pouca verdura.", ["がち"]),
("彼は約束を忘れ____なので、困る。", "Ele tende a esquecer os compromissos, e isso é um problema.", ["がち"]),
("梅雨の時期は曇り____の天気が続く。", "Na época das chuvas, o tempo costuma ficar nublado.", ["がち"]),
("年をとると、物忘れし____になる。", "Com a idade, a gente tende a ficar esquecido.", ["がち"]),
("子供のころ、私は病気____だった。", "Quando criança, eu vivia doente.", ["がち"]),
],
),
dict(
n=25,
jp="〜がたい",
rd="gatai",
tr="Difícil de / Quase impossível de",
ex="""がたい é usado para dizer que algo é muito difícil ou quase impossível de fazer, por motivos emocionais ou psicológicos. Equivale a "difícil de" ou "quase impossível de".

Ele vem depois do verbo na forma ます sem ます. O resultado funciona como um adjetivo い.

A diferença em relação a にくい e づらい é o tipo de dificuldade. がたい não fala de dificuldade física, mas de algo que a pessoa não consegue aceitar, entender ou fazer por questões internas, como acreditar em algo inacreditável, perdoar algo grave ou esquecer algo marcante.

É usado principalmente com verbos de pensamento e sentimento, como 信じる, 理解する, 許す, 忘れる, 認める e 表す. Por isso, soa formal e aparece muito na escrita.""",
st="""Verbo na forma ます sem ます + がたい

Combinações comuns: 信じがたい / 理解しがたい / 許しがたい / 忘れがたい / 耐えがたい / 言い表しがたい

Escrita: がたい / 難い""",
no="""がたい não é usado para ações físicas simples. Dizer "difícil de andar" com がたい soa errado; para isso, usa-se にくい.

Também existe o adjetivo ありがたい (grato), que vem da mesma origem: algo "raro de existir", e por isso precioso.

Em textos formais, 〜がたいものがある reforça a ideia de que algo é difícil de aceitar.""",
bf="がたい",
rx="がたい|難い|がたく",
tk=["がたい"],
va=["がたい", "難い", "がたく"],
E=[
("彼がうそをついたなんて、信じがたい。", "かれがうそをついたなんて、しんじがたい。", "É difícil acreditar que ele mentiu."),
("この絵の美しさは、言葉では表しがたい。", "このえのうつくしさは、ことばではあらわしがたい。", "A beleza deste quadro é difícil de expressar em palavras."),
("彼の行動は理解しがたい。", "かれのこうどうはりかいしがたい。", "O comportamento dele é difícil de entender."),
("それは忘れがたい思い出です。", "それはわすれがたいおもいでです。", "Essa é uma lembrança inesquecível."),
("今回の失敗は、許しがたいことだ。", "こんかいのしっぱいは、ゆるしがたいことだ。", "O erro desta vez é imperdoável."),
],
R=[
("あの優しい人が犯人だなんて、信じ____。", "É difícil acreditar que aquela pessoa tão gentil é a culpada.", ["がたい"]),
("留学の経験は、忘れ____ものになった。", "A experiência do intercâmbio se tornou algo inesquecível.", ["がたい"]),
("彼の意見には賛成し____。", "É difícil concordar com a opinião dele.", ["がたい"]),
("その時の気持ちは、言葉では言い表し____。", "O sentimento daquele momento é difícil de expressar em palavras.", ["がたい"]),
("このような失礼な態度は許し____。", "Uma atitude tão mal-educada como essa é imperdoável.", ["がたい"]),
],
),
dict(
n=26,
jp="〜気味",
rd="gimi",
tr="Um pouco / Meio / Com tendência a",
ex="""気味 é usado para dizer que alguém ou algo está um pouco em certo estado, geralmente negativo. Equivale a "um pouco", "meio" ou "com tendência a".

Ele vem depois de substantivos ou do verbo na forma ます sem ます. Por exemplo, 風邪気味 (meio resfriado), 疲れ気味 (um pouco cansado), 太り気味 (um pouco acima do peso).

A ideia é de um estado leve, que não é muito forte, mas que se percebe. Por isso, é usado para sintomas, cansaço, tendências de peso, atrasos e mudanças graduais.

気味 funciona como um adjetivo な: pode ser seguido de だ, です, な e で.""",
st="""Substantivo + 気味 + だ / です (風邪気味 / 緊張気味 / 寝不足気味)
Verbo na forma ます sem ます + 気味 + だ / です (疲れ気味 / 太り気味 / 遅れ気味)
〜気味 + で、 + Frase

Escrita: 気味 / ぎみ (lido ぎみ como sufixo)""",
no="""Comparando: がち indica que algo acontece com frequência; 気味 indica que, no momento, há um pouco daquele estado.

Sozinho, 気味 (きみ) aparece em palavras como 気味が悪い, que significa "estranho" ou "assustador".

風邪気味 é uma das expressões mais usadas para justificar um mal-estar leve no trabalho ou na escola.""",
bf="気味",
rx="気味|ぎみ",
tk=["気味"],
va=["気味", "ぎみ"],
E=[
("今日は少し風邪気味です。", "きょうはすこしかぜぎみです。", "Hoje estou meio resfriado."),
("最近、疲れ気味なので、早く寝ています。", "さいきん、つかれぎみなので、はやくねています。", "Ultimamente estou um pouco cansado, então tenho dormido cedo."),
("彼は少し太り気味だ。", "かれはすこしふとりぎみだ。", "Ele está um pouco acima do peso."),
("電車が遅れ気味で、会議に間に合うか心配だ。", "でんしゃがおくれぎみで、かいぎにまにあうかしんぱいだ。", "O trem está meio atrasado, e estou preocupado se vou chegar a tempo para a reunião."),
("仕事が忙しくて、寝不足気味です。", "しごとがいそがしくて、ねぶそくぎみです。", "Estou com o trabalho corrido e meio sem dormir."),
],
R=[
("少し熱があって、風邪____です。", "Estou com um pouco de febre, meio resfriado.", ["気味", "ぎみ"]),
("最近働きすぎて、疲れ____だ。", "Ultimamente trabalhei demais e estou meio cansado.", ["気味", "ぎみ"]),
("冬休みに食べすぎて、太り____です。", "Comi demais nas férias de inverno e estou um pouco acima do peso.", ["気味", "ぎみ"]),
("試験の前で、彼は緊張____だった。", "Antes da prova, ele estava meio nervoso.", ["気味", "ぎみ"]),
("最近の物価は上がり____だ。", "Ultimamente os preços estão com tendência de alta.", ["気味", "ぎみ"]),
],
),
dict(
n=27,
jp="〜ごとに",
rd="goto ni",
tr="A cada / Cada vez que / Por (cada)",
ex="""ごとに é usado para indicar repetição em intervalos regulares ou para dizer que algo acontece "a cada" unidade. Equivale a "a cada", "cada vez que" ou "por cada".

Com expressões de tempo e distância, indica intervalos regulares: "a cada quatro anos", "a cada três horas".

Com substantivos de grupo, indica que algo acontece separadamente para cada unidade: "por turma", "por estação do ano", "por região".

Com verbos na forma de dicionário, significa "toda vez que": "toda vez que encontro alguém".

Também aparece em expressões que indicam mudança gradual, como 一雨ごとに ("a cada chuva", ou seja, aos poucos).""",
st="""Período / Distância + ごとに
Substantivo (grupo / unidade) + ごとに
Verbo na forma de dicionário + ごとに (toda vez que)

Escrita: ごとに / 毎に""",
no="""Com dias, 一日ごとに significa "todo dia" ou "a cada dia", enquanto 一日おきに significa "dia sim, dia não". É uma diferença importante.

Com verbos, ごとに é parecido com たびに, que também significa "toda vez que".

ごとに soa um pouco mais formal que 毎 (まい) em palavras como 毎日 e 毎週.""",
bf="ごとに",
rx="ごとに|毎に",
tk=["ごと", "に"],
va=["ごとに", "毎に"],
E=[
("オリンピックは四年ごとに開かれる。", "オリンピックはよねんごとにひらかれる。", "As Olimpíadas são realizadas a cada quatro anos."),
("この薬は三時間ごとに飲んでください。", "このくすりはさんじかんごとにのんでください。", "Tome este remédio a cada três horas."),
("会う人ごとに、同じ質問をされた。", "あうひとごとに、おなじしつもんをされた。", "Cada pessoa que eu encontrava me fazia a mesma pergunta."),
("季節ごとに、店の飾りが変わる。", "きせつごとに、みせのかざりがかわる。", "A decoração da loja muda a cada estação."),
("一雨ごとに暖かくなっていく。", "ひとあめごとにあたたかくなっていく。", "A cada chuva, o tempo vai ficando mais quente."),
],
R=[
("バスは十五分____来ます。", "O ônibus passa a cada quinze minutos.", ["ごとに"]),
("クラス____、テーマを決めて発表した。", "Cada turma escolheu um tema e fez uma apresentação.", ["ごとに"]),
("一か月____、部屋の大掃除をしています。", "Faço uma faxina geral no quarto a cada mês.", ["ごとに"]),
("会う____、彼は背が高くなっている。", "Cada vez que o encontro, ele está mais alto.", ["ごとに"]),
("地域____、言葉が少しずつ違う。", "A língua muda um pouco de região para região.", ["ごとに"]),
],
),
dict(
n=28,
jp="〜ほど（程度）",
rd="hodo (teido)",
tr="A ponto de / Tanto que / Cerca de",
ex="""ほど é usado para indicar o grau ou a intensidade de algo, comparando com um exemplo extremo. Equivale a "a ponto de" ou "tanto que".

A parte antes de ほど mostra um exemplo do quanto aquilo é intenso. Por exemplo, "estava tão triste que queria chorar" ou "está tão frio que a respiração fica branca".

Muitas vezes, o exemplo é exagerado, como 死ぬほど (a ponto de morrer), usado para dar ênfase.

Depois de números e quantidades, ほど significa "cerca de" ou "aproximadamente", como em "cerca de dez minutos". Nesse uso, ele é parecido com ぐらい, mas um pouco mais formal.""",
st="""Verbo (forma simples) + ほど + Adjetivo / Verbo
Adjetivo い + ほど
Adjetivo な + な + ほど
Substantivo + ほど
Número + ほど (cerca de)""",
no="""ほど e くらい têm sentidos muito parecidos para grau. ほど soa um pouco mais formal e é mais comum na escrita.

Expressões como 死ぬほど, 泣きたいほど e 信じられないほど são muito usadas para exagerar.

Na forma negativa, ほど〜ない indica comparação: "não é tão... quanto".""",
bf="ほど",
rx="ほど",
tk=["ほど"],
va=["ほど"],
E=[
("泣きたいほど悲しかった。", "なきたいほどかなしかった。", "Estava tão triste que dava vontade de chorar."),
("今日は死ぬほど疲れた。", "きょうはしぬほどつかれた。", "Hoje fiquei morto de cansaço."),
("今日は息が白くなるほど寒い。", "きょうはいきがしろくなるほどさむい。", "Hoje está tão frio que a respiração fica branca."),
("家から駅まで十分ほどかかります。", "いえからえきまでじゅっぷんほどかかります。", "De casa até a estação leva cerca de dez minutos."),
("彼の料理は店で出せるほどおいしい。", "かれのりょうりはみせでだせるほどおいしい。", "A comida dele é tão gostosa que poderia ser servida num restaurante."),
],
R=[
("お腹が痛くて、歩けない____だった。", "Estava com tanta dor de barriga que não conseguia andar.", ["ほど"]),
("今週は目が回る____忙しい。", "Esta semana estou tão ocupado que fico tonto.", ["ほど"]),
("駅で一時間____待ちました。", "Esperei cerca de uma hora na estação.", ["ほど"]),
("その知らせを聞いて、声が出ない____驚いた。", "Fiquei tão surpreso com a notícia que perdi a voz.", ["ほど"]),
("信じられない____、きれいな景色だった。", "Era uma paisagem tão bonita que nem dava para acreditar.", ["ほど"]),
],
),
dict(
n=29,
jp="〜ほど〜ない",
rd="hodo ~ nai",
tr="Não tão... quanto / Nada é tão... quanto",
ex="""ほど〜ない é usado para comparações negativas. Equivale a "não é tão... quanto".

A estrutura coloca o ponto de comparação antes de ほど, e o adjetivo ou verbo na forma negativa depois. Por exemplo, "este verão não está tão quente quanto o do ano passado".

Com 思った ou 心配した antes de ほど, mostra que a realidade foi menos intensa do que se esperava: "não foi tão difícil quanto eu pensava".

Uma forma muito usada é 〜ほど〜ものはない (ou 〜はない), que significa "não há nada tão... quanto...". Ela é uma forma enfática de dizer que algo é o mais importante, o melhor ou o mais extremo.""",
st="""A + は + B + ほど + Adjetivo / Verbo negativo (A não é tão... quanto B)
思った / 心配した + ほど + Adjetivo negativo
Substantivo + ほど + Adjetivo + Substantivo + は + ない (não há... tão... quanto)""",
no="""ほど〜ない é diferente de より. より compara de forma positiva ("A é mais... que B"); ほど〜ない compara de forma negativa ("A não é tão... quanto B").

A frase 健康ほど大切なものはない ("nada é tão importante quanto a saúde") é um exemplo clássico.

Na fala, くらい〜ない também é usado com o mesmo sentido.""",
bf="ほど",
rx="ほど",
tk=["ほど", "ない"],
va=["ほど〜ない", "ほど〜はない"],
E=[
("今年の夏は去年ほど暑くない。", "ことしのなつはきょねんほどあつくない。", "Este verão não está tão quente quanto o do ano passado."),
("私は兄ほど背が高くない。", "わたしはあにほどせがたかくない。", "Eu não sou tão alto quanto meu irmão mais velho."),
("この問題は思ったほど難しくなかった。", "このもんだいはおもったほどむずかしくなかった。", "Esta questão não foi tão difícil quanto eu pensava."),
("東京ほど人が多い町はない。", "とうきょうほどひとがおおいまちはない。", "Não há cidade com tanta gente quanto Tóquio."),
("健康ほど大切なものはない。", "けんこうほどたいせつなものはない。", "Nada é tão importante quanto a saúde."),
],
R=[
("弟は私____勉強しない。", "Meu irmão mais novo não estuda tanto quanto eu.", ["ほど"]),
("今日は昨日____寒くないですね。", "Hoje não está tão frio quanto ontem, né?", ["ほど"]),
("試験は心配した____難しくなかった。", "A prova não foi tão difícil quanto eu temia.", ["ほど"]),
("母の料理____おいしいものはない。", "Não há nada tão gostoso quanto a comida da minha mãe.", ["ほど"]),
("この町は東京____便利ではない。", "Esta cidade não é tão prática quanto Tóquio.", ["ほど"]),
],
),
dict(
n=30,
jp="一度に",
rd="ichido ni",
tr="De uma vez / Ao mesmo tempo / Tudo junto",
ex="""一度に significa "de uma vez" ou "ao mesmo tempo". Ele indica que várias coisas acontecem ou são feitas juntas, em uma única ocasião, em vez de aos poucos.

Por exemplo, comer muito de uma vez, fazer duas coisas ao mesmo tempo ou receber vários trabalhos de uma só vez.

Também é usado para falar de capacidade, como "este elevador leva dez pessoas de uma vez".

Muitas vezes, aparece em conselhos ou avisos, indicando que fazer tudo de uma vez não é bom: "é melhor não tentar decorar tudo de uma vez".""",
st="""一度に + Verbo
一度に + Quantidade + Verbo

Escrita: 一度に / いちどに""",
no="""Não confunda 一度に (de uma vez) com 一度 (uma vez, alguma vez), como em 一度行ってみたい.

Expressões parecidas são 同時に (ao mesmo tempo, mais formal) e 一気に (de uma vez só, com força e rapidez).

Em regras de uso, como em elevadores e brinquedos, 一度に aparece para indicar a capacidade máxima.""",
bf="一度に",
rx="一度に|いちどに",
tk=["一度", "に"],
va=["一度に", "いちどに"],
E=[
("一度にたくさん食べると、体によくない。", "いちどにたくさんたべると、からだによくない。", "Comer muito de uma vez não faz bem para o corpo."),
("一度に二つのことはできません。", "いちどにふたつのことはできません。", "Não consigo fazer duas coisas ao mesmo tempo."),
("仕事が一度に来て、大変だった。", "しごとがいちどにきて、たいへんだった。", "O trabalho veio todo de uma vez, e foi difícil."),
("このエレベーターは一度に十人乗れます。", "このエレベーターはいちどにじゅうにんのれます。", "Este elevador leva dez pessoas de uma vez."),
("単語を一度に覚えようとしないほうがいい。", "たんごをいちどにおぼえようとしないほうがいい。", "É melhor não tentar decorar as palavras todas de uma vez."),
],
R=[
("____全部の荷物は運べない。", "Não dá para carregar toda a bagagem de uma vez.", ["一度に", "いちどに"]),
("このバスは____五十人乗ることができる。", "Este ônibus pode levar cinquenta pessoas de uma vez.", ["一度に", "いちどに"]),
("いろいろな問題が____起きて、困った。", "Vários problemas aconteceram ao mesmo tempo, e fiquei sem saber o que fazer.", ["一度に", "いちどに"]),
("給料を____使ってしまった。", "Acabei gastando o salário todo de uma vez.", ["一度に", "いちどに"]),
("薬を____たくさん飲んではいけません。", "Não se deve tomar muito remédio de uma vez.", ["一度に", "いちどに"]),
],
),
]
