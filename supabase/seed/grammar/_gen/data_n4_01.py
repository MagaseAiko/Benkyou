G = [
dict(
n=1,
jp="〜間",
rd="aida",
tr="Durante / Enquanto",
ex="""間 (あいだ) é usado para dizer que algo acontece durante todo um período. Equivale a "durante" ou "enquanto".

A ideia central é continuidade: a ação principal acontece do começo ao fim do período indicado. Por isso, o verbo principal costuma expressar algo contínuo, como estar fazendo algo, ficar em um lugar ou continuar em um estado. É comum aparecer junto com ずっと.

Antes de 間, pode vir um substantivo com の, ou um verbo que indica um estado ou ação contínua, geralmente na forma ている ou com verbos como いる.

Não confunda com 間に: 間 cobre o período inteiro, enquanto 間に indica que algo aconteceu em algum momento dentro desse período.""",
st="""Substantivo + の + 間
Verbo na forma ている + 間
Verbo de estado (いる / ある) + 間
Adjetivo い + 間
Adjetivo な + な + 間

Escrita: 間 / あいだ""",
no="""間 também é usado para espaço físico, com o sentido de "entre", como entre dois prédios ou entre duas pessoas.

Quando a frase com 間 é seguida de は, a ideia de "durante esse tempo, sempre" fica ainda mais destacada.

Lido ま, o mesmo kanji aparece em outras palavras, como 間に合う (chegar a tempo). Lido かん, aparece em 時間 e 週間.""",
bf="間",
rx="間、|間は|間ずっと|間中|あいだ",
tk=["間"],
va=["間", "あいだ"],
E=[
("夏休みの間、ずっと国に帰っていました。", "なつやすみのあいだ、ずっとくににかえっていました。", "Durante as férias de verão, fiquei no meu país o tempo todo."),
("母が料理をしている間、私は部屋を掃除しました。", "ははがりょうりをしているあいだ、わたしはへやをそうじしました。", "Enquanto minha mãe cozinhava, eu limpei o quarto."),
("授業の間は、携帯電話を使わないでください。", "じゅぎょうのあいだは、けいたいでんわをつかわないでください。", "Durante a aula, não usem o celular."),
("日本にいる間、たくさんの所へ行きたいです。", "にほんにいるあいだ、たくさんのところへいきたいです。", "Enquanto estiver no Japão, quero ir a muitos lugares."),
("電車に乗っている間、ずっと音楽を聞いていました。", "でんしゃにのっているあいだ、ずっとおんがくをきいていました。", "Fiquei ouvindo música o tempo todo enquanto estava no trem."),
],
R=[
("子供が寝ている____、本を読みました。", "Enquanto a criança dormia, li um livro.", ["間", "あいだ"]),
("冬休みの____、毎日アルバイトをしました。", "Durante as férias de inverno, trabalhei meio período todos os dias.", ["間", "あいだ"]),
("先生が話している____は、静かにしてください。", "Enquanto o professor estiver falando, fiquem em silêncio.", ["間", "あいだ"]),
("両親が旅行している____、私が犬の世話をします。", "Enquanto meus pais estiverem viajando, eu cuido do cachorro.", ["間", "あいだ"]),
("会議の____、ずっと眠かったです。", "Durante a reunião inteira, fiquei com sono.", ["間", "あいだ"]),
],
),
dict(
n=2,
jp="〜間に",
rd="aida ni",
tr="Enquanto / Durante (em algum momento) / Antes que",
ex="""間に é usado para dizer que algo acontece em algum momento dentro de um período, e não durante o período inteiro. Equivale a "enquanto" ou "durante".

A diferença em relação a 間 é muito importante. Com 間, a ação principal ocupa todo o período. Com 間に, a ação principal acontece uma vez, em algum ponto desse intervalo, e termina antes de o período acabar.

Por isso, o verbo principal costuma ser uma ação pontual, como chegar, terminar, fazer uma tarefa ou acontecer algo.

Muitas vezes, 間に também carrega a ideia de aproveitar uma oportunidade: fazer algo enquanto ainda dá tempo ou enquanto uma situação continua.""",
st="""Substantivo + の + 間に
Verbo na forma ている + 間に
Verbo de estado (いる / ある) + 間に
Adjetivo い + 間に
Adjetivo な + な + 間に

Escrita: 間に / あいだに""",
no="""A expressão 知らない間に significa "sem perceber" ou "quando vi, já tinha acontecido".

間に é parecido com うちに, que também significa "enquanto", mas うちに destaca mais a ideia de "antes que a situação mude".

Uma dica para escolher: se a ação dura o tempo todo, use 間; se acontece uma vez no meio do período, use 間に.""",
bf="間に",
rx="間に|あいだに",
tk=["間", "に"],
va=["間に", "あいだに"],
E=[
("留守の間に、友達が来ました。", "るすのあいだに、ともだちがきました。", "Enquanto eu estava fora, um amigo veio."),
("赤ちゃんが寝ている間に、洗濯をします。", "あかちゃんがねているあいだに、せんたくをします。", "Vou lavar a roupa enquanto o bebê dorme."),
("夏休みの間に、運転免許を取りたいです。", "なつやすみのあいだに、うんてんめんきょをとりたいです。", "Quero tirar a carteira de motorista durante as férias de verão."),
("若い間に、いろいろな国へ行ってみたい。", "わかいあいだに、いろいろなくにへいってみたい。", "Quero conhecer vários países enquanto sou jovem."),
("知らない間に、雨がやんでいた。", "しらないあいだに、あめがやんでいた。", "Sem eu perceber, a chuva tinha parado."),
],
R=[
("母が買い物に行っている____、部屋を片付けました。", "Enquanto minha mãe foi fazer compras, arrumei o quarto.", ["間に", "あいだに"]),
("日本にいる____、富士山に登りたいです。", "Quero subir o Monte Fuji enquanto estiver no Japão.", ["間に", "あいだに"]),
("寝ている____、地震がありました。", "Enquanto eu dormia, houve um terremoto.", ["間に", "あいだに"]),
("休みの____、引っ越しを済ませました。", "Terminei a mudança durante a folga.", ["間に", "あいだに"]),
("気がつかない____、もう夜になっていた。", "Sem eu perceber, já tinha anoitecido.", ["間に", "あいだに"]),
],
),
dict(
n=3,
jp="あまり〜ない",
rd="amari ~ nai",
tr="Não muito / Quase não",
ex="""あまり〜ない é usado para dizer que algo acontece pouco ou que uma característica não é forte. Equivale a "não muito" ou "quase não".

あまり sozinho não é negativo, mas, nesse uso, ele sempre aparece junto com uma forma negativa: verbo na forma ない ou ません, adjetivo い com くない, ou adjetivo な e substantivo com じゃない.

Com verbos, indica frequência baixa, como "não vejo muito" ou "quase não bebo". Com adjetivos, indica intensidade baixa, como "não é muito caro".

É uma forma suave de negar. Em vez de dizer que algo é ruim ou que você não gosta, あまり〜ない suaviza a frase, e por isso é muito usado por educação.""",
st="""あまり + Verbo na forma ない / ません
あまり + Adjetivo い sem い + くない
あまり + Adjetivo な / Substantivo + じゃない / ではありません

Forma falada: あんまり""",
no="""Na fala, あまり muitas vezes vira あんまり, com o mesmo sentido.

Em frases afirmativas, あまり tem outro sentido: "demais", como em あまりにも. Esse uso aparece em níveis seguintes.

Para dizer "nunca" ou "nada", o japonês usa 全然〜ない, que é mais forte que あまり〜ない.""",
bf="あまり",
rx="あまり|あんまり",
tk=["あまり", "ない"],
va=["あまり", "あんまり"],
E=[
("私はあまりテレビを見ません。", "わたしはあまりテレビをみません。", "Eu não vejo muita TV."),
("この料理はあまり辛くないです。", "このりょうりはあまりからくないです。", "Esta comida não é muito apimentada."),
("今日はあまり時間がない。", "きょうはあまりじかんがない。", "Hoje não tenho muito tempo."),
("昨日の映画はあんまりおもしろくなかった。", "きのうのえいがはあんまりおもしろくなかった。", "O filme de ontem não foi muito interessante."),
("日本語はまだあまり上手じゃありません。", "にほんごはまだあまりじょうずじゃありません。", "Meu japonês ainda não é muito bom."),
],
R=[
("兄は____お酒を飲みません。", "Meu irmão mais velho quase não bebe.", ["あまり", "あんまり"]),
("この町は____にぎやかではありません。", "Esta cidade não é muito animada.", ["あまり", "あんまり"]),
("最近、____寝ていません。", "Ultimamente, não tenho dormido muito.", ["あまり", "あんまり"]),
("「旅行はどうでしたか。」「____楽しくなかったです。」", "\"Como foi a viagem?\" \"Não foi muito divertida.\"", ["あまり", "あんまり"]),
("甘い物は____好きじゃない。", "Não gosto muito de doces.", ["あまり", "あんまり"]),
],
),
dict(
n=4,
jp="〜後で",
rd="ato de",
tr="Depois de / Mais tarde",
ex="""後で é usado para dizer que uma ação acontece depois de outra. Equivale a "depois de" ou, sozinho, "mais tarde".

Com verbos, o verbo que vem antes fica sempre na forma た, mesmo que a frase fale do futuro. Isso acontece porque a primeira ação precisa estar terminada antes da segunda.

Com substantivos, usa-se の antes de 後で, como "depois da aula".

Sozinho, no começo da frase, 後で significa "mais tarde" ou "depois", e é muito usado para adiar algo de forma educada.

Comparando com てから: as duas indicam sequência, mas てから destaca mais a ordem obrigatória, enquanto 後で apenas situa a ação depois de outra no tempo.""",
st="""Verbo na forma た + 後で
Substantivo + の + 後で
後で + Verbo (mais tarde)

Escrita: 後で / あとで""",
no="""O oposto de 後で é 前に, que usa o verbo na forma de dicionário. Lembrar desse contraste ajuda: antes = dicionário, depois = た.

A forma 後 sem で também existe, como em 後、〜, e soa um pouco mais escrita.

後で電話します e 後で連絡します são frases muito comuns para dizer que você vai entrar em contato depois.""",
bf="後で",
rx="後で|あとで",
tk=["後", "で"],
va=["後で", "あとで"],
E=[
("宿題をした後で、テレビを見ます。", "しゅくだいをしたあとで、テレビをみます。", "Vou ver TV depois de fazer a lição."),
("授業の後で、先生に質問しました。", "じゅぎょうのあとで、せんせいにしつもんしました。", "Depois da aula, fiz uma pergunta ao professor."),
("ご飯を食べた後で、薬を飲んでください。", "ごはんをたべたあとで、くすりをのんでください。", "Tome o remédio depois de comer."),
("今ちょっと忙しいので、後で電話します。", "いまちょっといそがしいので、あとででんわします。", "Agora estou um pouco ocupado, então ligo mais tarde."),
("仕事が終わった後で、一緒に飲みに行きませんか。", "しごとがおわったあとで、いっしょにのみにいきませんか。", "Depois do trabalho, quer ir beber alguma coisa comigo?"),
],
R=[
("歯を磨いた____、寝ます。", "Vou dormir depois de escovar os dentes.", ["後で", "あとで"]),
("映画を見た____、レストランで食事をしました。", "Depois de ver o filme, jantamos num restaurante.", ["後で", "あとで"]),
("会議の____、少し話せますか。", "Podemos conversar um pouco depois da reunião?", ["後で", "あとで"]),
("今忙しいので、____連絡します。", "Agora estou ocupado, então entro em contato mais tarde.", ["後で", "あとで"]),
("試験が終わった____、みんなでカラオケに行った。", "Depois que a prova acabou, fomos todos ao karaokê.", ["後で", "あとで"]),
],
),
dict(
n=5,
jp="〜ば",
rd="ba",
tr="Se / Caso / Quando",
ex="""ば é a forma condicional que expressa "se". Ela mostra que, se uma condição for cumprida, um resultado acontece.

A ideia principal é de condição necessária: para que o resultado aconteça, é preciso que a primeira parte seja verdade. Por isso, ば é muito usado para conselhos, regras gerais, consequências naturais e hipóteses.

A forma muda conforme o tipo de palavra. Nos verbos, o último som muda de "u" para "e" e recebe ば. Nos adjetivos い, troca-se い por ければ. Nos negativos, ない vira なければ. Para substantivos e adjetivos な, usa-se であれば ou なら.

Em geral, quando a primeira parte é afirmativa e descreve uma ação de quem fala, a segunda parte não costuma ser uma ordem ou pedido. Essa restrição não vale quando a primeira parte é um estado, como ある, いる ou adjetivos.""",
st="""Verbo grupo 1: último som "u" → "e" + ば (行く → 行けば / 飲む → 飲めば)
Verbo grupo 2: tire る + れば (食べる → 食べれば)
Irregulares: する → すれば / 来る → 来れば (くれば)
Adjetivo い: tire い + ければ (安い → 安ければ / いい → よければ)
Negativo: ない → なければ
Substantivo / Adjetivo な: + であれば / なら""",
no="""A expressão どうすればいいですか é muito usada para pedir conselho: "o que eu devo fazer?".

O japonês tem várias formas de "se": ば, たら, と e なら. ば destaca a condição; たら é a mais versátil na conversa; と indica consequência automática; なら responde a algo que o outro disse.

A forma よければ, de いい, aparece muito em ofertas educadas, como "se quiser...".""",
bf="ば",
rx="えば|けば|げば|せば|てば|べば|めば|れば",
tk=["ば"],
va=["ば", "れば", "ければ", "なければ"],
E=[
("時間があれば、手伝います。", "じかんがあれば、てつだいます。", "Se eu tiver tempo, ajudo."),
("安ければ、買います。", "やすければ、かいます。", "Se for barato, eu compro."),
("この薬を飲めば、すぐ治りますよ。", "このくすりをのめば、すぐなおりますよ。", "Se tomar este remédio, você vai melhorar logo."),
("急げば、間に合うと思います。", "いそげば、まにあうとおもいます。", "Se nos apressarmos, acho que chegamos a tempo."),
("雨が降らなければ、ピクニックに行きましょう。", "あめがふらなければ、ピクニックにいきましょう。", "Se não chover, vamos fazer um piquenique."),
],
R=[
("お金があ____、旅行に行きたいです。", "Se eu tivesse dinheiro, queria viajar.", ["れば"]),
("天気がよけ____、ここから山が見えます。", "Se o tempo estiver bom, dá para ver a montanha daqui.", ["れば"]),
("この道をまっすぐ行____、駅に着きます。", "Se seguir reto por esta rua, você chega à estação.", ["けば"]),
("毎日練習す____、上手になりますよ。", "Se praticar todo dia, você vai ficar bom.", ["れば"]),
("わからな____、先生に聞いてください。", "Se não entender, pergunte ao professor.", ["ければ"]),
],
),
dict(
n=6,
jp="〜場合は",
rd="baai wa",
tr="No caso de / Caso / Se",
ex="""場合は é usado para falar de uma situação possível e do que deve ser feito se ela acontecer. Equivale a "no caso de" ou "caso".

場合 significa "caso" ou "situação". Assim, a estrutura apresenta uma hipótese e, em seguida, a instrução ou consequência para aquele caso.

É muito comum em avisos, regras, manuais e instruções, principalmente para situações que não são do dia a dia, como emergências, atrasos, perdas ou problemas.

Por isso, soa mais formal e objetivo do que たら ou ば. Ele vem depois de verbos e adjetivos na forma simples, de adjetivos な com な, e de substantivos com の.""",
st="""Verbo (forma simples: dicionário / ない / た) + 場合は
Adjetivo い + 場合は
Adjetivo な + な + 場合は
Substantivo + の + 場合は

Escrita: 場合 / ばあい""",
no="""場合 normalmente não é usado para coisas que certamente vão acontecer. Ele apresenta um caso possível, não garantido.

Também é comum a forma 場合には, que tem o mesmo sentido, com um pouco mais de ênfase.

A leitura é ばあい, e não ばごう. É uma palavra com leitura que mistura os dois sistemas de leitura dos kanji.""",
bf="場合",
rx="場合|ばあい",
tk=["場合", "は"],
va=["場合は", "ばあいは", "場合には"],
E=[
("雨の場合は、試合は中止です。", "あめのばあいは、しあいはちゅうしです。", "Em caso de chuva, a partida será cancelada."),
("火事の場合は、エレベーターを使わないでください。", "かじのばあいは、エレベーターをつかわないでください。", "Em caso de incêndio, não use o elevador."),
("遅れる場合は、電話してください。", "おくれるばあいは、でんわしてください。", "Caso vá se atrasar, ligue, por favor."),
("熱が下がらない場合は、病院へ行ってください。", "ねつがさがらないばあいは、びょういんへいってください。", "Se a febre não baixar, vá ao hospital."),
("カードをなくした場合は、すぐに銀行に連絡してください。", "カードをなくしたばあいは、すぐにぎんこうにれんらくしてください。", "Caso perca o cartão, entre em contato com o banco imediatamente."),
],
R=[
("地震の____、机の下に入ってください。", "Em caso de terremoto, entre embaixo da mesa.", ["場合は", "ばあいは"]),
("会議に出られない____、メールで知らせてください。", "Caso não possa participar da reunião, avise por e-mail.", ["場合は", "ばあいは"]),
("質問がある____、手を挙げてください。", "Caso tenha alguma pergunta, levante a mão.", ["場合は", "ばあいは"]),
("道に迷った____、この番号に電話してください。", "Caso se perca, ligue para este número.", ["場合は", "ばあいは"]),
("子供の____、料金は半額です。", "No caso de crianças, o preço é a metade.", ["場合は", "ばあいは"]),
],
),
dict(
n=7,
jp="〜ばかり",
rd="bakari",
tr="Só / Nada além de / Sempre",
ex="""ばかり é usado para dizer que algo se repete tanto que parece ser "só aquilo". Equivale a "só", "nada além de" ou "sempre".

Diferente de だけ, que apenas limita de forma neutra, ばかり costuma ter um tom de crítica, reclamação ou surpresa. A ideia é que a quantidade ou a repetição é excessiva.

Ele vem depois do substantivo e pode substituir を e が. Com verbos, aparece na forma てばかりいる, que significa "não faz outra coisa a não ser...".

Também pode descrever um lugar ou grupo formado quase só por um tipo de coisa ou pessoa.""",
st="""Substantivo + ばかり + Verbo
Substantivo + ばかり + だ / です
Substantivo + ばかり + の + Substantivo
Verbo na forma て + ばかりいる

Forma falada: ばっかり""",
no="""ばかり também tem outros sentidos: depois de verbo na forma た, significa "acabou de" (たばかり); depois de números, significa "cerca de". São usos diferentes.

Na fala, ばっかり reforça o tom de reclamação.

Se a intenção é apenas dizer "só isso", sem crítica, だけ é a escolha mais neutra.""",
bf="ばかり",
rx="ばかり|ばっかり",
tk=["ばかり"],
va=["ばかり", "ばっかり"],
E=[
("弟はゲームばかりしています。", "おとうとはゲームばかりしています。", "Meu irmão mais novo só fica jogando videogame."),
("最近、雨ばかりですね。", "さいきん、あめばかりですね。", "Ultimamente só chove, né?"),
("彼は甘い物ばかり食べる。", "かれはあまいものばかりたべる。", "Ele só come doce."),
("文句ばかり言わないで、手伝ってよ。", "もんくばかりいわないで、てつだってよ。", "Pare de só reclamar e me ajude."),
("このクラスは女の子ばかりだ。", "このクラスはおんなのこばかりだ。", "Esta turma é só de meninas."),
],
R=[
("息子は漫画____読んでいます。", "Meu filho só lê mangá.", ["ばかり", "ばっかり"]),
("今週は失敗____で、疲れました。", "Esta semana foi só erro, estou cansado.", ["ばかり", "ばっかり"]),
("彼女は肉____食べて、野菜を食べません。", "Ela só come carne e não come verdura.", ["ばかり", "ばっかり"]),
("毎日同じ料理____で、飽きてしまった。", "Todo dia é só a mesma comida, já enjoei.", ["ばかり", "ばっかり"]),
("あの店は高い物____売っている。", "Aquela loja só vende coisa cara.", ["ばかり", "ばっかり"]),
],
),
dict(
n=8,
jp="〜だけで",
rd="dake de",
tr="Só de / Apenas com / Só por",
ex="""だけで é usado para dizer que basta uma coisa simples para que um resultado aconteça. Equivale a "só de", "apenas com" ou "só por".

だけ indica o limite ("só isso"), e で indica o meio ou a condição. Juntos, eles mostram que aquele pouco já é suficiente.

É muito usado para sentimentos e reações: só de pensar em algo, a pessoa já fica com medo; só de ouvir uma música, já fica feliz.

Também aparece para indicar que uma ação simples é suficiente para conseguir algo, como apertar um botão ou mostrar um documento.""",
st="""Verbo na forma de dicionário + だけで
Verbo na forma た / ている + だけで
Substantivo + だけで""",
no="""Muitas vezes, だけで aparece com verbos como 考える, 想像する, 聞く e 見る, para mostrar uma reação forte a algo pequeno.

Com いい, a forma だけでいい significa "basta só...", "é só...".

Na forma negativa, だけでは〜ない indica que aquilo sozinho não é suficiente.""",
bf="だけで",
rx="だけで",
tk=["だけ", "で"],
va=["だけで", "だけでは"],
E=[
("この歌を聞くだけで、楽しくなります。", "このうたをきくだけで、たのしくなります。", "Só de ouvir esta música, já fico feliz."),
("考えるだけで、怖いです。", "かんがえるだけで、こわいです。", "Só de pensar, já fico com medo."),
("このアプリは、ボタンを押すだけで使えます。", "このアプリは、ボタンをおすだけでつかえます。", "Este aplicativo funciona apenas apertando um botão."),
("一人だけで、この仕事をするのは無理です。", "ひとりだけで、このしごとをするのはむりです。", "É impossível fazer este trabalho sozinho."),
("見ているだけで、お腹がすいてきた。", "みているだけで、おなかがすいてきた。", "Só de olhar, já fiquei com fome."),
],
R=[
("ここに名前を書く____いいです。", "Basta escrever o nome aqui.", ["だけで"]),
("彼の声を聞く____、元気になります。", "Só de ouvir a voz dele, já fico animado.", ["だけで"]),
("旅行のことを想像する____、わくわくします。", "Só de imaginar a viagem, já fico empolgado.", ["だけで"]),
("説明を読んだ____はわかりませんでした。", "Só lendo a explicação, não consegui entender.", ["だけで"]),
("この券を見せる____、無料で入れます。", "Basta mostrar este ingresso para entrar de graça.", ["だけで"]),
],
),
dict(
n=9,
jp="〜出す",
rd="dasu",
tr="Começar a (de repente) / Pôr-se a",
ex="""出す, ligado a outro verbo, indica que uma ação começou de repente, muitas vezes de forma inesperada. Equivale a "começar a" ou "pôr-se a".

A estrutura junta o verbo na forma ます sem ます com 出す. O resultado funciona como um novo verbo do grupo 1 e se conjuga normalmente: 出します, 出した, 出して.

É muito usado com ações que surgem de forma súbita ou fora do controle, como chover, chorar, rir, correr ou começar a se mover.

A diferença para 始める é o tom: 始める indica um começo planejado ou neutro, enquanto 出す destaca que o início foi repentino e muitas vezes inesperado.""",
st="""Verbo na forma ます sem ます + 出す

Educado: 出します
Passado: 出した / 出しました

Escrita: 出す / だす""",
no="""Por indicar algo súbito, 出す aparece muito com 急に e 突然 (de repente).

Em geral, 出す não é usado para uma ação que você decide começar com calma, como começar a estudar seguindo um plano. Nesse caso, 始める é mais natural.

Sozinho, 出す significa "tirar", "enviar" ou "entregar". O sentido de "começar a" aparece apenas quando ele vem depois de outro verbo.""",
bf="出す",
rx="出す|出し|だす|だした|だして",
tk=["出す"],
va=["出す", "出します", "出した", "出しました"],
E=[
("急に雨が降り出しました。", "きゅうにあめがふりだしました。", "De repente, começou a chover."),
("赤ちゃんが泣き出した。", "あかちゃんがなきだした。", "O bebê começou a chorar."),
("話を聞いて、みんなが笑い出しました。", "はなしをきいて、みんながわらいだしました。", "Ao ouvir a história, todos começaram a rir."),
("彼は突然走り出した。", "かれはとつぜんはしりだした。", "Ele começou a correr de repente."),
("犬が急に吠え出したので、びっくりしました。", "いぬがきゅうにほえだしたので、びっくりしました。", "O cachorro começou a latir de repente e eu me assustei."),
],
R=[
("映画を見て、妹が泣き____。", "Vendo o filme, minha irmã mais nova começou a chorar.", ["出した", "出しました", "だした"]),
("信号が青になって、車が動き____。", "O sinal ficou verde e os carros começaram a andar.", ["出した", "出しました", "だした"]),
("夜になって、急に風が吹き____。", "À noite, o vento começou a soprar de repente.", ["出した", "出しました", "だした"]),
("先生の冗談に、学生たちが笑い____。", "Com a piada do professor, os alunos começaram a rir.", ["出した", "出しました", "だした"]),
("母の顔を見て、子供は急に泣き____。", "Ao ver o rosto da mãe, a criança começou a chorar de repente.", ["出した", "出しました", "だした"]),
],
),
dict(
n=10,
jp="〜でございます",
rd="de gozaimasu",
tr="É (muito formal) / Trata-se de",
ex="""でございます é a forma extremamente educada de です. Ela tem o mesmo significado, "é", mas mostra muito respeito pelo ouvinte.

É usada principalmente por funcionários de lojas, hotéis, restaurantes, empresas e serviços de atendimento ao cliente. Também aparece em anúncios, ligações de trabalho e situações muito formais.

Ela faz parte do 丁寧語, a linguagem polida que deixa a frase mais elegante sem elevar nem rebaixar ninguém em especial. Quem fala está sendo gentil com quem ouve.

No dia a dia, entre colegas ou amigos, でございます soaria exagerado. O normal é usar です.""",
st="""Substantivo + でございます
Adjetivo な (sem な) + でございます

Passado: でございました
Pergunta: でございますか""",
no="""Ao atender o telefone no trabalho, é comum dizer o nome da empresa ou o próprio sobrenome seguido de でございます.

ございます sozinho é a forma polida de あります. Com で, ele substitui です.

Com adjetivos い, não se usa でございます. Existe uma forma especial e rara, mas, no uso comum, basta usar です.""",
bf="でございます",
rx="でございます|でございました",
tk=["で", "ございます"],
va=["でございます", "でございました", "でございますか"],
E=[
("こちらが会議室でございます。", "こちらがかいぎしつでございます。", "Esta é a sala de reuniões."),
("お手洗いは二階でございます。", "おてあらいはにかいでございます。", "O banheiro fica no segundo andar."),
("本日は休業日でございます。", "ほんじつはきゅうぎょうびでございます。", "Hoje é dia de folga do estabelecimento."),
("はい、山田でございます。", "はい、やまだでございます。", "Alô, aqui é o Yamada."),
("お会計は三千円でございます。", "おかいけいはさんぜんえんでございます。", "O total da conta é três mil ienes."),
],
R=[
("受付は一階____。", "A recepção fica no primeiro andar.", ["でございます"]),
("こちらが新しい商品____。", "Este é o novo produto.", ["でございます"]),
("「はい、さくら銀行____。」", "\"Alô, aqui é o Banco Sakura.\"", ["でございます"]),
("エレベーターはあちら____。", "O elevador fica para lá.", ["でございます"]),
("申し訳ございません、その商品は売り切れ____。", "Pedimos desculpas, esse produto está esgotado.", ["でございます"]),
],
),
]
