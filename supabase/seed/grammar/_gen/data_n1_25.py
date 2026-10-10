G = [
dict(
n=241,
jp="やれ〜やれ",
rd="yare ~ yare",
tr="Ora é... ora é / Uma hora é... outra hora é / É isso e aquilo",
ex="""やれ〜やれ serve para listar várias coisas que alguém fala ou exige repetidamente, geralmente com tom de reclamação. Equivale a "ora é..., ora é..." ou "é isso e aquilo".

A pessoa mostra irritação com tantas exigências ou acontecimentos. Por exemplo, "ora é reunião, ora é relatório, nunca tenho tempo".

É uma expressão coloquial.""",
st="""やれ + Substantivo / Frase + だ、やれ + Substantivo / Frase + だ""",
no="""Costuma ser seguido de と ou で, como やれ〜だ、やれ〜だと.

É parecido com 〜とか〜とか e 〜だの〜だの.""",
bf="やれ〜やれ",
rx="やれ",
tk=["やれ"],
va=["やれ〜やれ"],
E=[
("やれ会議だ、やれ報告書だと、休む暇がない。", "やれかいぎだ、やれほうこくしょだと、やすむひまがない。", "Ora é reunião, ora é relatório, não tenho tempo para descansar."),
("母はやれ勉強しろ、やれ早く寝ろとうるさい。", "はははやれべんきょうしろ、やれはやくねろとうるさい。", "Minha mãe vive enchendo: ora é para estudar, ora é para dormir cedo."),
("やれ結婚式だ、やれ引っ越しだと、お金がかかる。", "やれけっこんしきだ、やれひっこしだと、おかねがかかる。", "Uma hora é casamento, outra hora é mudança, só se gasta dinheiro."),
("子供はやれお腹がすいた、やれ眠いと文句ばかり言う。", "こどもはやれおなかがすいた、やれねむいともんくばかりいう。", "A criança só reclama: ora está com fome, ora está com sono."),
("やれ寒いだ、やれ暑いだと、彼はいつも不満を言っている。", "やれさむいだ、やれあついだと、かれはいつもふまんをいっている。", "Ora está frio, ora está calor, ele vive reclamando."),
],
R=[
("____テストだ、やれ宿題だと、学生は忙しい。", "Ora é prova, ora é lição de casa, os alunos vivem ocupados.", ["やれ"]),
("上司はやれ遅い、____雑だと文句を言う。", "O chefe reclama que é lento, que é desleixado.", ["やれ"]),
("____病院だ、やれ買い物だと、毎日出かけている。", "Ora é hospital, ora é compras, saio todos os dias.", ["やれ"]),
("妻はやれ掃除しろ、____片付けろと言う。", "Minha esposa manda limpar e arrumar, uma coisa atrás da outra.", ["やれ"]),
("____新年会だ、やれ歓迎会だと、飲み会が多い。", "Ora é festa de Ano-Novo, ora é festa de boas-vindas, há muitas confraternizações.", ["やれ"]),
],
),
dict(
n=242,
jp="〜ようが / 〜ようと",
rd="you ga / you to",
tr="Mesmo que / Não importa se / Por mais que",
ex="""ようが e ようと indicam que, mesmo que algo aconteça, a decisão ou o resultado não muda. Equivalem a "mesmo que" ou "não importa se".

Vêm depois da forma volitiva do verbo e costumam aparecer junto com palavras interrogativas, como 何, 誰 e どんなに. Por exemplo, "digam o que disserem, não vou mudar de ideia".

É uma expressão enfática e um pouco formal.""",
st="""Verbo (forma volitiva) + が / と
Adjetivo い (sem い) + かろうが / かろうと
Substantivo / Adjetivo な + だろうが / であろうと""",
no="""É parecido com ても, mas ようが é mais forte e enfático.

A segunda parte costuma mostrar uma decisão firme ou indiferença.""",
bf="ようが",
rx="ようが|ようと|うが|うと",
tk=["よう", "が"],
va=["ようが", "ようと", "うが", "うと"],
E=[
("誰が何と言おうが、私の気持ちは変わらない。", "だれがなんといおうが、わたしのきもちはかわらない。", "Digam o que disserem, meu sentimento não vai mudar."),
("雨が降ろうと、試合は行われる。", "あめがふろうと、しあいはおこなわれる。", "Mesmo que chova, a partida será realizada."),
("どんなに反対されようが、彼と結婚する。", "どんなにはんたいされようが、かれとけっこんする。", "Por mais que sejam contra, vou me casar com ele."),
("何を食べようと、太らない体質だ。", "なにをたべようと、ふとらないたいしつだ。", "Não importa o que eu coma, sou do tipo que não engorda."),
("どこに住もうが、私の自由だ。", "どこにすもうが、わたしのじゆうだ。", "Onde quer que eu more, é escolha minha."),
],
R=[
("いくら頼まれ____、その仕事は引き受けない。", "Por mais que me peçam, não vou aceitar esse trabalho.", ["ようが", "ようと"]),
("他人が何をし____、気にしない。", "Não importa o que os outros façam, não ligo.", ["ようが", "ようと"]),
("どんなに疲れてい____、毎日運動している。", "Por mais cansado que esteja, me exercito todos os dias.", ["ようが", "ようと"]),
("誰が来____、ドアを開けてはいけない。", "Não importa quem venha, não se deve abrir a porta.", ["ようが", "ようと"]),
("失敗し____、もう一度挑戦する。", "Mesmo que eu falhe, vou tentar de novo.", ["ようが", "ようと"]),
],
),
dict(
n=243,
jp="〜ようが〜まいが / 〜ようと〜まいと",
rd="you ga ~ mai ga / you to ~ mai to",
tr="Quer... quer não / Fazendo ou não / Seja ou não",
ex="""ようが〜まいが e ようと〜まいと apresentam uma ação e sua negação, mostrando que, em qualquer caso, o resultado é o mesmo. Equivalem a "quer..., quer não" ou "fazendo ou não".

Por exemplo, "quer você vá, quer não, para mim tanto faz" ou "chovendo ou não, a partida acontece".

Também aparece com dois verbos diferentes, como ようが〜ようが.""",
st="""Verbo (forma volitiva) + が + Mesmo verbo + まいが
Verbo (forma volitiva) + と + Mesmo verbo + まいと
Verbo A (forma volitiva) + が + Verbo B (forma volitiva) + が""",
no="""まい é uma forma antiga de negação de intenção.

É parecido com 〜ても〜なくても.""",
bf="ようが〜まいが",
rx="まいが|まいと|ようが",
tk=["よう", "が", "まい", "が"],
va=["ようが〜まいが", "ようと〜まいと", "ようが〜ようが"],
E=[
("君が行こうが行くまいが、私には関係ない。", "きみがいこうがいくまいが、わたしにはかんけいない。", "Quer você vá, quer não, não tem nada a ver comigo."),
("雨が降ろうと降るまいと、イベントは行います。", "あめがふろうとふるまいと、イベントはおこないます。", "Chovendo ou não, o evento será realizado."),
("彼が来ようが来まいが、会議は始める。", "かれがこようがこまいが、かいぎははじめる。", "Quer ele venha, quer não, a reunião vai começar."),
("食べようが食べまいが、あなたの自由だ。", "たべようがたべまいが、あなたのじゆうだ。", "Comer ou não comer é escolha sua."),
("笑われようが怒られようが、自分の道を行く。", "わらわれようがおこられようが、じぶんのみちをいく。", "Rindo de mim ou brigando comigo, vou seguir meu caminho."),
],
R=[
("信じようが信じ____、これは本当の話だ。", "Acreditando ou não, esta é uma história verdadeira.", ["まいが"]),
("参加しようとし____と、連絡はしてください。", "Participando ou não, entre em contato.", ["まい"]),
("勝とうが負け____、全力を尽くそう。", "Ganhando ou perdendo, vamos dar o nosso melhor.", ["ようが"]),
("彼が謝ろうが謝る____、もう許さない。", "Ele pedindo desculpas ou não, não vou mais perdoar.", ["まいが"]),
("賛成されようが反対され____、計画を進める。", "Com apoio ou com oposição, vou seguir com o plano.", ["ようが"]),
],
),
dict(
n=244,
jp="〜ようものなら",
rd="you mono nara",
tr="Se por acaso / Se ousar / Se acontecer de",
ex="""ようものなら indica que, se algo acontecer, mesmo que seja pequeno, o resultado será muito ruim. Equivale a "se por acaso" ou "se ousar".

O tom é de exagero e advertência. Por exemplo, "se você ousar se atrasar, o chefe vai ficar furioso".

É uma expressão um pouco formal, mas também aparece na fala.""",
st="""Verbo (forma volitiva) + ものなら + Resultado muito ruim""",
no="""A forma ようもんなら é mais coloquial.

É diferente de ものなら com a forma potencial, que expressa um desejo difícil de realizar.""",
bf="ようものなら",
rx="ようものなら|うものなら|ようもんなら|うもんなら",
tk=["よう", "もの", "なら"],
va=["ようものなら", "うものなら", "ようもんなら"],
E=[
("遅刻でもしようものなら、部長に怒鳴られる。", "ちこくでもしようものなら、ぶちょうにどなられる。", "Se por acaso eu me atrasar, o gerente vai gritar comigo."),
("母に嘘をつこうものなら、大変なことになる。", "ははにうそをつこうものなら、たいへんなことになる。", "Se eu ousar mentir para minha mãe, vai ser um problemão."),
("この店で大声を出そうものなら、すぐに追い出される。", "このみせでおおごえをだそうものなら、すぐにおいだされる。", "Se você ousar falar alto nesta loja, vai ser expulso na hora."),
("一言でも文句を言おうものなら、彼はすぐに怒る。", "ひとことでももんくをいおうものなら、かれはすぐにおこる。", "Se acontecer de você reclamar uma palavra, ele fica bravo na hora."),
("試験に落ちようものなら、親に何を言われるかわからない。", "しけんにおちようものなら、おやになにをいわれるかわからない。", "Se por acaso eu reprovar, nem sei o que meus pais vão dizer."),
],
R=[
("彼女の誕生日を忘れ____、口をきいてもらえなくなる。", "Se por acaso eu esquecer o aniversário dela, ela para de falar comigo.", ["ようものなら", "ようもんなら"]),
("この秘密を誰かに話そ____、大問題になる。", "Se você ousar contar este segredo a alguém, vai ser um grande problema.", ["うものなら", "うもんなら"]),
("少しでも失敗し____、すぐにクビになる。", "Se por acaso eu errar um pouco, sou demitido na hora.", ["ようものなら", "ようもんなら"]),
("父の車に傷をつけ____、ひどく叱られる。", "Se acontecer de eu arranhar o carro do meu pai, vou levar uma bronca enorme.", ["ようものなら", "ようもんなら"]),
("あの先生の授業で寝____、廊下に立たされる。", "Se você ousar dormir na aula daquele professor, vai ficar de castigo no corredor.", ["ようものなら", "ようもんなら"]),
],
),
dict(
n=245,
jp="〜ずにはおかない / 〜ないではおかない",
rd="zu niwa okanai / nai dewa okanai",
tr="Não deixar de / Com certeza vai / Inevitavelmente",
ex="""ずにはおかない e ないではおかない têm dois usos principais.

O primeiro indica que algo inevitavelmente causa uma reação ou sentimento nas pessoas. Equivale a "não deixar de" ou "inevitavelmente". Por exemplo, "este filme não deixa de emocionar quem assiste".

O segundo expressa uma determinação forte de fazer algo. Equivale a "com certeza vou". Por exemplo, "vou descobrir a verdade, custe o que custar".

É uma expressão formal e enfática.""",
st="""Verbo (forma ない sem ない) + ずにはおかない
Verbo (forma ない) + ではおかない
する → せずにはおかない""",
no="""Atenção à forma de する, que vira せずにはおかない.

No primeiro uso, o sujeito costuma ser algo que provoca uma reação, como uma obra ou um acontecimento.""",
bf="ずにはおかない",
rx="ずにはおかない|ないではおかない|ずにはおかなかった|ずにはおきません",
tk=["ず", "に", "は", "おかない"],
va=["ずにはおかない", "ないではおかない", "せずにはおかない"],
E=[
("この映画は、見る人を感動させずにはおかない。", "このえいがは、みるひとをかんどうさせずにはおかない。", "Este filme não deixa de emocionar quem assiste."),
("彼の言葉は、聞く人の心を動かさずにはおかない。", "かれのことばは、きくひとのこころをうごかさずにはおかない。", "As palavras dele inevitavelmente tocam o coração de quem ouve."),
("真実を明らかにせずにはおかない。", "しんじつをあきらかにせずにはおかない。", "Vou revelar a verdade, custe o que custar."),
("彼の態度は、周りの人を怒らせないではおかない。", "かれのたいどは、まわりのひとをおこらせないではおかない。", "A atitude dele não deixa de irritar as pessoas em volta."),
("今度こそ、犯人を捕まえずにはおかない。", "こんどこそ、はんにんをつかまえずにはおかない。", "Desta vez, vou pegar o culpado com certeza."),
],
R=[
("この写真は、見る人を驚かせ____。", "Esta foto não deixa de surpreender quem vê.", ["ずにはおかない", "ないではおかない"]),
("彼女の歌声は、聴く人を魅了せ____。", "A voz dela inevitavelmente encanta quem ouve.", ["ずにはおかない"]),
("こんな失礼なことをされたら、謝らせ____。", "Depois de uma grosseria dessas, vou fazer ele pedir desculpas, com certeza.", ["ずにはおかない", "ないではおかない"]),
("この事件は、社会に大きな影響を与え____だろう。", "Este caso inevitavelmente vai ter grande impacto na sociedade.", ["ずにはおかない", "ないではおかない"]),
("その小説は、読む人を考えさせ____。", "Esse romance não deixa de fazer o leitor refletir.", ["ずにはおかない", "ないではおかない"]),
],
),
dict(
n=246,
jp="〜ともなると / 〜ともなれば",
rd="tomo naru to / tomo nareba",
tr="Quando chega a / Ao se tornar / Em se tratando de",
ex="""ともなると e ともなれば indicam que, quando algo chega a um nível, idade ou posição especial, a situação naturalmente muda. Equivalem a "quando chega a" ou "em se tratando de".

Por exemplo, "quando se chega aos cinquenta anos, o corpo começa a ficar cansado" ou "em se tratando de um presidente, a responsabilidade é enorme".

É uma expressão formal.""",
st="""Substantivo (idade / posição / época) + ともなると / ともなれば
Verbo (forma dicionário) + ともなると / ともなれば""",
no="""É parecido com となると, mas ともなると destaca mais que o nível é alto ou especial.

A segunda parte mostra uma situação natural ou esperada para aquele nível.""",
bf="ともなると",
rx="ともなると|ともなれば|ともなったら",
tk=["とも", "なる", "と"],
va=["ともなると", "ともなれば"],
E=[
("五十歳ともなると、体力が落ちてくる。", "ごじゅっさいともなると、たいりょくがおちてくる。", "Quando se chega aos cinquenta anos, a resistência física começa a cair."),
("社長ともなれば、責任は重い。", "しゃちょうともなれば、せきにんはおもい。", "Em se tratando de um presidente, a responsabilidade é grande."),
("年末ともなると、どこも忙しい。", "ねんまつともなると、どこもいそがしい。", "Quando chega o fim do ano, todo lugar fica atarefado."),
("大学生ともなれば、自分のことは自分でするべきだ。", "だいがくせいともなれば、じぶんのことはじぶんでするべきだ。", "Ao se tornar universitário, deve-se cuidar das próprias coisas."),
("週末ともなると、この公園は家族連れでいっぱいだ。", "しゅうまつともなると、このこうえんはかぞくづれでいっぱいだ。", "Quando chega o fim de semana, este parque fica cheio de famílias."),
],
R=[
("プロ____、毎日の練習は欠かせない。", "Em se tratando de um profissional, o treino diário é indispensável.", ["ともなると", "ともなれば"]),
("冬____、この辺りは雪で真っ白になる。", "Quando chega o inverno, esta região fica toda branca de neve.", ["ともなると", "ともなれば"]),
("親____、子供の将来を考えるものだ。", "Ao se tornar pai, a pessoa passa a pensar no futuro dos filhos.", ["ともなると", "ともなれば"]),
("夏休み____、観光地は人であふれる。", "Quando chegam as férias de verão, os pontos turísticos ficam lotados.", ["ともなると", "ともなれば"]),
("七十歳____、無理はできない。", "Quando se chega aos setenta anos, não dá para forçar.", ["ともなると", "ともなれば"]),
],
),
dict(
n=247,
jp="〜ずくめ",
rd="zukume",
tr="Só / Cheio de / Repleto de",
ex="""ずくめ indica que algo está completamente cheio de uma mesma coisa, ou que só há aquilo. Equivale a "só" ou "repleto de".

Pode ser usado com cores, como "todo de preto", ou com situações, como "só coisas boas" ou "repleto de regras".

É uma expressão um pouco literária.""",
st="""Substantivo + ずくめ
Substantivo + ずくめの + Substantivo""",
no="""Expressões comuns são 黒ずくめ, いいことずくめ, 規則ずくめ e ごちそうずくめ.

É parecido com だらけ e ばかり, mas ずくめ pode ser usado com coisas boas.""",
bf="ずくめ",
rx="ずくめ",
tk=["ずくめ"],
va=["ずくめ", "ずくめの"],
E=[
("黒ずくめの男が店に入ってきた。", "くろずくめのおとこがみせにはいってきた。", "Um homem todo de preto entrou na loja."),
("今年はいいことずくめの一年だった。", "ことしはいいことずくめのいちねんだった。", "Este ano foi cheio de coisas boas."),
("この学校は規則ずくめで、自由がない。", "このがっこうはきそくずくめで、じゆうがない。", "Esta escola é repleta de regras, não há liberdade."),
("結婚式は、ごちそうずくめだった。", "けっこんしきは、ごちそうずくめだった。", "O casamento foi repleto de banquetes."),
("最近は失敗ずくめで、落ち込んでいる。", "さいきんはしっぱいずくめで、おちこんでいる。", "Ultimamente só tenho tido fracassos e estou desanimado."),
],
R=[
("彼女はいつも白____の服を着ている。", "Ela sempre usa roupas todas brancas.", ["ずくめ"]),
("今日は朝からいいこと____だ。", "Hoje, desde a manhã, só aconteceram coisas boas.", ["ずくめ"]),
("この会社は規則____で、息が詰まる。", "Esta empresa é cheia de regras, é sufocante.", ["ずくめ"]),
("旅行中は、おいしいもの____だった。", "Durante a viagem, só comi coisas gostosas.", ["ずくめ"]),
("黒____の格好で、何だか怪しい。", "Vestido todo de preto, parece meio suspeito.", ["ずくめ"]),
],
),
dict(
n=248,
jp="〜ずじまい",
rd="zu jimai",
tr="Acabar não / Ficar sem / Nunca chegar a",
ex="""ずじまい indica que a pessoa queria fazer algo, mas no fim acabou não fazendo, e a oportunidade passou. Equivale a "acabar não..." ou "nunca chegar a".

Muitas vezes há arrependimento. Por exemplo, "fui a Kyoto, mas acabei não visitando o templo" ou "nunca cheguei a dizer o que sentia".

A forma ずじまいだ ou ずじまいになる é a mais comum.""",
st="""Verbo (forma ない sem ない) + ずじまい
する → せずじまい""",
no="""Atenção à forma de する, que vira せずじまい.

É parecido com ないままだった, mas ずじまい destaca o arrependimento.""",
bf="ずじまい",
rx="ずじまい",
tk=["ず", "じまい"],
va=["ずじまい", "ずじまいだ", "ずじまいになる"],
E=[
("京都に行ったのに、金閣寺は見ずじまいだった。", "きょうとにいったのに、きんかくじはみずじまいだった。", "Fui a Kyoto, mas acabei não vendo o Kinkaku-ji."),
("彼女に気持ちを伝えずじまいだった。", "かのじょにきもちをつたえずじまいだった。", "Nunca cheguei a dizer a ela o que sentia."),
("買った本を、結局読まずじまいになった。", "かったほんを、けっきょくよまずじまいになった。", "Acabei nunca lendo o livro que comprei."),
("忙しくて、彼に会わずじまいで帰国した。", "いそがしくて、かれにあわずじまいできこくした。", "Estava tão ocupado que voltei para o meu país sem chegar a encontrá-lo."),
("名前を聞かずじまいで、別れてしまった。", "なまえをきかずじまいで、わかれてしまった。", "Nos despedimos sem que eu chegasse a perguntar o nome."),
],
R=[
("せっかく買った服を、一度も着____だった。", "Acabei nunca usando a roupa que comprei.", ["ずじまい"]),
("祖父に本当のことを言わ____だった。", "Nunca cheguei a contar a verdade ao meu avô.", ["ずじまい"]),
("旅行中、雨で富士山は見え____だった。", "Durante a viagem, por causa da chuva, acabei não vendo o monte Fuji.", ["ずじまい"]),
("質問しようと思ったが、結局せ____だった。", "Pensei em fazer uma pergunta, mas acabei não fazendo.", ["ずじまい"]),
("お礼を言わ____で、引っ越してしまった。", "Me mudei sem chegar a agradecer.", ["ずじまい"]),
],
),
dict(
n=249,
jp="〜ようにも〜ない",
rd="you nimo ~ nai",
tr="Mesmo querendo não dá / Por mais que queira não consegue / Não há como",
ex="""ようにも〜ない indica que a pessoa quer fazer algo, mas não consegue por algum motivo. Equivale a "mesmo querendo, não dá" ou "por mais que queira, não consegue".

A estrutura repete o mesmo verbo, primeiro na forma volitiva e depois na forma potencial negativa. Por exemplo, "mesmo querendo sair, não consigo por causa da chuva".

É uma expressão de impotência diante da situação.""",
st="""Verbo (forma volitiva) + にも + Mesmo verbo (forma potencial negativa)""",
no="""A segunda parte costuma ser できない ou a forma potencial negativa do verbo.

Muitas vezes há um motivo explicado antes, como falta de dinheiro, tempo ou informação.""",
bf="ようにも〜ない",
rx="ようにも|うにも",
tk=["よう", "に", "も", "ない"],
va=["ようにも〜ない", "うにも〜ない"],
E=[
("連絡先がわからないので、連絡しようにもできない。", "れんらくさきがわからないので、れんらくしようにもできない。", "Como não sei o contato, mesmo querendo entrar em contato, não dá."),
("お金がないので、買おうにも買えない。", "おかねがないので、かおうにもかえない。", "Como não tenho dinheiro, mesmo querendo comprar, não consigo."),
("足をけがして、歩こうにも歩けない。", "あしをけがして、あるこうにもあるけない。", "Machuquei o pé e, por mais que queira andar, não consigo."),
("雨がひどくて、出かけようにも出かけられない。", "あめがひどくて、でかけようにもでかけられない。", "A chuva está tão forte que, mesmo querendo sair, não dá."),
("頭が痛くて、寝ようにも寝られない。", "あたまがいたくて、ねようにもねられない。", "Estou com tanta dor de cabeça que, mesmo querendo dormir, não consigo."),
],
R=[
("忙しくて、休もう____休めない。", "Estou tão ocupado que, mesmo querendo descansar, não consigo.", ["にも"]),
("声が出なくて、話そう____話せない。", "Estou sem voz e, por mais que queira falar, não consigo.", ["にも"]),
("材料がなくて、作ろう____作れない。", "Sem ingredientes, mesmo querendo cozinhar, não dá.", ["にも"]),
("電話番号を忘れて、かけよう____かけられない。", "Esqueci o número e, mesmo querendo ligar, não consigo.", ["にも"]),
("道が混んでいて、急ごう____急げない。", "A estrada está tão cheia que, por mais que queira me apressar, não dá.", ["にも"]),
],
),
dict(
n=250,
jp="〜ゆえに / 〜がゆえに",
rd="yue ni / ga yue ni",
tr="Por causa de / Por ser / Justamente porque",
ex="""ゆえに e がゆえに indicam a causa ou o motivo de algo, de forma muito formal. Equivalem a "por causa de" ou "por ser".

São usados principalmente na escrita, em textos acadêmicos, discursos e textos literários. Por exemplo, "justamente por ser jovem, ele comete erros".

A forma ゆえの vem antes de substantivos.""",
st="""Verbo / Adjetivo (forma simples) + (が)ゆえに
Substantivo + (である) + がゆえに
Substantivo + ゆえの + Substantivo""",
no="""É uma forma antiga e formal de から e ので.

No começo da frase, ゆえに significa "portanto", como em lógica e matemática.""",
bf="ゆえに",
rx="ゆえに|ゆえの|ゆえ|故に",
tk=["ゆえ", "に"],
va=["ゆえに", "がゆえに", "ゆえの"],
E=[
("若いがゆえに、失敗することもある。", "わかいがゆえに、しっぱいすることもある。", "Justamente por ser jovem, às vezes se erra."),
("彼は正直であるがゆえに、損をすることが多い。", "かれはしょうじきであるがゆえに、そんをすることがおおい。", "Por ser honesto, ele muitas vezes sai perdendo."),
("貧しさゆえに、学校に行けない子供がいる。", "まずしさゆえに、がっこうにいけないこどもがいる。", "Há crianças que não podem ir à escola por causa da pobreza."),
("それは若さゆえの過ちだった。", "それはわかさゆえのあやまちだった。", "Aquilo foi um erro por causa da juventude."),
("愛するがゆえに、彼女は彼と別れた。", "あいするがゆえに、かのじょはかれとわかれた。", "Justamente por amá-lo, ela terminou com ele."),
],
R=[
("経験が少ない____、判断を誤った。", "Por ter pouca experiência, errou no julgamento.", ["がゆえに", "ゆえに"]),
("有名である____、彼には自由がない。", "Justamente por ser famoso, ele não tem liberdade.", ["がゆえに", "ゆえに"]),
("病気____、仕事を辞めざるを得なかった。", "Por causa da doença, ele foi obrigado a deixar o trabalho.", ["ゆえに"]),
("それは親の愛情____の厳しさだった。", "Aquela rigidez era por causa do amor dos pais.", ["ゆえ"]),
("便利である____、使いすぎてしまう。", "Justamente por ser prático, acabamos usando demais.", ["がゆえに", "ゆえに"]),
],
),
]
