G = [
dict(
n=111,
jp="〜につき",
rd="ni tsuki",
tr="Por motivo de / Devido a / Por cada",
ex="""につき tem dois usos principais.

O primeiro indica o motivo de algo, de forma formal. Equivale a "por motivo de" ou "devido a". É muito usado em avisos e placas, como "fechado devido a reformas".

O segundo indica uma proporção, com o sentido de "por cada". Por exemplo, "mil ienes por pessoa" ou "um por cliente".""",
st="""Substantivo + につき + Aviso (motivo)
Número / Unidade + につき + Quantidade (proporção)""",
no="""No uso de motivo, aparece principalmente em avisos escritos, como 工事中につき ou 準備中につき.

No uso de proporção, é parecido com あたり, mas につき é mais formal.""",
bf="につき",
rx="につき",
tk=["に", "つき"],
va=["につき"],
E=[
("工事中につき、この道は通れません。", "こうじちゅうにつき、このみちはとおれません。", "Devido a obras, não é possível passar por esta rua."),
("本日は定休日につき、お休みします。", "ほんじつはていきゅうびにつき、おやすみします。", "Hoje é nosso dia de folga, por isso estamos fechados."),
("参加費は一人につき千円です。", "さんかひはひとりにつきせんえんです。", "A taxa de participação é de mil ienes por pessoa."),
("お一人様につき、一点限りです。", "おひとりさまにつき、いってんかぎりです。", "Limitado a um item por cliente."),
("雨天につき、試合は中止となりました。", "うてんにつき、しあいはちゅうしとなりました。", "Devido à chuva, a partida foi cancelada."),
],
R=[
("準備中____、しばらくお待ちください。", "Estamos nos preparando, por favor aguarde um momento.", ["につき"]),
("駐車料金は一時間____三百円です。", "O estacionamento custa trezentos ienes por hora.", ["につき"]),
("改装中____、休業しております。", "Estamos fechados devido a reformas.", ["につき"]),
("このくじは一回____百円です。", "Este sorteio custa cem ienes por vez.", ["につき"]),
("会議中____、入室をご遠慮ください。", "Em reunião, por favor não entre.", ["につき"]),
],
),
dict(
n=112,
jp="〜にわたって",
rd="ni watatte",
tr="Durante / Ao longo de / Por toda a extensão de",
ex="""にわたって indica que algo se estende por um período longo ou por uma área grande. Equivale a "durante" ou "ao longo de".

Costuma vir com palavras de tempo, como "três horas" ou "dez anos", ou de espaço, como "todo o país" ou "uma grande área". Por exemplo, "a reunião durou cinco horas".

Mostra que a duração ou a extensão é grande.""",
st="""Substantivo (período / área / quantidade) + にわたって / にわたり
Substantivo + にわたる + Substantivo""",
no="""A forma にわたる vem antes de substantivos, como 長年にわたる研究.

É parecido com の間, mas にわたって destaca a grande extensão.""",
bf="にわたって",
rx="にわたって|にわたり|にわたる|にわたった",
tk=["に", "わたって"],
va=["にわたって", "にわたり", "にわたる", "にわたった"],
E=[
("会議は五時間にわたって続いた。", "かいぎはごじかんにわたってつづいた。", "A reunião durou cinco horas."),
("彼は十年にわたって、この研究を続けてきた。", "かれはじゅうねんにわたって、このけんきゅうをつづけてきた。", "Ele continuou esta pesquisa ao longo de dez anos."),
("台風で、広い範囲にわたり被害が出た。", "たいふうで、ひろいはんいにわたりひがいがでた。", "Com o tufão, houve danos em uma grande área."),
("三日間にわたる祭りが始まった。", "みっかかんにわたるまつりがはじまった。", "Começou um festival que dura três dias."),
("全国にわたって、大雨が降った。", "ぜんこくにわたって、おおあめがふった。", "Choveu forte em todo o país."),
],
R=[
("手術は八時間____行われた。", "A cirurgia durou oito horas.", ["にわたって", "にわたり"]),
("この地域では一か月____雨が降らなかった。", "Nesta região, não choveu durante um mês.", ["にわたって", "にわたり"]),
("長年____研究の結果がようやく出た。", "Finalmente saiu o resultado de uma pesquisa de muitos anos.", ["にわたる", "にわたった"]),
("彼女は二十年____、この店を経営してきた。", "Ela administrou esta loja ao longo de vinte anos.", ["にわたって", "にわたり"]),
("試験は三日間____行われる。", "A prova será realizada ao longo de três dias.", ["にわたって", "にわたり"]),
],
),
dict(
n=113,
jp="〜にも関わらず",
rd="ni mo kakawarazu",
tr="Apesar de / Embora / Mesmo",
ex="""にも関わらず indica que algo aconteceu de forma contrária ao que se esperava. Equivale a "apesar de" ou "embora".

A primeira parte apresenta um fato, e a segunda mostra um resultado inesperado. Muitas vezes há um tom de surpresa ou crítica. Por exemplo, "apesar da chuva, muitas pessoas vieram".

É uma expressão formal, comum em textos e notícias.""",
st="""Verbo (forma simples) + にも関わらず
Adjetivo い + にも関わらず
Adjetivo な / Substantivo + (である) + にも関わらず""",
no="""É parecido com のに, mas のに expressa mais frustração pessoal, enquanto にも関わらず é mais objetivo e formal.

Também é escrito にもかかわらず.

Não se confunde com に関わらず, que significa "independentemente de".""",
bf="にも関わらず",
rx="にも関わらず|にもかかわらず",
tk=["に", "も", "関わらず"],
va=["にも関わらず", "にもかかわらず"],
E=[
("雨にも関わらず、たくさんの人が来た。", "あめにもかかわらず、たくさんのひとがきた。", "Apesar da chuva, muitas pessoas vieram."),
("彼は熱があるにもかかわらず、会社に行った。", "かれはねつがあるにもかかわらず、かいしゃにいった。", "Apesar de estar com febre, ele foi trabalhar."),
("一生懸命勉強したにも関わらず、試験に落ちた。", "いっしょうけんめいべんきょうしたにもかかわらず、しけんにおちた。", "Apesar de ter estudado muito, reprovei na prova."),
("平日にもかかわらず、店は混んでいた。", "へいじつにもかかわらず、みせはこんでいた。", "Embora fosse dia útil, a loja estava cheia."),
("危険だと言われたにも関わらず、彼は山に登った。", "きけんだといわれたにもかかわらず、かれはやまにのぼった。", "Mesmo tendo sido avisado do perigo, ele subiu a montanha."),
],
R=[
("夜遅い____、電話に出てくれてありがとう。", "Obrigado por atender o telefone apesar de ser tarde da noite.", ["にも関わらず", "にもかかわらず"]),
("忙しい____、手伝ってくれた。", "Apesar de estar ocupado, ele me ajudou.", ["にも関わらず", "にもかかわらず"]),
("注意した____、彼はまた同じミスをした。", "Apesar de eu ter avisado, ele cometeu o mesmo erro.", ["にも関わらず", "にもかかわらず"]),
("高い____、その商品はよく売れている。", "Apesar de ser caro, esse produto vende bem.", ["にも関わらず", "にもかかわらず"]),
("悪天候____、飛行機は予定通り出発した。", "Apesar do mau tempo, o avião partiu no horário.", ["にも関わらず", "にもかかわらず"]),
],
),
dict(
n=114,
jp="〜にて",
rd="nite",
tr="Em / Por meio de / Com",
ex="""にて é uma forma formal e escrita da partícula で. Equivale a "em", "por meio de" ou "com".

Pode indicar o lugar onde algo acontece, como "no salão principal", o meio usado, como "por e-mail", ou o momento em que algo termina, como "encerramos hoje".

É muito comum em avisos, convites, anúncios e documentos oficiais.""",
st="""Substantivo (lugar) + にて
Substantivo (meio / método) + にて
Substantivo (tempo) + にて + 終了する / 締め切る""",
no="""Na fala do dia a dia, usa-se で.

Expressões comuns são 会場にて, メールにて, 本日にて e 以上にて.""",
bf="にて",
rx="にて",
tk=["にて"],
va=["にて"],
E=[
("式は本館ホールにて行います。", "しきはほんかんホールにておこないます。", "A cerimônia será realizada no salão do prédio principal."),
("結果はメールにてお知らせします。", "けっかはメールにておしらせします。", "Os resultados serão informados por e-mail."),
("本日にて受付を終了いたします。", "ほんじつにてうけつけをしゅうりょういたします。", "Com o dia de hoje, encerramos as inscrições."),
("以上にて説明を終わります。", "いじょうにてせつめいをおわります。", "Com isso, encerro a explicação."),
("詳細は受付にてお尋ねください。", "しょうさいはうけつけにておたずねください。", "Para detalhes, pergunte na recepção."),
],
R=[
("会議は三階の会議室____行います。", "A reunião será realizada na sala de reuniões do terceiro andar.", ["にて"]),
("申し込みは電話____受け付けます。", "As inscrições são aceitas por telefone.", ["にて"]),
("これ____本日の授業を終わります。", "Com isto, encerro a aula de hoje.", ["にて"]),
("商品は宅配便____お届けします。", "Entregaremos o produto por serviço de entrega.", ["にて"]),
("チケットは駅の窓口____販売しております。", "Os ingressos estão à venda no guichê da estação.", ["にて"]),
],
),
dict(
n=115,
jp="〜のももっともだ",
rd="no mo mottomo da",
tr="É compreensível que / É natural que / Faz sentido que",
ex="""のももっともだ indica que uma reação ou atitude é compreensível diante da situação. Equivale a "é compreensível que" ou "faz sentido que".

A pessoa que fala mostra que entende e aceita o motivo do outro. Por exemplo, "depois de esperar duas horas, é compreensível que ele esteja bravo".

É parecido com のも当然だ e のも無理はない.""",
st="""Verbo (forma simples) + のももっともだ
Adjetivo い + のももっともだ
Adjetivo な + な + のももっともだ""",
no="""O tom é de compreensão e empatia, não de crítica.

Também aparece como のももっともです, na forma educada.

A palavra もっとも sozinha, como adjetivo, significa "razoável".""",
bf="のももっともだ",
rx="のももっとも",
tk=["の", "も", "もっとも", "だ"],
va=["のももっともだ", "のももっともです"],
E=[
("二時間も待たされたのだから、彼が怒るのももっともだ。", "にじかんもまたされたのだから、かれがおこるのももっともだ。", "Ele esperou duas horas, então é compreensível que esteja bravo."),
("初めての海外なら、不安に思うのももっともだ。", "はじめてのかいがいなら、ふあんにおもうのももっともだ。", "Se é a primeira vez no exterior, é natural ficar inseguro."),
("あれだけ練習したのだから、優勝したのももっともです。", "あれだけれんしゅうしたのだから、ゆうしょうしたのももっともです。", "Com tanto treino, faz sentido que tenha vencido."),
("毎日残業では、疲れるのももっともだ。", "まいにちざんぎょうでは、つかれるのももっともだ。", "Fazendo hora extra todo dia, é compreensível ficar cansado."),
("この値段なら、人気があるのももっともだ。", "このねだんなら、にんきがあるのももっともだ。", "Com este preço, é natural que seja popular."),
],
R=[
("ひどいことを言われたのだから、彼女が泣く____。", "Ouviu coisas horríveis, então é compreensível que ela chore.", ["のももっともだ", "のももっともです"]),
("約束を何度も破られたら、信じられなくなる____。", "Se a promessa for quebrada várias vezes, é natural deixar de confiar.", ["のももっともだ", "のももっともです"]),
("こんなに暑いなら、食欲がない____。", "Com este calor, é compreensível não ter apetite.", ["のももっともだ", "のももっともです"]),
("子供が心配な____。", "É natural se preocupar com o filho.", ["のももっともだ", "のももっともです"]),
("一人で住むのが寂しい____。", "É compreensível que morar sozinho seja solitário.", ["のももっともだ", "のももっともです"]),
],
),
dict(
n=116,
jp="〜の下で",
rd="no moto de",
tr="Sob / Sob a orientação de / Debaixo de",
ex="""の下で, lido もとで, indica que algo acontece sob a influência, orientação ou condição de algo ou alguém. Equivale a "sob" ou "sob a orientação de".

Pode se referir a uma pessoa, como "estudar sob a orientação de um professor famoso", ou a uma condição, como "sob a lei" ou "sob este acordo".

Também pode indicar um lugar físico, como "debaixo do céu azul".""",
st="""Substantivo (pessoa) + の下で
Substantivo (condição / regra) + の下で / の下に""",
no="""Nesse uso, 下 é lido もと e não した.

A forma の下に é mais formal e aparece em textos sérios, como 法の下に.

Expressões comuns são 先生の下で, 指導の下で e 青空の下で.""",
bf="の下で",
rx="の下で|の下に|のもとで|のもとに",
tk=["の", "下", "で"],
va=["の下で", "の下に", "のもとで"],
E=[
("有名な先生の下で、ピアノを習った。", "ゆうめいなせんせいのもとで、ピアノをならった。", "Aprendi piano sob a orientação de um professor famoso."),
("青空の下で、お弁当を食べた。", "あおぞらのもとで、おべんとうをたべた。", "Comi a marmita debaixo do céu azul."),
("専門家の指導の下で、実験を行った。", "せんもんかのしどうのもとで、じっけんをおこなった。", "Fizemos o experimento sob a orientação de especialistas."),
("すべての人は法の下に平等だ。", "すべてのひとはほうのもとにびょうどうだ。", "Todas as pessoas são iguais perante a lei."),
("厳しい条件の下で、選手たちは練習を続けた。", "きびしいじょうけんのもとで、せんしゅたちはれんしゅうをつづけた。", "Sob condições difíceis, os atletas continuaram treinando."),
],
R=[
("彼は父親の____、料理の修業をした。", "Ele treinou culinária sob a orientação do pai.", ["下で", "もとで"]),
("医師の管理____、新しい薬を試した。", "Testamos o novo remédio sob a supervisão do médico.", ["の下で", "の下に", "のもとで", "のもとに"]),
("太陽____、子供たちが元気に遊んでいる。", "Debaixo do sol, as crianças brincam animadas.", ["の下で", "のもとで"]),
("新しい社長____、会社は大きく変わった。", "Sob o novo presidente, a empresa mudou muito.", ["の下で", "のもとで"]),
("この契約____、両社は協力していく。", "Sob este contrato, as duas empresas vão cooperar.", ["の下で", "の下に", "のもとで", "のもとに"]),
],
),
dict(
n=117,
jp="〜の上では",
rd="no ue dewa",
tr="Segundo / Em termos de / No papel",
ex="""の上では indica que algo é verdade de acordo com uma informação ou um ponto de vista, mas muitas vezes não corresponde à realidade. Equivale a "segundo", "em termos de" ou "no papel".

Costuma vir com palavras como calendário, dados, cálculo, lei e regra. Por exemplo, "segundo o calendário já é primavera, mas ainda está frio".

A segunda parte muitas vezes mostra uma diferença entre a teoria e a prática.""",
st="""Substantivo + の上では + Frase
Substantivo + の上で(は) + Frase""",
no="""Expressões comuns são 暦の上では, 計算の上では, データの上では e 法律の上では.

O tom geralmente contrasta a teoria com a realidade.""",
bf="の上では",
rx="の上では|の上で|のうえでは",
tk=["の", "上", "では"],
va=["の上では", "の上で"],
E=[
("暦の上では春だが、まだ寒い。", "こよみのうえでははるだが、まださむい。", "Segundo o calendário já é primavera, mas ainda está frio."),
("計算の上では、十分に間に合うはずだ。", "けいさんのうえでは、じゅうぶんにまにあうはずだ。", "Em termos de cálculo, deve dar tempo de sobra."),
("データの上では、売り上げは増えている。", "データのうえでは、うりあげはふえている。", "Segundo os dados, as vendas estão aumentando."),
("法律の上では、彼に責任はない。", "ほうりつのうえでは、かれにせきにんはない。", "Do ponto de vista da lei, ele não tem responsabilidade."),
("書類の上では問題ないが、実際はどうだろう。", "しょるいのうえではもんだいないが、じっさいはどうだろう。", "No papel não há problema, mas como será na prática?"),
],
R=[
("暦____もう秋だが、毎日暑い。", "Segundo o calendário já é outono, mas faz calor todos os dias.", ["の上では", "のうえでは"]),
("理論____可能だが、実際には難しい。", "Na teoria é possível, mas na prática é difícil.", ["の上では", "のうえでは"]),
("数字____、景気は回復している。", "Segundo os números, a economia está se recuperando.", ["の上では", "のうえでは"]),
("規則____、ここでたばこを吸ってはいけない。", "Segundo as regras, não se pode fumar aqui.", ["の上では", "のうえでは"]),
("地図____近いが、実際は山道で遠い。", "No mapa é perto, mas na realidade é longe por causa da estrada na montanha.", ["の上では", "のうえでは"]),
],
),
dict(
n=118,
jp="〜のみならず",
rd="nomi narazu",
tr="Não apenas / Não só / Além de",
ex="""のみならず indica que algo não se limita a um caso e se estende a outros. Equivale a "não apenas" ou "não só".

Tem o mesmo sentido de だけでなく, mas é bem mais formal e aparece principalmente na escrita, em discursos e notícias.

Por exemplo, "este problema afeta não apenas o Japão, mas o mundo inteiro". Depois, costuma vir も.""",
st="""Substantivo + のみならず + Frase (com も)
Verbo / Adjetivo (forma simples) + のみならず
Adjetivo な / Substantivo + である + のみならず""",
no="""A forma のみならず também pode aparecer no começo de frase com o sentido de "além disso".

É parecido com ばかりか e に限らず.""",
bf="のみならず",
rx="のみならず",
tk=["のみ", "ならず"],
va=["のみならず"],
E=[
("この問題は日本のみならず、世界中に関わる。", "このもんだいはにほんのみならず、せかいじゅうにかかわる。", "Este problema afeta não apenas o Japão, mas o mundo inteiro."),
("彼は歌手であるのみならず、俳優としても活躍している。", "かれはかしゅであるのみならず、はいゆうとしてもかつやくしている。", "Ele não é apenas cantor, também faz sucesso como ator."),
("この映画は子供のみならず、大人にも人気がある。", "このえいがはこどものみならず、おとなにもにんきがある。", "Este filme é popular não só entre crianças, mas também entre adultos."),
("彼女は英語のみならず、フランス語も話せる。", "かのじょはえいごのみならず、フランスごもはなせる。", "Ela fala não apenas inglês, mas também francês."),
("値段が高いのみならず、品質も悪い。", "ねだんがたかいのみならず、ひんしつもわるい。", "Não apenas o preço é alto, a qualidade também é ruim."),
],
R=[
("この町は観光地として国内____、海外でも有名だ。", "Esta cidade é famosa como destino turístico não só no país, mas também no exterior.", ["のみならず"]),
("彼は勉強____、スポーツも得意だ。", "Ele é bom não apenas nos estudos, mas também nos esportes.", ["のみならず"]),
("環境問題は政府____、個人も考えるべきだ。", "Os problemas ambientais devem ser pensados não só pelo governo, mas também pelos indivíduos.", ["のみならず"]),
("この薬は効果がない____、副作用もある。", "Este remédio não só não faz efeito, como também tem efeitos colaterais.", ["のみならず"]),
("このレストランは味____、雰囲気もいい。", "Este restaurante é bom não apenas no sabor, mas também no ambiente.", ["のみならず"]),
],
),
dict(
n=119,
jp="〜ぬ",
rd="nu",
tr="Não / Sem",
ex="""ぬ é uma forma antiga da negação ない. Equivale a "não".

Hoje é usada principalmente na escrita formal, em provérbios, em expressões fixas e em textos literários. Por exemplo, "o que não se vê" ou "sem saber".

Antes de substantivos, ぬ funciona como adjetivo, como em "pessoa desconhecida".""",
st="""Verbo (forma ない sem ない) + ぬ
する → せぬ
Verbo (forma ない sem ない) + ぬ + Substantivo""",
no="""A forma ず também é uma negação antiga, usada no meio da frase.

Expressões comuns são 知らぬ間に, 見知らぬ人, 思わぬ e 言わぬが花.

A forma ねばならない vem da mesma origem.""",
bf="ぬ",
rx="ぬ",
tk=["ぬ"],
va=["ぬ", "せぬ"],
E=[
("見知らぬ人に声をかけられた。", "みしらぬひとにこえをかけられた。", "Uma pessoa desconhecida falou comigo."),
("知らぬ間に、雨が降り出していた。", "しらぬまに、あめがふりだしていた。", "Sem eu perceber, começou a chover."),
("思わぬところで友達に会った。", "おもわぬところでともだちにあった。", "Encontrei um amigo num lugar inesperado."),
("彼は何も言わぬまま、部屋を出ていった。", "かれはなにもいわぬまま、へやをでていった。", "Ele saiu do quarto sem dizer nada."),
("ここで負けるわけにはいかぬ。", "ここでまけるわけにはいかぬ。", "Não posso perder aqui."),
],
R=[
("彼は帰ら____人となった。", "Ele se tornou alguém que não voltaria mais.", ["ぬ"]),
("見知ら____町を一人で歩いた。", "Andei sozinho por uma cidade desconhecida.", ["ぬ"]),
("思わ____事故で、けがをした。", "Me machuquei num acidente inesperado.", ["ぬ"]),
("知ら____間に、時間が過ぎていた。", "Sem eu perceber, o tempo tinha passado.", ["ぬ"]),
("言わ____が花だ。", "O melhor é não dizer nada.", ["ぬ"]),
],
),
dict(
n=120,
jp="〜抜きにして",
rd="nuki ni shite",
tr="Sem / Deixando de lado / Sem levar em conta",
ex="""抜きにして indica que algo é feito sem um elemento que normalmente estaria presente. Equivale a "sem" ou "deixando de lado".

Por exemplo, "deixando as formalidades de lado, vamos conversar à vontade".

Também aparece na forma 抜きにしては〜ない, que significa que algo não é possível sem aquele elemento. Por exemplo, "não dá para falar da história do Japão sem falar de Kyoto".""",
st="""Substantivo + を抜きにして / は抜きにして
Substantivo + 抜きで
Substantivo + を抜きにしては + Frase negativa""",
no="""A forma 抜きで é mais simples e informal, como 朝ご飯抜きで.

Expressões comuns são 冗談は抜きにして e 堅い話は抜きにして.""",
bf="抜きにして",
rx="抜きにして|抜きで|抜きに|ぬきにして",
tk=["抜き", "に", "して"],
va=["抜きにして", "を抜きにして", "抜きで", "抜きにしては"],
E=[
("冗談は抜きにして、本当の話をしよう。", "じょうだんはぬきにして、ほんとうのはなしをしよう。", "Deixando as brincadeiras de lado, vamos falar sério."),
("堅い話は抜きにして、今日は楽しみましょう。", "かたいはなしはぬきにして、きょうはたのしみましょう。", "Deixando os assuntos sérios de lado, vamos nos divertir hoje."),
("彼の協力を抜きにしては、この計画は成功しなかった。", "かれのきょうりょくをぬきにしては、このけいかくはせいこうしなかった。", "Sem a cooperação dele, este plano não teria dado certo."),
("今朝は朝ご飯抜きで会社に来た。", "けさはあさごはんぬきでかいしゃにきた。", "Hoje de manhã vim para o trabalho sem tomar café."),
("値段を抜きにして考えれば、この車が一番いい。", "ねだんをぬきにしてかんがえれば、このくるまがいちばんいい。", "Sem levar em conta o preço, este carro é o melhor."),
],
R=[
("挨拶は____、さっそく始めましょう。", "Deixando os cumprimentos de lado, vamos começar logo.", ["抜きにして", "ぬきにして"]),
("お世辞は____、正直な意見を聞かせてください。", "Sem elogios, me diga sua opinião sincera.", ["抜きにして", "ぬきにして"]),
("この町の歴史は、お寺を____は語れない。", "Não dá para falar da história desta cidade sem falar dos templos.", ["抜きにして", "ぬきにして"]),
("わさび____お寿司をください。", "Me dá um sushi sem wasabi, por favor.", ["抜きで"]),
("仕事の話は____、ゆっくり飲もう。", "Deixando o trabalho de lado, vamos beber com calma.", ["抜きにして", "ぬきにして"]),
],
),
]
