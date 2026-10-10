G = [
dict(
n=61,
jp="〜向け",
rd="muke",
tr="Para / Destinado a / Voltado para",
ex="""向け é usado para dizer que algo foi feito ou planejado especialmente para um público ou destino específico. Equivale a "para", "destinado a" ou "voltado para".

Ele vem diretamente depois de um substantivo que indica o público ou o destino, como crianças, jovens, estrangeiros, iniciantes ou um país.

Antes de outro substantivo, usa-se 向けの: 子供向けの本 (livro para crianças). Antes de um verbo, usa-se 向けに: 若者向けに作られた (feito para jovens).

A ideia é de intenção: quem criou o produto ou serviço pensou naquele público desde o início.""",
st="""Substantivo (público / destino) + 向け + の + Substantivo
Substantivo + 向け + に + Verbo
Substantivo + 向け + だ / です""",
no="""A diferença entre 向け e 向き é importante. 向け indica para quem algo foi feito, de propósito. 向き indica para quem algo é adequado, mesmo que não tenha sido feito pensando nisso.

Em lojas e propagandas, expressões como 女性向け e 初心者向け são muito comuns.

Com destinos geográficos, 向け também indica exportação: 海外向けの商品 (produtos para o exterior).""",
bf="向け",
rx="向け",
tk=["向け"],
va=["向け", "向けの", "向けに"],
E=[
("これは子供向けの本です。", "これはこどもむけのほんです。", "Este é um livro para crianças."),
("この番組は若者向けに作られた。", "このばんぐみはわかものむけにつくられた。", "Este programa foi feito para os jovens."),
("この町には外国人向けの日本語教室がある。", "このまちにはがいこくじんむけのにほんごきょうしつがある。", "Nesta cidade há aulas de japonês para estrangeiros."),
("初心者向けのパソコン教室に通っている。", "しょしんしゃむけのパソコンきょうしつにかよっている。", "Estou fazendo um curso de computação para iniciantes."),
("この商品はアジア向けに輸出されている。", "このしょうひんはアジアむけにゆしゅつされている。", "Este produto é exportado para a Ásia."),
],
R=[
("これは高齢者____の雑誌です。", "Esta é uma revista voltada para idosos.", ["向け"]),
("女性____に新しい車が発売された。", "Foi lançado um carro novo voltado para mulheres.", ["向け"]),
("留学生____の奨学金に申し込んだ。", "Me inscrevi numa bolsa de estudos para estudantes estrangeiros.", ["向け"]),
("この映画は大人____だ。", "Este filme é para adultos.", ["向け"]),
("この工場では、海外____の商品を作っている。", "Esta fábrica produz itens destinados ao exterior.", ["向け"]),
],
),
dict(
n=62,
jp="〜向き",
rd="muki",
tr="Adequado para / Apropriado para / Virado para",
ex="""向き é usado para dizer que algo é adequado ou combina com certo público, uso ou pessoa. Equivale a "adequado para" ou "apropriado para".

Ele vem diretamente depois de um substantivo. Antes de outro substantivo, usa-se 向きの, e no final da frase, 向きだ.

A diferença em relação a 向け é sutil, mas importante. 向け indica para quem algo foi feito de propósito. 向き indica que algo é adequado para alguém, pelas suas características, mesmo que não tenha sido criado pensando nisso.

Também pode descrever pessoas: dizer que alguém é "talhado para" uma profissão, por causa da personalidade.

Com direções, como 南向き, significa "virado para": um quarto virado para o sul.""",
st="""Substantivo + 向き + の + Substantivo
Substantivo + 向き + だ / です
Substantivo + 向き + ではない (não é adequado para)
Direção + 向き (virado para: 南向き / 東向き)""",
no="""Para dizer que uma pessoa tem aptidão para algo, também se usa o verbo 向いている: この仕事に向いている.

Em anúncios de imóveis, 南向き (virado para o sul) é um ponto muito valorizado no Japão, porque recebe mais sol.

向き também significa "direção" ou "orientação" em geral, como em 風の向き (direção do vento).""",
bf="向き",
rx="向き",
tk=["向き"],
va=["向き", "向きの", "向きだ"],
E=[
("この料理は甘くて、子供向きの味だ。", "このりょうりはあまくて、こどもむきのあじだ。", "Esta comida é doce, com um sabor bom para crianças."),
("この部屋は狭いので、一人暮らし向きだ。", "このへやはせまいので、ひとりぐらしむきだ。", "Este apartamento é pequeno, então é bom para quem mora sozinho."),
("彼は人と話すのが好きだから、営業向きだ。", "かれはひととはなすのがすきだから、えいぎょうむきだ。", "Ele gosta de conversar com as pessoas, então tem perfil para vendas."),
("このコースは難しいので、初心者向きではない。", "このコースはむずかしいので、しょしんしゃむきではない。", "Este curso é difícil, então não é adequado para iniciantes."),
("南向きの部屋は明るい。", "みなみむきのへやはあかるい。", "Quartos virados para o sul são claros."),
],
R=[
("この靴は山登り____ではない。", "Estes sapatos não são adequados para escalar montanhas.", ["向き"]),
("この本は簡単で、初心者____です。", "Este livro é fácil e adequado para iniciantes.", ["向き"]),
("静かで真面目な彼は、研究者____だ。", "Ele, que é quieto e sério, tem perfil de pesquisador.", ["向き"]),
("このアパートは家族____の広さだ。", "Este apartamento tem um tamanho adequado para famílias.", ["向き"]),
("東____の窓から朝日が入る。", "O sol da manhã entra pela janela virada para o leste.", ["向き"]),
],
),
dict(
n=63,
jp="むしろ",
rd="mushiro",
tr="Pelo contrário / Na verdade / Antes / Até",
ex="""むしろ é usado para dizer que, entre duas opções ou interpretações, a segunda é mais verdadeira ou mais adequada. Equivale a "pelo contrário", "na verdade", "antes" ou "até".

Ele aparece quando a realidade é diferente do que se esperava, ou quando se corrige uma ideia. Por exemplo, "ele não ficou bravo. Pelo contrário, ficou feliz" ou "o remédio, em vez de ajudar, até piorou".

Também é usado em comparações, com より, para indicar preferência: "prefiro, na verdade, o inverno ao verão".

Com ではなく ou というより, むしろ corrige uma descrição: "não é algo ruim, é, na verdade, uma boa experiência".""",
st="""A + より + むしろ + B + の方が + …
A + ではなく、 + むしろ + B
A + というより、 + むしろ + B
Frase 1 (com ponto final) + むしろ + Frase 2""",
no="""むしろ é um pouco mais formal que どちらかというと, que também indica preferência suave.

Muitas vezes, むしろ surpreende o ouvinte, porque traz uma ideia oposta à esperada.

Em textos argumentativos, むしろ é usado para apresentar um ponto de vista diferente do senso comum.""",
bf="むしろ",
rx="むしろ",
tk=["むしろ"],
va=["むしろ"],
E=[
("彼は怒っていなかった。むしろ喜んでいた。", "かれはおこっていなかった。むしろよろこんでいた。", "Ele não estava bravo. Pelo contrário, estava feliz."),
("夏より、むしろ冬のほうが好きだ。", "なつより、むしろふゆのほうがすきだ。", "Na verdade, gosto mais do inverno do que do verão."),
("薬を飲んだら、むしろ悪くなった。", "くすりをのんだら、むしろわるくなった。", "Tomei o remédio e, em vez de melhorar, até piorei."),
("失敗は悪いことではなく、むしろいい経験だ。", "しっぱいはわるいことではなく、むしろいいけいけんだ。", "Errar não é algo ruim; pelo contrário, é uma boa experiência."),
("彼は先生というより、むしろ友達のような存在だ。", "かれはせんせいというより、むしろともだちのようなそんざいだ。", "Ele é menos um professor e mais um amigo."),
],
R=[
("大勢でいるより、一人でいるほうが、____楽だ。", "Ficar sozinho é, na verdade, mais confortável do que estar com muita gente.", ["むしろ"]),
("この映画は子供より、____大人に人気がある。", "Este filme é, na verdade, mais popular entre os adultos do que entre as crianças.", ["むしろ"]),
("休んだら、____疲れてしまった。", "Descansei e, pelo contrário, fiquei mais cansado.", ["むしろ"]),
("彼の意見は反対ではなく、____賛成に近い。", "A opinião dele não é contra; na verdade, está mais para a favor.", ["むしろ"]),
("都会より、____田舎に住みたい。", "Na verdade, prefiro morar no interior do que na cidade grande.", ["むしろ"]),
],
),
dict(
n=64,
jp="〜ながらも",
rd="nagara mo",
tr="Apesar de / Embora / Mesmo sendo",
ex="""ながらも é usado para expressar contraste: apesar de uma situação, acontece algo que não se esperaria. Equivale a "apesar de", "embora" ou "mesmo sendo".

Esse uso de ながら é diferente do ながら do N4, que indica duas ações ao mesmo tempo. Aqui, a ideia é de concessão: "mesmo sendo assim, ...".

Ele vem depois do verbo na forma ます sem ます, de adjetivos い, de adjetivos な (sem な) e de substantivos.

Por exemplo, "apesar de pobre, vive feliz" ou "mesmo sabendo que era errado, menti".

A forma com も (ながらも) reforça o contraste. A forma sem も (ながら) também é usada, principalmente em expressões fixas como 残念ながら (infelizmente).""",
st="""Verbo na forma ます sem ます + ながらも
Adjetivo い + ながらも
Adjetivo な (sem な) + ながらも
Substantivo + ながらも

Forma curta: ながら (残念ながら / 狭いながら)""",
no="""Com verbos, ながらも aparece muito com verbos de estado, como 知る, わかる e いる: 知りながらも (mesmo sabendo).

Expressões fixas como 残念ながら (infelizmente) e 恥ずかしながら (com vergonha, confesso que...) vêm desse uso.

ながらも soa um pouco mais formal e literário que のに ou けど.""",
bf="ながらも",
rx="ながらも|ながら",
tk=["ながら", "も"],
va=["ながらも", "ながら"],
E=[
("彼は貧しいながらも、幸せに暮らしている。", "かれはまずしいながらも、しあわせにくらしている。", "Apesar de pobre, ele vive feliz."),
("狭いながらも、楽しい我が家だ。", "せまいながらも、たのしいわがやだ。", "Embora pequena, é a nossa casa querida."),
("悪いと知りながらも、うそをついてしまった。", "わるいとしりながらも、うそをついてしまった。", "Mesmo sabendo que era errado, acabei mentindo."),
("子供ながらも、彼はしっかりしている。", "こどもながらも、かれはしっかりしている。", "Mesmo sendo criança, ele é bem responsável."),
("少しずつながらも、日本語が上達している。", "すこしずつながらも、にほんごがじょうたつしている。", "Embora aos poucos, meu japonês está melhorando."),
],
R=[
("彼女は疲れてい____、笑顔で働いていた。", "Apesar de cansada, ela trabalhava sorrindo.", ["ながらも"]),
("小さい____、きれいな庭がある。", "Embora pequeno, há um jardim bonito.", ["ながらも"]),
("危ないとわかってい____、彼は行ってしまった。", "Mesmo sabendo que era perigoso, ele foi.", ["ながらも"]),
("残念____、今回は参加できません。", "Infelizmente, desta vez não poderei participar.", ["ながら"]),
("狭い____、居心地のいい部屋だ。", "Embora pequeno, é um quarto aconchegante.", ["ながらも"]),
],
),
dict(
n=65,
jp="〜ないことはない",
rd="nai koto wa nai",
tr="Não é que não / Até dá para / Não é impossível",
ex="""ないことはない é uma dupla negação usada para dizer que algo é possível, mas com hesitação ou limitação. Equivale a "não é que não...", "até dá para..." ou "não é impossível".

A ideia é uma afirmação fraca. Em vez de dizer simplesmente "consigo" ou "quero", a pessoa diz "não é que eu não consiga", deixando claro que há alguma dificuldade ou falta de entusiasmo.

Por exemplo, "não é que eu não consiga comer comida apimentada" (consigo, mas não gosto muito) ou "se correr, não é impossível chegar a tempo".

É muito usado com a forma potencial e com verbos de sentimento. Muitas vezes, a frase continua com が ou けど, explicando a limitação.""",
st="""Verbo na forma ない + ことはない
Verbo potencial negativo + ことはない
Adjetivo い sem い + くないことはない
Adjetivo な + じゃないことはない

Variações: ないこともない / なくはない""",
no="""ないこともない soa ainda mais suave e hesitante que ないことはない.

Essa estrutura é útil para responder com honestidade, sem prometer demais.

Não confunda com ことはない (não precisa), que usa o verbo afirmativo.""",
bf="ないことはない",
rx="ないことはない|ないこともない|ないことはありません|なくはない",
tk=["ない", "こと", "は", "ない"],
va=["ないことはない", "ないこともない", "なくはない"],
E=[
("辛い料理は食べられないことはない。", "からいりょうりはたべられないことはない。", "Não é que eu não consiga comer comida apimentada."),
("今から急げば、間に合わないことはない。", "いまからいそげば、まにあわないことはない。", "Se nos apressarmos agora, não é impossível chegar a tempo."),
("行きたくないことはないが、あまり時間がない。", "いきたくないことはないが、あまりじかんがない。", "Não é que eu não queira ir, mas não tenho muito tempo."),
("この問題は難しいけど、できないことはない。", "このもんだいはむずかしいけど、できないことはない。", "Esta questão é difícil, mas não é impossível."),
("お酒は飲まないこともないですが、あまり好きではありません。", "おさけはのまないこともないですが、あまりすきではありません。", "Não é que eu não beba, mas não gosto muito."),
],
R=[
("日本語は話せ____が、上手ではない。", "Não é que eu não fale japonês, mas não falo bem.", ["ないことはない"]),
("今から行けば、間に合わ____。", "Se for agora, até dá para chegar a tempo.", ["ないことはない", "ないこともない"]),
("一人でやれ____けど、手伝ってほしい。", "Não é que eu não consiga fazer sozinho, mas queria ajuda.", ["ないことはない"]),
("彼の気持ちもわから____。", "Não é que eu não entenda os sentimentos dele.", ["ないことはない", "ないこともない"]),
("高いけど、買え____。", "É caro, mas não é impossível de comprar.", ["ないことはない", "ないこともない"]),
],
),
dict(
n=66,
jp="〜ないと",
rd="nai to",
tr="Tenho que / Se não... / Senão",
ex="""ないと tem dois usos principais.

O primeiro é condicional negativo: "se não fizer..., vai acontecer algo". A segunda parte mostra uma consequência, muitas vezes negativa, como um aviso. Por exemplo, "se não se apressar, vai se atrasar".

O segundo uso, muito comum na fala, é terminar a frase com ないと, deixando subentendido いけない. Assim, ないと sozinho significa "tenho que...". Por exemplo, "já tenho que ir embora" ou "tenho que dormir".

Ele é formado pela forma ない do verbo + と. É informal e muito usado entre amigos e família.""",
st="""Verbo na forma ない + と、 + Consequência (se não...)
Verbo na forma ない + と (fim de frase: tenho que...)
Verbo na forma ない + と + いけない (forma completa)

Variação casual: なきゃ""",
no="""ないと sozinho no fim da frase é uma forma natural de lembrar a si mesmo de uma obrigação.

なきゃ e なくちゃ têm o mesmo sentido de "tenho que" e são igualmente casuais.

Em avisos, ないと〜よ dá um tom de alerta amigável.""",
bf="ないと",
rx="ないと|なきゃ",
tk=["ない", "と"],
va=["ないと", "ないといけない", "なきゃ"],
E=[
("早くしないと、遅れるよ。", "はやくしないと、おくれるよ。", "Se não se apressar, vai se atrasar."),
("あ、もう七時だ。帰らないと。", "あ、もうしちじだ。かえらないと。", "Ah, já são sete horas. Tenho que ir embora."),
("ちゃんと勉強しないと、試験に落ちますよ。", "ちゃんとべんきょうしないと、しけんにおちますよ。", "Se não estudar direito, vai ser reprovado."),
("傘を持っていかないと、濡れるよ。", "かさをもっていかないと、ぬれるよ。", "Se não levar o guarda-chuva, vai se molhar."),
("明日は早いから、もう寝ないと。", "あしたははやいから、もうねないと。", "Amanhã acordo cedo, então tenho que ir dormir."),
],
R=[
("急が____、電車に間に合わない。", "Se não me apressar, não chego a tempo para o trem.", ["ないと"]),
("薬を飲ま____、治らないよ。", "Se não tomar o remédio, não vai melhorar.", ["ないと"]),
("もうこんな時間。帰ら____。", "Já está tarde. Tenho que ir embora.", ["ないと", "なきゃ"]),
("ちゃんと食べ____、元気が出ないよ。", "Se não comer direito, não vai ter energia.", ["ないと"]),
("明日は旅行だ。準備をし____。", "Amanhã é a viagem. Tenho que fazer as malas.", ["ないと", "なきゃ"]),
],
),
dict(
n=67,
jp="なかなか（肯定）",
rd="nakanaka (koutei)",
tr="Bastante / Bem / Muito (positivo)",
ex="""Em frases afirmativas, なかなか significa "bastante", "bem" ou "muito". Ele indica que algo é melhor ou maior do que se esperava.

O tom costuma ser de elogio ou de avaliação positiva, às vezes com um pouco de surpresa. Por exemplo, "esta comida é bem gostosa" ou "o japonês dele é bastante bom".

Também pode descrever algo desafiador de forma objetiva, como "o novo trabalho é bem puxado".

Esse uso é diferente de なかなか〜ない (N4), que significa "custa a", "não... de jeito nenhum". A diferença está na frase: afirmativa = "bastante"; negativa = "custa a".

Um detalhe cultural: dizer なかなか a um superior pode soar como se você estivesse avaliando a pessoa de cima. Com superiores, é melhor usar elogios mais respeitosos.""",
st="""なかなか + Adjetivo (afirmativo)
なかなか + Substantivo / Adjetivo な + だ
なかなかの + Substantivo (algo notável)
なかなか + Verbo (やる / できる)""",
no="""A expressão なかなかやるね significa "você manda bem, hein" e é um elogio informal.

なかなかの + substantivo, como なかなかの腕前, significa "uma habilidade considerável".

Comparado a とても, なかなか soa um pouco mais reservado, como "melhor do que eu esperava".""",
bf="なかなか",
rx="なかなか",
tk=["なかなか"],
va=["なかなか", "なかなかの"],
E=[
("この料理はなかなかおいしいですね。", "このりょうりはなかなかおいしいですね。", "Esta comida é bem gostosa, hein."),
("彼の日本語はなかなか上手だ。", "かれのにほんごはなかなかじょうずだ。", "O japonês dele é bastante bom."),
("昨日の映画はなかなかおもしろかった。", "きのうのえいがはなかなかおもしろかった。", "O filme de ontem foi bem interessante."),
("新しい仕事はなかなか大変です。", "あたらしいしごとはなかなかたいへんです。", "O novo trabalho é bem puxado."),
("一人で全部作ったの？君もなかなかやるね。", "ひとりでぜんぶつくったの？きみもなかなかやるね。", "Você fez tudo sozinho? Você manda bem, hein."),
],
R=[
("この本は____おもしろい。", "Este livro é bem interessante.", ["なかなか"]),
("初めてにしては、____上手ですね。", "Para a primeira vez, está bem bom, hein.", ["なかなか"]),
("この問題は____難しいですね。", "Esta questão é bem difícil, né?", ["なかなか"]),
("会議で、彼女は____いいアイデアを出した。", "Na reunião, ela deu uma ideia bem boa.", ["なかなか"]),
("あの店のラーメンは____のものだ。", "O ramen daquela loja é algo notável.", ["なかなか"]),
],
),
dict(
n=68,
jp="〜なんか・〜なんて",
rd="nanka / nante",
tr="Coisas como / Tipo / Uma coisa dessas",
ex="""なんか e なんて são partículas casuais com vários usos, muitas vezes ligados a emoção.

• Exemplo leve (なんか): como など, dá uma sugestão sem insistir, como "que tal um chá ou algo assim?".
• Desvalorização ou modéstia (なんか / なんて): mostra que quem fala considera aquilo pouco importante, ou se diminui por modéstia, como "eu ainda sou muito fraco" ou "lição, não quero fazer".
• Surpresa ou indignação (なんて): depois de uma frase, mostra espanto ou crítica, como "ele mentir? que horror!" ou "não imaginava que ele viria".

なんか costuma vir depois de substantivos. なんて pode vir depois de substantivos e também de frases inteiras, principalmente no uso de surpresa.

Ambos são informais. Em situações formais, usa-se など.""",
st="""Substantivo + なんか / なんて (desvalorização / exemplo)
Substantivo + なんか + どうですか (sugestão leve)
Frase (forma simples) + なんて + Reação (surpresa / crítica)
Pronome + なんか / なんて (modéstia: 私なんか)""",
no="""Cuidado ao usar なんか com coisas de outras pessoas, porque pode soar como desprezo.

なんて também aparece em なんて + adjetivo, como なんてきれいなんだ ("que lindo!"), com sentido de exclamação.

Na fala, なんか também é usado sozinho como "tipo..." ou "sei lá...", para hesitar.""",
bf="なんか",
rx="なんか|なんて",
tk=["なんか", "なんて"],
va=["なんか", "なんて"],
E=[
("私なんか、まだまだです。", "わたしなんか、まだまだです。", "Eu ainda tenho muito a aprender."),
("彼が来るなんて、思わなかった。", "かれがくるなんて、おもわなかった。", "Jamais imaginei que ele viria."),
("今日は疲れたから、宿題なんか、やりたくない。", "きょうはつかれたから、しゅくだいなんか、やりたくない。", "Hoje estou cansado, lição é a última coisa que quero fazer."),
("休憩しましょう。お茶なんかどうですか。", "きゅうけいしましょう。おちゃなんかどうですか。", "Vamos fazer uma pausa. Que tal um chá ou algo assim?"),
("友達にうそをつくなんて、ひどい。", "ともだちにうそをつくなんて、ひどい。", "Mentir para um amigo? Que horror."),
],
R=[
("一人で外国に行く____、すごいね。", "Ir sozinho para o exterior? Que incrível!", ["なんて"]),
("今日は勉強____したくない。", "Hoje não estou com a menor vontade de estudar.", ["なんか", "なんて"]),
("お土産に、甘い物____どうですか。", "Que tal um doce ou algo assim de lembrancinha?", ["なんか"]),
("私____、まだまだ下手です。", "Eu ainda sou muito ruim nisso.", ["なんか", "なんて"]),
("あんなに強い彼が負ける____、信じられない。", "Ele, tão forte, perder? Não dá para acreditar.", ["なんて"]),
],
),
dict(
n=69,
jp="〜直す",
rd="naosu",
tr="Refazer / Fazer de novo / Corrigir",
ex="""直す, ligado a outro verbo, indica que uma ação é feita de novo, geralmente para corrigir ou melhorar algo. Equivale a "refazer", "fazer de novo" ou "corrigir".

A estrutura junta o verbo na forma ます sem ます com 直す. O resultado funciona como um verbo do grupo 1.

Por exemplo, reescrever algo que ficou errado, ler de novo para revisar, repensar um plano ou ligar de novo para alguém.

A ideia é de recomeço com o objetivo de acertar ou melhorar. Por isso, é muito usado em situações de erro, revisão e segunda chance.""",
st="""Verbo na forma ます sem ます + 直す

Passado: 直した / 直しました
Pedido: 直してください

Combinações comuns: 書き直す / 読み直す / 考え直す / かけ直す / やり直す / 見直す""",
no="""見直す tem dois sentidos: "revisar" e "mudar a opinião sobre alguém para melhor".

やり直す é muito usado em frases de incentivo, como "pode recomeçar quantas vezes quiser".

かけ直す é a forma natural de dizer "vou ligar de novo" ao telefone.""",
bf="直す",
rx="直|なお",
tk=["直す"],
va=["直す", "直した", "直します", "直して"],
E=[
("間違えたので、もう一度書き直した。", "まちがえたので、もういちどかきなおした。", "Errei e reescrevi tudo de novo."),
("この文をもう一度読み直してください。", "このぶんをもういちどよみなおしてください。", "Leia esta frase mais uma vez, por favor."),
("この計画は考え直したほうがいい。", "このけいかくはかんがえなおしたほうがいい。", "É melhor repensar este plano."),
("番号を間違えたので、電話をかけ直した。", "ばんごうをまちがえたので、でんわをかけなおした。", "Liguei para o número errado e liguei de novo."),
("失敗しても、またやり直せばいい。", "しっぱいしても、またやりなおせばいい。", "Mesmo que erre, é só recomeçar."),
],
R=[
("字が汚いので、書き____ください。", "A letra está feia, então reescreva, por favor.", ["直して"]),
("提出する前に、この作文をもう一度見____。", "Antes de entregar, vou revisar esta redação mais uma vez.", ["直します", "直した", "直しました"]),
("今、田中は席にいないので、後でかけ____ます。", "O Tanaka não está na mesa agora, então ligaremos de novo mais tarde.", ["直し"]),
("うまくいかなかったから、最初からやり____。", "Não deu certo, então vamos recomeçar do início.", ["直そう", "直します"]),
("その問題について、もう一度考え____ほうがいい。", "É melhor repensar esse problema mais uma vez.", ["直した"]),
],
),
dict(
n=70,
jp="なるべく",
rd="narubeku",
tr="Na medida do possível / O máximo possível / Sempre que possível",
ex="""なるべく é um advérbio que significa "na medida do possível" ou "sempre que possível". Ele indica que a pessoa vai tentar fazer algo, dentro das suas possibilidades.

É muito usado em pedidos ("venha o mais cedo possível"), conselhos ("é melhor, sempre que possível, não ficar acordado até tarde") e hábitos ("procuro, sempre que possível, comer verdura").

Combina muito bem com ようにする e ようにしている, que expressam esforço para manter um hábito.

なるべく é um pouco mais suave e menos enfático que できるだけ, que tem o mesmo sentido.""",
st="""なるべく + Verbo / Advérbio / Adjetivo
なるべく + Verbo + ようにする / ようにしている
なるべく + Verbo + てください (pedido)""",
no="""なるべく e できるだけ podem ser trocados na maioria dos casos.

Em pedidos educados, なるべく deixa o pedido mais flexível, sem pressionar a outra pessoa.

なるべく早く ("o mais cedo possível") é uma das combinações mais comuns, principalmente em e-mails de trabalho.""",
bf="なるべく",
rx="なるべく",
tk=["なるべく"],
va=["なるべく"],
E=[
("明日はなるべく早く来てください。", "あしたはなるべくはやくきてください。", "Amanhã, venha o mais cedo possível."),
("健康のために、なるべく野菜を食べるようにしている。", "けんこうのために、なるべくやさいをたべるようにしている。", "Pela saúde, procuro comer verdura sempre que possível."),
("なるべく夜遅くまで起きていないほうがいい。", "なるべくよるおそくまでおきていないほうがいい。", "É melhor, na medida do possível, não ficar acordado até tarde."),
("お返事はなるべく今日中にお願いします。", "おへんじはなるべくきょうじゅうにおねがいします。", "Peço que responda, se possível, ainda hoje."),
("今月はなるべくお金を使わないようにしています。", "こんげつはなるべくおかねをつかわないようにしています。", "Este mês, procuro gastar o mínimo possível."),
],
R=[
("健康のために、____階段を使うようにしている。", "Pela saúde, procuro usar a escada sempre que possível.", ["なるべく"]),
("旅行の荷物は____少なくしてください。", "Leve a menor bagagem possível na viagem.", ["なるべく"]),
("____早く返事をください。", "Me responda o mais rápido possível, por favor.", ["なるべく"]),
("授業では、____日本語で話すようにしています。", "Nas aulas, procuro falar em japonês sempre que possível.", ["なるべく"]),
("甘い物は____食べないようにしている。", "Procuro, na medida do possível, não comer doces.", ["なるべく"]),
],
),
]
