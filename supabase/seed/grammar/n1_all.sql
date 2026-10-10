-- n1-grammar-01 — 敢えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-01',
    'grammar',
    'N1',
    $$敢えて$$,
    $$aete$$,
    $$Propositalmente / Ousar / De propósito$$,
    $$敢えて indica que a pessoa faz algo de propósito, mesmo sabendo que é difícil, arriscado ou que não seria necessário. Equivale a "propositalmente", "de propósito" ou "ousar".

Por exemplo, "escolhi de propósito o caminho mais difícil" ou "ouso dizer que...".

Com uma forma negativa, 敢えて〜ない significa "não fazer questão de" ou "não há necessidade de".$$,
    $$Também é escrito あえて, em hiragana, o que é bastante comum.

Uma expressão comum é 敢えて言えば, "se for para dizer algo".

É parecido com わざと, mas わざと costuma ter um sentido mais negativo.$$,
    $$敢えて + Verbo
敢えて + Verbo (forma ない) (não fazer questão)$$,
    $$敢えて$$,
    $$敢えて|あえて$$,
    ARRAY['敢えて']::text[],
    ARRAY['敢えて', 'あえて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-01', $$彼は敢えて難しい道を選んだ。$$, $$かれはあえてむずかしいみちをえらんだ。$$, $$Ele escolheu de propósito o caminho mais difícil.$$),
    ('n1-grammar-01', $$敢えて言わせてもらうと、その計画には反対だ。$$, $$あえていわせてもらうと、そのけいかくにははんたいだ。$$, $$Se me permite ousar dizer, sou contra esse plano.$$),
    ('n1-grammar-01', $$その件については、敢えて何も言わなかった。$$, $$そのけんについては、あえてなにもいわなかった。$$, $$Sobre esse assunto, propositalmente não disse nada.$$),
    ('n1-grammar-01', $$あえて厳しいことを言うのは、君のためだ。$$, $$あえてきびしいことをいうのは、きみのためだ。$$, $$Digo coisas duras de propósito, é para o seu bem.$$),
    ('n1-grammar-01', $$敢えて説明する必要はないだろう。$$, $$あえてせつめいするひつようはないだろう。$$, $$Não deve haver necessidade de explicar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は____反対意見を述べた。$$, $$Ela ousou expressar uma opinião contrária.$$),
        (2, $$____危険を冒す必要はない。$$, $$Não há necessidade de correr riscos de propósito.$$),
        (3, $$____一言言わせてください。$$, $$Deixe-me ousar dizer uma palavra.$$),
        (4, $$彼は____何も知らないふりをした。$$, $$Ele fingiu de propósito que não sabia de nada.$$),
        (5, $$____高い方を選んだのは、品質がいいからだ。$$, $$Escolhi propositalmente o mais caro porque a qualidade é boa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$敢えて$$),
        (1, $$あえて$$),
        (2, $$敢えて$$),
        (2, $$あえて$$),
        (3, $$敢えて$$),
        (3, $$あえて$$),
        (4, $$敢えて$$),
        (4, $$あえて$$),
        (5, $$敢えて$$),
        (5, $$あえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-02 — あくまでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-02',
    'grammar',
    'N1',
    $$あくまでも$$,
    $$akumademo$$,
    $$Até o fim / Absolutamente / Apenas$$,
    $$あくまでも tem dois usos principais.

O primeiro indica que alguém mantém uma atitude até o fim, sem mudar. Equivale a "até o fim" ou "absolutamente". Por exemplo, "ele insistiu até o fim que era inocente".

O segundo serve para limitar ou esclarecer uma afirmação, com o sentido de "apenas" ou "simplesmente". Por exemplo, "isto é apenas a minha opinião pessoal".$$,
    $$A forma あくまで tem o mesmo sentido.

No segundo uso, é comum em frases como あくまでも参考です e あくまでも個人的な意見です.$$,
    $$あくまでも + Verbo (insistir / manter)
あくまでも + Substantivo + だ / です (limitação)$$,
    $$あくまでも$$,
    $$あくまでも|あくまで$$,
    ARRAY['あくまでも']::text[],
    ARRAY['あくまでも', 'あくまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-02', $$彼はあくまでも無実を主張した。$$, $$かれはあくまでもむじつをしゅちょうした。$$, $$Ele insistiu até o fim que era inocente.$$),
    ('n1-grammar-02', $$これはあくまでも私の個人的な意見です。$$, $$これはあくまでもわたしのこじんてきないけんです。$$, $$Isto é apenas a minha opinião pessoal.$$),
    ('n1-grammar-02', $$あくまで参考として聞いてください。$$, $$あくまでさんこうとしてきいてください。$$, $$Ouça apenas como referência.$$),
    ('n1-grammar-02', $$彼女はあくまでも自分のやり方を変えなかった。$$, $$かのじょはあくまでもじぶんのやりかたをかえなかった。$$, $$Ela não mudou seu jeito de fazer as coisas de forma alguma.$$),
    ('n1-grammar-02', $$この数字はあくまでも予想です。$$, $$このすうじはあくまでもよそうです。$$, $$Estes números são apenas uma previsão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____反対の立場を貫いた。$$, $$Ele manteve a posição contrária até o fim.$$),
        (2, $$これは____仮の計画です。$$, $$Este é apenas um plano provisório.$$),
        (3, $$私は____自分の夢を追い続ける。$$, $$Vou continuar perseguindo meu sonho até o fim.$$),
        (4, $$今の話は____うわさに過ぎない。$$, $$O que acabei de contar não passa de um boato.$$),
        (5, $$____冷静に話し合いましょう。$$, $$Vamos conversar com calma, de qualquer jeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あくまでも$$),
        (1, $$あくまで$$),
        (2, $$あくまでも$$),
        (2, $$あくまで$$),
        (3, $$あくまでも$$),
        (3, $$あくまで$$),
        (4, $$あくまでも$$),
        (4, $$あくまで$$),
        (5, $$あくまでも$$),
        (5, $$あくまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-03 — 案の定
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-03',
    'grammar',
    'N1',
    $$案の定$$,
    $$an no jou$$,
    $$Como esperado / Dito e feito / Como previsto$$,
    $$案の定 indica que algo aconteceu exatamente como a pessoa tinha imaginado ou temido. Equivale a "como esperado" ou "dito e feito".

Na maioria das vezes é usado para resultados negativos que a pessoa já previa. Por exemplo, "achei que ia chover e, dito e feito, choveu".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com やっぱり e 思った通り, mas 案の定 costuma ser usado com resultados ruins.

Não se usa para planos ou intenções, apenas para previsões que se confirmaram.$$,
    $$案の定、 + Frase (resultado previsto)$$,
    $$案の定$$,
    $$案の定|あんのじょう$$,
    ARRAY['案', 'の', '定']::text[],
    ARRAY['案の定']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-03', $$雨が降りそうだと思っていたら、案の定降ってきた。$$, $$あめがふりそうだとおもっていたら、あんのじょうふってきた。$$, $$Achei que ia chover e, dito e feito, começou a chover.$$),
    ('n1-grammar-03', $$勉強しなかったので、案の定試験に落ちた。$$, $$べんきょうしなかったので、あんのじょうしけんにおちた。$$, $$Como não estudei, reprovei na prova, como era de esperar.$$),
    ('n1-grammar-03', $$案の定、彼は遅れてきた。$$, $$あんのじょう、かれはおくれてきた。$$, $$Como previsto, ele chegou atrasado.$$),
    ('n1-grammar-03', $$無理をしたら、案の定熱が出た。$$, $$むりをしたら、あんのじょうねつがでた。$$, $$Forcei demais e, como esperado, tive febre.$$),
    ('n1-grammar-03', $$案の定、道が混んでいた。$$, $$あんのじょう、みちがこんでいた。$$, $$Dito e feito, a estrada estava congestionada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$嫌な予感がしたが、____事故が起きた。$$, $$Tive um mau pressentimento e, dito e feito, houve um acidente.$$),
        (2, $$____、彼は約束を忘れていた。$$, $$Como previsto, ele tinha esquecido a promessa.$$),
        (3, $$安すぎると思ったら、____すぐに壊れた。$$, $$Achei que era barato demais e, como esperado, quebrou logo.$$),
        (4, $$____、店は休みだった。$$, $$Como era de esperar, a loja estava fechada.$$),
        (5, $$食べすぎたので、____お腹が痛くなった。$$, $$Comi demais e, dito e feito, fiquei com dor de barriga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$案の定$$),
        (2, $$案の定$$),
        (3, $$案の定$$),
        (4, $$案の定$$),
        (5, $$案の定$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-04 — あらかじめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-04',
    'grammar',
    'N1',
    $$あらかじめ$$,
    $$arakajime$$,
    $$De antemão / Com antecedência / Previamente$$,
    $$あらかじめ indica que algo é feito antes de um acontecimento, como preparação. Equivale a "de antemão" ou "com antecedência".

É muito usado em avisos, instruções e no trabalho. Por exemplo, "por favor, faça a reserva com antecedência".

É mais formal que 前もって.$$,
    $$É parecido com 前もって e 事前に.

Também é escrito 予め, em kanji, mas a forma em hiragana é mais comum.

Expressões comuns são あらかじめご了承ください e あらかじめ準備する.$$,
    $$あらかじめ + Verbo$$,
    $$あらかじめ$$,
    $$あらかじめ|予め$$,
    ARRAY['あらかじめ']::text[],
    ARRAY['あらかじめ', '予め']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-04', $$参加する人は、あらかじめ予約してください。$$, $$さんかするひとは、あらかじめよやくしてください。$$, $$Quem for participar, faça a reserva com antecedência.$$),
    ('n1-grammar-04', $$あらかじめ資料を読んでおいてください。$$, $$あらかじめしりょうをよんでおいてください。$$, $$Leia os materiais de antemão.$$),
    ('n1-grammar-04', $$変更の可能性があることを、あらかじめご了承ください。$$, $$へんこうのかのうせいがあることを、あらかじめごりょうしょうください。$$, $$Pedimos sua compreensão prévia quanto à possibilidade de mudanças.$$),
    ('n1-grammar-04', $$旅行の前に、あらかじめ天気を調べた。$$, $$りょこうのまえに、あらかじめてんきをしらべた。$$, $$Antes da viagem, pesquisei o tempo com antecedência.$$),
    ('n1-grammar-04', $$質問はあらかじめ考えておこう。$$, $$しつもんはあらかじめかんがえておこう。$$, $$Vamos pensar nas perguntas de antemão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れる場合は、____連絡してください。$$, $$Em caso de atraso, avise com antecedência.$$),
        (2, $$会議の前に、____議題を決めておく。$$, $$Antes da reunião, definimos a pauta de antemão.$$),
        (3, $$____お断りしておきますが、返品はできません。$$, $$Avisamos de antemão que não é possível devolver.$$),
        (4, $$____材料を用意しておくと、料理が楽だ。$$, $$Se preparar os ingredientes previamente, cozinhar fica mais fácil.$$),
        (5, $$面接で聞かれそうなことを____練習した。$$, $$Pratiquei com antecedência o que provavelmente perguntariam na entrevista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あらかじめ$$),
        (1, $$予め$$),
        (2, $$あらかじめ$$),
        (2, $$予め$$),
        (3, $$あらかじめ$$),
        (3, $$予め$$),
        (4, $$あらかじめ$$),
        (4, $$予め$$),
        (5, $$あらかじめ$$),
        (5, $$予め$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-05 — 〜あっての
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-05',
    'grammar',
    'N1',
    $$〜あっての$$,
    $$atte no$$,
    $$Graças a / Só existe por causa de / Depende de$$,
    $$あっての indica que algo só existe ou só é possível por causa de outra coisa. Equivale a "graças a" ou "só existe por causa de".

A pessoa destaca a importância de algo que serve de base. Por exemplo, "o sucesso só existe graças ao esforço" ou "uma loja só existe por causa dos clientes".

A forma mais comum é A あっての B, que significa "B só existe porque existe A".$$,
    $$Uma expressão muito comum é お客様あっての商売, "o comércio só existe graças aos clientes".

A forma あってこそ tem um sentido parecido, "justamente por existir...".$$,
    $$Substantivo A + あっての + Substantivo B
Substantivo A + あってこそ$$,
    $$あっての$$,
    $$あっての|あってこそ$$,
    ARRAY['あって', 'の']::text[],
    ARRAY['あっての', 'あってこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-05', $$お客様あっての店です。$$, $$おきゃくさまあってのみせです。$$, $$Uma loja só existe graças aos clientes.$$),
    ('n1-grammar-05', $$健康あっての人生だ。$$, $$けんこうあってのじんせいだ。$$, $$A vida só tem sentido com saúde.$$),
    ('n1-grammar-05', $$皆さんの協力あっての成功です。$$, $$みなさんのきょうりょくあってのせいこうです。$$, $$Este sucesso só foi possível graças à cooperação de todos.$$),
    ('n1-grammar-05', $$努力あっての結果だ。$$, $$どりょくあってのけっかだ。$$, $$Este resultado é fruto do esforço.$$),
    ('n1-grammar-05', $$ファンの応援あってこそ、ここまで来られた。$$, $$ファンのおうえんあってこそ、ここまでこられた。$$, $$Só cheguei até aqui graças ao apoio dos fãs.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$選手は観客____プロだ。$$, $$Um atleta profissional só existe por causa do público.$$),
        (2, $$家族の支え____今の私です。$$, $$Sou o que sou hoje graças ao apoio da minha família.$$),
        (3, $$命____物種だ。$$, $$Sem vida, não há nada.$$),
        (4, $$会社は社員____ものだ。$$, $$Uma empresa só existe graças aos funcionários.$$),
        (5, $$信頼____関係が大切だ。$$, $$Uma relação baseada em confiança é importante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あっての$$),
        (2, $$あっての$$),
        (3, $$あっての$$),
        (4, $$あっての$$),
        (5, $$あっての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-06 — 〜ばこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-06',
    'grammar',
    'N1',
    $$〜ばこそ$$,
    $$ba koso$$,
    $$Justamente porque / É precisamente por / Só porque$$,
    $$ばこそ indica uma razão de forma muito enfática. Equivale a "justamente porque" ou "é precisamente por".

A pessoa destaca que o motivo verdadeiro de algo é aquele, muitas vezes um motivo positivo que outros podem não perceber. Por exemplo, "é justamente por amar os filhos que os pais são rígidos".

É uma expressão formal, mais comum na escrita e em discursos.$$,
    $$Costuma terminar com のだ ou のです.

É parecido com からこそ, que é mais comum na fala.$$,
    $$Verbo (forma ば) + こそ
Adjetivo い (forma ければ) + こそ
Adjetivo な / Substantivo + であれば + こそ$$,
    $$ばこそ$$,
    $$ばこそ$$,
    ARRAY['ば', 'こそ']::text[],
    ARRAY['ばこそ', 'ればこそ', 'であればこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-06', $$子供を愛していればこそ、厳しく叱るのだ。$$, $$こどもをあいしていればこそ、きびしくしかるのだ。$$, $$É justamente por amar os filhos que os pais repreendem com rigor.$$),
    ('n1-grammar-06', $$健康であればこそ、仕事も楽しめる。$$, $$けんこうであればこそ、しごともたのしめる。$$, $$É justamente por ter saúde que se consegue aproveitar o trabalho.$$),
    ('n1-grammar-06', $$あなたのことを思えばこそ、忠告するのです。$$, $$あなたのことをおもえばこそ、ちゅうこくするのです。$$, $$É justamente porque penso em você que dou este conselho.$$),
    ('n1-grammar-06', $$努力すればこそ、夢がかなうのだ。$$, $$どりょくすればこそ、ゆめがかなうのだ。$$, $$É precisamente com esforço que os sonhos se realizam.$$),
    ('n1-grammar-06', $$信頼していればこそ、この仕事を任せたのだ。$$, $$しんらいしていればこそ、このしごとをまかせたのだ。$$, $$Confiei este trabalho a você justamente porque confio em você.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族がいれ____、頑張れる。$$, $$Consigo me esforçar justamente porque tenho família.$$),
        (2, $$会社の将来を考えれ____、改革が必要なのだ。$$, $$É justamente pensando no futuro da empresa que a reforma é necessária.$$),
        (3, $$君を信じていれ____、本当のことを話すのだ。$$, $$Conto a verdade justamente porque acredito em você.$$),
        (4, $$好きであれ____、長く続けられる。$$, $$É justamente por gostar que se consegue continuar por muito tempo.$$),
        (5, $$平和であれ____、安心して暮らせる。$$, $$É justamente por haver paz que dá para viver tranquilo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばこそ$$),
        (2, $$ばこそ$$),
        (3, $$ばこそ$$),
        (4, $$ばこそ$$),
        (5, $$ばこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-07 — 〜ばそれまでだ / 〜たらそれまでだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-07',
    'grammar',
    'N1',
    $$〜ばそれまでだ / 〜たらそれまでだ$$,
    $$ba sore made da / tara sore made da$$,
    $$Se acontecer acabou / Aí não tem mais jeito / É o fim se$$,
    $$ばそれまでだ ou たらそれまでだ indica que, se algo acontecer, tudo termina ali e não há mais o que fazer. Equivale a "se acontecer, acabou" ou "aí não tem mais jeito".

Muitas vezes mostra que todo esforço ou valor anterior se perde por causa de uma única coisa. Por exemplo, "por mais que tenha dinheiro, se morrer, acabou".

O tom costuma ser de resignação ou de advertência.$$,
    $$Uma expressão comum é 死んでしまえばそれまでだ.

A forma それまでのことだ tem o mesmo sentido.

Muitas vezes vem com いくら〜ても antes, como "por mais que..., se..., acabou".$$,
    $$Verbo (forma ば) + それまでだ
Verbo (forma たら) + それまでだ$$,
    $$ばそれまでだ$$,
    $$ばそれまで|たらそれまで$$,
    ARRAY['ば', 'それまで', 'だ']::text[],
    ARRAY['ばそれまでだ', 'たらそれまでだ', 'ばそれまでのことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-07', $$いくらお金があっても、死んでしまえばそれまでだ。$$, $$いくらおかねがあっても、しんでしまえばそれまでだ。$$, $$Por mais dinheiro que tenha, se morrer, acabou.$$),
    ('n1-grammar-07', $$どんなにいい計画でも、実行しなければそれまでだ。$$, $$どんなにいいけいかくでも、じっこうしなければそれまでだ。$$, $$Por melhor que seja o plano, se não for executado, não serve de nada.$$),
    ('n1-grammar-07', $$雨が降ったらそれまでだ。$$, $$あめがふったらそれまでだ。$$, $$Se chover, aí não tem mais jeito.$$),
    ('n1-grammar-07', $$一度信用を失えばそれまでだ。$$, $$いちどしんようをうしなえばそれまでだ。$$, $$Uma vez que se perde a confiança, é o fim.$$),
    ('n1-grammar-07', $$頑張って作っても、誰も使わなかったらそれまでだ。$$, $$がんばってつくっても、だれもつかわなかったらそれまでだ。$$, $$Mesmo fazendo com esforço, se ninguém usar, acabou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どんなに練習しても、本番で失敗すれば____。$$, $$Por mais que pratique, se falhar na hora, acabou.$$),
        (2, $$せっかく買っても、壊れたら____。$$, $$Mesmo comprando, se quebrar, acabou.$$),
        (3, $$いい商品でも、売れなければ____。$$, $$Mesmo sendo um bom produto, se não vender, não serve de nada.$$),
        (4, $$説明しても、相手が聞かなかったら____。$$, $$Mesmo explicando, se a pessoa não ouvir, não tem mais jeito.$$),
        (5, $$体を壊してしまえば____。$$, $$Se você arruinar a saúde, é o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それまでだ$$),
        (1, $$それまでのことだ$$),
        (2, $$それまでだ$$),
        (2, $$それまでのことだ$$),
        (3, $$それまでだ$$),
        (3, $$それまでのことだ$$),
        (4, $$それまでだ$$),
        (4, $$それまでのことだ$$),
        (5, $$それまでだ$$),
        (5, $$それまでのことだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-08 — 〜べからず / 〜べからざる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-08',
    'grammar',
    'N1',
    $$〜べからず / 〜べからざる$$,
    $$bekarazu / bekarazaru$$,
    $$É proibido / Não se deve / Inaceitável$$,
    $$べからず indica uma proibição forte, em estilo antigo e formal. Equivale a "é proibido" ou "não se deve".

Aparece principalmente em placas, avisos e regras escritas. Por exemplo, "proibido entrar" ou "proibido pisar na grama".

べからざる vem antes de substantivos e significa "que não se deve" ou "inaceitável". Por exemplo, "um erro inaceitável".$$,
    $$É uma forma da linguagem clássica e quase não é usada na fala.

Expressões comuns são 入るべからず, 欠くべからざる e 許すべからざる.$$,
    $$Verbo (forma dicionário) + べからず
Verbo (forma dicionário) + べからざる + Substantivo
する → するべからず / すべからず$$,
    $$べからず$$,
    $$べからず|べからざる$$,
    ARRAY['べからず']::text[],
    ARRAY['べからず', 'べからざる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-08', $$関係者以外入るべからず。$$, $$かんけいしゃいがいはいるべからず。$$, $$Proibida a entrada de pessoas não autorizadas.$$),
    ('n1-grammar-08', $$芝生に入るべからず。$$, $$しばふにはいるべからず。$$, $$Proibido pisar na grama.$$),
    ('n1-grammar-08', $$それは許すべからざる行為だ。$$, $$それはゆるすべからざるこういだ。$$, $$Isso é um ato inaceitável.$$),
    ('n1-grammar-08', $$水は生活に欠くべからざるものだ。$$, $$みずはせいかつにかくべからざるものだ。$$, $$A água é algo indispensável para a vida.$$),
    ('n1-grammar-08', $$ここでたばこを吸うべからず。$$, $$ここでたばこをすうべからず。$$, $$Proibido fumar aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここにごみを捨てる____。$$, $$Proibido jogar lixo aqui.$$),
        (2, $$教師として言う____発言だ。$$, $$É uma declaração que um professor não deveria fazer.$$),
        (3, $$初心忘る____。$$, $$Não se deve esquecer o espírito do começo.$$),
        (4, $$これは欠く____条件だ。$$, $$Esta é uma condição indispensável.$$),
        (5, $$無断で写真を撮る____。$$, $$Proibido tirar fotos sem permissão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べからず$$),
        (2, $$べからざる$$),
        (3, $$べからず$$),
        (4, $$べからざる$$),
        (5, $$べからず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-09 — 〜べく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-09',
    'grammar',
    'N1',
    $$〜べく$$,
    $$beku$$,
    $$Para / A fim de / Com o objetivo de$$,
    $$べく indica o objetivo de uma ação. Equivale a "para", "a fim de" ou "com o objetivo de".

É uma forma formal e escrita, parecida com ために. Por exemplo, "para passar na prova, estudou todos os dias".

Aparece principalmente em textos, notícias e discursos.$$,
    $$A segunda parte não pode ser um pedido ou uma ordem.

A forma すべく é a mais formal para する.

É mais formal que ために e ように.$$,
    $$Verbo (forma dicionário) + べく
する → するべく / すべく$$,
    $$べく$$,
    $$べく$$,
    ARRAY['べく']::text[],
    ARRAY['べく', 'すべく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-09', $$試験に合格すべく、毎日勉強している。$$, $$しけんにごうかくすべく、まいにちべんきょうしている。$$, $$Estudo todos os dias para passar na prova.$$),
    ('n1-grammar-09', $$夢を実現するべく、彼は東京へ行った。$$, $$ゆめをじつげんするべく、かれはとうきょうへいった。$$, $$A fim de realizar seu sonho, ele foi para Tóquio.$$),
    ('n1-grammar-09', $$問題を解決すべく、会議が開かれた。$$, $$もんだいをかいけつすべく、かいぎがひらかれた。$$, $$Uma reunião foi realizada com o objetivo de resolver o problema.$$),
    ('n1-grammar-09', $$家族を守るべく、彼は必死で働いた。$$, $$かぞくをまもるべく、かれはひっしではたらいた。$$, $$Para proteger a família, ele trabalhou desesperadamente.$$),
    ('n1-grammar-09', $$新しい市場を開拓すべく、海外に支社を作った。$$, $$あたらしいしじょうをかいたくすべく、かいがいにししゃをつくった。$$, $$Para abrir um novo mercado, criaram uma filial no exterior.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝す____、選手たちは厳しい練習を続けた。$$, $$Para vencer o campeonato, os atletas continuaram com treinos duros.$$),
        (2, $$真実を知る____、彼は調査を始めた。$$, $$A fim de saber a verdade, ele começou a investigar.$$),
        (3, $$事故の原因を明らかにす____、専門家が集まった。$$, $$Especialistas se reuniram com o objetivo de esclarecer a causa do acidente.$$),
        (4, $$期待に応える____、全力を尽くします。$$, $$Para corresponder às expectativas, darei o meu melhor.$$),
        (5, $$早く帰る____、急いで仕事を終わらせた。$$, $$Para voltar cedo, terminei o trabalho às pressas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べく$$),
        (2, $$べく$$),
        (3, $$べく$$),
        (4, $$べく$$),
        (5, $$べく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-10 — 〜べくもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-10',
    'grammar',
    'N1',
    $$〜べくもない$$,
    $$beku mo nai$$,
    $$Não há como / É impossível / Nem dá para$$,
    $$べくもない indica que algo é totalmente impossível ou que não há nem possibilidade de acontecer. Equivale a "não há como" ou "é impossível".

Costuma vir com verbos como saber, comparar, esperar e desejar. Por exemplo, "não há como saber a verdade" ou "nem dá para comparar".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 知るべくもない, 望むべくもない e 比べるべくもない.

Na fala, usa-se mais ようがない ou はずがない.$$,
    $$Verbo (forma dicionário) + べくもない
する → するべくもない / すべくもない$$,
    $$べくもない$$,
    $$べくもない|べくもなかった|べくもありません$$,
    ARRAY['べく', 'も', 'ない']::text[],
    ARRAY['べくもない', 'べくもなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-10', $$彼の本当の気持ちは知るべくもない。$$, $$かれのほんとうのきもちはしるべくもない。$$, $$Não há como saber o que ele realmente sente.$$),
    ('n1-grammar-10', $$プロの選手とは比べるべくもない。$$, $$プロのせんしゅとはくらべるべくもない。$$, $$Nem dá para comparar com um atleta profissional.$$),
    ('n1-grammar-10', $$今の給料では、家を買うことなど望むべくもない。$$, $$いまのきゅうりょうでは、いえをかうことなどのぞむべくもない。$$, $$Com o salário atual, comprar uma casa é impossível.$$),
    ('n1-grammar-10', $$その時の私には、彼の苦しみなど知るべくもなかった。$$, $$そのときのわたしには、かれのくるしみなどしるべくもなかった。$$, $$Naquela época, não havia como eu saber do sofrimento dele.$$),
    ('n1-grammar-10', $$これ以上の結果は望むべくもない。$$, $$これいじょうのけっかはのぞむべくもない。$$, $$Não dá para esperar resultado melhor que este.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供の私には、親の苦労など知る____。$$, $$Para mim, criança, não havia como saber do sofrimento dos meus pais.$$),
        (2, $$このチームでは優勝など望む____。$$, $$Com este time, vencer o campeonato é impossível.$$),
        (3, $$本物とは比べる____。$$, $$Nem dá para comparar com o original.$$),
        (4, $$その事実を確かめる____。$$, $$Não há como confirmar esse fato.$$),
        (5, $$彼の才能には、私など及ぶ____。$$, $$Alguém como eu não tem como alcançar o talento dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べくもなかった$$),
        (2, $$べくもない$$),
        (3, $$べくもない$$),
        (4, $$べくもない$$),
        (5, $$べくもない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-11 — 〜べくして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-11',
    'grammar',
    'N1',
    $$〜べくして$$,
    $$beku shite$$,
    $$Como era inevitável / Tinha que acontecer / Naturalmente$$,
    $$べくして indica que algo aconteceu porque era inevitável ou natural que acontecesse. Equivale a "como era inevitável" ou "tinha que acontecer".

A estrutura repete o mesmo verbo, como 起こるべくして起こった, "aconteceu porque tinha que acontecer". A pessoa mostra que havia motivos claros para o resultado.

É uma expressão formal e literária.$$,
    $$Expressões comuns são 起こるべくして起こった, 勝つべくして勝った e 負けるべくして負けた.

O resultado pode ser bom ou ruim, mas sempre é visto como inevitável.$$,
    $$Verbo (forma dicionário) + べくして + Mesmo verbo (forma た)$$,
    $$べくして$$,
    $$べくして$$,
    ARRAY['べく', 'して']::text[],
    ARRAY['べくして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-11', $$この事故は起こるべくして起こった。$$, $$このじこはおこるべくしておこった。$$, $$Este acidente aconteceu porque tinha que acontecer.$$),
    ('n1-grammar-11', $$あれだけ練習したチームだから、勝つべくして勝った。$$, $$あれだけれんしゅうしたチームだから、かつべくしてかった。$$, $$Era um time que treinou muito, então venceu como era inevitável.$$),
    ('n1-grammar-11', $$準備不足で、負けるべくして負けた。$$, $$じゅんびぶそくで、まけるべくしてまけた。$$, $$Por falta de preparo, perdemos como era de esperar.$$),
    ('n1-grammar-11', $$二人は出会うべくして出会ったのだ。$$, $$ふたりはであうべくしてであったのだ。$$, $$Os dois se conheceram porque estava destinado.$$),
    ('n1-grammar-11', $$彼は成功すべくして成功した。$$, $$かれはせいこうすべくしてせいこうした。$$, $$Ele teve sucesso porque naturalmente tinha que ter.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$安全対策をしていなかったので、事故は起こる____起こった。$$, $$Como não havia medidas de segurança, o acidente aconteceu porque tinha que acontecer.$$),
        (2, $$彼女の才能なら、合格す____合格した。$$, $$Com o talento dela, passou como era inevitável.$$),
        (3, $$あの会社は倒産す____倒産した。$$, $$Aquela empresa faliu porque tinha que falir.$$),
        (4, $$この発明は生まれる____生まれた。$$, $$Esta invenção surgiu porque naturalmente tinha que surgir.$$),
        (5, $$油断していたので、負ける____負けた。$$, $$Como nos descuidamos, perdemos como era de esperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べくして$$),
        (2, $$べくして$$),
        (3, $$べくして$$),
        (4, $$べくして$$),
        (5, $$べくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-12 — 〜びる / 〜びて / 〜びた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-12',
    'grammar',
    'N1',
    $$〜びる / 〜びて / 〜びた$$,
    $$biru / bite / bita$$,
    $$Parecer / Ter ar de / Com jeito de$$,
    $$びる é um sufixo que transforma substantivos ou adjetivos em verbos, indicando que algo tem a aparência ou o comportamento de algo. Equivale a "parecer" ou "ter ar de".

Por exemplo, 大人びる significa "ter jeito de adulto", e 古びる significa "parecer velho".

Na prática, aparece principalmente nas formas びた, antes de substantivos, e びて, no meio da frase.$$,
    $$Só funciona com algumas palavras fixas, como 大人びる, 古びる, 田舎びる e 鄙びる.

É parecido com らしい e めく, mas びる indica que a aparência mudou com o tempo ou que é natural.$$,
    $$Substantivo / Adjetivo (raiz) + びる
Substantivo / Adjetivo (raiz) + びた + Substantivo
Substantivo / Adjetivo (raiz) + びて$$,
    $$びる$$,
    $$びる|びた|びて$$,
    ARRAY['びる']::text[],
    ARRAY['びる', 'びた', 'びて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-12', $$彼女は年の割に大人びている。$$, $$かのじょはとしのわりにおとなびている。$$, $$Ela tem jeito de adulta para a idade que tem.$$),
    ('n1-grammar-12', $$古びた家に一人で住んでいる。$$, $$ふるびたいえにひとりですんでいる。$$, $$Mora sozinho numa casa com ar de velha.$$),
    ('n1-grammar-12', $$大人びた口調で話す子供だ。$$, $$おとなびたくちょうではなすこどもだ。$$, $$É uma criança que fala num tom de adulto.$$),
    ('n1-grammar-12', $$その建物はすっかり古びてしまった。$$, $$そのたてものはすっかりふるびてしまった。$$, $$Aquele prédio ficou completamente envelhecido.$$),
    ('n1-grammar-12', $$ひなびた温泉町でゆっくり休んだ。$$, $$ひなびたおんせんまちでゆっくりやすんだ。$$, $$Descansei com calma numa cidade termal com ar rústico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$中学生なのに、大人____顔をしている。$$, $$Apesar de ser do ensino fundamental, tem cara de adulto.$$),
        (2, $$古____本棚に、たくさんの本が並んでいた。$$, $$Numa estante com ar de velha, havia muitos livros enfileirados.$$),
        (3, $$娘は最近ずいぶん大人____きた。$$, $$Minha filha tem ficado com muito mais jeito de adulta ultimamente.$$),
        (4, $$ひな____村に旅行した。$$, $$Viajei para uma vila com ar rústico.$$),
        (5, $$その写真はすっかり古____いた。$$, $$Aquela foto estava completamente envelhecida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$びた$$),
        (2, $$びた$$),
        (3, $$びて$$),
        (4, $$びた$$),
        (5, $$びて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-13 — 〜ぶり / 〜っぷり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-13',
    'grammar',
    'N1',
    $$〜ぶり / 〜っぷり$$,
    $$buri / ppuri$$,
    $$Jeito de / Modo de / Depois de tanto tempo$$,
    $$ぶり tem dois usos principais.

O primeiro, depois de substantivos ou da raiz de verbos, indica o modo ou a maneira como alguém faz algo. Equivale a "jeito de" ou "modo de". Por exemplo, "o jeito de trabalhar dele" ou "o jeito de comer". A forma っぷり é mais coloquial e enfática, como em 食べっぷり.

O segundo, depois de expressões de tempo, indica que algo acontece de novo depois de um certo tempo. Equivale a "depois de tanto tempo". Por exemplo, "nos vimos depois de cinco anos".$$,
    $$Expressões comuns são 仕事ぶり, 話しぶり, 食べっぷり, 飲みっぷり e 久しぶり.

A forma っぷり costuma elogiar algo feito com vontade.$$,
    $$Substantivo / Verbo (forma ます sem ます) + ぶり / っぷり
Período de tempo + ぶり (depois de tanto tempo)$$,
    $$ぶり$$,
    $$ぶり|っぷり$$,
    ARRAY['ぶり']::text[],
    ARRAY['ぶり', 'っぷり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-13', $$彼の仕事ぶりは素晴らしい。$$, $$かれのしごとぶりはすばらしい。$$, $$O jeito de trabalhar dele é excelente.$$),
    ('n1-grammar-13', $$五年ぶりに友達に会った。$$, $$ごねんぶりにともだちにあった。$$, $$Encontrei um amigo depois de cinco anos.$$),
    ('n1-grammar-13', $$彼の食べっぷりを見ていると、気持ちがいい。$$, $$かれのたべっぷりをみていると、きもちがいい。$$, $$Dá gosto ver o jeito como ele come.$$),
    ('n1-grammar-13', $$あの話しぶりからすると、彼は何か知っている。$$, $$あのはなしぶりからすると、かれはなにかしっている。$$, $$Pelo jeito como ele fala, sabe de alguma coisa.$$),
    ('n1-grammar-13', $$久しぶりに映画を見た。$$, $$ひさしぶりにえいがをみた。$$, $$Vi um filme depois de muito tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$十年____に故郷に帰った。$$, $$Voltei à minha terra natal depois de dez anos.$$),
        (2, $$彼女の生活____は質素だ。$$, $$O modo de vida dela é simples.$$),
        (3, $$気持ちのいい飲み____だね。$$, $$Que jeito animado de beber, hein.$$),
        (4, $$社長は新人の働き____を褒めた。$$, $$O presidente elogiou o jeito de trabalhar do novato.$$),
        (5, $$三日____に雨がやんだ。$$, $$A chuva parou depois de três dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶり$$),
        (2, $$ぶり$$),
        (3, $$っぷり$$),
        (4, $$ぶり$$),
        (5, $$ぶり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-14 — 〜ぶる / 〜ぶって / 〜ぶった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-14',
    'grammar',
    'N1',
    $$〜ぶる / 〜ぶって / 〜ぶった$$,
    $$buru / butte / butta$$,
    $$Fingir ser / Bancar o / Dar uma de$$,
    $$ぶる indica que alguém finge ter uma qualidade ou age como se fosse algo que não é. Equivale a "fingir ser", "bancar o" ou "dar uma de".

O tom é de crítica, porque a pessoa age de forma falsa ou exagerada. Por exemplo, "bancar o inteligente" ou "fingir ser uma boa pessoa".

As formas ぶって e ぶった são as mais usadas.$$,
    $$Expressões comuns são 偉ぶる, いい子ぶる, 学者ぶる, 上品ぶる e もったいぶる.

É parecido com ふりをする, mas ぶる tem um tom mais crítico.$$,
    $$Substantivo / Adjetivo (raiz) + ぶる
Substantivo / Adjetivo (raiz) + ぶって + Verbo
Substantivo / Adjetivo (raiz) + ぶった + Substantivo$$,
    $$ぶる$$,
    $$ぶる|ぶって|ぶった|ぶらない$$,
    ARRAY['ぶる']::text[],
    ARRAY['ぶる', 'ぶって', 'ぶった', 'ぶらない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-14', $$彼はいつも偉ぶっている。$$, $$かれはいつもえらぶっている。$$, $$Ele vive bancando o importante.$$),
    ('n1-grammar-14', $$先生の前でだけ、いい子ぶる。$$, $$せんせいのまえでだけ、いいこぶる。$$, $$Só na frente do professor ele dá uma de bonzinho.$$),
    ('n1-grammar-14', $$学者ぶった話し方が嫌いだ。$$, $$がくしゃぶったはなしかたがきらいだ。$$, $$Não gosto desse jeito de falar como se fosse um acadêmico.$$),
    ('n1-grammar-14', $$もったいぶらないで、早く教えてよ。$$, $$もったいぶらないで、はやくおしえてよ。$$, $$Não faça suspense, conte logo.$$),
    ('n1-grammar-14', $$彼女は上品ぶって、ゆっくり食べた。$$, $$かのじょはじょうひんぶって、ゆっくりたべた。$$, $$Ela comeu devagar, fingindo ser refinada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新人なのに、先輩____態度をとる。$$, $$Mesmo sendo novato, age como se fosse veterano.$$),
        (2, $$知らないのに、知っている____話すな。$$, $$Não fale como se soubesse se você não sabe.$$),
        (3, $$彼は金持ち____いるが、実はお金がない。$$, $$Ele banca o rico, mas na verdade não tem dinheiro.$$),
        (4, $$もったい____で、早く言いなさい。$$, $$Pare de fazer suspense e diga logo.$$),
        (5, $$いい人____のはやめたほうがいい。$$, $$É melhor parar de dar uma de boa pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぶった$$),
        (2, $$ぶって$$),
        (3, $$ぶって$$),
        (4, $$ぶらない$$),
        (5, $$ぶる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-15 — 〜だに / 〜だにしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-15',
    'grammar',
    'N1',
    $$〜だに / 〜だにしない$$,
    $$dani / dani shinai$$,
    $$Só de / Nem sequer / Nem mesmo$$,
    $$だに tem dois usos principais.

O primeiro vem depois de verbos como pensar, imaginar e ouvir, e significa "só de...". Indica que só de pensar em algo já surge um sentimento forte, geralmente de medo. Por exemplo, "só de imaginar, já fico com medo".

O segundo, na forma だにしない, significa "nem sequer" ou "nem mesmo". Por exemplo, "ele nem sequer se mexeu" ou "algo que ninguém sequer imaginava".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 想像するだに恐ろしい, 考えるだに, 微動だにしない e 夢にだに思わない.

É parecido com だけで e さえ, mas é bem mais formal.$$,
    $$Verbo (forma dicionário) + だに + Sentimento
Substantivo + だにしない
Substantivo + だに + Verbo (forma negativa)$$,
    $$だに$$,
    $$だに$$,
    ARRAY['だに']::text[],
    ARRAY['だに', 'だにしない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-15', $$地震のことは、想像するだに恐ろしい。$$, $$じしんのことは、そうぞうするだにおそろしい。$$, $$Só de imaginar um terremoto, já fico com medo.$$),
    ('n1-grammar-15', $$兵士は微動だにしなかった。$$, $$へいしはびどうだにしなかった。$$, $$O soldado nem sequer se mexeu.$$),
    ('n1-grammar-15', $$こんな結果になるとは、予想だにしなかった。$$, $$こんなけっかになるとは、よそうだにしなかった。$$, $$Nem sequer imaginava que daria neste resultado.$$),
    ('n1-grammar-15', $$考えるだにぞっとする。$$, $$かんがえるだにぞっとする。$$, $$Só de pensar, já me dá arrepios.$$),
    ('n1-grammar-15', $$夢にだに思わなかった成功だ。$$, $$ゆめにだにおもわなかったせいこうだ。$$, $$É um sucesso que nem em sonho eu imaginava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の場面は、思い出す____恐ろしい。$$, $$Só de lembrar da cena do acidente, fico com medo.$$),
        (2, $$彼は一顧____しなかった。$$, $$Ele nem sequer deu atenção.$$),
        (3, $$優勝できるとは想像____しなかった。$$, $$Nem sequer imaginava que conseguiria vencer.$$),
        (4, $$聞く____恐ろしい話だ。$$, $$É uma história assustadora só de ouvir.$$),
        (5, $$彼女は一言____話さなかった。$$, $$Ela não disse nem sequer uma palavra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だに$$),
        (2, $$だに$$),
        (3, $$だに$$),
        (4, $$だに$$),
        (5, $$だに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-16 — 〜だの〜だの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-16',
    'grammar',
    'N1',
    $$〜だの〜だの$$,
    $$dano ~ dano$$,
    $$Que isso... que aquilo / Entre... e / Isso e aquilo$$,
    $$だの〜だの serve para listar exemplos, geralmente de coisas que alguém diz ou reclama. Equivale a "que isso..., que aquilo..." ou "isso e aquilo".

O tom costuma ser negativo, de reclamação ou irritação, mostrando que havia muitas coisas incômodas. Por exemplo, "ele fica dizendo que está cansado, que está com fome, e não trabalha".

É uma expressão coloquial.$$,
    $$É parecido com とか〜とか e やら〜やら, mas だの〜だの tem um tom mais negativo.

Muitas vezes vem com verbos como 言う, 文句を言う ou うるさい.$$,
    $$Substantivo + だの + Substantivo + だの
Verbo / Adjetivo (forma simples) + だの + Verbo / Adjetivo + だの$$,
    $$だの〜だの$$,
    $$だの$$,
    ARRAY['だの']::text[],
    ARRAY['だの〜だの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-16', $$彼は疲れただの、お腹がすいただの言って、全然働かない。$$, $$かれはつかれただの、おなかがすいただのいって、ぜんぜんはたらかない。$$, $$Ele fica dizendo que está cansado, que está com fome, e não trabalha nada.$$),
    ('n1-grammar-16', $$母は勉強しろだの、早く寝ろだの、うるさい。$$, $$はははべんきょうしろだの、はやくねろだの、うるさい。$$, $$Minha mãe fica enchendo: estude, vá dormir cedo.$$),
    ('n1-grammar-16', $$部屋には本だの服だのが散らかっている。$$, $$へやにはほんだのふくだのがちらかっている。$$, $$O quarto está bagunçado com livros e roupas.$$),
    ('n1-grammar-16', $$高いだの遠いだのと文句ばかり言う。$$, $$たかいだのとおいだのともんくばかりいう。$$, $$Só reclama que é caro, que é longe.$$),
    ('n1-grammar-16', $$引っ越しだの仕事だので、毎日忙しい。$$, $$ひっこしだのしごとだので、まいにちいそがしい。$$, $$Entre mudança e trabalho, estou ocupado todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供は、おもちゃを買ってだの、ゲームがほしい____と言う。$$, $$A criança fica pedindo: compra brinquedo, quero videogame.$$),
        (2, $$暑いだの寒い____と、彼はいつも文句を言っている。$$, $$Ele vive reclamando que está quente, que está frio.$$),
        (3, $$机の上にはペン____ノートだのが置いてある。$$, $$Na mesa há canetas, cadernos e coisas assim.$$),
        (4, $$つまらないだの、長い____、みんな映画の悪口を言った。$$, $$Todos falaram mal do filme: que era chato, que era longo.$$),
        (5, $$会議だの出張____で、休む暇がない。$$, $$Entre reuniões e viagens de negócios, não tenho tempo para descansar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だの$$),
        (2, $$だの$$),
        (3, $$だの$$),
        (4, $$だの$$),
        (5, $$だの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-17 — 〜だろうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-17',
    'grammar',
    'N1',
    $$〜だろうに$$,
    $$darou ni$$,
    $$Teria sido / Provavelmente / Deve ser... mas$$,
    $$だろうに expressa uma suposição junto com um sentimento de pena, lamento ou empatia. Equivale a "teria sido..." ou "deve ser..., mas".

Tem dois usos comuns. O primeiro é imaginar uma situação diferente da real, com arrependimento, como "se tivesse estudado, teria passado". O segundo é imaginar o sentimento de outra pessoa com empatia, como "deve estar cansado, mas continua trabalhando".$$,
    $$Muitas vezes vem com ば ou たら, para falar de algo que não aconteceu.

É parecido com のに, mas だろうに inclui suposição.$$,
    $$Verbo / Adjetivo (forma simples) + だろうに
Frase com ば / たら + だろうに$$,
    $$だろうに$$,
    $$だろうに|でしょうに$$,
    ARRAY['だろう', 'に']::text[],
    ARRAY['だろうに', 'でしょうに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-17', $$もっと勉強していれば、合格できただろうに。$$, $$もっとべんきょうしていれば、ごうかくできただろうに。$$, $$Se tivesse estudado mais, teria passado.$$),
    ('n1-grammar-17', $$疲れているだろうに、彼は笑顔で働いている。$$, $$つかれているだろうに、かれはえがおではたらいている。$$, $$Ele deve estar cansado, mas trabalha sorrindo.$$),
    ('n1-grammar-17', $$言ってくれれば、手伝ったでしょうに。$$, $$いってくれれば、てつだったでしょうに。$$, $$Se tivesse me dito, eu teria ajudado.$$),
    ('n1-grammar-17', $$寒いだろうに、子供たちは外で遊んでいる。$$, $$さむいだろうに、こどもたちはそとであそんでいる。$$, $$Deve estar frio, mas as crianças estão brincando lá fora.$$),
    ('n1-grammar-17', $$早く出ていれば、間に合っただろうに。$$, $$はやくでていれば、まにあっただろうに。$$, $$Se tivesse saído mais cedo, teria dado tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$忙しい____、わざわざ来てくれてありがとう。$$, $$Você deve estar ocupado, obrigado por ter vindo mesmo assim.$$),
        (2, $$一言謝れば、許してもらえた____。$$, $$Se tivesse pedido desculpas, teria sido perdoado.$$),
        (3, $$辛かった____、彼女は何も言わなかった。$$, $$Deve ter sido duro, mas ela não disse nada.$$),
        (4, $$もう少し安ければ、買った____。$$, $$Se fosse um pouco mais barato, eu teria comprado.$$),
        (5, $$知っていれば、教えてあげた____。$$, $$Se eu soubesse, teria te contado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だろうに$$),
        (1, $$でしょうに$$),
        (2, $$だろうに$$),
        (2, $$でしょうに$$),
        (3, $$だろうに$$),
        (3, $$でしょうに$$),
        (4, $$だろうに$$),
        (4, $$でしょうに$$),
        (5, $$だろうに$$),
        (5, $$でしょうに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-18 — 〜であれ / 〜であろうと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-18',
    'grammar',
    'N1',
    $$〜であれ / 〜であろうと$$,
    $$de are / de arou to$$,
    $$Seja qual for / Mesmo que seja / Não importa se$$,
    $$であれ e であろうと indicam que, seja qual for a situação, o resultado ou a conclusão não muda. Equivale a "seja qual for" ou "mesmo que seja".

Costumam vir com palavras interrogativas, como 誰, 何 e どんな, ou com substantivos. Por exemplo, "seja quem for, regras são regras" ou "mesmo que seja criança, tem que pedir desculpas".

É uma expressão formal.$$,
    $$É parecido com でも, mas であれ é mais formal.

A forma であっても tem um sentido muito próximo.$$,
    $$Substantivo + であれ / であろうと
Palavra interrogativa + であれ / であろうと$$,
    $$であれ$$,
    $$であれ|であろうと|であろうが$$,
    ARRAY['で', 'あれ']::text[],
    ARRAY['であれ', 'であろうと', 'であろうが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-18', $$誰であれ、ルールは守らなければならない。$$, $$だれであれ、ルールはまもらなければならない。$$, $$Seja quem for, é preciso seguir as regras.$$),
    ('n1-grammar-18', $$子供であろうと、悪いことをしたら謝るべきだ。$$, $$こどもであろうと、わるいことをしたらあやまるべきだ。$$, $$Mesmo que seja criança, se fez algo errado, deve pedir desculpas.$$),
    ('n1-grammar-18', $$どんな理由であれ、暴力は許されない。$$, $$どんなりゆうであれ、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n1-grammar-18', $$仕事が何であろうと、一生懸命やることが大切だ。$$, $$しごとがなんであろうと、いっしょうけんめいやることがたいせつだ。$$, $$Não importa qual seja o trabalho, o importante é se dedicar.$$),
    ('n1-grammar-18', $$たとえ社長であれ、間違いは間違いだ。$$, $$たとえしゃちょうであれ、まちがいはまちがいだ。$$, $$Mesmo que seja o presidente, erro é erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$相手が誰____、態度を変えるべきではない。$$, $$Seja quem for o outro, não se deve mudar de atitude.$$),
        (2, $$どんな結果____、受け入れるつもりだ。$$, $$Seja qual for o resultado, pretendo aceitar.$$),
        (3, $$たとえ冗談____、言ってはいけないことがある。$$, $$Mesmo que seja brincadeira, há coisas que não se deve dizer.$$),
        (4, $$理由が何____、遅刻は遅刻だ。$$, $$Não importa o motivo, atraso é atraso.$$),
        (5, $$プロ____、失敗することはある。$$, $$Mesmo um profissional às vezes erra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$であれ$$),
        (1, $$であろうと$$),
        (1, $$であろうが$$),
        (2, $$であれ$$),
        (2, $$であろうと$$),
        (2, $$であろうが$$),
        (3, $$であれ$$),
        (3, $$であろうと$$),
        (3, $$であろうが$$),
        (4, $$であれ$$),
        (4, $$であろうと$$),
        (4, $$であろうが$$),
        (5, $$であれ$$),
        (5, $$であろうと$$),
        (5, $$であろうが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-19 — 〜であれ〜であれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-19',
    'grammar',
    'N1',
    $$〜であれ〜であれ$$,
    $$de are ~ de are$$,
    $$Seja... seja / Quer... quer / Tanto... quanto$$,
    $$であれ〜であれ apresenta dois exemplos e mostra que, em qualquer um dos casos, a conclusão é a mesma. Equivale a "seja... seja" ou "quer... quer".

Por exemplo, "seja homem, seja mulher, todos têm os mesmos direitos" ou "seja de dia, seja de noite, ele trabalha".

É uma expressão formal, comum na escrita.$$,
    $$É parecido com にしろ〜にしろ e にせよ〜にせよ, mas であれ〜であれ só vem depois de substantivos.

Os dois elementos costumam ser opostos ou do mesmo grupo.$$,
    $$Substantivo + であれ + Substantivo + であれ$$,
    $$であれ〜であれ$$,
    $$であれ$$,
    ARRAY['で', 'あれ']::text[],
    ARRAY['であれ〜であれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-19', $$男性であれ女性であれ、同じ権利がある。$$, $$だんせいであれじょせいであれ、おなじけんりがある。$$, $$Seja homem, seja mulher, todos têm os mesmos direitos.$$),
    ('n1-grammar-19', $$晴れであれ雨であれ、試合は行われる。$$, $$はれであれあめであれ、しあいはおこなわれる。$$, $$Com sol ou com chuva, a partida será realizada.$$),
    ('n1-grammar-19', $$大人であれ子供であれ、命の重さは同じだ。$$, $$おとなであれこどもであれ、いのちのおもさはおなじだ。$$, $$Seja adulto, seja criança, o valor da vida é o mesmo.$$),
    ('n1-grammar-19', $$日本人であれ外国人であれ、ルールは守ること。$$, $$にほんじんであれがいこくじんであれ、ルールはまもること。$$, $$Seja japonês, seja estrangeiro, siga as regras.$$),
    ('n1-grammar-19', $$成功であれ失敗であれ、経験は財産になる。$$, $$せいこうであれしっぱいであれ、けいけんはざいさんになる。$$, $$Seja sucesso, seja fracasso, a experiência vira patrimônio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昼____夜であれ、彼は働き続けている。$$, $$De dia ou de noite, ele continua trabalhando.$$),
        (2, $$賛成であれ反対____、意見を述べてください。$$, $$A favor ou contra, dê a sua opinião.$$),
        (3, $$肉____魚であれ、新鮮なものを選ぶべきだ。$$, $$Seja carne, seja peixe, deve-se escolher o que é fresco.$$),
        (4, $$学生であれ社会人____、学ぶことは大切だ。$$, $$Seja estudante, seja trabalhador, aprender é importante.$$),
        (5, $$金持ち____貧乏であれ、幸せになる権利がある。$$, $$Seja rico, seja pobre, todos têm direito à felicidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$であれ$$),
        (2, $$であれ$$),
        (3, $$であれ$$),
        (4, $$であれ$$),
        (5, $$であれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-20 — 〜でもあり〜でもある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-20',
    'grammar',
    'N1',
    $$〜でもあり〜でもある$$,
    $$demo ari ~ demo aru$$,
    $$É tanto... quanto / É ao mesmo tempo... e / É também$$,
    $$でもあり〜でもある indica que algo ou alguém tem duas características ao mesmo tempo. Equivale a "é tanto... quanto" ou "é ao mesmo tempo... e".

As duas características podem ser parecidas ou opostas. Por exemplo, "ele é professor e também pesquisador" ou "é uma alegria e, ao mesmo tempo, uma tristeza".

É uma expressão um pouco formal.$$,
    $$Com adjetivos い, a forma é くもあり〜くもある, como うれしくもあり寂しくもある.

É parecido com と同時に.$$,
    $$Substantivo / Adjetivo な + でもあり + Substantivo / Adjetivo な + でもある$$,
    $$でもあり〜でもある$$,
    $$でもあり|でもある|くもあり$$,
    ARRAY['でも', 'あり', 'でも', 'ある']::text[],
    ARRAY['でもあり〜でもある', 'くもあり〜くもある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-20', $$彼は教師でもあり、研究者でもある。$$, $$かれはきょうしでもあり、けんきゅうしゃでもある。$$, $$Ele é professor e também pesquisador.$$),
    ('n1-grammar-20', $$子供の卒業はうれしくもあり、寂しくもある。$$, $$こどものそつぎょうはうれしくもあり、さびしくもある。$$, $$A formatura do filho é ao mesmo tempo uma alegria e uma tristeza.$$),
    ('n1-grammar-20', $$この仕事は大変でもあり、楽しくもある。$$, $$このしごとはたいへんでもあり、たのしくもある。$$, $$Este trabalho é tanto difícil quanto divertido.$$),
    ('n1-grammar-20', $$彼女は母親でもあり、社長でもある。$$, $$かのじょはははおやでもあり、しゃちょうでもある。$$, $$Ela é mãe e também presidente de empresa.$$),
    ('n1-grammar-20', $$この町は便利でもあり、静かでもある。$$, $$このまちはべんりでもあり、しずかでもある。$$, $$Esta cidade é prática e, ao mesmo tempo, tranquila.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は歌手____、俳優でもある。$$, $$Ele é cantor e também ator.$$),
        (2, $$この経験は苦しく____、楽しくもあった。$$, $$Esta experiência foi tanto dolorosa quanto divertida.$$),
        (3, $$彼女は私の先輩でもあり、親友____。$$, $$Ela é minha veterana e também minha melhor amiga.$$),
        (4, $$この料理は簡単でもあり、健康的____。$$, $$Este prato é fácil e, ao mesmo tempo, saudável.$$),
        (5, $$医者____、作家でもある人物だ。$$, $$É uma pessoa que é médico e também escritor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でもあり$$),
        (2, $$もあり$$),
        (3, $$でもある$$),
        (4, $$でもある$$),
        (5, $$でもあり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-21 — 〜でも何でもない / 〜くも何ともない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-21',
    'grammar',
    'N1',
    $$〜でも何でもない / 〜くも何ともない$$,
    $$demo nandemo nai / kumo nantomo nai$$,
    $$Não é nada disso / Nem um pouco / De jeito nenhum$$,
    $$でも何でもない e くも何ともない negam algo com muita força. Equivalem a "não é nada disso" ou "nem um pouco".

でも何でもない vem depois de substantivos e adjetivos な. Por exemplo, "ele não é meu amigo nem nada" ou "isso não é nada estranho".

くも何ともない vem depois de adjetivos い. Por exemplo, "não está nem um pouco difícil" ou "não dói nada".

O tom é enfático e muitas vezes um pouco irritado.$$,
    $$Expressões comuns são 友達でも何でもない, 痛くも何ともない e 怖くも何ともない.

É mais forte que ではない ou くない.$$,
    $$Substantivo / Adjetivo な + でも何でもない
Adjetivo い (sem い) + くも何ともない$$,
    $$でも何でもない$$,
    $$でも何でもない|でもなんでもない|くも何ともない|くもなんともない|でも何でもありません|くも何ともありません$$,
    ARRAY['でも', '何でも', 'ない']::text[],
    ARRAY['でも何でもない', 'くも何ともない', 'でも何でもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-21', $$彼は友達でも何でもない。$$, $$かれはともだちでもなんでもない。$$, $$Ele não é meu amigo nem nada.$$),
    ('n1-grammar-21', $$こんな傷、痛くも何ともない。$$, $$こんなきず、いたくもなんともない。$$, $$Um machucado desses não dói nada.$$),
    ('n1-grammar-21', $$そんなことは秘密でも何でもない。$$, $$そんなことはひみつでもなんでもない。$$, $$Isso não é segredo nenhum.$$),
    ('n1-grammar-21', $$この程度の寒さは、つらくも何ともない。$$, $$このていどのさむさは、つらくもなんともない。$$, $$Um frio desses não é nem um pouco difícil.$$),
    ('n1-grammar-21', $$彼の意見は特別でも何でもありません。$$, $$かれのいけんはとくべつでもなんでもありません。$$, $$A opinião dele não tem nada de especial.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あんな映画、面白____。$$, $$Aquele filme não tem graça nenhuma.$$),
        (2, $$彼女は恋人____。ただの同僚だ。$$, $$Ela não é minha namorada nem nada. É só uma colega.$$),
        (3, $$一人で住むのは寂し____。$$, $$Morar sozinho não é nem um pouco solitário.$$),
        (4, $$その話は冗談____。本当のことだ。$$, $$Isso não é brincadeira nenhuma. É verdade.$$),
        (5, $$こんな問題、難し____よ。$$, $$Um problema desses não é nada difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くも何ともない$$),
        (1, $$くもなんともない$$),
        (2, $$でも何でもない$$),
        (2, $$でもなんでもない$$),
        (3, $$くも何ともない$$),
        (3, $$くもなんともない$$),
        (4, $$でも何でもない$$),
        (4, $$でもなんでもない$$),
        (5, $$くも何ともない$$),
        (5, $$くもなんともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-22 — 〜でなくてなんだろう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-22',
    'grammar',
    'N1',
    $$〜でなくてなんだろう$$,
    $$de nakute nan darou$$,
    $$Se isso não é... o que é / Isso só pode ser / Não há outra palavra senão$$,
    $$でなくてなんだろう é uma pergunta retórica que afirma algo com muita força. Equivale a "se isso não é..., então o que é?" ou "isso só pode ser...".

A pessoa expressa uma emoção forte ou uma convicção, dizendo que não há outra palavra para descrever aquela situação. Por exemplo, "se isso não é amor, o que é?".

É uma expressão literária, usada em textos, discursos e falas emotivas.$$,
    $$A forma でなくてなんであろう é ainda mais formal.

Costuma vir com palavras abstratas, como 愛, 奇跡, 運命 ou 犯罪.$$,
    $$Substantivo + でなくてなんだろう
Substantivo + でなくてなんであろう$$,
    $$でなくてなんだろう$$,
    $$でなくてなんだろう|でなくてなんであろう|でなくて何だろう|でなくて何であろう$$,
    ARRAY['で', 'なくて', 'なん', 'だろう']::text[],
    ARRAY['でなくてなんだろう', 'でなくてなんであろう', 'でなくて何だろう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-22', $$これが愛でなくてなんだろう。$$, $$これがあいでなくてなんだろう。$$, $$Se isso não é amor, o que é?$$),
    ('n1-grammar-22', $$あの状況で助かったのは、奇跡でなくてなんだろう。$$, $$あのじょうきょうでたすかったのは、きせきでなくてなんだろう。$$, $$Ter sobrevivido naquela situação só pode ser um milagre.$$),
    ('n1-grammar-22', $$二人の出会いは運命でなくてなんであろう。$$, $$ふたりのであいはうんめいでなくてなんであろう。$$, $$Se o encontro dos dois não é destino, o que é?$$),
    ('n1-grammar-22', $$子供を守るために命をかける。これが親の愛でなくて何だろう。$$, $$こどもをまもるためにいのちをかける。これがおやのあいでなくてなんだろう。$$, $$Arriscar a vida para proteger o filho. Se isso não é amor de pai, o que é?$$),
    ('n1-grammar-22', $$弱い人をだますのは、犯罪でなくてなんだろう。$$, $$よわいひとをだますのは、はんざいでなくてなんだろう。$$, $$Enganar os mais fracos, se isso não é crime, o que é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この発見が偉業____。$$, $$Se esta descoberta não é uma grande conquista, o que é?$$),
        (2, $$十年ぶりに偶然再会するなんて、運命____。$$, $$Se reencontrar alguém por acaso depois de dez anos não é destino, o que é?$$),
        (3, $$これが友情____。$$, $$Se isso não é amizade, o que é?$$),
        (4, $$無事に戻れたのは、幸運____。$$, $$Ter voltado em segurança só pode ser sorte.$$),
        (5, $$自然を壊すのは、人間のおごり____。$$, $$Destruir a natureza, se isso não é arrogância humana, o que é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でなくてなんだろう$$),
        (1, $$でなくてなんであろう$$),
        (1, $$でなくて何だろう$$),
        (2, $$でなくてなんだろう$$),
        (2, $$でなくてなんであろう$$),
        (2, $$でなくて何だろう$$),
        (3, $$でなくてなんだろう$$),
        (3, $$でなくてなんであろう$$),
        (3, $$でなくて何だろう$$),
        (4, $$でなくてなんだろう$$),
        (4, $$でなくてなんであろう$$),
        (4, $$でなくて何だろう$$),
        (5, $$でなくてなんだろう$$),
        (5, $$でなくてなんであろう$$),
        (5, $$でなくて何だろう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-23 — 〜ではあるまいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-23',
    'grammar',
    'N1',
    $$〜ではあるまいか$$,
    $$dewa arumai ka$$,
    $$Será que não / Não seria / Talvez seja$$,
    $$ではあるまいか expressa uma suposição de forma suave e formal. Equivale a "será que não é...?" ou "não seria...?".

A pessoa apresenta sua opinião com cautela, como se fizesse uma pergunta. Na prática, o sentido é "acho que é...". Por exemplo, "será que a causa não é o estresse?".

É a forma escrita e literária de のではないだろうか.$$,
    $$É bem mais formal que んじゃないかな ou のではないだろうか.

Aparece em ensaios, artigos de opinião e textos acadêmicos.$$,
    $$Substantivo / Adjetivo な + ではあるまいか
Verbo / Adjetivo い (forma simples) + のではあるまいか$$,
    $$ではあるまいか$$,
    $$ではあるまいか|のではあるまいか$$,
    ARRAY['では', 'ある', 'まい', 'か']::text[],
    ARRAY['ではあるまいか', 'のではあるまいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-23', $$この問題の原因はストレスではあるまいか。$$, $$このもんだいのげんいんはストレスではあるまいか。$$, $$Será que a causa deste problema não é o estresse?$$),
    ('n1-grammar-23', $$彼は何か隠しているのではあるまいか。$$, $$かれはなにかかくしているのではあるまいか。$$, $$Será que ele não está escondendo alguma coisa?$$),
    ('n1-grammar-23', $$この計画は無理なのではあるまいか。$$, $$このけいかくはむりなのではあるまいか。$$, $$Não seria este plano impossível?$$),
    ('n1-grammar-23', $$彼女の言うことは正しいのではあるまいか。$$, $$かのじょのいうことはただしいのではあるまいか。$$, $$Talvez o que ela diz seja correto.$$),
    ('n1-grammar-23', $$それは誤解ではあるまいか。$$, $$それはごかいではあるまいか。$$, $$Será que isso não é um mal-entendido?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵は偽物____。$$, $$Será que este quadro não é falso?$$),
        (2, $$もう手遅れなの____。$$, $$Será que já não é tarde demais?$$),
        (3, $$彼は来ないの____。$$, $$Será que ele não vem?$$),
        (4, $$その説明は不十分____。$$, $$Não seria essa explicação insuficiente?$$),
        (5, $$私たちは大切なことを忘れているの____。$$, $$Será que não estamos esquecendo algo importante?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではあるまいか$$),
        (2, $$ではあるまいか$$),
        (3, $$ではあるまいか$$),
        (4, $$ではあるまいか$$),
        (5, $$ではあるまいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-24 — 〜ではあるまいし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-24',
    'grammar',
    'N1',
    $$〜ではあるまいし$$,
    $$dewa arumai shi$$,
    $$Não é como se / Afinal não sou / Já que não é$$,
    $$ではあるまいし indica que, como a pessoa não está em determinada situação, aquela atitude não faz sentido. Equivale a "não é como se..." ou "afinal não sou...".

A segunda parte costuma ser uma crítica, um conselho ou uma reclamação. Por exemplo, "não é como se fosse criança, então faça sozinho".

É uma expressão coloquial, comum na fala.$$,
    $$Na fala, também aparece como じゃあるまいし.

É parecido com ではないのだから.

Expressões comuns são 子供じゃあるまいし e 神様ではあるまいし.$$,
    $$Substantivo + ではあるまいし + Crítica / Conselho
Verbo (forma simples) + わけではあるまいし$$,
    $$ではあるまいし$$,
    $$ではあるまいし|じゃあるまいし$$,
    ARRAY['では', 'ある', 'まい', 'し']::text[],
    ARRAY['ではあるまいし', 'じゃあるまいし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-24', $$子供ではあるまいし、一人でできるでしょう。$$, $$こどもではあるまいし、ひとりでできるでしょう。$$, $$Não é como se fosse criança, dá para fazer sozinho, não é?$$),
    ('n1-grammar-24', $$神様じゃあるまいし、未来のことなんてわからない。$$, $$かみさまじゃあるまいし、みらいのことなんてわからない。$$, $$Não sou Deus, não tenho como saber do futuro.$$),
    ('n1-grammar-24', $$一生会えないわけではあるまいし、そんなに泣かないで。$$, $$いっしょうあえないわけではあるまいし、そんなになかないで。$$, $$Não é como se nunca mais fôssemos nos ver, não chore tanto.$$),
    ('n1-grammar-24', $$初心者じゃあるまいし、こんなミスをするなんて。$$, $$しょしんしゃじゃあるまいし、こんなミスをするなんて。$$, $$Não é como se fosse iniciante, e mesmo assim cometeu um erro desses.$$),
    ('n1-grammar-24', $$学生ではあるまいし、遅刻はだめだよ。$$, $$がくせいではあるまいし、ちこくはだめだよ。$$, $$Você não é mais estudante, atrasos não dão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$赤ちゃん____、自分で食べなさい。$$, $$Não é como se fosse um bebê, coma sozinho.$$),
        (2, $$魔法使い____、すぐには直せないよ。$$, $$Não sou mágico, não dá para consertar na hora.$$),
        (3, $$永遠に別れるわけ____、笑って見送ろう。$$, $$Não é como se fosse uma despedida para sempre, vamos nos despedir sorrindo.$$),
        (4, $$プロ____、完璧にできなくてもいい。$$, $$Não é como se fosse profissional, não precisa ser perfeito.$$),
        (5, $$小学生____、そんなことで泣くな。$$, $$Você não é criança do primário, não chore por uma coisa dessas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではあるまいし$$),
        (1, $$じゃあるまいし$$),
        (2, $$ではあるまいし$$),
        (2, $$じゃあるまいし$$),
        (3, $$ではあるまいし$$),
        (3, $$じゃあるまいし$$),
        (4, $$ではあるまいし$$),
        (4, $$じゃあるまいし$$),
        (5, $$ではあるまいし$$),
        (5, $$じゃあるまいし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-25 — 〜では済まない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-25',
    'grammar',
    'N1',
    $$〜では済まない$$,
    $$dewa sumanai$$,
    $$Não basta / Não fica só nisso / Não se resolve com$$,
    $$では済まない indica que algo não pode ser resolvido de forma simples, porque a situação é grave. Equivale a "não basta" ou "não fica só nisso".

A pessoa mostra que será preciso algo mais sério, como uma punição, uma responsabilidade ou uma ação maior. Por exemplo, "pedir desculpas não basta" ou "se descobrirem, não vai ficar só numa bronca".$$,
    $$Expressões comuns são 謝って済む問題ではない e 冗談では済まない.

A forma positiva, で済む, significa "basta" ou "dá para resolver com".$$,
    $$Substantivo + では済まない
Verbo (forma simples) + だけでは済まない
Verbo (forma て) + は済まない$$,
    $$では済まない$$,
    $$では済まない|では済まされない|ではすまない|では済みません|だけでは済まない$$,
    ARRAY['では', '済まない']::text[],
    ARRAY['では済まない', 'では済まされない', 'では済みません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-25', $$これは謝罪だけでは済まない問題だ。$$, $$これはしゃざいだけではすまないもんだいだ。$$, $$Este é um problema que não se resolve só com um pedido de desculpas.$$),
    ('n1-grammar-25', $$そんなことをしたら、冗談では済まないよ。$$, $$そんなことをしたら、じょうだんではすまないよ。$$, $$Se fizer uma coisa dessas, não vai ficar só na brincadeira.$$),
    ('n1-grammar-25', $$会社のお金を使ったら、注意では済まされない。$$, $$かいしゃのおかねをつかったら、ちゅういではすまされない。$$, $$Se usar o dinheiro da empresa, não vai ficar só numa advertência.$$),
    ('n1-grammar-25', $$けがをさせたのだから、ごめんでは済まない。$$, $$けがをさせたのだから、ごめんではすまない。$$, $$Você machucou alguém, então só desculpa não basta.$$),
    ('n1-grammar-25', $$今回のミスは知らなかったでは済みません。$$, $$こんかいのミスはしらなかったではすみません。$$, $$Neste erro, dizer que não sabia não basta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破ったら、それ____。$$, $$Se quebrar a promessa, não vai ficar só nisso.$$),
        (2, $$この事故は、運が悪かった____。$$, $$Neste acidente, dizer que foi azar não basta.$$),
        (3, $$お金で解決____。$$, $$Isso não se resolve com dinheiro.$$),
        (4, $$嘘をついたのがばれたら、怒られるだけ____。$$, $$Se descobrirem a mentira, não vai ficar só numa bronca.$$),
        (5, $$子供のいたずら____ことだ。$$, $$Isso não dá para tratar como uma simples travessura de criança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$では済まない$$),
        (1, $$では済まされない$$),
        (1, $$では済みません$$),
        (2, $$では済まない$$),
        (2, $$では済まされない$$),
        (2, $$では済みません$$),
        (3, $$では済まない$$),
        (3, $$では済まされない$$),
        (3, $$では済みません$$),
        (4, $$では済まない$$),
        (4, $$では済まされない$$),
        (4, $$では済みません$$),
        (5, $$では済まない$$),
        (5, $$では済まされない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-26 — どうにも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-26',
    'grammar',
    'N1',
    $$どうにも〜ない$$,
    $$dou nimo ~ nai$$,
    $$De jeito nenhum / Não tem como / Simplesmente não$$,
    $$どうにも junto com uma forma negativa indica que a pessoa tentou de várias formas, mas não consegue resolver ou mudar algo. Equivale a "de jeito nenhum" ou "não tem como".

Muitas vezes vem com verbos como ならない, できない ou 仕方がない. Por exemplo, "não tem como resolver isso sozinho".

Também aparece em frases afirmativas para expressar um sentimento forte, como "simplesmente não suporto".$$,
    $$A expressão どうにもならない significa "não há nada que se possa fazer".

É parecido com どうしても〜ない, mas どうにも destaca a impotência diante da situação.$$,
    $$どうにも + Verbo (forma potencial negativa)
どうにも + ならない / しようがない$$,
    $$どうにも〜ない$$,
    $$どうにも$$,
    ARRAY['どうにも', 'ない']::text[],
    ARRAY['どうにも〜ない', 'どうにもならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-26', $$この問題は私一人ではどうにもならない。$$, $$このもんだいはわたしひとりではどうにもならない。$$, $$Não tem como eu resolver este problema sozinho.$$),
    ('n1-grammar-26', $$どうにも眠くて仕方がない。$$, $$どうにもねむくてしかたがない。$$, $$Simplesmente não consigo parar de ter sono.$$),
    ('n1-grammar-26', $$壊れた機械は、どうにも直せなかった。$$, $$こわれたきかいは、どうにもなおせなかった。$$, $$Não teve jeito de consertar a máquina quebrada.$$),
    ('n1-grammar-26', $$今さら言っても、どうにもならないよ。$$, $$いまさらいっても、どうにもならないよ。$$, $$Dizer isso agora não adianta nada.$$),
    ('n1-grammar-26', $$彼の態度はどうにも理解できない。$$, $$かれのたいどはどうにもりかいできない。$$, $$Simplesmente não consigo entender a atitude dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金がなくて、____ならない。$$, $$Sem dinheiro, não tem jeito.$$),
        (2, $$この痛みは____我慢できない。$$, $$Não consigo aguentar esta dor de jeito nenhum.$$),
        (3, $$過ぎたことは、もう____ならない。$$, $$O que passou, não tem mais como mudar.$$),
        (4, $$この漢字が____覚えられない。$$, $$Simplesmente não consigo decorar este kanji.$$),
        (5, $$天気だけは____しようがない。$$, $$Com o tempo não há nada que se possa fazer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうにも$$),
        (2, $$どうにも$$),
        (3, $$どうにも$$),
        (4, $$どうにも$$),
        (5, $$どうにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-27 — 〜が早いか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-27',
    'grammar',
    'N1',
    $$〜が早いか$$,
    $$ga hayai ka$$,
    $$Mal / Assim que / No instante em que$$,
    $$が早いか indica que, no mesmo instante em que uma ação acontece, outra ação começa imediatamente. Equivale a "mal..." ou "no instante em que".

A pessoa destaca a rapidez com que a segunda ação acontece. Por exemplo, "mal chegou em casa, já saiu correndo de novo".

É uma expressão literária, mais comum na escrita.$$,
    $$A segunda parte é um fato que já aconteceu, por isso costuma estar no passado.

Não se usa para falar de si mesmo nem com pedidos ou intenções.

É parecido com や否や e とたんに.$$,
    $$Verbo (forma dicionário) + が早いか + Verbo (forma た)$$,
    $$が早いか$$,
    $$が早いか|がはやいか$$,
    ARRAY['が', '早い', 'か']::text[],
    ARRAY['が早いか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-27', $$子供は家に帰るが早いか、遊びに出かけた。$$, $$こどもはいえにかえるがはやいか、あそびにでかけた。$$, $$Mal chegou em casa, a criança saiu para brincar.$$),
    ('n1-grammar-27', $$ベルが鳴るが早いか、学生たちは教室を飛び出した。$$, $$ベルがなるがはやいか、がくせいたちはきょうしつをとびだした。$$, $$No instante em que o sinal tocou, os alunos saíram correndo da sala.$$),
    ('n1-grammar-27', $$彼は布団に入るが早いか、眠ってしまった。$$, $$かれはふとんにはいるがはやいか、ねむってしまった。$$, $$Mal se deitou, ele adormeceu.$$),
    ('n1-grammar-27', $$店が開くが早いか、客が押し寄せた。$$, $$みせがあくがはやいか、きゃくがおしよせた。$$, $$Assim que a loja abriu, os clientes invadiram.$$),
    ('n1-grammar-27', $$料理が出るが早いか、彼は食べ始めた。$$, $$りょうりがでるがはやいか、かれはたべはじめた。$$, $$Mal a comida foi servida, ele começou a comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は電話を切る____、泣き出した。$$, $$Mal desligou o telefone, ela começou a chorar.$$),
        (2, $$ドアが開く____、犬が走ってきた。$$, $$No instante em que a porta abriu, o cachorro veio correndo.$$),
        (3, $$給料をもらう____、全部使ってしまった。$$, $$Mal recebeu o salário, gastou tudo.$$),
        (4, $$試合が終わる____、選手たちは抱き合った。$$, $$Assim que a partida terminou, os jogadores se abraçaram.$$),
        (5, $$彼は席に着く____、パソコンを開いた。$$, $$Mal se sentou, ele abriu o computador.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$が早いか$$),
        (2, $$が早いか$$),
        (3, $$が早いか$$),
        (4, $$が早いか$$),
        (5, $$が早いか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-28 — 〜が / 〜も〜なら、〜も〜だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-28',
    'grammar',
    'N1',
    $$〜が / 〜も〜なら、〜も〜だ$$,
    $$ga / mo ~ nara, ~ mo ~ da$$,
    $$Tal pai tal filho / Um é tão ruim quanto o outro / Ambos são iguais$$,
    $$Esta estrutura indica que duas pessoas ou coisas relacionadas têm o mesmo defeito ou problema. Equivale a "um é tão ruim quanto o outro" ou "tal pai, tal filho".

A pessoa critica os dois lados ao mesmo tempo. Por exemplo, "o pai é irresponsável, e o filho também é".

É uma expressão coloquial, com tom de crítica.$$,
    $$Os dois elementos costumam ser pares, como pais e filhos, chefe e subordinado, ou marido e mulher.

O adjetivo ou substantivo costuma ser repetido nas duas partes.$$,
    $$Substantivo A + も + Adjetivo / Substantivo + なら、Substantivo B + も + Adjetivo / Substantivo + だ
Substantivo A + が + Adjetivo + なら、Substantivo B + も + Adjetivo + だ$$,
    $$〜も〜なら、〜も〜だ$$,
    $$なら$$,
    ARRAY['も', 'なら', 'も', 'だ']::text[],
    ARRAY['〜も〜なら、〜も〜だ', '〜が〜なら、〜も〜だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-28', $$親も親なら、子も子だ。$$, $$おやもおやなら、こもこだ。$$, $$Tal pai, tal filho.$$),
    ('n1-grammar-28', $$社長も無責任なら、社員も無責任だ。$$, $$しゃちょうもむせきにんなら、しゃいんもむせきにんだ。$$, $$O presidente é irresponsável, e os funcionários também.$$),
    ('n1-grammar-28', $$夫が夫なら、妻も妻だ。$$, $$おっとがおっとなら、つまもつまだ。$$, $$O marido é daquele jeito, e a mulher também.$$),
    ('n1-grammar-28', $$店も店なら、客も客だ。$$, $$みせもみせなら、きゃくもきゃくだ。$$, $$A loja é ruim, e os clientes não ficam atrás.$$),
    ('n1-grammar-28', $$先生がいい加減なら、学生もいい加減だ。$$, $$せんせいがいいかげんなら、がくせいもいいかげんだ。$$, $$Se o professor é desleixado, os alunos também são.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$兄も兄____、弟も弟だ。$$, $$O irmão mais velho é daquele jeito, e o mais novo também.$$),
        (2, $$上司も上司____、部下も部下だ。$$, $$O chefe é daquele jeito, e o subordinado também.$$),
        (3, $$政治家も政治家____、国民も国民だ。$$, $$Os políticos são daquele jeito, e o povo também.$$),
        (4, $$母親が甘い____、父親も甘い。$$, $$A mãe é mole, e o pai também.$$),
        (5, $$売る方も売る方____、買う方も買う方だ。$$, $$Quem vende é daquele jeito, e quem compra também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なら$$),
        (2, $$なら$$),
        (3, $$なら$$),
        (4, $$なら$$),
        (5, $$なら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-29 — 〜がましい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-29',
    'grammar',
    'N1',
    $$〜がましい$$,
    $$gamashii$$,
    $$Que soa como / Com jeito de / Parece$$,
    $$がましい é um sufixo que indica que algo parece ou tem o tom de algo, geralmente de forma negativa ou excessiva. Equivale a "que soa como" ou "com jeito de".

Por exemplo, 言い訳がましい significa "que soa como desculpa", 恩着せがましい significa "que joga na cara o favor feito" e 押し付けがましい significa "insistente".

É usado para criticar uma atitude ou maneira de falar.$$,
    $$Só funciona com algumas palavras fixas, como 言い訳がましい, 恩着せがましい, 押し付けがましい, 未練がましい e 催促がましい.

O tom é sempre de crítica.$$,
    $$Substantivo / Verbo (forma ます sem ます) + がましい
Substantivo + がましい + Substantivo$$,
    $$がましい$$,
    $$がましい|がましく|がましさ$$,
    ARRAY['がましい']::text[],
    ARRAY['がましい', 'がましく', 'がましさ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-29', $$言い訳がましいことは言いたくない。$$, $$いいわけがましいことはいいたくない。$$, $$Não quero dizer nada que soe como desculpa.$$),
    ('n1-grammar-29', $$彼の恩着せがましい態度が嫌いだ。$$, $$かれのおんきせがましいたいどがきらいだ。$$, $$Não gosto da atitude dele de jogar na cara os favores que faz.$$),
    ('n1-grammar-29', $$押し付けがましいアドバイスは困る。$$, $$おしつけがましいアドバイスはこまる。$$, $$Conselhos insistentes são um incômodo.$$),
    ('n1-grammar-29', $$別れた恋人に未練がましく電話した。$$, $$わかれたこいびとにみれんがましくでんわした。$$, $$Liguei para a ex de um jeito que mostrava que eu não tinha superado.$$),
    ('n1-grammar-29', $$催促がましくて申し訳ありませんが、お返事をお待ちしています。$$, $$さいそくがましくてもうしわけありませんが、おへんじをおまちしています。$$, $$Desculpe se parece cobrança, mas aguardo sua resposta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅刻の理由を言い訳____説明した。$$, $$Explicou o motivo do atraso de um jeito que soava como desculpa.$$),
        (2, $$彼は恩着せ____ことばかり言う。$$, $$Ele só diz coisas jogando na cara os favores que fez.$$),
        (3, $$押し付け____ようですが、この本を読んでください。$$, $$Pode parecer insistência, mas leia este livro.$$),
        (4, $$いつまでも未練____考えるのはやめよう。$$, $$Vamos parar de pensar nisso com apego para sempre.$$),
        (5, $$差し出____ことを言って、すみません。$$, $$Desculpe dizer algo que soa intrometido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がましく$$),
        (2, $$がましい$$),
        (3, $$がましい$$),
        (4, $$がましく$$),
        (5, $$がましい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-30 — 〜がてら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-30',
    'grammar',
    'N1',
    $$〜がてら$$,
    $$gatera$$,
    $$Aproveitando para / Ao mesmo tempo que / Enquanto$$,
    $$がてら indica que, ao fazer uma ação, a pessoa aproveita para fazer outra também. Equivale a "aproveitando para" ou "ao mesmo tempo que".

A primeira parte é a ação principal ou o motivo, e a segunda é o que se aproveita para fazer. Por exemplo, "aproveitando o passeio, fui fazer compras".

Costuma vir com verbos de movimento na segunda parte, como 行く, 来る, 歩く ou 寄る.$$,
    $$Expressões comuns são 散歩がてら, 買い物がてら e 遊びがてら.

É parecido com かたがた e ついでに. がてら é mais coloquial e muito usado na fala.$$,
    $$Substantivo (ação) + がてら + Verbo de movimento
Verbo (forma ます sem ます) + がてら + Verbo de movimento$$,
    $$がてら$$,
    $$がてら$$,
    ARRAY['がてら']::text[],
    ARRAY['がてら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-30', $$散歩がてら、パンを買いに行った。$$, $$さんぽがてら、パンをかいにいった。$$, $$Aproveitando o passeio, fui comprar pão.$$),
    ('n1-grammar-30', $$駅まで送りがてら、少し話をした。$$, $$えきまでおくりがてら、すこしはなしをした。$$, $$Aproveitei que o levei até a estação para conversar um pouco.$$),
    ('n1-grammar-30', $$買い物がてら、友達の家に寄った。$$, $$かいものがてら、ともだちのいえによった。$$, $$Aproveitando as compras, passei na casa de um amigo.$$),
    ('n1-grammar-30', $$遊びがてら、日本の文化を学んだ。$$, $$あそびがてら、にほんのぶんかをまなんだ。$$, $$Enquanto me divertia, aprendi sobre a cultura japonesa.$$),
    ('n1-grammar-30', $$運動がてら、自転車で会社に行っている。$$, $$うんどうがてら、じてんしゃでかいしゃにいっている。$$, $$Vou de bicicleta para o trabalho, aproveitando para me exercitar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$花見____、公園を散歩した。$$, $$Aproveitando para ver as cerejeiras, caminhei pelo parque.$$),
        (2, $$出張____、昔の友達に会った。$$, $$Aproveitando a viagem a trabalho, encontrei um velho amigo.$$),
        (3, $$ドライブ____、海を見に行った。$$, $$Aproveitando o passeio de carro, fui ver o mar.$$),
        (4, $$お見舞い____、近くの店で花を買った。$$, $$Aproveitando a visita ao doente, comprei flores numa loja próxima.$$),
        (5, $$犬の散歩____、郵便局に寄った。$$, $$Aproveitando o passeio com o cachorro, passei nos correios.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がてら$$),
        (2, $$がてら$$),
        (3, $$がてら$$),
        (4, $$がてら$$),
        (5, $$がてら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-31 — 〜ごとき / 〜ごとく / 〜ごとし
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-31',
    'grammar',
    'N1',
    $$〜ごとき / 〜ごとく / 〜ごとし$$,
    $$gotoki / gotoku / gotoshi$$,
    $$Como / Tal qual / Igual a$$,
    $$ごとき, ごとく e ごとし são formas antigas e formais de ような, ように e ようだ. Equivalem a "como" ou "tal qual".

ごとく funciona como advérbio, como em "o tempo passou como uma flecha". ごとき vem antes de substantivos, como em "uma pessoa como ele". ごとし fica no fim da frase, como em "a vida é como um sonho".

ごとき também pode expressar desprezo ou modéstia, como em "alguém como eu" ou "uma coisa dessas".$$,
    $$São usadas principalmente na escrita, em provérbios e em textos literários.

Expressões comuns são 例のごとく, 前述のごとく e 光陰矢のごとし.

Na fala, ごとき aparece com tom de desprezo, como 私ごとき ou お前ごとき.$$,
    $$Substantivo + の + ごとく + Verbo
Substantivo + の + ごとき + Substantivo
Substantivo + の + ごとし
Verbo (forma simples) + が + ごとく$$,
    $$ごとく$$,
    $$ごとく|ごとき|ごとし$$,
    ARRAY['ごとく']::text[],
    ARRAY['ごとく', 'ごとき', 'ごとし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-31', $$時間は矢のごとく過ぎていく。$$, $$じかんはやのごとくすぎていく。$$, $$O tempo passa como uma flecha.$$),
    ('n1-grammar-31', $$例のごとく、彼は遅れてきた。$$, $$れいのごとく、かれはおくれてきた。$$, $$Como de costume, ele chegou atrasado.$$),
    ('n1-grammar-31', $$私ごときに、そんな大役は務まりません。$$, $$わたしごときに、そんなたいやくはつとまりません。$$, $$Alguém como eu não daria conta de um papel tão importante.$$),
    ('n1-grammar-31', $$人生は夢のごとし。$$, $$じんせいはゆめのごとし。$$, $$A vida é como um sonho.$$),
    ('n1-grammar-31', $$彼は何事もなかったかのごとく笑っていた。$$, $$かれはなにごともなかったかのごとくわらっていた。$$, $$Ele ria como se nada tivesse acontecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$前述の____、この計画には問題がある。$$, $$Como mencionado anteriormente, este plano tem problemas.$$),
        (2, $$彼女は花の____美しい。$$, $$Ela é bela como uma flor.$$),
        (3, $$お前____に負けるはずがない。$$, $$Não tenho como perder para alguém como você.$$),
        (4, $$光陰矢の____。$$, $$O tempo voa como uma flecha.$$),
        (5, $$彼は自分が王である____振る舞った。$$, $$Ele agiu como se fosse um rei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ごとく$$),
        (2, $$ごとく$$),
        (3, $$ごとき$$),
        (4, $$ごとし$$),
        (5, $$かのごとく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-32 — 〜ぐるみ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-32',
    'grammar',
    'N1',
    $$〜ぐるみ$$,
    $$gurumi$$,
    $$Inteiro / Todo o / Junto com$$,
    $$ぐるみ indica que algo envolve um grupo inteiro, incluindo todos os seus membros. Equivale a "inteiro" ou "todo o".

Por exemplo, 家族ぐるみ significa "envolvendo toda a família", e 町ぐるみ significa "a cidade inteira".

Também pode significar "junto com", como em 身ぐるみ, "tudo o que se tem no corpo".$$,
    $$Expressões comuns são 家族ぐるみの付き合い, 町ぐるみ, 会社ぐるみ e 身ぐるみはがされる.

会社ぐるみ costuma aparecer em notícias sobre fraudes que envolvem a empresa inteira.$$,
    $$Substantivo (grupo) + ぐるみ + で / の$$,
    $$ぐるみ$$,
    $$ぐるみ$$,
    ARRAY['ぐるみ']::text[],
    ARRAY['ぐるみ', 'ぐるみで', 'ぐるみの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-32', $$彼とは家族ぐるみの付き合いをしている。$$, $$かれとはかぞくぐるみのつきあいをしている。$$, $$Nossa amizade com ele envolve a família inteira.$$),
    ('n1-grammar-32', $$町ぐるみで祭りの準備をした。$$, $$まちぐるみでまつりのじゅんびをした。$$, $$A cidade inteira preparou o festival.$$),
    ('n1-grammar-32', $$会社ぐるみの不正が発覚した。$$, $$かいしゃぐるみのふせいがはっかくした。$$, $$Foi descoberta uma fraude envolvendo a empresa inteira.$$),
    ('n1-grammar-32', $$旅行先で身ぐるみはがされた。$$, $$りょこうさきでみぐるみはがされた。$$, $$No destino da viagem, me roubaram tudo o que eu tinha.$$),
    ('n1-grammar-32', $$地域ぐるみで子供たちを見守っている。$$, $$ちいきぐるみでこどもたちをみまもっている。$$, $$A comunidade inteira cuida das crianças.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族____でキャンプに行った。$$, $$Fomos acampar com a família inteira.$$),
        (2, $$村____の反対運動が起こった。$$, $$Surgiu um movimento de oposição envolvendo a vila inteira.$$),
        (3, $$学校____で、ボランティア活動をしている。$$, $$A escola inteira faz trabalho voluntário.$$),
        (4, $$組織____の犯罪だった。$$, $$Foi um crime envolvendo a organização inteira.$$),
        (5, $$彼らは家族____で仲がいい。$$, $$Eles se dão bem com as famílias inteiras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぐるみ$$),
        (2, $$ぐるみ$$),
        (3, $$ぐるみ$$),
        (4, $$ぐるみ$$),
        (5, $$ぐるみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-33 — 〜羽目になる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-33',
    'grammar',
    'N1',
    $$〜羽目になる$$,
    $$hame ni naru$$,
    $$Acabar tendo que / Ser obrigado a / Ir parar em$$,
    $$羽目になる indica que alguém acabou numa situação ruim ou difícil, geralmente como consequência de algo. Equivale a "acabar tendo que" ou "ir parar em".

A pessoa não queria aquilo, mas não teve escolha. Por exemplo, "por causa de um erro, acabei tendo que fazer hora extra".

É uma expressão coloquial, com tom de lamento ou reclamação.$$,
    $$Também é escrito はめになる.

Costuma estar no passado, como 羽目になった.

É parecido com ことになる, mas 羽目になる sempre indica algo indesejado.$$,
    $$Verbo (forma dicionário) + 羽目になる
Verbo (forma dicionário) + 羽目に陥る$$,
    $$羽目になる$$,
    $$羽目になる|羽目になった|羽目に|はめになる|はめになった$$,
    ARRAY['羽目', 'に', 'なる']::text[],
    ARRAY['羽目になる', '羽目になった', '羽目に陥る']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-33', $$寝坊したせいで、タクシーで行く羽目になった。$$, $$ねぼうしたせいで、タクシーでいくはめになった。$$, $$Por ter dormido demais, acabei tendo que ir de táxi.$$),
    ('n1-grammar-33', $$友達の保証人になって、借金を払う羽目になった。$$, $$ともだちのほしょうにんになって、しゃっきんをはらうはめになった。$$, $$Fui fiador de um amigo e acabei tendo que pagar a dívida.$$),
    ('n1-grammar-33', $$一人で全部やる羽目になった。$$, $$ひとりでぜんぶやるはめになった。$$, $$Acabei tendo que fazer tudo sozinho.$$),
    ('n1-grammar-33', $$断れなくて、幹事をする羽目になった。$$, $$ことわれなくて、かんじをするはめになった。$$, $$Não consegui recusar e acabei tendo que organizar a festa.$$),
    ('n1-grammar-33', $$財布を忘れて、歩いて帰る羽目になった。$$, $$さいふをわすれて、あるいてかえるはめになった。$$, $$Esqueci a carteira e acabei tendo que voltar a pé.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ミスをして、徹夜で直す____。$$, $$Errei e acabei tendo que corrigir virando a noite.$$),
        (2, $$傘を持っていなかったので、雨の中を走る____。$$, $$Como não tinha guarda-chuva, acabei tendo que correr na chuva.$$),
        (3, $$嘘がばれて、みんなに謝る____。$$, $$A mentira foi descoberta e acabei tendo que pedir desculpas a todos.$$),
        (4, $$終電を逃して、駅で一晩過ごす____。$$, $$Perdi o último trem e acabei tendo que passar a noite na estação.$$),
        (5, $$準備を怠ると、後で苦労する____よ。$$, $$Se descuidar da preparação, vai acabar sofrendo depois.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$羽目になった$$),
        (1, $$はめになった$$),
        (2, $$羽目になった$$),
        (2, $$はめになった$$),
        (3, $$羽目になった$$),
        (3, $$はめになった$$),
        (4, $$羽目になった$$),
        (4, $$はめになった$$),
        (5, $$羽目になる$$),
        (5, $$はめになる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-34 — 〜ほどのことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-34',
    'grammar',
    'N1',
    $$〜ほどのことではない$$,
    $$hodo no koto dewa nai$$,
    $$Não é para tanto / Não chega a ser / Não precisa$$,
    $$ほどのことではない indica que algo não é tão grave ou importante a ponto de justificar uma reação. Equivale a "não é para tanto" ou "não chega a ser".

A pessoa minimiza a situação. Por exemplo, "é um resfriado leve, não é para ir ao hospital" ou "não é algo para se preocupar".

É usado para tranquilizar alguém ou para mostrar que algo é simples.$$,
    $$Na fala, aparece como ほどのことじゃない.

É parecido com までもない, que significa "nem é preciso".$$,
    $$Verbo (forma dicionário) + ほどのことではない
Verbo (forma dicionário) + ほどのことでもない$$,
    $$ほどのことではない$$,
    $$ほどのことではない|ほどのことでもない|ほどのことじゃない|ほどのことではありません$$,
    ARRAY['ほど', 'の', 'こと', 'では', 'ない']::text[],
    ARRAY['ほどのことではない', 'ほどのことでもない', 'ほどのことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-34', $$軽い風邪だから、病院に行くほどのことではない。$$, $$かるいかぜだから、びょういんにいくほどのことではない。$$, $$É um resfriado leve, não é para ir ao hospital.$$),
    ('n1-grammar-34', $$そんなに心配するほどのことではないよ。$$, $$そんなにしんぱいするほどのことではないよ。$$, $$Não é para se preocupar tanto.$$),
    ('n1-grammar-34', $$わざわざ電話するほどのことでもない。$$, $$わざわざでんわするほどのことでもない。$$, $$Não chega a ser motivo para ligar.$$),
    ('n1-grammar-34', $$怒るほどのことじゃないでしょう。$$, $$おこるほどのことじゃないでしょう。$$, $$Não é para ficar bravo, né?$$),
    ('n1-grammar-34', $$人に話すほどのことではありません。$$, $$ひとにはなすほどのことではありません。$$, $$Não é algo que valha a pena contar aos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$小さな傷だから、薬をつける____。$$, $$É um machucado pequeno, não precisa passar remédio.$$),
        (2, $$これは会議で話し合う____。$$, $$Isto não chega a ser assunto para discutir na reunião.$$),
        (3, $$お礼を言われる____。$$, $$Não é para me agradecer.$$),
        (4, $$泣く____よ。元気出して。$$, $$Não é para chorar. Anime-se.$$),
        (5, $$専門家に相談する____。$$, $$Não chega a ser preciso consultar um especialista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほどのことではない$$),
        (1, $$ほどのことでもない$$),
        (1, $$ほどのことじゃない$$),
        (1, $$ほどのことではありません$$),
        (2, $$ほどのことではない$$),
        (2, $$ほどのことでもない$$),
        (2, $$ほどのことじゃない$$),
        (2, $$ほどのことではありません$$),
        (3, $$ほどのことではない$$),
        (3, $$ほどのことでもない$$),
        (3, $$ほどのことじゃない$$),
        (3, $$ほどのことではありません$$),
        (4, $$ほどのことではない$$),
        (4, $$ほどのことでもない$$),
        (4, $$ほどのことじゃない$$),
        (5, $$ほどのことではない$$),
        (5, $$ほどのことでもない$$),
        (5, $$ほどのことじゃない$$),
        (5, $$ほどのことではありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-35 — 〜ほうがましだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-35',
    'grammar',
    'N1',
    $$〜ほうがましだ$$,
    $$hou ga mashi da$$,
    $$Seria melhor / Antes / Prefiro$$,
    $$ほうがましだ indica que, entre duas opções ruins, uma é um pouco menos ruim. Equivale a "seria melhor" ou "antes...".

A pessoa não acha a opção boa, mas a considera mais aceitável que a outra. Por exemplo, "antes ficar sozinho do que trabalhar com ele".

Muitas vezes vem junto com くらいなら, como "se for para..., antes...".$$,
    $$ましだ significa "menos ruim", não "bom".

É parecido com ほうがいい, mas ほうがましだ mostra que as duas opções são ruins.$$,
    $$Verbo (forma dicionário / forma た) + ほうがましだ
Substantivo + の + ほうがましだ
〜くらいなら、〜ほうがましだ$$,
    $$ほうがましだ$$,
    $$ほうがましだ|ほうがまし|方がまし$$,
    ARRAY['ほう', 'が', 'まし', 'だ']::text[],
    ARRAY['ほうがましだ', 'ほうがましです', '方がましだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-35', $$彼と一緒に働くくらいなら、一人でやるほうがましだ。$$, $$かれといっしょにはたらくくらいなら、ひとりでやるほうがましだ。$$, $$Se for para trabalhar com ele, antes fazer sozinho.$$),
    ('n1-grammar-35', $$こんなにまずいなら、食べないほうがましだ。$$, $$こんなにまずいなら、たべないほうがましだ。$$, $$Se é tão ruim assim, seria melhor não comer.$$),
    ('n1-grammar-35', $$嘘をつくより、本当のことを言ったほうがましだ。$$, $$うそをつくより、ほんとうのことをいったほうがましだ。$$, $$Seria melhor dizer a verdade do que mentir.$$),
    ('n1-grammar-35', $$満員電車に乗るより、歩いたほうがましです。$$, $$まんいんでんしゃにのるより、あるいたほうがましです。$$, $$Prefiro andar a pegar um trem lotado.$$),
    ('n1-grammar-35', $$こんな仕事なら、辞めたほうがましだ。$$, $$こんなしごとなら、やめたほうがましだ。$$, $$Se o trabalho é assim, seria melhor sair.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$謝るくらいなら、黙っている____。$$, $$Se for para pedir desculpas, antes ficar calado.$$),
        (2, $$こんな店で食べるより、家で作った____。$$, $$Seria melhor cozinhar em casa do que comer numa loja dessas.$$),
        (3, $$二時間待つより、別の店に行く____。$$, $$Seria melhor ir a outra loja do que esperar duas horas.$$),
        (4, $$あんな人に頼むくらいなら、自分でする____。$$, $$Se for para pedir a uma pessoa daquelas, prefiro fazer eu mesmo.$$),
        (5, $$中途半端にやるより、やらない____。$$, $$Seria melhor não fazer do que fazer pela metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほうがましだ$$),
        (1, $$方がましだ$$),
        (2, $$ほうがましだ$$),
        (2, $$方がましだ$$),
        (3, $$ほうがましだ$$),
        (3, $$方がましだ$$),
        (4, $$ほうがましだ$$),
        (4, $$方がましだ$$),
        (5, $$ほうがましだ$$),
        (5, $$方がましだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-36 — 〜放題
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-36',
    'grammar',
    'N1',
    $$〜放題$$,
    $$houdai$$,
    $$À vontade / Sem limite / Do jeito que quiser$$,
    $$放題 indica que algo é feito livremente, sem limite. Equivale a "à vontade" ou "sem limite".

Tem dois usos. O primeiro é positivo, como em 食べ放題 e 飲み放題, que significam "coma à vontade" e "beba à vontade" em restaurantes.

O segundo é negativo e indica que algo foi deixado sem controle, como "deixar o jardim abandonado" ou "fazer o que bem entende".$$,
    $$Expressões comuns são 食べ放題, 飲み放題, 言いたい放題, やりたい放題 e 荒れ放題.

No uso negativo, mostra crítica à falta de controle.$$,
    $$Verbo (forma ます sem ます) + 放題
Adjetivo な / Substantivo + 放題
Verbo (forma たい) + 放題$$,
    $$放題$$,
    $$放題|ほうだい$$,
    ARRAY['放題']::text[],
    ARRAY['放題', '食べ放題', 'やりたい放題']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-36', $$この店は二千円で食べ放題だ。$$, $$このみせはにせんえんでたべほうだいだ。$$, $$Nesta loja, por dois mil ienes, você come à vontade.$$),
    ('n1-grammar-36', $$彼は言いたい放題言って帰った。$$, $$かれはいいたいほうだいいってかえった。$$, $$Ele disse tudo o que quis e foi embora.$$),
    ('n1-grammar-36', $$庭は荒れ放題になっている。$$, $$にわはあれほうだいになっている。$$, $$O jardim está completamente abandonado.$$),
    ('n1-grammar-36', $$子供たちはやりたい放題だ。$$, $$こどもたちはやりたいほうだいだ。$$, $$As crianças fazem o que bem entendem.$$),
    ('n1-grammar-36', $$このプランは飲み放題がついている。$$, $$このプランはのみほうだいがついている。$$, $$Este plano inclui bebida à vontade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ケーキが食べ____の店に行った。$$, $$Fui a uma loja de bolo à vontade.$$),
        (2, $$彼女は髪を伸び____にしている。$$, $$Ela deixa o cabelo crescer sem cuidar.$$),
        (3, $$親がいないので、子供はしたい____だ。$$, $$Como os pais não estão, a criança faz o que quer.$$),
        (4, $$このアプリは月千円で音楽が聴き____だ。$$, $$Com este aplicativo, por mil ienes por mês, dá para ouvir música à vontade.$$),
        (5, $$ネットで言いたい____書く人がいる。$$, $$Tem gente que escreve na internet tudo o que bem entende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$放題$$),
        (2, $$放題$$),
        (3, $$放題$$),
        (4, $$放題$$),
        (5, $$放題$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-37 — 〜いかんだ / 〜いかんでは / 〜いかんによっては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-37',
    'grammar',
    'N1',
    $$〜いかんだ / 〜いかんでは / 〜いかんによっては$$,
    $$ikan da / ikan dewa / ikan ni yotte wa$$,
    $$Depende de / Dependendo de / Conforme$$,
    $$いかん indica que algo depende de uma condição. Equivale a "depende de" ou "dependendo de".

いかんだ fica no fim da frase, como "o resultado depende do seu esforço". いかんでは e いかんによっては indicam que, dependendo da condição, algo especial pode acontecer, como "dependendo do resultado, o plano pode ser cancelado".

É uma expressão muito formal, usada em documentos, notícias e discursos.$$,
    $$É uma forma formal de 次第だ e によって.

Expressões comuns são 結果いかん, 努力いかん e 対応いかん.$$,
    $$Substantivo + いかんだ
Substantivo + の + いかんでは / いかんによっては
Substantivo + いかんで$$,
    $$いかんだ$$,
    $$いかんだ|いかんでは|いかんによっては|いかんによって|いかんで|いかんです$$,
    ARRAY['いかん', 'だ']::text[],
    ARRAY['いかんだ', 'いかんでは', 'いかんによっては', 'いかんで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-37', $$合格できるかどうかは、本人の努力いかんだ。$$, $$ごうかくできるかどうかは、ほんにんのどりょくいかんだ。$$, $$Passar ou não depende do esforço da própria pessoa.$$),
    ('n1-grammar-37', $$結果いかんでは、計画を中止することもある。$$, $$けっかいかんでは、けいかくをちゅうしすることもある。$$, $$Dependendo do resultado, o plano pode ser cancelado.$$),
    ('n1-grammar-37', $$天候のいかんによっては、試合が延期されます。$$, $$てんこうのいかんによっては、しあいがえんきされます。$$, $$Dependendo do tempo, a partida será adiada.$$),
    ('n1-grammar-37', $$今後の対応いかんで、会社の評価が決まる。$$, $$こんごのたいおういかんで、かいしゃのひょうかがきまる。$$, $$A avaliação da empresa será definida conforme a resposta daqui em diante.$$),
    ('n1-grammar-37', $$成功するかどうかは準備いかんです。$$, $$せいこうするかどうかはじゅんびいかんです。$$, $$Ter sucesso ou não depende da preparação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勝敗は選手の体調____。$$, $$A vitória ou derrota depende da condição física dos atletas.$$),
        (2, $$成績の____、奨学金がもらえないこともある。$$, $$Dependendo das notas, pode ser que não receba a bolsa.$$),
        (3, $$交渉の結果____、値段が変わる。$$, $$O preço muda conforme o resultado da negociação.$$),
        (4, $$参加者数の____、会場を変更します。$$, $$Dependendo do número de participantes, mudaremos o local.$$),
        (5, $$この計画が成功するかは、資金____。$$, $$Se este plano terá sucesso depende dos recursos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかんだ$$),
        (1, $$いかんです$$),
        (2, $$いかんでは$$),
        (2, $$いかんによっては$$),
        (3, $$いかんで$$),
        (3, $$いかんによって$$),
        (4, $$いかんでは$$),
        (4, $$いかんによっては$$),
        (5, $$いかんだ$$),
        (5, $$いかんです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-38 — 〜いかんを問わず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-38',
    'grammar',
    'N1',
    $$〜いかんを問わず$$,
    $$ikan wo towazu$$,
    $$Independentemente de / Seja qual for / Sem levar em conta$$,
    $$いかんを問わず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "seja qual for".

É uma expressão muito formal, usada principalmente em regras, contratos e avisos oficiais. Por exemplo, "independentemente do motivo, não é possível devolver o valor".

As formas いかんによらず e いかんにかかわらず têm o mesmo sentido.$$,
    $$É uma forma ainda mais formal de に関わらず e を問わず.

Expressões comuns são 理由のいかんを問わず e 結果のいかんにかかわらず.$$,
    $$Substantivo + の + いかんを問わず
Substantivo + の + いかんによらず
Substantivo + の + いかんにかかわらず$$,
    $$いかんを問わず$$,
    $$いかんを問わず|いかんをとわず|いかんによらず|いかんにかかわらず|いかんに関わらず$$,
    ARRAY['いかん', 'を', '問わず']::text[],
    ARRAY['いかんを問わず', 'いかんによらず', 'いかんにかかわらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-38', $$理由のいかんを問わず、返金はいたしません。$$, $$りゆうのいかんをとわず、へんきんはいたしません。$$, $$Independentemente do motivo, não faremos reembolso.$$),
    ('n1-grammar-38', $$結果のいかんにかかわらず、報告してください。$$, $$けっかのいかんにかかわらず、ほうこくしてください。$$, $$Seja qual for o resultado, faça o relatório.$$),
    ('n1-grammar-38', $$国籍のいかんによらず、応募できます。$$, $$こくせきのいかんによらず、おうぼできます。$$, $$É possível se candidatar independentemente da nacionalidade.$$),
    ('n1-grammar-38', $$事情のいかんを問わず、遅刻は認めません。$$, $$じじょうのいかんをとわず、ちこくはみとめません。$$, $$Seja qual for a circunstância, atrasos não serão aceitos.$$),
    ('n1-grammar-38', $$年齢のいかんを問わず、誰でも参加できる。$$, $$ねんれいのいかんをとわず、だれでもさんかできる。$$, $$Qualquer pessoa pode participar, independentemente da idade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$理由の____、無断欠席は許されない。$$, $$Seja qual for o motivo, faltar sem avisar não é permitido.$$),
        (2, $$性別の____、採用します。$$, $$Contratamos sem levar em conta o sexo.$$),
        (3, $$天候の____、イベントは予定通り行います。$$, $$Independentemente do tempo, o evento será realizado conforme previsto.$$),
        (4, $$経験の____、やる気のある方を歓迎します。$$, $$Independentemente da experiência, damos as boas-vindas a quem tem vontade.$$),
        (5, $$結果の____、全力を尽くすことが大切だ。$$, $$Seja qual for o resultado, o importante é dar o seu melhor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかんを問わず$$),
        (1, $$いかんをとわず$$),
        (1, $$いかんによらず$$),
        (1, $$いかんにかかわらず$$),
        (2, $$いかんを問わず$$),
        (2, $$いかんをとわず$$),
        (2, $$いかんによらず$$),
        (2, $$いかんにかかわらず$$),
        (3, $$いかんを問わず$$),
        (3, $$いかんをとわず$$),
        (3, $$いかんによらず$$),
        (3, $$いかんにかかわらず$$),
        (4, $$いかんを問わず$$),
        (4, $$いかんをとわず$$),
        (4, $$いかんによらず$$),
        (4, $$いかんにかかわらず$$),
        (5, $$いかんを問わず$$),
        (5, $$いかんをとわず$$),
        (5, $$いかんによらず$$),
        (5, $$いかんにかかわらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-39 — いかなる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-39',
    'grammar',
    'N1',
    $$いかなる$$,
    $$ikanaru$$,
    $$Qualquer / Que tipo de / Seja qual for$$,
    $$いかなる é uma forma formal de どんな. Equivale a "qualquer", "que tipo de" ou "seja qual for".

Costuma vir antes de substantivos e junto com expressões como でも, であれ ou a negação, reforçando que não há exceção. Por exemplo, "em qualquer situação, mantenha a calma" ou "não há motivo algum que justifique isso".

É usada em textos formais, regras, discursos e notícias.$$,
    $$É bem mais formal que どんな.

Expressões comuns são いかなる場合も, いかなる理由があっても e いかなる困難にも.$$,
    $$いかなる + Substantivo + でも / であれ / であろうと
いかなる + Substantivo + も + Frase negativa$$,
    $$いかなる$$,
    $$いかなる$$,
    ARRAY['いかなる']::text[],
    ARRAY['いかなる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-39', $$いかなる場合でも、冷静に行動してください。$$, $$いかなるばあいでも、れいせいにこうどうしてください。$$, $$Em qualquer situação, aja com calma.$$),
    ('n1-grammar-39', $$いかなる理由があっても、暴力は許されない。$$, $$いかなるりゆうがあっても、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n1-grammar-39', $$彼はいかなる困難にも負けなかった。$$, $$かれはいかなるこんなんにもまけなかった。$$, $$Ele não se rendeu a dificuldade alguma.$$),
    ('n1-grammar-39', $$いかなる人であれ、法律は守らなければならない。$$, $$いかなるひとであれ、ほうりつはまもらなければならない。$$, $$Seja quem for, é preciso respeitar a lei.$$),
    ('n1-grammar-39', $$いかなる質問にもお答えします。$$, $$いかなるしつもんにもおこたえします。$$, $$Responderemos a qualquer pergunta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____状況でも、あきらめてはいけない。$$, $$Em qualquer situação, não se deve desistir.$$),
        (2, $$____事情があろうと、約束は守るべきだ。$$, $$Sejam quais forem as circunstâncias, deve-se cumprir a promessa.$$),
        (3, $$当社は____責任も負いません。$$, $$Nossa empresa não assume responsabilidade alguma.$$),
        (4, $$____方法を使っても、彼を説得するのは無理だ。$$, $$Seja qual for o método, é impossível convencê-lo.$$),
        (5, $$____時も、笑顔を忘れないでほしい。$$, $$Quero que você nunca esqueça de sorrir, em qualquer momento.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかなる$$),
        (2, $$いかなる$$),
        (3, $$いかなる$$),
        (4, $$いかなる$$),
        (5, $$いかなる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-40 — いかに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-40',
    'grammar',
    'N1',
    $$いかに$$,
    $$ikani$$,
    $$Como / Quão / Por mais que$$,
    $$いかに é uma forma formal de どのように e どんなに. Tem alguns usos.

O primeiro é perguntar ou pensar sobre o modo de fazer algo, com o sentido de "como". Por exemplo, "o importante é como viver".

O segundo é destacar o grau de algo, com o sentido de "quão". Por exemplo, "percebi quão importante é a saúde".

O terceiro, com ても ou とも, significa "por mais que", como "por mais que seja difícil, não vou desistir".$$,
    $$É bem mais formal que どう e どんなに.

É comum em textos, discursos e títulos de livros, como いかに生きるか.$$,
    $$いかに + Verbo (modo)
いかに + Adjetivo + か (grau)
いかに + Verbo / Adjetivo + ても / とも (por mais que)$$,
    $$いかに$$,
    $$いかに$$,
    ARRAY['いかに']::text[],
    ARRAY['いかに', 'いかに〜ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-40', $$大切なのは、いかに生きるかだ。$$, $$たいせつなのは、いかにいきるかだ。$$, $$O importante é como viver.$$),
    ('n1-grammar-40', $$病気になって、健康がいかに大切かわかった。$$, $$びょうきになって、けんこうがいかにたいせつかわかった。$$, $$Ao ficar doente, percebi quão importante é a saúde.$$),
    ('n1-grammar-40', $$いかに忙しくても、食事はきちんととるべきだ。$$, $$いかにいそがしくても、しょくじはきちんととるべきだ。$$, $$Por mais ocupado que esteja, deve comer direito.$$),
    ('n1-grammar-40', $$いかに説明しても、彼は理解しなかった。$$, $$いかにせつめいしても、かれはりかいしなかった。$$, $$Por mais que eu explicasse, ele não entendeu.$$),
    ('n1-grammar-40', $$いかにして問題を解決するか考えよう。$$, $$いかにしてもんだいをかいけつするかかんがえよう。$$, $$Vamos pensar em como resolver o problema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は、時間を____使うかについて書かれている。$$, $$Este livro fala sobre como usar o tempo.$$),
        (2, $$____努力しても、才能には勝てないこともある。$$, $$Por mais que se esforce, às vezes não dá para vencer o talento.$$),
        (3, $$親になって、親が____大変かわかった。$$, $$Ao me tornar pai, entendi quão difícil é ser pai.$$),
        (4, $$____高くても、必要なものは買う。$$, $$Por mais caro que seja, compro o que é necessário.$$),
        (5, $$____すれば売り上げが伸びるか考えている。$$, $$Estou pensando em como aumentar as vendas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかに$$),
        (2, $$いかに$$),
        (3, $$いかに$$),
        (4, $$いかに$$),
        (5, $$いかに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-41 — いかにも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-41',
    'grammar',
    'N1',
    $$いかにも$$,
    $$ikanimo$$,
    $$Realmente / Bem típico de / Com toda a cara de$$,
    $$いかにも indica que algo parece muito ser aquilo, ou que combina perfeitamente com uma imagem. Equivale a "realmente", "bem típico de" ou "com toda a cara de".

Muitas vezes vem junto com らしい ou そうだ. Por exemplo, "é uma atitude bem típica dele" ou "parece muito gostoso".

Também pode ser usado como resposta para concordar, com o sentido de "exatamente", mas esse uso é antiquado.$$,
    $$Às vezes tem um tom de crítica, quando algo parece falso ou exagerado, como いかにも嘘っぽい.

É parecido com 本当に e まさに.$$,
    $$いかにも + Substantivo + らしい
いかにも + Adjetivo / Verbo + そうだ
いかにも + Adjetivo$$,
    $$いかにも$$,
    $$いかにも$$,
    ARRAY['いかにも']::text[],
    ARRAY['いかにも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-41', $$それはいかにも彼らしい考えだ。$$, $$それはいかにもかれらしいかんがえだ。$$, $$Essa é uma ideia bem típica dele.$$),
    ('n1-grammar-41', $$このケーキはいかにもおいしそうだ。$$, $$このケーキはいかにもおいしそうだ。$$, $$Este bolo tem toda a cara de ser gostoso.$$),
    ('n1-grammar-41', $$彼はいかにも困ったという顔をした。$$, $$かれはいかにもこまったというかおをした。$$, $$Ele fez uma cara de quem estava realmente em apuros.$$),
    ('n1-grammar-41', $$いかにも日本らしい景色だ。$$, $$いかにもにほんらしいけしきだ。$$, $$É uma paisagem bem típica do Japão.$$),
    ('n1-grammar-41', $$その話はいかにも嘘っぽい。$$, $$そのはなしはいかにもうそっぽい。$$, $$Essa história tem toda a cara de mentira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____京都らしい町並みだ。$$, $$É uma paisagem urbana bem típica de Kyoto.$$),
        (2, $$彼女は____楽しそうに笑った。$$, $$Ela riu com toda a cara de quem estava se divertindo.$$),
        (3, $$____高そうな車が止まっている。$$, $$Tem um carro estacionado com toda a cara de ser caro.$$),
        (4, $$それは____子供らしい質問だ。$$, $$Essa é uma pergunta bem típica de criança.$$),
        (5, $$彼は____知っているような顔をした。$$, $$Ele fez cara de quem realmente sabia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかにも$$),
        (2, $$いかにも$$),
        (3, $$いかにも$$),
        (4, $$いかにも$$),
        (5, $$いかにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-42 — いずれにしても / いずれにしろ / いずれにせよ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-42',
    'grammar',
    'N1',
    $$いずれにしても / いずれにしろ / いずれにせよ$$,
    $$izure ni shite mo / izure ni shiro / izure ni seyo$$,
    $$De qualquer forma / Seja como for / Em todo caso$$,
    $$いずれにしても, いずれにしろ e いずれにせよ servem para dizer que, seja qual for a situação ou a escolha, a conclusão é a mesma. Equivalem a "de qualquer forma" ou "seja como for".

São usadas para encerrar uma discussão e ir direto ao ponto principal. Por exemplo, "seja como for, precisamos decidir até amanhã".

いずれにせよ é a forma mais formal, e いずれにしても é a mais comum na fala.$$,
    $$São parecidas com とにかく e どちらにしても.

Costumam aparecer no começo da frase, depois de uma discussão com várias possibilidades.$$,
    $$いずれにしても / いずれにしろ / いずれにせよ、 + Conclusão$$,
    $$いずれにしても$$,
    $$いずれにしても|いずれにしろ|いずれにせよ$$,
    ARRAY['いずれ', 'に', 'しても']::text[],
    ARRAY['いずれにしても', 'いずれにしろ', 'いずれにせよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-42', $$いずれにしても、明日までに決めなければならない。$$, $$いずれにしても、あしたまでにきめなければならない。$$, $$De qualquer forma, temos que decidir até amanhã.$$),
    ('n1-grammar-42', $$行くか行かないか、いずれにせよ連絡してください。$$, $$いくかいかないか、いずれにせよれんらくしてください。$$, $$Indo ou não, em todo caso, entre em contato.$$),
    ('n1-grammar-42', $$いずれにしろ、もう一度話し合う必要がある。$$, $$いずれにしろ、もういちどはなしあうひつようがある。$$, $$Seja como for, é preciso conversar mais uma vez.$$),
    ('n1-grammar-42', $$原因はわからないが、いずれにしても修理が必要だ。$$, $$げんいんはわからないが、いずれにしてもしゅうりがひつようだ。$$, $$Não sei a causa, mas de qualquer forma precisa de conserto.$$),
    ('n1-grammar-42', $$いずれにせよ、結果はすぐにわかるだろう。$$, $$いずれにせよ、けっかはすぐにわかるだろう。$$, $$Seja como for, o resultado deve sair logo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、早めに準備しておこう。$$, $$De qualquer forma, vamos nos preparar com antecedência.$$),
        (2, $$賛成でも反対でも、____意見を聞かせてください。$$, $$A favor ou contra, em todo caso, me diga sua opinião.$$),
        (3, $$____、彼の責任は重い。$$, $$Seja como for, a responsabilidade dele é grande.$$),
        (4, $$電車でもバスでも、____一時間はかかる。$$, $$De trem ou de ônibus, de qualquer forma leva uma hora.$$),
        (5, $$____、今日はもう遅いから帰ろう。$$, $$Seja como for, já está tarde hoje, vamos embora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いずれにしても$$),
        (1, $$いずれにしろ$$),
        (1, $$いずれにせよ$$),
        (2, $$いずれにしても$$),
        (2, $$いずれにしろ$$),
        (2, $$いずれにせよ$$),
        (3, $$いずれにしても$$),
        (3, $$いずれにしろ$$),
        (3, $$いずれにせよ$$),
        (4, $$いずれにしても$$),
        (4, $$いずれにしろ$$),
        (4, $$いずれにせよ$$),
        (5, $$いずれにしても$$),
        (5, $$いずれにしろ$$),
        (5, $$いずれにせよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-43 — 〜じみた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-43',
    'grammar',
    'N1',
    $$〜じみた$$,
    $$jimita$$,
    $$Com jeito de / Que parece / Infantil$$,
    $$じみた indica que algo parece ou tem características de algo, geralmente de forma negativa. Equivale a "com jeito de" ou "que parece".

Por exemplo, 子供じみた significa "infantil", e 脅迫じみた significa "com tom de ameaça".

É usado para criticar uma atitude ou um comportamento.$$,
    $$Expressões comuns são 子供じみた, 年寄りじみた, 芝居じみた, 脅迫じみた e 狂気じみた.

É parecido com めいた e っぽい, mas じみた tem um tom mais crítico.$$,
    $$Substantivo + じみた + Substantivo
Substantivo + じみている$$,
    $$じみた$$,
    $$じみた|じみて$$,
    ARRAY['じみた']::text[],
    ARRAY['じみた', 'じみている', 'じみて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-43', $$そんな子供じみたことはやめなさい。$$, $$そんなこどもじみたことはやめなさい。$$, $$Pare com essa infantilidade.$$),
    ('n1-grammar-43', $$彼の言い方は脅迫じみていた。$$, $$かれのいいかたはきょうはくじみていた。$$, $$O jeito como ele falou tinha um tom de ameaça.$$),
    ('n1-grammar-43', $$芝居じみた態度に、みんなあきれた。$$, $$しばいじみたたいどに、みんなあきれた。$$, $$Todos ficaram pasmos com aquela atitude teatral.$$),
    ('n1-grammar-43', $$まだ若いのに、年寄りじみたことを言う。$$, $$まだわかいのに、としよりじみたことをいう。$$, $$Ainda é jovem, mas fala como um velho.$$),
    ('n1-grammar-43', $$狂気じみた行動に驚いた。$$, $$きょうきじみたこうどうにおどろいた。$$, $$Fiquei surpreso com aquele comportamento que parecia loucura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大人なのに、子供____いたずらをする。$$, $$Mesmo sendo adulto, faz travessuras infantis.$$),
        (2, $$彼の話は説教____いて、聞きたくない。$$, $$O que ele fala parece um sermão, não quero ouvir.$$),
        (3, $$芝居____言い訳はやめてくれ。$$, $$Pare com essas desculpas teatrais.$$),
        (4, $$その手紙には脅迫____内容が書かれていた。$$, $$Aquela carta tinha um conteúdo com tom de ameaça.$$),
        (5, $$彼女の服装は少し年寄り____。$$, $$As roupas dela têm um pouco de jeito de velha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$じみた$$),
        (2, $$じみて$$),
        (3, $$じみた$$),
        (4, $$じみた$$),
        (5, $$じみている$$),
        (5, $$じみていた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-44 — 〜か否か
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-44',
    'grammar',
    'N1',
    $$〜か否か$$,
    $$ka ina ka$$,
    $$Se... ou não / Sim ou não / Ou não$$,
    $$か否か indica duas possibilidades opostas, com o sentido de "se... ou não". É a forma formal de かどうか.

É muito usada em textos, notícias, documentos e discursos. Por exemplo, "ainda não se sabe se o plano vai dar certo ou não".

否 significa "não", então か否か é literalmente "sim ou não".$$,
    $$É mais formal que かどうか.

Costuma vir com verbos como わからない, 決める, 問題だ e 判断する.$$,
    $$Verbo (forma simples) + か否か
Adjetivo い + か否か
Adjetivo な / Substantivo + (である) + か否か$$,
    $$か否か$$,
    $$か否か|かいなか$$,
    ARRAY['か', '否', 'か']::text[],
    ARRAY['か否か']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-44', $$計画が成功するか否かは、まだわからない。$$, $$けいかくがせいこうするかいなかは、まだわからない。$$, $$Ainda não se sabe se o plano vai dar certo ou não.$$),
    ('n1-grammar-44', $$参加するか否か、明日までに決めてください。$$, $$さんかするかいなか、あしたまでにきめてください。$$, $$Decida até amanhã se vai participar ou não.$$),
    ('n1-grammar-44', $$彼が犯人であるか否かが問題だ。$$, $$かれがはんにんであるかいなかがもんだいだ。$$, $$A questão é se ele é o culpado ou não.$$),
    ('n1-grammar-44', $$この薬が安全か否か、調べる必要がある。$$, $$このくすりがあんぜんかいなか、しらべるひつようがある。$$, $$É preciso investigar se este remédio é seguro ou não.$$),
    ('n1-grammar-44', $$合格するか否かは、本人の努力次第だ。$$, $$ごうかくするかいなかは、ほんにんのどりょくしだいだ。$$, $$Passar ou não depende do esforço da própria pessoa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その話が本当____、確かめたい。$$, $$Quero confirmar se essa história é verdade ou não.$$),
        (2, $$留学する____、まだ迷っている。$$, $$Ainda estou em dúvida se faço intercâmbio ou não.$$),
        (3, $$試合が行われる____は、天気によって決まる。$$, $$Se a partida será realizada ou não depende do tempo.$$),
        (4, $$彼が来る____、誰も知らない。$$, $$Ninguém sabe se ele vem ou não.$$),
        (5, $$この意見が正しい____、議論が続いている。$$, $$A discussão continua sobre se esta opinião está correta ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$か否か$$),
        (2, $$か否か$$),
        (3, $$か否か$$),
        (4, $$か否か$$),
        (5, $$か否か$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-45 — 〜かと思いきや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-45',
    'grammar',
    'N1',
    $$〜かと思いきや$$,
    $$ka to omoikiya$$,
    $$Quando se pensava que / Achei que... mas / Contrariando as expectativas$$,
    $$かと思いきや indica que a pessoa esperava um resultado, mas aconteceu algo diferente, para a surpresa dela. Equivale a "quando se pensava que..." ou "achei que..., mas".

A primeira parte mostra a expectativa, e a segunda mostra o resultado inesperado. Por exemplo, "achei que ia chover, mas fez sol".

É uma expressão um pouco literária, comum na escrita.$$,
    $$Não se usa para falar de algo que aconteceu de acordo com o esperado.

É parecido com と思ったら e と思っていたのに.$$,
    $$Frase (forma simples) + かと思いきや + Resultado inesperado
Substantivo + かと思いきや$$,
    $$かと思いきや$$,
    $$かと思いきや|かとおもいきや|と思いきや$$,
    ARRAY['か', 'と', '思いきや']::text[],
    ARRAY['かと思いきや', 'と思いきや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-45', $$雨が降るかと思いきや、晴れてきた。$$, $$あめがふるかとおもいきや、はれてきた。$$, $$Achei que ia chover, mas abriu o sol.$$),
    ('n1-grammar-45', $$簡単な試験かと思いきや、とても難しかった。$$, $$かんたんなしけんかとおもいきや、とてもむずかしかった。$$, $$Pensei que fosse uma prova fácil, mas foi muito difícil.$$),
    ('n1-grammar-45', $$彼は怒るかと思いきや、笑い出した。$$, $$かれはおこるかとおもいきや、わらいだした。$$, $$Achei que ele ia ficar bravo, mas começou a rir.$$),
    ('n1-grammar-45', $$もう終わったかと思いきや、まだ半分も残っていた。$$, $$もうおわったかとおもいきや、まだはんぶんものこっていた。$$, $$Achei que já tinha acabado, mas ainda faltava metade.$$),
    ('n1-grammar-45', $$高いと思いきや、意外に安かった。$$, $$たかいとおもいきや、いがいにやすかった。$$, $$Pensei que fosse caro, mas foi surpreendentemente barato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は泣く____、笑顔で別れを告げた。$$, $$Achei que ela fosse chorar, mas se despediu sorrindo.$$),
        (2, $$あの店は閉まっている____、まだ営業していた。$$, $$Achei que aquela loja estivesse fechada, mas ainda estava funcionando.$$),
        (3, $$弱いチームだ____、優勝してしまった。$$, $$Pensei que fosse um time fraco, mas acabou vencendo.$$),
        (4, $$春になった____、また雪が降った。$$, $$Pensei que a primavera tinha chegado, mas nevou de novo.$$),
        (5, $$すぐに返事が来る____、一週間たっても来ない。$$, $$Achei que a resposta viria logo, mas nem depois de uma semana chegou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かと思いきや$$),
        (1, $$かとおもいきや$$),
        (2, $$かと思いきや$$),
        (2, $$かとおもいきや$$),
        (3, $$と思いきや$$),
        (4, $$かと思いきや$$),
        (4, $$かとおもいきや$$),
        (5, $$かと思いきや$$),
        (5, $$かとおもいきや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-46 — 〜限りだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-46',
    'grammar',
    'N1',
    $$〜限りだ$$,
    $$kagiri da$$,
    $$Extremamente / Muitíssimo / Não poderia estar mais$$,
    $$限りだ expressa um sentimento muito forte da pessoa que fala. Equivale a "extremamente" ou "não poderia estar mais...".

Costuma vir com adjetivos de emoção, como feliz, triste, solitário, invejoso ou envergonhado. Por exemplo, "estou extremamente feliz em reencontrar todos".

É uma expressão formal, comum em cartas, discursos e cerimônias.$$,
    $$É usado apenas com sentimentos da primeira pessoa.

Expressões comuns são うれしい限りだ, 寂しい限りだ, うらやましい限りだ e 残念な限りだ.$$,
    $$Adjetivo い + 限りだ
Adjetivo な + な + 限りだ
Substantivo + の + 限りだ$$,
    $$限りだ$$,
    $$限りだ|限りです|かぎりだ$$,
    ARRAY['限り', 'だ']::text[],
    ARRAY['限りだ', '限りです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-46', $$皆さんにまた会えて、うれしい限りです。$$, $$みなさんにまたあえて、うれしいかぎりです。$$, $$Estou extremamente feliz por reencontrar todos vocês.$$),
    ('n1-grammar-46', $$友達がみんな引っ越してしまって、寂しい限りだ。$$, $$ともだちがみんなひっこしてしまって、さびしいかぎりだ。$$, $$Todos os meus amigos se mudaram, estou muito solitário.$$),
    ('n1-grammar-46', $$毎年海外旅行に行けるなんて、うらやましい限りだ。$$, $$まいとしかいがいりょこうにいけるなんて、うらやましいかぎりだ。$$, $$Poder viajar para o exterior todo ano, que inveja enorme.$$),
    ('n1-grammar-46', $$こんな結果になって、残念な限りです。$$, $$こんなけっかになって、ざんねんなかぎりです。$$, $$É uma enorme pena que tenha dado neste resultado.$$),
    ('n1-grammar-46', $$子供の成長は頼もしい限りだ。$$, $$こどものせいちょうはたのもしいかぎりだ。$$, $$O crescimento dos filhos me dá extrema confiança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝できて、うれしい____。$$, $$Estou extremamente feliz por ter vencido.$$),
        (2, $$恩師が亡くなって、悲しい____。$$, $$Meu antigo professor faleceu, estou muitíssimo triste.$$),
        (3, $$あんな失敗をして、恥ずかしい____。$$, $$Cometi um erro daqueles, estou extremamente envergonhado.$$),
        (4, $$一人で夕食を食べるのは、心細い____。$$, $$Jantar sozinho me deixa muito desamparado.$$),
        (5, $$若い人が頑張っている姿は、心強い____。$$, $$Ver os jovens se esforçando me dá muita confiança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$限りだ$$),
        (1, $$限りです$$),
        (2, $$限りだ$$),
        (2, $$限りです$$),
        (3, $$限りだ$$),
        (3, $$限りです$$),
        (4, $$限りだ$$),
        (4, $$限りです$$),
        (5, $$限りだ$$),
        (5, $$限りです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-47 — 〜甲斐もなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-47',
    'grammar',
    'N1',
    $$〜甲斐もなく$$,
    $$kai mo naku$$,
    $$Apesar de / Em vão / Sem resultado$$,
    $$甲斐もなく indica que, apesar de um esforço, o resultado esperado não veio. Equivale a "apesar de..., em vão" ou "sem resultado".

A pessoa lamenta que todo o empenho não serviu para nada. Por exemplo, "apesar do tratamento, ele faleceu" ou "apesar de ter estudado, reprovei".

Também aparece como 甲斐がある, com o sentido de "vale a pena".$$,
    $$Também é escrito かいもなく. Depois de outras palavras, pode virar がい, como em やりがい e 生きがい.

Expressões comuns são 努力の甲斐もなく, 看病の甲斐もなく e 応援の甲斐もなく.$$,
    $$Verbo (forma た) + 甲斐もなく
Substantivo + の + 甲斐もなく$$,
    $$甲斐もなく$$,
    $$甲斐もなく|かいもなく|甲斐なく$$,
    ARRAY['甲斐', 'も', 'なく']::text[],
    ARRAY['甲斐もなく', 'かいもなく', '甲斐なく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-47', $$家族の看病の甲斐もなく、祖父は亡くなった。$$, $$かぞくのかんびょうのかいもなく、そふはなくなった。$$, $$Apesar dos cuidados da família, meu avô faleceu.$$),
    ('n1-grammar-47', $$一生懸命練習した甲斐もなく、試合に負けた。$$, $$いっしょうけんめいれんしゅうしたかいもなく、しあいにまけた。$$, $$Treinei com todo o empenho, mas em vão: perdemos a partida.$$),
    ('n1-grammar-47', $$応援の甲斐もなく、チームは予選で敗退した。$$, $$おうえんのかいもなく、チームはよせんではいたいした。$$, $$Apesar da torcida, a equipe foi eliminada nas eliminatórias.$$),
    ('n1-grammar-47', $$努力の甲斐もなく、計画は失敗に終わった。$$, $$どりょくのかいもなく、けいかくはしっぱいにおわった。$$, $$Apesar dos esforços, o plano acabou em fracasso.$$),
    ('n1-grammar-47', $$手術の甲斐なく、犬は助からなかった。$$, $$しゅじゅつのかいなく、いぬはたすからなかった。$$, $$Apesar da cirurgia, o cachorro não sobreviveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日勉強した____、不合格だった。$$, $$Estudei todos os dias, mas em vão: reprovei.$$),
        (2, $$医者の治療の____、病気は悪化した。$$, $$Apesar do tratamento médico, a doença piorou.$$),
        (3, $$早起きした____、電車に乗り遅れた。$$, $$Acordei cedo, mas em vão: perdi o trem.$$),
        (4, $$説得の____、彼は会社を辞めた。$$, $$Apesar das tentativas de convencê-lo, ele saiu da empresa.$$),
        (5, $$ダイエットした____、体重は減らなかった。$$, $$Fiz dieta, mas sem resultado: não perdi peso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$甲斐もなく$$),
        (1, $$かいもなく$$),
        (2, $$甲斐もなく$$),
        (2, $$かいもなく$$),
        (2, $$甲斐なく$$),
        (3, $$甲斐もなく$$),
        (3, $$かいもなく$$),
        (4, $$甲斐もなく$$),
        (4, $$かいもなく$$),
        (4, $$甲斐なく$$),
        (5, $$甲斐もなく$$),
        (5, $$かいもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-48 — 〜可能性がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-48',
    'grammar',
    'N1',
    $$〜可能性がある$$,
    $$kanousei ga aru$$,
    $$Há possibilidade de / Pode ser que / É possível que$$,
    $$可能性がある indica que existe a possibilidade de algo acontecer ou ser verdade. Equivale a "há possibilidade de" ou "pode ser que".

É uma expressão objetiva, muito usada em notícias, relatórios, previsões e explicações. Por exemplo, "há possibilidade de chover amanhã".

Pode ser usada tanto para coisas boas quanto ruins.$$,
    $$Para indicar alta probabilidade, usa-se 可能性が高い. Para baixa, 可能性が低い.

É mais formal e objetivo que かもしれない.

Não se confunde com 恐れがある, que é usado apenas para coisas ruins.$$,
    $$Verbo (forma simples) + 可能性がある
Adjetivo い + 可能性がある
Adjetivo な / Substantivo + である + 可能性がある$$,
    $$可能性がある$$,
    $$可能性がある|可能性があります|可能性が|可能性も|可能性は|かのうせいがある$$,
    ARRAY['可能性', 'が', 'ある']::text[],
    ARRAY['可能性がある', '可能性があります', '可能性が高い', '可能性もある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-48', $$明日は雨が降る可能性がある。$$, $$あしたはあめがふるかのうせいがある。$$, $$Há possibilidade de chover amanhã.$$),
    ('n1-grammar-48', $$この薬は副作用が出る可能性があります。$$, $$このくすりはふくさようがでるかのうせいがあります。$$, $$Este remédio pode causar efeitos colaterais.$$),
    ('n1-grammar-48', $$彼が犯人である可能性が高い。$$, $$かれがはんにんであるかのうせいがたかい。$$, $$É bem possível que ele seja o culpado.$$),
    ('n1-grammar-48', $$計画が変更される可能性もある。$$, $$けいかくがへんこうされるかのうせいもある。$$, $$Também é possível que o plano seja alterado.$$),
    ('n1-grammar-48', $$この技術は将来、大きく発展する可能性がある。$$, $$このぎじゅつはしょうらい、おおきくはってんするかのうせいがある。$$, $$Esta tecnologia tem possibilidade de se desenvolver muito no futuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車が遅れる____。$$, $$Há possibilidade de o trem atrasar.$$),
        (2, $$この問題は、すぐに解決できる____。$$, $$É possível que este problema seja resolvido logo.$$),
        (3, $$彼女が優勝する____高い。$$, $$A possibilidade de ela vencer é alta.$$),
        (4, $$このデータは間違っている____。$$, $$Pode ser que estes dados estejam errados.$$),
        (5, $$台風が上陸する____。$$, $$Há possibilidade de o tufão chegar à terra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$可能性がある$$),
        (1, $$可能性があります$$),
        (2, $$可能性がある$$),
        (2, $$可能性があります$$),
        (3, $$可能性が$$),
        (3, $$可能性は$$),
        (4, $$可能性がある$$),
        (4, $$可能性があります$$),
        (5, $$可能性がある$$),
        (5, $$可能性があります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-49 — 〜からある / 〜からする / 〜からの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-49',
    'grammar',
    'N1',
    $$〜からある / 〜からする / 〜からの$$,
    $$kara aru / kara suru / kara no$$,
    $$Mais de / Nada menos que / Pelo menos$$,
    $$からある, からする e からの vêm depois de números e destacam que a quantidade é muito grande. Equivalem a "mais de" ou "nada menos que".

からある é usado com tamanho, peso ou distância, como "um peixe de mais de dez quilos". からする é usado com preços, como "um relógio de mais de um milhão de ienes". からの é usado com quantidade de pessoas ou coisas, como "mais de mil pessoas".

A pessoa mostra surpresa diante do número.$$,
    $$O número costuma ser redondo e grande, como 百, 千 ou 一万.

É parecido com 以上の, mas expressa mais surpresa.$$,
    $$Número + からある + Substantivo (tamanho / peso / distância)
Número + からする + Substantivo (preço)
Número + からの + Substantivo (quantidade)$$,
    $$からある$$,
    $$からある|からする|からの$$,
    ARRAY['から', 'ある']::text[],
    ARRAY['からある', 'からする', 'からの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-49', $$彼は百キロからある荷物を一人で運んだ。$$, $$かれはひゃっキロからあるにもつをひとりではこんだ。$$, $$Ele carregou sozinho uma bagagem de mais de cem quilos.$$),
    ('n1-grammar-49', $$百万円からする時計を買った。$$, $$ひゃくまんえんからするとけいをかった。$$, $$Comprou um relógio de nada menos que um milhão de ienes.$$),
    ('n1-grammar-49', $$会場には一万人からの観客が集まった。$$, $$かいじょうにはいちまんにんからのかんきゃくがあつまった。$$, $$Mais de dez mil espectadores se reuniram no local.$$),
    ('n1-grammar-49', $$二十キロからある道を歩いて帰った。$$, $$にじゅっキロからあるみちをあるいてかえった。$$, $$Voltou a pé por um caminho de mais de vinte quilômetros.$$),
    ('n1-grammar-49', $$一泊十万円からするホテルに泊まった。$$, $$いっぱくじゅうまんえんからするホテルにとまった。$$, $$Ficou num hotel que custa mais de cem mil ienes por noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三メートル____大きな魚が釣れた。$$, $$Pescaram um peixe enorme de mais de três metros.$$),
        (2, $$一台一千万円____車だ。$$, $$É um carro que custa mais de dez milhões de ienes.$$),
        (3, $$千人____人が、デモに参加した。$$, $$Mais de mil pessoas participaram da manifestação.$$),
        (4, $$彼女は五百ページ____本を一日で読んだ。$$, $$Ela leu num dia um livro de mais de quinhentas páginas.$$),
        (5, $$この絵は一億円____と言われている。$$, $$Dizem que este quadro custa mais de cem milhões de ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からある$$),
        (2, $$からする$$),
        (3, $$からの$$),
        (4, $$からある$$),
        (5, $$からする$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-50 — 〜かれ〜かれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-50',
    'grammar',
    'N1',
    $$〜かれ〜かれ$$,
    $$kare ~ kare$$,
    $$Mais ou menos / Seja... seja / Em maior ou menor grau$$,
    $$かれ〜かれ é uma forma antiga usada com pares de adjetivos opostos, indicando que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "em maior ou menor grau".

É usada principalmente em expressões fixas, como 多かれ少なかれ, "mais ou menos", e 遅かれ早かれ, "mais cedo ou mais tarde".

Por exemplo, "mais cedo ou mais tarde, a verdade vai aparecer".$$,
    $$Só funciona com alguns pares fixos, como 多かれ少なかれ, 遅かれ早かれ e 良かれ悪しかれ.

É uma expressão formal, comum na escrita e em discursos.$$,
    $$Adjetivo い (sem い) + かれ + Adjetivo oposto (sem い) + かれ$$,
    $$かれ〜かれ$$,
    $$かれ$$,
    ARRAY['かれ']::text[],
    ARRAY['かれ〜かれ', '多かれ少なかれ', '遅かれ早かれ', '良かれ悪しかれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-50', $$多かれ少なかれ、誰にでも悩みはある。$$, $$おおかれすくなかれ、だれにでもなやみはある。$$, $$Em maior ou menor grau, todo mundo tem preocupações.$$),
    ('n1-grammar-50', $$遅かれ早かれ、真実は明らかになるだろう。$$, $$おそかれはやかれ、しんじつはあきらかになるだろう。$$, $$Mais cedo ou mais tarde, a verdade vai aparecer.$$),
    ('n1-grammar-50', $$良かれ悪しかれ、彼は会社に大きな影響を与えた。$$, $$よかれあしかれ、かれはかいしゃにおおきなえいきょうをあたえた。$$, $$Para o bem ou para o mal, ele teve grande influência na empresa.$$),
    ('n1-grammar-50', $$人は多かれ少なかれ、親の影響を受けている。$$, $$ひとはおおかれすくなかれ、おやのえいきょうをうけている。$$, $$As pessoas são, mais ou menos, influenciadas pelos pais.$$),
    ('n1-grammar-50', $$遅かれ早かれ、彼も気づくはずだ。$$, $$おそかれはやかれ、かれもきづくはずだ。$$, $$Mais cedo ou mais tarde, ele também vai perceber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$多____少なかれ、誰でも失敗はする。$$, $$Em maior ou menor grau, todo mundo erra.$$),
        (2, $$遅かれ早____、この問題に向き合わなければならない。$$, $$Mais cedo ou mais tarde, teremos que encarar este problema.$$),
        (3, $$良____悪しかれ、それが現実だ。$$, $$Para o bem ou para o mal, essa é a realidade.$$),
        (4, $$遅____早かれ、彼は会社を辞めるだろう。$$, $$Mais cedo ou mais tarde, ele vai sair da empresa.$$),
        (5, $$人は多かれ少な____、うそをつくものだ。$$, $$As pessoas, em maior ou menor grau, mentem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かれ$$),
        (2, $$かれ$$),
        (3, $$かれ$$),
        (4, $$かれ$$),
        (5, $$かれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-51 — 〜かたがた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-51',
    'grammar',
    'N1',
    $$〜かたがた$$,
    $$katagata$$,
    $$Aproveitando para / Ao mesmo tempo / Também para$$,
    $$かたがた indica que, ao fazer uma ação, a pessoa aproveita para cumprir também outro objetivo. Equivale a "aproveitando para" ou "também para".

É uma expressão muito formal, usada principalmente em cartas, e-mails de trabalho e cumprimentos. Por exemplo, "venho visitá-lo para agradecer e também para me apresentar".

A segunda parte costuma ser um verbo de visita ou de comunicação.$$,
    $$Expressões comuns são お礼かたがた, ご挨拶かたがた e お見舞いかたがた.

É parecido com がてら, mas かたがた é muito mais formal e usado em situações de cortesia.$$,
    $$Substantivo (ação) + かたがた + Verbo de visita / comunicação$$,
    $$かたがた$$,
    $$かたがた$$,
    ARRAY['かたがた']::text[],
    ARRAY['かたがた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-51', $$お礼かたがた、ご挨拶に伺いました。$$, $$おれいかたがた、ごあいさつにうかがいました。$$, $$Vim cumprimentá-lo e, ao mesmo tempo, agradecer.$$),
    ('n1-grammar-51', $$ご報告かたがた、お手紙を差し上げます。$$, $$ごほうこくかたがた、おてがみをさしあげます。$$, $$Envio esta carta também para lhe dar notícias.$$),
    ('n1-grammar-51', $$お見舞いかたがた、先生のお宅を訪ねた。$$, $$おみまいかたがた、せんせいのおたくをたずねた。$$, $$Visitei a casa do professor, aproveitando para ver como ele estava.$$),
    ('n1-grammar-51', $$近くまで来たので、ご挨拶かたがた寄らせていただきました。$$, $$ちかくまできたので、ごあいさつかたがたよらせていただきました。$$, $$Como vim até aqui perto, passei para cumprimentá-lo.$$),
    ('n1-grammar-51', $$お詫びかたがた、ご説明に参りました。$$, $$おわびかたがた、ごせつめいにまいりました。$$, $$Vim pedir desculpas e também dar explicações.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$就職のご報告____、恩師を訪ねた。$$, $$Visitei meu antigo professor, aproveitando para contar sobre o novo emprego.$$),
        (2, $$お礼____、お電話いたしました。$$, $$Liguei também para agradecer.$$),
        (3, $$ご挨拶____、新しい名刺をお渡しします。$$, $$Aproveitando para cumprimentá-lo, entrego meu novo cartão de visita.$$),
        (4, $$出張の報告____、本社に伺った。$$, $$Fui à matriz, aproveitando para relatar a viagem de negócios.$$),
        (5, $$お祝い____、お伺いしてもよろしいでしょうか。$$, $$Posso visitá-lo também para dar os parabéns?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かたがた$$),
        (2, $$かたがた$$),
        (3, $$かたがた$$),
        (4, $$かたがた$$),
        (5, $$かたがた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-52 — 〜かたわら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-52',
    'grammar',
    'N1',
    $$〜かたわら$$,
    $$katawara$$,
    $$Ao mesmo tempo que / Paralelamente a / Além de$$,
    $$かたわら indica que, além de uma atividade principal, a pessoa realiza outra atividade em paralelo, durante um longo período. Equivale a "ao mesmo tempo que" ou "paralelamente a".

Muitas vezes a primeira parte é o trabalho principal, e a segunda é uma atividade secundária. Por exemplo, "trabalha numa empresa e, paralelamente, escreve romances".

É uma expressão formal, comum na escrita.$$,
    $$Diferente de ながら, かたわら não indica ações ao mesmo tempo, mas atividades que acontecem em paralelo ao longo de um período.

Também pode significar "ao lado de", como em 道のかたわら.$$,
    $$Verbo (forma dicionário) + かたわら
Substantivo + の + かたわら$$,
    $$かたわら$$,
    $$かたわら|傍ら$$,
    ARRAY['かたわら']::text[],
    ARRAY['かたわら', '傍ら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-52', $$彼は会社に勤めるかたわら、小説を書いている。$$, $$かれはかいしゃにつとめるかたわら、しょうせつをかいている。$$, $$Ele trabalha numa empresa e, paralelamente, escreve romances.$$),
    ('n1-grammar-52', $$彼女は子育てのかたわら、大学で勉強している。$$, $$かのじょはこそだてのかたわら、だいがくでべんきょうしている。$$, $$Ela cuida dos filhos e, ao mesmo tempo, estuda na universidade.$$),
    ('n1-grammar-52', $$父は農業をするかたわら、村長を務めている。$$, $$ちちはのうぎょうをするかたわら、そんちょうをつとめている。$$, $$Meu pai trabalha na agricultura e, além disso, é prefeito da vila.$$),
    ('n1-grammar-52', $$仕事のかたわら、ボランティア活動をしている。$$, $$しごとのかたわら、ボランティアかつどうをしている。$$, $$Além do trabalho, faço trabalho voluntário.$$),
    ('n1-grammar-52', $$彼は医者のかたわら、画家としても活躍している。$$, $$かれはいしゃのかたわら、がかとしてもかつやくしている。$$, $$Ele é médico e, paralelamente, faz sucesso como pintor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$教師をする____、翻訳の仕事もしている。$$, $$Sou professor e, paralelamente, também faço traduções.$$),
        (2, $$学業の____、アルバイトをしている。$$, $$Além dos estudos, trabalho meio período.$$),
        (3, $$彼は店を経営する____、料理教室も開いている。$$, $$Ele administra uma loja e, ao mesmo tempo, dá aulas de culinária.$$),
        (4, $$本業の____、趣味で写真を撮っている。$$, $$Além do trabalho principal, tiro fotos como hobby.$$),
        (5, $$研究の____、学生の指導も行っている。$$, $$Além da pesquisa, também oriento os alunos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かたわら$$),
        (1, $$傍ら$$),
        (2, $$かたわら$$),
        (2, $$傍ら$$),
        (3, $$かたわら$$),
        (3, $$傍ら$$),
        (4, $$かたわら$$),
        (4, $$傍ら$$),
        (5, $$かたわら$$),
        (5, $$傍ら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-53 — かつて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-53',
    'grammar',
    'N1',
    $$かつて$$,
    $$katsute$$,
    $$Antigamente / Outrora / Uma vez$$,
    $$かつて indica algo que aconteceu ou existia no passado, mas que não existe mais ou mudou. Equivale a "antigamente" ou "outrora".

Por exemplo, "antigamente, aqui havia um castelo". É mais formal que 昔 ou 以前.

Com uma forma negativa, かつてない significa "sem precedentes" ou "nunca antes visto".$$,
    $$Expressões comuns são かつての, como かつての友人, e いまだかつてない, "nunca antes".

É usada principalmente na escrita e em falas formais.$$,
    $$かつて + Frase (passado)
かつてない + Substantivo (sem precedentes)$$,
    $$かつて$$,
    $$かつて|嘗て$$,
    ARRAY['かつて']::text[],
    ARRAY['かつて', 'かつての', 'かつてない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-53', $$ここにはかつて大きな城があった。$$, $$ここにはかつておおきなしろがあった。$$, $$Antigamente, aqui havia um grande castelo.$$),
    ('n1-grammar-53', $$かつての友人に、偶然再会した。$$, $$かつてのゆうじんに、ぐうぜんさいかいした。$$, $$Reencontrei por acaso um antigo amigo.$$),
    ('n1-grammar-53', $$これはかつてない大きな災害だ。$$, $$これはかつてないおおきなさいがいだ。$$, $$Este é um desastre de proporções sem precedentes.$$),
    ('n1-grammar-53', $$彼はかつて有名な歌手だった。$$, $$かれはかつてゆうめいなかしゅだった。$$, $$Ele foi, outrora, um cantor famoso.$$),
    ('n1-grammar-53', $$かつてこの町は工業で栄えていた。$$, $$かつてこのまちはこうぎょうでさかえていた。$$, $$Antigamente, esta cidade prosperava com a indústria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私は____この町に住んでいた。$$, $$Eu morei nesta cidade antigamente.$$),
        (2, $$____ない規模の大会が開かれた。$$, $$Foi realizado um campeonato de proporções sem precedentes.$$),
        (3, $$____の恋人から手紙が届いた。$$, $$Chegou uma carta de um antigo namorado.$$),
        (4, $$この地域は____海だった。$$, $$Esta região foi mar, outrora.$$),
        (5, $$いまだ____経験したことのない暑さだ。$$, $$É um calor que nunca antes experimentei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かつて$$),
        (2, $$かつて$$),
        (3, $$かつて$$),
        (4, $$かつて$$),
        (5, $$かつて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-54 — 〜嫌いがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-54',
    'grammar',
    'N1',
    $$〜嫌いがある$$,
    $$kirai ga aru$$,
    $$Ter tendência a / Costumar / Ter o mau hábito de$$,
    $$嫌いがある indica que alguém tem uma tendência negativa, um mau hábito ou um defeito no jeito de agir. Equivale a "ter tendência a" ou "ter o mau hábito de".

É usado para criticar de forma indireta. Por exemplo, "ele tem tendência a exagerar" ou "os jovens costumam evitar o esforço".

É uma expressão formal, mais comum na escrita.$$,
    $$Também é escrito きらいがある.

Só é usado para tendências negativas.

É parecido com 傾向がある e がちだ, mas 嫌いがある é mais formal e crítico.$$,
    $$Verbo (forma dicionário / forma ない) + 嫌いがある
Substantivo + の + 嫌いがある$$,
    $$嫌いがある$$,
    $$嫌いがある|きらいがある|嫌いがあります|きらいがあります$$,
    ARRAY['嫌い', 'が', 'ある']::text[],
    ARRAY['嫌いがある', 'きらいがある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-54', $$彼は物事を大げさに言う嫌いがある。$$, $$かれはものごとをおおげさにいうきらいがある。$$, $$Ele tem tendência a exagerar as coisas.$$),
    ('n1-grammar-54', $$最近の若者は、苦労を避ける嫌いがある。$$, $$さいきんのわかものは、くろうをさけるきらいがある。$$, $$Os jovens de hoje têm tendência a evitar dificuldades.$$),
    ('n1-grammar-54', $$彼女は人の話を最後まで聞かない嫌いがある。$$, $$かのじょはひとのはなしをさいごまできかないきらいがある。$$, $$Ela tem o mau hábito de não ouvir os outros até o fim.$$),
    ('n1-grammar-54', $$この会社は、新しいことを嫌う嫌いがある。$$, $$このかいしゃは、あたらしいことをきらうきらいがある。$$, $$Esta empresa tem tendência a rejeitar novidades.$$),
    ('n1-grammar-54', $$父は何でも一人で決めてしまう嫌いがある。$$, $$ちちはなんでもひとりできめてしまうきらいがある。$$, $$Meu pai tem o mau hábito de decidir tudo sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は自分の意見を押し付ける____。$$, $$Ele tem tendência a impor a própria opinião.$$),
        (2, $$この子は飽きっぽい____。$$, $$Esta criança tem tendência a enjoar rápido das coisas.$$),
        (3, $$彼は物事を悪い方に考える____。$$, $$Ele tem tendência a pensar o pior das coisas.$$),
        (4, $$日本人は自分の意見を言わない____と言われる。$$, $$Dizem que os japoneses têm tendência a não dar a própria opinião.$$),
        (5, $$あの先生は生徒を厳しく叱りすぎる____。$$, $$Aquele professor tem o mau hábito de repreender os alunos com rigor demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$嫌いがある$$),
        (1, $$きらいがある$$),
        (2, $$嫌いがある$$),
        (2, $$きらいがある$$),
        (3, $$嫌いがある$$),
        (3, $$きらいがある$$),
        (4, $$嫌いがある$$),
        (4, $$きらいがある$$),
        (5, $$嫌いがある$$),
        (5, $$きらいがある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-55 — 〜切りがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-55',
    'grammar',
    'N1',
    $$〜切りがない$$,
    $$kiri ga nai$$,
    $$Não tem fim / Seria interminável / Não acaba nunca$$,
    $$切りがない indica que algo não tem fim, porque há muitas coisas ou porque a ação pode continuar para sempre. Equivale a "não tem fim" ou "seria interminável".

Muitas vezes vem com たら ou ば, como "se for falar, não tem fim". Por exemplo, "se for reclamar, não acaba nunca".

É uma expressão comum na fala.$$,
    $$Também é escrito きりがない.

Expressões comuns são 言い出したら切りがない, 数えたら切りがない e 上を見たら切りがない.$$,
    $$Verbo (forma たら / ば) + 切りがない
Substantivo + は + 切りがない$$,
    $$切りがない$$,
    $$切りがない|きりがない|切りがありません|きりがありません$$,
    ARRAY['切り', 'が', 'ない']::text[],
    ARRAY['切りがない', 'きりがない', '切りがありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-55', $$文句を言い出したら切りがない。$$, $$もんくをいいだしたらきりがない。$$, $$Se começar a reclamar, não tem fim.$$),
    ('n1-grammar-55', $$欲しいものを数えたら切りがない。$$, $$ほしいものをかぞえたらきりがない。$$, $$Se for contar o que eu quero, seria interminável.$$),
    ('n1-grammar-55', $$上を見たらきりがないから、今の生活に満足しよう。$$, $$うえをみたらきりがないから、いまのせいかつにまんぞくしよう。$$, $$Se olhar para cima, não acaba nunca, então vamos ficar satisfeitos com a vida atual.$$),
    ('n1-grammar-55', $$心配し始めたら切りがない。$$, $$しんぱいしはじめたらきりがない。$$, $$Se começar a se preocupar, não tem fim.$$),
    ('n1-grammar-55', $$この仕事は、やってもやっても切りがない。$$, $$このしごとは、やってもやってもきりがない。$$, $$Este trabalho, por mais que eu faça, não acaba nunca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の欠点を挙げたら____。$$, $$Se for listar os defeitos dele, não tem fim.$$),
        (2, $$細かいことを気にしたら____。$$, $$Se ligar para os detalhes, não acaba nunca.$$),
        (3, $$思い出を話し始めたら____。$$, $$Se começar a contar as lembranças, seria interminável.$$),
        (4, $$掃除をしても、子供がすぐ散らかすので____。$$, $$Mesmo limpando, as crianças bagunçam logo, então não tem fim.$$),
        (5, $$比べたら____から、自分のペースで頑張ろう。$$, $$Se ficar comparando, não acaba nunca, então vamos nos esforçar no próprio ritmo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$切りがない$$),
        (1, $$きりがない$$),
        (1, $$切りがありません$$),
        (2, $$切りがない$$),
        (2, $$きりがない$$),
        (2, $$切りがありません$$),
        (3, $$切りがない$$),
        (3, $$きりがない$$),
        (3, $$切りがありません$$),
        (4, $$切りがない$$),
        (4, $$きりがない$$),
        (4, $$切りがありません$$),
        (5, $$切りがない$$),
        (5, $$きりがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-56 — 〜きっての
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-56',
    'grammar',
    'N1',
    $$〜きっての$$,
    $$kitte no$$,
    $$O melhor de / O número um de / O mais... de todo$$,
    $$きっての indica que alguém ou algo é o melhor ou o mais destacado dentro de um grupo ou lugar. Equivale a "o melhor de" ou "o número um de".

Costuma vir depois de nomes de lugares ou grupos, como empresa, cidade, país ou escola. Por exemplo, "o melhor talento da empresa" ou "o maior especialista do país".

É uma expressão formal, usada para elogiar.$$,
    $$É usado principalmente com qualidades positivas.

É parecido com 一番の e 随一の.$$,
    $$Substantivo (grupo / lugar) + きっての + Substantivo (pessoa / coisa)$$,
    $$きっての$$,
    $$きっての$$,
    ARRAY['きって', 'の']::text[],
    ARRAY['きっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-56', $$彼は社内きっての優秀な社員だ。$$, $$かれはしゃないきってのゆうしゅうなしゃいんだ。$$, $$Ele é o funcionário mais competente de toda a empresa.$$),
    ('n1-grammar-56', $$彼女は町きっての美人だ。$$, $$かのじょはまちきってのびじんだ。$$, $$Ela é a mulher mais bonita da cidade.$$),
    ('n1-grammar-56', $$この店は東京きっての人気店だ。$$, $$このみせはとうきょうきってのにんきてんだ。$$, $$Esta é a loja mais popular de Tóquio.$$),
    ('n1-grammar-56', $$彼は日本きっての研究者として知られている。$$, $$かれはにほんきってのけんきゅうしゃとしてしられている。$$, $$Ele é conhecido como o maior pesquisador do Japão.$$),
    ('n1-grammar-56', $$学校きっての秀才が東京大学に合格した。$$, $$がっこうきってのしゅうさいがとうきょうだいがくにごうかくした。$$, $$O melhor aluno da escola passou na Universidade de Tóquio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はクラス____スポーツマンだ。$$, $$Ele é o melhor atleta da turma.$$),
        (2, $$この寺は京都____名所だ。$$, $$Este templo é o ponto turístico número um de Kyoto.$$),
        (3, $$彼女は業界____実力者だ。$$, $$Ela é a pessoa mais influente do setor.$$),
        (4, $$この温泉は県内____人気を誇る。$$, $$Esta fonte termal é a mais popular da província.$$),
        (5, $$彼はチーム____ストライカーだ。$$, $$Ele é o melhor atacante do time.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$きっての$$),
        (2, $$きっての$$),
        (3, $$きっての$$),
        (4, $$きっての$$),
        (5, $$きっての$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-57 — 〜極まる / 〜極まりない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-57',
    'grammar',
    'N1',
    $$〜極まる / 〜極まりない$$,
    $$kiwamaru / kiwamari nai$$,
    $$Extremamente / Ao extremo / Totalmente$$,
    $$極まる e 極まりない indicam que algo chegou ao grau máximo. Equivalem a "extremamente" ou "ao extremo".

Apesar de um ser afirmativo e o outro negativo, os dois têm o mesmo sentido. Costumam vir com adjetivos な que expressam algo negativo, como rude, perigoso, desagradável ou irresponsável. Por exemplo, "uma atitude extremamente rude".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 失礼極まりない, 危険極まりない, 不愉快極まる e 無責任極まりない.

Também aparece como 感極まる, "ficar extremamente emocionado".$$,
    $$Adjetivo な (sem な) + 極まる
Adjetivo な (sem な) + 極まりない
Adjetivo な (sem な) + 極まりない + Substantivo$$,
    $$極まりない$$,
    $$極まりない|極まる|極まりなく|きわまりない|きわまる|極まって$$,
    ARRAY['極まり', 'ない']::text[],
    ARRAY['極まりない', '極まる', '極まりなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-57', $$彼の態度は失礼極まりない。$$, $$かれのたいどはしつれいきわまりない。$$, $$A atitude dele é extremamente rude.$$),
    ('n1-grammar-57', $$夜中に山に登るのは危険極まる。$$, $$よなかにやまにのぼるのはきけんきわまる。$$, $$Subir a montanha de madrugada é perigoso ao extremo.$$),
    ('n1-grammar-57', $$無責任極まりない発言だ。$$, $$むせきにんきわまりないはつげんだ。$$, $$É uma declaração totalmente irresponsável.$$),
    ('n1-grammar-57', $$彼女は感極まって泣き出した。$$, $$かのじょはかんきわまってなきだした。$$, $$Ela ficou tão emocionada que começou a chorar.$$),
    ('n1-grammar-57', $$不愉快極まりない出来事だった。$$, $$ふゆかいきわまりないできごとだった。$$, $$Foi um acontecimento extremamente desagradável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞かないなんて、失礼____。$$, $$Não ouvir os outros é extremamente rude.$$),
        (2, $$こんな道を自転車で走るのは危険____。$$, $$Andar de bicicleta numa rua dessas é perigoso ao extremo.$$),
        (3, $$彼の言い訳は不愉快____。$$, $$As desculpas dele são extremamente desagradáveis.$$),
        (4, $$それは非常識____行動だ。$$, $$Isso é um comportamento totalmente sem bom senso.$$),
        (5, $$この作業は単調____。$$, $$Este trabalho é monótono ao extremo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$極まりない$$),
        (1, $$極まる$$),
        (2, $$極まりない$$),
        (2, $$極まる$$),
        (3, $$極まりない$$),
        (3, $$極まる$$),
        (4, $$極まりない$$),
        (5, $$極まりない$$),
        (5, $$極まる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-58 — 〜こそあれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-58',
    'grammar',
    'N1',
    $$〜こそあれ$$,
    $$koso are$$,
    $$Embora haja / Pode até ter... mas / Apesar de$$,
    $$こそあれ reconhece que algo existe, mas mostra que o contrário não existe. Equivale a "pode até ter..., mas não..." ou "embora haja...".

A primeira parte admite um aspecto, e a segunda nega outro. Por exemplo, "pode até haver diferença de grau, mas todos têm preocupações" ou "há elogios, mas não há críticas".

É uma expressão formal e literária.$$,
    $$Costuma aparecer com 差こそあれ, 程度の差こそあれ e 感謝こそすれ.

É parecido com ことはあっても〜ない.$$,
    $$Substantivo + こそあれ + Frase negativa
Adjetivo な (sem な) + でこそあれ$$,
    $$こそあれ$$,
    $$こそあれ$$,
    ARRAY['こそ', 'あれ']::text[],
    ARRAY['こそあれ', 'でこそあれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-58', $$程度の差こそあれ、誰にでも悩みはある。$$, $$ていどのさこそあれ、だれにでもなやみはある。$$, $$Pode até haver diferença de grau, mas todo mundo tem preocupações.$$),
    ('n1-grammar-58', $$彼には感謝こそあれ、恨みはない。$$, $$かれにはかんしゃこそあれ、うらみはない。$$, $$Por ele sinto gratidão, mas nenhum rancor.$$),
    ('n1-grammar-58', $$形の違いこそあれ、どれも同じ機能だ。$$, $$かたちのちがいこそあれ、どれもおなじきのうだ。$$, $$Embora haja diferença de formato, todos têm a mesma função.$$),
    ('n1-grammar-58', $$苦労こそあれ、後悔はしていない。$$, $$くろうこそあれ、こうかいはしていない。$$, $$Pode até ter havido dificuldades, mas não me arrependo.$$),
    ('n1-grammar-58', $$この仕事は大変でこそあれ、嫌ではない。$$, $$このしごとはたいへんでこそあれ、いやではない。$$, $$Este trabalho pode até ser difícil, mas não é desagradável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大小の差____、どの国にも問題はある。$$, $$Pode até haver diferença de tamanho, mas todo país tem problemas.$$),
        (2, $$彼女には尊敬____、嫉妬はない。$$, $$Por ela tenho respeito, mas não inveja.$$),
        (3, $$貧乏で____、心は豊かだ。$$, $$Pode até ser pobre, mas o coração é rico.$$),
        (4, $$時間の差____、いつかは誰でも年をとる。$$, $$Pode até haver diferença de tempo, mas todos um dia envelhecem.$$),
        (5, $$厳しさ____、先生は優しい人だった。$$, $$Embora fosse rígido, o professor era uma pessoa gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそあれ$$),
        (2, $$こそあれ$$),
        (3, $$こそあれ$$),
        (4, $$こそあれ$$),
        (5, $$こそあれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-59 — 〜こそすれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-59',
    'grammar',
    'N1',
    $$〜こそすれ$$,
    $$koso sure$$,
    $$Pelo contrário / Só se for para / Muito pelo contrário$$,
    $$こそすれ indica que algo pode acontecer de uma forma, mas nunca da forma oposta. Equivale a "pelo contrário" ou "só se for para...".

A primeira parte mostra o que é possível, e a segunda nega fortemente o oposto. Por exemplo, "se ele ajudou, eu só tenho a agradecer, nunca a reclamar".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 感謝こそすれ, 喜びこそすれ e 増えこそすれ減ることはない.

A segunda parte costuma ser ことはない ou ない.$$,
    $$Verbo (forma ます sem ます) + こそすれ + Verbo oposto (forma ない)
Substantivo (ação) + こそすれ + Frase negativa$$,
    $$こそすれ$$,
    $$こそすれ$$,
    ARRAY['こそ', 'すれ']::text[],
    ARRAY['こそすれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-59', $$彼には感謝こそすれ、恨むことはない。$$, $$かれにはかんしゃこそすれ、うらむことはない。$$, $$Por ele só tenho a agradecer, nunca a guardar rancor.$$),
    ('n1-grammar-59', $$この問題は悪化こそすれ、よくなることはない。$$, $$このもんだいはあっかこそすれ、よくなることはない。$$, $$Este problema só pode piorar, nunca melhorar.$$),
    ('n1-grammar-59', $$値段は上がりこそすれ、下がることはないだろう。$$, $$ねだんはあがりこそすれ、さがることはないだろう。$$, $$O preço só deve subir, nunca baixar.$$),
    ('n1-grammar-59', $$母は喜びこそすれ、反対はしないだろう。$$, $$はははよろこびこそすれ、はんたいはしないだろう。$$, $$Minha mãe só vai ficar feliz, nunca contra.$$),
    ('n1-grammar-59', $$彼の努力は尊敬こそすれ、批判されるものではない。$$, $$かれのどりょくはそんけいこそすれ、ひはんされるものではない。$$, $$O esforço dele merece respeito, não críticas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたには感謝し____、怒ってなどいない。$$, $$Só tenho a agradecer a você, não estou bravo de jeito nenhum.$$),
        (2, $$人口は減り____、増えることはないだろう。$$, $$A população só deve diminuir, nunca aumentar.$$),
        (3, $$彼の態度は、人を怒らせ____、喜ばせることはない。$$, $$A atitude dele só irrita as pessoas, nunca as agrada.$$),
        (4, $$この経験は役に立ち____、無駄になることはない。$$, $$Esta experiência só vai ser útil, nunca um desperdício.$$),
        (5, $$彼女の言葉は、励まし____、傷つけるものではなかった。$$, $$As palavras dela só encorajavam, nunca magoavam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそすれ$$),
        (2, $$こそすれ$$),
        (3, $$こそすれ$$),
        (4, $$こそすれ$$),
        (5, $$こそすれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-60 — 〜こそ〜が / 〜こそ〜けれど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-60',
    'grammar',
    'N1',
    $$〜こそ〜が / 〜こそ〜けれど$$,
    $$koso ~ ga / koso ~ keredo$$,
    $$Pode até... mas / É verdade que... porém / Embora seja$$,
    $$こそ〜が e こそ〜けれど reconhecem um fato de forma enfática e depois apresentam algo contrário. Equivalem a "pode até..., mas" ou "é verdade que..., porém".

A primeira parte admite um aspecto, e a segunda mostra outro aspecto mais importante. Por exemplo, "pode até ser pequeno, mas é confortável" ou "o salário é bom, porém o trabalho é pesado".

É uma expressão um pouco formal.$$,
    $$Expressões comuns são 小さくこそあるが, 時間こそかかるが e 古くこそあれ.

É parecido com 〜ことは〜が, que também reconhece algo antes de contrastar.$$,
    $$Substantivo + こそ + Verbo / Adjetivo + が / けれど + Frase contrária
Verbo (forma ます sem ます) + こそ + する + が / けれど$$,
    $$こそ〜が$$,
    $$こそ$$,
    ARRAY['こそ', 'が']::text[],
    ARRAY['こそ〜が', 'こそ〜けれど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-60', $$この部屋は狭くこそあるが、とても居心地がいい。$$, $$このへやはせまくこそあるが、とてもいごこちがいい。$$, $$Este quarto pode até ser pequeno, mas é muito aconchegante.$$),
    ('n1-grammar-60', $$時間こそかかったが、いい作品ができた。$$, $$じかんこそかかったが、いいさくひんができた。$$, $$Pode até ter levado tempo, mas saiu uma boa obra.$$),
    ('n1-grammar-60', $$給料こそ高いけれど、仕事はきつい。$$, $$きゅうりょうこそたかいけれど、しごとはきつい。$$, $$É verdade que o salário é alto, porém o trabalho é pesado.$$),
    ('n1-grammar-60', $$彼は口こそ悪いが、本当は優しい人だ。$$, $$かれはくちこそわるいが、ほんとうはやさしいひとだ。$$, $$Ele pode até ser boca suja, mas na verdade é uma pessoa gentil.$$),
    ('n1-grammar-60', $$見た目こそ地味だが、味は最高だ。$$, $$みためこそじみだが、あじはさいこうだ。$$, $$A aparência pode até ser simples, mas o sabor é excelente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は古く____あるが、まだよく走る。$$, $$Este carro pode até ser velho, mas ainda anda bem.$$),
        (2, $$値段____高いが、品質は確かだ。$$, $$O preço pode até ser alto, mas a qualidade é garantida.$$),
        (3, $$彼女は口数____少ないが、よく考えている。$$, $$Ela pode até falar pouco, mas pensa bastante.$$),
        (4, $$体____小さいけれど、力は強い。$$, $$O corpo pode até ser pequeno, mas a força é grande.$$),
        (5, $$距離____遠いが、毎週会いに行っている。$$, $$É verdade que a distância é grande, porém vou visitá-lo toda semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こそ$$),
        (2, $$こそ$$),
        (3, $$こそ$$),
        (4, $$こそ$$),
        (5, $$こそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-61 — ことごとく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-61',
    'grammar',
    'N1',
    $$ことごとく$$,
    $$kotogotoku$$,
    $$Todos sem exceção / Completamente / Um por um$$,
    $$ことごとく indica que algo vale para todos os elementos de um grupo, sem nenhuma exceção. Equivale a "todos sem exceção" ou "completamente".

Muitas vezes é usado em situações negativas, como planos que falharam todos ou propostas que foram todas rejeitadas. Por exemplo, "todas as minhas ideias foram rejeitadas".

É uma palavra formal, comum na escrita.$$,
    $$É parecido com すべて e 全部, mas ことごとく é mais formal e enfático.

Também é escrito 悉く, em kanji, mas é raro.$$,
    $$ことごとく + Verbo$$,
    $$ことごとく$$,
    $$ことごとく|悉く$$,
    ARRAY['ことごとく']::text[],
    ARRAY['ことごとく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-61', $$私の提案はことごとく反対された。$$, $$わたしのていあんはことごとくはんたいされた。$$, $$Todas as minhas propostas foram rejeitadas, sem exceção.$$),
    ('n1-grammar-61', $$予想はことごとく外れた。$$, $$よそうはことごとくはずれた。$$, $$As previsões erraram todas.$$),
    ('n1-grammar-61', $$彼の作品はことごとく高く評価された。$$, $$かれのさくひんはことごとくたかくひょうかされた。$$, $$Todas as obras dele foram muito bem avaliadas.$$),
    ('n1-grammar-61', $$台風で、畑の野菜がことごとくだめになった。$$, $$たいふうで、はたけのやさいがことごとくだめになった。$$, $$Com o tufão, os legumes da horta se perderam completamente.$$),
    ('n1-grammar-61', $$挑戦した試験にことごとく失敗した。$$, $$ちょうせんしたしけんにことごとくしっぱいした。$$, $$Fracassei em todas as provas que tentei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$計画は____失敗に終わった。$$, $$Os planos acabaram todos em fracasso.$$),
        (2, $$彼の意見は____無視された。$$, $$As opiniões dele foram todas ignoradas.$$),
        (3, $$店の商品は____売り切れた。$$, $$Os produtos da loja esgotaram completamente.$$),
        (4, $$彼女は私の質問に____答えてくれた。$$, $$Ela respondeu a todas as minhas perguntas, uma por uma.$$),
        (5, $$古い建物は地震で____倒れた。$$, $$Os prédios antigos caíram todos com o terremoto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことごとく$$),
        (2, $$ことごとく$$),
        (3, $$ことごとく$$),
        (4, $$ことごとく$$),
        (5, $$ことごとく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-62 — 〜ことこの上ない / この上ない / この上なく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-62',
    'grammar',
    'N1',
    $$〜ことこの上ない / この上ない / この上なく$$,
    $$koto kono ue nai / kono ue nai / kono ue naku$$,
    $$Extremamente / Como nada mais / Ao máximo$$,
    $$ことこの上ない e この上ない indicam que algo chegou ao grau máximo, sem nada acima. Equivalem a "extremamente" ou "como nada mais".

この上ない vem antes de substantivos, como "uma felicidade sem igual". この上なく funciona como advérbio, como "extremamente feliz". ことこの上ない vem depois de adjetivos, como "extremamente incômodo".

É uma expressão formal, usada tanto com coisas boas quanto ruins.$$,
    $$Expressões comuns são この上ない喜び, この上ない幸せ e 失礼なことこの上ない.

É parecido com 極まりない, mas この上ない pode ser usado com coisas boas.$$,
    $$この上ない + Substantivo
この上なく + Adjetivo
Adjetivo い / Adjetivo な + な + ことこの上ない$$,
    $$この上ない$$,
    $$この上ない|この上なく|このうえない|このうえなく$$,
    ARRAY['この', '上', 'ない']::text[],
    ARRAY['この上ない', 'この上なく', 'ことこの上ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-62', $$皆様にお会いできて、この上ない喜びです。$$, $$みなさまにおあいできて、このうえないよろこびです。$$, $$É uma alegria sem igual poder encontrá-los.$$),
    ('n1-grammar-62', $$彼の態度は失礼なことこの上ない。$$, $$かれのたいどはしつれいなことこのうえない。$$, $$A atitude dele é extremamente rude.$$),
    ('n1-grammar-62', $$この上なく美しい景色だった。$$, $$このうえなくうつくしいけしきだった。$$, $$Era uma paisagem bela como nada mais.$$),
    ('n1-grammar-62', $$一人で山道を歩くのは、心細いことこの上ない。$$, $$ひとりでやまみちをあるくのは、こころぼそいことこのうえない。$$, $$Andar sozinho pela trilha da montanha dá uma insegurança enorme.$$),
    ('n1-grammar-62', $$家族と過ごす時間は、この上ない幸せだ。$$, $$かぞくとすごすじかんは、このうえないしあわせだ。$$, $$O tempo com a família é a maior felicidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この賞をいただけるのは、____光栄です。$$, $$Receber este prêmio é uma honra sem igual.$$),
        (2, $$毎日同じ作業をするのは、退屈なこと____。$$, $$Fazer o mesmo trabalho todo dia é extremamente entediante.$$),
        (3, $$彼女は____優しい人だ。$$, $$Ela é uma pessoa gentil como nada mais.$$),
        (4, $$こんな夜中に騒ぐなんて、迷惑なこと____。$$, $$Fazer barulho no meio da noite é extremamente incômodo.$$),
        (5, $$合格の知らせは、____うれしい知らせだった。$$, $$A notícia da aprovação foi a mais feliz das notícias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$この上ない$$),
        (1, $$このうえない$$),
        (2, $$この上ない$$),
        (2, $$このうえない$$),
        (3, $$この上なく$$),
        (3, $$このうえなく$$),
        (4, $$この上ない$$),
        (4, $$このうえない$$),
        (5, $$この上なく$$),
        (5, $$このうえなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-63 — 〜こともあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-63',
    'grammar',
    'N1',
    $$〜こともあって$$,
    $$koto mo atte$$,
    $$Também por causa de / Em parte porque / Até porque$$,
    $$こともあって indica um dos motivos de algo, sugerindo que há outros motivos também. Equivale a "também por causa de" ou "em parte porque".

A pessoa apresenta uma razão de forma suave, sem dizer que é a única. Por exemplo, "em parte por ser feriado, o parque estava cheio".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com こともあり, que é mais formal.

Também aparece como ということもあって.$$,
    $$Verbo / Adjetivo (forma simples) + こともあって
Adjetivo な + な + こともあって
Substantivo + という + こともあって$$,
    $$こともあって$$,
    $$こともあって|こともあり$$,
    ARRAY['こと', 'も', 'あって']::text[],
    ARRAY['こともあって', 'こともあり', 'ということもあって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-63', $$休日だったこともあって、公園は混んでいた。$$, $$きゅうじつだったこともあって、こうえんはこんでいた。$$, $$Em parte por ser feriado, o parque estava cheio.$$),
    ('n1-grammar-63', $$駅から近いこともあって、この店はいつも人が多い。$$, $$えきからちかいこともあって、このみせはいつもひとがおおい。$$, $$Até porque fica perto da estação, esta loja vive cheia.$$),
    ('n1-grammar-63', $$疲れていたこともあり、すぐに寝てしまった。$$, $$つかれていたこともあり、すぐにねてしまった。$$, $$Em parte por estar cansado, dormi logo.$$),
    ('n1-grammar-63', $$初めての海外ということもあって、とても緊張した。$$, $$はじめてのかいがいということもあって、とてもきんちょうした。$$, $$Em parte por ser minha primeira vez no exterior, fiquei muito nervoso.$$),
    ('n1-grammar-63', $$値段が安いこともあって、よく売れている。$$, $$ねだんがやすいこともあって、よくうれている。$$, $$Também por causa do preço baixo, está vendendo bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降っていた____、客は少なかった。$$, $$Em parte porque estava chovendo, havia poucos clientes.$$),
        (2, $$彼は真面目な____、みんなに信頼されている。$$, $$Até porque é sério, ele tem a confiança de todos.$$),
        (3, $$夏休みという____、観光地はにぎやかだった。$$, $$Em parte por serem férias de verão, os pontos turísticos estavam movimentados.$$),
        (4, $$体調が悪かった____、早めに帰った。$$, $$Também por não estar bem de saúde, fui embora mais cedo.$$),
        (5, $$子供が生まれた____、広い家に引っ越した。$$, $$Em parte porque nosso filho nasceu, mudamos para uma casa maior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こともあって$$),
        (1, $$こともあり$$),
        (2, $$こともあって$$),
        (2, $$こともあり$$),
        (3, $$こともあって$$),
        (3, $$こともあり$$),
        (4, $$こともあって$$),
        (4, $$こともあり$$),
        (5, $$こともあって$$),
        (5, $$こともあり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-64 — 〜ことなしに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-64',
    'grammar',
    'N1',
    $$〜ことなしに$$,
    $$koto nashi ni$$,
    $$Sem / Sem que / A menos que$$,
    $$ことなしに indica que algo é feito sem uma ação que normalmente seria necessária. Equivale a "sem" ou "sem que".

Muitas vezes a segunda parte é negativa, mostrando que, sem aquela ação, algo não é possível. Por exemplo, "sem esforço, não há sucesso".

É uma expressão formal, parecida com ないで e ずに.$$,
    $$A forma ことなしには reforça a condição, com o sentido de "sem isso, não dá".

É mais formal que ないで e ずに, e aparece mais na escrita.$$,
    $$Verbo (forma dicionário) + ことなしに
Verbo (forma dicionário) + ことなしには + Frase negativa$$,
    $$ことなしに$$,
    $$ことなしに|ことなく$$,
    ARRAY['こと', 'なし', 'に']::text[],
    ARRAY['ことなしに', 'ことなしには', 'ことなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-64', $$努力することなしに、成功はありえない。$$, $$どりょくすることなしに、せいこうはありえない。$$, $$Sem esforço, não há sucesso possível.$$),
    ('n1-grammar-64', $$彼は誰にも相談することなしに、会社を辞めた。$$, $$かれはだれにもそうだんすることなしに、かいしゃをやめた。$$, $$Ele saiu da empresa sem consultar ninguém.$$),
    ('n1-grammar-64', $$苦労することなしには、本当の喜びは得られない。$$, $$くろうすることなしには、ほんとうのよろこびはえられない。$$, $$Sem sofrimento, não se alcança a verdadeira alegria.$$),
    ('n1-grammar-64', $$許可を得ることなしに、写真を撮ってはいけない。$$, $$きょかをえることなしに、しゃしんをとってはいけない。$$, $$Não se pode tirar fotos sem obter permissão.$$),
    ('n1-grammar-64', $$彼女は休むことなく働き続けた。$$, $$かのじょはやすむことなくはたらきつづけた。$$, $$Ela continuou trabalhando sem descansar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞く____、問題は解決できない。$$, $$Sem ouvir os outros, não dá para resolver o problema.$$),
        (2, $$失敗する____、成長はない。$$, $$Sem errar, não há crescimento.$$),
        (3, $$彼は一度も振り返る____、去っていった。$$, $$Ele foi embora sem olhar para trás nenhuma vez.$$),
        (4, $$練習を重ねる____、上達はありえない。$$, $$Sem treinar repetidamente, não há progresso possível.$$),
        (5, $$相手を理解する____、いい関係は作れない。$$, $$Sem compreender o outro, não dá para construir uma boa relação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことなしに$$),
        (1, $$ことなしには$$),
        (2, $$ことなしに$$),
        (2, $$ことなしには$$),
        (3, $$ことなしに$$),
        (3, $$ことなく$$),
        (4, $$ことなしに$$),
        (4, $$ことなしには$$),
        (5, $$ことなしに$$),
        (5, $$ことなしには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-65 — 〜ことのないように
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-65',
    'grammar',
    'N1',
    $$〜ことのないように$$,
    $$koto no nai you ni$$,
    $$Para que não / De modo a não / Para evitar que$$,
    $$ことのないように indica o objetivo de evitar que algo ruim aconteça. Equivale a "para que não" ou "para evitar que".

É uma forma formal de ないように, muito usada em avisos, instruções e regras. Por exemplo, "tome cuidado para que não aconteçam erros".

A segunda parte costuma ser um pedido, um aviso ou uma ação de prevenção.$$,
    $$É mais formal que ないように e aparece muito em documentos e anúncios.

A forma ことのないよう, sem に, é ainda mais formal.$$,
    $$Verbo (forma dicionário) + ことのないように + Pedido / Aviso$$,
    $$ことのないように$$,
    $$ことのないように|ことのないよう|ことがないように|ことがないよう$$,
    ARRAY['こと', 'の', 'ない', 'ように']::text[],
    ARRAY['ことのないように', 'ことのないよう', 'ことがないように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-65', $$同じ失敗を繰り返すことのないように、気をつけてください。$$, $$おなじしっぱいをくりかえすことのないように、きをつけてください。$$, $$Tome cuidado para não repetir o mesmo erro.$$),
    ('n1-grammar-65', $$忘れ物をすることのないよう、確認してください。$$, $$わすれものをすることのないよう、かくにんしてください。$$, $$Verifique para não esquecer nada.$$),
    ('n1-grammar-65', $$事故が起こることのないように、安全対策を強化した。$$, $$じこがおこることのないように、あんぜんたいさくをきょうかした。$$, $$Reforçamos as medidas de segurança para evitar que ocorram acidentes.$$),
    ('n1-grammar-65', $$二度とこのようなことがないように努めます。$$, $$にどとこのようなことがないようにつとめます。$$, $$Faremos o possível para que isso não aconteça de novo.$$),
    ('n1-grammar-65', $$遅れることのないように、早めに家を出た。$$, $$おくれることのないように、はやめにいえをでた。$$, $$Saí de casa mais cedo para não me atrasar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$書類に間違いがある____、よく確認してください。$$, $$Verifique bem para que não haja erros no documento.$$),
        (2, $$けがをする____、準備運動をしましょう。$$, $$Vamos fazer aquecimento para evitar lesões.$$),
        (3, $$二度と遅刻する____、目覚ましを二つかけた。$$, $$Coloquei dois despertadores para nunca mais me atrasar.$$),
        (4, $$迷惑をかける____、静かにしてください。$$, $$Fique em silêncio para não incomodar ninguém.$$),
        (5, $$情報が外にもれる____、注意してください。$$, $$Tome cuidado para que as informações não vazem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことのないように$$),
        (1, $$ことのないよう$$),
        (2, $$ことのないように$$),
        (2, $$ことのないよう$$),
        (3, $$ことのないように$$),
        (3, $$ことのないよう$$),
        (4, $$ことのないように$$),
        (4, $$ことのないよう$$),
        (5, $$ことのないように$$),
        (5, $$ことのないよう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-66 — 〜こととて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-66',
    'grammar',
    'N1',
    $$〜こととて$$,
    $$koto tote$$,
    $$Por ser / Como / Já que$$,
    $$こととて indica um motivo, geralmente usado para pedir desculpas ou justificar algo. Equivale a "por ser", "como" ou "já que".

É uma expressão muito formal e antiquada, usada em cartas, desculpas formais e textos literários. Por exemplo, "por ser uma criança, peço que a perdoe" ou "como era inexperiente, cometi um erro".

Muitas vezes a segunda parte é um pedido de desculpas ou de compreensão.$$,
    $$Expressões comuns são 子供のこととて, 慣れぬこととて e 知らぬこととて.

A forma こととはいえ significa "apesar de ser" e tem um sentido diferente.$$,
    $$Verbo (forma simples) + こととて
Adjetivo な + な + こととて
Substantivo + の + こととて$$,
    $$こととて$$,
    $$こととて$$,
    ARRAY['こと', 'とて']::text[],
    ARRAY['こととて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-66', $$子供のしたこととて、どうかお許しください。$$, $$こどものしたこととて、どうかおゆるしください。$$, $$Como foi coisa de criança, peço que perdoe.$$),
    ('n1-grammar-66', $$慣れぬこととて、ご迷惑をおかけしました。$$, $$なれぬこととて、ごめいわくをおかけしました。$$, $$Por não estar acostumado, causei transtornos.$$),
    ('n1-grammar-66', $$知らぬこととて、失礼いたしました。$$, $$しらぬこととて、しつれいいたしました。$$, $$Como eu não sabia, peço desculpas.$$),
    ('n1-grammar-66', $$休日のこととて、店はどこも混んでいた。$$, $$きゅうじつのこととて、みせはどこもこんでいた。$$, $$Por ser feriado, todas as lojas estavam cheias.$$),
    ('n1-grammar-66', $$新人のこととて、至らない点もあると思います。$$, $$しんじんのこととて、いたらないてんもあるとおもいます。$$, $$Por ser novato, acredito que haja falhas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$急な____、十分な準備ができませんでした。$$, $$Como foi de repente, não consegui me preparar bem.$$),
        (2, $$初めての____、うまくできなくて申し訳ありません。$$, $$Por ser a primeira vez, peço desculpas por não ter feito bem.$$),
        (3, $$年末の____、道路はひどく渋滞していた。$$, $$Por ser fim de ano, as estradas estavam terrivelmente congestionadas.$$),
        (4, $$何分にも子供の____、大目に見てやってください。$$, $$Afinal, sendo criança, peço que releve.$$),
        (5, $$夜中の____、誰も気づかなかった。$$, $$Como era madrugada, ninguém percebeu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$こととて$$),
        (2, $$こととて$$),
        (3, $$こととて$$),
        (4, $$こととて$$),
        (5, $$こととて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-67 — 〜くらいなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-67',
    'grammar',
    'N1',
    $$〜くらいなら$$,
    $$kurai nara$$,
    $$Se for para / Antes de / Em vez de$$,
    $$くらいなら indica que uma opção é tão ruim que a pessoa prefere outra, mesmo que também não seja ideal. Equivale a "se for para..., prefiro..." ou "em vez de...".

A primeira parte mostra a opção que a pessoa rejeita totalmente, e a segunda mostra a escolha preferida. Por exemplo, "se for para pedir ajuda a ele, prefiro fazer sozinho".

A segunda parte costuma terminar com ほうがいい, ほうがましだ ou um desejo.$$,
    $$ぐらいなら tem o mesmo sentido.

Muitas vezes a primeira parte é algo que a pessoa odeia fazer.$$,
    $$Verbo (forma dicionário) + くらいなら + ほうがいい / ほうがましだ
Verbo (forma dicionário) + ぐらいなら$$,
    $$くらいなら$$,
    $$くらいなら|ぐらいなら$$,
    ARRAY['くらい', 'なら']::text[],
    ARRAY['くらいなら', 'ぐらいなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-67', $$彼に頼むくらいなら、自分でやったほうがいい。$$, $$かれにたのむくらいなら、じぶんでやったほうがいい。$$, $$Se for para pedir a ele, é melhor fazer sozinho.$$),
    ('n1-grammar-67', $$こんなまずい物を食べるくらいなら、何も食べないほうがましだ。$$, $$こんなまずいものをたべるくらいなら、なにもたべないほうがましだ。$$, $$Em vez de comer uma coisa ruim dessas, prefiro não comer nada.$$),
    ('n1-grammar-67', $$途中でやめるぐらいなら、最初からやらないほうがいい。$$, $$とちゅうでやめるぐらいなら、さいしょからやらないほうがいい。$$, $$Se for para desistir no meio, é melhor nem começar.$$),
    ('n1-grammar-67', $$後悔するくらいなら、今やってみよう。$$, $$こうかいするくらいなら、いまやってみよう。$$, $$Em vez de se arrepender depois, vamos tentar agora.$$),
    ('n1-grammar-67', $$満員電車に乗るくらいなら、一時間歩いたほうがいい。$$, $$まんいんでんしゃにのるくらいなら、いちじかんあるいたほうがいい。$$, $$Se for para pegar um trem lotado, prefiro andar uma hora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$嘘をつく____、本当のことを言ったほうがいい。$$, $$Em vez de mentir, é melhor dizer a verdade.$$),
        (2, $$あんな会社で働く____、辞めたほうがましだ。$$, $$Se for para trabalhar numa empresa daquelas, prefiro sair.$$),
        (3, $$借金する____、旅行をあきらめる。$$, $$Se for para fazer dívida, desisto da viagem.$$),
        (4, $$文句を言う____、自分でやりなさい。$$, $$Em vez de reclamar, faça você mesmo.$$),
        (5, $$毎日悩む____、思い切って相談してみたら。$$, $$Em vez de ficar se angustiando todo dia, por que não tenta conversar com alguém?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらいなら$$),
        (1, $$ぐらいなら$$),
        (2, $$くらいなら$$),
        (2, $$ぐらいなら$$),
        (3, $$くらいなら$$),
        (3, $$ぐらいなら$$),
        (4, $$くらいなら$$),
        (4, $$ぐらいなら$$),
        (5, $$くらいなら$$),
        (5, $$ぐらいなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-68 — 〜くらいのものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-68',
    'grammar',
    'N1',
    $$〜くらいのものだ$$,
    $$kurai no mono da$$,
    $$Só mesmo / O único é / No máximo$$,
    $$くらいのものだ indica que só existe aquele único caso, ou que é o máximo possível. Equivale a "só mesmo" ou "o único é".

A pessoa destaca que aquele exemplo é raro ou excepcional. Por exemplo, "quem consegue fazer isso é só mesmo ele" ou "o único dia em que descanso é domingo".

A forma ぐらいのものだ tem o mesmo sentido.$$,
    $$É parecido com だけだ, mas くらいのものだ destaca que o caso é excepcional.

Muitas vezes aparece com frases como 〜のは〜くらいのものだ.$$,
    $$Substantivo + くらいのものだ
Verbo (forma dicionário) + くらいのものだ$$,
    $$くらいのものだ$$,
    $$くらいのものだ|ぐらいのものだ|くらいのものです|ぐらいのものです$$,
    ARRAY['くらい', 'の', 'もの', 'だ']::text[],
    ARRAY['くらいのものだ', 'ぐらいのものだ', 'くらいのものです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-68', $$こんな難しい問題が解けるのは、彼くらいのものだ。$$, $$こんなむずかしいもんだいがとけるのは、かれくらいのものだ。$$, $$Quem consegue resolver um problema difícil desses é só mesmo ele.$$),
    ('n1-grammar-68', $$私が休めるのは、日曜日くらいのものだ。$$, $$わたしがやすめるのは、にちようびくらいのものだ。$$, $$O único dia em que consigo descansar é domingo.$$),
    ('n1-grammar-68', $$社長に意見を言えるのは、部長ぐらいのものです。$$, $$しゃちょうにいけんをいえるのは、ぶちょうぐらいのものです。$$, $$O único que consegue dar opinião ao presidente é o gerente.$$),
    ('n1-grammar-68', $$毎朝五時に起きるのは、祖父くらいのものだ。$$, $$まいあさごじにおきるのは、そふくらいのものだ。$$, $$Quem acorda às cinco toda manhã é só mesmo meu avô.$$),
    ('n1-grammar-68', $$この町で楽しめるのは、温泉ぐらいのものだ。$$, $$このまちでたのしめるのは、おんせんぐらいのものだ。$$, $$A única coisa para aproveitar nesta cidade é a fonte termal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなことを平気で言うのは、あなた____。$$, $$Quem diz uma coisa dessas sem se importar é só mesmo você.$$),
        (2, $$家族で旅行するのは、夏休み____。$$, $$A única vez que viajamos em família é nas férias de verão.$$),
        (3, $$彼女に勝てるのは、プロの選手____。$$, $$Quem consegue vencê-la é só mesmo um atleta profissional.$$),
        (4, $$最近料理をするのは、週末____。$$, $$Ultimamente, só cozinho no fim de semana.$$),
        (5, $$この漢字が読めるのは、専門家____。$$, $$Quem consegue ler este kanji é só mesmo um especialista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらいのものだ$$),
        (1, $$ぐらいのものだ$$),
        (1, $$くらいのものです$$),
        (1, $$ぐらいのものです$$),
        (2, $$くらいのものだ$$),
        (2, $$ぐらいのものだ$$),
        (2, $$くらいのものです$$),
        (2, $$ぐらいのものです$$),
        (3, $$くらいのものだ$$),
        (3, $$ぐらいのものだ$$),
        (3, $$くらいのものです$$),
        (3, $$ぐらいのものです$$),
        (4, $$くらいのものだ$$),
        (4, $$ぐらいのものだ$$),
        (4, $$くらいのものです$$),
        (4, $$ぐらいのものです$$),
        (5, $$くらいのものだ$$),
        (5, $$ぐらいのものだ$$),
        (5, $$くらいのものです$$),
        (5, $$ぐらいのものです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-69 — 〜までだ / 〜までのことだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-69',
    'grammar',
    'N1',
    $$〜までだ / 〜までのことだ$$,
    $$made da / made no koto da$$,
    $$Simplesmente / É só / Não há outra saída a não ser$$,
    $$までだ e までのことだ têm dois usos principais.

O primeiro, depois da forma dicionário, indica que, se uma opção não der certo, a pessoa vai simplesmente fazer outra coisa, sem drama. Equivale a "é só..." ou "não há outra saída a não ser". Por exemplo, "se o trem não vier, é só ir de táxi".

O segundo, depois da forma た, indica que a pessoa fez algo apenas por um motivo simples, sem intenção especial. Equivale a "simplesmente". Por exemplo, "só disse o que pensava".$$,
    $$No primeiro uso, muitas vezes vem depois de uma condição com なら ou ば.

No segundo uso, a pessoa minimiza a própria ação, como uma justificativa.$$,
    $$Verbo (forma dicionário) + までだ / までのことだ (decisão)
Verbo (forma た) + までだ / までのことだ (motivo simples)$$,
    $$までだ$$,
    $$までだ|までのことだ|までです|までのことです$$,
    ARRAY['まで', 'だ']::text[],
    ARRAY['までだ', 'までのことだ', 'までです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-69', $$電車が動かないなら、タクシーで行くまでだ。$$, $$でんしゃがうごかないなら、タクシーでいくまでだ。$$, $$Se o trem não andar, é só ir de táxi.$$),
    ('n1-grammar-69', $$思ったことを言ったまでです。$$, $$おもったことをいったまでです。$$, $$Só disse o que pensava.$$),
    ('n1-grammar-69', $$誰も手伝ってくれないなら、一人でやるまでのことだ。$$, $$だれもてつだってくれないなら、ひとりでやるまでのことだ。$$, $$Se ninguém vai ajudar, não há outra saída a não ser fazer sozinho.$$),
    ('n1-grammar-69', $$特別なことはしていません。規則に従ったまでのことです。$$, $$とくべつなことはしていません。きそくにしたがったまでのことです。$$, $$Não fiz nada de especial. Só segui as regras.$$),
    ('n1-grammar-69', $$失敗したら、またやり直すまでだ。$$, $$しっぱいしたら、またやりなおすまでだ。$$, $$Se der errado, é só recomeçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$反対されても、自分の道を進む____。$$, $$Mesmo que sejam contra, é só seguir o meu caminho.$$),
        (2, $$お礼を言われるようなことではありません。当然のことをした____。$$, $$Não precisa agradecer. Só fiz o que era natural.$$),
        (3, $$今年がだめなら、来年また受ける____。$$, $$Se não der este ano, é só fazer a prova de novo no ano que vem.$$),
        (4, $$念のため、確認した____。$$, $$Só verifiquei por precaução.$$),
        (5, $$店が閉まっていたら、別の店に行く____。$$, $$Se a loja estiver fechada, é só ir a outra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までだ$$),
        (1, $$までのことだ$$),
        (2, $$までです$$),
        (2, $$までのことです$$),
        (3, $$までだ$$),
        (3, $$までのことだ$$),
        (4, $$までだ$$),
        (4, $$までです$$),
        (5, $$までだ$$),
        (5, $$までのことだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-70 — 〜までもない / 〜までもなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-70',
    'grammar',
    'N1',
    $$〜までもない / 〜までもなく$$,
    $$made mo nai / made mo naku$$,
    $$Nem é preciso / Não há necessidade de / Obviamente$$,
    $$までもない indica que algo é tão óbvio ou simples que não é necessário fazer aquela ação. Equivale a "nem é preciso" ou "não há necessidade de".

Por exemplo, "é tão simples que nem é preciso explicar". A forma までもなく vem no meio da frase e significa "obviamente" ou "nem é preciso dizer", como em 言うまでもなく.

É uma expressão um pouco formal.$$,
    $$Expressões muito comuns são 言うまでもない e 言うまでもなく, "nem é preciso dizer".

É parecido com 必要はない, mas までもない destaca que algo é óbvio.$$,
    $$Verbo (forma dicionário) + までもない
Verbo (forma dicionário) + までもなく、 + Frase$$,
    $$までもない$$,
    $$までもない|までもなく|までもありません$$,
    ARRAY['まで', 'も', 'ない']::text[],
    ARRAY['までもない', 'までもなく', 'までもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-70', $$健康が大切なのは言うまでもない。$$, $$けんこうがたいせつなのはいうまでもない。$$, $$Nem é preciso dizer que a saúde é importante.$$),
    ('n1-grammar-70', $$こんな簡単なことは、説明するまでもない。$$, $$こんなかんたんなことは、せつめいするまでもない。$$, $$Uma coisa simples dessas nem precisa ser explicada.$$),
    ('n1-grammar-70', $$言うまでもなく、彼は優秀な選手だ。$$, $$いうまでもなく、かれはゆうしゅうなせんしゅだ。$$, $$Obviamente, ele é um ótimo atleta.$$),
    ('n1-grammar-70', $$軽いけがなので、病院に行くまでもない。$$, $$かるいけがなので、びょういんにいくまでもない。$$, $$É um machucado leve, não há necessidade de ir ao hospital.$$),
    ('n1-grammar-70', $$わざわざ来ていただくまでもありません。$$, $$わざわざきていただくまでもありません。$$, $$Não há necessidade de o senhor vir até aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$結果は見る____。彼の勝ちだ。$$, $$Nem é preciso ver o resultado. Ele venceu.$$),
        (2, $$言う____、約束は守らなければならない。$$, $$Nem é preciso dizer que promessas devem ser cumpridas.$$),
        (3, $$そのくらいのことは、聞く____わかる。$$, $$Uma coisa dessas a gente sabe sem nem precisar perguntar.$$),
        (4, $$この程度の雨なら、傘をさす____。$$, $$Com uma chuva dessas, nem é preciso abrir o guarda-chuva.$$),
        (5, $$電話する____、メールで十分だ。$$, $$Nem é preciso ligar, um e-mail basta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までもない$$),
        (1, $$までもありません$$),
        (2, $$までもなく$$),
        (3, $$までもなく$$),
        (4, $$までもない$$),
        (4, $$までもありません$$),
        (5, $$までもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-71 — 〜まじき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-71',
    'grammar',
    'N1',
    $$〜まじき$$,
    $$majiki$$,
    $$Que não se deve / Inadmissível / Impróprio de$$,
    $$まじき indica que uma ação é totalmente inadequada para alguém em determinada posição. Equivale a "que não se deve" ou "inadmissível".

Costuma aparecer na estrutura "Pessoa + にあるまじき + Ação", como "uma atitude inadmissível para um professor".

É uma expressão muito formal e antiga, usada para criticar com força.$$,
    $$A forma mais comum é にあるまじき, como 教師にあるまじき行為.

É uma forma da linguagem clássica, ligada a まい e べからず.$$,
    $$Substantivo (posição) + にあるまじき + Substantivo
Verbo (forma dicionário) + まじき + Substantivo
する → すまじき$$,
    $$まじき$$,
    $$まじき$$,
    ARRAY['まじき']::text[],
    ARRAY['まじき', 'にあるまじき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-71', $$生徒に暴力を振るうなど、教師にあるまじき行為だ。$$, $$せいとにぼうりょくをふるうなど、きょうしにあるまじきこういだ。$$, $$Agredir alunos é um ato inadmissível para um professor.$$),
    ('n1-grammar-71', $$それは政治家にあるまじき発言だ。$$, $$それはせいじかにあるまじきはつげんだ。$$, $$Essa é uma declaração imprópria de um político.$$),
    ('n1-grammar-71', $$患者の秘密をもらすのは、医者にあるまじきことだ。$$, $$かんじゃのひみつをもらすのは、いしゃにあるまじきことだ。$$, $$Revelar segredos de pacientes é inadmissível para um médico.$$),
    ('n1-grammar-71', $$許すまじき犯罪だ。$$, $$ゆるすまじきはんざいだ。$$, $$É um crime que não se deve perdoar.$$),
    ('n1-grammar-71', $$警察官にあるまじき態度に、市民は怒った。$$, $$けいさつかんにあるまじきたいどに、しみんはおこった。$$, $$Os cidadãos ficaram revoltados com a atitude imprópria de um policial.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$客に失礼なことを言うのは、店員にある____ことだ。$$, $$Dizer coisas rudes aos clientes é inadmissível para um atendente.$$),
        (2, $$賄賂を受け取るなど、公務員にある____行為だ。$$, $$Aceitar propina é um ato inadmissível para um funcionário público.$$),
        (3, $$試合中に相手を殴るのは、選手にある____ことだ。$$, $$Agredir o adversário durante a partida é impróprio de um atleta.$$),
        (4, $$子供を置いて出かけるなんて、親にある____行為だ。$$, $$Sair deixando a criança sozinha é um ato inadmissível para um pai.$$),
        (5, $$嘘の記事を書くのは、記者にある____ことだ。$$, $$Escrever matérias falsas é impróprio de um jornalista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まじき$$),
        (2, $$まじき$$),
        (3, $$まじき$$),
        (4, $$まじき$$),
        (5, $$まじき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-72 — 〜まくる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-72',
    'grammar',
    'N1',
    $$〜まくる$$,
    $$makuru$$,
    $$Sem parar / Muito / A rodo$$,
    $$まくる indica que uma ação é feita de forma intensa e repetida, sem parar. Equivale a "sem parar", "muito" ou "a rodo".

Por exemplo, "comi sem parar" ou "trabalhei feito louco".

É uma expressão coloquial e informal, comum entre jovens.$$,
    $$Não se usa em situações formais.

Combinações comuns são 食べまくる, 遊びまくる, 買いまくる, 書きまくる e 走りまくる.$$,
    $$Verbo (forma ます sem ます) + まくる$$,
    $$まくる$$,
    $$まくる|まくった|まくって|まくり$$,
    ARRAY['まくる']::text[],
    ARRAY['まくる', 'まくった', 'まくって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-72', $$休みの日は、ゲームをやりまくった。$$, $$やすみのひは、ゲームをやりまくった。$$, $$No dia de folga, joguei videogame sem parar.$$),
    ('n1-grammar-72', $$旅行先で、お土産を買いまくった。$$, $$りょこうさきで、おみやげをかいまくった。$$, $$No destino da viagem, comprei lembrancinhas a rodo.$$),
    ('n1-grammar-72', $$試験の前は、単語を書きまくって覚えた。$$, $$しけんのまえは、たんごをかきまくっておぼえた。$$, $$Antes da prova, decorei as palavras escrevendo sem parar.$$),
    ('n1-grammar-72', $$ストレスがたまったので、カラオケで歌いまくった。$$, $$ストレスがたまったので、カラオケでうたいまくった。$$, $$Como o estresse acumulou, cantei sem parar no karaokê.$$),
    ('n1-grammar-72', $$彼は会議で文句を言いまくっていた。$$, $$かれはかいぎでもんくをいいまくっていた。$$, $$Ele ficou reclamando sem parar na reunião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休みは毎日遊び____。$$, $$Nas férias de verão, brinquei sem parar todos os dias.$$),
        (2, $$ケーキ屋で甘いものを食べ____。$$, $$Na confeitaria, comi doces sem parar.$$),
        (3, $$彼女はセールで服を買い____いる。$$, $$Ela está comprando roupas a rodo na liquidação.$$),
        (4, $$就職活動で、会社に電話をかけ____。$$, $$Na busca por emprego, liguei para empresas sem parar.$$),
        (5, $$試合では、走り____疲れた。$$, $$Na partida, corri sem parar e fiquei exausto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まくった$$),
        (2, $$まくった$$),
        (3, $$まくって$$),
        (4, $$まくった$$),
        (5, $$まくって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-73 — 〜まみれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-73',
    'grammar',
    'N1',
    $$〜まみれ$$,
    $$mamire$$,
    $$Coberto de / Cheio de / Todo sujo de$$,
    $$まみれ indica que algo está completamente coberto por algo sujo ou desagradável, como lama, suor, sangue ou poeira. Equivale a "coberto de" ou "todo sujo de".

Por exemplo, "as crianças voltaram cobertas de lama".

Também pode ser usado de forma figurada, como "cheio de dívidas" ou "cheio de erros".$$,
    $$Combinações comuns são 泥まみれ, 汗まみれ, 血まみれ, ほこりまみれ e 借金まみれ.

É parecido com だらけ, mas まみれ indica que algo está coberto na superfície.$$,
    $$Substantivo + まみれ
Substantivo + まみれ + の + Substantivo
Substantivo + まみれ + に + なる$$,
    $$まみれ$$,
    $$まみれ$$,
    ARRAY['まみれ']::text[],
    ARRAY['まみれ', 'まみれの', 'まみれになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-73', $$子供たちは泥まみれになって遊んでいた。$$, $$こどもたちはどろまみれになってあそんでいた。$$, $$As crianças brincavam cobertas de lama.$$),
    ('n1-grammar-73', $$一日中働いて、汗まみれになった。$$, $$いちにちじゅうはたらいて、あせまみれになった。$$, $$Trabalhei o dia todo e fiquei encharcado de suor.$$),
    ('n1-grammar-73', $$古い本はほこりまみれだった。$$, $$ふるいほんはほこりまみれだった。$$, $$Os livros velhos estavam cobertos de poeira.$$),
    ('n1-grammar-73', $$彼は借金まみれの生活をしている。$$, $$かれはしゃっきんまみれのせいかつをしている。$$, $$Ele vive cheio de dívidas.$$),
    ('n1-grammar-73', $$けがをした選手は血まみれだった。$$, $$けがをしたせんしゅはちまみれだった。$$, $$O atleta ferido estava coberto de sangue.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の中のサッカーで、ユニフォームが泥____になった。$$, $$No futebol debaixo de chuva, o uniforme ficou coberto de lama.$$),
        (2, $$引っ越しの作業で、ほこり____になった。$$, $$Com a mudança, fiquei coberto de poeira.$$),
        (3, $$マラソンを走り終えた彼は、汗____だった。$$, $$Ao terminar a maratona, ele estava encharcado de suor.$$),
        (4, $$油____の手で、機械を直していた。$$, $$Consertava a máquina com as mãos cobertas de óleo.$$),
        (5, $$その政治家は、うそ____だ。$$, $$Aquele político está cheio de mentiras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まみれ$$),
        (2, $$まみれ$$),
        (3, $$まみれ$$),
        (4, $$まみれ$$),
        (5, $$まみれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-74 — まるっきり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-74',
    'grammar',
    'N1',
    $$まるっきり$$,
    $$marukkiri$$,
    $$Totalmente / Completamente / Nada$$,
    $$まるっきり indica algo total ou completo. Equivale a "totalmente" ou "completamente".

Muitas vezes vem com formas negativas, com o sentido de "nada" ou "nem um pouco". Por exemplo, "não entendi nada".

É uma forma coloquial de まるで e まったく.$$,
    $$É mais coloquial que まったく e 全然.

Também pode ser usado em frases afirmativas, como まるっきり違う, "totalmente diferente".$$,
    $$まるっきり + Verbo (forma ない)
まるっきり + Adjetivo / Substantivo$$,
    $$まるっきり$$,
    $$まるっきり|まるきり$$,
    ARRAY['まるっきり']::text[],
    ARRAY['まるっきり', 'まるきり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-74', $$彼の話はまるっきりわからなかった。$$, $$かれのはなしはまるっきりわからなかった。$$, $$Não entendi nada do que ele disse.$$),
    ('n1-grammar-74', $$この二つはまるっきり違う。$$, $$このふたつはまるっきりちがう。$$, $$Estas duas coisas são totalmente diferentes.$$),
    ('n1-grammar-74', $$私は料理がまるっきりだめだ。$$, $$わたしはりょうりがまるっきりだめだ。$$, $$Sou completamente negado na cozinha.$$),
    ('n1-grammar-74', $$彼はまるっきり子供みたいだ。$$, $$かれはまるっきりこどもみたいだ。$$, $$Ele parece totalmente uma criança.$$),
    ('n1-grammar-74', $$昨日のことはまるっきり覚えていない。$$, $$きのうのことはまるっきりおぼえていない。$$, $$Não me lembro de nada de ontem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その問題は____解けなかった。$$, $$Não consegui resolver nada daquele problema.$$),
        (2, $$写真と実物は____違う。$$, $$A foto e o produto real são totalmente diferentes.$$),
        (3, $$彼女の言うことは____うそだった。$$, $$O que ela disse era totalmente mentira.$$),
        (4, $$私は運動が____苦手だ。$$, $$Sou completamente ruim em esportes.$$),
        (5, $$この町は昔と____変わってしまった。$$, $$Esta cidade mudou completamente em relação ao passado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まるっきり$$),
        (1, $$まるきり$$),
        (2, $$まるっきり$$),
        (2, $$まるきり$$),
        (3, $$まるっきり$$),
        (3, $$まるきり$$),
        (4, $$まるっきり$$),
        (4, $$まるきり$$),
        (5, $$まるっきり$$),
        (5, $$まるきり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-75 — 〜めく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-75',
    'grammar',
    'N1',
    $$〜めく$$,
    $$meku$$,
    $$Ter ar de / Parecer / Ter um toque de$$,
    $$めく indica que algo começa a mostrar características ou sinais de algo. Equivale a "ter ar de" ou "parecer".

Por exemplo, 春めく significa "ficar com ar de primavera", e 皮肉めいた significa "com um toque de ironia".

As formas めいた e めいて são as mais usadas.$$,
    $$Combinações comuns são 春めく, 秋めく, 冗談めかす, 皮肉めいた, 謎めいた e 説教めいた.

É parecido com らしい e っぽい.$$,
    $$Substantivo + めく
Substantivo + めいた + Substantivo
Substantivo + めいて + Verbo$$,
    $$めく$$,
    $$めく|めいた|めいて|めかして$$,
    ARRAY['めく']::text[],
    ARRAY['めく', 'めいた', 'めいて', 'めかして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-75', $$三月になって、だいぶ春めいてきた。$$, $$さんがつになって、だいぶはるめいてきた。$$, $$Com a chegada de março, o tempo ficou bem com ar de primavera.$$),
    ('n1-grammar-75', $$彼は皮肉めいたことを言った。$$, $$かれはひにくめいたことをいった。$$, $$Ele disse algo com um toque de ironia.$$),
    ('n1-grammar-75', $$謎めいた女性が店に入ってきた。$$, $$なぞめいたじょせいがみせにはいってきた。$$, $$Uma mulher misteriosa entrou na loja.$$),
    ('n1-grammar-75', $$冗談めかして本音を言った。$$, $$じょうだんめかしてほんねをいった。$$, $$Disse o que realmente pensava em tom de brincadeira.$$),
    ('n1-grammar-75', $$説教めいた話はやめてほしい。$$, $$せっきょうめいたはなしはやめてほしい。$$, $$Queria que parasse com esses discursos com ar de sermão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$木の葉が色づいて、すっかり秋____きた。$$, $$As folhas mudaram de cor e o tempo ficou com ar de outono.$$),
        (2, $$彼女は謎____笑顔を見せた。$$, $$Ela deu um sorriso misterioso.$$),
        (3, $$彼の言葉には、脅し____響きがあった。$$, $$As palavras dele tinham um tom de ameaça.$$),
        (4, $$父は冗談____、本当のことを言った。$$, $$Meu pai disse a verdade em tom de brincadeira.$$),
        (5, $$言い訳____ことは言いたくない。$$, $$Não quero dizer nada com cara de desculpa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$めいて$$),
        (2, $$めいた$$),
        (3, $$めいた$$),
        (4, $$めかして$$),
        (5, $$めいた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-76 — 〜も同然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-76',
    'grammar',
    'N1',
    $$〜も同然だ$$,
    $$mo douzen da$$,
    $$É praticamente / É quase como / Equivale a$$,
    $$も同然だ indica que algo não é exatamente aquilo, mas é quase igual na prática. Equivale a "é praticamente" ou "é quase como".

Por exemplo, "o trabalho está praticamente terminado" ou "ele é quase como da família".

É usado para destacar que a diferença é tão pequena que não importa.$$,
    $$É parecido com と同じだ e みたいなものだ.

A forma も同然の vem antes de substantivos, como ただも同然の値段, "um preço quase de graça".$$,
    $$Substantivo + も同然だ
Verbo (forma た) + も同然だ
Substantivo + も同然の + Substantivo$$,
    $$も同然だ$$,
    $$も同然|もどうぜん$$,
    ARRAY['も', '同然', 'だ']::text[],
    ARRAY['も同然だ', 'も同然の', 'も同然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-76', $$この仕事は終わったも同然だ。$$, $$このしごとはおわったもどうぜんだ。$$, $$Este trabalho está praticamente terminado.$$),
    ('n1-grammar-76', $$彼は私にとって家族も同然です。$$, $$かれはわたしにとってかぞくもどうぜんです。$$, $$Ele é quase como da família para mim.$$),
    ('n1-grammar-76', $$この値段なら、ただも同然だ。$$, $$このねだんなら、ただもどうぜんだ。$$, $$Com este preço, é praticamente de graça.$$),
    ('n1-grammar-76', $$決勝に進んだのだから、優勝したも同然だ。$$, $$けっしょうにすすんだのだから、ゆうしょうしたもどうぜんだ。$$, $$Chegamos à final, então é praticamente como se tivéssemos vencido.$$),
    ('n1-grammar-76', $$この車は新品も同然の状態だ。$$, $$このくるまはしんぴんもどうぜんのじょうたいだ。$$, $$Este carro está em estado praticamente de novo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここまで来れば、合格した____。$$, $$Tendo chegado até aqui, já é praticamente uma aprovação.$$),
        (2, $$一度しか着ていないので、新品____。$$, $$Só usei uma vez, então é praticamente novo.$$),
        (3, $$あの二人は、もう夫婦____。$$, $$Aqueles dois já são praticamente marido e mulher.$$),
        (4, $$十点差なら、勝負は決まった____。$$, $$Com dez pontos de diferença, a partida está praticamente decidida.$$),
        (5, $$このパソコンは壊れている____。$$, $$Este computador está praticamente quebrado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も同然だ$$),
        (1, $$も同然です$$),
        (2, $$も同然だ$$),
        (2, $$も同然です$$),
        (3, $$も同然だ$$),
        (3, $$も同然です$$),
        (4, $$も同然だ$$),
        (4, $$も同然です$$),
        (5, $$も同然だ$$),
        (5, $$も同然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-77 — 〜もさることながら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-77',
    'grammar',
    'N1',
    $$〜もさることながら$$,
    $$mo saru koto nagara$$,
    $$Não só... mas também / Além de / Tanto quanto$$,
    $$もさることながら indica que algo é importante, mas outra coisa é ainda mais importante ou também merece atenção. Equivale a "não só..., mas também" ou "além de".

A primeira parte é algo reconhecido, e a segunda é o ponto principal. Por exemplo, "o sabor, é claro, mas o atendimento também é excelente".

É uma expressão formal, comum em textos e elogios.$$,
    $$É parecido com はもちろん e はもとより, mas もさることながら dá mais destaque à segunda parte.

Costuma ser usado para elogiar.$$,
    $$Substantivo + もさることながら + Substantivo + も$$,
    $$もさることながら$$,
    $$もさることながら$$,
    ARRAY['も', 'さる', 'こと', 'ながら']::text[],
    ARRAY['もさることながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-77', $$この店は味もさることながら、サービスも素晴らしい。$$, $$このみせはあじもさることながら、サービスもすばらしい。$$, $$Esta loja tem não só um bom sabor, mas também um atendimento excelente.$$),
    ('n1-grammar-77', $$彼女は外見もさることながら、性格もいい。$$, $$かのじょはがいけんもさることながら、せいかくもいい。$$, $$Ela é bonita e, além disso, tem um ótimo caráter.$$),
    ('n1-grammar-77', $$この映画はストーリーもさることながら、音楽も印象的だ。$$, $$このえいがはストーリーもさることながら、おんがくもいんしょうてきだ。$$, $$Este filme tem não só uma boa história, mas também uma música marcante.$$),
    ('n1-grammar-77', $$結果もさることながら、努力の過程が大切だ。$$, $$けっかもさることながら、どりょくのかていがたいせつだ。$$, $$O resultado importa, mas o processo de esforço também é importante.$$),
    ('n1-grammar-77', $$この車は性能もさることながら、デザインも美しい。$$, $$このくるまはせいのうもさることながら、デザインもうつくしい。$$, $$Este carro tem não só bom desempenho, mas também um design bonito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の作品は技術____、アイデアも面白い。$$, $$As obras dele têm não só técnica, mas também ideias interessantes.$$),
        (2, $$このホテルは景色____、料理もおいしい。$$, $$Este hotel tem não só uma bela vista, mas também comida gostosa.$$),
        (3, $$能力____、やる気も重要だ。$$, $$Além da capacidade, a motivação também é importante.$$),
        (4, $$値段の安さ____、品質の良さも人気の理由だ。$$, $$Não só o preço baixo, mas também a boa qualidade é motivo do sucesso.$$),
        (5, $$彼女は歌____、ダンスも一流だ。$$, $$Ela é de primeira não só no canto, mas também na dança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もさることながら$$),
        (2, $$もさることながら$$),
        (3, $$もさることながら$$),
        (4, $$もさることながら$$),
        (5, $$もさることながら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-78 — 〜もしないで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-78',
    'grammar',
    'N1',
    $$〜もしないで$$,
    $$mo shinaide$$,
    $$Sem nem / Nem sequer / Sem ao menos$$,
    $$もしないで indica que alguém nem sequer fez algo básico antes de fazer outra coisa. Equivale a "sem nem" ou "sem ao menos".

O tom é de crítica, porque a pessoa pulou algo que deveria ter feito. Por exemplo, "sem nem experimentar, disse que era ruim".

A forma もせずに é mais formal e tem o mesmo sentido.$$,
    $$Combinações comuns são 見もしないで, 聞きもしないで, 調べもしないで e 勉強もしないで.

É parecido com ないで, mas もしないで reforça a crítica.$$,
    $$Verbo (forma ます sem ます) + もしないで
Verbo (forma ます sem ます) + もせずに
Substantivo (ação) + もしないで$$,
    $$もしないで$$,
    $$もしないで|もせずに|もせず$$,
    ARRAY['も', 'しないで']::text[],
    ARRAY['もしないで', 'もせずに', 'もせず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-78', $$食べもしないで、まずいと言うな。$$, $$たべもしないで、まずいというな。$$, $$Não diga que é ruim sem nem experimentar.$$),
    ('n1-grammar-78', $$彼は勉強もしないで、試験を受けた。$$, $$かれはべんきょうもしないで、しけんをうけた。$$, $$Ele fez a prova sem nem estudar.$$),
    ('n1-grammar-78', $$よく調べもせずに、契約してしまった。$$, $$よくしらべもせずに、けいやくしてしまった。$$, $$Assinei o contrato sem nem pesquisar direito.$$),
    ('n1-grammar-78', $$挨拶もしないで帰るなんて、失礼だ。$$, $$あいさつもしないでかえるなんて、しつれいだ。$$, $$Ir embora sem nem cumprimentar é falta de educação.$$),
    ('n1-grammar-78', $$彼女は見もしないで、手紙を捨てた。$$, $$かのじょはみもしないで、てがみをすてた。$$, $$Ela jogou a carta fora sem nem olhar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話を聞き____、反対するな。$$, $$Não seja contra sem nem ouvir o que os outros dizem.$$),
        (2, $$彼は返事____、部屋を出ていった。$$, $$Ele saiu do quarto sem nem responder.$$),
        (3, $$確かめ____、うわさを信じてしまった。$$, $$Acreditei no boato sem nem confirmar.$$),
        (4, $$一度も練習____、本番に出た。$$, $$Entrou na apresentação sem nem ensaiar uma vez.$$),
        (5, $$読み____、本を返した。$$, $$Devolvi o livro sem nem ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしないで$$),
        (1, $$もせずに$$),
        (2, $$もしないで$$),
        (2, $$もせずに$$),
        (2, $$もせず$$),
        (3, $$もしないで$$),
        (3, $$もせずに$$),
        (4, $$もしないで$$),
        (4, $$もせずに$$),
        (4, $$もせず$$),
        (5, $$もしないで$$),
        (5, $$もせずに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-79 — もはや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-79',
    'grammar',
    'N1',
    $$もはや$$,
    $$mohaya$$,
    $$Já não / Agora já / A esta altura$$,
    $$もはや indica que a situação mudou e chegou a um ponto em que não há mais volta. Equivale a "já não" ou "a esta altura".

Muitas vezes vem com uma forma negativa ou com expressões de impossibilidade. Por exemplo, "a esta altura, já não há como voltar atrás".

É uma palavra formal, mais forte que もう.$$,
    $$É parecido com もう e すでに, mas もはや mostra que a mudança é definitiva.

Expressões comuns são もはやこれまでだ e もはや手遅れだ.$$,
    $$もはや + Frase negativa
もはや + Substantivo + だ$$,
    $$もはや$$,
    $$もはや$$,
    ARRAY['もはや']::text[],
    ARRAY['もはや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-79', $$もはや後戻りはできない。$$, $$もはやあともどりはできない。$$, $$A esta altura, já não dá para voltar atrás.$$),
    ('n1-grammar-79', $$もはや手遅れだ。$$, $$もはやておくれだ。$$, $$Agora já é tarde demais.$$),
    ('n1-grammar-79', $$スマホはもはや生活に欠かせないものだ。$$, $$スマホはもはやせいかつにかかせないものだ。$$, $$O smartphone já virou algo indispensável na vida.$$),
    ('n1-grammar-79', $$彼はもはや昔の彼ではない。$$, $$かれはもはやむかしのかれではない。$$, $$Ele já não é mais aquele de antigamente.$$),
    ('n1-grammar-79', $$もはや誰も彼を止められない。$$, $$もはやだれもかれをとめられない。$$, $$A esta altura, ninguém mais consegue pará-lo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここまで来たら、____あきらめるしかない。$$, $$Chegando até aqui, já não resta nada senão desistir.$$),
        (2, $$この技術は____古い。$$, $$Esta tecnologia já é ultrapassada.$$),
        (3, $$____彼女を信じることはできない。$$, $$Já não consigo mais confiar nela.$$),
        (4, $$インターネットは____日常の一部だ。$$, $$A internet já virou parte do dia a dia.$$),
        (5, $$____これまでだ。$$, $$Agora já não há mais o que fazer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もはや$$),
        (2, $$もはや$$),
        (3, $$もはや$$),
        (4, $$もはや$$),
        (5, $$もはや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-80 — 〜もので
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-80',
    'grammar',
    'N1',
    $$〜もので$$,
    $$mono de$$,
    $$É que / Porque / Como$$,
    $$もので serve para explicar um motivo, geralmente como desculpa ou justificativa educada. Equivale a "é que" ou "porque".

A pessoa explica por que fez ou não fez algo, pedindo compreensão. Por exemplo, "desculpe o atraso, é que o trem parou".

É parecido com ものだから, mas soa um pouco mais suave e educado. Na fala, aparece como もんで.$$,
    $$Depois de もので não se usam ordens nem pedidos diretos.

É muito usado para pedir desculpas, como 〜もので、すみません.$$,
    $$Verbo (forma simples) + もので
Adjetivo い + もので
Adjetivo な / Substantivo + な + もので$$,
    $$もので$$,
    $$もので|もんで$$,
    ARRAY['もの', 'で']::text[],
    ARRAY['もので', 'もんで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-80', $$電車が遅れたもので、遅刻してしまいました。$$, $$でんしゃがおくれたもので、ちこくしてしまいました。$$, $$É que o trem atrasou, então acabei chegando atrasado.$$),
    ('n1-grammar-80', $$初めてなもので、よくわかりません。$$, $$はじめてなもので、よくわかりません。$$, $$É que é a primeira vez, então não entendo bem.$$),
    ('n1-grammar-80', $$急いでいたもので、挨拶もせずにすみません。$$, $$いそいでいたもので、あいさつもせずにすみません。$$, $$Desculpe não ter cumprimentado, é que eu estava com pressa.$$),
    ('n1-grammar-80', $$子供が熱を出したもので、今日は休ませてください。$$, $$こどもがねつをだしたもので、きょうはやすませてください。$$, $$É que meu filho está com febre, então me deixe faltar hoje.$$),
    ('n1-grammar-80', $$田舎者なもんで、都会のことはよく知らないんです。$$, $$いなかものなもんで、とかいのことはよくしらないんです。$$, $$É que sou do interior, então não conheço bem a cidade grande.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道に迷った____、遅くなりました。$$, $$É que me perdi, então me atrasei.$$),
        (2, $$あまりに安かった____、つい買ってしまいました。$$, $$É que estava tão barato que acabei comprando.$$),
        (3, $$不慣れな____、ご迷惑をおかけしました。$$, $$É que não estou acostumado, desculpe o transtorno.$$),
        (4, $$知らなかった____、失礼しました。$$, $$É que eu não sabia, me desculpe.$$),
        (5, $$携帯の電池が切れた____、連絡できませんでした。$$, $$É que a bateria do celular acabou, então não consegui avisar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もので$$),
        (1, $$もんで$$),
        (2, $$もので$$),
        (2, $$もんで$$),
        (3, $$もので$$),
        (3, $$もんで$$),
        (4, $$もので$$),
        (4, $$もんで$$),
        (5, $$もので$$),
        (5, $$もんで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-81 — 〜ものを
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-81',
    'grammar',
    'N1',
    $$〜ものを$$,
    $$mono wo$$,
    $$Se tivesse... teria / Mas / E no entanto$$,
    $$ものを expressa lamento, reclamação ou frustração porque algo não aconteceu como deveria. Equivale a "se tivesse..., teria" ou "e no entanto...".

Muitas vezes a pessoa diz que, se outra coisa tivesse sido feita, o resultado seria melhor. Por exemplo, "se tivesse me contado, eu teria ajudado".

É parecido com のに, mas soa mais formal e literário.$$,
    $$Muitas vezes vem com ば ou たら, falando de algo que não aconteceu.

Também pode ficar no fim da frase, como uma reclamação.$$,
    $$Verbo / Adjetivo (forma simples) + ものを
Verbo (forma ば) + 〜ものを$$,
    $$ものを$$,
    $$ものを$$,
    ARRAY['もの', 'を']::text[],
    ARRAY['ものを']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-81', $$言ってくれれば手伝ったものを。$$, $$いってくれればてつだったものを。$$, $$Se tivesse me dito, eu teria ajudado.$$),
    ('n1-grammar-81', $$早く病院に行けば治ったものを、彼は我慢してしまった。$$, $$はやくびょういんにいけばなおったものを、かれはがまんしてしまった。$$, $$Se tivesse ido logo ao hospital, teria sarado, mas ele aguentou calado.$$),
    ('n1-grammar-81', $$素直に謝ればいいものを、彼は言い訳ばかりする。$$, $$すなおにあやまればいいものを、かれはいいわけばかりする。$$, $$Bastava pedir desculpas com sinceridade, mas ele só dá desculpas.$$),
    ('n1-grammar-81', $$黙っていればわからなかったものを。$$, $$だまっていればわからなかったものを。$$, $$Se tivesse ficado calado, ninguém teria descoberto.$$),
    ('n1-grammar-81', $$一言相談してくれれば、いい方法を教えたものを。$$, $$ひとことそうだんしてくれれば、いいほうほうをおしえたものを。$$, $$Se tivesse me consultado, eu teria ensinado um bom jeito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう少し早く出れば間に合った____。$$, $$Se tivesse saído um pouco mais cedo, teria dado tempo.$$),
        (2, $$知っていれば教えてあげた____。$$, $$Se eu soubesse, teria te contado.$$),
        (3, $$断ればいい____、彼女は引き受けてしまった。$$, $$Bastava recusar, mas ela acabou aceitando.$$),
        (4, $$勉強していれば合格できた____。$$, $$Se tivesse estudado, teria passado.$$),
        (5, $$連絡してくれれば迎えに行った____。$$, $$Se tivesse me avisado, eu teria ido te buscar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものを$$),
        (2, $$ものを$$),
        (3, $$ものを$$),
        (4, $$ものを$$),
        (5, $$ものを$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-82 — 〜ものと思われる / 〜ものと見られる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-82',
    'grammar',
    'N1',
    $$〜ものと思われる / 〜ものと見られる$$,
    $$mono to omowareru / mono to mirareru$$,
    $$Acredita-se que / Supõe-se que / Estima-se que$$,
    $$ものと思われる e ものと見られる expressam uma suposição de forma objetiva e formal. Equivalem a "acredita-se que" ou "supõe-se que".

São muito usadas em notícias, relatórios e documentos oficiais, quando a informação ainda não é certa. Por exemplo, "acredita-se que a causa do incêndio foi um cigarro".

ものと見られる é ainda mais comum em notícias.$$,
    $$Também aparece como ものとみられる, em hiragana.

É parecido com と考えられる, mas ものと見られる é típico de jornalismo.$$,
    $$Verbo / Adjetivo (forma simples) + ものと思われる
Verbo / Adjetivo (forma simples) + ものと見られる$$,
    $$ものと思われる$$,
    $$ものと思われる|ものと見られる|ものとみられる|ものと思われます|ものと見られます|ものと見られて$$,
    ARRAY['もの', 'と', '思われる']::text[],
    ARRAY['ものと思われる', 'ものと見られる', 'ものとみられる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-82', $$火事の原因はたばこの火によるものと思われる。$$, $$かじのげんいんはたばこのひによるものとおもわれる。$$, $$Acredita-se que a causa do incêndio foi a brasa de um cigarro.$$),
    ('n1-grammar-82', $$犯人はまだ市内にいるものと見られている。$$, $$はんにんはまだしないにいるものとみられている。$$, $$Supõe-se que o culpado ainda esteja na cidade.$$),
    ('n1-grammar-82', $$今年の売り上げは、去年より増えるものと見られる。$$, $$ことしのうりあげは、きょねんよりふえるものとみられる。$$, $$Estima-se que as vendas deste ano aumentem em relação ao ano passado.$$),
    ('n1-grammar-82', $$この遺跡は千年前のものと思われます。$$, $$このいせきはせんねんまえのものとおもわれます。$$, $$Acredita-se que estas ruínas sejam de mil anos atrás.$$),
    ('n1-grammar-82', $$台風は明日の朝、上陸するものと見られる。$$, $$たいふうはあしたのあさ、じょうりくするものとみられる。$$, $$Estima-se que o tufão chegue à terra amanhã de manhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故の原因は、運転手の不注意による____。$$, $$Acredita-se que a causa do acidente foi descuido do motorista.$$),
        (2, $$この絵は有名な画家が描いた____。$$, $$Acredita-se que este quadro foi pintado por um pintor famoso.$$),
        (3, $$景気は今後、回復に向かう____。$$, $$Estima-se que a economia caminhe para a recuperação daqui em diante.$$),
        (4, $$被害は広い範囲に及んでいる____。$$, $$Supõe-se que os danos atinjam uma grande área.$$),
        (5, $$投票率は前回を下回る____。$$, $$Estima-se que a taxa de votação fique abaixo da anterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものと思われる$$),
        (1, $$ものと見られる$$),
        (1, $$ものとみられる$$),
        (2, $$ものと思われる$$),
        (2, $$ものと見られる$$),
        (2, $$ものと思われます$$),
        (3, $$ものと見られる$$),
        (3, $$ものとみられる$$),
        (3, $$ものと思われる$$),
        (4, $$ものと見られる$$),
        (4, $$ものとみられる$$),
        (4, $$ものと思われる$$),
        (5, $$ものと見られる$$),
        (5, $$ものとみられる$$),
        (5, $$ものと思われる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-83 — 〜ものとする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-83',
    'grammar',
    'N1',
    $$〜ものとする$$,
    $$mono to suru$$,
    $$Fica estabelecido que / Considera-se que / Deve-se$$,
    $$ものとする é usado para estabelecer uma regra, uma condição ou uma interpretação oficial. Equivale a "fica estabelecido que" ou "considera-se que".

É uma expressão típica de contratos, leis, regulamentos e documentos formais. Por exemplo, "o contrato será considerado válido a partir da assinatura" ou "o pagamento deve ser feito até o fim do mês".$$,
    $$Quase não é usado na fala do dia a dia.

Também aparece como ものとします, na forma educada, e ものとみなす, "considera-se como".$$,
    $$Verbo (forma dicionário) + ものとする
Verbo (forma ない) + ものとする$$,
    $$ものとする$$,
    $$ものとする|ものとします$$,
    ARRAY['もの', 'と', 'する']::text[],
    ARRAY['ものとする', 'ものとします']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-83', $$契約は署名した日から有効になるものとする。$$, $$けいやくはしょめいしたひからゆうこうになるものとする。$$, $$Fica estabelecido que o contrato é válido a partir da data da assinatura.$$),
    ('n1-grammar-83', $$家賃は毎月末日までに支払うものとする。$$, $$やちんはまいげつまつじつまでにしはらうものとする。$$, $$O aluguel deve ser pago até o último dia de cada mês.$$),
    ('n1-grammar-83', $$連絡がない場合は、欠席したものとします。$$, $$れんらくがないばあいは、けっせきしたものとします。$$, $$Em caso de falta de aviso, considera-se ausência.$$),
    ('n1-grammar-83', $$この規則は来月から適用するものとする。$$, $$このきそくはらいげつからてきようするものとする。$$, $$Fica estabelecido que esta regra será aplicada a partir do mês que vem.$$),
    ('n1-grammar-83', $$期限を過ぎた申し込みは受け付けないものとする。$$, $$きげんをすぎたもうしこみはうけつけないものとする。$$, $$Fica estabelecido que inscrições fora do prazo não serão aceitas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会員は年会費を前払いする____。$$, $$Os sócios devem pagar a anuidade adiantado.$$),
        (2, $$返事がない場合は、賛成した____。$$, $$Em caso de não haver resposta, considera-se que concorda.$$),
        (3, $$会議は月に一回開く____。$$, $$Fica estabelecido que a reunião será realizada uma vez por mês.$$),
        (4, $$本契約は一年間有効な____。$$, $$Fica estabelecido que este contrato é válido por um ano.$$),
        (5, $$違反した場合は、罰金を支払う____。$$, $$Em caso de infração, deve-se pagar uma multa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものとする$$),
        (1, $$ものとします$$),
        (2, $$ものとする$$),
        (2, $$ものとします$$),
        (3, $$ものとする$$),
        (3, $$ものとします$$),
        (4, $$ものとする$$),
        (4, $$ものとします$$),
        (5, $$ものとする$$),
        (5, $$ものとします$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-84 — 〜ものとして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-84',
    'grammar',
    'N1',
    $$〜ものとして$$,
    $$mono to shite$$,
    $$Supondo que / Considerando que / Como se$$,
    $$ものとして indica que algo é tratado ou considerado de uma certa forma, mesmo que não seja totalmente certo. Equivale a "supondo que" ou "considerando que".

A pessoa age como se aquilo fosse verdade. Por exemplo, "considerando que ele vem, vamos preparar a comida".

É uma expressão formal, comum no trabalho e em documentos.$$,
    $$É parecido com と仮定して e と考えて.

A forma ものとして扱う significa "tratar como".$$,
    $$Verbo / Adjetivo (forma simples) + ものとして + Verbo
Substantivo + の + ものとして$$,
    $$ものとして$$,
    $$ものとして$$,
    ARRAY['もの', 'と', 'して']::text[],
    ARRAY['ものとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-84', $$全員参加するものとして、席を用意した。$$, $$ぜんいんさんかするものとして、せきをよういした。$$, $$Preparamos os lugares considerando que todos vão participar.$$),
    ('n1-grammar-84', $$返事がない人は、欠席するものとして扱います。$$, $$へんじがないひとは、けっせきするものとしてあつかいます。$$, $$Quem não responder será tratado como ausente.$$),
    ('n1-grammar-84', $$この計画は成功するものとして、次の準備を始めよう。$$, $$このけいかくはせいこうするものとして、つぎのじゅんびをはじめよう。$$, $$Supondo que este plano dê certo, vamos começar a preparar o próximo.$$),
    ('n1-grammar-84', $$事故はなかったものとして、話を進めてください。$$, $$じこはなかったものとして、はなしをすすめてください。$$, $$Continue a conversa como se o acidente não tivesse acontecido.$$),
    ('n1-grammar-84', $$雨が降るものとして、傘を持っていこう。$$, $$あめがふるものとして、かさをもっていこう。$$, $$Considerando que vai chover, vamos levar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$予算は増えない____、計画を立てる。$$, $$Vamos fazer o plano considerando que o orçamento não vai aumentar.$$),
        (2, $$彼は来ない____、四人で始めましょう。$$, $$Considerando que ele não vem, vamos começar em quatro.$$),
        (3, $$今の話は聞かなかった____、忘れてください。$$, $$Esqueça, como se você não tivesse ouvido o que eu disse.$$),
        (4, $$問題は解決した____、次の議題に移ります。$$, $$Considerando que o problema foi resolvido, passaremos à próxima pauta.$$),
        (5, $$参加者は百人いる____、会場を予約した。$$, $$Reservamos o local supondo que haverá cem participantes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものとして$$),
        (2, $$ものとして$$),
        (3, $$ものとして$$),
        (4, $$ものとして$$),
        (5, $$ものとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-85 — もしくは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-85',
    'grammar',
    'N1',
    $$もしくは$$,
    $$moshiku wa$$,
    $$Ou / Ou então / Ou ainda$$,
    $$もしくは serve para apresentar opções, com o sentido de "ou" ou "ou então". É uma forma formal de または e か.

É muito usado em documentos, avisos, regras e explicações oficiais. Por exemplo, "entre em contato por telefone ou por e-mail".

Na fala do dia a dia, usa-se mais か ou または.$$,
    $$É parecido com または e あるいは.

Em textos legais, もしくは é usado para opções menores dentro de um grupo, e または para grupos maiores.$$,
    $$Substantivo + もしくは + Substantivo
Frase + もしくは + Frase$$,
    $$もしくは$$,
    $$もしくは|若しくは$$,
    ARRAY['もしくは']::text[],
    ARRAY['もしくは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-85', $$お問い合わせは電話もしくはメールでお願いします。$$, $$おといあわせはでんわもしくはメールでおねがいします。$$, $$Entre em contato por telefone ou por e-mail.$$),
    ('n1-grammar-85', $$本人もしくは家族の署名が必要です。$$, $$ほんにんもしくはかぞくのしょめいがひつようです。$$, $$É necessária a assinatura da própria pessoa ou de um familiar.$$),
    ('n1-grammar-85', $$黒もしくは青のペンで記入してください。$$, $$くろもしくはあおのペンできにゅうしてください。$$, $$Preencha com caneta preta ou azul.$$),
    ('n1-grammar-85', $$参加できない場合は、事前に連絡するか、もしくは代理人を立ててください。$$, $$さんかできないばあいは、じぜんにれんらくするか、もしくはだいりにんをたててください。$$, $$Se não puder participar, avise antes ou então indique um representante.$$),
    ('n1-grammar-85', $$会議は月曜日もしくは火曜日に行います。$$, $$かいぎはげつようびもしくはかようびにおこないます。$$, $$A reunião será na segunda ou na terça-feira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$申し込みは窓口____郵送で受け付けます。$$, $$As inscrições são aceitas no guichê ou pelo correio.$$),
        (2, $$パスポート____運転免許証を見せてください。$$, $$Mostre o passaporte ou a carteira de motorista.$$),
        (3, $$支払いは現金____カードでお願いします。$$, $$O pagamento pode ser em dinheiro ou cartão.$$),
        (4, $$詳しくは担当者____受付にお尋ねください。$$, $$Para mais detalhes, pergunte ao responsável ou na recepção.$$),
        (5, $$明日____明後日にお届けします。$$, $$Entregaremos amanhã ou depois de amanhã.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もしくは$$),
        (2, $$もしくは$$),
        (3, $$もしくは$$),
        (4, $$もしくは$$),
        (5, $$もしくは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-86 — 〜んばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-86',
    'grammar',
    'N1',
    $$〜んばかりに$$,
    $$n bakari ni$$,
    $$Como se fosse / Quase a ponto de / Como quem$$,
    $$んばかりに indica que algo está quase acontecendo, ou que alguém age como se fosse fazer algo. Equivale a "como se fosse..." ou "quase a ponto de".

Muitas vezes descreve gestos ou expressões intensas. Por exemplo, "ele me olhou como quem dizia 'saia daqui'" ou "chorou como se fosse se desmanchar".

É uma expressão literária, mais comum na escrita.$$,
    $$Atenção à forma de する, que vira せんばかり.

Expressões comuns são 泣かんばかりに, 言わんばかりに e あふれんばかりの.

O sujeito costuma ser outra pessoa, não a primeira pessoa.$$,
    $$Verbo (forma ない sem ない) + んばかりに
Verbo (forma ない sem ない) + んばかりの + Substantivo
Verbo (forma ない sem ない) + んばかりだ
する → せんばかりに$$,
    $$んばかりに$$,
    $$んばかりに|んばかりの|んばかりだ|んばかり$$,
    ARRAY['ん', 'ばかり', 'に']::text[],
    ARRAY['んばかりに', 'んばかりの', 'んばかりだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-86', $$彼は早く帰れと言わんばかりに、時計を見た。$$, $$かれははやくかえれといわんばかりに、とけいをみた。$$, $$Ele olhou o relógio como quem dizia: vá embora logo.$$),
    ('n1-grammar-86', $$彼女は泣かんばかりに頼んできた。$$, $$かのじょはなかんばかりにたのんできた。$$, $$Ela me pediu quase chorando.$$),
    ('n1-grammar-86', $$会場はあふれんばかりの人だった。$$, $$かいじょうはあふれんばかりのひとだった。$$, $$O local estava a ponto de transbordar de tanta gente.$$),
    ('n1-grammar-86', $$子供は飛び上がらんばかりに喜んだ。$$, $$こどもはとびあがらんばかりによろこんだ。$$, $$A criança ficou tão feliz que quase pulou.$$),
    ('n1-grammar-86', $$彼は今にも怒り出さんばかりの顔をしていた。$$, $$かれはいまにもおこりださんばかりのかおをしていた。$$, $$Ele estava com uma cara de quem ia explodir de raiva a qualquer momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はお前が悪いと言わ____、私をにらんだ。$$, $$Ele me encarou como quem dizia: a culpa é sua.$$),
        (2, $$母は泣か____、私の合格を喜んだ。$$, $$Minha mãe comemorou a minha aprovação quase chorando.$$),
        (3, $$あふれ____笑顔で、彼女は迎えてくれた。$$, $$Ela me recebeu com um sorriso radiante.$$),
        (4, $$彼は土下座せ____謝った。$$, $$Ele pediu desculpas quase se ajoelhando.$$),
        (5, $$割れ____拍手が起こった。$$, $$Houve aplausos a ponto de fazer o teto vir abaixo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んばかりに$$),
        (2, $$んばかりに$$),
        (3, $$んばかりの$$),
        (4, $$んばかりに$$),
        (5, $$んばかりの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-87 — 〜んがために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-87',
    'grammar',
    'N1',
    $$〜んがために$$,
    $$n ga tame ni$$,
    $$Com o único propósito de / Só para / A fim de$$,
    $$んがために indica um objetivo forte e determinado. Equivale a "com o único propósito de" ou "a fim de".

A pessoa mostra que fez algo, muitas vezes difícil ou extremo, apenas para alcançar aquele objetivo. Por exemplo, "mentiu só para vencer".

É uma forma antiga e muito formal de ために, usada na escrita.$$,
    $$Atenção à forma de する, que vira せんがために.

Expressões comuns são 勝たんがために, 生きんがために e 知らんがために.$$,
    $$Verbo (forma ない sem ない) + んがために
Verbo (forma ない sem ない) + んがための + Substantivo
する → せんがために$$,
    $$んがために$$,
    $$んがために|んがための|んがため$$,
    ARRAY['ん', 'が', 'ために']::text[],
    ARRAY['んがために', 'んがための', 'んがため']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-87', $$勝たんがために、彼はうそをついた。$$, $$かたんがために、かれはうそをついた。$$, $$Ele mentiu só para vencer.$$),
    ('n1-grammar-87', $$生きんがために、必死で働いた。$$, $$いきんがために、ひっしではたらいた。$$, $$Trabalhou desesperadamente só para sobreviver.$$),
    ('n1-grammar-87', $$真実を知らんがために、彼は調査を続けた。$$, $$しんじつをしらんがために、かれはちょうさをつづけた。$$, $$Ele continuou a investigação com o único propósito de saber a verdade.$$),
    ('n1-grammar-87', $$夢を実現せんがために、海外へ渡った。$$, $$ゆめをじつげんせんがために、かいがいへわたった。$$, $$Foi para o exterior com o único propósito de realizar seu sonho.$$),
    ('n1-grammar-87', $$合格せんがための努力は、決して無駄ではない。$$, $$ごうかくせんがためのどりょくは、けっしてむだではない。$$, $$O esforço feito com o objetivo de passar nunca é em vão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族を守ら____、彼はすべてを捨てた。$$, $$Ele abandonou tudo só para proteger a família.$$),
        (2, $$目的を達成せ____、手段を選ばなかった。$$, $$Para alcançar o objetivo, não mediu meios.$$),
        (3, $$注目を集め____、彼は派手な服を着た。$$, $$Ele usou roupas chamativas só para chamar a atenção.$$),
        (4, $$記録を破ら____、毎日練習した。$$, $$Treinou todos os dias com o único propósito de quebrar o recorde.$$),
        (5, $$売ら____宣伝ばかりで、中身がない。$$, $$É só propaganda para vender, sem conteúdo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$んがために$$),
        (1, $$んがため$$),
        (2, $$んがために$$),
        (2, $$んがため$$),
        (3, $$んがために$$),
        (3, $$んがため$$),
        (4, $$んがために$$),
        (4, $$んがため$$),
        (5, $$んがための$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-88 — 〜ながらに / 〜ながらの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-88',
    'grammar',
    'N1',
    $$〜ながらに / 〜ながらの$$,
    $$nagara ni / nagara no$$,
    $$Desde / Ainda em / Tal como$$,
    $$ながらに e ながらの indicam que um estado continua igual, sem mudanças. Equivalem a "desde", "ainda em" ou "tal como".

Aparecem em expressões fixas. Por exemplo, 生まれながらに significa "desde o nascimento", 涙ながらに significa "em lágrimas", e 昔ながらの significa "tal como antigamente".

ながらの vem antes de substantivos, e ながらに funciona como advérbio.$$,
    $$Só funciona com algumas palavras fixas, como 生まれながら, 涙ながら, 昔ながら, いながらにして e 居ながら.

Não se confunde com ながら de "enquanto".$$,
    $$Substantivo / Verbo (forma ます sem ます) + ながらに + Verbo
Substantivo / Verbo (forma ます sem ます) + ながらの + Substantivo$$,
    $$ながらに$$,
    $$ながらに|ながらの|ながら$$,
    ARRAY['ながら', 'に']::text[],
    ARRAY['ながらに', 'ながらの', 'ながらにして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-88', $$彼は生まれながらに音楽の才能があった。$$, $$かれはうまれながらにおんがくのさいのうがあった。$$, $$Ele tinha talento para música desde o nascimento.$$),
    ('n1-grammar-88', $$この町には昔ながらの町並みが残っている。$$, $$このまちにはむかしながらのまちなみがのこっている。$$, $$Nesta cidade, ainda resta uma paisagem urbana tal como antigamente.$$),
    ('n1-grammar-88', $$彼女は涙ながらに事故の様子を語った。$$, $$かのじょはなみだながらにじこのようすをかたった。$$, $$Ela contou em lágrimas como foi o acidente.$$),
    ('n1-grammar-88', $$インターネットで、家にいながらにして買い物ができる。$$, $$インターネットで、いえにいながらにしてかいものができる。$$, $$Com a internet, dá para fazer compras sem sair de casa.$$),
    ('n1-grammar-88', $$昔ながらの製法で作られたしょうゆだ。$$, $$むかしながらのせいほうでつくられたしょうゆだ。$$, $$É um shoyu feito com o método tradicional de antigamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この店は昔____味を守っている。$$, $$Esta loja mantém o sabor tal como antigamente.$$),
        (2, $$彼女は涙____別れを告げた。$$, $$Ela se despediu em lágrimas.$$),
        (3, $$人は生まれ____平等である。$$, $$As pessoas são iguais desde o nascimento.$$),
        (4, $$昔____祭りが今も続いている。$$, $$Um festival tal como antigamente continua até hoje.$$),
        (5, $$家にい____、世界中の人と話せる。$$, $$Sem sair de casa, dá para conversar com pessoas do mundo todo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながらの$$),
        (2, $$ながらに$$),
        (3, $$ながらに$$),
        (4, $$ながらの$$),
        (5, $$ながらにして$$),
        (5, $$ながらに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-89 — 〜ないまでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-89',
    'grammar',
    'N1',
    $$〜ないまでも$$,
    $$nai made mo$$,
    $$Mesmo que não / Se não... pelo menos / Ainda que não$$,
    $$ないまでも indica que, mesmo que não se alcance um nível alto, pelo menos se espera um nível menor. Equivale a "mesmo que não..., pelo menos".

A primeira parte mostra o ideal, que talvez não seja possível, e a segunda mostra o mínimo desejado. Por exemplo, "mesmo que não seja todo dia, pelo menos três vezes por semana quero me exercitar".

A segunda parte costuma ter せめて, くらいは ou expressões de desejo.$$,
    $$É parecido com ないにしても.

A segunda parte costuma ter たい, べきだ, てほしい ou ほうがいい.$$,
    $$Verbo (forma ない) + までも + Mínimo desejado$$,
    $$ないまでも$$,
    $$ないまでも$$,
    ARRAY['ない', 'まで', 'も']::text[],
    ARRAY['ないまでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-89', $$毎日とは言わないまでも、週に三回は運動したい。$$, $$まいにちとはいわないまでも、しゅうにさんかいはうんどうしたい。$$, $$Mesmo que não seja todo dia, quero me exercitar pelo menos três vezes por semana.$$),
    ('n1-grammar-89', $$優勝できないまでも、三位以内には入りたい。$$, $$ゆうしょうできないまでも、さんいいないにははいりたい。$$, $$Mesmo que não vença, quero pelo menos ficar entre os três primeiros.$$),
    ('n1-grammar-89', $$手伝わないまでも、邪魔はしないでほしい。$$, $$てつだわないまでも、じゃまはしないでほしい。$$, $$Se não vai ajudar, pelo menos não atrapalhe.$$),
    ('n1-grammar-89', $$完璧ではないまでも、かなりいい出来だ。$$, $$かんぺきではないまでも、かなりいいできだ。$$, $$Mesmo que não seja perfeito, ficou bem bom.$$),
    ('n1-grammar-89', $$会いに行かないまでも、電話くらいはするべきだ。$$, $$あいにいかないまでも、でんわくらいはするべきだ。$$, $$Mesmo que não vá visitá-lo, deveria pelo menos ligar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$満点は取れ____、合格点は取りたい。$$, $$Mesmo que não tire nota máxima, quero pelo menos a nota de aprovação.$$),
        (2, $$お礼を言わ____、挨拶くらいはしなさい。$$, $$Se não vai agradecer, pelo menos cumprimente.$$),
        (3, $$プロにはなれ____、趣味として続けたい。$$, $$Mesmo que não vire profissional, quero continuar como hobby.$$),
        (4, $$毎日料理をし____、週末くらいは作ろう。$$, $$Mesmo que não cozinhe todo dia, vamos pelo menos cozinhar no fim de semana.$$),
        (5, $$全部は覚えられ____、半分は覚えたい。$$, $$Mesmo que não consiga decorar tudo, quero decorar pelo menos a metade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないまでも$$),
        (2, $$ないまでも$$),
        (3, $$ないまでも$$),
        (4, $$ないまでも$$),
        (5, $$ないまでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-90 — 〜ないものでもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-90',
    'grammar',
    'N1',
    $$〜ないものでもない$$,
    $$nai mono demo nai$$,
    $$Não é impossível / Até que dá para / Não deixa de ser possível$$,
    $$ないものでもない é uma dupla negação que expressa uma possibilidade fraca. Equivale a "não é impossível" ou "até que dá para".

A pessoa admite que algo é possível, mas sem muita vontade ou certeza. Por exemplo, "se você insistir, até que dá para eu ajudar".

É uma expressão formal e indireta.$$,
    $$É parecido com なくはない e ないこともない, mas ないものでもない é mais formal.

Muitas vezes vem com uma condição, como ば ou なら.$$,
    $$Verbo (forma ない) + ものでもない
Verbo (forma potencial, forma ない) + ものでもない$$,
    $$ないものでもない$$,
    $$ないものでもない|ないものでもありません$$,
    ARRAY['ない', 'もの', 'でも', 'ない']::text[],
    ARRAY['ないものでもない', 'ないものでもありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-90', $$急げば、間に合わないものでもない。$$, $$いそげば、まにあわないものでもない。$$, $$Se correr, não é impossível chegar a tempo.$$),
    ('n1-grammar-90', $$条件次第では、引き受けないものでもない。$$, $$じょうけんしだいでは、ひきうけないものでもない。$$, $$Dependendo das condições, até que dá para eu aceitar.$$),
    ('n1-grammar-90', $$頼まれれば、手伝わないものでもない。$$, $$たのまれれば、てつだわないものでもない。$$, $$Se me pedirem, até que posso ajudar.$$),
    ('n1-grammar-90', $$その気持ちはわからないものでもない。$$, $$そのきもちはわからないものでもない。$$, $$Esse sentimento não deixa de ser compreensível.$$),
    ('n1-grammar-90', $$二人で頑張れば、できないものでもありません。$$, $$ふたりでがんばれば、できないものでもありません。$$, $$Se nós dois nos esforçarmos, não é impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$値段によっては、買わ____。$$, $$Dependendo do preço, até que eu compro.$$),
        (2, $$練習すれば、勝て____。$$, $$Se treinar, não é impossível vencer.$$),
        (3, $$彼が謝るなら、許さ____。$$, $$Se ele pedir desculpas, até que dá para perdoar.$$),
        (4, $$時間があれば、行か____。$$, $$Se eu tiver tempo, até que posso ir.$$),
        (5, $$この問題は難しいが、解け____。$$, $$Este problema é difícil, mas não é impossível de resolver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないものでもない$$),
        (1, $$ないものでもありません$$),
        (2, $$ないものでもない$$),
        (2, $$ないものでもありません$$),
        (3, $$ないものでもない$$),
        (3, $$ないものでもありません$$),
        (4, $$ないものでもない$$),
        (4, $$ないものでもありません$$),
        (5, $$ないものでもない$$),
        (5, $$ないものでもありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-91 — 〜ないものか / 〜ないものだろうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-91',
    'grammar',
    'N1',
    $$〜ないものか / 〜ないものだろうか$$,
    $$nai mono ka / nai mono darou ka$$,
    $$Será que não há como / Será que não dá para / Quem dera$$,
    $$ないものか e ないものだろうか expressam um desejo forte de que algo aconteça, mesmo sendo difícil. Equivalem a "será que não há como...?" ou "quem dera...".

A pessoa procura uma forma de realizar algo que parece complicado. Por exemplo, "será que não há como resolver este problema?".

Costumam vir com a forma potencial do verbo, como できないものか ou 行けないものか.$$,
    $$É parecido com ないかなあ, mas ないものか é mais formal e expressa um desejo mais forte.

A forma ないものでしょうか é usada para fazer pedidos educados.$$,
    $$Verbo (forma potencial, forma ない) + ものか
Verbo (forma potencial, forma ない) + ものだろうか
Verbo (forma ない) + ものか$$,
    $$ないものか$$,
    $$ないものか|ないものだろうか|ないものでしょうか|ないもんか$$,
    ARRAY['ない', 'もの', 'か']::text[],
    ARRAY['ないものか', 'ないものだろうか', 'ないものでしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-91', $$この問題を何とか解決できないものか。$$, $$このもんだいをなんとかかいけつできないものか。$$, $$Será que não há como resolver este problema de algum jeito?$$),
    ('n1-grammar-91', $$もっと安く旅行できないものだろうか。$$, $$もっとやすくりょこうできないものだろうか。$$, $$Será que não dá para viajar mais barato?$$),
    ('n1-grammar-91', $$彼の病気が早く治らないものか。$$, $$かれのびょうきがはやくなおらないものか。$$, $$Quem dera a doença dele sarasse logo.$$),
    ('n1-grammar-91', $$締め切りを少し延ばしていただけないものでしょうか。$$, $$しめきりをすこしのばしていただけないものでしょうか。$$, $$Será que não seria possível estender um pouco o prazo?$$),
    ('n1-grammar-91', $$毎日の通勤時間をもっと短くできないものか。$$, $$まいにちのつうきんじかんをもっとみじかくできないものか。$$, $$Será que não há como encurtar o tempo de deslocamento diário?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何とかして彼女に会え____。$$, $$Será que não há como eu encontrá-la de algum jeito?$$),
        (2, $$この渋滞は何とかなら____。$$, $$Será que este congestionamento não tem solução?$$),
        (3, $$もう少し値段を下げられ____。$$, $$Será que não dá para baixar um pouco o preço?$$),
        (4, $$戦争のない世界は作れ____。$$, $$Será que não é possível criar um mundo sem guerras?$$),
        (5, $$早く春が来____。$$, $$Quem dera a primavera chegasse logo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないものか$$),
        (1, $$ないものだろうか$$),
        (2, $$ないものか$$),
        (2, $$ないものだろうか$$),
        (3, $$ないものか$$),
        (3, $$ないものだろうか$$),
        (3, $$ないものでしょうか$$),
        (4, $$ないものか$$),
        (4, $$ないものだろうか$$),
        (5, $$ないものか$$),
        (5, $$ないものだろうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-92 — 〜ないとも限らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-92',
    'grammar',
    'N1',
    $$〜ないとも限らない$$,
    $$nai tomo kagiranai$$,
    $$Pode ser que / Não é impossível que / Nunca se sabe se$$,
    $$ないとも限らない indica que existe uma pequena possibilidade de algo acontecer, geralmente algo ruim. Equivale a "pode ser que" ou "nunca se sabe se".

A pessoa usa essa expressão para justificar um cuidado ou uma precaução. Por exemplo, "pode ser que chova, então leve o guarda-chuva".

Muitas vezes a segunda parte é um conselho ou uma ação de prevenção.$$,
    $$É parecido com かもしれない, mas ないとも限らない destaca uma possibilidade pequena e ruim.

A forma ないとは限らない tem um sentido parecido.$$,
    $$Verbo (forma ない) + とも限らない
Adjetivo い (forma くない) + とも限らない$$,
    $$ないとも限らない$$,
    $$ないとも限らない|ないともかぎらない|ないとも限りません$$,
    ARRAY['ない', 'とも', '限らない']::text[],
    ARRAY['ないとも限らない', 'ないともかぎらない', 'ないとも限りません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-92', $$雨が降らないとも限らないから、傘を持っていこう。$$, $$あめがふらないともかぎらないから、かさをもっていこう。$$, $$Pode ser que chova, então vamos levar guarda-chuva.$$),
    ('n1-grammar-92', $$事故が起きないとも限らないので、保険に入っておこう。$$, $$じこがおきないともかぎらないので、ほけんにはいっておこう。$$, $$Nunca se sabe se vai acontecer um acidente, então vamos fazer seguro.$$),
    ('n1-grammar-92', $$誰かに聞かれないとも限らないから、小さい声で話して。$$, $$だれかにきかれないともかぎらないから、ちいさいこえではなして。$$, $$Pode ser que alguém ouça, então fale baixo.$$),
    ('n1-grammar-92', $$彼が気を変えないとも限らない。$$, $$かれがきをかえないともかぎらない。$$, $$Não é impossível que ele mude de ideia.$$),
    ('n1-grammar-92', $$地震が来ないとも限りませんから、準備しておきましょう。$$, $$じしんがこないともかぎりませんから、じゅんびしておきましょう。$$, $$Pode ser que venha um terremoto, então vamos nos preparar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道が混ま____から、早めに出よう。$$, $$Pode ser que a estrada esteja cheia, então vamos sair mais cedo.$$),
        (2, $$パソコンが壊れ____ので、データを保存しておく。$$, $$Nunca se sabe se o computador vai quebrar, então salvo os dados.$$),
        (3, $$忘れ____から、メモしておこう。$$, $$Pode ser que eu esqueça, então vou anotar.$$),
        (4, $$泥棒が入ら____ので、鍵をかけてください。$$, $$Pode ser que entre um ladrão, então tranque a porta.$$),
        (5, $$病気にかから____から、健康診断を受けよう。$$, $$Nunca se sabe se vamos adoecer, então vamos fazer exames.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないとも限らない$$),
        (1, $$ないともかぎらない$$),
        (2, $$ないとも限らない$$),
        (2, $$ないともかぎらない$$),
        (3, $$ないとも限らない$$),
        (3, $$ないともかぎらない$$),
        (4, $$ないとも限らない$$),
        (4, $$ないともかぎらない$$),
        (4, $$ないとも限りません$$),
        (5, $$ないとも限らない$$),
        (5, $$ないともかぎらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-93 — 〜なくしては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-93',
    'grammar',
    'N1',
    $$〜なくしては$$,
    $$naku shite wa$$,
    $$Sem / Se não fosse / Na ausência de$$,
    $$なくしては indica que, sem algo, uma coisa não seria possível. Equivale a "sem" ou "se não fosse".

A segunda parte é sempre negativa ou indica impossibilidade. Por exemplo, "sem o apoio de vocês, este sucesso não teria acontecido".

É uma expressão formal, muito usada em discursos e agradecimentos.$$,
    $$É parecido com なしには e がなければ.

A forma なくして sem は também aparece, como em 努力なくして成功なし.$$,
    $$Substantivo + なくしては + Frase negativa
Substantivo + なくして(は) + Verbo (forma potencial negativa)$$,
    $$なくしては$$,
    $$なくしては|なくして$$,
    ARRAY['なく', 'して', 'は']::text[],
    ARRAY['なくしては', 'なくして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-93', $$皆さんの協力なくしては、この計画は成功しなかった。$$, $$みなさんのきょうりょくなくしては、このけいかくはせいこうしなかった。$$, $$Sem a cooperação de todos, este plano não teria dado certo.$$),
    ('n1-grammar-93', $$努力なくしては、夢は実現できない。$$, $$どりょくなくしては、ゆめはじつげんできない。$$, $$Sem esforço, não dá para realizar sonhos.$$),
    ('n1-grammar-93', $$愛なくしては、人は生きられない。$$, $$あいなくしては、ひとはいきられない。$$, $$Sem amor, as pessoas não conseguem viver.$$),
    ('n1-grammar-93', $$家族の支えなくしては、ここまで来られなかった。$$, $$かぞくのささえなくしては、ここまでこられなかった。$$, $$Se não fosse o apoio da família, eu não teria chegado até aqui.$$),
    ('n1-grammar-93', $$信頼なくして、いい関係は作れない。$$, $$しんらいなくして、いいかんけいはつくれない。$$, $$Sem confiança, não dá para construir uma boa relação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生の指導____、合格はできなかった。$$, $$Sem a orientação do professor, eu não teria passado.$$),
        (2, $$健康____、仕事は続けられない。$$, $$Sem saúde, não dá para continuar trabalhando.$$),
        (3, $$ファンの応援____、優勝はありえなかった。$$, $$Sem o apoio dos fãs, a vitória teria sido impossível.$$),
        (4, $$この技術____、今の生活は考えられない。$$, $$Sem esta tecnologia, é impossível imaginar a vida atual.$$),
        (5, $$苦労____、本当の喜びは得られない。$$, $$Sem dificuldades, não se alcança a verdadeira alegria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくしては$$),
        (1, $$なくして$$),
        (2, $$なくしては$$),
        (2, $$なくして$$),
        (3, $$なくしては$$),
        (3, $$なくして$$),
        (4, $$なくしては$$),
        (4, $$なくして$$),
        (5, $$なくしては$$),
        (5, $$なくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-94 — 〜並み
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-94',
    'grammar',
    'N1',
    $$〜並み$$,
    $$nami$$,
    $$Ao nível de / Igual a / Comparável a$$,
    $$並み indica que algo está no mesmo nível ou grau de outra coisa. Equivale a "ao nível de" ou "comparável a".

Por exemplo, "um calor de verão" ou "uma habilidade de profissional".

Também aparece com palavras de tempo, como 例年並み, que significa "igual aos anos anteriores".$$,
    $$Expressões comuns são プロ並み, 例年並み, 人並み, 世間並み e 平年並み.

A palavra 人並み significa "como a maioria das pessoas" ou "normal".$$,
    $$Substantivo + 並み
Substantivo + 並みの + Substantivo
Substantivo + 並みに + Verbo / Adjetivo$$,
    $$並み$$,
    $$並み|なみ$$,
    ARRAY['並み']::text[],
    ARRAY['並み', '並みの', '並みに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-94', $$彼の料理の腕はプロ並みだ。$$, $$かれのりょうりのうではプロなみだ。$$, $$A habilidade dele na cozinha é de nível profissional.$$),
    ('n1-grammar-94', $$今日は真夏並みの暑さだ。$$, $$きょうはまなつなみのあつさだ。$$, $$Hoje está um calor de pleno verão.$$),
    ('n1-grammar-94', $$今年の桜は例年並みに咲いた。$$, $$ことしのさくらはれいねんなみにさいた。$$, $$As cerejeiras deste ano floresceram como nos anos anteriores.$$),
    ('n1-grammar-94', $$人並みの生活ができれば十分だ。$$, $$ひとなみのせいかつができればじゅうぶんだ。$$, $$Basta poder levar uma vida normal como a de todos.$$),
    ('n1-grammar-94', $$この子は大人並みに漢字が読める。$$, $$このこはおとななみにかんじがよめる。$$, $$Esta criança lê kanji como um adulto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の英語はネイティブ____だ。$$, $$O inglês dela é de nível nativo.$$),
        (2, $$今年の冬は平年____の寒さだそうだ。$$, $$Dizem que o frio deste inverno será igual ao de anos normais.$$),
        (3, $$彼はプロ____の技術を持っている。$$, $$Ele tem uma técnica de nível profissional.$$),
        (4, $$人____に結婚して、子供がほしい。$$, $$Quero me casar e ter filhos, como a maioria das pessoas.$$),
        (5, $$このホテルは一流ホテル____のサービスだ。$$, $$Este hotel tem um atendimento comparável ao de hotéis de primeira linha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$並み$$),
        (2, $$並み$$),
        (3, $$並み$$),
        (4, $$並み$$),
        (5, $$並み$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-95 — なんという / なんと / なんて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-95',
    'grammar',
    'N1',
    $$なんという / なんと / なんて$$,
    $$nanto iu / nanto / nante$$,
    $$Que / Como / Mas que$$,
    $$なんという, なんと e なんて são usadas para expressar emoção forte, como surpresa, admiração ou indignação. Equivalem a "que...!" ou "como...!".

なんという vem antes de substantivos, como "que dia lindo!". なんと vem antes de adjetivos ou frases, como "como é bonito!". なんて é a forma mais coloquial.

Muitas vezes a frase termina com だろう ou のだろう.$$,
    $$なんと também pode ser usada para mostrar surpresa com um número ou fato, como "nada menos que...".

なんて no fim de uma expressão tem outro uso, de desprezo ou surpresa, como 勉強なんて.$$,
    $$なんという + Substantivo + だろう
なんと + Adjetivo + Substantivo + だろう
なんて + Adjetivo + んだろう$$,
    $$なんという$$,
    $$なんという|なんと|なんて|何という|何と$$,
    ARRAY['なん', 'という']::text[],
    ARRAY['なんという', 'なんと', 'なんて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-95', $$なんという美しい景色だろう。$$, $$なんといううつくしいけしきだろう。$$, $$Que paisagem linda!$$),
    ('n1-grammar-95', $$なんとかわいい子供だろう。$$, $$なんとかわいいこどもだろう。$$, $$Que criança fofa!$$),
    ('n1-grammar-95', $$なんて素敵なプレゼントなんだろう。$$, $$なんてすてきなプレゼントなんだろう。$$, $$Que presente maravilhoso!$$),
    ('n1-grammar-95', $$なんということをしてくれたんだ。$$, $$なんということをしてくれたんだ。$$, $$Mas que coisa você fez!$$),
    ('n1-grammar-95', $$彼はなんと百歳まで生きた。$$, $$かれはなんとひゃくさいまでいきた。$$, $$Ele viveu até nada menos que cem anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____ひどい話だろう。$$, $$Que história horrível!$$),
        (2, $$____きれいな花なんだろう。$$, $$Que flor bonita!$$),
        (3, $$____ことだ、財布をなくした。$$, $$Mas que coisa, perdi a carteira.$$),
        (4, $$彼女は____十か国語も話せる。$$, $$Ela fala nada menos que dez línguas.$$),
        (5, $$____優しい人なんだろう。$$, $$Que pessoa gentil!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なんという$$),
        (1, $$なんと$$),
        (1, $$なんて$$),
        (2, $$なんと$$),
        (2, $$なんて$$),
        (3, $$なんという$$),
        (4, $$なんと$$),
        (5, $$なんと$$),
        (5, $$なんて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-96 — 何しろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-96',
    'grammar',
    'N1',
    $$何しろ$$,
    $$nanishiro$$,
    $$Afinal / De qualquer forma / O fato é que$$,
    $$何しろ serve para destacar o motivo principal de algo, de forma enfática. Equivale a "afinal" ou "o fato é que".

A pessoa explica uma situação apresentando o fator mais importante. Por exemplo, "estou exausto, afinal trabalhei doze horas".

Também pode significar "de qualquer forma", como em "de qualquer forma, vamos tentar".$$,
    $$É parecido com なにせ e とにかく.

Muitas vezes vem junto com から ou ので no fim da frase.$$,
    $$何しろ + Frase (motivo principal)
何しろ + Frase + から / ので$$,
    $$何しろ$$,
    $$何しろ|なにしろ$$,
    ARRAY['何', 'しろ']::text[],
    ARRAY['何しろ', 'なにしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-96', $$疲れた。何しろ十二時間も働いたからね。$$, $$つかれた。なにしろじゅうにじかんもはたらいたからね。$$, $$Estou cansado. Afinal, trabalhei doze horas.$$),
    ('n1-grammar-96', $$何しろ急いでいたので、財布を忘れてしまった。$$, $$なにしろいそいでいたので、さいふをわすれてしまった。$$, $$O fato é que eu estava com pressa, então esqueci a carteira.$$),
    ('n1-grammar-96', $$何しろやってみよう。$$, $$なにしろやってみよう。$$, $$De qualquer forma, vamos tentar.$$),
    ('n1-grammar-96', $$あの店はいつも混んでいる。何しろ安くておいしいから。$$, $$あのみせはいつもこんでいる。なにしろやすくておいしいから。$$, $$Aquela loja vive cheia. Afinal, é barata e gostosa.$$),
    ('n1-grammar-96', $$何しろ初めてのことなので、わからないことばかりだ。$$, $$なにしろはじめてのことなので、わからないことばかりだ。$$, $$O fato é que é a primeira vez, então não entendo quase nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____暑くて、何もする気にならない。$$, $$O fato é que está tão quente que não tenho vontade de fazer nada.$$),
        (2, $$彼は人気者だ。____話が面白いからね。$$, $$Ele é popular. Afinal, conversa de um jeito divertido.$$),
        (3, $$____時間がないので、急いでください。$$, $$O fato é que não há tempo, então se apresse.$$),
        (4, $$____一度会ってみてください。$$, $$De qualquer forma, encontre-o uma vez.$$),
        (5, $$この仕事は大変だ。____一人でやらなければならない。$$, $$Este trabalho é pesado. Afinal, tenho que fazer sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何しろ$$),
        (1, $$なにしろ$$),
        (2, $$何しろ$$),
        (2, $$なにしろ$$),
        (3, $$何しろ$$),
        (3, $$なにしろ$$),
        (4, $$何しろ$$),
        (4, $$なにしろ$$),
        (5, $$何しろ$$),
        (5, $$なにしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-97 — 〜ならでは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-97',
    'grammar',
    'N1',
    $$〜ならでは$$,
    $$nara dewa$$,
    $$Típico de / Só mesmo / Exclusivo de$$,
    $$ならでは indica que algo só é possível ou só existe por causa de uma pessoa, lugar ou situação específica. Equivale a "típico de" ou "só mesmo".

É usado para elogiar algo único e especial. Por exemplo, "um sabor que só mesmo esta loja tem" ou "uma experiência típica do Japão".

A forma mais comum é ならではの, antes de substantivos.$$,
    $$É usado principalmente com elogios.

Também aparece como ならではの味, ならではの経験 e ならではの魅力.$$,
    $$Substantivo + ならではの + Substantivo
Substantivo + ならでは + だ$$,
    $$ならでは$$,
    $$ならでは$$,
    ARRAY['なら', 'では']::text[],
    ARRAY['ならでは', 'ならではの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-97', $$これは京都ならではの景色だ。$$, $$これはきょうとならではのけしきだ。$$, $$Esta é uma paisagem típica de Kyoto.$$),
    ('n1-grammar-97', $$この店ならではの味を楽しんでください。$$, $$このみせならではのあじをたのしんでください。$$, $$Aproveite o sabor que só mesmo esta loja tem.$$),
    ('n1-grammar-97', $$子供ならではの自由な発想だ。$$, $$こどもならではのじゆうなはっそうだ。$$, $$É uma imaginação livre típica de criança.$$),
    ('n1-grammar-97', $$手作りならではの温かさがある。$$, $$てづくりならではのあたたかさがある。$$, $$Tem o calor que só o feito à mão tem.$$),
    ('n1-grammar-97', $$これは日本ならではの文化だ。$$, $$これはにほんならではのぶんかだ。$$, $$Esta é uma cultura exclusiva do Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地元の人____の情報を教えてもらった。$$, $$Recebi informações que só mesmo os moradores conhecem.$$),
        (2, $$この料理は、プロ____の技術が光る。$$, $$Este prato mostra uma técnica que só mesmo um profissional tem.$$),
        (3, $$北海道____の新鮮な海の幸を味わった。$$, $$Provei frutos do mar frescos típicos de Hokkaido.$$),
        (4, $$旅行____の楽しみがある。$$, $$Há prazeres que só as viagens trazem.$$),
        (5, $$あの先生____の分かりやすい説明だった。$$, $$Foi uma explicação clara que só mesmo aquele professor sabe dar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ならでは$$),
        (2, $$ならでは$$),
        (3, $$ならでは$$),
        (4, $$ならでは$$),
        (5, $$ならでは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-98 — 〜ならいざしらず / 〜はいざしらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-98',
    'grammar',
    'N1',
    $$〜ならいざしらず / 〜はいざしらず$$,
    $$nara iza shirazu / wa iza shirazu$$,
    $$Se fosse... até entenderia / Não sei quanto a / Seria outra história se$$,
    $$ならいざしらず indica que um caso seria compreensível, mas o caso atual não é. Equivale a "se fosse..., até entenderia, mas" ou "seria outra história se...".

A primeira parte mostra uma situação em que algo seria aceitável, e a segunda mostra que, na realidade, aquilo não é aceitável. Por exemplo, "se fosse uma criança, até entenderia, mas um adulto fazer isso...".

É uma expressão formal, com tom de crítica.$$,
    $$É parecido com ならともかく e ならまだしも.

いざしらず significa literalmente "não sei", por isso o sentido é "não sei quanto a isso, mas...".$$,
    $$Substantivo + ならいざしらず
Substantivo + はいざしらず
Verbo (forma simples) + なら + いざしらず$$,
    $$ならいざしらず$$,
    $$ならいざしらず|はいざしらず|ならいざ知らず|はいざ知らず$$,
    ARRAY['なら', 'いざ', 'しらず']::text[],
    ARRAY['ならいざしらず', 'はいざしらず', 'ならいざ知らず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-98', $$子供ならいざしらず、大人がそんなことをするなんて。$$, $$こどもならいざしらず、おとながそんなことをするなんて。$$, $$Se fosse uma criança, até entenderia, mas um adulto fazer uma coisa dessas...$$),
    ('n1-grammar-98', $$昔はいざしらず、今は誰でも海外旅行ができる。$$, $$むかしはいざしらず、いまはだれでもかいがいりょこうができる。$$, $$Não sei quanto a antigamente, mas hoje qualquer um pode viajar para o exterior.$$),
    ('n1-grammar-98', $$初心者ならいざしらず、プロがこんなミスをするとは。$$, $$しょしんしゃならいざしらず、プロがこんなミスをするとは。$$, $$Se fosse um iniciante, até entenderia, mas um profissional cometer um erro desses...$$),
    ('n1-grammar-98', $$一回ならいざしらず、何度も同じ失敗をするのは問題だ。$$, $$いっかいならいざしらず、なんどもおなじしっぱいをするのはもんだいだ。$$, $$Uma vez ainda passava, mas repetir o mesmo erro várias vezes é um problema.$$),
    ('n1-grammar-98', $$他の人はいざしらず、私は反対だ。$$, $$ほかのひとはいざしらず、わたしははんたいだ。$$, $$Não sei quanto aos outros, mas eu sou contra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$知らなかった____、知っていて黙っていたのは許せない。$$, $$Se não soubesse, até entenderia, mas saber e ficar calado é imperdoável.$$),
        (2, $$学生____、社会人なら時間を守るべきだ。$$, $$Se fosse estudante, até entenderia, mas um profissional deve ser pontual.$$),
        (3, $$平日____、日曜日に会社に行くなんて。$$, $$Se fosse dia útil, tudo bem, mas ir à empresa num domingo...$$),
        (4, $$他の国____、日本では考えられないことだ。$$, $$Não sei quanto a outros países, mas no Japão isso é impensável.$$),
        (5, $$簡単な問題____、こんな難しい問題は解けない。$$, $$Se fosse um problema fácil, seria outra história, mas um problema tão difícil não dá para resolver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ならいざしらず$$),
        (1, $$ならいざ知らず$$),
        (2, $$ならいざしらず$$),
        (2, $$ならいざ知らず$$),
        (3, $$ならいざしらず$$),
        (3, $$ならいざ知らず$$),
        (4, $$はいざしらず$$),
        (4, $$はいざ知らず$$),
        (5, $$ならいざしらず$$),
        (5, $$ならいざ知らず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-99 — 〜なり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-99',
    'grammar',
    'N1',
    $$〜なり$$,
    $$nari$$,
    $$Mal / Assim que / Logo que$$,
    $$なり indica que, assim que uma ação aconteceu, outra ação veio logo em seguida, muitas vezes de forma inesperada. Equivale a "mal..." ou "assim que...".

O sujeito das duas ações costuma ser o mesmo, e não é a própria pessoa que fala. Por exemplo, "mal chegou em casa, ele foi para o quarto".

É uma expressão um pouco literária.$$,
    $$É parecido com や否や e とたんに.

Não se usa com a primeira pessoa nem com pedidos ou intenções.

Não se confunde com なり de opções, como 〜なり〜なり.$$,
    $$Verbo (forma dicionário) + なり + Ação seguinte (passado)$$,
    $$なり$$,
    $$なり$$,
    ARRAY['なり']::text[],
    ARRAY['なり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-99', $$彼は家に帰るなり、自分の部屋に閉じこもった。$$, $$かれはいえにかえるなり、じぶんのへやにとじこもった。$$, $$Mal chegou em casa, ele se trancou no quarto.$$),
    ('n1-grammar-99', $$彼女は私の顔を見るなり、泣き出した。$$, $$かのじょはわたしのかおをみるなり、なきだした。$$, $$Assim que viu meu rosto, ela começou a chorar.$$),
    ('n1-grammar-99', $$子供はベッドに入るなり、眠ってしまった。$$, $$こどもはベッドにはいるなり、ねむってしまった。$$, $$Mal se deitou, a criança adormeceu.$$),
    ('n1-grammar-99', $$父は新聞を読むなり、怒り出した。$$, $$ちちはしんぶんをよむなり、おこりだした。$$, $$Assim que leu o jornal, meu pai ficou bravo.$$),
    ('n1-grammar-99', $$彼は電話を切るなり、部屋を飛び出した。$$, $$かれはでんわをきるなり、へやをとびだした。$$, $$Mal desligou o telefone, ele saiu correndo do quarto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は手紙を読む____、顔色を変えた。$$, $$Assim que leu a carta, ela mudou de expressão.$$),
        (2, $$彼は席に着く____、お酒を注文した。$$, $$Mal se sentou, ele pediu uma bebida.$$),
        (3, $$犬は主人の姿を見る____、走ってきた。$$, $$Assim que viu o dono, o cachorro veio correndo.$$),
        (4, $$兄は会社から帰る____、ソファーで寝てしまった。$$, $$Mal voltou do trabalho, meu irmão dormiu no sofá.$$),
        (5, $$彼女は部屋に入る____、窓を開けた。$$, $$Assim que entrou no quarto, ela abriu a janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なり$$),
        (2, $$なり$$),
        (3, $$なり$$),
        (4, $$なり$$),
        (5, $$なり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-100 — 〜なりに / 〜なりの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-100',
    'grammar',
    'N1',
    $$〜なりに / 〜なりの$$,
    $$nari ni / nari no$$,
    $$Do seu jeito / À sua maneira / Dentro das suas possibilidades$$,
    $$なりに e なりの indicam que algo é feito de acordo com as próprias capacidades ou condições, mesmo que sejam limitadas. Equivalem a "do seu jeito" ou "à sua maneira".

A pessoa reconhece que há limites, mas valoriza o esforço feito dentro deles. Por exemplo, "as crianças pensam do jeito delas" ou "fiz o melhor que pude, à minha maneira".

なりの vem antes de substantivos, e なりに funciona como advérbio.$$,
    $$Expressões comuns são 自分なりに, 子供なりに, 私なりの考え e それなりに.

それなりに significa "de certa forma" ou "razoavelmente".$$,
    $$Substantivo + なりに + Verbo
Substantivo + なりの + Substantivo
Verbo / Adjetivo (forma simples) + なりに$$,
    $$なりに$$,
    $$なりに|なりの$$,
    ARRAY['なり', 'に']::text[],
    ARRAY['なりに', 'なりの', 'それなりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-100', $$子供は子供なりに、いろいろ考えている。$$, $$こどもはこどもなりに、いろいろかんがえている。$$, $$As crianças pensam em muitas coisas, do jeito delas.$$),
    ('n1-grammar-100', $$自分なりに一生懸命頑張った。$$, $$じぶんなりにいっしょうけんめいがんばった。$$, $$Me esforcei ao máximo, à minha maneira.$$),
    ('n1-grammar-100', $$これは私なりの考えです。$$, $$これはわたしなりのかんがえです。$$, $$Esta é a minha opinião, do meu jeito.$$),
    ('n1-grammar-100', $$お金がないなりに、楽しく暮らしている。$$, $$おかねがないなりに、たのしくくらしている。$$, $$Mesmo sem dinheiro, vivo feliz dentro das minhas possibilidades.$$),
    ('n1-grammar-100', $$この店はそれなりにおいしい。$$, $$このみせはそれなりにおいしい。$$, $$Esta loja é razoavelmente gostosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は彼____努力している。$$, $$Ele se esforça à maneira dele.$$),
        (2, $$初心者には初心者____楽しみ方がある。$$, $$Os iniciantes têm o seu próprio jeito de se divertir.$$),
        (3, $$自分____調べてみたが、よくわからなかった。$$, $$Pesquisei do meu jeito, mas não entendi bem.$$),
        (4, $$狭い部屋だが、それ____快適だ。$$, $$É um quarto pequeno, mas razoavelmente confortável.$$),
        (5, $$彼女には彼女____理由があるのだろう。$$, $$Ela deve ter os seus próprios motivos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なりに$$),
        (2, $$なりの$$),
        (3, $$なりに$$),
        (4, $$なりに$$),
        (5, $$なりの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-101 — 〜なりとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-101',
    'grammar',
    'N1',
    $$〜なりとも$$,
    $$nari tomo$$,
    $$Pelo menos / Nem que seja / Ainda que só$$,
    $$なりとも indica uma quantidade mínima que a pessoa deseja ou pede. Equivale a "pelo menos" ou "nem que seja".

Costuma vir depois de palavras de quantidade pequena, como um pouco, um momento, uma pessoa ou uma vez. Por exemplo, "se puder, ajude pelo menos um pouco".

É uma expressão formal e um pouco antiquada, usada em pedidos educados.$$,
    $$Expressões comuns são 少しなりとも, 一目なりとも, 多少なりとも e 何なりとも.

何なりとも significa "qualquer coisa", como em 何なりとお申し付けください.$$,
    $$Substantivo (quantidade mínima) + なりとも
Palavra interrogativa + なりとも (qualquer)$$,
    $$なりとも$$,
    $$なりとも|なりと$$,
    ARRAY['なり', 'とも']::text[],
    ARRAY['なりとも', 'なりと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-101', $$少しなりとも、お役に立てればうれしいです。$$, $$すこしなりとも、おやくにたてればうれしいです。$$, $$Fico feliz se puder ser útil, nem que seja um pouco.$$),
    ('n1-grammar-101', $$一目なりとも、母に会いたい。$$, $$ひとめなりとも、ははにあいたい。$$, $$Quero ver minha mãe, nem que seja por um instante.$$),
    ('n1-grammar-101', $$多少なりとも、経験がある人を募集しています。$$, $$たしょうなりとも、けいけんがあるひとをぼしゅうしています。$$, $$Procuramos pessoas com pelo menos um pouco de experiência.$$),
    ('n1-grammar-101', $$何なりとお申し付けください。$$, $$なんなりとおもうしつけください。$$, $$Peça qualquer coisa, por favor.$$),
    ('n1-grammar-101', $$一日なりとも休むわけにはいかない。$$, $$いちにちなりともやすむわけにはいかない。$$, $$Não posso descansar nem que seja um dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$わずか____、寄付をさせてください。$$, $$Deixe-me fazer uma doação, ainda que só um pouco.$$),
        (2, $$一時間____、話を聞いてもらえませんか。$$, $$Poderia me ouvir, nem que seja por uma hora?$$),
        (3, $$少し____、家計の助けになればいい。$$, $$Seria bom se ajudasse nas despesas da casa, pelo menos um pouco.$$),
        (4, $$ご質問があれば、何____どうぞ。$$, $$Se tiver perguntas, fique à vontade para perguntar qualquer coisa.$$),
        (5, $$一言____、お礼を言いたかった。$$, $$Queria agradecer, nem que fosse com uma palavra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なりとも$$),
        (2, $$なりとも$$),
        (3, $$なりとも$$),
        (4, $$なりと$$),
        (4, $$なりとも$$),
        (5, $$なりとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-102 — 〜なり〜なり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-102',
    'grammar',
    'N1',
    $$〜なり〜なり$$,
    $$nari ~ nari$$,
    $$Ou... ou / Seja... seja / Tanto faz se$$,
    $$なり〜なり serve para apresentar exemplos de opções possíveis, deixando a escolha livre. Equivale a "ou... ou" ou "seja... seja".

Muitas vezes a pessoa sugere ou pede que o outro faça uma das opções, ou algo parecido. Por exemplo, "pergunte ao professor ou procure no dicionário".

A segunda parte costuma ser um conselho, um pedido ou uma ordem.$$,
    $$Não se usa para falar de fatos passados.

É parecido com か〜か e とか〜とか, mas なり〜なり é usado para dar sugestões.

Não se usa com superiores, porque soa como uma ordem.$$,
    $$Substantivo + なり + Substantivo + なり
Verbo (forma dicionário) + なり + Verbo (forma dicionário) + なり$$,
    $$なり〜なり$$,
    $$なり$$,
    ARRAY['なり']::text[],
    ARRAY['なり〜なり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-102', $$わからないことは、先生に聞くなり辞書で調べるなりしなさい。$$, $$わからないことは、せんせいにきくなりじしょでしらべるなりしなさい。$$, $$O que não souber, pergunte ao professor ou procure no dicionário.$$),
    ('n1-grammar-102', $$電話なりメールなりで連絡してください。$$, $$でんわなりメールなりでれんらくしてください。$$, $$Entre em contato por telefone ou por e-mail.$$),
    ('n1-grammar-102', $$休みの日は、本を読むなり映画を見るなり、好きに過ごしたい。$$, $$やすみのひは、ほんをよむなりえいがをみるなり、すきにすごしたい。$$, $$Nos dias de folga, quero passar o tempo do meu jeito, lendo ou vendo filmes.$$),
    ('n1-grammar-102', $$困ったら、親なり友達なりに相談したほうがいい。$$, $$こまったら、おやなりともだちなりにそうだんしたほうがいい。$$, $$Se estiver em apuros, é melhor conversar com seus pais ou amigos.$$),
    ('n1-grammar-102', $$煮るなり焼くなり、好きにしてくれ。$$, $$にるなりやくなり、すきにしてくれ。$$, $$Cozinhe ou asse, faça o que quiser.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑いなら、窓を開ける____エアコンをつけるなりしてください。$$, $$Se está quente, abra a janela ou ligue o ar-condicionado.$$),
        (2, $$コーヒーなり紅茶____、好きなものを飲んでください。$$, $$Café ou chá, beba o que preferir.$$),
        (3, $$行けないなら、手紙を書くなり電話する____すればいい。$$, $$Se não puder ir, basta escrever uma carta ou ligar.$$),
        (4, $$パン____おにぎりなり、何か食べておきなさい。$$, $$Pão ou bolinho de arroz, coma alguma coisa.$$),
        (5, $$自分で調べるなり、人に聞く____しなさい。$$, $$Pesquise por conta própria ou pergunte a alguém.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なり$$),
        (2, $$なり$$),
        (3, $$なり$$),
        (4, $$なり$$),
        (5, $$なり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-103 — 〜なしに / 〜なしで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-103',
    'grammar',
    'N1',
    $$〜なしに / 〜なしで$$,
    $$nashi ni / nashi de$$,
    $$Sem / Sem que haja / Na falta de$$,
    $$なしに e なしで indicam que algo é feito sem uma coisa que normalmente estaria presente. Equivalem a "sem".

なしに é mais formal e muitas vezes indica que algo necessário não foi feito, como "entrar sem permissão". なしで é mais comum na fala, como "viver sem celular".

A forma なしには, com uma frase negativa depois, significa "sem isso, não é possível".$$,
    $$Expressões comuns são 許可なしに, 断りなしに, 予約なしで e 休みなしで.

É parecido com を抜きにして e がなくて.$$,
    $$Substantivo + なしに + Verbo
Substantivo + なしで + Verbo
Substantivo + なしには + Frase negativa$$,
    $$なしに$$,
    $$なしに|なしで|なしには$$,
    ARRAY['なし', 'に']::text[],
    ARRAY['なしに', 'なしで', 'なしには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-103', $$許可なしに、この部屋に入ってはいけない。$$, $$きょかなしに、このへやにはいってはいけない。$$, $$Não se pode entrar nesta sala sem permissão.$$),
    ('n1-grammar-103', $$彼は何の連絡もなしに会社を休んだ。$$, $$かれはなんのれんらくもなしにかいしゃをやすんだ。$$, $$Ele faltou ao trabalho sem avisar nada.$$),
    ('n1-grammar-103', $$予約なしで入れるレストランを探している。$$, $$よやくなしではいれるレストランをさがしている。$$, $$Estou procurando um restaurante em que dê para entrar sem reserva.$$),
    ('n1-grammar-103', $$スマホなしでは生活できない。$$, $$スマホなしではせいかつできない。$$, $$Não consigo viver sem celular.$$),
    ('n1-grammar-103', $$努力なしには、成功はありえない。$$, $$どりょくなしには、せいこうはありえない。$$, $$Sem esforço, o sucesso é impossível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$断り____、人の物を使わないでください。$$, $$Não use as coisas dos outros sem pedir.$$),
        (2, $$彼は休み____、十時間働き続けた。$$, $$Ele trabalhou dez horas seguidas sem descanso.$$),
        (3, $$辞書____、この本を読むのは難しい。$$, $$Ler este livro sem dicionário é difícil.$$),
        (4, $$家族の支え____は、ここまで来られなかった。$$, $$Sem o apoio da família, eu não teria chegado até aqui.$$),
        (5, $$砂糖____コーヒーを飲む。$$, $$Bebo café sem açúcar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なしに$$),
        (1, $$なしで$$),
        (2, $$なしで$$),
        (2, $$なしに$$),
        (3, $$なしで$$),
        (3, $$なしに$$),
        (4, $$なしに$$),
        (5, $$なしで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-104 — 〜に〜
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-104',
    'grammar',
    'N1',
    $$〜に〜$$,
    $$ni$$,
    $$Muito e muito / Demais / Sem parar$$,
    $$Quando o mesmo verbo se repete com に no meio, a expressão indica que a ação foi feita com muita intensidade ou por muito tempo. Equivale a "muito e muito" ou "sem parar".

Por exemplo, 待ちに待った significa "esperado por muito, muito tempo", e 泣きに泣いた significa "chorou e chorou".

É uma expressão enfática, comum na escrita e em narrações.$$,
    $$Combinações comuns são 待ちに待った, 泣きに泣いた, 考えに考えた, 走りに走った e 迷いに迷った.

Só funciona com alguns verbos fixos.$$,
    $$Verbo (forma ます sem ます) + に + Mesmo verbo (forma た)$$,
    $$〜に〜$$,
    $$待ちに待|泣きに泣|考えに考|走りに走|迷いに迷|売れに売|揺れに揺|悩みに悩$$,
    ARRAY['に']::text[],
    ARRAY['待ちに待った', '泣きに泣いた', '考えに考えた', '迷いに迷った']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-104', $$待ちに待った夏休みがやってきた。$$, $$まちにまったなつやすみがやってきた。$$, $$Chegaram as tão esperadas férias de verão.$$),
    ('n1-grammar-104', $$彼女は別れた後、泣きに泣いた。$$, $$かのじょはわかれたあと、なきにないた。$$, $$Depois do término, ela chorou e chorou.$$),
    ('n1-grammar-104', $$考えに考えた末、留学することにした。$$, $$かんがえにかんがえたすえ、りゅうがくすることにした。$$, $$Depois de pensar muito e muito, decidi fazer intercâmbio.$$),
    ('n1-grammar-104', $$迷いに迷って、結局赤い服を買った。$$, $$まよいにまよって、けっきょくあかいふくをかった。$$, $$Depois de muita dúvida, acabei comprando a roupa vermelha.$$),
    ('n1-grammar-104', $$駅まで走りに走ったが、電車に乗り遅れた。$$, $$えきまではしりにはしったが、でんしゃにのりおくれた。$$, $$Corri e corri até a estação, mas perdi o trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$待ち____待った結果発表の日が来た。$$, $$Chegou o tão esperado dia do anúncio dos resultados.$$),
        (2, $$悩み____悩んで、ようやく答えを出した。$$, $$Depois de me angustiar muito, finalmente cheguei a uma resposta.$$),
        (3, $$その新商品は売れ____売れた。$$, $$Esse novo produto vendeu e vendeu.$$),
        (4, $$船は嵐の中で揺れ____揺れた。$$, $$O navio balançou sem parar no meio da tempestade.$$),
        (5, $$考え____考えて、この作品を完成させた。$$, $$Depois de pensar muito e muito, concluí esta obra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に$$),
        (2, $$に$$),
        (3, $$に$$),
        (4, $$に$$),
        (5, $$に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-105 — 〜に値する
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-105',
    'grammar',
    'N1',
    $$〜に値する$$,
    $$ni atai suru$$,
    $$Digno de / Que merece / Que vale a pena$$,
    $$に値する indica que algo tem valor suficiente para merecer uma ação ou avaliação. Equivale a "digno de" ou "que merece".

Costuma vir com palavras como respeito, elogio, atenção, leitura ou confiança. Por exemplo, "um livro que vale a pena ler" ou "uma atitude digna de respeito".

A forma negativa, に値しない, significa "não merece".$$,
    $$Expressões comuns são 尊敬に値する, 称賛に値する, 注目に値する e 読むに値する.

É uma expressão formal, comum na escrita.$$,
    $$Substantivo + に値する
Verbo (forma dicionário) + に値する
Substantivo + に値しない$$,
    $$に値する$$,
    $$に値する|に値しない|にあたいする|に値します$$,
    ARRAY['に', '値する']::text[],
    ARRAY['に値する', 'に値しない', 'に値します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-105', $$彼の勇気は尊敬に値する。$$, $$かれのゆうきはそんけいにあたいする。$$, $$A coragem dele é digna de respeito.$$),
    ('n1-grammar-105', $$この本は一度読むに値する。$$, $$このほんはいちどよむにあたいする。$$, $$Este livro vale a pena ser lido pelo menos uma vez.$$),
    ('n1-grammar-105', $$彼女の努力は称賛に値する。$$, $$かのじょのどりょくはしょうさんにあたいする。$$, $$O esforço dela merece elogios.$$),
    ('n1-grammar-105', $$そんな話は信じるに値しない。$$, $$そんなはなしはしんじるにあたいしない。$$, $$Uma história dessas não merece crédito.$$),
    ('n1-grammar-105', $$この発見は注目に値する。$$, $$このはっけんはちゅうもくにあたいする。$$, $$Esta descoberta merece atenção.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の行動は表彰____。$$, $$A ação dele é digna de homenagem.$$),
        (2, $$この映画は見る____作品だ。$$, $$Este filme é uma obra que vale a pena assistir.$$),
        (3, $$あんな人の意見は聞く____。$$, $$A opinião de uma pessoa daquelas não merece ser ouvida.$$),
        (4, $$彼女の研究は高く評価する____。$$, $$A pesquisa dela merece ser muito bem avaliada.$$),
        (5, $$この結果は検討____。$$, $$Este resultado merece ser analisado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に値する$$),
        (1, $$に値します$$),
        (2, $$に値する$$),
        (3, $$に値しない$$),
        (4, $$に値する$$),
        (4, $$に値します$$),
        (5, $$に値する$$),
        (5, $$に値します$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-106 — 〜にあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-106',
    'grammar',
    'N1',
    $$〜にあって$$,
    $$ni atte$$,
    $$Em / Numa situação de / Sendo$$,
    $$にあって indica uma situação ou posição especial em que alguém se encontra. Equivale a "em" ou "numa situação de".

A pessoa destaca que, mesmo naquela condição, algo acontece, ou que, por causa dela, algo é natural. Por exemplo, "mesmo em meio à crise, ele manteve a calma" ou "sendo líder, ele tem grande responsabilidade".

É uma expressão formal e literária.$$,
    $$É parecido com で e において, mas にあって destaca que a situação é especial.

A forma にあっても significa "mesmo em".$$,
    $$Substantivo (situação / posição) + にあって
Substantivo + にあっても (mesmo em)$$,
    $$にあって$$,
    $$にあって|にあっては|にあっても$$,
    ARRAY['に', 'あって']::text[],
    ARRAY['にあって', 'にあっては', 'にあっても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-106', $$厳しい状況にあって、彼は冷静さを失わなかった。$$, $$きびしいじょうきょうにあって、かれはれいせいさをうしなわなかった。$$, $$Numa situação difícil, ele não perdeu a calma.$$),
    ('n1-grammar-106', $$社長という立場にあって、彼の責任は重い。$$, $$しゃちょうというたちばにあって、かれのせきにんはおもい。$$, $$Na posição de presidente, a responsabilidade dele é grande.$$),
    ('n1-grammar-106', $$この不景気にあっても、あの会社は成長を続けている。$$, $$このふけいきにあっても、あのかいしゃはせいちょうをつづけている。$$, $$Mesmo nesta recessão, aquela empresa continua crescendo.$$),
    ('n1-grammar-106', $$病床にあって、彼女は家族のことを心配していた。$$, $$びょうしょうにあって、かのじょはかぞくのことをしんぱいしていた。$$, $$Mesmo no leito de doente, ela se preocupava com a família.$$),
    ('n1-grammar-106', $$情報化社会にあっては、正しい情報を選ぶ力が必要だ。$$, $$じょうほうかしゃかいにあっては、ただしいじょうほうをえらぶちからがひつようだ。$$, $$Na sociedade da informação, é preciso saber escolher a informação certa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$困難な時代____、人々は助け合った。$$, $$Numa época difícil, as pessoas se ajudaram.$$),
        (2, $$リーダーの立場____、弱音を吐くわけにはいかない。$$, $$Na posição de líder, não posso me queixar.$$),
        (3, $$異国の地____、彼は一人で頑張った。$$, $$Numa terra estrangeira, ele se esforçou sozinho.$$),
        (4, $$戦争中____も、人々は希望を失わなかった。$$, $$Mesmo durante a guerra, as pessoas não perderam a esperança.$$),
        (5, $$高齢化社会____、介護の問題は深刻だ。$$, $$Numa sociedade que envelhece, o problema dos cuidados com idosos é sério.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にあって$$),
        (1, $$にあっても$$),
        (2, $$にあって$$),
        (2, $$にあっては$$),
        (3, $$にあって$$),
        (3, $$にあっても$$),
        (4, $$にあって$$),
        (5, $$にあって$$),
        (5, $$にあっては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-107 — 〜に引き換え
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-107',
    'grammar',
    'N1',
    $$〜に引き換え$$,
    $$ni hikikae$$,
    $$Em contraste com / Ao contrário de / Já$$,
    $$に引き換え compara duas coisas ou pessoas mostrando que são opostas. Equivale a "em contraste com" ou "ao contrário de".

Muitas vezes a pessoa elogia um lado e critica o outro. Por exemplo, "ao contrário do irmão mais velho, que é sério, o mais novo só brinca".

É uma expressão um pouco formal, com tom de avaliação pessoal.$$,
    $$Também é escrito にひきかえ.

É parecido com に比べて e とは対照的に, mas に引き換え costuma ter julgamento pessoal.$$,
    $$Substantivo + に引き換え
Frase + の + に引き換え
それに引き換え、 + Frase$$,
    $$に引き換え$$,
    $$に引き換え|にひきかえ|に引きかえ$$,
    ARRAY['に', '引き換え']::text[],
    ARRAY['に引き換え', 'にひきかえ', 'それに引き換え']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-107', $$真面目な兄に引き換え、弟は遊んでばかりいる。$$, $$まじめなあににひきかえ、おとうとはあそんでばかりいる。$$, $$Ao contrário do irmão mais velho, que é sério, o mais novo só brinca.$$),
    ('n1-grammar-107', $$去年に引き換え、今年は雨が多い。$$, $$きょねんにひきかえ、ことしはあめがおおい。$$, $$Em contraste com o ano passado, este ano chove muito.$$),
    ('n1-grammar-107', $$姉は料理が上手だ。それに引き換え、私は何も作れない。$$, $$あねはりょうりがじょうずだ。それにひきかえ、わたしはなにもつくれない。$$, $$Minha irmã cozinha bem. Já eu não sei fazer nada.$$),
    ('n1-grammar-107', $$前の店長に引き換え、今の店長はとても優しい。$$, $$まえのてんちょうにひきかえ、いまのてんちょうはとてもやさしい。$$, $$Ao contrário do gerente anterior, o atual é muito gentil.$$),
    ('n1-grammar-107', $$彼が努力しているのに引き換え、私は怠けてばかりだ。$$, $$かれがどりょくしているのにひきかえ、わたしはなまけてばかりだ。$$, $$Em contraste com ele, que se esforça, eu só fico enrolando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$都会の生活____、田舎の生活はのんびりしている。$$, $$Em contraste com a vida na cidade, a vida no interior é tranquila.$$),
        (2, $$母は明るい。それ____、父は無口だ。$$, $$Minha mãe é alegre. Já meu pai é calado.$$),
        (3, $$先月の売り上げ____、今月は好調だ。$$, $$Ao contrário do mês passado, as vendas deste mês vão bem.$$),
        (4, $$友達がみんな結婚したの____、私はまだ一人だ。$$, $$Ao contrário dos meus amigos, que já se casaram, eu continuo sozinho.$$),
        (5, $$昔の静かな町____、今はにぎやかだ。$$, $$Em contraste com a cidade tranquila de antigamente, hoje é movimentada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に引き換え$$),
        (1, $$にひきかえ$$),
        (2, $$に引き換え$$),
        (2, $$にひきかえ$$),
        (3, $$に引き換え$$),
        (3, $$にひきかえ$$),
        (4, $$に引き換え$$),
        (4, $$にひきかえ$$),
        (5, $$に引き換え$$),
        (5, $$にひきかえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-108 — 〜に至る / 〜に至った
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-108',
    'grammar',
    'N1',
    $$〜に至る / 〜に至った$$,
    $$ni itaru / ni itatta$$,
    $$Chegar a / Acabar em / Culminar em$$,
    $$に至る indica que algo chegou a um ponto final, a um resultado ou a uma situação extrema, depois de um processo. Equivale a "chegar a" ou "culminar em".

Por exemplo, "depois de muita discussão, chegaram a um acordo" ou "a doença piorou e ele chegou a ser internado".

É uma expressão formal, comum em notícias e textos.$$,
    $$Expressões comuns são 結論に至る, 合意に至る, 死に至る e 現在に至る.

A forma に至るまで significa "até mesmo" e tem outro uso.$$,
    $$Substantivo + に至る / に至った
Verbo (forma dicionário) + に至る / に至った$$,
    $$に至る$$,
    $$に至る|に至った|に至り|に至って|に至らず|にいたる|にいたった$$,
    ARRAY['に', '至る']::text[],
    ARRAY['に至る', 'に至った', 'に至り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-108', $$長い話し合いの末、ようやく合意に至った。$$, $$ながいはなしあいのすえ、ようやくごういにいたった。$$, $$Depois de uma longa discussão, finalmente chegaram a um acordo.$$),
    ('n1-grammar-108', $$その病気は、放っておくと死に至ることもある。$$, $$そのびょうきは、ほうっておくとしにいたることもある。$$, $$Essa doença, se não for tratada, pode levar à morte.$$),
    ('n1-grammar-108', $$彼が会社を辞めるに至った理由はわからない。$$, $$かれがかいしゃをやめるにいたったりゆうはわからない。$$, $$Não se sabe o motivo que o levou a sair da empresa.$$),
    ('n1-grammar-108', $$事件は大きな問題に至らずに済んだ。$$, $$じけんはおおきなもんだいにいたらずにすんだ。$$, $$O incidente não chegou a virar um grande problema.$$),
    ('n1-grammar-108', $$その町は、大きく発展して現在に至る。$$, $$そのまちは、おおきくはってんしてげんざいにいたる。$$, $$Aquela cidade se desenvolveu muito até chegar aos dias de hoje.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いろいろ検討した結果、この結論____。$$, $$Depois de analisar várias coisas, chegamos a esta conclusão.$$),
        (2, $$小さなけんかが、離婚____。$$, $$Uma pequena briga acabou em divórcio.$$),
        (3, $$この会社は百年の歴史を経て現在____。$$, $$Esta empresa passou por cem anos de história até chegar aos dias de hoje.$$),
        (4, $$けが人が出る____事故だった。$$, $$Foi um acidente que chegou a deixar feridos.$$),
        (5, $$両国の交渉は、合意____。$$, $$As negociações entre os dois países chegaram a um acordo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至った$$),
        (1, $$にいたった$$),
        (2, $$に至った$$),
        (2, $$にいたった$$),
        (3, $$に至る$$),
        (3, $$にいたる$$),
        (4, $$に至る$$),
        (4, $$に至った$$),
        (5, $$に至った$$),
        (5, $$にいたった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-109 — 〜に至るまで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-109',
    'grammar',
    'N1',
    $$〜に至るまで$$,
    $$ni itaru made$$,
    $$Até mesmo / Até / Desde... até$$,
    $$に至るまで indica que algo se estende até um limite extremo ou surpreendente. Equivale a "até mesmo" ou "até".

Muitas vezes aparece junto com から, mostrando um grande alcance, como "desde crianças até idosos". A pessoa destaca que nem o último item fica de fora.

É uma expressão formal, usada para mostrar que algo abrange tudo.$$,
    $$É parecido com まで, mas に至るまで é mais formal e enfático.

O último item costuma ser algo inesperado ou extremo.$$,
    $$Substantivo + から + Substantivo + に至るまで
Substantivo + に至るまで$$,
    $$に至るまで$$,
    $$に至るまで|にいたるまで$$,
    ARRAY['に', '至る', 'まで']::text[],
    ARRAY['に至るまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-109', $$このゲームは子供から大人に至るまで、人気がある。$$, $$このゲームはこどもからおとなにいたるまで、にんきがある。$$, $$Este jogo é popular desde as crianças até os adultos.$$),
    ('n1-grammar-109', $$彼は服装から言葉遣いに至るまで、母親に注意された。$$, $$かれはふくそうからことばづかいにいたるまで、ははおやにちゅういされた。$$, $$Ele foi repreendido pela mãe por tudo, das roupas até o jeito de falar.$$),
    ('n1-grammar-109', $$この店は、家具から食器に至るまで全部手作りだ。$$, $$このみせは、かぐからしょっきにいたるまでぜんぶてづくりだ。$$, $$Nesta loja, tudo é feito à mão, desde os móveis até a louça.$$),
    ('n1-grammar-109', $$北海道から沖縄に至るまで、全国で雨が降った。$$, $$ほっかいどうからおきなわにいたるまで、ぜんこくであめがふった。$$, $$Choveu em todo o país, de Hokkaido até Okinawa.$$),
    ('n1-grammar-109', $$彼女は細かい点に至るまで、よく調べている。$$, $$かのじょはこまかいてんにいたるまで、よくしらべている。$$, $$Ela pesquisa tudo muito bem, até os mínimos detalhes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理から掃除____、家事は全部夫がしている。$$, $$Da comida até a limpeza, meu marido faz todas as tarefas de casa.$$),
        (2, $$社長から新入社員____、全員が会議に参加した。$$, $$Do presidente até os novatos, todos participaram da reunião.$$),
        (3, $$この本には、歴史から文化____、詳しく書かれている。$$, $$Este livro explica em detalhes desde a história até a cultura.$$),
        (4, $$机の引き出しの中____、全部調べられた。$$, $$Revistaram tudo, até mesmo dentro das gavetas.$$),
        (5, $$小学生から高齢者____、多くの人が参加した。$$, $$Muitas pessoas participaram, desde crianças do primário até idosos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至るまで$$),
        (1, $$にいたるまで$$),
        (2, $$に至るまで$$),
        (2, $$にいたるまで$$),
        (3, $$に至るまで$$),
        (3, $$にいたるまで$$),
        (4, $$に至るまで$$),
        (4, $$にいたるまで$$),
        (5, $$に至るまで$$),
        (5, $$にいたるまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-110 — 〜に至っても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-110',
    'grammar',
    'N1',
    $$〜に至っても$$,
    $$ni itatte mo$$,
    $$Mesmo chegando a / Mesmo depois de / Mesmo a esta altura$$,
    $$に至っても indica que, mesmo depois de uma situação chegar a um ponto grave, alguém continua sem agir ou sem mudar. Equivale a "mesmo chegando a" ou "mesmo a esta altura".

O tom é de crítica ou espanto. Por exemplo, "mesmo depois de chegar a este ponto, ele não admite o erro".

É uma expressão formal.$$,
    $$Expressões comuns são この期に至っても e ここに至っても.

É parecido com になっても, mas に至っても destaca que a situação é extrema.$$,
    $$Substantivo + に至っても
Verbo (forma dicionário) + に至っても
この期に至っても$$,
    $$に至っても$$,
    $$に至っても|にいたっても$$,
    ARRAY['に', '至って', 'も']::text[],
    ARRAY['に至っても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-110', $$この期に至っても、彼は自分の非を認めない。$$, $$このごにいたっても、かれはじぶんのひをみとめない。$$, $$Mesmo a esta altura, ele não admite o próprio erro.$$),
    ('n1-grammar-110', $$事故が起きるに至っても、会社は対策をとらなかった。$$, $$じこがおきるにいたっても、かいしゃはたいさくをとらなかった。$$, $$Mesmo depois de ocorrer um acidente, a empresa não tomou medidas.$$),
    ('n1-grammar-110', $$死者が出るに至っても、政府は動かなかった。$$, $$ししゃがでるにいたっても、せいふはうごかなかった。$$, $$Mesmo chegando a haver mortos, o governo não agiu.$$),
    ('n1-grammar-110', $$ここに至っても、まだ反対する人がいる。$$, $$ここにいたっても、まだはんたいするひとがいる。$$, $$Mesmo chegando a este ponto, ainda há quem seja contra.$$),
    ('n1-grammar-110', $$倒産するに至っても、社長は責任をとらなかった。$$, $$とうさんするにいたっても、しゃちょうはせきにんをとらなかった。$$, $$Mesmo depois da falência, o presidente não assumiu a responsabilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この期____、言い訳ばかりしている。$$, $$Mesmo a esta altura, ele só dá desculpas.$$),
        (2, $$病気が悪化する____、彼は病院に行かなかった。$$, $$Mesmo com a doença piorando, ele não foi ao hospital.$$),
        (3, $$被害が広がる____、対策は遅れたままだ。$$, $$Mesmo com os danos se espalhando, as medidas continuam atrasadas.$$),
        (4, $$ここ____、彼はまだ夢をあきらめていない。$$, $$Mesmo chegando a este ponto, ele ainda não desistiu do sonho.$$),
        (5, $$試合に負ける____、監督は作戦を変えなかった。$$, $$Mesmo depois de perder a partida, o técnico não mudou a estratégia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至っても$$),
        (1, $$にいたっても$$),
        (2, $$に至っても$$),
        (2, $$にいたっても$$),
        (3, $$に至っても$$),
        (3, $$にいたっても$$),
        (4, $$に至っても$$),
        (4, $$にいたっても$$),
        (5, $$に至っても$$),
        (5, $$にいたっても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-111 — 〜に至っては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-111',
    'grammar',
    'N1',
    $$〜に至っては$$,
    $$ni itatte wa$$,
    $$Quanto a / No caso de / Então já$$,
    $$に至っては apresenta um exemplo extremo dentro de um grupo, geralmente negativo. Equivale a "quanto a..." ou "no caso de..., então já".

A pessoa fala de vários casos e destaca o pior ou o mais surpreendente. Por exemplo, "todos se atrasaram, e no caso dele, nem apareceu".

É uma expressão formal, com tom de crítica ou espanto.$$,
    $$Costuma aparecer depois de uma frase que fala de um grupo em geral.

É parecido com なんて e に関しては, mas に至っては destaca o caso mais extremo.$$,
    $$Substantivo + に至っては + Exemplo extremo$$,
    $$に至っては$$,
    $$に至っては|にいたっては$$,
    ARRAY['に', '至って', 'は']::text[],
    ARRAY['に至っては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-111', $$みんな遅刻したが、田中さんに至っては来なかった。$$, $$みんなちこくしたが、たなかさんにいたってはこなかった。$$, $$Todos se atrasaram, e o Tanaka então nem apareceu.$$),
    ('n1-grammar-111', $$家族はみんな料理が苦手で、父に至ってはお湯も沸かせない。$$, $$かぞくはみんなりょうりがにがてで、ちちにいたってはおゆもわかせない。$$, $$Ninguém na família sabe cozinhar, e meu pai então nem sabe ferver água.$$),
    ('n1-grammar-111', $$この町は不便だ。バスに至っては一日に二本しかない。$$, $$このまちはふべんだ。バスにいたってはいちにちににほんしかない。$$, $$Esta cidade é inconveniente. Quanto ao ônibus, só passam dois por dia.$$),
    ('n1-grammar-111', $$今年は雨が少なく、八月に至っては一度も降らなかった。$$, $$ことしはあめがすくなく、はちがつにいたってはいちどもふらなかった。$$, $$Este ano choveu pouco, e em agosto então não choveu nenhuma vez.$$),
    ('n1-grammar-111', $$社員の多くが反対し、部長に至っては辞表を出した。$$, $$しゃいんのおおくがはんたいし、ぶちょうにいたってはじひょうをだした。$$, $$Muitos funcionários foram contra, e o gerente chegou a pedir demissão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$クラスの成績は悪く、彼____零点だった。$$, $$As notas da turma foram ruins, e ele então tirou zero.$$),
        (2, $$最近の若者は本を読まない。新聞____全く読まない。$$, $$Os jovens de hoje não leem livros. Quanto aos jornais, não leem nada.$$),
        (3, $$この店は高い。コーヒー____一杯二千円だ。$$, $$Esta loja é cara. O café então custa dois mil ienes a xícara.$$),
        (4, $$兄弟はみんな背が高く、弟____二メートルもある。$$, $$Os irmãos são todos altos, e o caçula chega a ter dois metros.$$),
        (5, $$参加者は少なく、二日目____三人だけだった。$$, $$Havia poucos participantes, e no segundo dia então só três.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に至っては$$),
        (1, $$にいたっては$$),
        (2, $$に至っては$$),
        (2, $$にいたっては$$),
        (3, $$に至っては$$),
        (3, $$にいたっては$$),
        (4, $$に至っては$$),
        (4, $$にいたっては$$),
        (5, $$に至っては$$),
        (5, $$にいたっては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-112 — 〜に言わせれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-112',
    'grammar',
    'N1',
    $$〜に言わせれば$$,
    $$ni iwasereba$$,
    $$Na opinião de / Segundo / Se for perguntar a$$,
    $$に言わせれば apresenta a opinião pessoal de alguém, muitas vezes diferente da opinião geral. Equivale a "na opinião de" ou "se for perguntar a".

A pessoa destaca que aquela é a visão daquela pessoa específica. Por exemplo, "na opinião do meu pai, celular é desnecessário".

Também pode ser usado com a primeira pessoa, como "na minha opinião".$$,
    $$É parecido com によると e にとって, mas に言わせれば destaca uma opinião forte e pessoal.

Só se usa com pessoas.$$,
    $$Substantivo (pessoa) + に言わせれば / に言わせると$$,
    $$に言わせれば$$,
    $$に言わせれば|に言わせると|にいわせれば|にいわせると$$,
    ARRAY['に', '言わせれば']::text[],
    ARRAY['に言わせれば', 'に言わせると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-112', $$父に言わせれば、スマホなんて必要ないそうだ。$$, $$ちちにいわせれば、スマホなんてひつようないそうだ。$$, $$Na opinião do meu pai, celular é desnecessário.$$),
    ('n1-grammar-112', $$私に言わせれば、あの映画はつまらない。$$, $$わたしにいわせれば、あのえいがはつまらない。$$, $$Na minha opinião, aquele filme é chato.$$),
    ('n1-grammar-112', $$専門家に言わせると、この計画には問題が多い。$$, $$せんもんかにいわせると、このけいかくにはもんだいがおおい。$$, $$Segundo os especialistas, este plano tem muitos problemas.$$),
    ('n1-grammar-112', $$母に言わせれば、私はまだ子供だ。$$, $$ははにいわせれば、わたしはまだこどもだ。$$, $$Na opinião da minha mãe, ainda sou uma criança.$$),
    ('n1-grammar-112', $$彼に言わせると、成功の秘訣は運だそうだ。$$, $$かれにいわせると、せいこうのひけつはうんだそうだ。$$, $$Segundo ele, o segredo do sucesso é a sorte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母____、最近の若者は礼儀を知らない。$$, $$Na opinião da minha avó, os jovens de hoje não têm educação.$$),
        (2, $$先生____、この問題は簡単だそうだ。$$, $$Segundo o professor, este problema é fácil.$$),
        (3, $$私____、彼のやり方は間違っている。$$, $$Na minha opinião, o jeito dele está errado.$$),
        (4, $$妻____、私は家事を何もしないそうだ。$$, $$Na opinião da minha esposa, eu não faço nada em casa.$$),
        (5, $$医者____、この程度の熱は心配いらない。$$, $$Segundo o médico, uma febre dessas não é motivo de preocupação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に言わせれば$$),
        (1, $$に言わせると$$),
        (2, $$に言わせれば$$),
        (2, $$に言わせると$$),
        (3, $$に言わせれば$$),
        (3, $$に言わせると$$),
        (4, $$に言わせれば$$),
        (4, $$に言わせると$$),
        (5, $$に言わせれば$$),
        (5, $$に言わせると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-113 — 〜に限ったことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-113',
    'grammar',
    'N1',
    $$〜に限ったことではない$$,
    $$ni kagitta koto dewa nai$$,
    $$Não é só / Não se limita a / Não é exclusivo de$$,
    $$に限ったことではない indica que algo não acontece apenas em um caso específico, mas é comum em outros também. Equivale a "não é só" ou "não se limita a".

Muitas vezes é usado para falar de problemas ou hábitos negativos. Por exemplo, "ele se atrasar não é só hoje" ou "esse problema não é exclusivo do Japão".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$Costuma vir com a estrutura 〜のは〜に限ったことではない.

É parecido com だけではない.$$,
    $$Substantivo + に限ったことではない
Frase + のは + Substantivo + に限ったことではない$$,
    $$に限ったことではない$$,
    $$に限ったことではない|に限ったことではありません|に限ったことじゃない|にかぎったことではない$$,
    ARRAY['に', '限った', 'こと', 'では', 'ない']::text[],
    ARRAY['に限ったことではない', 'に限ったことではありません', 'に限ったことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-113', $$彼が遅刻するのは、今日に限ったことではない。$$, $$かれがちこくするのは、きょうにかぎったことではない。$$, $$Ele se atrasar não é só hoje.$$),
    ('n1-grammar-113', $$少子化は日本に限ったことではない。$$, $$しょうしかはにほんにかぎったことではない。$$, $$A baixa natalidade não é exclusiva do Japão.$$),
    ('n1-grammar-113', $$こういうミスは、新人に限ったことではありません。$$, $$こういうミスは、しんじんにかぎったことではありません。$$, $$Esse tipo de erro não se limita aos novatos.$$),
    ('n1-grammar-113', $$駅が混むのは、朝に限ったことじゃない。$$, $$えきがこむのは、あさにかぎったことじゃない。$$, $$A estação lotada não é só de manhã.$$),
    ('n1-grammar-113', $$この問題は、若者に限ったことではない。$$, $$このもんだいは、わかものにかぎったことではない。$$, $$Este problema não se limita aos jovens.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が文句を言うのは、今回____。$$, $$Ela reclamar não é só desta vez.$$),
        (2, $$物価が上がっているのは、この国____。$$, $$A alta dos preços não é exclusiva deste país.$$),
        (3, $$ストレスを感じるのは、大人____。$$, $$Sentir estresse não se limita aos adultos.$$),
        (4, $$交通渋滞は、都市部____。$$, $$O trânsito congestionado não é exclusivo das áreas urbanas.$$),
        (5, $$彼が嘘をつくのは、今日____。$$, $$Ele mentir não é só hoje.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限ったことではない$$),
        (1, $$に限ったことではありません$$),
        (1, $$に限ったことじゃない$$),
        (2, $$に限ったことではない$$),
        (2, $$に限ったことではありません$$),
        (2, $$に限ったことじゃない$$),
        (3, $$に限ったことではない$$),
        (3, $$に限ったことではありません$$),
        (3, $$に限ったことじゃない$$),
        (4, $$に限ったことではない$$),
        (4, $$に限ったことではありません$$),
        (4, $$に限ったことじゃない$$),
        (5, $$に限ったことではない$$),
        (5, $$に限ったことではありません$$),
        (5, $$に限ったことじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-114 — 〜にかかっては / 〜にかかったら / 〜にかかると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-114',
    'grammar',
    'N1',
    $$〜にかかっては / 〜にかかったら / 〜にかかると$$,
    $$ni kakatte wa / ni kakattara / ni kakaru to$$,
    $$Nas mãos de / Diante de / Quando se trata de$$,
    $$にかかっては, にかかったら e にかかると indicam que, diante de uma pessoa com uma habilidade ou característica muito forte, ninguém consegue resistir. Equivalem a "nas mãos de" ou "diante de".

A segunda parte mostra que algo fica fácil ou impossível de evitar por causa daquela pessoa. Por exemplo, "nas mãos dele, qualquer máquina volta a funcionar" ou "diante da minha mãe, ninguém consegue mentir".

O tom pode ser de admiração ou de leve ironia.$$,
    $$Muitas vezes a segunda parte mostra impotência, como かなわない ou 勝てない.

É usado principalmente com pessoas que têm uma habilidade marcante.$$,
    $$Substantivo (pessoa) + にかかっては + Frase
Substantivo (pessoa) + にかかったら + Frase
Substantivo (pessoa) + にかかると + Frase$$,
    $$にかかっては$$,
    $$にかかっては|にかかったら|にかかると|にかかれば$$,
    ARRAY['に', 'かかって', 'は']::text[],
    ARRAY['にかかっては', 'にかかったら', 'にかかると', 'にかかれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-114', $$彼にかかっては、どんな機械もすぐに直ってしまう。$$, $$かれにかかっては、どんなきかいもすぐになおってしまう。$$, $$Nas mãos dele, qualquer máquina volta a funcionar na hora.$$),
    ('n1-grammar-114', $$母にかかったら、どんな嘘もすぐにばれる。$$, $$ははにかかったら、どんなうそもすぐにばれる。$$, $$Diante da minha mãe, qualquer mentira é descoberta na hora.$$),
    ('n1-grammar-114', $$あの弁護士にかかると、どんな裁判も勝ってしまう。$$, $$あのべんごしにかかると、どんなさいばんもかってしまう。$$, $$Nas mãos daquele advogado, qualquer processo acaba ganho.$$),
    ('n1-grammar-114', $$子供にかかっては、親もかなわない。$$, $$こどもにかかっては、おやもかなわない。$$, $$Diante dos filhos, nem os pais conseguem resistir.$$),
    ('n1-grammar-114', $$彼女にかかれば、どんな料理もおいしくなる。$$, $$かのじょにかかれば、どんなりょうりもおいしくなる。$$, $$Nas mãos dela, qualquer prato fica gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの先生____、どんな難しい問題も簡単に見える。$$, $$Nas mãos daquele professor, qualquer problema difícil parece fácil.$$),
        (2, $$祖父____、誰も口では勝てない。$$, $$Diante do meu avô, ninguém ganha uma discussão.$$),
        (3, $$この犬____、どんな靴もぼろぼろになる。$$, $$Nas mãos deste cachorro, qualquer sapato vira trapo.$$),
        (4, $$彼のトーク____、どんな人も笑ってしまう。$$, $$Diante da conversa dele, qualquer pessoa acaba rindo.$$),
        (5, $$あの名探偵____、どんな事件も解決する。$$, $$Nas mãos daquele grande detetive, qualquer caso é resolvido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかかっては$$),
        (1, $$にかかったら$$),
        (1, $$にかかると$$),
        (1, $$にかかれば$$),
        (2, $$にかかっては$$),
        (2, $$にかかったら$$),
        (2, $$にかかると$$),
        (3, $$にかかっては$$),
        (3, $$にかかったら$$),
        (3, $$にかかると$$),
        (4, $$にかかっては$$),
        (4, $$にかかったら$$),
        (4, $$にかかると$$),
        (5, $$にかかっては$$),
        (5, $$にかかったら$$),
        (5, $$にかかると$$),
        (5, $$にかかれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-115 — 〜にかかっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-115',
    'grammar',
    'N1',
    $$〜にかかっている$$,
    $$ni kakatte iru$$,
    $$Depende de / Está nas mãos de / Tudo depende de$$,
    $$にかかっている indica que um resultado depende totalmente de algo ou de alguém. Equivale a "depende de" ou "está nas mãos de".

A pessoa destaca o fator decisivo para o sucesso ou fracasso. Por exemplo, "o futuro da empresa depende de vocês" ou "passar ou não depende do esforço".

Muitas vezes aparece com かどうか ou か antes.$$,
    $$É parecido com 次第だ e によって決まる.

A forma 命がかかっている significa "a vida está em jogo".$$,
    $$Substantivo + にかかっている
Frase + かどうかは + Substantivo + にかかっている$$,
    $$にかかっている$$,
    $$にかかっている|にかかっています|に懸かっている|にかかってる$$,
    ARRAY['に', 'かかって', 'いる']::text[],
    ARRAY['にかかっている', 'にかかっています', 'に懸かっている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-115', $$会社の将来は、君たちの努力にかかっている。$$, $$かいしゃのしょうらいは、きみたちのどりょくにかかっている。$$, $$O futuro da empresa depende do esforço de vocês.$$),
    ('n1-grammar-115', $$試合に勝てるかどうかは、最後の五分にかかっている。$$, $$しあいにかてるかどうかは、さいごのごふんにかかっている。$$, $$Vencer ou não a partida depende dos últimos cinco minutos.$$),
    ('n1-grammar-115', $$成功するかどうかは、準備にかかっています。$$, $$せいこうするかどうかは、じゅんびにかかっています。$$, $$Ter sucesso ou não depende da preparação.$$),
    ('n1-grammar-115', $$この国の未来は、若者にかかっている。$$, $$このくにのみらいは、わかものにかかっている。$$, $$O futuro deste país está nas mãos dos jovens.$$),
    ('n1-grammar-115', $$患者の命は、医者の判断にかかっている。$$, $$かんじゃのいのちは、いしゃのはんだんにかかっている。$$, $$A vida do paciente depende da decisão do médico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$合格できるかどうかは、これからの頑張り____。$$, $$Passar ou não depende do esforço daqui em diante.$$),
        (2, $$チームの勝利は、彼の活躍____。$$, $$A vitória do time depende do desempenho dele.$$),
        (3, $$この計画の成否は、資金集め____。$$, $$O sucesso deste plano depende da captação de recursos.$$),
        (4, $$店が続けられるかは、お客様の評価____。$$, $$Se a loja vai continuar depende da avaliação dos clientes.$$),
        (5, $$地球の環境は、私たち一人一人の行動____。$$, $$O meio ambiente da Terra depende das ações de cada um de nós.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかかっている$$),
        (1, $$にかかっています$$),
        (2, $$にかかっている$$),
        (2, $$にかかっています$$),
        (3, $$にかかっている$$),
        (3, $$にかかっています$$),
        (4, $$にかかっている$$),
        (4, $$にかかっています$$),
        (5, $$にかかっている$$),
        (5, $$にかかっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-116 — 〜にかこつけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-116',
    'grammar',
    'N1',
    $$〜にかこつけて$$,
    $$ni kakotsukete$$,
    $$Com a desculpa de / A pretexto de / Usando como desculpa$$,
    $$にかこつけて indica que alguém usa um motivo como desculpa para fazer outra coisa que realmente quer. Equivale a "com a desculpa de" ou "a pretexto de".

O motivo apresentado não é o verdadeiro. Por exemplo, "com a desculpa de uma viagem de trabalho, ele foi passear" ou "a pretexto de estar doente, faltou à reunião".

O tom é de crítica.$$,
    $$É parecido com を口実に, que tem o mesmo sentido.

Expressões comuns são 出張にかこつけて, 病気にかこつけて e 仕事にかこつけて.$$,
    $$Substantivo + にかこつけて + Verbo$$,
    $$にかこつけて$$,
    $$にかこつけて|に託けて$$,
    ARRAY['に', 'かこつけて']::text[],
    ARRAY['にかこつけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-116', $$彼は出張にかこつけて、観光を楽しんだ。$$, $$かれはしゅっちょうにかこつけて、かんこうをたのしんだ。$$, $$Com a desculpa de uma viagem de trabalho, ele aproveitou para passear.$$),
    ('n1-grammar-116', $$病気にかこつけて、会議を休んだ。$$, $$びょうきにかこつけて、かいぎをやすんだ。$$, $$A pretexto de estar doente, faltou à reunião.$$),
    ('n1-grammar-116', $$仕事にかこつけて、家事を手伝わない夫が多い。$$, $$しごとにかこつけて、かじをてつだわないおっとがおおい。$$, $$Muitos maridos não ajudam em casa usando o trabalho como desculpa.$$),
    ('n1-grammar-116', $$雨にかこつけて、ジョギングをさぼった。$$, $$あめにかこつけて、ジョギングをさぼった。$$, $$Com a desculpa da chuva, matei a corrida.$$),
    ('n1-grammar-116', $$誕生日にかこつけて、高いバッグを買ってもらった。$$, $$たんじょうびにかこつけて、たかいバッグをかってもらった。$$, $$A pretexto do aniversário, ganhei uma bolsa cara.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勉強____、友達の家に遊びに行った。$$, $$Com a desculpa de estudar, fui brincar na casa de um amigo.$$),
        (2, $$忙しさ____、親に連絡しない。$$, $$Com a desculpa de estar ocupado, não entro em contato com meus pais.$$),
        (3, $$会議____、昼から外出した。$$, $$A pretexto de uma reunião, saí a partir do meio-dia.$$),
        (4, $$取材____、有名人に会いに行った。$$, $$Com a desculpa de uma entrevista, fui ver uma celebridade.$$),
        (5, $$頭痛____、宿題をしなかった。$$, $$A pretexto de dor de cabeça, não fiz a lição de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかこつけて$$),
        (2, $$にかこつけて$$),
        (3, $$にかこつけて$$),
        (4, $$にかこつけて$$),
        (5, $$にかこつけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-117 — 〜にかまけて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-117',
    'grammar',
    'N1',
    $$〜にかまけて$$,
    $$ni kamakete$$,
    $$Absorvido por / Ocupado demais com / Por causa de$$,
    $$にかまけて indica que alguém está tão ocupado ou envolvido com algo que acaba deixando de lado outras coisas importantes. Equivale a "absorvido por" ou "ocupado demais com".

A segunda parte mostra o que foi negligenciado. Por exemplo, "absorvido pelo trabalho, deixou a família de lado".

O tom costuma ser de arrependimento ou crítica.$$,
    $$Expressões comuns são 仕事にかまけて, 忙しさにかまけて e 遊びにかまけて.

A segunda parte costuma ter verbos como 忘れる, 怠る ou しない.$$,
    $$Substantivo + にかまけて + Frase (algo negligenciado)$$,
    $$にかまけて$$,
    $$にかまけて$$,
    ARRAY['に', 'かまけて']::text[],
    ARRAY['にかまけて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-117', $$仕事にかまけて、家族との時間を大切にしなかった。$$, $$しごとにかまけて、かぞくとのじかんをたいせつにしなかった。$$, $$Absorvido pelo trabalho, não dei valor ao tempo com a família.$$),
    ('n1-grammar-117', $$忙しさにかまけて、友達に連絡していない。$$, $$いそがしさにかまけて、ともだちにれんらくしていない。$$, $$Ocupado demais, não tenho falado com meus amigos.$$),
    ('n1-grammar-117', $$遊びにかまけて、勉強を怠った。$$, $$あそびにかまけて、べんきょうをおこたった。$$, $$Absorvido pela diversão, deixei os estudos de lado.$$),
    ('n1-grammar-117', $$子育てにかまけて、自分のことを後回しにしてきた。$$, $$こそだてにかまけて、じぶんのことをあとまわしにしてきた。$$, $$Ocupada demais com os filhos, fui deixando a mim mesma para depois.$$),
    ('n1-grammar-117', $$趣味にかまけて、部屋の掃除をしていない。$$, $$しゅみにかまけて、へやのそうじをしていない。$$, $$Absorvido pelo hobby, não tenho limpado o quarto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ゲーム____、宿題を忘れた。$$, $$Absorvido pelo videogame, esqueci a lição de casa.$$),
        (2, $$忙しさ____、健康診断を受けていない。$$, $$Ocupado demais, não tenho feito exames de saúde.$$),
        (3, $$恋愛____、仕事がおろそかになった。$$, $$Absorvido pelo namoro, acabei descuidando do trabalho.$$),
        (4, $$毎日の生活____、夢をあきらめかけていた。$$, $$Ocupado demais com o dia a dia, estava quase desistindo do sonho.$$),
        (5, $$仕事____、親孝行をしなかった。$$, $$Absorvido pelo trabalho, não cuidei dos meus pais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかまけて$$),
        (2, $$にかまけて$$),
        (3, $$にかまけて$$),
        (4, $$にかまけて$$),
        (5, $$にかまけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-118 — 〜に難くない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-118',
    'grammar',
    'N1',
    $$〜に難くない$$,
    $$ni kataku nai$$,
    $$Não é difícil de / É fácil de / Compreende-se facilmente$$,
    $$に難くない indica que algo é fácil de imaginar ou compreender, com base na situação. Equivale a "não é difícil de..." ou "é fácil de...".

Costuma vir com verbos como imaginar, compreender e supor. Por exemplo, "não é difícil imaginar como ela se sentiu".

É uma expressão formal e literária.$$,
    $$Expressões comuns são 想像に難くない, 理解するに難くない e 察するに難くない.

É bem mais formal que 簡単に想像できる.$$,
    $$Verbo (forma dicionário) + に難くない
Substantivo (ação) + に難くない$$,
    $$に難くない$$,
    $$に難くない|にかたくない|に難くありません$$,
    ARRAY['に', '難く', 'ない']::text[],
    ARRAY['に難くない', 'にかたくない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-118', $$彼女の悲しみは想像に難くない。$$, $$かのじょのかなしみはそうぞうにかたくない。$$, $$Não é difícil imaginar a tristeza dela.$$),
    ('n1-grammar-118', $$親の苦労は察するに難くない。$$, $$おやのくろうはさっするにかたくない。$$, $$É fácil compreender o sofrimento dos pais.$$),
    ('n1-grammar-118', $$彼が怒った理由は理解するに難くない。$$, $$かれがおこったりゆうはりかいするにかたくない。$$, $$Não é difícil entender por que ele ficou bravo.$$),
    ('n1-grammar-118', $$このままでは会社が倒産することは、予想に難くない。$$, $$このままではかいしゃがとうさんすることは、よそうにかたくない。$$, $$Não é difícil prever que, do jeito que está, a empresa vai falir.$$),
    ('n1-grammar-118', $$一人で子供を育てる大変さは、想像に難くない。$$, $$ひとりでこどもをそだてるたいへんさは、そうぞうにかたくない。$$, $$Não é difícil imaginar o quanto é difícil criar um filho sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$優勝した選手の喜びは想像____。$$, $$Não é difícil imaginar a alegria do atleta campeão.$$),
        (2, $$事故にあった家族の気持ちは察する____。$$, $$É fácil compreender o sentimento da família que sofreu o acidente.$$),
        (3, $$彼の努力が実を結ぶことは予想____。$$, $$Não é difícil prever que o esforço dele vai dar frutos.$$),
        (4, $$そんな生活が苦しいことは想像____。$$, $$Não é difícil imaginar que uma vida assim seja dura.$$),
        (5, $$彼女が反対する理由は理解する____。$$, $$Não é difícil entender por que ela é contra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に難くない$$),
        (1, $$にかたくない$$),
        (2, $$に難くない$$),
        (2, $$にかたくない$$),
        (3, $$に難くない$$),
        (3, $$にかたくない$$),
        (4, $$に難くない$$),
        (4, $$にかたくない$$),
        (5, $$に難くない$$),
        (5, $$にかたくない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-119 — 〜にまつわる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-119',
    'grammar',
    'N1',
    $$〜にまつわる$$,
    $$ni matsuwaru$$,
    $$Relacionado a / Ligado a / Sobre$$,
    $$にまつわる indica que algo está ligado a um tema, geralmente histórias, lendas, mistérios ou lembranças. Equivale a "relacionado a" ou "ligado a".

Por exemplo, "uma lenda ligada a este templo" ou "histórias sobre fantasmas".

É uma expressão um pouco formal, comum em textos e narrativas.$$,
    $$Costuma vir com palavras como 話, 伝説, 噂, エピソード e 謎.

É parecido com に関する, mas にまつわる é usado para histórias e coisas que envolvem mistério ou interesse.$$,
    $$Substantivo + にまつわる + Substantivo$$,
    $$にまつわる$$,
    $$にまつわる$$,
    ARRAY['に', 'まつわる']::text[],
    ARRAY['にまつわる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-119', $$この寺にまつわる伝説を聞いた。$$, $$このてらにまつわるでんせつをきいた。$$, $$Ouvi uma lenda ligada a este templo.$$),
    ('n1-grammar-119', $$この町には、幽霊にまつわる話が多い。$$, $$このまちには、ゆうれいにまつわるはなしがおおい。$$, $$Nesta cidade há muitas histórias sobre fantasmas.$$),
    ('n1-grammar-119', $$その絵にまつわる謎はまだ解けていない。$$, $$そのえにまつわるなぞはまだとけていない。$$, $$O mistério ligado a esse quadro ainda não foi resolvido.$$),
    ('n1-grammar-119', $$祖父から戦争にまつわる話を聞いた。$$, $$そふからせんそうにまつわるはなしをきいた。$$, $$Ouvi do meu avô histórias relacionadas à guerra.$$),
    ('n1-grammar-119', $$お金にまつわるトラブルは多い。$$, $$おかねにまつわるトラブルはおおい。$$, $$Há muitos problemas relacionados a dinheiro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この城____歴史を調べている。$$, $$Estou pesquisando a história ligada a este castelo.$$),
        (2, $$その歌手____うわさが広まった。$$, $$Espalharam-se boatos sobre esse cantor.$$),
        (3, $$桜____言い伝えが残っている。$$, $$Ainda existe uma lenda ligada às cerejeiras.$$),
        (4, $$食べ物____思い出を話してください。$$, $$Conte uma lembrança relacionada a comida.$$),
        (5, $$この宝石____不思議な話がある。$$, $$Existe uma história misteriosa ligada a esta joia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にまつわる$$),
        (2, $$にまつわる$$),
        (3, $$にまつわる$$),
        (4, $$にまつわる$$),
        (5, $$にまつわる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-120 — 〜に則って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-120',
    'grammar',
    'N1',
    $$〜に則って$$,
    $$ni notte$$,
    $$De acordo com / Conforme / Seguindo$$,
    $$に則って indica que algo é feito seguindo uma regra, uma lei, uma tradição ou um padrão. Equivale a "de acordo com" ou "conforme".

É uma expressão formal, usada em contextos oficiais, jurídicos, cerimoniais ou esportivos. Por exemplo, "a cerimônia foi realizada conforme a tradição".

As formas に則り e に則った também são usadas.$$,
    $$Também é escrito にのっとって.

É parecido com に従って e に基づいて, mas に則って é mais formal e usado com regras e tradições.$$,
    $$Substantivo + に則って / に則り + Verbo
Substantivo + に則った + Substantivo$$,
    $$に則って$$,
    $$に則って|に則り|に則った|にのっとって|にのっとり$$,
    ARRAY['に', '則って']::text[],
    ARRAY['に則って', 'に則り', 'に則った']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-120', $$式は伝統に則って行われた。$$, $$しきはでんとうにのっとっておこなわれた。$$, $$A cerimônia foi realizada conforme a tradição.$$),
    ('n1-grammar-120', $$法律に則り、処分が決定された。$$, $$ほうりつにのっとり、しょぶんがけっていされた。$$, $$A punição foi decidida de acordo com a lei.$$),
    ('n1-grammar-120', $$選手たちはスポーツマンシップに則って戦った。$$, $$せんしゅたちはスポーツマンシップにのっとってたたかった。$$, $$Os atletas competiram seguindo o espírito esportivo.$$),
    ('n1-grammar-120', $$規則に則った手続きをしてください。$$, $$きそくにのっとったてつづきをしてください。$$, $$Faça os procedimentos de acordo com as regras.$$),
    ('n1-grammar-120', $$古い作法に則って、お茶を入れた。$$, $$ふるいさほうにのっとって、おちゃをいれた。$$, $$Preparei o chá seguindo a etiqueta tradicional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議は規定____進められた。$$, $$A reunião foi conduzida de acordo com as normas.$$),
        (2, $$契約____、代金を支払った。$$, $$Paguei o valor conforme o contrato.$$),
        (3, $$昔からのしきたり____、結婚式を挙げた。$$, $$Fizemos o casamento seguindo os costumes antigos.$$),
        (4, $$憲法____判断すべきだ。$$, $$Deve-se julgar de acordo com a constituição.$$),
        (5, $$ルール____試合を行います。$$, $$A partida será realizada conforme as regras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に則って$$),
        (1, $$に則り$$),
        (1, $$にのっとって$$),
        (2, $$に則って$$),
        (2, $$に則り$$),
        (2, $$にのっとって$$),
        (3, $$に則って$$),
        (3, $$に則り$$),
        (3, $$にのっとって$$),
        (4, $$に則って$$),
        (4, $$に則り$$),
        (4, $$にのっとって$$),
        (5, $$に則って$$),
        (5, $$に則り$$),
        (5, $$にのっとって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-121 — 〜に先駆けて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-121',
    'grammar',
    'N1',
    $$〜に先駆けて$$,
    $$ni sakigakete$$,
    $$À frente de / Antes de / Pioneiro em relação a$$,
    $$に先駆けて indica que algo é feito antes de outros, sendo o primeiro ou pioneiro. Equivale a "à frente de" ou "antes de".

É usado para destacar que alguém ou algo foi o primeiro a fazer algo novo. Por exemplo, "esta empresa lançou o produto antes de todas as outras".

É uma expressão formal, comum em notícias e anúncios.$$,
    $$É parecido com に先立って, mas に先駆けて destaca o pioneirismo, enquanto に先立って indica apenas o que vem antes como preparação.

Expressões comuns são 世界に先駆けて e 他社に先駆けて.$$,
    $$Substantivo + に先駆けて / に先駆け
Substantivo + に先駆けた + Substantivo$$,
    $$に先駆けて$$,
    $$に先駆けて|に先駆け|にさきがけて$$,
    ARRAY['に', '先駆けて']::text[],
    ARRAY['に先駆けて', 'に先駆け']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-121', $$この会社は他社に先駆けて、新製品を発売した。$$, $$このかいしゃはたしゃにさきがけて、しんせいひんをはつばいした。$$, $$Esta empresa lançou o novo produto antes das concorrentes.$$),
    ('n1-grammar-121', $$日本は世界に先駆けて、この技術を開発した。$$, $$にほんはせかいにさきがけて、このぎじゅつをかいはつした。$$, $$O Japão desenvolveu esta tecnologia à frente do resto do mundo.$$),
    ('n1-grammar-121', $$全国に先駆け、この町でごみの分別が始まった。$$, $$ぜんこくにさきがけ、このまちでごみのぶんべつがはじまった。$$, $$A separação de lixo começou nesta cidade antes de todo o país.$$),
    ('n1-grammar-121', $$一般公開に先駆けて、記者向けの発表会が開かれた。$$, $$いっぱんこうかいにさきがけて、きしゃむけのはっぴょうかいがひらかれた。$$, $$Antes da abertura ao público, houve uma apresentação para a imprensa.$$),
    ('n1-grammar-121', $$彼は時代に先駆けて、ネットビジネスを始めた。$$, $$かれはじだいにさきがけて、ネットビジネスをはじめた。$$, $$Ele começou um negócio na internet à frente do seu tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この病院は国内____、新しい治療法を取り入れた。$$, $$Este hospital adotou o novo tratamento antes de todos no país.$$),
        (2, $$発売日____、ファンだけに先行販売した。$$, $$Antes do dia de lançamento, fizemos uma pré-venda só para os fãs.$$),
        (3, $$世界____、宇宙旅行の計画を発表した。$$, $$Anunciaram o plano de turismo espacial à frente do resto do mundo.$$),
        (4, $$他の店____、セールを始めた。$$, $$Começamos a liquidação antes das outras lojas.$$),
        (5, $$彼女はみんな____、新しいことに挑戦する。$$, $$Ela sempre tenta coisas novas antes de todo mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に先駆けて$$),
        (1, $$に先駆け$$),
        (1, $$にさきがけて$$),
        (2, $$に先駆けて$$),
        (2, $$に先駆け$$),
        (2, $$にさきがけて$$),
        (3, $$に先駆けて$$),
        (3, $$に先駆け$$),
        (3, $$にさきがけて$$),
        (4, $$に先駆けて$$),
        (4, $$に先駆け$$),
        (4, $$にさきがけて$$),
        (5, $$に先駆けて$$),
        (5, $$に先駆け$$),
        (5, $$にさきがけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-122 — 〜に忍びない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-122',
    'grammar',
    'N1',
    $$〜に忍びない$$,
    $$ni shinobinai$$,
    $$Não ter coragem de / Não suportar / Dar pena de$$,
    $$に忍びない indica que a pessoa não consegue fazer algo porque sentiria muita pena, culpa ou dor emocional. Equivale a "não ter coragem de" ou "dar pena de".

Costuma vir com verbos como jogar fora, ver, ouvir ou dizer. Por exemplo, "não tenho coragem de jogar fora as roupas antigas do meu filho".

É uma expressão formal e emotiva.$$,
    $$Expressões comuns são 見るに忍びない, 聞くに忍びない, 捨てるに忍びない e 断るに忍びない.

É parecido com とても〜できない, mas に忍びない destaca o sentimento de pena.$$,
    $$Verbo (forma dicionário) + に忍びない
Substantivo (ação) + に忍びない$$,
    $$に忍びない$$,
    $$に忍びない|に忍びなかった|にしのびない|に忍びなく$$,
    ARRAY['に', '忍びない']::text[],
    ARRAY['に忍びない', 'に忍びなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-122', $$子供の古い服は、捨てるに忍びない。$$, $$こどものふるいふくは、すてるにしのびない。$$, $$Não tenho coragem de jogar fora as roupas antigas do meu filho.$$),
    ('n1-grammar-122', $$事故の現場は見るに忍びなかった。$$, $$じこのげんばはみるにしのびなかった。$$, $$Não suportei olhar a cena do acidente.$$),
    ('n1-grammar-122', $$彼のつらい話は、聞くに忍びない。$$, $$かれのつらいはなしは、きくにしのびない。$$, $$Dá pena ouvir a história triste dele.$$),
    ('n1-grammar-122', $$一生懸命頼まれると、断るに忍びない。$$, $$いっしょうけんめいたのまれると、ことわるにしのびない。$$, $$Quando me pedem com tanto empenho, não tenho coragem de recusar.$$),
    ('n1-grammar-122', $$思い出の写真は、捨てるに忍びなくて、ずっと持っている。$$, $$おもいでのしゃしんは、すてるにしのびなくて、ずっともっている。$$, $$Não tenho coragem de jogar fora as fotos de recordação, então guardo todas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$祖母の形見は、処分する____。$$, $$Não tenho coragem de me desfazer das lembranças da minha avó.$$),
        (2, $$病気で苦しむ犬の姿は、見る____。$$, $$Não suporto ver meu cachorro sofrendo com a doença.$$),
        (3, $$彼女にその事実を伝える____。$$, $$Não tenho coragem de contar esse fato a ela.$$),
        (4, $$せっかくの料理を残す____。$$, $$Dá pena deixar a comida que foi feita com tanto carinho.$$),
        (5, $$その悲惨な話は、聞く____ものだった。$$, $$Aquela história trágica era insuportável de ouvir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に忍びない$$),
        (1, $$にしのびない$$),
        (2, $$に忍びない$$),
        (2, $$にしのびない$$),
        (3, $$に忍びない$$),
        (3, $$にしのびない$$),
        (4, $$に忍びない$$),
        (4, $$にしのびない$$),
        (5, $$に忍びない$$),
        (5, $$にしのびない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-123 — 〜にしたところで / 〜としたところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-123',
    'grammar',
    'N1',
    $$〜にしたところで / 〜としたところで$$,
    $$ni shita tokoro de / to shita tokoro de$$,
    $$Mesmo para / Mesmo que / Até mesmo$$,
    $$にしたところで e としたところで indicam que, mesmo considerando uma pessoa ou situação específica, a conclusão é a mesma. Equivale a "mesmo para" ou "mesmo que".

Muitas vezes a pessoa diz que nem ela, nem alguém que deveria saber, consegue mudar a situação. Por exemplo, "mesmo para mim, isso é difícil" ou "mesmo que se apresse, não vai dar tempo".

A segunda parte costuma ser negativa.$$,
    $$É parecido com にしても, mas mais enfático.

Também aparece como にしたって, na forma coloquial.$$,
    $$Substantivo + にしたところで
Verbo (forma simples) + としたところで
Substantivo + としたところで$$,
    $$にしたところで$$,
    $$にしたところで|としたところで|にしたって$$,
    ARRAY['に', 'した', 'ところ', 'で']::text[],
    ARRAY['にしたところで', 'としたところで', 'にしたって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-123', $$私にしたところで、彼の気持ちはわからない。$$, $$わたしにしたところで、かれのきもちはわからない。$$, $$Mesmo para mim, é impossível entender o que ele sente.$$),
    ('n1-grammar-123', $$社長にしたところで、この問題は解決できないだろう。$$, $$しゃちょうにしたところで、このもんだいはかいけつできないだろう。$$, $$Até mesmo o presidente provavelmente não consegue resolver este problema.$$),
    ('n1-grammar-123', $$今から急いだとしたところで、間に合わない。$$, $$いまからいそいだとしたところで、まにあわない。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-123', $$彼にしたって、悪気があったわけではない。$$, $$かれにしたって、わるぎがあったわけではない。$$, $$Até mesmo ele não fez por mal.$$),
    ('n1-grammar-123', $$専門家にしたところで、未来は予測できない。$$, $$せんもんかにしたところで、みらいはよそくできない。$$, $$Mesmo para um especialista, não dá para prever o futuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生____、全部の答えを知っているわけではない。$$, $$Até mesmo o professor não sabe todas as respostas.$$),
        (2, $$親____、子供の将来を決めることはできない。$$, $$Mesmo os pais não podem decidir o futuro dos filhos.$$),
        (3, $$たとえ謝った____、許してもらえないだろう。$$, $$Mesmo que peça desculpas, provavelmente não vai ser perdoado.$$),
        (4, $$彼女____、この結果には満足していないはずだ。$$, $$Até mesmo ela deve estar insatisfeita com este resultado.$$),
        (5, $$警察____、すべての事件を防ぐことはできない。$$, $$Mesmo a polícia não consegue evitar todos os crimes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたところで$$),
        (1, $$にしたって$$),
        (2, $$にしたところで$$),
        (2, $$にしたって$$),
        (3, $$としたところで$$),
        (4, $$にしたところで$$),
        (4, $$にしたって$$),
        (5, $$にしたところで$$),
        (5, $$にしたって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-124 — 〜にして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-124',
    'grammar',
    'N1',
    $$〜にして$$,
    $$ni shite$$,
    $$Só mesmo / Justamente por ser / Já aos$$,
    $$にして tem alguns usos formais.

O primeiro indica que algo só é possível por causa de uma pessoa com nível muito alto. Equivale a "só mesmo". Por exemplo, "só mesmo um gênio como ele conseguiria isso".

O segundo indica uma idade ou momento em que algo acontece, muitas vezes com surpresa. Equivale a "já aos" ou "só aos". Por exemplo, "só aos quarenta anos ele se casou".

Também aparece em expressões fixas, como 一瞬にして, "num instante".$$,
    $$Expressões comuns são 一瞬にして, 一夜にして, 四十にして e この親にしてこの子あり.

Também pode indicar duas qualidades ao mesmo tempo, como 医者にして作家, "médico e escritor".$$,
    $$Substantivo (pessoa de alto nível) + にして + はじめて / ようやく
Número (idade / tempo) + にして + Frase
Substantivo + にして + Substantivo (ao mesmo tempo)$$,
    $$にして$$,
    $$にして$$,
    ARRAY['に', 'して']::text[],
    ARRAY['にして', 'にしてはじめて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-124', $$彼のような天才にしてはじめてできることだ。$$, $$かれのようなてんさいにしてはじめてできることだ。$$, $$É algo que só mesmo um gênio como ele consegue fazer.$$),
    ('n1-grammar-124', $$彼は四十歳にしてようやく結婚した。$$, $$かれはよんじゅっさいにしてようやくけっこんした。$$, $$Ele só se casou aos quarenta anos.$$),
    ('n1-grammar-124', $$家は一瞬にして火に包まれた。$$, $$いえはいっしゅんにしてひにつつまれた。$$, $$A casa foi tomada pelas chamas num instante.$$),
    ('n1-grammar-124', $$この親にしてこの子ありだ。$$, $$このおやにしてこのこありだ。$$, $$Tal pai, tal filho.$$),
    ('n1-grammar-124', $$彼は医者にして、有名な作家でもある。$$, $$かれはいしゃにして、ゆうめいなさっかでもある。$$, $$Ele é médico e, ao mesmo tempo, um escritor famoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$町は一夜____廃墟になった。$$, $$A cidade virou ruínas da noite para o dia.$$),
        (2, $$彼女は二十歳____社長になった。$$, $$Ela se tornou presidente de empresa já aos vinte anos.$$),
        (3, $$ベテランの彼____はじめて解決できる問題だ。$$, $$É um problema que só mesmo ele, veterano, consegue resolver.$$),
        (4, $$財産は一瞬____消えた。$$, $$A fortuna sumiu num instante.$$),
        (5, $$六十歳____初めて海外旅行をした。$$, $$Só aos sessenta anos viajei para o exterior pela primeira vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にして$$),
        (2, $$にして$$),
        (3, $$にして$$),
        (4, $$にして$$),
        (5, $$にして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-125 — 〜に即して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-125',
    'grammar',
    'N1',
    $$〜に即して$$,
    $$ni sokushite$$,
    $$De acordo com / Conforme / Baseado em$$,
    $$に即して indica que algo é feito de acordo com a realidade, os fatos ou a situação concreta. Equivale a "de acordo com" ou "conforme".

A pessoa destaca que a ação se adapta ao que é real, e não a ideias abstratas. Por exemplo, "vamos pensar em medidas de acordo com a situação real".

É uma expressão formal, comum em textos e no trabalho.$$,
    $$Costuma vir com palavras como 事実, 現実, 状況, 実情 e 実態.

É parecido com に沿って e に基づいて.$$,
    $$Substantivo + に即して / に即し
Substantivo + に即した + Substantivo$$,
    $$に即して$$,
    $$に即して|に即し|に即した|にそくして$$,
    ARRAY['に', '即して']::text[],
    ARRAY['に即して', 'に即し', 'に即した']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-125', $$事実に即して、報告書を書いてください。$$, $$じじつにそくして、ほうこくしょをかいてください。$$, $$Escreva o relatório de acordo com os fatos.$$),
    ('n1-grammar-125', $$現実に即した計画を立てる必要がある。$$, $$げんじつにそくしたけいかくをたてるひつようがある。$$, $$É preciso fazer um plano baseado na realidade.$$),
    ('n1-grammar-125', $$状況に即して、柔軟に対応しよう。$$, $$じょうきょうにそくして、じゅうなんにたいおうしよう。$$, $$Vamos reagir com flexibilidade conforme a situação.$$),
    ('n1-grammar-125', $$地域の実情に即し、対策を考えた。$$, $$ちいきのじつじょうにそくし、たいさくをかんがえた。$$, $$Pensamos nas medidas de acordo com a situação real da região.$$),
    ('n1-grammar-125', $$経験に即したアドバイスは役に立つ。$$, $$けいけんにそくしたアドバイスはやくにたつ。$$, $$Conselhos baseados na experiência são úteis.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$法律____判断する。$$, $$Julgamos de acordo com a lei.$$),
        (2, $$学生のレベル____授業を行う。$$, $$As aulas são dadas de acordo com o nível dos alunos.$$),
        (3, $$現場の声____、改善を進めた。$$, $$Fizemos melhorias conforme a opinião de quem está no local de trabalho.$$),
        (4, $$時代____教育が求められている。$$, $$Está sendo exigida uma educação de acordo com a época.$$),
        (5, $$実態____調査を行った。$$, $$Fizemos uma pesquisa de acordo com a realidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に即して$$),
        (1, $$に即し$$),
        (1, $$にそくして$$),
        (2, $$に即して$$),
        (2, $$に即し$$),
        (2, $$にそくして$$),
        (3, $$に即して$$),
        (3, $$に即し$$),
        (3, $$にそくして$$),
        (4, $$に即した$$),
        (5, $$に即して$$),
        (5, $$に即し$$),
        (5, $$にそくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-126 — 〜に耐える / 〜に耐えない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-126',
    'grammar',
    'N1',
    $$〜に耐える / 〜に耐えない$$,
    $$ni taeru / ni taenai$$,
    $$Digno de / Que vale a pena / Insuportável de$$,
    $$に耐える e に耐えない avaliam se algo tem qualidade suficiente para merecer uma ação.

に耐える significa "digno de" ou "que vale a pena". Por exemplo, "uma obra digna de ser lida por adultos".

に耐えない significa que algo é tão ruim ou triste que não dá para suportar. Equivale a "insuportável de". Por exemplo, "uma cena insuportável de ver".

Também aparece em expressões de sentimento forte, como 感謝に耐えない, "não tenho palavras para agradecer".$$,
    $$Expressões comuns são 見るに耐えない, 聞くに耐えない, 読むに耐える, 感謝に耐えない e 遺憾に耐えない.

É uma expressão formal.$$,
    $$Verbo (forma dicionário) + に耐える
Verbo (forma dicionário) + に耐えない
Substantivo (sentimento) + に耐えない$$,
    $$に耐える$$,
    $$に耐える|に耐えない|に耐えなかった|に耐えません|に堪える|に堪えない|に堪えません|にたえない|にたえる$$,
    ARRAY['に', '耐える']::text[],
    ARRAY['に耐える', 'に耐えない', 'に堪えない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-126', $$この作品は大人の鑑賞に耐える。$$, $$このさくひんはおとなのかんしょうにたえる。$$, $$Esta obra é digna da apreciação de adultos.$$),
    ('n1-grammar-126', $$事故の現場は見るに耐えなかった。$$, $$じこのげんばはみるにたえなかった。$$, $$A cena do acidente era insuportável de ver.$$),
    ('n1-grammar-126', $$彼の悪口は聞くに耐えない。$$, $$かれのわるぐちはきくにたえない。$$, $$As ofensas dele são insuportáveis de ouvir.$$),
    ('n1-grammar-126', $$皆様のご支援には、感謝に堪えません。$$, $$みなさまのごしえんには、かんしゃにたえません。$$, $$Não tenho palavras para agradecer o apoio de todos.$$),
    ('n1-grammar-126', $$この本は何度読んでも読むに耐える。$$, $$このほんはなんどよんでもよむにたえる。$$, $$Este livro vale a pena ser lido, não importa quantas vezes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その映画は暴力的な場面が多く、見る____。$$, $$Esse filme tem muitas cenas violentas e é insuportável de ver.$$),
        (2, $$彼の歌は下手すぎて聞く____。$$, $$O canto dele é tão ruim que é insuportável de ouvir.$$),
        (3, $$この論文は専門家の批判____内容だ。$$, $$Este artigo tem um conteúdo que resiste à crítica dos especialistas.$$),
        (4, $$ご協力いただき、感謝____。$$, $$Não tenho palavras para agradecer a sua cooperação.$$),
        (5, $$あの記事は読む____ひどい内容だった。$$, $$Aquela matéria tinha um conteúdo tão horrível que era insuportável de ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に耐えない$$),
        (1, $$に堪えない$$),
        (2, $$に耐えない$$),
        (2, $$に堪えない$$),
        (3, $$に耐える$$),
        (3, $$に堪える$$),
        (4, $$に堪えない$$),
        (4, $$に耐えない$$),
        (4, $$に堪えません$$),
        (5, $$に耐えない$$),
        (5, $$に堪えない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-127 — 〜に足らない / 〜に足りない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-127',
    'grammar',
    'N1',
    $$〜に足らない / 〜に足りない$$,
    $$ni taranai / ni tarinai$$,
    $$Não vale a pena / Insignificante / Não merece$$,
    $$に足らない e に足りない indicam que algo é tão pequeno ou sem importância que não merece atenção. Equivalem a "não vale a pena" ou "insignificante".

Costumam vir com verbos como temer, preocupar-se, levar em conta ou falar. Por exemplo, "é um problema que não merece preocupação".

É uma expressão formal.$$,
    $$Expressões comuns são 取るに足らない, 恐れるに足らない e 心配するに足りない.

取るに足らない significa "insignificante" ou "sem importância".$$,
    $$Verbo (forma dicionário) + に足らない / に足りない
Substantivo + に足らない$$,
    $$に足らない$$,
    $$に足らない|に足りない|にたらない|にたりない$$,
    ARRAY['に', '足らない']::text[],
    ARRAY['に足らない', 'に足りない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-127', $$それは取るに足らない問題だ。$$, $$それはとるにたらないもんだいだ。$$, $$Isso é um problema insignificante.$$),
    ('n1-grammar-127', $$あんな相手は恐れるに足らない。$$, $$あんなあいてはおそれるにたらない。$$, $$Um adversário daqueles não merece ser temido.$$),
    ('n1-grammar-127', $$この程度の失敗は、心配するに足りない。$$, $$このていどのしっぱいは、しんぱいするにたりない。$$, $$Um erro desses não vale a preocupação.$$),
    ('n1-grammar-127', $$彼の意見は聞くに足らない。$$, $$かれのいけんはきくにたらない。$$, $$A opinião dele não merece ser ouvida.$$),
    ('n1-grammar-127', $$取るに足りないことで、けんかをしてしまった。$$, $$とるにたりないことで、けんかをしてしまった。$$, $$Acabamos brigando por algo insignificante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんなうわさは信じる____。$$, $$Um boato desses não merece crédito.$$),
        (2, $$取る____ことで悩むのはやめよう。$$, $$Vamos parar de nos preocupar com coisas insignificantes.$$),
        (3, $$この程度の雨は、恐れる____。$$, $$Uma chuva dessas não merece medo.$$),
        (4, $$彼の批判は気にする____。$$, $$As críticas dele não merecem atenção.$$),
        (5, $$それは議論する____小さな問題だ。$$, $$É um problema pequeno que não vale a pena discutir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に足らない$$),
        (1, $$に足りない$$),
        (2, $$に足らない$$),
        (2, $$に足りない$$),
        (3, $$に足らない$$),
        (3, $$に足りない$$),
        (4, $$に足らない$$),
        (4, $$に足りない$$),
        (5, $$に足らない$$),
        (5, $$に足りない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-128 — 〜に足る / 〜に足りる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-128',
    'grammar',
    'N1',
    $$〜に足る / 〜に足りる$$,
    $$ni taru / ni tariru$$,
    $$Digno de / Suficiente para / Que merece$$,
    $$に足る e に足りる indicam que algo tem valor ou qualidade suficiente para merecer uma ação. Equivalem a "digno de" ou "que merece".

Costumam vir com verbos como confiar, respeitar, satisfazer ou acreditar. Por exemplo, "uma pessoa digna de confiança" ou "um resultado satisfatório".

É uma expressão formal, comum na escrita.$$,
    $$Expressões comuns são 信頼に足る, 尊敬に足る, 満足に足る e 信じるに足る.

É parecido com に値する.$$,
    $$Verbo (forma dicionário) + に足る + Substantivo
Substantivo + に足る + Substantivo$$,
    $$に足る$$,
    $$に足る|に足りる|にたる|にたりる$$,
    ARRAY['に', '足る']::text[],
    ARRAY['に足る', 'に足りる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-128', $$彼は信頼に足る人物だ。$$, $$かれはしんらいにたるじんぶつだ。$$, $$Ele é uma pessoa digna de confiança.$$),
    ('n1-grammar-128', $$満足に足る結果が出た。$$, $$まんぞくにたるけっかがでた。$$, $$Saiu um resultado satisfatório.$$),
    ('n1-grammar-128', $$この情報は信じるに足るものだ。$$, $$このじょうほうはしんじるにたるものだ。$$, $$Esta informação é digna de crédito.$$),
    ('n1-grammar-128', $$彼女は尊敬に足りる先輩だ。$$, $$かのじょはそんけいにたりるせんぱいだ。$$, $$Ela é uma veterana que merece respeito.$$),
    ('n1-grammar-128', $$証拠として十分に足る資料がそろった。$$, $$しょうことしてじゅうぶんにたるしりょうがそろった。$$, $$Reunimos material suficiente para servir de prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の言葉は信用する____ものだ。$$, $$As palavras dele merecem confiança.$$),
        (2, $$リーダーとして尊敬____人物だ。$$, $$É uma pessoa que merece respeito como líder.$$),
        (3, $$この研究は評価____内容だ。$$, $$Esta pesquisa tem um conteúdo digno de avaliação.$$),
        (4, $$任せる____人がいない。$$, $$Não há ninguém a quem se possa confiar a tarefa.$$),
        (5, $$読む____本を探している。$$, $$Estou procurando um livro que valha a pena ler.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に足る$$),
        (1, $$に足りる$$),
        (2, $$に足る$$),
        (2, $$に足りる$$),
        (3, $$に足る$$),
        (3, $$に足りる$$),
        (4, $$に足る$$),
        (4, $$に足りる$$),
        (5, $$に足る$$),
        (5, $$に足りる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-129 — 〜に照らして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-129',
    'grammar',
    'N1',
    $$〜に照らして$$,
    $$ni terashite$$,
    $$À luz de / Com base em / Comparando com$$,
    $$に照らして indica que algo é julgado ou avaliado comparando com um padrão, uma regra ou uma referência. Equivale a "à luz de" ou "com base em".

Costuma vir com palavras como lei, regra, experiência, bom senso e fatos. Por exemplo, "à luz da lei, esse ato é crime".

É uma expressão formal, comum em contextos jurídicos e oficiais.$$,
    $$Também é escrito にてらして.

É parecido com に基づいて e と比べて, mas に照らして destaca o julgamento com base em um padrão.$$,
    $$Substantivo + に照らして / に照らし
Substantivo + に照らすと / に照らせば$$,
    $$に照らして$$,
    $$に照らして|に照らし|に照らすと|に照らせば|にてらして$$,
    ARRAY['に', '照らして']::text[],
    ARRAY['に照らして', 'に照らし', 'に照らすと', 'に照らせば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-129', $$法律に照らして、彼の行為は犯罪にあたる。$$, $$ほうりつにてらして、かれのこういははんざいにあたる。$$, $$À luz da lei, o ato dele constitui crime.$$),
    ('n1-grammar-129', $$過去の経験に照らすと、この計画は危ない。$$, $$かこのけいけんにてらすと、このけいかくはあぶない。$$, $$Com base em experiências passadas, este plano é arriscado.$$),
    ('n1-grammar-129', $$社会の常識に照らして考えてみてください。$$, $$しゃかいのじょうしきにてらしてかんがえてみてください。$$, $$Pense nisso à luz do bom senso da sociedade.$$),
    ('n1-grammar-129', $$規則に照らし、処分を決定した。$$, $$きそくにてらし、しょぶんをけっていした。$$, $$Decidimos a punição com base nas regras.$$),
    ('n1-grammar-129', $$事実に照らせば、彼の説明はおかしい。$$, $$じじつにてらせば、かれのせつめいはおかしい。$$, $$Comparando com os fatos, a explicação dele é estranha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$校則____、この服装は認められない。$$, $$À luz das regras da escola, esta roupa não é permitida.$$),
        (2, $$これまでのデータ____、今年の売り上げは少ない。$$, $$Com base nos dados até agora, as vendas deste ano estão baixas.$$),
        (3, $$自分の良心____、正しいと思う道を選ぶ。$$, $$Escolho o caminho que acho certo à luz da minha consciência.$$),
        (4, $$国際基準____、この製品は安全だ。$$, $$Com base nos padrões internacionais, este produto é seguro.$$),
        (5, $$契約内容____、問題がないか確認した。$$, $$Verifiquei se não havia problemas à luz do contrato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に照らして$$),
        (1, $$に照らし$$),
        (1, $$に照らすと$$),
        (1, $$に照らせば$$),
        (2, $$に照らして$$),
        (2, $$に照らし$$),
        (2, $$に照らすと$$),
        (2, $$に照らせば$$),
        (3, $$に照らして$$),
        (3, $$に照らし$$),
        (4, $$に照らして$$),
        (4, $$に照らし$$),
        (4, $$に照らすと$$),
        (4, $$に照らせば$$),
        (5, $$に照らして$$),
        (5, $$に照らし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-130 — 〜にとどまらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-130',
    'grammar',
    'N1',
    $$〜にとどまらず$$,
    $$ni todomarazu$$,
    $$Não só / Vai além de / Não se limita a$$,
    $$にとどまらず indica que algo não fica restrito a um limite e se estende a um alcance maior. Equivale a "não só" ou "vai além de".

Por exemplo, "o problema não se limita ao Japão, afeta o mundo inteiro" ou "a fama dele foi além do país".

É uma expressão formal, comum em notícias e textos.$$,
    $$É parecido com だけでなく e に限らず, mas にとどまらず destaca a expansão de algo.

Também é escrito に留まらず.$$,
    $$Substantivo + にとどまらず
Verbo (forma dicionário) + にとどまらず$$,
    $$にとどまらず$$,
    $$にとどまらず|に留まらず|にとどまらない$$,
    ARRAY['に', 'とどまらず']::text[],
    ARRAY['にとどまらず', 'に留まらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-130', $$この問題は日本にとどまらず、世界中に広がっている。$$, $$このもんだいはにほんにとどまらず、せかいじゅうにひろがっている。$$, $$Este problema não se limita ao Japão e está se espalhando pelo mundo todo.$$),
    ('n1-grammar-130', $$彼の人気は国内にとどまらず、海外にも及んでいる。$$, $$かれのにんきはこくないにとどまらず、かいがいにもおよんでいる。$$, $$A popularidade dele vai além do país e chega ao exterior.$$),
    ('n1-grammar-130', $$被害は一つの町にとどまらず、県全体に広がった。$$, $$ひがいはひとつのまちにとどまらず、けんぜんたいにひろがった。$$, $$Os danos não ficaram em uma só cidade e se espalharam por toda a província.$$),
    ('n1-grammar-130', $$彼女は歌手にとどまらず、女優としても活躍している。$$, $$かのじょはかしゅにとどまらず、じょゆうとしてもかつやくしている。$$, $$Ela não é só cantora, também faz sucesso como atriz.$$),
    ('n1-grammar-130', $$その影響は経済にとどまらず、文化にも及んだ。$$, $$そのえいきょうはけいざいにとどまらず、ぶんかにもおよんだ。$$, $$A influência não se limitou à economia e chegou também à cultura.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$インフルエンザは学校内____、地域全体に広がった。$$, $$A gripe não ficou só na escola e se espalhou por toda a região.$$),
        (2, $$彼の研究は医学____、さまざまな分野で役立っている。$$, $$A pesquisa dele não se limita à medicina e é útil em vários campos.$$),
        (3, $$このブームは若者____、高齢者にも広がっている。$$, $$Esta moda não se limita aos jovens e está chegando aos idosos.$$),
        (4, $$彼女の活動は国内____、世界中で注目されている。$$, $$As atividades dela vão além do país e chamam a atenção do mundo todo.$$),
        (5, $$その事件は一企業の問題____、社会問題になった。$$, $$Esse caso não ficou como problema de uma só empresa e virou um problema social.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にとどまらず$$),
        (1, $$に留まらず$$),
        (2, $$にとどまらず$$),
        (2, $$に留まらず$$),
        (3, $$にとどまらず$$),
        (3, $$に留まらず$$),
        (4, $$にとどまらず$$),
        (4, $$に留まらず$$),
        (5, $$にとどまらず$$),
        (5, $$に留まらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-131 — 〜には無理がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-131',
    'grammar',
    'N1',
    $$〜には無理がある$$,
    $$ni wa muri ga aru$$,
    $$É forçado / Não é razoável / É difícil de aceitar$$,
    $$には無理がある indica que uma ideia, um plano ou uma explicação não é razoável ou não faz sentido. Equivale a "é forçado" ou "não é razoável".

A pessoa critica algo que parece impossível ou pouco lógico. Por exemplo, "terminar tudo em um dia é forçado demais" ou "essa explicação não é convincente".

É uma expressão um pouco formal.$$,
    $$Muitas vezes vem com のは ou のには antes.

É parecido com 無理だ, mas には無理がある soa mais suave e analítico.$$,
    $$Verbo (forma dicionário) + のには無理がある
Substantivo + には無理がある$$,
    $$には無理がある$$,
    $$には無理がある|には無理があります|に無理がある|には無理があった$$,
    ARRAY['に', 'は', '無理', 'が', 'ある']::text[],
    ARRAY['には無理がある', 'には無理があります', 'に無理がある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-131', $$一日で全部終わらせるのには無理がある。$$, $$いちにちでぜんぶおわらせるのにはむりがある。$$, $$Terminar tudo em um dia é forçado demais.$$),
    ('n1-grammar-131', $$彼の説明には無理がある。$$, $$かれのせつめいにはむりがある。$$, $$A explicação dele não é convincente.$$),
    ('n1-grammar-131', $$この予算で家を建てるのには無理があります。$$, $$このよさんでいえをたてるのにはむりがあります。$$, $$Construir uma casa com este orçamento não é razoável.$$),
    ('n1-grammar-131', $$最初から、この計画には無理があった。$$, $$さいしょから、このけいかくにはむりがあった。$$, $$Desde o começo, este plano era inviável.$$),
    ('n1-grammar-131', $$三人でこの仕事をするのには無理がある。$$, $$さんにんでこのしごとをするのにはむりがある。$$, $$Fazer este trabalho em três pessoas não é razoável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その話を信じるの____。$$, $$É difícil de acreditar nessa história.$$),
        (2, $$一か月で日本語を話せるようになるの____。$$, $$Aprender a falar japonês em um mês é forçado demais.$$),
        (3, $$このスケジュール____。$$, $$Este cronograma não é razoável.$$),
        (4, $$子供一人で行かせるの____。$$, $$Mandar uma criança sozinha não é razoável.$$),
        (5, $$その理論____と専門家は言う。$$, $$Os especialistas dizem que essa teoria é forçada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には無理がある$$),
        (1, $$には無理があります$$),
        (2, $$には無理がある$$),
        (2, $$には無理があります$$),
        (3, $$には無理がある$$),
        (3, $$には無理があります$$),
        (4, $$には無理がある$$),
        (4, $$には無理があります$$),
        (5, $$には無理がある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-132 — 〜によらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-132',
    'grammar',
    'N1',
    $$〜によらず$$,
    $$ni yorazu$$,
    $$Independentemente de / Sem depender de / Seja qual for$$,
    $$によらず indica que algo não depende de uma condição. Equivale a "independentemente de" ou "sem depender de".

Costuma vir com palavras como aparência, idade, sexo, experiência ou método. Por exemplo, "contratamos sem levar em conta a idade".

A expressão 見かけによらず significa "apesar da aparência", como "apesar da aparência, ele é forte".$$,
    $$Expressões comuns são 見かけによらず, 年齢によらず, 何事によらず e 理由のいかんによらず.

É parecido com を問わず e に関わらず.$$,
    $$Substantivo + によらず
Palavra interrogativa + によらず$$,
    $$によらず$$,
    $$によらず$$,
    ARRAY['に', 'よらず']::text[],
    ARRAY['によらず', '見かけによらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-132', $$彼は見かけによらず、力が強い。$$, $$かれはみかけによらず、ちからがつよい。$$, $$Apesar da aparência, ele é forte.$$),
    ('n1-grammar-132', $$年齢によらず、誰でも参加できる。$$, $$ねんれいによらず、だれでもさんかできる。$$, $$Qualquer pessoa pode participar, independentemente da idade.$$),
    ('n1-grammar-132', $$何事によらず、最後までやり遂げることが大切だ。$$, $$なにごとによらず、さいごまでやりとげることがたいせつだ。$$, $$Seja qual for a tarefa, o importante é ir até o fim.$$),
    ('n1-grammar-132', $$性別によらず、能力で評価する。$$, $$せいべつによらず、のうりょくでひょうかする。$$, $$Avaliamos pela capacidade, independentemente do sexo.$$),
    ('n1-grammar-132', $$彼女は見かけによらず、よく食べる。$$, $$かのじょはみかけによらず、よくたべる。$$, $$Apesar da aparência, ela come bastante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この店は見かけ____、料理がおいしい。$$, $$Apesar da aparência, a comida desta loja é gostosa.$$),
        (2, $$経験の有無____、やる気のある人を採用する。$$, $$Contratamos pessoas motivadas, com ou sem experiência.$$),
        (3, $$何事____、準備が大切だ。$$, $$Seja qual for a coisa, a preparação é importante.$$),
        (4, $$国籍____、優秀な人材を集めている。$$, $$Reunimos pessoas talentosas, independentemente da nacionalidade.$$),
        (5, $$あの人は見かけ____、優しい人だ。$$, $$Apesar da aparência, aquela pessoa é gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$によらず$$),
        (2, $$によらず$$),
        (3, $$によらず$$),
        (4, $$によらず$$),
        (5, $$によらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-133 — 〜に〜を重ねて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-133',
    'grammar',
    'N1',
    $$〜に〜を重ねて$$,
    $$ni ~ wo kasanete$$,
    $$Repetidamente / Após muito / Sobre$$,
    $$に〜を重ねて indica que uma ação é repetida muitas vezes, uma sobre a outra. Equivale a "repetidamente" ou "após muito...".

A estrutura repete o mesmo substantivo, como 努力に努力を重ねて, "esforço sobre esforço", ou 改良に改良を重ねて, "melhoria sobre melhoria".

Mostra que houve muito empenho e persistência para alcançar um resultado.$$,
    $$Combinações comuns são 努力に努力を重ねて, 改良に改良を重ねて, 研究に研究を重ねて e 失敗に失敗を重ねて.

É uma expressão formal e enfática.$$,
    $$Substantivo + に + Mesmo substantivo + を重ねて$$,
    $$に〜を重ねて$$,
    $$を重ねて|を重ね$$,
    ARRAY['に', 'を', '重ねて']::text[],
    ARRAY['に〜を重ねて', 'に〜を重ね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-133', $$努力に努力を重ねて、ついに夢をかなえた。$$, $$どりょくにどりょくをかさねて、ついにゆめをかなえた。$$, $$Com esforço sobre esforço, finalmente realizou o sonho.$$),
    ('n1-grammar-133', $$改良に改良を重ねて、この商品が完成した。$$, $$かいりょうにかいりょうをかさねて、このしょうひんがかんせいした。$$, $$Após muitas melhorias, este produto ficou pronto.$$),
    ('n1-grammar-133', $$研究に研究を重ね、新しい薬が開発された。$$, $$けんきゅうにけんきゅうをかさね、あたらしいくすりがかいはつされた。$$, $$Após muita pesquisa, foi desenvolvido um novo remédio.$$),
    ('n1-grammar-133', $$失敗に失敗を重ねて、やっと成功した。$$, $$しっぱいにしっぱいをかさねて、やっとせいこうした。$$, $$Depois de fracasso sobre fracasso, finalmente deu certo.$$),
    ('n1-grammar-133', $$練習に練習を重ねて、大会に臨んだ。$$, $$れんしゅうにれんしゅうをかさねて、たいかいにのぞんだ。$$, $$Treinei repetidamente e enfrentei o campeonato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$工夫に工夫____、新しい料理を作った。$$, $$Com muita criatividade, criei um novo prato.$$),
        (2, $$苦労に苦労____、店を大きくした。$$, $$Após muito sofrimento, fiz a loja crescer.$$),
        (3, $$検討に検討____、結論を出した。$$, $$Após muita análise, chegamos a uma conclusão.$$),
        (4, $$実験に実験____、ついに成功した。$$, $$Após muitos experimentos, finalmente tivemos sucesso.$$),
        (5, $$議論に議論____、計画がまとまった。$$, $$Após muita discussão, o plano tomou forma.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を重ねて$$),
        (1, $$を重ね$$),
        (2, $$を重ねて$$),
        (2, $$を重ね$$),
        (3, $$を重ねて$$),
        (3, $$を重ね$$),
        (4, $$を重ねて$$),
        (4, $$を重ね$$),
        (5, $$を重ねて$$),
        (5, $$を重ね$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-134 — 〜にもほどがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-134',
    'grammar',
    'N1',
    $$〜にもほどがある$$,
    $$ni mo hodo ga aru$$,
    $$Tem limite / Passou dos limites / É demais$$,
    $$にもほどがある indica que algo passou do limite aceitável. Equivale a "tem limite" ou "passou dos limites".

A pessoa critica com força uma atitude exagerada. Por exemplo, "brincadeira tem limite" ou "ser tão ingênuo assim é demais".

É uma expressão emotiva, com tom de irritação ou espanto.$$,
    $$Expressões comuns são 冗談にもほどがある, ばかにもほどがある e わがままにもほどがある.

É usado para reclamar ou repreender.$$,
    $$Substantivo + にもほどがある
Adjetivo い + にもほどがある
Adjetivo な (sem な) + にもほどがある$$,
    $$にもほどがある$$,
    $$にもほどがある|にも程がある|にもほどがあります$$,
    ARRAY['に', 'も', 'ほど', 'が', 'ある']::text[],
    ARRAY['にもほどがある', 'にも程がある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-134', $$冗談にもほどがある。$$, $$じょうだんにもほどがある。$$, $$Brincadeira tem limite.$$),
    ('n1-grammar-134', $$こんな時間に電話してくるなんて、非常識にもほどがある。$$, $$こんなじかんにでんわしてくるなんて、ひじょうしきにもほどがある。$$, $$Ligar a uma hora dessas passou dos limites da falta de noção.$$),
    ('n1-grammar-134', $$人をばかにするにもほどがある。$$, $$ひとをばかにするにもほどがある。$$, $$Fazer pouco caso dos outros tem limite.$$),
    ('n1-grammar-134', $$わがままにもほどがあるよ。$$, $$わがままにもほどがあるよ。$$, $$Esse egoísmo já é demais.$$),
    ('n1-grammar-134', $$こんなに高いなんて、ぼったくりにもほどがある。$$, $$こんなにたかいなんて、ぼったくりにもほどがある。$$, $$Ser tão caro assim é um roubo que passou dos limites.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$三時間も遅れるなんて、遅刻____。$$, $$Atrasar três horas, isso passou dos limites.$$),
        (2, $$人の物を勝手に使うなんて、失礼____。$$, $$Usar as coisas dos outros sem permissão é falta de educação demais.$$),
        (3, $$そんな話を信じるなんて、お人好し____。$$, $$Acreditar numa história dessas é ingenuidade demais.$$),
        (4, $$いたずら____。$$, $$Travessura tem limite.$$),
        (5, $$一日中寝ているなんて、怠け者____。$$, $$Dormir o dia inteiro, essa preguiça já é demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にもほどがある$$),
        (1, $$にも程がある$$),
        (2, $$にもほどがある$$),
        (2, $$にも程がある$$),
        (3, $$にもほどがある$$),
        (3, $$にも程がある$$),
        (4, $$にもほどがある$$),
        (4, $$にも程がある$$),
        (5, $$にもほどがある$$),
        (5, $$にも程がある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-135 — 〜にも増して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-135',
    'grammar',
    'N1',
    $$〜にも増して$$,
    $$ni mo mashite$$,
    $$Mais do que / Ainda mais que / Acima de$$,
    $$にも増して indica que algo está num grau maior do que outra coisa que já era alta. Equivale a "mais do que" ou "ainda mais que".

Por exemplo, "este ano está ainda mais quente que no ano passado". Com palavras interrogativas, como 何にも増して, significa "acima de tudo".

É uma expressão formal.$$,
    $$Expressões comuns são 以前にも増して, 去年にも増して e 何にも増して.

É parecido com よりもっと, mas にも増して destaca que o primeiro termo já era alto.$$,
    $$Substantivo + にも増して
Palavra interrogativa + にも増して (acima de tudo)$$,
    $$にも増して$$,
    $$にも増して|にもまして$$,
    ARRAY['に', 'も', '増して']::text[],
    ARRAY['にも増して', 'にもまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-135', $$今年の夏は去年にも増して暑い。$$, $$ことしのなつはきょねんにもましてあつい。$$, $$O verão deste ano está ainda mais quente que o do ano passado.$$),
    ('n1-grammar-135', $$彼は以前にも増して、仕事に熱心になった。$$, $$かれはいぜんにもまして、しごとにねっしんになった。$$, $$Ele ficou ainda mais dedicado ao trabalho do que antes.$$),
    ('n1-grammar-135', $$何にも増して、健康が大切だ。$$, $$なににもまして、けんこうがたいせつだ。$$, $$Acima de tudo, a saúde é importante.$$),
    ('n1-grammar-135', $$今回の試験は前回にも増して難しかった。$$, $$こんかいのしけんはぜんかいにもましてむずかしかった。$$, $$A prova desta vez foi ainda mais difícil que a anterior.$$),
    ('n1-grammar-135', $$彼女は誰にも増して努力している。$$, $$かのじょはだれにもましてどりょくしている。$$, $$Ela se esforça mais do que qualquer um.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今年は例年____雪が多い。$$, $$Este ano está nevando ainda mais que nos anos anteriores.$$),
        (2, $$彼は前____元気になった。$$, $$Ele ficou ainda mais animado que antes.$$),
        (3, $$何____、家族が一番大事だ。$$, $$Acima de tudo, a família é o mais importante.$$),
        (4, $$この店は以前____人気がある。$$, $$Esta loja está ainda mais popular do que antes.$$),
        (5, $$母は誰____私のことを心配してくれる。$$, $$Minha mãe se preocupa comigo mais do que qualquer pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも増して$$),
        (1, $$にもまして$$),
        (2, $$にも増して$$),
        (2, $$にもまして$$),
        (3, $$にも増して$$),
        (3, $$にもまして$$),
        (4, $$にも増して$$),
        (4, $$にもまして$$),
        (5, $$にも増して$$),
        (5, $$にもまして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-136 — 〜には当たらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-136',
    'grammar',
    'N1',
    $$〜には当たらない$$,
    $$ni wa ataranai$$,
    $$Não há motivo para / Não é preciso / Não merece$$,
    $$には当たらない indica que não há razão para uma reação, porque a situação não é tão grave ou especial. Equivale a "não há motivo para" ou "não é preciso".

Costuma vir com verbos como surpreender-se, criticar, preocupar-se ou elogiar. Por exemplo, "não há motivo para se surpreender".

É uma expressão formal.$$,
    $$Expressões comuns são 驚くには当たらない, 非難するには当たらない e 心配するには当たらない.

Também é escrito にはあたらない.$$,
    $$Verbo (forma dicionário) + には当たらない
Substantivo (ação) + には当たらない$$,
    $$には当たらない$$,
    $$には当たらない|にはあたらない|には当たりません|にはあたりません$$,
    ARRAY['に', 'は', '当たらない']::text[],
    ARRAY['には当たらない', 'にはあたらない', 'には当たりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-136', $$彼が合格したのは、驚くには当たらない。$$, $$かれがごうかくしたのは、おどろくにはあたらない。$$, $$Não há motivo para se surpreender com a aprovação dele.$$),
    ('n1-grammar-136', $$この程度のミスは、非難するには当たらない。$$, $$このていどのミスは、ひなんするにはあたらない。$$, $$Um erro desses não merece crítica.$$),
    ('n1-grammar-136', $$子供がけんかをするのは、心配するには当たらない。$$, $$こどもがけんかをするのは、しんぱいするにはあたらない。$$, $$Não é preciso se preocupar com crianças brigando.$$),
    ('n1-grammar-136', $$彼の行動は、感心するには当たりません。$$, $$かれのこうどうは、かんしんするにはあたりません。$$, $$A atitude dele não merece admiração.$$),
    ('n1-grammar-136', $$たった一度の失敗で、落ち込むには当たらない。$$, $$たったいちどのしっぱいで、おちこむにはあたらない。$$, $$Não há motivo para ficar desanimado por um único erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が怒るのも、驚く____。$$, $$Não há motivo para se surpreender com ela ficar brava.$$),
        (2, $$それは謝る____。$$, $$Não é preciso pedir desculpas por isso.$$),
        (3, $$この結果は悲観する____。$$, $$Este resultado não é motivo para pessimismo.$$),
        (4, $$彼の判断は責める____。$$, $$A decisão dele não merece ser criticada.$$),
        (5, $$その程度のことは、褒める____。$$, $$Uma coisa dessas não merece elogio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には当たらない$$),
        (1, $$にはあたらない$$),
        (1, $$には当たりません$$),
        (2, $$には当たらない$$),
        (2, $$にはあたらない$$),
        (2, $$には当たりません$$),
        (3, $$には当たらない$$),
        (3, $$にはあたらない$$),
        (3, $$には当たりません$$),
        (4, $$には当たらない$$),
        (4, $$にはあたらない$$),
        (4, $$には当たりません$$),
        (5, $$には当たらない$$),
        (5, $$にはあたらない$$),
        (5, $$には当たりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-137 — 〜には及ばない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-137',
    'grammar',
    'N1',
    $$〜には及ばない$$,
    $$ni wa oyobanai$$,
    $$Não é necessário / Não precisa / Não chega aos pés de$$,
    $$には及ばない tem dois usos principais.

O primeiro indica que algo não é necessário, de forma educada. Equivale a "não é necessário" ou "não precisa". Por exemplo, "não precisa vir até aqui".

O segundo indica que alguém ou algo não alcança o nível de outro. Equivale a "não chega aos pés de". Por exemplo, "eu não chego aos pés dele em inglês".$$,
    $$No primeiro uso, é parecido com までもない e 必要はない.

A expressão お礼には及びません significa "não precisa agradecer".$$,
    $$Verbo (forma dicionário) + には及ばない (não é necessário)
Substantivo + には及ばない (não alcança)$$,
    $$には及ばない$$,
    $$には及ばない|には及びません|にはおよばない|に及ばない$$,
    ARRAY['に', 'は', '及ばない']::text[],
    ARRAY['には及ばない', 'には及びません', 'に及ばない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-137', $$わざわざ来ていただくには及びません。$$, $$わざわざきていただくにはおよびません。$$, $$Não é necessário vir até aqui.$$),
    ('n1-grammar-137', $$心配するには及ばないよ。$$, $$しんぱいするにはおよばないよ。$$, $$Não precisa se preocupar.$$),
    ('n1-grammar-137', $$英語では、私は彼には及ばない。$$, $$えいごでは、わたしはかれにはおよばない。$$, $$Em inglês, eu não chego aos pés dele.$$),
    ('n1-grammar-137', $$お礼には及びません。$$, $$おれいにはおよびません。$$, $$Não precisa agradecer.$$),
    ('n1-grammar-137', $$どんなに練習しても、プロには及ばない。$$, $$どんなにれんしゅうしても、プロにはおよばない。$$, $$Por mais que eu treine, não chego ao nível de um profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご返事をいただく____。$$, $$Não é necessário responder.$$),
        (2, $$この程度のけがなら、病院に行く____。$$, $$Com um machucado desses, não precisa ir ao hospital.$$),
        (3, $$料理の腕では、母____。$$, $$Na cozinha, não chego aos pés da minha mãe.$$),
        (4, $$急ぐ____。ゆっくりでいいですよ。$$, $$Não precisa ter pressa. Pode ser com calma.$$),
        (5, $$私の実力は、まだ先輩____。$$, $$Minha habilidade ainda não chega à do meu veterano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$には及ばない$$),
        (1, $$には及びません$$),
        (2, $$には及ばない$$),
        (2, $$には及びません$$),
        (3, $$には及ばない$$),
        (3, $$には及びません$$),
        (4, $$には及ばない$$),
        (4, $$には及びません$$),
        (5, $$には及ばない$$),
        (5, $$には及びません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-138 — 〜の至り
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-138',
    'grammar',
    'N1',
    $$〜の至り$$,
    $$no itari$$,
    $$Extremamente / O máximo de / Profundamente$$,
    $$の至り indica que um sentimento ou estado chegou ao grau máximo. Equivale a "extremamente" ou "o máximo de".

É usado em expressões formais de agradecimento, honra ou desculpa, como "é uma honra imensa" ou "estou profundamente envergonhado".

Também aparece em 若気の至り, que significa "imprudência da juventude".$$,
    $$Expressões comuns são 光栄の至り, 恐縮の至り, 感激の至り e 若気の至り.

É muito usado em discursos e cartas formais.$$,
    $$Substantivo + の至りだ / の至りです$$,
    $$の至り$$,
    $$の至り|のいたり$$,
    ARRAY['の', '至り']::text[],
    ARRAY['の至り', 'の至りです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-138', $$このような賞をいただき、光栄の至りです。$$, $$このようなしょうをいただき、こうえいのいたりです。$$, $$Receber um prêmio como este é uma honra imensa.$$),
    ('n1-grammar-138', $$ご迷惑をおかけして、恐縮の至りです。$$, $$ごめいわくをおかけして、きょうしゅくのいたりです。$$, $$Estou profundamente constrangido pelo transtorno causado.$$),
    ('n1-grammar-138', $$あんなことをしたのは、若気の至りだった。$$, $$あんなことをしたのは、わかげのいたりだった。$$, $$Fazer aquilo foi imprudência da juventude.$$),
    ('n1-grammar-138', $$皆様にお祝いいただき、感激の至りです。$$, $$みなさまにおいわいいただき、かんげきのいたりです。$$, $$Estou extremamente emocionado por receber as felicitações de todos.$$),
    ('n1-grammar-138', $$このような失敗をして、赤面の至りです。$$, $$このようなしっぱいをして、せきめんのいたりです。$$, $$Estou profundamente envergonhado por um erro destes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大役を任され、光栄____です。$$, $$Ser encarregado de um papel tão importante é uma honra imensa.$$),
        (2, $$お忙しいところをお越しいただき、恐縮____です。$$, $$Fico profundamente grato por ter vindo apesar de estar tão ocupado.$$),
        (3, $$昔の失敗は若気____だと思ってください。$$, $$Considere os erros do passado como imprudência da juventude.$$),
        (4, $$このような温かい言葉をいただき、感謝____です。$$, $$Receber palavras tão calorosas me deixa extremamente grato.$$),
        (5, $$こんな基本的なミスをして、汗顔____です。$$, $$Cometer um erro tão básico me deixa profundamente envergonhado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の至り$$),
        (2, $$の至り$$),
        (3, $$の至り$$),
        (4, $$の至り$$),
        (5, $$の至り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-139 — 〜の極み
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-139',
    'grammar',
    'N1',
    $$〜の極み$$,
    $$no kiwami$$,
    $$O auge de / O cúmulo de / O máximo de$$,
    $$の極み indica o grau mais alto possível de algo. Equivale a "o auge de", "o cúmulo de" ou "o máximo de".

Pode ser usado com coisas boas, como "o auge do luxo", ou ruins, como "o cúmulo do cansaço".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 贅沢の極み, 疲労の極み, 感激の極み e 無責任の極み.

É parecido com の至り, mas の極み é usado com mais tipos de palavras.$$,
    $$Substantivo + の極み
Substantivo + の極みだ / の極みに達する$$,
    $$の極み$$,
    $$の極み|のきわみ$$,
    ARRAY['の', '極み']::text[],
    ARRAY['の極み', 'の極みだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-139', $$高級ホテルで過ごす休日は、贅沢の極みだ。$$, $$こうきゅうホテルですごすきゅうじつは、ぜいたくのきわみだ。$$, $$Passar as férias num hotel de luxo é o auge da sofisticação.$$),
    ('n1-grammar-139', $$三日間寝ずに働いて、疲労の極みに達した。$$, $$みっかかんねずにはたらいて、ひろうのきわみにたっした。$$, $$Trabalhei três dias sem dormir e cheguei ao máximo do cansaço.$$),
    ('n1-grammar-139', $$彼の発言は、無責任の極みだ。$$, $$かれのはつげんは、むせきにんのきわみだ。$$, $$A declaração dele é o cúmulo da irresponsabilidade.$$),
    ('n1-grammar-139', $$夢がかなって、感激の極みです。$$, $$ゆめがかなって、かんげきのきわみです。$$, $$Realizei meu sonho e estou no auge da emoção.$$),
    ('n1-grammar-139', $$こんな結果になるとは、痛恨の極みだ。$$, $$こんなけっかになるとは、つうこんのきわみだ。$$, $$Chegar a este resultado é o máximo do arrependimento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$美しい景色を見ながらの温泉は、幸せ____だ。$$, $$Uma fonte termal com vista linda é o auge da felicidade.$$),
        (2, $$約束を破るなんて、失礼____だ。$$, $$Quebrar a promessa é o cúmulo da falta de educação.$$),
        (3, $$優勝できて、喜び____です。$$, $$Vencer o campeonato é o máximo da alegria.$$),
        (4, $$この料理は、美味____だ。$$, $$Este prato é o auge do sabor.$$),
        (5, $$試合に負けて、悔しさ____だった。$$, $$Perder a partida foi o máximo da frustração.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の極み$$),
        (1, $$のきわみ$$),
        (2, $$の極み$$),
        (2, $$のきわみ$$),
        (3, $$の極み$$),
        (3, $$のきわみ$$),
        (4, $$の極み$$),
        (4, $$のきわみ$$),
        (5, $$の極み$$),
        (5, $$のきわみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-140 — 〜のなんのって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-140',
    'grammar',
    'N1',
    $$〜のなんのって$$,
    $$no nan no tte$$,
    $$Nem te conto / Muito mesmo / Demais$$,
    $$のなんのって expressa que algo foi tão intenso que é difícil descrever com palavras. Equivale a "nem te conto" ou "muito mesmo".

É uma expressão coloquial e emotiva, usada para contar uma experiência marcante. Por exemplo, "estava frio que nem te conto".

Na fala, também aparece como のなんの.$$,
    $$Costuma ser seguido de uma frase que mostra a consequência, como "não conseguia nem me mexer".

É muito usado ao relatar experiências na fala.$$,
    $$Adjetivo い + のなんのって
Adjetivo な + な + のなんのって
Verbo (forma simples) + のなんのって$$,
    $$のなんのって$$,
    $$のなんのって|のなんの$$,
    ARRAY['の', 'なん', 'の', 'って']::text[],
    ARRAY['のなんのって', 'のなんの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-140', $$昨日は寒いのなんのって、手が動かなかった。$$, $$きのうはさむいのなんのって、てがうごかなかった。$$, $$Ontem estava frio que nem te conto, não conseguia mexer as mãos.$$),
    ('n1-grammar-140', $$あの店のラーメンはおいしいのなんのって。$$, $$あのみせのラーメンはおいしいのなんのって。$$, $$O lámen daquela loja é gostoso demais.$$),
    ('n1-grammar-140', $$子供が生まれて、うれしいのなんのって。$$, $$こどもがうまれて、うれしいのなんのって。$$, $$Meu filho nasceu e fiquei feliz que nem te conto.$$),
    ('n1-grammar-140', $$試験が難しいのなんのって、全然できなかった。$$, $$しけんがむずかしいのなんのって、ぜんぜんできなかった。$$, $$A prova foi difícil demais, não consegui fazer nada.$$),
    ('n1-grammar-140', $$彼の話が面白いのなんのって、ずっと笑っていた。$$, $$かれのはなしがおもしろいのなんのって、ずっとわらっていた。$$, $$A conversa dele foi engraçada demais, fiquei rindo o tempo todo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の山登りは疲れた____、すぐに寝てしまった。$$, $$A caminhada na montanha ontem foi cansativa demais, dormi na hora.$$),
        (2, $$その映画は怖い____、夜眠れなかった。$$, $$Esse filme foi tão assustador que não consegui dormir à noite.$$),
        (3, $$夏の東京は暑い____。$$, $$Tóquio no verão é quente que nem te conto.$$),
        (4, $$駅前はにぎやかな____、まっすぐ歩けないほどだった。$$, $$A frente da estação estava tão movimentada que mal dava para andar reto.$$),
        (5, $$歯が痛い____、何も食べられなかった。$$, $$O dente doía tanto que não consegui comer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のなんのって$$),
        (1, $$のなんの$$),
        (2, $$のなんのって$$),
        (2, $$のなんの$$),
        (3, $$のなんのって$$),
        (3, $$のなんの$$),
        (4, $$のなんのって$$),
        (4, $$のなんの$$),
        (5, $$のなんのって$$),
        (5, $$のなんの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-141 — 〜のやら / 〜ものやら / 〜ことやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-141',
    'grammar',
    'N1',
    $$〜のやら / 〜ものやら / 〜ことやら$$,
    $$no yara / mono yara / koto yara$$,
    $$Será que / Quem sabe / Não faço ideia de$$,
    $$のやら, ものやら e ことやら expressam dúvida ou incerteza, muitas vezes com preocupação. Equivalem a "será que...?" ou "não faço ideia de...".

A pessoa se pergunta algo para si mesma, sem esperar resposta. Costumam vir com palavras interrogativas, como どこ, 何, いつ ou どう. Por exemplo, "será que ele está bem?" ou "não faço ideia de onde ele foi".

É uma expressão um pouco literária e emotiva.$$,
    $$É parecido com のだろうか e かな, mas のやら expressa mais preocupação ou impaciência.

Muitas vezes termina com わからない ou 心配だ.$$,
    $$Palavra interrogativa + Verbo (forma simples) + のやら
Palavra interrogativa + Verbo (forma simples) + ものやら
Palavra interrogativa + Verbo (forma simples) + ことやら$$,
    $$のやら$$,
    $$のやら|ものやら|ことやら$$,
    ARRAY['の', 'やら']::text[],
    ARRAY['のやら', 'ものやら', 'ことやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-141', $$彼は今どこにいるのやら。$$, $$かれはいまどこにいるのやら。$$, $$Será que ele está onde agora?$$),
    ('n1-grammar-141', $$この先どうなることやら。$$, $$このさきどうなることやら。$$, $$Quem sabe o que vai acontecer daqui em diante.$$),
    ('n1-grammar-141', $$何を考えているのやら、さっぱりわからない。$$, $$なにをかんがえているのやら、さっぱりわからない。$$, $$Não faço a menor ideia do que ele está pensando.$$),
    ('n1-grammar-141', $$いつになったら終わるものやら。$$, $$いつになったらおわるものやら。$$, $$Será que isso vai acabar algum dia?$$),
    ('n1-grammar-141', $$息子は元気でやっているのやら、心配だ。$$, $$むすこはげんきでやっているのやら、しんぱいだ。$$, $$Será que meu filho está bem? Estou preocupado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの子は誰に似た____。$$, $$Será que essa criança puxou a quem?$$),
        (2, $$この仕事はいつ終わる____。$$, $$Quem sabe quando este trabalho vai terminar.$$),
        (3, $$どうすればいい____、わからない。$$, $$Não faço ideia do que devo fazer.$$),
        (4, $$彼女は何を言いたい____。$$, $$Será que ela quer dizer o quê?$$),
        (5, $$一体どうなる____。$$, $$Quem sabe o que vai acontecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のやら$$),
        (2, $$ことやら$$),
        (2, $$のやら$$),
        (2, $$ものやら$$),
        (3, $$のやら$$),
        (3, $$ものやら$$),
        (4, $$のやら$$),
        (5, $$ことやら$$),
        (5, $$のやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-142 — 〜のやら〜のやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-142',
    'grammar',
    'N1',
    $$〜のやら〜のやら$$,
    $$no yara ~ no yara$$,
    $$Se... ou se / Não sei se... ou / Entre... e$$,
    $$のやら〜のやら apresenta duas possibilidades opostas e mostra que não é possível saber qual é a certa. Equivale a "não sei se... ou se...".

Muitas vezes mostra confusão ou dificuldade em entender a atitude de alguém. Por exemplo, "não sei se ele está bravo ou se está feliz".

Costuma terminar com わからない.$$,
    $$É parecido com のか〜のか, mas のやら〜のやら é mais literário e expressa mais confusão.

Os dois elementos costumam ser opostos.$$,
    $$Verbo / Adjetivo (forma simples) + のやら + Verbo / Adjetivo (oposto) + のやら + わからない$$,
    $$のやら〜のやら$$,
    $$のやら$$,
    ARRAY['の', 'やら']::text[],
    ARRAY['のやら〜のやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-142', $$彼は怒っているのやら喜んでいるのやら、わからない。$$, $$かれはおこっているのやらよろこんでいるのやら、わからない。$$, $$Não sei se ele está bravo ou se está feliz.$$),
    ('n1-grammar-142', $$あの子は本当に聞いているのやらいないのやら。$$, $$あのこはほんとうにきいているのやらいないのやら。$$, $$Não sei se essa criança está ouvindo ou não.$$),
    ('n1-grammar-142', $$彼女は来るのやら来ないのやら、はっきりしない。$$, $$かのじょはくるのやらこないのやら、はっきりしない。$$, $$Não está claro se ela vem ou não.$$),
    ('n1-grammar-142', $$この料理はおいしいのやらまずいのやら、よくわからない味だ。$$, $$このりょうりはおいしいのやらまずいのやら、よくわからないあじだ。$$, $$Não sei se este prato é gostoso ou ruim, é um sabor estranho.$$),
    ('n1-grammar-142', $$彼は勉強しているのやら遊んでいるのやら。$$, $$かれはべんきょうしているのやらあそんでいるのやら。$$, $$Não sei se ele está estudando ou brincando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$息子はやる気があるのやらない____、わからない。$$, $$Não sei se meu filho tem vontade ou não.$$),
        (2, $$彼女は笑っている____泣いているのやら。$$, $$Não sei se ela está rindo ou chorando.$$),
        (3, $$この話は本当なのやら嘘な____。$$, $$Não sei se esta história é verdade ou mentira.$$),
        (4, $$彼は賛成なのやら反対な____、はっきり言わない。$$, $$Ele não diz claramente se é a favor ou contra.$$),
        (5, $$試験はできた____できなかったのやら、自分でもわからない。$$, $$Nem eu sei se fui bem na prova ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のやら$$),
        (2, $$のやら$$),
        (3, $$のやら$$),
        (4, $$のやら$$),
        (5, $$のやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-143 — 〜を踏まえて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-143',
    'grammar',
    'N1',
    $$〜を踏まえて$$,
    $$wo fumaete$$,
    $$Levando em conta / Com base em / Considerando$$,
    $$を踏まえて indica que algo é feito levando em conta uma informação, um resultado ou uma situação anterior. Equivale a "levando em conta" ou "com base em".

É muito usado no trabalho, em reuniões e relatórios. Por exemplo, "com base nos resultados da pesquisa, vamos pensar num novo plano".

É uma expressão formal.$$,
    $$É parecido com に基づいて e を考慮して.

Costuma vir com palavras como 結果, 経験, 意見, 現状 e 反省.$$,
    $$Substantivo + を踏まえて / を踏まえ
Substantivo + を踏まえた + Substantivo$$,
    $$を踏まえて$$,
    $$を踏まえて|を踏まえ|を踏まえた|をふまえて$$,
    ARRAY['を', '踏まえて']::text[],
    ARRAY['を踏まえて', 'を踏まえ', 'を踏まえた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-143', $$調査の結果を踏まえて、新しい計画を立てよう。$$, $$ちょうさのけっかをふまえて、あたらしいけいかくをたてよう。$$, $$Com base nos resultados da pesquisa, vamos fazer um novo plano.$$),
    ('n1-grammar-143', $$前回の反省を踏まえ、準備を進めた。$$, $$ぜんかいのはんせいをふまえ、じゅんびをすすめた。$$, $$Levando em conta as lições da última vez, avançamos com os preparativos.$$),
    ('n1-grammar-143', $$皆さんの意見を踏まえた上で、決定します。$$, $$みなさんのいけんをふまえたうえで、けっていします。$$, $$Vamos decidir depois de considerar a opinião de todos.$$),
    ('n1-grammar-143', $$現状を踏まえて、対策を考える必要がある。$$, $$げんじょうをふまえて、たいさくをかんがえるひつようがある。$$, $$É preciso pensar em medidas considerando a situação atual.$$),
    ('n1-grammar-143', $$経験を踏まえたアドバイスをもらった。$$, $$けいけんをふまえたアドバイスをもらった。$$, $$Recebi um conselho baseado na experiência.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お客様の声____、サービスを改善した。$$, $$Melhoramos o serviço levando em conta a opinião dos clientes.$$),
        (2, $$過去の失敗____、同じミスをしないようにする。$$, $$Considerando os erros do passado, vamos evitar cometer o mesmo erro.$$),
        (3, $$話し合いの結果____、方針を決めた。$$, $$Definimos a diretriz com base no resultado da conversa.$$),
        (4, $$データ____提案をしてください。$$, $$Faça uma proposta baseada nos dados.$$),
        (5, $$社会の変化____、制度を見直す。$$, $$Vamos rever o sistema levando em conta as mudanças da sociedade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を踏まえて$$),
        (1, $$を踏まえ$$),
        (1, $$をふまえて$$),
        (2, $$を踏まえて$$),
        (2, $$を踏まえ$$),
        (2, $$をふまえて$$),
        (3, $$を踏まえて$$),
        (3, $$を踏まえ$$),
        (3, $$をふまえて$$),
        (4, $$を踏まえた$$),
        (5, $$を踏まえて$$),
        (5, $$を踏まえ$$),
        (5, $$をふまえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-144 — 〜を経て
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-144',
    'grammar',
    'N1',
    $$〜を経て$$,
    $$wo hete$$,
    $$Depois de passar por / Através de / Após$$,
    $$を経て indica que algo chegou a um resultado depois de passar por uma etapa, um lugar ou um período. Equivale a "depois de passar por" ou "após".

Pode se referir a um caminho físico, como "chegar a Paris passando por Londres", ou a um processo, como "depois de várias provas, foi contratado".

É uma expressão formal.$$,
    $$É parecido com を通って e の後で, mas を経て destaca o processo ou a etapa necessária.

Costuma vir com palavras como 審査, 試験, 議論, 年月 e 段階.$$,
    $$Substantivo (lugar / etapa / período) + を経て$$,
    $$を経て$$,
    $$を経て|をへて|を経た$$,
    ARRAY['を', '経て']::text[],
    ARRAY['を経て', 'を経た']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-144', $$この飛行機はソウルを経て、東京に向かう。$$, $$このひこうきはソウルをへて、とうきょうにむかう。$$, $$Este avião vai para Tóquio passando por Seul.$$),
    ('n1-grammar-144', $$三回の面接を経て、採用が決まった。$$, $$さんかいのめんせつをへて、さいようがきまった。$$, $$Depois de passar por três entrevistas, fui contratado.$$),
    ('n1-grammar-144', $$十年の歳月を経て、橋が完成した。$$, $$じゅうねんのさいげつをへて、はしがかんせいした。$$, $$Após dez anos, a ponte ficou pronta.$$),
    ('n1-grammar-144', $$長い議論を経て、法律が成立した。$$, $$ながいぎろんをへて、ほうりつがせいりつした。$$, $$Depois de uma longa discussão, a lei foi aprovada.$$),
    ('n1-grammar-144', $$厳しい審査を経た商品だけが販売される。$$, $$きびしいしんさをへたしょうひんだけがはんばいされる。$$, $$Só são vendidos os produtos que passaram por uma avaliação rigorosa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大阪____、福岡に行く。$$, $$Vou a Fukuoka passando por Osaka.$$),
        (2, $$多くの困難____、夢を実現した。$$, $$Depois de passar por muitas dificuldades, realizou o sonho.$$),
        (3, $$試験と面接____、入学が許可された。$$, $$Após prova e entrevista, a matrícula foi aprovada.$$),
        (4, $$数年の研究____、新しい薬が開発された。$$, $$Após anos de pesquisa, foi desenvolvido um novo remédio.$$),
        (5, $$会議での承認____、計画が実行される。$$, $$Depois da aprovação na reunião, o plano será executado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を経て$$),
        (1, $$をへて$$),
        (2, $$を経て$$),
        (2, $$をへて$$),
        (3, $$を経て$$),
        (3, $$をへて$$),
        (4, $$を経て$$),
        (4, $$をへて$$),
        (5, $$を経て$$),
        (5, $$をへて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-145 — 〜を控えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-145',
    'grammar',
    'N1',
    $$〜を控えて$$,
    $$wo hikaete$$,
    $$Às vésperas de / Com... pela frente / Diante de$$,
    $$を控えて indica que um acontecimento importante está próximo. Equivale a "às vésperas de" ou "com... pela frente".

A segunda parte costuma descrever a preparação ou o estado da pessoa diante desse acontecimento. Por exemplo, "às vésperas da prova, os alunos estão nervosos".

É uma expressão formal.$$,
    $$Costuma vir com palavras como 試験, 結婚, 出発, 本番 e 選挙.

Também pode indicar um lugar próximo, como 後ろに山を控えて, "com a montanha atrás".$$,
    $$Substantivo (acontecimento / tempo) + を控えて / を控え
Substantivo + を控えた + Substantivo$$,
    $$を控えて$$,
    $$を控えて|を控え|を控えた|に控えて|に控え|をひかえて$$,
    ARRAY['を', '控えて']::text[],
    ARRAY['を控えて', 'を控え', 'を控えた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-145', $$試験を明日に控えて、学生たちは緊張している。$$, $$しけんをあしたにひかえて、がくせいたちはきんちょうしている。$$, $$Com a prova amanhã, os alunos estão nervosos.$$),
    ('n1-grammar-145', $$結婚を来月に控え、準備に忙しい。$$, $$けっこんをらいげつにひかえ、じゅんびにいそがしい。$$, $$Com o casamento no mês que vem, estou ocupado com os preparativos.$$),
    ('n1-grammar-145', $$本番を控えて、最後の練習をした。$$, $$ほんばんをひかえて、さいごのれんしゅうをした。$$, $$Às vésperas da apresentação, fizemos o último ensaio.$$),
    ('n1-grammar-145', $$選挙を控えた候補者たちは、演説を続けている。$$, $$せんきょをひかえたこうほしゃたちは、えんぜつをつづけている。$$, $$Os candidatos, com a eleição pela frente, continuam discursando.$$),
    ('n1-grammar-145', $$出発を一週間後に控えて、荷物をまとめ始めた。$$, $$しゅっぱつをいっしゅうかんごにひかえて、にもつをまとめはじめた。$$, $$Com a partida dali a uma semana, comecei a arrumar a bagagem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$卒業____、学生たちは将来について考えている。$$, $$Às vésperas da formatura, os alunos pensam no futuro.$$),
        (2, $$手術を明日に____、不安でたまらない。$$, $$Com a cirurgia amanhã, estou extremamente ansioso.$$),
        (3, $$大会____、選手たちは毎日練習している。$$, $$Com o campeonato pela frente, os atletas treinam todos os dias.$$),
        (4, $$出産____妻のために、部屋を片付けた。$$, $$Arrumei o quarto para minha esposa, que está às vésperas do parto.$$),
        (5, $$開店____、スタッフは準備に追われている。$$, $$Às vésperas da inauguração, a equipe está atarefada com os preparativos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を控えて$$),
        (1, $$を控え$$),
        (1, $$をひかえて$$),
        (2, $$控えて$$),
        (2, $$控え$$),
        (3, $$を控えて$$),
        (3, $$を控え$$),
        (3, $$をひかえて$$),
        (4, $$を控えた$$),
        (5, $$を控えて$$),
        (5, $$を控え$$),
        (5, $$をひかえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-146 — 〜をいいことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-146',
    'grammar',
    'N1',
    $$〜をいいことに$$,
    $$wo ii koto ni$$,
    $$Aproveitando-se de / Tirando proveito de / Já que$$,
    $$をいいことに indica que alguém se aproveita de uma situação para fazer algo que não deveria. Equivale a "aproveitando-se de" ou "tirando proveito de".

O tom é sempre de crítica, porque a pessoa age de forma egoísta ou desonesta. Por exemplo, "aproveitando que os pais não estavam, ele deu uma festa".

É uma expressão coloquial.$$,
    $$A segunda parte costuma ser algo que a pessoa normalmente não poderia fazer.

É parecido com に乗じて, que é mais formal.$$,
    $$Substantivo + をいいことに
Frase (forma simples) + の + をいいことに$$,
    $$をいいことに$$,
    $$をいいことに|を良いことに$$,
    ARRAY['を', 'いい', 'こと', 'に']::text[],
    ARRAY['をいいことに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-146', $$親が留守なのをいいことに、彼は友達を呼んで騒いだ。$$, $$おやがるすなのをいいことに、かれはともだちをよんでさわいだ。$$, $$Aproveitando que os pais não estavam, ele chamou os amigos e fez bagunça.$$),
    ('n1-grammar-146', $$先生が優しいのをいいことに、学生たちは宿題をしない。$$, $$せんせいがやさしいのをいいことに、がくせいたちはしゅくだいをしない。$$, $$Tirando proveito da bondade do professor, os alunos não fazem a lição.$$),
    ('n1-grammar-146', $$誰も見ていないのをいいことに、ごみを捨てた。$$, $$だれもみていないのをいいことに、ごみをすてた。$$, $$Aproveitando que ninguém estava olhando, jogou lixo no chão.$$),
    ('n1-grammar-146', $$上司が休みなのをいいことに、早く帰った。$$, $$じょうしがやすみなのをいいことに、はやくかえった。$$, $$Aproveitando a folga do chefe, fui embora cedo.$$),
    ('n1-grammar-146', $$彼の好意をいいことに、何度もお金を借りた。$$, $$かれのこういをいいことに、なんどもおかねをかりた。$$, $$Tirando proveito da gentileza dele, pedi dinheiro emprestado várias vezes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店長がいないの____、店員がさぼっている。$$, $$Aproveitando que o gerente não está, os atendentes estão enrolando.$$),
        (2, $$子供なの____、わがままを言う。$$, $$Aproveitando-se de ser criança, faz birra.$$),
        (3, $$規則があいまいなの____、勝手なことをする人がいる。$$, $$Tem gente que faz o que quer aproveitando que as regras são vagas.$$),
        (4, $$母が何も言わないの____、彼は毎晩遅く帰ってくる。$$, $$Aproveitando que a mãe não diz nada, ele volta tarde toda noite.$$),
        (5, $$雨____、ジョギングをさぼった。$$, $$Aproveitando a chuva, matei a corrida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をいいことに$$),
        (2, $$をいいことに$$),
        (3, $$をいいことに$$),
        (4, $$をいいことに$$),
        (5, $$をいいことに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-147 — 〜を顧みず / 〜も顧みず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-147',
    'grammar',
    'N1',
    $$〜を顧みず / 〜も顧みず$$,
    $$wo kaerimizu / mo kaerimizu$$,
    $$Sem se importar com / Ignorando / Sem levar em conta$$,
    $$を顧みず indica que alguém age sem pensar nas consequências ou nos riscos. Equivale a "sem se importar com" ou "ignorando".

Pode ser usado de forma positiva, para elogiar a coragem, como "salvou a criança sem se importar com o perigo", ou de forma negativa, para criticar, como "ignorando a família, só trabalhava".

É uma expressão formal.$$,
    $$Expressões comuns são 危険を顧みず, 家族を顧みず e 周囲の迷惑も顧みず.

É parecido com を気にせず e もかまわず, mas を顧みず é mais formal.$$,
    $$Substantivo + を顧みず / も顧みず
Verbo / Adjetivo (forma simples) + の + を顧みず$$,
    $$を顧みず$$,
    $$を顧みず|も顧みず|をかえりみず|もかえりみず$$,
    ARRAY['を', '顧みず']::text[],
    ARRAY['を顧みず', 'も顧みず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-147', $$彼は危険を顧みず、子供を助けた。$$, $$かれはきけんをかえりみず、こどもをたすけた。$$, $$Ele salvou a criança sem se importar com o perigo.$$),
    ('n1-grammar-147', $$父は家族を顧みず、仕事ばかりしていた。$$, $$ちちはかぞくをかえりみず、しごとばかりしていた。$$, $$Meu pai só trabalhava, ignorando a família.$$),
    ('n1-grammar-147', $$周りの迷惑も顧みず、大声で話している。$$, $$まわりのめいわくもかえりみず、おおごえではなしている。$$, $$Está falando alto sem se importar com o incômodo dos outros.$$),
    ('n1-grammar-147', $$自分の体を顧みず、働き続けた。$$, $$じぶんのからだをかえりみず、はたらきつづけた。$$, $$Continuou trabalhando sem se importar com a própria saúde.$$),
    ('n1-grammar-147', $$彼女は反対も顧みず、留学を決めた。$$, $$かのじょははんたいもかえりみず、りゅうがくをきめた。$$, $$Ela decidiu fazer intercâmbio ignorando a oposição.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$消防士は自分の命____、火の中に飛び込んだ。$$, $$O bombeiro se jogou no fogo sem se importar com a própria vida.$$),
        (2, $$彼は健康____、毎晩お酒を飲んでいる。$$, $$Ele bebe toda noite sem se importar com a saúde.$$),
        (3, $$親の心配____、彼は一人で旅に出た。$$, $$Ele viajou sozinho ignorando a preocupação dos pais.$$),
        (4, $$会社の将来____、社長は自分の利益ばかり考えた。$$, $$O presidente só pensava no próprio lucro, sem levar em conta o futuro da empresa.$$),
        (5, $$嵐の危険____、漁師たちは海に出た。$$, $$Os pescadores saíram ao mar ignorando o perigo da tempestade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を顧みず$$),
        (1, $$も顧みず$$),
        (2, $$を顧みず$$),
        (2, $$も顧みず$$),
        (3, $$も顧みず$$),
        (3, $$を顧みず$$),
        (4, $$を顧みず$$),
        (4, $$も顧みず$$),
        (5, $$を顧みず$$),
        (5, $$も顧みず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-148 — 〜を限りに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-148',
    'grammar',
    'N1',
    $$〜を限りに$$,
    $$wo kagiri ni$$,
    $$A partir de / Até / Com... como último$$,
    $$を限りに indica que algo termina em um determinado momento, e depois disso não continua mais. Equivale a "a partir de... não mais" ou "até".

Costuma vir com palavras de tempo, como hoje, este mês ou este ano. Por exemplo, "com o dia de hoje, paro de fumar".

Também aparece em 声を限りに, que significa "com toda a força da voz".$$,
    $$Expressões comuns são 今日を限りに, 今回を限りに e 本日を限りに.

É parecido com をもって, que também é formal.$$,
    $$Substantivo (tempo) + を限りに
声を限りに + Verbo$$,
    $$を限りに$$,
    $$を限りに|をかぎりに$$,
    ARRAY['を', '限り', 'に']::text[],
    ARRAY['を限りに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-148', $$今日を限りに、たばこをやめる。$$, $$きょうをかぎりに、たばこをやめる。$$, $$Com o dia de hoje, paro de fumar.$$),
    ('n1-grammar-148', $$今月を限りに、この店は閉店します。$$, $$こんげつをかぎりに、このみせはへいてんします。$$, $$Esta loja fecha ao fim deste mês.$$),
    ('n1-grammar-148', $$彼は今シーズンを限りに引退する。$$, $$かれはこんシーズンをかぎりにいんたいする。$$, $$Ele vai se aposentar com o fim desta temporada.$$),
    ('n1-grammar-148', $$声を限りに助けを求めた。$$, $$こえをかぎりにたすけをもとめた。$$, $$Pediu socorro com toda a força da voz.$$),
    ('n1-grammar-148', $$今回を限りに、もう二度と遅刻しません。$$, $$こんかいをかぎりに、もうにどとちこくしません。$$, $$A partir de agora, nunca mais vou me atrasar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$本日____、このサービスは終了いたします。$$, $$Com o dia de hoje, este serviço será encerrado.$$),
        (2, $$今年____、この大会は中止になる。$$, $$Este campeonato será encerrado com o fim deste ano.$$),
        (3, $$子供たちは声____応援した。$$, $$As crianças torceram com toda a força da voz.$$),
        (4, $$今夜____、お酒をやめることにした。$$, $$Decidi parar de beber a partir desta noite.$$),
        (5, $$この試合____、彼はチームを去る。$$, $$Com esta partida, ele deixa o time.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-148', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を限りに$$),
        (1, $$をかぎりに$$),
        (2, $$を限りに$$),
        (2, $$をかぎりに$$),
        (3, $$を限りに$$),
        (3, $$をかぎりに$$),
        (4, $$を限りに$$),
        (4, $$をかぎりに$$),
        (5, $$を限りに$$),
        (5, $$をかぎりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-149 — 〜を兼ねて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-149',
    'grammar',
    'N1',
    $$〜を兼ねて$$,
    $$wo kanete$$,
    $$Para também / Aproveitando para / Servindo também como$$,
    $$を兼ねて indica que uma ação serve a dois ou mais objetivos ao mesmo tempo. Equivale a "para também" ou "servindo também como".

Por exemplo, "faço caminhada também como exercício" ou "a viagem a trabalho serviu também de passeio".

É uma expressão comum, usada tanto na fala quanto na escrita.$$,
    $$Expressões comuns são 趣味と実益を兼ねて, 運動を兼ねて e 観光を兼ねて.

É parecido com がてら e かたがた.$$,
    $$Substantivo + を兼ねて + Verbo
Substantivo + と + Substantivo + を兼ねて$$,
    $$を兼ねて$$,
    $$を兼ねて|を兼ね|をかねて$$,
    ARRAY['を', '兼ねて']::text[],
    ARRAY['を兼ねて', 'を兼ね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-149', $$運動を兼ねて、毎朝散歩している。$$, $$うんどうをかねて、まいあささんぽしている。$$, $$Caminho toda manhã, também como exercício.$$),
    ('n1-grammar-149', $$出張と観光を兼ねて、京都に行った。$$, $$しゅっちょうとかんこうをかねて、きょうとにいった。$$, $$Fui a Kyoto a trabalho e, ao mesmo tempo, para passear.$$),
    ('n1-grammar-149', $$趣味と実益を兼ねて、家庭菜園を始めた。$$, $$しゅみとじつえきをかねて、かていさいえんをはじめた。$$, $$Comecei uma horta em casa, como hobby e também para ter benefício prático.$$),
    ('n1-grammar-149', $$この部屋は書斎と客間を兼ねている。$$, $$このへやはしょさいときゃくまをかねている。$$, $$Este quarto serve de escritório e também de quarto de hóspedes.$$),
    ('n1-grammar-149', $$お礼を兼ねて、先生の家を訪ねた。$$, $$おれいをかねて、せんせいのいえをたずねた。$$, $$Visitei a casa do professor, aproveitando para agradecer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$気分転換____、旅行に出かけた。$$, $$Saí de viagem também para mudar de ares.$$),
        (2, $$勉強____、英語の映画を見ている。$$, $$Assisto filmes em inglês também para estudar.$$),
        (3, $$下見____、会場に行ってみた。$$, $$Fui ao local também para fazer um reconhecimento.$$),
        (4, $$ダイエット____、自転車で通勤している。$$, $$Vou de bicicleta para o trabalho também para emagrecer.$$),
        (5, $$挨拶____、新しい近所の人を訪ねた。$$, $$Visitei os novos vizinhos aproveitando para me apresentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を兼ねて$$),
        (1, $$を兼ね$$),
        (1, $$をかねて$$),
        (2, $$を兼ねて$$),
        (2, $$を兼ね$$),
        (2, $$をかねて$$),
        (3, $$を兼ねて$$),
        (3, $$を兼ね$$),
        (3, $$をかねて$$),
        (4, $$を兼ねて$$),
        (4, $$を兼ね$$),
        (4, $$をかねて$$),
        (5, $$を兼ねて$$),
        (5, $$を兼ね$$),
        (5, $$をかねて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-150 — 〜を皮切りに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-150',
    'grammar',
    'N1',
    $$〜を皮切りに$$,
    $$wo kawakiri ni$$,
    $$Começando por / A partir de / Tendo como ponto de partida$$,
    $$を皮切りに indica que algo começou em um ponto e depois se espalhou ou continuou em sequência. Equivale a "começando por" ou "a partir de".

É muito usado para turnês, campanhas, eventos e séries de acontecimentos. Por exemplo, "começando por Tóquio, a banda fará shows em todo o país".

É uma expressão formal.$$,
    $$Expressões comuns são 東京公演を皮切りに e この発言を皮切りに.

É parecido com をはじめとして e から始まって.$$,
    $$Substantivo + を皮切りに / を皮切りとして
Verbo (forma simples) + の + を皮切りに$$,
    $$を皮切りに$$,
    $$を皮切りに|を皮切りとして|をかわきりに$$,
    ARRAY['を', '皮切り', 'に']::text[],
    ARRAY['を皮切りに', 'を皮切りとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-150', $$東京公演を皮切りに、全国ツアーが始まった。$$, $$とうきょうこうえんをかわきりに、ぜんこくツアーがはじまった。$$, $$Começando pelo show em Tóquio, teve início a turnê nacional.$$),
    ('n1-grammar-150', $$彼の発言を皮切りに、次々と反対意見が出た。$$, $$かれのはつげんをかわきりに、つぎつぎとはんたいいけんがでた。$$, $$A partir da declaração dele, surgiram opiniões contrárias uma atrás da outra.$$),
    ('n1-grammar-150', $$この店を皮切りとして、全国に店を増やしていく。$$, $$このみせをかわきりとして、ぜんこくにみせをふやしていく。$$, $$Tendo esta loja como ponto de partida, vamos abrir lojas no país todo.$$),
    ('n1-grammar-150', $$新商品の発売を皮切りに、キャンペーンが始まる。$$, $$しんしょうひんのはつばいをかわきりに、キャンペーンがはじまる。$$, $$A campanha começa a partir do lançamento do novo produto.$$),
    ('n1-grammar-150', $$一人が笑ったのを皮切りに、みんなが笑い出した。$$, $$ひとりがわらったのをかわきりに、みんながわらいだした。$$, $$Começando por uma pessoa que riu, todos começaram a rir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大阪____、各地で講演会を行う。$$, $$Começando por Osaka, faremos palestras em vários lugares.$$),
        (2, $$今日の会議____、話し合いが続けられる。$$, $$A partir da reunião de hoje, as conversas vão continuar.$$),
        (3, $$第一話____、シリーズ全作が放送される。$$, $$Começando pelo primeiro episódio, toda a série será transmitida.$$),
        (4, $$彼女が手を挙げたの____、多くの人が質問した。$$, $$A partir de quando ela levantou a mão, muitas pessoas fizeram perguntas.$$),
        (5, $$ニューヨーク____、世界各地で展示会が開かれる。$$, $$Começando por Nova York, haverá exposições em várias partes do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を皮切りに$$),
        (1, $$を皮切りとして$$),
        (1, $$をかわきりに$$),
        (2, $$を皮切りに$$),
        (2, $$を皮切りとして$$),
        (2, $$をかわきりに$$),
        (3, $$を皮切りに$$),
        (3, $$を皮切りとして$$),
        (3, $$をかわきりに$$),
        (4, $$を皮切りに$$),
        (4, $$を皮切りとして$$),
        (4, $$をかわきりに$$),
        (5, $$を皮切りに$$),
        (5, $$を皮切りとして$$),
        (5, $$をかわきりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-151 — 〜を機に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-151',
    'grammar',
    'N1',
    $$〜を機に$$,
    $$wo ki ni$$,
    $$Aproveitando / A partir de / Por ocasião de$$,
    $$を機に indica que um acontecimento serve como oportunidade para começar algo novo ou mudar. Equivale a "aproveitando" ou "por ocasião de".

O acontecimento costuma ser importante, como um casamento, uma mudança, uma aposentadoria ou um aniversário. Por exemplo, "aproveitando a aposentadoria, comecei a pintar".

É uma expressão formal, parecida com をきっかけに e を契機に.$$,
    $$É parecido com をきっかけに, mas を機に destaca que a pessoa aproveitou a oportunidade de forma consciente.

Também é escrito をきに.$$,
    $$Substantivo + を機に / を機として
Verbo (forma simples) + の + を機に$$,
    $$を機に$$,
    $$を機に|を機として|をきに$$,
    ARRAY['を', '機', 'に']::text[],
    ARRAY['を機に', 'を機として']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-151', $$退職を機に、絵を習い始めた。$$, $$たいしょくをきに、えをならいはじめた。$$, $$Aproveitando a aposentadoria, comecei a aprender pintura.$$),
    ('n1-grammar-151', $$結婚を機に、仕事を辞めた。$$, $$けっこんをきに、しごとをやめた。$$, $$Por ocasião do casamento, deixei o trabalho.$$),
    ('n1-grammar-151', $$入院したのを機に、生活を見直した。$$, $$にゅういんしたのをきに、せいかつをみなおした。$$, $$A partir da internação, revi meu estilo de vida.$$),
    ('n1-grammar-151', $$四十歳の誕生日を機として、健康に気をつけるようにした。$$, $$よんじゅっさいのたんじょうびをきとして、けんこうにきをつけるようにした。$$, $$Aproveitando o aniversário de quarenta anos, passei a cuidar da saúde.$$),
    ('n1-grammar-151', $$引っ越しを機に、いらない物を処分した。$$, $$ひっこしをきに、いらないものをしょぶんした。$$, $$Aproveitando a mudança, me desfiz das coisas que não precisava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$就職____、一人暮らしを始めた。$$, $$Aproveitando o primeiro emprego, comecei a morar sozinho.$$),
        (2, $$子供の誕生____、たばこをやめた。$$, $$A partir do nascimento do meu filho, parei de fumar.$$),
        (3, $$新年____、日記をつけ始めた。$$, $$Aproveitando o Ano-Novo, comecei a escrever um diário.$$),
        (4, $$会社の移転____、通勤方法を変えた。$$, $$Por ocasião da mudança da empresa, mudei o jeito de ir ao trabalho.$$),
        (5, $$病気になったの____、お酒をやめた。$$, $$A partir de quando fiquei doente, parei de beber.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を機に$$),
        (1, $$を機として$$),
        (2, $$を機に$$),
        (2, $$を機として$$),
        (3, $$を機に$$),
        (3, $$を機として$$),
        (4, $$を機に$$),
        (4, $$を機として$$),
        (5, $$を機に$$),
        (5, $$を機として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-152 — 〜を禁じ得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-152',
    'grammar',
    'N1',
    $$〜を禁じ得ない$$,
    $$wo kinjienai$$,
    $$Não conseguir conter / Não poder deixar de sentir / Ser impossível evitar$$,
    $$を禁じ得ない indica que a pessoa não consegue controlar um sentimento forte que surge naturalmente. Equivale a "não conseguir conter" ou "não poder deixar de sentir".

Costuma vir com palavras de emoção, como raiva, lágrimas, surpresa, simpatia ou indignação. Por exemplo, "não consegui conter as lágrimas".

É uma expressão muito formal, usada em discursos e textos.$$,
    $$Expressões comuns são 涙を禁じ得ない, 怒りを禁じ得ない, 同情を禁じ得ない e 驚きを禁じ得ない.

É mais formal que ずにはいられない.$$,
    $$Substantivo (sentimento) + を禁じ得ない$$,
    $$を禁じ得ない$$,
    $$を禁じ得ない|を禁じえない|を禁じ得なかった|を禁じ得ません$$,
    ARRAY['を', '禁じ得ない']::text[],
    ARRAY['を禁じ得ない', 'を禁じ得なかった', 'を禁じ得ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-152', $$被害者の話を聞いて、涙を禁じ得なかった。$$, $$ひがいしゃのはなしをきいて、なみだをきんじえなかった。$$, $$Ouvindo a história da vítima, não consegui conter as lágrimas.$$),
    ('n1-grammar-152', $$政府の対応には、怒りを禁じ得ない。$$, $$せいふのたいおうには、いかりをきんじえない。$$, $$Não consigo conter a raiva diante da resposta do governo.$$),
    ('n1-grammar-152', $$彼の不幸には、同情を禁じ得ない。$$, $$かれのふこうには、どうじょうをきんじえない。$$, $$Não posso deixar de sentir pena da desgraça dele.$$),
    ('n1-grammar-152', $$その結果には、驚きを禁じ得ません。$$, $$そのけっかには、おどろきをきんじえません。$$, $$É impossível não se surpreender com esse resultado.$$),
    ('n1-grammar-152', $$事件の真相を知り、憤りを禁じ得なかった。$$, $$じけんのしんそうをしり、いきどおりをきんじえなかった。$$, $$Ao saber a verdade do caso, não consegui conter a indignação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の努力には、感動____。$$, $$Não consigo deixar de me emocionar com o esforço dela.$$),
        (2, $$この判決には、疑問____。$$, $$Não posso deixar de questionar esta sentença.$$),
        (3, $$戦争の写真を見て、悲しみ____。$$, $$Vendo as fotos da guerra, não consegui conter a tristeza.$$),
        (4, $$あまりの無責任さに、失望____。$$, $$Não posso deixar de me decepcionar com tamanha irresponsabilidade.$$),
        (5, $$子供たちの笑顔に、喜び____。$$, $$Não consigo conter a alegria com o sorriso das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を禁じ得ない$$),
        (1, $$を禁じえない$$),
        (1, $$を禁じ得ません$$),
        (2, $$を禁じ得ない$$),
        (2, $$を禁じえない$$),
        (2, $$を禁じ得ません$$),
        (3, $$を禁じ得なかった$$),
        (4, $$を禁じ得ない$$),
        (4, $$を禁じえない$$),
        (4, $$を禁じ得ません$$),
        (5, $$を禁じ得ない$$),
        (5, $$を禁じえない$$),
        (5, $$を禁じ得ません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-153 — 〜をものともせずに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-153',
    'grammar',
    'N1',
    $$〜をものともせずに$$,
    $$wo mono tomo sezu ni$$,
    $$Sem se deixar abater por / Desafiando / Apesar de$$,
    $$をものともせずに indica que alguém enfrenta uma dificuldade sem se deixar abater por ela. Equivale a "sem se deixar abater por" ou "desafiando".

O tom é de admiração pela coragem ou força da pessoa. Por exemplo, "sem se deixar abater pela lesão, ele terminou a corrida".

É uma expressão formal, comum em notícias e relatos.$$,
    $$Não se usa para falar de si mesmo, apenas de outras pessoas.

É parecido com にもかかわらず e を顧みず, mas をものともせずに destaca a força e a coragem.$$,
    $$Substantivo + をものともせずに / をものともせず$$,
    $$をものともせずに$$,
    $$をものともせずに|をものともせず$$,
    ARRAY['を', 'もの', 'とも', 'せず', 'に']::text[],
    ARRAY['をものともせずに', 'をものともせず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-153', $$彼はけがをものともせずに、最後まで走った。$$, $$かれはけがをものともせずに、さいごまではしった。$$, $$Sem se deixar abater pela lesão, ele correu até o fim.$$),
    ('n1-grammar-153', $$選手たちは雨をものともせず、試合を続けた。$$, $$せんしゅたちはあめをものともせず、しあいをつづけた。$$, $$Desafiando a chuva, os atletas continuaram a partida.$$),
    ('n1-grammar-153', $$彼女は周囲の反対をものともせずに、夢を追い続けた。$$, $$かのじょはしゅういのはんたいをものともせずに、ゆめをおいつづけた。$$, $$Sem se deixar abater pela oposição de todos, ela continuou perseguindo o sonho.$$),
    ('n1-grammar-153', $$登山隊は吹雪をものともせず、頂上を目指した。$$, $$とざんたいはふぶきをものともせず、ちょうじょうをめざした。$$, $$A expedição seguiu rumo ao topo, desafiando a nevasca.$$),
    ('n1-grammar-153', $$彼は貧しさをものともせずに、大学を卒業した。$$, $$かれはまずしさをものともせずに、だいがくをそつぎょうした。$$, $$Apesar da pobreza, ele se formou na universidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$救助隊は危険____、現場に向かった。$$, $$A equipe de resgate foi ao local desafiando o perigo.$$),
        (2, $$彼女は病気____、仕事を続けている。$$, $$Sem se deixar abater pela doença, ela continua trabalhando.$$),
        (3, $$チームは強い相手____、勝利をつかんだ。$$, $$O time conquistou a vitória, sem se intimidar com o adversário forte.$$),
        (4, $$彼は年齢____、マラソンに挑戦した。$$, $$Desafiando a idade, ele tentou correr uma maratona.$$),
        (5, $$子供たちは寒さ____、外で元気に遊んでいる。$$, $$As crianças brincam animadas lá fora, sem se importar com o frio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をものともせずに$$),
        (1, $$をものともせず$$),
        (2, $$をものともせずに$$),
        (2, $$をものともせず$$),
        (3, $$をものともせずに$$),
        (3, $$をものともせず$$),
        (4, $$をものともせずに$$),
        (4, $$をものともせず$$),
        (5, $$をものともせずに$$),
        (5, $$をものともせず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-154 — 〜をもって / 〜をもちまして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-154',
    'grammar',
    'N1',
    $$〜をもって / 〜をもちまして$$,
    $$wo motte / wo mochimashite$$,
    $$Com / Por meio de / A partir de$$,
    $$をもって tem dois usos principais.

O primeiro indica o meio ou o método usado para fazer algo. Equivale a "com" ou "por meio de". Por exemplo, "informaremos o resultado por escrito".

O segundo indica o momento em que algo começa ou termina. Equivale a "com" ou "a partir de". Por exemplo, "com o dia de hoje, encerramos as inscrições".

をもちまして é a forma ainda mais educada, usada em anúncios e cerimônias.$$,
    $$Expressões comuns são 本日をもって, 書面をもって, 身をもって e 以上をもちまして.

É bem mais formal que で.$$,
    $$Substantivo (meio) + をもって + Verbo
Substantivo (tempo) + をもって / をもちまして + 終了する / 締め切る$$,
    $$をもって$$,
    $$をもって|をもちまして|を以て$$,
    ARRAY['を', 'もって']::text[],
    ARRAY['をもって', 'をもちまして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-154', $$本日をもって、受付を終了いたします。$$, $$ほんじつをもって、うけつけをしゅうりょういたします。$$, $$Com o dia de hoje, encerramos as inscrições.$$),
    ('n1-grammar-154', $$結果は書面をもってお知らせします。$$, $$けっかはしょめんをもっておしらせします。$$, $$Informaremos o resultado por escrito.$$),
    ('n1-grammar-154', $$以上をもちまして、本日の会議を終わります。$$, $$いじょうをもちまして、ほんじつのかいぎをおわります。$$, $$Com isso, encerramos a reunião de hoje.$$),
    ('n1-grammar-154', $$彼は身をもって、平和の大切さを示した。$$, $$かれはみをもって、へいわのたいせつさをしめした。$$, $$Ele mostrou na própria pele a importância da paz.$$),
    ('n1-grammar-154', $$三月末をもって、退職することになりました。$$, $$さんがつまつをもって、たいしょくすることになりました。$$, $$Vou me aposentar a partir do fim de março.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$これ____、式を終了いたします。$$, $$Com isto, encerramos a cerimônia.$$),
        (2, $$誠意____対応いたします。$$, $$Atenderemos com sinceridade.$$),
        (3, $$今月末____、この店は閉店します。$$, $$Esta loja fechará com o fim deste mês.$$),
        (4, $$身____経験したことは忘れない。$$, $$O que se viveu na própria pele não se esquece.$$),
        (5, $$以上____、私の発表を終わります。$$, $$Com isso, encerro a minha apresentação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をもって$$),
        (1, $$をもちまして$$),
        (2, $$をもって$$),
        (3, $$をもって$$),
        (3, $$をもちまして$$),
        (4, $$をもって$$),
        (5, $$をもって$$),
        (5, $$をもちまして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-155 — 〜をおいて〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-155',
    'grammar',
    'N1',
    $$〜をおいて〜ない$$,
    $$wo oite ~ nai$$,
    $$Ninguém além de / Só mesmo / Não há outro senão$$,
    $$をおいて〜ない indica que só existe uma pessoa ou coisa adequada para algo, e nenhuma outra. Equivale a "ninguém além de" ou "não há outro senão".

É usado para elogiar ou destacar algo como a única opção. Por exemplo, "para este trabalho, não há ninguém além dele".

É uma expressão formal.$$,
    $$Muitas vezes vem com ほかに, como をおいてほかにいない.

É usado principalmente para elogios.$$,
    $$Substantivo + をおいて + ほかに〜ない
Substantivo + をおいて + 〜はいない$$,
    $$をおいて〜ない$$,
    $$をおいて|を措いて$$,
    ARRAY['を', 'おいて', 'ない']::text[],
    ARRAY['をおいて〜ない', 'をおいてほかにない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-155', $$この仕事を任せられるのは、彼をおいてほかにいない。$$, $$このしごとをまかせられるのは、かれをおいてほかにいない。$$, $$Não há ninguém além dele a quem confiar este trabalho.$$),
    ('n1-grammar-155', $$次のリーダーは、彼女をおいて考えられない。$$, $$つぎのリーダーは、かのじょをおいてかんがえられない。$$, $$Para o próximo líder, não dá para pensar em outra pessoa senão ela.$$),
    ('n1-grammar-155', $$日本の伝統文化を学ぶなら、京都をおいてほかにない。$$, $$にほんのでんとうぶんかをまなぶなら、きょうとをおいてほかにない。$$, $$Para aprender a cultura tradicional japonesa, não há lugar como Kyoto.$$),
    ('n1-grammar-155', $$今をおいて、チャンスはない。$$, $$いまをおいて、チャンスはない。$$, $$Não há outra chance senão agora.$$),
    ('n1-grammar-155', $$この病気を治せる医者は、彼をおいていないだろう。$$, $$このびょうきをなおせるいしゃは、かれをおいていないだろう。$$, $$Provavelmente não há outro médico capaz de curar esta doença senão ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この役ができるのは、あの俳優____ほかにいない。$$, $$Ninguém além daquele ator consegue fazer este papel.$$),
        (2, $$留学するなら、今____ない。$$, $$Se for para fazer intercâmbio, não há momento melhor que agora.$$),
        (3, $$この問題を解決できるのは、専門家の彼____いない。$$, $$Não há ninguém além dele, especialista, capaz de resolver este problema.$$),
        (4, $$温泉といえば、ここ____ほかにない。$$, $$Falando de fontes termais, não há outra como esta.$$),
        (5, $$社長にふさわしい人は、彼女____考えられない。$$, $$Não dá para pensar em ninguém mais adequado para presidente senão ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をおいて$$),
        (2, $$をおいて$$),
        (3, $$をおいて$$),
        (4, $$をおいて$$),
        (5, $$をおいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-156 — 〜を押して / 〜を押し切って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-156',
    'grammar',
    'N1',
    $$〜を押して / 〜を押し切って$$,
    $$wo oshite / wo oshikitte$$,
    $$Apesar de / Contra / Passando por cima de$$,
    $$を押して e を押し切って indicam que alguém faz algo mesmo diante de um obstáculo ou de uma oposição.

を押して costuma vir com problemas físicos ou situações difíceis, como "apesar da febre, foi trabalhar".

を押し切って costuma vir com a oposição de outras pessoas, como "contra a vontade dos pais, ele se casou".

O tom pode ser de admiração ou de crítica.$$,
    $$Expressões comuns são 病気を押して, 無理を押して e 反対を押し切って.

É parecido com にもかかわらず.$$,
    $$Substantivo (dificuldade) + を押して + Verbo
Substantivo (oposição) + を押し切って + Verbo$$,
    $$を押して$$,
    $$を押して|を押し切って|をおして|を押し切り$$,
    ARRAY['を', '押して']::text[],
    ARRAY['を押して', 'を押し切って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-156', $$彼は熱を押して、会社に行った。$$, $$かれはねつをおして、かいしゃにいった。$$, $$Apesar da febre, ele foi trabalhar.$$),
    ('n1-grammar-156', $$両親の反対を押し切って、結婚した。$$, $$りょうしんのはんたいをおしきって、けっこんした。$$, $$Casei contra a vontade dos meus pais.$$),
    ('n1-grammar-156', $$病気を押して、試合に出場した。$$, $$びょうきをおして、しあいにしゅつじょうした。$$, $$Apesar da doença, participou da partida.$$),
    ('n1-grammar-156', $$彼女は周囲の反対を押し切って、会社を辞めた。$$, $$かのじょはしゅういのはんたいをおしきって、かいしゃをやめた。$$, $$Ela saiu da empresa passando por cima da oposição de todos.$$),
    ('n1-grammar-156', $$無理を押して働いたせいで、体を壊した。$$, $$むりをおしてはたらいたせいで、からだをこわした。$$, $$Por trabalhar além do limite, acabei adoecendo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$監督はけが____、指揮をとった。$$, $$Apesar da lesão, o técnico comandou o time.$$),
        (2, $$家族の反対____、彼は留学した。$$, $$Ele fez intercâmbio contra a vontade da família.$$),
        (3, $$体調不良____、彼女はステージに立った。$$, $$Apesar de não estar bem de saúde, ela subiu ao palco.$$),
        (4, $$社員の反対____、社長は計画を進めた。$$, $$O presidente seguiu com o plano passando por cima da oposição dos funcionários.$$),
        (5, $$悪天候____、船は出発した。$$, $$Apesar do mau tempo, o navio partiu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を押して$$),
        (2, $$を押し切って$$),
        (3, $$を押して$$),
        (4, $$を押し切って$$),
        (5, $$を押して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-157 — 〜を境に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-157',
    'grammar',
    'N1',
    $$〜を境に$$,
    $$wo sakai ni$$,
    $$A partir de / Desde / Tendo como marco$$,
    $$を境に indica que um acontecimento ou momento marca uma mudança clara entre antes e depois. Equivale a "a partir de" ou "tendo como marco".

A segunda parte mostra que a situação mudou muito depois daquele ponto. Por exemplo, "a partir daquele dia, ele mudou completamente".

É uma expressão comum tanto na fala quanto na escrita.$$,
    $$É parecido com をきっかけに, mas を境に destaca a divisão clara entre o antes e o depois.

Expressões comuns são あの日を境に, それを境に e 結婚を境に.$$,
    $$Substantivo + を境に / を境として
Verbo (forma simples) + の + を境に$$,
    $$を境に$$,
    $$を境に|を境として|をさかいに$$,
    ARRAY['を', '境', 'に']::text[],
    ARRAY['を境に', 'を境として']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-157', $$あの日を境に、彼は人が変わったようになった。$$, $$あのひをさかいに、かれはひとがかわったようになった。$$, $$A partir daquele dia, ele parecia outra pessoa.$$),
    ('n1-grammar-157', $$結婚を境に、生活が大きく変わった。$$, $$けっこんをさかいに、せいかつがおおきくかわった。$$, $$A partir do casamento, a vida mudou muito.$$),
    ('n1-grammar-157', $$十月を境として、急に寒くなった。$$, $$じゅうがつをさかいとして、きゅうにさむくなった。$$, $$A partir de outubro, esfriou de repente.$$),
    ('n1-grammar-157', $$その事件を境に、町の雰囲気が変わった。$$, $$そのじけんをさかいに、まちのふんいきがかわった。$$, $$A partir daquele incidente, o clima da cidade mudou.$$),
    ('n1-grammar-157', $$病気をしたのを境に、健康に気をつけるようになった。$$, $$びょうきをしたのをさかいに、けんこうにきをつけるようになった。$$, $$Desde que fiquei doente, passei a cuidar da saúde.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この試合____、チームは強くなった。$$, $$A partir desta partida, o time ficou mais forte.$$),
        (2, $$その日____、彼女は笑わなくなった。$$, $$Desde aquele dia, ela parou de sorrir.$$),
        (3, $$四十歳____、体力が落ちてきた。$$, $$A partir dos quarenta anos, minha resistência física começou a cair.$$),
        (4, $$社長が代わったの____、会社の方針が変わった。$$, $$A partir da troca de presidente, a política da empresa mudou.$$),
        (5, $$戦争____、人々の生活は一変した。$$, $$A partir da guerra, a vida das pessoas mudou completamente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を境に$$),
        (1, $$を境として$$),
        (2, $$を境に$$),
        (2, $$を境として$$),
        (3, $$を境に$$),
        (3, $$を境として$$),
        (4, $$を境に$$),
        (4, $$を境として$$),
        (5, $$を境に$$),
        (5, $$を境として$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-158 — 〜を余儀なくされる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-158',
    'grammar',
    'N1',
    $$〜を余儀なくされる$$,
    $$wo yogi naku sareru$$,
    $$Ser forçado a / Ver-se obrigado a / Não ter escolha senão$$,
    $$を余儀なくされる indica que alguém foi obrigado a fazer algo por causa de uma situação que não podia controlar. Equivale a "ser forçado a" ou "ver-se obrigado a".

A causa costuma ser um desastre, uma doença, uma crise ou outro fator externo. Por exemplo, "por causa do terremoto, os moradores foram forçados a evacuar".

É uma expressão muito formal, comum em notícias.$$,
    $$A forma ativa, を余儀なくさせる, significa "forçar alguém a".

Costuma vir com palavras como 中止, 避難, 延期, 変更 e 撤退.$$,
    $$Substantivo (ação) + を余儀なくされる
Substantivo + を余儀なくされた$$,
    $$を余儀なくされる$$,
    $$を余儀なくされ|を余儀なくさせ|をよぎなくされ$$,
    ARRAY['を', '余儀なく', 'される']::text[],
    ARRAY['を余儀なくされる', 'を余儀なくされた', 'を余儀なくさせる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-158', $$地震のため、住民は避難を余儀なくされた。$$, $$じしんのため、じゅうみんはひなんをよぎなくされた。$$, $$Por causa do terremoto, os moradores foram forçados a evacuar.$$),
    ('n1-grammar-158', $$大雨で、試合は中止を余儀なくされた。$$, $$おおあめで、しあいはちゅうしをよぎなくされた。$$, $$Por causa da chuva forte, a partida teve que ser cancelada.$$),
    ('n1-grammar-158', $$けがのため、彼は引退を余儀なくされた。$$, $$けがのため、かれはいんたいをよぎなくされた。$$, $$Por causa da lesão, ele se viu obrigado a se aposentar.$$),
    ('n1-grammar-158', $$不景気で、多くの店が閉店を余儀なくされている。$$, $$ふけいきで、おおくのみせがへいてんをよぎなくされている。$$, $$Por causa da recessão, muitas lojas estão sendo forçadas a fechar.$$),
    ('n1-grammar-158', $$計画の変更を余儀なくされた。$$, $$けいかくのへんこうをよぎなくされた。$$, $$Fomos forçados a mudar o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$台風で、飛行機は欠航____。$$, $$Por causa do tufão, os voos foram forçados a ser cancelados.$$),
        (2, $$資金不足で、工事は中断____。$$, $$Por falta de verba, a obra teve que ser interrompida.$$),
        (3, $$病気のため、彼女は入院____。$$, $$Por causa da doença, ela se viu obrigada a ser internada.$$),
        (4, $$戦争で、多くの人が移住____。$$, $$Por causa da guerra, muitas pessoas foram forçadas a migrar.$$),
        (5, $$経営悪化で、会社は人員削減____いる。$$, $$Com a piora da administração, a empresa está sendo forçada a cortar pessoal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を余儀なくされた$$),
        (2, $$を余儀なくされた$$),
        (3, $$を余儀なくされた$$),
        (4, $$を余儀なくされた$$),
        (5, $$を余儀なくされて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-159 — 〜をよそに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-159',
    'grammar',
    'N1',
    $$〜をよそに$$,
    $$wo yoso ni$$,
    $$Ignorando / Sem se importar com / Indiferente a$$,
    $$をよそに indica que alguém age sem se importar com a preocupação, as expectativas ou os sentimentos dos outros. Equivale a "ignorando" ou "indiferente a".

A primeira parte costuma ser algo que deveria ser levado em conta, como a preocupação dos pais ou as críticas. Por exemplo, "ignorando a preocupação dos pais, ele viajou sozinho".

O tom pode ser de crítica ou de surpresa.$$,
    $$Expressões comuns são 心配をよそに, 期待をよそに, 反対をよそに e 批判をよそに.

É parecido com を顧みず e を無視して.$$,
    $$Substantivo + をよそに$$,
    $$をよそに$$,
    $$をよそに|を余所に$$,
    ARRAY['を', 'よそ', 'に']::text[],
    ARRAY['をよそに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-159', $$親の心配をよそに、彼は一人で海外に行った。$$, $$おやのしんぱいをよそに、かれはひとりでかいがいにいった。$$, $$Ignorando a preocupação dos pais, ele foi sozinho para o exterior.$$),
    ('n1-grammar-159', $$周囲の期待をよそに、彼は試合に負けた。$$, $$しゅういのきたいをよそに、かれはしあいにまけた。$$, $$Contrariando as expectativas de todos, ele perdeu a partida.$$),
    ('n1-grammar-159', $$住民の反対をよそに、工事が始まった。$$, $$じゅうみんのはんたいをよそに、こうじがはじまった。$$, $$A obra começou ignorando a oposição dos moradores.$$),
    ('n1-grammar-159', $$世間の批判をよそに、社長は高い給料をもらっている。$$, $$せけんのひはんをよそに、しゃちょうはたかいきゅうりょうをもらっている。$$, $$Indiferente às críticas do público, o presidente recebe um salário alto.$$),
    ('n1-grammar-159', $$試験が近いのをよそに、弟は毎日遊んでいる。$$, $$しけんがちかいのをよそに、おとうとはまいにちあそんでいる。$$, $$Indiferente à prova que se aproxima, meu irmão brinca todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$医者の忠告____、彼はお酒を飲み続けた。$$, $$Ignorando o conselho do médico, ele continuou bebendo.$$),
        (2, $$家族の心配____、彼女は危険な山に登った。$$, $$Sem se importar com a preocupação da família, ela subiu uma montanha perigosa.$$),
        (3, $$ファンの期待____、その歌手は引退した。$$, $$Contrariando as expectativas dos fãs, a cantora se aposentou.$$),
        (4, $$みんなが忙しいの____、彼は昼寝をしている。$$, $$Indiferente a todos estarem ocupados, ele está tirando uma soneca.$$),
        (5, $$国民の不安____、政府は何もしない。$$, $$Ignorando a apreensão da população, o governo não faz nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をよそに$$),
        (2, $$をよそに$$),
        (3, $$をよそに$$),
        (4, $$をよそに$$),
        (5, $$をよそに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-160 — 〜を前提として
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-160',
    'grammar',
    'N1',
    $$〜を前提として$$,
    $$wo zentei to shite$$,
    $$Pressupondo / Tendo como premissa / Partindo do princípio de$$,
    $$を前提として indica que algo é feito tendo uma condição como base ou premissa. Equivale a "pressupondo" ou "partindo do princípio de".

Por exemplo, "namoramos pensando em casamento" ou "o plano foi feito pressupondo que haveria verba".

É uma expressão formal, comum no trabalho e em discussões.$$,
    $$A forma を前提に tem o mesmo sentido e é muito comum, como 結婚を前提に付き合う.

É parecido com を条件に.$$,
    $$Substantivo + を前提として / を前提に
Verbo (forma simples) + こと + を前提として$$,
    $$を前提として$$,
    $$を前提として|を前提に|を前提と$$,
    ARRAY['を', '前提', 'として']::text[],
    ARRAY['を前提として', 'を前提に', 'を前提とした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-160', $$結婚を前提として、付き合っています。$$, $$けっこんをぜんていとして、つきあっています。$$, $$Namoramos pensando em casamento.$$),
    ('n1-grammar-160', $$この計画は、予算が増えることを前提にしている。$$, $$このけいかくは、よさんがふえることをぜんていにしている。$$, $$Este plano parte do princípio de que o orçamento vai aumentar.$$),
    ('n1-grammar-160', $$全員が参加することを前提として、準備を進めた。$$, $$ぜんいんがさんかすることをぜんていとして、じゅんびをすすめた。$$, $$Avançamos com os preparativos pressupondo que todos participariam.$$),
    ('n1-grammar-160', $$返品しないことを前提に、値段を安くした。$$, $$へんぴんしないことをぜんていに、ねだんをやすくした。$$, $$Baixamos o preço tendo como premissa que não haveria devolução.$$),
    ('n1-grammar-160', $$話し合いは、お互いを信頼することを前提とした。$$, $$はなしあいは、おたがいをしんらいすることをぜんていとした。$$, $$A conversa partiu do princípio de que haveria confiança mútua.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$長く働くこと____、採用された。$$, $$Fui contratado pressupondo que trabalharia por muito tempo.$$),
        (2, $$留学____、英語を勉強している。$$, $$Estudo inglês tendo como premissa fazer intercâmbio.$$),
        (3, $$この議論は、事実が正しいこと____いる。$$, $$Esta discussão parte do princípio de que os fatos estão corretos.$$),
        (4, $$将来の結婚____、二人は同居を始めた。$$, $$Pensando em casamento no futuro, os dois começaram a morar juntos.$$),
        (5, $$成功すること____、計画を立てるのは危険だ。$$, $$É perigoso fazer planos pressupondo que vai dar certo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を前提として$$),
        (1, $$を前提に$$),
        (2, $$を前提として$$),
        (2, $$を前提に$$),
        (3, $$を前提として$$),
        (3, $$を前提にして$$),
        (4, $$を前提として$$),
        (4, $$を前提に$$),
        (5, $$を前提として$$),
        (5, $$を前提に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-161 — 〜思いをする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-161',
    'grammar',
    'N1',
    $$〜思いをする$$,
    $$omoi wo suru$$,
    $$Passar por / Sentir / Experimentar$$,
    $$思いをする indica que a pessoa viveu uma experiência emocional marcante, boa ou ruim. Equivale a "passar por" ou "sentir".

Costuma vir com adjetivos de sentimento, como triste, vergonhoso, solitário ou feliz. Por exemplo, "passei muita vergonha" ou "nunca mais quero passar por algo tão triste".

É uma expressão muito comum para falar de sentimentos vividos.$$,
    $$Expressões comuns são 恥ずかしい思いをする, 寂しい思いをする, 怖い思いをする e つらい思いをする.

No passado, 思いをした é muito usado para relatar experiências.$$,
    $$Adjetivo い + 思いをする
Adjetivo な + な + 思いをする
Substantivo + の + 思いをする$$,
    $$思いをする$$,
    $$思いをする|思いをした|思いをして|思いをさせ|おもいをした$$,
    ARRAY['思い', 'を', 'する']::text[],
    ARRAY['思いをする', '思いをした', '思いをさせる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-161', $$人前で転んで、恥ずかしい思いをした。$$, $$ひとまえでころんで、はずかしいおもいをした。$$, $$Caí na frente dos outros e passei muita vergonha.$$),
    ('n1-grammar-161', $$子供に寂しい思いをさせたくない。$$, $$こどもにさびしいおもいをさせたくない。$$, $$Não quero fazer meu filho se sentir sozinho.$$),
    ('n1-grammar-161', $$あんな怖い思いをしたのは初めてだ。$$, $$あんなこわいおもいをしたのははじめてだ。$$, $$Foi a primeira vez que senti um medo assim.$$),
    ('n1-grammar-161', $$留学中は、つらい思いをすることも多かった。$$, $$りゅうがくちゅうは、つらいおもいをすることもおおかった。$$, $$Durante o intercâmbio, muitas vezes passei por momentos difíceis.$$),
    ('n1-grammar-161', $$二度とこんな悔しい思いをしたくない。$$, $$にどとこんなくやしいおもいをしたくない。$$, $$Nunca mais quero sentir uma frustração dessas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$道に迷って、心細い____。$$, $$Me perdi e me senti muito desamparado.$$),
        (2, $$友達に裏切られて、悲しい____。$$, $$Fui traído por um amigo e fiquei muito triste.$$),
        (3, $$家族に心配な____させてしまった。$$, $$Acabei fazendo minha família passar por preocupação.$$),
        (4, $$彼女は子供のころ、貧しくてつらい____そうだ。$$, $$Dizem que ela passou por dificuldades na infância por ser pobre.$$),
        (5, $$優勝して、夢のような____。$$, $$Vencemos o campeonato e foi como viver um sonho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$思いをした$$),
        (2, $$思いをした$$),
        (3, $$思いを$$),
        (4, $$思いをした$$),
        (5, $$思いをした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-162 — 〜折に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-162',
    'grammar',
    'N1',
    $$〜折に$$,
    $$ori ni$$,
    $$Na ocasião de / Quando / Na oportunidade de$$,
    $$折に indica uma ocasião ou um momento, de forma formal e educada. Equivale a "na ocasião de" ou "quando".

É muito usado em cartas, e-mails formais e cumprimentos. Por exemplo, "quando vier a Tóquio, passe aqui em casa".

As formas 折には e 折の também são usadas.$$,
    $$É mais formal que 時に.

Não se usa para situações negativas, como acidentes ou desastres.

Expressões comuns são お近くにお越しの折には e 何かの折に.$$,
    $$Verbo (forma simples) + 折に / 折には
Substantivo + の + 折に / 折には$$,
    $$折に$$,
    $$折に|折には|折の|おりに$$,
    ARRAY['折', 'に']::text[],
    ARRAY['折に', '折には', '折の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-162', $$東京にお越しの折には、ぜひお立ち寄りください。$$, $$とうきょうにおこしのおりには、ぜひおたちよりください。$$, $$Quando vier a Tóquio, não deixe de passar aqui.$$),
    ('n1-grammar-162', $$先日お会いした折に、お話しした件ですが。$$, $$せんじつおあいしたおりに、おはなししたけんですが。$$, $$É sobre o assunto que mencionei quando nos encontramos outro dia.$$),
    ('n1-grammar-162', $$何かの折に、また連絡します。$$, $$なにかのおりに、またれんらくします。$$, $$Numa próxima oportunidade, entro em contato de novo.$$),
    ('n1-grammar-162', $$京都を訪ねた折に、古いお寺を見学した。$$, $$きょうとをたずねたおりに、ふるいおてらをけんがくした。$$, $$Na ocasião em que visitei Kyoto, conheci um templo antigo.$$),
    ('n1-grammar-162', $$帰国の折には、お土産を持っていきます。$$, $$きこくのおりには、おみやげをもっていきます。$$, $$Quando eu voltar ao meu país, levarei lembrancinhas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お近くにお越しの____、お声をかけてください。$$, $$Quando estiver por perto, me chame.$$),
        (2, $$前回お目にかかった____、名刺をいただきました。$$, $$Recebi seu cartão quando nos encontramos da última vez.$$),
        (3, $$今度お会いする____、詳しくご説明します。$$, $$Na próxima vez que nos encontrarmos, explicarei em detalhes.$$),
        (4, $$出張の____、取引先に挨拶に行った。$$, $$Na ocasião da viagem de negócios, fui cumprimentar um cliente.$$),
        (5, $$何かの____、思い出してください。$$, $$Lembre-se de mim numa oportunidade qualquer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$折には$$),
        (1, $$折に$$),
        (2, $$折に$$),
        (3, $$折に$$),
        (3, $$折には$$),
        (4, $$折に$$),
        (5, $$折に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-163 — およそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-163',
    'grammar',
    'N1',
    $$およそ$$,
    $$oyoso$$,
    $$Aproximadamente / Cerca de / De modo algum$$,
    $$およそ tem dois usos principais.

O primeiro, antes de números, indica uma quantidade aproximada. Equivale a "aproximadamente" ou "cerca de". Por exemplo, "leva cerca de uma hora".

O segundo, com formas negativas, reforça a negação. Equivale a "de modo algum" ou "nem um pouco". Por exemplo, "isso não tem nada a ver comigo".

É uma palavra um pouco formal.$$,
    $$No primeiro uso, é parecido com 約 e だいたい.

No segundo uso, é parecido com 全く e 全然.$$,
    $$およそ + Número
およそ + Frase negativa (reforço)$$,
    $$およそ$$,
    $$およそ|凡そ$$,
    ARRAY['およそ']::text[],
    ARRAY['およそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-163', $$駅までおよそ三十分かかる。$$, $$えきまでおよそさんじゅっぷんかかる。$$, $$Leva cerca de trinta minutos até a estação.$$),
    ('n1-grammar-163', $$参加者はおよそ百人だった。$$, $$さんかしゃはおよそひゃくにんだった。$$, $$Os participantes eram aproximadamente cem.$$),
    ('n1-grammar-163', $$それは私にはおよそ関係のない話だ。$$, $$それはわたしにはおよそかんけいのないはなしだ。$$, $$Isso não tem nada a ver comigo, de modo algum.$$),
    ('n1-grammar-163', $$この町の人口はおよそ五万人だ。$$, $$このまちのじんこうはおよそごまんにんだ。$$, $$A população desta cidade é de cerca de cinquenta mil pessoas.$$),
    ('n1-grammar-163', $$彼の考えは、およそ現実的ではない。$$, $$かれのかんがえは、およそげんじつてきではない。$$, $$A ideia dele não é nem um pouco realista.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この橋の長さは____五百メートルだ。$$, $$O comprimento desta ponte é de aproximadamente quinhentos metros.$$),
        (2, $$完成まで____一年かかる予定だ。$$, $$Está previsto levar cerca de um ano até a conclusão.$$),
        (3, $$その話は____信じられない。$$, $$Essa história é impossível de acreditar, de modo algum.$$),
        (4, $$この本は____三百ページある。$$, $$Este livro tem cerca de trezentas páginas.$$),
        (5, $$彼は____スポーツとは縁がない。$$, $$Ele não tem nenhuma ligação com esportes, de modo algum.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$およそ$$),
        (2, $$およそ$$),
        (3, $$およそ$$),
        (4, $$およそ$$),
        (5, $$およそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-164 — 〜さ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-164',
    'grammar',
    'N1',
    $$〜さ$$,
    $$sa$$,
    $$Ora / Claro que / É isso aí$$,
    $$さ, no fim da frase, é uma partícula coloquial usada para afirmar algo de forma leve, despreocupada ou um pouco confiante. Equivale a "ora", "claro que" ou "é isso aí".

Por exemplo, "vai dar tudo certo, ora" ou "claro que eu sei".

É usada principalmente por homens, em conversas informais. Também aparece no meio da frase como uma espécie de pausa, como "então, sabe...".$$,
    $$Soa casual e um pouco masculino.

Não se usa com superiores ou em situações formais.

Expressões comuns são 何とかなるさ, いいさ e そんなものさ.$$,
    $$Verbo / Adjetivo い (forma simples) + さ
Substantivo / Adjetivo な + さ
Frase + のさ / んださ$$,
    $$さ$$,
    $$るさ|いさ|のさ|のものさ|んださ|ものさ$$,
    ARRAY['さ']::text[],
    ARRAY['さ', 'のさ', 'んださ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-164', $$心配するな。何とかなるさ。$$, $$しんぱいするな。なんとかなるさ。$$, $$Não se preocupe. Vai dar tudo certo, ora.$$),
    ('n1-grammar-164', $$失敗してもいいさ。また頑張ればいい。$$, $$しっぱいしてもいいさ。またがんばればいい。$$, $$Tudo bem errar. É só tentar de novo.$$),
    ('n1-grammar-164', $$人生なんて、そんなものさ。$$, $$じんせいなんて、そんなものさ。$$, $$A vida é assim mesmo, ora.$$),
    ('n1-grammar-164', $$そのくらい、僕だってわかるさ。$$, $$そのくらい、ぼくだってわかるさ。$$, $$Isso aí até eu entendo, claro.$$),
    ('n1-grammar-164', $$彼はきっと来るさ。$$, $$かれはきっとくるさ。$$, $$Claro que ele vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大丈夫、すぐ慣れる____。$$, $$Tudo bem, você vai se acostumar logo, ora.$$),
        (2, $$気にするな。誰にでもミスはある____。$$, $$Não liga. Todo mundo erra, ora.$$),
        (3, $$いい____、もう過ぎたことだ。$$, $$Tudo bem, ora, já passou.$$),
        (4, $$明日になれば、雨もやんでいる____。$$, $$Amanhã a chuva já terá parado, é isso aí.$$),
        (5, $$それが現実というもの____。$$, $$Essa é a realidade, ora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さ$$),
        (2, $$さ$$),
        (3, $$さ$$),
        (4, $$さ$$),
        (5, $$さ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-165 — さも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-165',
    'grammar',
    'N1',
    $$さも$$,
    $$samo$$,
    $$Como se / Toda a aparência de / Bem como se$$,
    $$さも indica que alguém age ou fala como se algo fosse verdade, muitas vezes de forma exagerada ou falsa. Equivale a "como se" ou "com toda a aparência de".

Costuma vir junto com ように, そうに ou かのように. Por exemplo, "falou como se soubesse tudo".

O tom pode ser de crítica, quando a atitude parece falsa.$$,
    $$É parecido com いかにも, mas さも costuma ter um tom mais crítico, indicando fingimento.

Expressões comuns são さも知っているかのように e さもうれしそうに.$$,
    $$さも + Verbo / Adjetivo + ように / そうに
さも + Frase + かのように$$,
    $$さも$$,
    $$さも$$,
    ARRAY['さも']::text[],
    ARRAY['さも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-165', $$彼はさも知っているかのように話した。$$, $$かれはさもしっているかのようにはなした。$$, $$Ele falou como se soubesse de tudo.$$),
    ('n1-grammar-165', $$子供はさもうれしそうに笑った。$$, $$こどもはさもうれしそうにわらった。$$, $$A criança riu com toda a cara de quem estava feliz.$$),
    ('n1-grammar-165', $$彼女はさも自分がやったように言った。$$, $$かのじょはさもじぶんがやったようにいった。$$, $$Ela falou como se tivesse sido ela quem fez.$$),
    ('n1-grammar-165', $$さも困ったという顔をしている。$$, $$さもこまったというかおをしている。$$, $$Está com uma cara de quem está realmente em apuros.$$),
    ('n1-grammar-165', $$彼はさもおいしそうに食べている。$$, $$かれはさもおいしそうにたべている。$$, $$Ele está comendo com toda a cara de que está gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____自分が正しいかのように主張した。$$, $$Ele insistiu como se estivesse certo.$$),
        (2, $$犬は____眠そうにあくびをした。$$, $$O cachorro bocejou com toda a cara de sono.$$),
        (3, $$彼女は____何も知らないように振る舞った。$$, $$Ela agiu como se não soubesse de nada.$$),
        (4, $$彼は____面倒くさそうに返事をした。$$, $$Ele respondeu com toda a cara de quem estava com preguiça.$$),
        (5, $$____本当のことのように嘘をつく。$$, $$Conta mentiras como se fossem verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さも$$),
        (2, $$さも$$),
        (3, $$さも$$),
        (4, $$さも$$),
        (5, $$さも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-166 — さもないと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-166',
    'grammar',
    'N1',
    $$さもないと$$,
    $$samonai to$$,
    $$Senão / Caso contrário / Do contrário$$,
    $$さもないと indica que, se uma ação não for feita, haverá uma consequência negativa. Equivale a "senão" ou "caso contrário".

A primeira parte costuma ser um conselho ou uma ordem, e a segunda mostra o que vai acontecer se não for seguido. Por exemplo, "corra, senão vai perder o trem".

A forma さもなければ tem o mesmo sentido e é um pouco mais formal.$$,
    $$É parecido com そうしないと e でないと.

さもないと é mais coloquial, e さもなければ é mais formal.$$,
    $$Frase (conselho / ordem, com ponto final) + さもないと + Consequência negativa
Frase (com ponto final) + さもなければ + Consequência negativa$$,
    $$さもないと$$,
    $$さもないと|さもなければ|さもなくば$$,
    ARRAY['さも', 'ない', 'と']::text[],
    ARRAY['さもないと', 'さもなければ', 'さもなくば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-166', $$急ぎなさい。さもないと、電車に遅れるよ。$$, $$いそぎなさい。さもないと、でんしゃにおくれるよ。$$, $$Corra. Senão, vai perder o trem.$$),
    ('n1-grammar-166', $$早く寝なさい。さもないと、明日起きられないよ。$$, $$はやくねなさい。さもないと、あしたおきられないよ。$$, $$Vá dormir cedo. Caso contrário, não vai conseguir acordar amanhã.$$),
    ('n1-grammar-166', $$しっかり勉強しなさい。さもなければ、合格できない。$$, $$しっかりべんきょうしなさい。さもなければ、ごうかくできない。$$, $$Estude direito. Do contrário, não vai passar.$$),
    ('n1-grammar-166', $$傘を持っていきなさい。さもないと、ぬれるよ。$$, $$かさをもっていきなさい。さもないと、ぬれるよ。$$, $$Leve o guarda-chuva. Senão, vai se molhar.$$),
    ('n1-grammar-166', $$今すぐ謝りなさい。さもないと、許さない。$$, $$いますぐあやまりなさい。さもないと、ゆるさない。$$, $$Peça desculpas agora. Senão, não te perdoo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲みなさい。____、熱が下がらないよ。$$, $$Tome o remédio. Senão, a febre não vai baixar.$$),
        (2, $$ちゃんと食べなさい。____、大きくなれないよ。$$, $$Coma direito. Caso contrário, não vai crescer.$$),
        (3, $$お金を返してください。____、警察に連絡します。$$, $$Devolva o dinheiro. Do contrário, chamarei a polícia.$$),
        (4, $$早く予約しなさい。____、席がなくなるよ。$$, $$Faça a reserva logo. Senão, os lugares vão acabar.$$),
        (5, $$ゆっくり話してください。____、わかりません。$$, $$Fale devagar, por favor. Caso contrário, não entendo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さもないと$$),
        (1, $$さもなければ$$),
        (2, $$さもないと$$),
        (2, $$さもなければ$$),
        (3, $$さもないと$$),
        (3, $$さもなければ$$),
        (4, $$さもないと$$),
        (4, $$さもなければ$$),
        (5, $$さもないと$$),
        (5, $$さもなければ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-167 — さぞ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-167',
    'grammar',
    'N1',
    $$さぞ$$,
    $$sazo$$,
    $$Certamente / Imagino que / Deve ter sido muito$$,
    $$さぞ expressa uma suposição forte sobre o sentimento ou a situação de outra pessoa, com empatia. Equivale a "certamente" ou "imagino que".

A frase costuma terminar com だろう, でしょう ou ことでしょう. Por exemplo, "você deve ter ficado muito cansado".

A forma さぞかし é mais enfática.$$,
    $$Não se usa para falar de si mesmo.

É muito usado para mostrar empatia ou consideração, como さぞお疲れでしょう.$$,
    $$さぞ / さぞかし + Adjetivo / Verbo + だろう / でしょう / ことでしょう$$,
    $$さぞ$$,
    $$さぞかし|さぞ$$,
    ARRAY['さぞ']::text[],
    ARRAY['さぞ', 'さぞかし']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-167', $$長旅で、さぞお疲れでしょう。$$, $$ながたびで、さぞおつかれでしょう。$$, $$Depois de uma viagem longa, imagino que esteja muito cansado.$$),
    ('n1-grammar-167', $$息子さんが合格して、さぞうれしいことでしょう。$$, $$むすこさんがごうかくして、さぞうれしいことでしょう。$$, $$Seu filho passou, imagino que esteja muito feliz.$$),
    ('n1-grammar-167', $$一人で子供を育てるのは、さぞ大変だっただろう。$$, $$ひとりでこどもをそだてるのは、さぞたいへんだっただろう。$$, $$Criar um filho sozinho deve ter sido muito difícil.$$),
    ('n1-grammar-167', $$この景色を見たら、母もさぞかし喜ぶだろう。$$, $$このけしきをみたら、ははもさぞかしよろこぶだろう。$$, $$Se minha mãe visse esta paisagem, certamente ficaria muito feliz.$$),
    ('n1-grammar-167', $$家族と離れて、さぞ寂しいでしょう。$$, $$かぞくとはなれて、さぞさびしいでしょう。$$, $$Longe da família, imagino que se sinta muito sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$事故にあって、____怖かったでしょう。$$, $$Você sofreu um acidente, deve ter sentido muito medo.$$),
        (2, $$毎日残業で、____疲れているだろう。$$, $$Fazendo hora extra todo dia, ele certamente está muito cansado.$$),
        (3, $$ご両親も____お喜びのことでしょう。$$, $$Seus pais certamente devem estar muito felizes.$$),
        (4, $$優勝できなくて、____悔しかっただろう。$$, $$Não ter vencido deve ter sido muito frustrante.$$),
        (5, $$一人での海外生活は、____心細いことでしょう。$$, $$Morar sozinho no exterior deve ser muito solitário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さぞ$$),
        (1, $$さぞかし$$),
        (2, $$さぞ$$),
        (2, $$さぞかし$$),
        (3, $$さぞ$$),
        (3, $$さぞかし$$),
        (4, $$さぞ$$),
        (4, $$さぞかし$$),
        (5, $$さぞ$$),
        (5, $$さぞかし$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-168 — 〜始末だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-168',
    'grammar',
    'N1',
    $$〜始末だ$$,
    $$shimatsu da$$,
    $$Chegar ao ponto de / Acabar / E para piorar$$,
    $$始末だ indica que, depois de uma série de coisas ruins, a situação chegou a um resultado ainda pior. Equivale a "chegar ao ponto de" ou "acabar...".

O tom é de crítica, irritação ou desânimo. Por exemplo, "ele sempre se atrasa, e hoje chegou ao ponto de nem aparecer".

A primeira parte costuma descrever um problema que vinha se repetindo.$$,
    $$A expressão この始末だ significa "olha só no que deu".

É parecido com ことになった, mas 始末だ sempre indica um resultado ruim.$$,
    $$Verbo (forma dicionário) + 始末だ
この / その / あの + 始末だ$$,
    $$始末だ$$,
    $$始末だ|始末です|しまつだ$$,
    ARRAY['始末', 'だ']::text[],
    ARRAY['始末だ', '始末です', 'この始末だ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-168', $$彼は遅刻ばかりで、ついには無断で休む始末だ。$$, $$かれはちこくばかりで、ついにはむだんでやすむしまつだ。$$, $$Ele vivia se atrasando e acabou chegando ao ponto de faltar sem avisar.$$),
    ('n1-grammar-168', $$息子は勉強しないで、とうとう学校をやめる始末だ。$$, $$むすこはべんきょうしないで、とうとうがっこうをやめるしまつだ。$$, $$Meu filho não estudava e acabou largando a escola.$$),
    ('n1-grammar-168', $$注意したのに、この始末だ。$$, $$ちゅういしたのに、このしまつだ。$$, $$Eu avisei, e olha só no que deu.$$),
    ('n1-grammar-168', $$彼女は買い物ばかりして、借金までする始末だ。$$, $$かのじょはかいものばかりして、しゃっきんまでするしまつだ。$$, $$Ela só fazia compras e chegou ao ponto de se endividar.$$),
    ('n1-grammar-168', $$弟はゲームに夢中で、食事も忘れる始末です。$$, $$おとうとはゲームにむちゅうで、しょくじもわすれるしまつです。$$, $$Meu irmão está tão vidrado no videogame que chega a esquecer de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は酒を飲みすぎて、道で寝てしまう____。$$, $$Ele bebe demais e chega ao ponto de dormir na rua.$$),
        (2, $$夫は家事を手伝わないどころか、文句まで言う____。$$, $$Meu marido, longe de ajudar em casa, ainda reclama.$$),
        (3, $$あれほど言ったのに、この____。$$, $$Eu disse tanto, e olha só no que deu.$$),
        (4, $$子供はわがままで、ついには親を殴る____。$$, $$A criança é mimada e acabou chegando ao ponto de bater nos pais.$$),
        (5, $$彼は嘘ばかりついて、友達もいなくなる____。$$, $$Ele só conta mentiras e acabou ficando sem amigos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$始末だ$$),
        (1, $$始末です$$),
        (2, $$始末だ$$),
        (2, $$始末です$$),
        (3, $$始末だ$$),
        (3, $$始末です$$),
        (4, $$始末だ$$),
        (4, $$始末です$$),
        (5, $$始末だ$$),
        (5, $$始末です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-169 — 〜そばから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-169',
    'grammar',
    'N1',
    $$〜そばから$$,
    $$soba kara$$,
    $$Logo depois de / Mal / Assim que$$,
    $$そばから indica que, logo depois de uma ação, acontece algo que a anula ou a repete, de forma frustrante. Equivale a "logo depois de" ou "mal...".

Muitas vezes descreve situações repetitivas e irritantes. Por exemplo, "mal limpo o quarto, as crianças já bagunçam" ou "decoro as palavras e logo esqueço".

O tom é de frustração ou reclamação.$$,
    $$A ação costuma se repetir várias vezes.

É parecido com とすぐに e たとたんに, mas そばから destaca a repetição e a frustração.$$,
    $$Verbo (forma dicionário / forma た) + そばから$$,
    $$そばから$$,
    $$そばから$$,
    ARRAY['そば', 'から']::text[],
    ARRAY['そばから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-169', $$掃除するそばから、子供が散らかす。$$, $$そうじするそばから、こどもがちらかす。$$, $$Mal limpo, as crianças já bagunçam.$$),
    ('n1-grammar-169', $$覚えたそばから忘れてしまう。$$, $$おぼえたそばからわすれてしまう。$$, $$Logo depois de decorar, já esqueço.$$),
    ('n1-grammar-169', $$給料をもらうそばから、使ってしまう。$$, $$きゅうりょうをもらうそばから、つかってしまう。$$, $$Mal recebo o salário, já gasto tudo.$$),
    ('n1-grammar-169', $$注意したそばから、また同じミスをした。$$, $$ちゅういしたそばから、またおなじミスをした。$$, $$Logo depois de eu avisar, ele cometeu o mesmo erro de novo.$$),
    ('n1-grammar-169', $$雪かきをするそばから、また雪が積もる。$$, $$ゆきかきをするそばから、またゆきがつもる。$$, $$Mal tiro a neve, ela já se acumula de novo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$片付ける____、犬がおもちゃを出してくる。$$, $$Mal arrumo, o cachorro já traz os brinquedos de volta.$$),
        (2, $$お菓子を買ってくる____、子供たちが全部食べてしまう。$$, $$Mal compro doces, as crianças já comem tudo.$$),
        (3, $$洗濯した____、服が汚れる。$$, $$Logo depois de lavar, a roupa já suja.$$),
        (4, $$やめると言った____、またたばこを吸っている。$$, $$Logo depois de dizer que ia parar, já está fumando de novo.$$),
        (5, $$説明した____、また同じ質問をされた。$$, $$Logo depois de explicar, me fizeram a mesma pergunta de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そばから$$),
        (2, $$そばから$$),
        (3, $$そばから$$),
        (4, $$そばから$$),
        (5, $$そばから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-170 — 〜そびれる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-170',
    'grammar',
    'N1',
    $$〜そびれる$$,
    $$sobireru$$,
    $$Perder a chance de / Acabar não / Deixar de$$,
    $$そびれる indica que a pessoa perdeu a oportunidade de fazer algo que queria ou devia fazer. Equivale a "perder a chance de" ou "acabar não...".

Muitas vezes há arrependimento. Por exemplo, "perdi a chance de dizer obrigado" ou "acabei não almoçando".

É uma expressão coloquial, comum na fala.$$,
    $$Combinações comuns são 言いそびれる, 聞きそびれる, 食べそびれる, 寝そびれる e 買いそびれる.

É parecido com 損なう, mas そびれる é mais coloquial.$$,
    $$Verbo (forma ます sem ます) + そびれる$$,
    $$そびれる$$,
    $$そびれる|そびれた|そびれて|そびれ$$,
    ARRAY['そびれる']::text[],
    ARRAY['そびれる', 'そびれた', 'そびれて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-170', $$忙しくて、お礼を言いそびれた。$$, $$いそがしくて、おれいをいいそびれた。$$, $$Estava tão ocupado que perdi a chance de agradecer.$$),
    ('n1-grammar-170', $$会議が長引いて、昼ご飯を食べそびれた。$$, $$かいぎがながびいて、ひるごはんをたべそびれた。$$, $$A reunião se estendeu e acabei não almoçando.$$),
    ('n1-grammar-170', $$大事なことを聞きそびれてしまった。$$, $$だいじなことをききそびれてしまった。$$, $$Acabei perdendo a chance de perguntar algo importante.$$),
    ('n1-grammar-170', $$コーヒーを飲みすぎて、寝そびれた。$$, $$コーヒーをのみすぎて、ねそびれた。$$, $$Tomei café demais e acabei não conseguindo dormir.$$),
    ('n1-grammar-170', $$人気のチケットを買いそびれた。$$, $$にんきのチケットをかいそびれた。$$, $$Perdi a chance de comprar os ingressos concorridos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女に本当の気持ちを言い____。$$, $$Perdi a chance de dizer a ela o que eu realmente sentia.$$),
        (2, $$先生に質問し____しまった。$$, $$Acabei perdendo a chance de fazer uma pergunta ao professor.$$),
        (3, $$あの映画を見____。$$, $$Perdi a chance de ver aquele filme.$$),
        (4, $$夜遅くまで話していて、寝____。$$, $$Fiquei conversando até tarde e acabei não dormindo.$$),
        (5, $$駅で友達に会ったが、挨拶し____。$$, $$Encontrei um amigo na estação, mas perdi a chance de cumprimentá-lo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-170', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そびれた$$),
        (2, $$そびれて$$),
        (3, $$そびれた$$),
        (4, $$そびれた$$),
        (5, $$そびれた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-171 — 〜損なう / 〜損ねる / 〜損じる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-171',
    'grammar',
    'N1',
    $$〜損なう / 〜損ねる / 〜損じる$$,
    $$sokonau / sokoneru / sonjiru$$,
    $$Deixar de / Falhar em / Perder a chance de$$,
    $$損なう, 損ねる e 損じる, depois de outro verbo, indicam que a pessoa falhou em fazer algo ou perdeu a chance de fazer. Equivalem a "deixar de", "falhar em" ou "perder a chance de".

Por exemplo, "perdi o trem" ou "deixei de ver o filme". Também pode indicar que algo foi feito de forma errada, como "escrevi errado".

A expressão 死に損なう significa "escapar da morte por pouco".$$,
    $$Combinações comuns são 見損なう, 乗り損ねる, 言い損なう, 聞き損じる e 書き損じる.

見損なう também significa "decepcionar-se com alguém", como 君を見損なった.$$,
    $$Verbo (forma ます sem ます) + 損なう
Verbo (forma ます sem ます) + 損ねる
Verbo (forma ます sem ます) + 損じる$$,
    $$損なう$$,
    $$損なう|損なった|損ねる|損ねた|損ねて|損じる|損じた|損なって|そこなう|そこねた$$,
    ARRAY['損なう']::text[],
    ARRAY['損なう', '損ねる', '損じる', '損ねた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-171', $$寝坊して、電車に乗り損ねた。$$, $$ねぼうして、でんしゃにのりそこねた。$$, $$Dormi demais e perdi o trem.$$),
    ('n1-grammar-171', $$忙しくて、その映画を見損なった。$$, $$いそがしくて、そのえいがをみそこなった。$$, $$Estava ocupado e deixei de ver esse filme.$$),
    ('n1-grammar-171', $$大事なことを言い損ねてしまった。$$, $$だいじなことをいいそこねてしまった。$$, $$Acabei deixando de dizer algo importante.$$),
    ('n1-grammar-171', $$君を見損なったよ。$$, $$きみをみそこなったよ。$$, $$Você me decepcionou.$$),
    ('n1-grammar-171', $$手紙を書き損じたので、もう一枚ください。$$, $$てがみをかきそんじたので、もういちまいください。$$, $$Errei ao escrever a carta, me dê mais uma folha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$チャンスをつかみ____。$$, $$Perdi a chance de agarrar a oportunidade.$$),
        (2, $$最終バスに乗り____、タクシーで帰った。$$, $$Perdi o último ônibus e voltei de táxi.$$),
        (3, $$先生の説明を聞き____。$$, $$Deixei de ouvir a explicação do professor.$$),
        (4, $$ボールを受け____、点を取られた。$$, $$Falhei em pegar a bola e levamos um ponto.$$),
        (5, $$あの選手は記録を作り____。$$, $$Aquele atleta falhou em bater o recorde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$損ねた$$),
        (1, $$損なった$$),
        (2, $$損ねて$$),
        (2, $$損なって$$),
        (3, $$損ねた$$),
        (3, $$損なった$$),
        (3, $$損じた$$),
        (4, $$損ねて$$),
        (4, $$損なって$$),
        (5, $$損ねた$$),
        (5, $$損なった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-172 — 〜術がない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-172',
    'grammar',
    'N1',
    $$〜術がない$$,
    $$sube ga nai$$,
    $$Não há como / Não há meio de / Não tem jeito de$$,
    $$術がない indica que não existe nenhum meio ou método para fazer algo. Equivale a "não há como" ou "não há meio de".

A pessoa se sente impotente diante da situação. Por exemplo, "não havia como ajudá-lo" ou "não tenho meio de contatá-lo".

É uma expressão formal e literária.$$,
    $$Também é escrito すべがない.

Expressões comuns são なす術がない, 知る術がない e 連絡する術がない.

なす術もなく significa "sem poder fazer nada".$$,
    $$Verbo (forma dicionário) + 術がない
Verbo (forma dicionário) + 術もない$$,
    $$術がない$$,
    $$術がない|術もない|術もなく|術がなかった|術もなかった|すべがない|すべもなく$$,
    ARRAY['術', 'が', 'ない']::text[],
    ARRAY['術がない', '術もない', '術もなく', 'すべがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-172', $$大きな災害の前に、人々はなす術がなかった。$$, $$おおきなさいがいのまえに、ひとびとはなすすべがなかった。$$, $$Diante do grande desastre, as pessoas não tinham o que fazer.$$),
    ('n1-grammar-172', $$彼の居場所を知る術がない。$$, $$かれのいばしょをしるすべがない。$$, $$Não há como saber onde ele está.$$),
    ('n1-grammar-172', $$電話もメールも通じず、連絡する術がない。$$, $$でんわもメールもつうじず、れんらくするすべがない。$$, $$Nem telefone nem e-mail funcionam, não há meio de entrar em contato.$$),
    ('n1-grammar-172', $$強い相手に、なす術もなく負けた。$$, $$つよいあいてに、なすすべもなくまけた。$$, $$Perdemos para o adversário forte sem poder fazer nada.$$),
    ('n1-grammar-172', $$今となっては、確かめる術もない。$$, $$いまとなっては、たしかめるすべもない。$$, $$A esta altura, não há mais como confirmar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$火の勢いが強く、消防士もなす____。$$, $$O fogo estava tão forte que nem os bombeiros tinham o que fazer.$$),
        (2, $$昔のことなので、真実を知る____。$$, $$Como é coisa antiga, não há como saber a verdade.$$),
        (3, $$彼の気持ちを変える____。$$, $$Não há meio de mudar o sentimento dele.$$),
        (4, $$病気が進んで、医者もなす____。$$, $$A doença avançou e nem o médico tinha o que fazer.$$),
        (5, $$チームは相手の攻撃に、なす____敗れた。$$, $$O time perdeu para o ataque do adversário sem poder fazer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$術がなかった$$),
        (1, $$術もなかった$$),
        (2, $$術がない$$),
        (2, $$術もない$$),
        (2, $$すべがない$$),
        (3, $$術がない$$),
        (3, $$術もない$$),
        (3, $$すべがない$$),
        (4, $$術がなかった$$),
        (4, $$術もなかった$$),
        (5, $$術もなく$$),
        (5, $$すべもなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-173 — 〜すら / 〜ですら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-173',
    'grammar',
    'N1',
    $$〜すら / 〜ですら$$,
    $$sura / desura$$,
    $$Nem mesmo / Até mesmo / Nem sequer$$,
    $$すら e ですら destacam um exemplo extremo para mostrar que algo é surpreendente. Equivalem a "nem mesmo" ou "até mesmo".

Com frases negativas, mostram que nem o mínimo foi feito, como "não tenho nem tempo para dormir". Com frases afirmativas, mostram que até o caso mais improvável acontece, como "até as crianças sabem disso".

É uma forma mais formal e literária de さえ.$$,
    $$É parecido com さえ, mas すら é mais formal e enfático.

Com partículas, também aparece como にすら ou とすら.$$,
    $$Substantivo + すら / ですら
Substantivo + に + すら
Verbo (forma ます sem ます) + すら + しない$$,
    $$すら$$,
    $$すら|ですら$$,
    ARRAY['すら']::text[],
    ARRAY['すら', 'ですら', 'にすら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-173', $$忙しくて、寝る時間すらない。$$, $$いそがしくて、ねるじかんすらない。$$, $$Estou tão ocupado que não tenho nem tempo para dormir.$$),
    ('n1-grammar-173', $$そんなことは子供ですら知っている。$$, $$そんなことはこどもですらしっている。$$, $$Até as crianças sabem disso.$$),
    ('n1-grammar-173', $$彼は自分の名前すら書けなかった。$$, $$かれはじぶんのなまえすらかけなかった。$$, $$Ele não conseguia escrever nem o próprio nome.$$),
    ('n1-grammar-173', $$先生ですら、この問題は解けなかった。$$, $$せんせいですら、このもんだいはとけなかった。$$, $$Nem mesmo o professor conseguiu resolver este problema.$$),
    ('n1-grammar-173', $$彼女は私に挨拶すらしない。$$, $$かのじょはわたしにあいさつすらしない。$$, $$Ela nem sequer me cumprimenta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れて、立つこと____できなかった。$$, $$Estava tão cansado que nem conseguia ficar de pé.$$),
        (2, $$専門家____、この現象は説明できない。$$, $$Nem mesmo os especialistas conseguem explicar este fenômeno.$$),
        (3, $$彼はお礼の言葉____言わなかった。$$, $$Ele nem sequer disse uma palavra de agradecimento.$$),
        (4, $$この漢字は、日本人____読めない人が多い。$$, $$Muitos japoneses, até mesmo eles, não conseguem ler este kanji.$$),
        (5, $$一円____持っていない。$$, $$Não tenho nem um iene.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$すら$$),
        (2, $$ですら$$),
        (3, $$すら$$),
        (4, $$ですら$$),
        (5, $$すら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-174 — 〜た弾みに / 〜た拍子に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-174',
    'grammar',
    'N1',
    $$〜た弾みに / 〜た拍子に$$,
    $$ta hazumi ni / ta hyoushi ni$$,
    $$No impulso de / No momento em que / Com o movimento de$$,
    $$た弾みに e た拍子に indicam que, no exato momento de uma ação, algo inesperado aconteceu como consequência. Equivalem a "no momento em que" ou "com o movimento de".

O resultado costuma ser um acidente ou algo não intencional. Por exemplo, "quando caí, quebrei os óculos" ou "no momento em que me levantei, bati a cabeça".

São expressões comuns para descrever acidentes.$$,
    $$Também aparecem como 弾みで e 拍子で.

A expressão 何かの弾みで significa "por algum motivo inesperado".$$,
    $$Verbo (forma た) + 弾みに / 拍子に
Substantivo + の + 弾みで$$,
    $$た弾みに$$,
    $$弾みに|拍子に|弾みで|拍子で|はずみに|ひょうしに$$,
    ARRAY['た', '弾み', 'に']::text[],
    ARRAY['た弾みに', 'た拍子に', '弾みで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-174', $$転んだ弾みに、眼鏡が壊れた。$$, $$ころんだはずみに、めがねがこわれた。$$, $$Quando caí, os óculos quebraram.$$),
    ('n1-grammar-174', $$立ち上がった拍子に、頭をぶつけた。$$, $$たちあがったひょうしに、あたまをぶつけた。$$, $$No momento em que me levantei, bati a cabeça.$$),
    ('n1-grammar-174', $$車が急に止まった弾みで、荷物が落ちた。$$, $$くるまがきゅうにとまったはずみで、にもつがおちた。$$, $$Com a freada brusca do carro, a bagagem caiu.$$),
    ('n1-grammar-174', $$くしゃみをした拍子に、腰を痛めた。$$, $$くしゃみをしたひょうしに、こしをいためた。$$, $$No momento em que espirrei, machuquei as costas.$$),
    ('n1-grammar-174', $$何かの弾みで、ドアが開いてしまった。$$, $$なにかのはずみで、ドアがあいてしまった。$$, $$Por algum motivo inesperado, a porta acabou abrindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ぶつかった____、コーヒーをこぼしてしまった。$$, $$No momento em que esbarrei, derrubei o café.$$),
        (2, $$振り向いた____、財布を落とした。$$, $$No momento em que me virei, deixei cair a carteira.$$),
        (3, $$電車が揺れた____、隣の人の足を踏んだ。$$, $$Com o balanço do trem, pisei no pé de quem estava ao lado.$$),
        (4, $$ボールを蹴った____、靴が飛んでいった。$$, $$No momento em que chutei a bola, o sapato saiu voando.$$),
        (5, $$座った____、椅子が壊れた。$$, $$No momento em que sentei, a cadeira quebrou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$弾みに$$),
        (1, $$拍子に$$),
        (2, $$弾みに$$),
        (2, $$拍子に$$),
        (3, $$弾みに$$),
        (3, $$拍子に$$),
        (3, $$弾みで$$),
        (4, $$弾みに$$),
        (4, $$拍子に$$),
        (5, $$弾みに$$),
        (5, $$拍子に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-175 — 〜たことにする / 〜たことになる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-175',
    'grammar',
    'N1',
    $$〜たことにする / 〜たことになる$$,
    $$ta koto ni suru / ta koto ni naru$$,
    $$Fazer de conta que / Considerar que / Ser considerado como$$,
    $$たことにする e たことになる tratam algo como se tivesse acontecido, mesmo que não seja totalmente verdade.

たことにする indica que a pessoa decide considerar algo de uma forma, muitas vezes fingindo. Equivale a "fazer de conta que". Por exemplo, "vamos fazer de conta que não ouvimos nada".

たことになる indica que, por algum critério, algo passa a ser considerado assim. Equivale a "ser considerado como". Por exemplo, "se você não avisar, será considerado como ausente".$$,
    $$A forma なかったことにする é muito usada, com o sentido de "esquecer o que aconteceu".

Também pode indicar um cálculo, como "isso significa que...".$$,
    $$Verbo (forma た / なかった) + ことにする
Verbo (forma た / なかった) + ことになる$$,
    $$たことにする$$,
    $$たことにする|たことにします|たことにして|たことにしよう|たことになる|たことになります|だことになる|だことになります$$,
    ARRAY['た', 'こと', 'に', 'する']::text[],
    ARRAY['たことにする', 'たことになる', 'なかったことにする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-175', $$今の話は聞かなかったことにします。$$, $$いまのはなしはきかなかったことにします。$$, $$Vou fazer de conta que não ouvi o que acabou de dizer.$$),
    ('n1-grammar-175', $$この件は、なかったことにしよう。$$, $$このけんは、なかったことにしよう。$$, $$Vamos fazer de conta que isso não aconteceu.$$),
    ('n1-grammar-175', $$連絡しなければ、欠席したことになる。$$, $$れんらくしなければ、けっせきしたことになる。$$, $$Se não avisar, será considerado como ausente.$$),
    ('n1-grammar-175', $$書類を出せば、申し込んだことになります。$$, $$しょるいをだせば、もうしこんだことになります。$$, $$Entregando os documentos, a inscrição será considerada feita.$$),
    ('n1-grammar-175', $$彼が来たことにして、話を進めよう。$$, $$かれがきたことにして、はなしをすすめよう。$$, $$Vamos fazer de conta que ele veio e continuar a conversa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日のことは、見なかった____。$$, $$Vou fazer de conta que não vi o que aconteceu hoje.$$),
        (2, $$この約束は、なかった____。$$, $$Vamos considerar que esta promessa nunca existiu.$$),
        (3, $$十時までに来なければ、遅刻した____。$$, $$Se não chegar até as dez, será considerado atrasado.$$),
        (4, $$サインをすれば、契約に同意した____。$$, $$Assinando, será considerado que concordou com o contrato.$$),
        (5, $$私が払った____、みんなで食べよう。$$, $$Façam de conta que eu paguei e vamos comer todos juntos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにする$$),
        (1, $$ことにします$$),
        (2, $$ことにしよう$$),
        (2, $$ことにする$$),
        (3, $$ことになる$$),
        (3, $$ことになります$$),
        (4, $$ことになる$$),
        (4, $$ことになります$$),
        (5, $$ことにして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-176 — 〜たところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-176',
    'grammar',
    'N1',
    $$〜たところで$$,
    $$ta tokoro de$$,
    $$Mesmo que / Por mais que / Não adianta$$,
    $$たところで indica que, mesmo que alguém faça algo, o resultado esperado não vai acontecer. Equivale a "mesmo que" ou "não adianta".

A segunda parte costuma ser negativa ou mostrar que algo é inútil. Por exemplo, "mesmo que corra agora, não vai dar tempo".

Muitas vezes vem com palavras interrogativas, como どんなに ou いくら.$$,
    $$É parecido com ても, mas たところで destaca que a ação é inútil.

Não se confunde com たところ, que significa "quando fiz...".$$,
    $$Verbo (forma た) + ところで + Resultado negativo
Palavra interrogativa + Verbo (forma た) + ところで$$,
    $$たところで$$,
    $$たところで|だところで$$,
    ARRAY['た', 'ところ', 'で']::text[],
    ARRAY['たところで', 'だところで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-176', $$今から急いだところで、間に合わない。$$, $$いまからいそいだところで、まにあわない。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-176', $$彼に説明したところで、わかってくれないだろう。$$, $$かれにせつめいしたところで、わかってくれないだろう。$$, $$Mesmo que eu explique, ele provavelmente não vai entender.$$),
    ('n1-grammar-176', $$いくら悩んだところで、答えは出ない。$$, $$いくらなやんだところで、こたえはでない。$$, $$Por mais que se angustie, não vai encontrar a resposta.$$),
    ('n1-grammar-176', $$謝ったところで、許してもらえないだろう。$$, $$あやまったところで、ゆるしてもらえないだろう。$$, $$Mesmo que peça desculpas, provavelmente não vai ser perdoado.$$),
    ('n1-grammar-176', $$どんなに頼んだところで、彼は手伝わない。$$, $$どんなにたのんだところで、かれはてつだわない。$$, $$Por mais que eu peça, ele não vai ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今さら後悔し____、もう遅い。$$, $$Mesmo que se arrependa agora, já é tarde.$$),
        (2, $$一人で頑張っ____、この仕事は終わらない。$$, $$Mesmo se esforçando sozinho, este trabalho não vai terminar.$$),
        (3, $$文句を言っ____、何も変わらない。$$, $$Não adianta reclamar, nada vai mudar.$$),
        (4, $$いくら読ん____、この本は理解できない。$$, $$Por mais que eu leia, não consigo entender este livro.$$),
        (5, $$彼に頼んで____、無駄だよ。$$, $$Mesmo que peça a ele, é inútil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たところで$$),
        (2, $$たところで$$),
        (3, $$たところで$$),
        (4, $$だところで$$),
        (5, $$みたところで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-177 — 〜たつもりはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-177',
    'grammar',
    'N1',
    $$〜たつもりはない$$,
    $$ta tsumori wa nai$$,
    $$Não tive a intenção de / Não foi minha intenção / Não acho que$$,
    $$たつもりはない indica que a pessoa não teve a intenção de fazer algo, ou não acha que fez algo, mesmo que os outros pensem o contrário. Equivale a "não tive a intenção de" ou "não acho que fiz".

Muitas vezes é usado para se defender ou explicar um mal-entendido. Por exemplo, "não tive a intenção de magoá-la".

É uma expressão comum na fala.$$,
    $$É diferente de つもりはない com a forma dicionário, que significa "não pretendo fazer".

A forma たつもりだ significa "acho que fiz" ou "fiz de conta que".$$,
    $$Verbo (forma た) + つもりはない
Verbo (forma た) + つもりはありません$$,
    $$たつもりはない$$,
    $$たつもりはない|たつもりはありません|だつもりはない|たつもりはなかった$$,
    ARRAY['た', 'つもり', 'は', 'ない']::text[],
    ARRAY['たつもりはない', 'たつもりはありません', 'たつもりはなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-177', $$彼女を傷つけたつもりはない。$$, $$かのじょをきずつけたつもりはない。$$, $$Não tive a intenção de magoá-la.$$),
    ('n1-grammar-177', $$失礼なことを言ったつもりはありません。$$, $$しつれいなことをいったつもりはありません。$$, $$Não foi minha intenção dizer algo rude.$$),
    ('n1-grammar-177', $$嘘をついたつもりはなかったんです。$$, $$うそをついたつもりはなかったんです。$$, $$Não tive a intenção de mentir.$$),
    ('n1-grammar-177', $$怒ったつもりはないけど、そう見えたかな。$$, $$おこったつもりはないけど、そうみえたかな。$$, $$Não acho que fiquei bravo, mas será que pareceu?$$),
    ('n1-grammar-177', $$彼をだましたつもりはない。$$, $$かれをだましたつもりはない。$$, $$Não tive a intenção de enganá-lo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$悪口を言っ____。$$, $$Não tive a intenção de falar mal.$$),
        (2, $$あなたを責め____。$$, $$Não foi minha intenção culpar você.$$),
        (3, $$命令し____が、そう聞こえたらごめんなさい。$$, $$Não tive a intenção de dar uma ordem, mas me desculpe se soou assim.$$),
        (4, $$ばかにし____んです。$$, $$Não tive a intenção de fazer pouco caso.$$),
        (5, $$約束を破っ____。$$, $$Não acho que quebrei a promessa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たつもりはない$$),
        (1, $$たつもりはありません$$),
        (2, $$たつもりはない$$),
        (2, $$たつもりはありません$$),
        (3, $$たつもりはない$$),
        (4, $$たつもりはなかった$$),
        (5, $$たつもりはない$$),
        (5, $$たつもりはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-178 — ただ〜のみだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-178',
    'grammar',
    'N1',
    $$ただ〜のみだ$$,
    $$tada ~ nomi da$$,
    $$Só resta / Apenas / Não há nada a fazer senão$$,
    $$ただ〜のみだ indica que só resta uma única ação ou possibilidade. Equivale a "só resta" ou "apenas".

É usado para mostrar determinação ou resignação. Por exemplo, "agora só resta esperar o resultado" ou "só resta dar o meu melhor".

É uma expressão formal, mais forte que だけだ.$$,
    $$É uma forma formal de ただ〜だけだ.

Também aparece como ただ〜のみである, ainda mais formal.$$,
    $$ただ + Verbo (forma dicionário) + のみだ
ただ + Substantivo + のみだ$$,
    $$ただ〜のみだ$$,
    $$のみだ|のみです|のみである$$,
    ARRAY['ただ', 'のみ', 'だ']::text[],
    ARRAY['ただ〜のみだ', 'ただ〜のみです', 'ただ〜のみである']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-178', $$準備はすべて終わった。あとはただ待つのみだ。$$, $$じゅんびはすべておわった。あとはただまつのみだ。$$, $$Os preparativos terminaram. Agora só resta esperar.$$),
    ('n1-grammar-178', $$ここまで来たら、ただ前に進むのみだ。$$, $$ここまできたら、ただまえにすすむのみだ。$$, $$Chegando até aqui, só resta seguir em frente.$$),
    ('n1-grammar-178', $$結果はわからない。ただ全力を尽くすのみです。$$, $$けっかはわからない。ただぜんりょくをつくすのみです。$$, $$Não sei o resultado. Só resta dar o meu melhor.$$),
    ('n1-grammar-178', $$今はただ、彼の無事を祈るのみだ。$$, $$いまはただ、かれのぶじをいのるのみだ。$$, $$Agora só resta rezar para que ele esteja bem.$$),
    ('n1-grammar-178', $$残された道は、ただ一つのみである。$$, $$のこされたみちは、ただひとつのみである。$$, $$Resta apenas um único caminho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$できることはやった。あとはただ結果を待つ____。$$, $$Fiz o que podia. Agora só resta esperar o resultado.$$),
        (2, $$試合まであと一日。ただ練習する____。$$, $$Falta um dia para a partida. Só resta treinar.$$),
        (3, $$今の私にできるのは、ただ謝る____。$$, $$A única coisa que posso fazer agora é pedir desculpas.$$),
        (4, $$もう迷わない。ただ夢に向かって進む____。$$, $$Não vou mais hesitar. Só resta seguir rumo ao meu sonho.$$),
        (5, $$ここではただ静かに見守る____。$$, $$Aqui só resta observar em silêncio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のみだ$$),
        (1, $$のみです$$),
        (2, $$のみだ$$),
        (2, $$のみです$$),
        (3, $$のみだ$$),
        (3, $$のみです$$),
        (4, $$のみだ$$),
        (4, $$のみです$$),
        (5, $$のみだ$$),
        (5, $$のみです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-179 — 〜ためしがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-179',
    'grammar',
    'N1',
    $$〜ためしがない$$,
    $$tameshi ga nai$$,
    $$Nunca / Jamais aconteceu / Nem uma vez$$,
    $$ためしがない indica que algo nunca aconteceu, nem uma única vez, até agora. Equivale a "nunca" ou "jamais aconteceu".

O tom é de crítica ou insatisfação, geralmente sobre o comportamento de alguém. Por exemplo, "ele nunca chegou no horário".

É uma expressão coloquial.$$,
    $$É parecido com たことがない, mas ためしがない tem um tom de crítica.

Também é escrito 試しがない, mas a forma em hiragana é mais comum.$$,
    $$Verbo (forma た) + ためしがない$$,
    $$ためしがない$$,
    $$ためしがない|試しがない|ためしがありません$$,
    ARRAY['ためし', 'が', 'ない']::text[],
    ARRAY['ためしがない', '試しがない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-179', $$彼は約束の時間に来たためしがない。$$, $$かれはやくそくのじかんにきたためしがない。$$, $$Ele nunca chegou no horário combinado.$$),
    ('n1-grammar-179', $$宝くじを買っても、当たったためしがない。$$, $$たからくじをかっても、あたったためしがない。$$, $$Mesmo comprando bilhetes de loteria, nunca ganhei.$$),
    ('n1-grammar-179', $$天気予報が当たったためしがない。$$, $$てんきよほうがあたったためしがない。$$, $$A previsão do tempo nunca acertou.$$),
    ('n1-grammar-179', $$弟は部屋を片付けたためしがない。$$, $$おとうとはへやをかたづけたためしがない。$$, $$Meu irmão nunca arrumou o quarto.$$),
    ('n1-grammar-179', $$彼女は人の話を最後まで聞いたためしがない。$$, $$かのじょはひとのはなしをさいごまできいたためしがない。$$, $$Ela nunca ouviu ninguém até o fim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夫は家事を手伝った____。$$, $$Meu marido nunca ajudou nas tarefas de casa.$$),
        (2, $$この店で待たずに入れた____。$$, $$Nunca consegui entrar nesta loja sem esperar.$$),
        (3, $$彼が自分から謝った____。$$, $$Ele nunca pediu desculpas por conta própria.$$),
        (4, $$ダイエットが成功した____。$$, $$Minhas dietas nunca deram certo.$$),
        (5, $$あのチームが勝った____。$$, $$Aquele time nunca ganhou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ためしがない$$),
        (1, $$試しがない$$),
        (2, $$ためしがない$$),
        (2, $$試しがない$$),
        (3, $$ためしがない$$),
        (3, $$試しがない$$),
        (4, $$ためしがない$$),
        (4, $$試しがない$$),
        (5, $$ためしがない$$),
        (5, $$試しがない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-180 — 〜たら最後 / 〜たが最後
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-180',
    'grammar',
    'N1',
    $$〜たら最後 / 〜たが最後$$,
    $$tara saigo / ta ga saigo$$,
    $$Uma vez que / Se... acabou / Depois que... não tem volta$$,
    $$たら最後 e たが最後 indicam que, uma vez que algo acontece, a situação fica ruim e não tem mais volta. Equivale a "uma vez que..." ou "se..., acabou".

A segunda parte costuma mostrar uma consequência negativa ou algo que não pode ser parado. Por exemplo, "uma vez que ele começa a falar, não para mais".

たら最後 é mais coloquial, e たが最後 é mais formal.$$,
    $$A segunda parte costuma ter expressões como 止まらない, 戻れない ou 終わりだ.

É uma expressão enfática.$$,
    $$Verbo (forma たら) + 最後
Verbo (forma た) + が最後$$,
    $$たら最後$$,
    $$たら最後|たが最後|だら最後|だが最後$$,
    ARRAY['たら', '最後']::text[],
    ARRAY['たら最後', 'たが最後']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-180', $$彼は話し始めたら最後、止まらない。$$, $$かれははなしはじめたらさいご、とまらない。$$, $$Uma vez que ele começa a falar, não para mais.$$),
    ('n1-grammar-180', $$この本を読み始めたが最後、朝まで眠れない。$$, $$このほんをよみはじめたがさいご、あさまでねむれない。$$, $$Uma vez que você começa a ler este livro, não dorme até de manhã.$$),
    ('n1-grammar-180', $$一度嘘をついたら最後、信用を失う。$$, $$いちどうそをついたらさいご、しんようをうしなう。$$, $$Uma vez que se mente, perde-se a confiança.$$),
    ('n1-grammar-180', $$あの店に入ったが最後、何か買ってしまう。$$, $$あのみせにはいったがさいご、なにかかってしまう。$$, $$Uma vez que entro naquela loja, acabo comprando alguma coisa.$$),
    ('n1-grammar-180', $$ここで負けたら最後、もう後がない。$$, $$ここでまけたらさいご、もうあとがない。$$, $$Se perdermos aqui, acabou, não há mais chance.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父は怒っ____、誰も止められない。$$, $$Uma vez que meu pai fica bravo, ninguém consegue pará-lo.$$),
        (2, $$このゲームは始め____、やめられない。$$, $$Uma vez que você começa este jogo, não consegue parar.$$),
        (3, $$一度秘密を話し____、元には戻れない。$$, $$Uma vez que se conta o segredo, não tem volta.$$),
        (4, $$あの犬は一度かみつい____、離さない。$$, $$Uma vez que aquele cachorro morde, não solta mais.$$),
        (5, $$彼女に見つかっ____、全部話さなければならない。$$, $$Se ela me descobrir, acabou, vou ter que contar tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-180', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たら最後$$),
        (1, $$たが最後$$),
        (2, $$たら最後$$),
        (2, $$たが最後$$),
        (3, $$たら最後$$),
        (3, $$たが最後$$),
        (4, $$たら最後$$),
        (4, $$たが最後$$),
        (5, $$たら最後$$),
        (5, $$たが最後$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-181 — 〜たら〜たで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-181',
    'grammar',
    'N1',
    $$〜たら〜たで$$,
    $$tara ~ ta de$$,
    $$Se... também tem seus problemas / Se acontecer... aí / Tanto faz se$$,
    $$たら〜たで indica que, mesmo que algo aconteça como se queria, ou de outra forma, surgem novos problemas ou situações. Equivale a "se..., também tem seus problemas" ou "se acontecer..., aí...".

Muitas vezes a pessoa mostra que nenhuma situação é perfeita. Por exemplo, "quando não tem dinheiro é ruim, mas quando tem, também dá trabalho".

Também pode mostrar aceitação, como "se der errado, aí a gente pensa".$$,
    $$Muitas vezes vem junto com ば〜で, que tem um sentido parecido.

A segunda parte costuma mostrar um novo problema ou uma ideia de "tanto faz".$$,
    $$Verbo (forma たら) + Mesmo verbo (forma た) + で
Adjetivo い (forma かったら) + Mesmo adjetivo (forma かった) + で
Adjetivo な / Substantivo + だったら + だったで$$,
    $$たら〜たで$$,
    $$たで|だで|ったで$$,
    ARRAY['たら', 'た', 'で']::text[],
    ARRAY['たら〜たで', 'だったら〜だったで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-181', $$お金がないと困るが、あったらあったで心配が増える。$$, $$おかねがないとこまるが、あったらあったでしんぱいがふえる。$$, $$Sem dinheiro é ruim, mas quando se tem, também aumentam as preocupações.$$),
    ('n1-grammar-181', $$子供が小さいと大変だが、大きくなったらなったで別の悩みがある。$$, $$こどもがちいさいとたいへんだが、おおきくなったらなったでべつのなやみがある。$$, $$Com filhos pequenos é difícil, mas quando crescem, surgem outras preocupações.$$),
    ('n1-grammar-181', $$失敗したら失敗したで、また考えればいい。$$, $$しっぱいしたらしっぱいしたで、またかんがえればいい。$$, $$Se der errado, aí a gente pensa de novo.$$),
    ('n1-grammar-181', $$暇だったら暇だったで、退屈だ。$$, $$ひまだったらひまだったで、たいくつだ。$$, $$Quando estou desocupado, também fico entediado.$$),
    ('n1-grammar-181', $$雨が降ったら降ったで、家で映画を見よう。$$, $$あめがふったらふったで、いえでえいがをみよう。$$, $$Se chover, tudo bem, vamos ver um filme em casa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事がないと困るが、忙しかったら忙しかった____、大変だ。$$, $$Sem trabalho é ruim, mas quando estou ocupado também é difícil.$$),
        (2, $$一人暮らしは寂しいが、家族と住んだら住んだ____、うるさい。$$, $$Morar sozinho é solitário, mas morar com a família também é barulhento.$$),
        (3, $$遅れたら遅れた____、仕方がない。$$, $$Se atrasar, aí não tem jeito.$$),
        (4, $$合格したらした____、また新しい悩みが出てくる。$$, $$Se passar, também vão surgir novas preocupações.$$),
        (5, $$車があったらあった____、維持費がかかる。$$, $$Ter carro também tem seus problemas, gasta-se com manutenção.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$で$$),
        (2, $$で$$),
        (3, $$で$$),
        (4, $$で$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-182 — 〜たら〜ところだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-182',
    'grammar',
    'N1',
    $$〜たら〜ところだ$$,
    $$tara ~ tokoro da$$,
    $$Se tivesse... teria / Se fosse... seria / Caso contrário teria$$,
    $$たら〜ところだ indica uma situação hipotética, contrária à realidade. Equivale a "se tivesse..., teria...".

A pessoa imagina o que teria acontecido se algo fosse diferente. Muitas vezes há alívio ou arrependimento. Por exemplo, "se não tivesse levado guarda-chuva, teria me molhado todo".

As formas ば〜ところだ e なら〜ところだ têm o mesmo sentido.$$,
    $$É muito comum na forma ところだった, no passado.

Também aparece como ところです, mais educado.$$,
    $$Verbo (forma たら / ば) + 〜 + Verbo (forma dicionário) + ところだ / ところだった$$,
    $$たら〜ところだ$$,
    $$ところだ|ところです$$,
    ARRAY['たら', 'ところ', 'だ']::text[],
    ARRAY['たら〜ところだ', 'たら〜ところだった', 'ば〜ところだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-182', $$傘を持っていなかったら、ずぶぬれになるところだった。$$, $$かさをもっていなかったら、ずぶぬれになるところだった。$$, $$Se eu não tivesse levado guarda-chuva, teria ficado encharcado.$$),
    ('n1-grammar-182', $$君が教えてくれなかったら、忘れるところだった。$$, $$きみがおしえてくれなかったら、わすれるところだった。$$, $$Se você não tivesse me avisado, eu teria esquecido.$$),
    ('n1-grammar-182', $$もう少し安かったら、買うところだ。$$, $$もうすこしやすかったら、かうところだ。$$, $$Se fosse um pouco mais barato, eu compraria.$$),
    ('n1-grammar-182', $$時間があれば、手伝うところですが、今日は無理です。$$, $$じかんがあれば、てつだうところですが、きょうはむりです。$$, $$Se eu tivesse tempo, ajudaria, mas hoje não dá.$$),
    ('n1-grammar-182', $$いつもなら怒るところだが、今日は許してあげる。$$, $$いつもならおこるところだが、きょうはゆるしてあげる。$$, $$Normalmente eu ficaria bravo, mas hoje vou perdoar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ブレーキが遅れていたら、事故になる____。$$, $$Se tivesse freado mais tarde, teria havido um acidente.$$),
        (2, $$地図がなかったら、道に迷う____。$$, $$Sem o mapa, eu teria me perdido.$$),
        (3, $$普通なら断る____が、あなたの頼みなら引き受けます。$$, $$Normalmente eu recusaria, mas sendo um pedido seu, aceito.$$),
        (4, $$目覚ましが鳴らなかったら、遅刻する____。$$, $$Se o despertador não tivesse tocado, eu teria me atrasado.$$),
        (5, $$お金があれば、行く____けど、今月は厳しい。$$, $$Se eu tivesse dinheiro, iria, mas este mês está apertado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところだった$$),
        (2, $$ところだった$$),
        (3, $$ところだ$$),
        (3, $$ところです$$),
        (4, $$ところだった$$),
        (5, $$ところだ$$),
        (5, $$ところです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-183 — 〜たりとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-183',
    'grammar',
    'N1',
    $$〜たりとも$$,
    $$tari tomo$$,
    $$Nem um único / Nem mesmo um / Nem sequer$$,
    $$たりとも indica que nem a menor quantidade é permitida ou aceita. Equivale a "nem um único" ou "nem mesmo um".

Vem depois de expressões com "um", como um dia, uma pessoa, um iene ou um minuto, e a frase é negativa. Por exemplo, "não se pode perder nem um minuto".

É uma expressão formal e enfática.$$,
    $$Expressões comuns são 一日たりとも, 一人たりとも, 一円たりとも e 一瞬たりとも.

É parecido com も, como em 一日も, mas たりとも é muito mais enfático.$$,
    $$一 + Contador + たりとも + Frase negativa$$,
    $$たりとも$$,
    $$たりとも$$,
    ARRAY['たり', 'とも']::text[],
    ARRAY['たりとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-183', $$一日たりとも練習を休んだことはない。$$, $$いちにちたりともれんしゅうをやすんだことはない。$$, $$Nunca faltei ao treino nem um único dia.$$),
    ('n1-grammar-183', $$一円たりとも無駄にしてはいけない。$$, $$いちえんたりともむだにしてはいけない。$$, $$Não se deve desperdiçar nem um único iene.$$),
    ('n1-grammar-183', $$一瞬たりとも油断できない。$$, $$いっしゅんたりともゆだんできない。$$, $$Não dá para se descuidar nem por um instante.$$),
    ('n1-grammar-183', $$一人たりとも犠牲者を出してはならない。$$, $$ひとりたりともぎせいしゃをだしてはならない。$$, $$Não se pode deixar haver nem uma única vítima.$$),
    ('n1-grammar-183', $$彼女のことは一時たりとも忘れたことがない。$$, $$かのじょのことはいちじたりともわすれたことがない。$$, $$Nunca a esqueci nem por um momento.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験中は、一分____無駄にできない。$$, $$Durante a prova, não dá para desperdiçar nem um minuto.$$),
        (2, $$この部屋には、一人____入ってはいけない。$$, $$Ninguém pode entrar nesta sala, nem uma única pessoa.$$),
        (3, $$一秒____目を離すな。$$, $$Não tire os olhos nem por um segundo.$$),
        (4, $$借りたお金は一円____返していない。$$, $$Não devolvi nem um iene do dinheiro emprestado.$$),
        (5, $$一日____家族のことを忘れたことはない。$$, $$Nunca esqueci da minha família nem um único dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たりとも$$),
        (2, $$たりとも$$),
        (3, $$たりとも$$),
        (4, $$たりとも$$),
        (5, $$たりとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-184 — 〜たるもの / 〜たる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-184',
    'grammar',
    'N1',
    $$〜たるもの / 〜たる$$,
    $$taru mono / taru$$,
    $$Quem é / Na condição de / Alguém que é$$,
    $$たるもの e たる indicam uma posição ou papel importante e o comportamento esperado de quem ocupa esse lugar. Equivalem a "quem é..." ou "na condição de...".

A segunda parte costuma dizer como essa pessoa deve agir. Por exemplo, "quem é professor deve dar o exemplo aos alunos".

É uma expressão muito formal e antiquada, usada para falar de responsabilidades.$$,
    $$Expressões comuns são 教師たるもの, 親たるもの, 社会人たるもの e 王たる者.

É parecido com である以上, mas mais formal.$$,
    $$Substantivo (posição) + たるもの + べきだ / なければならない
Substantivo (posição) + たる + Substantivo$$,
    $$たるもの$$,
    $$たるもの|たる者|たる$$,
    ARRAY['たる', 'もの']::text[],
    ARRAY['たるもの', 'たる者', 'たる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-184', $$教師たるもの、生徒の手本にならなければならない。$$, $$きょうしたるもの、せいとのてほんにならなければならない。$$, $$Quem é professor deve ser um exemplo para os alunos.$$),
    ('n1-grammar-184', $$社会人たるもの、時間は守るべきだ。$$, $$しゃかいじんたるもの、じかんはまもるべきだ。$$, $$Quem é profissional deve ser pontual.$$),
    ('n1-grammar-184', $$親たる者、子供の安全を第一に考えるべきだ。$$, $$おやたるもの、こどものあんぜんをだいいちにかんがえるべきだ。$$, $$Quem é pai deve pensar em primeiro lugar na segurança dos filhos.$$),
    ('n1-grammar-184', $$医師たる者の責任は重い。$$, $$いしたるもののせきにんはおもい。$$, $$A responsabilidade de quem é médico é grande.$$),
    ('n1-grammar-184', $$リーダーたる人物には、決断力が必要だ。$$, $$リーダーたるじんぶつには、けつだんりょくがひつようだ。$$, $$Uma pessoa na condição de líder precisa ter capacidade de decisão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$政治家____、国民のために働くべきだ。$$, $$Quem é político deve trabalhar pelo povo.$$),
        (2, $$学生____、勉強を第一にすべきだ。$$, $$Quem é estudante deve colocar os estudos em primeiro lugar.$$),
        (3, $$プロ____、言い訳をしてはいけない。$$, $$Quem é profissional não deve dar desculpas.$$),
        (4, $$警察官____者が、法律を破るとは。$$, $$Que alguém na condição de policial quebre a lei...$$),
        (5, $$社長____、社員の生活を守らなければならない。$$, $$Quem é presidente deve proteger a vida dos funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たるもの$$),
        (1, $$たる者$$),
        (2, $$たるもの$$),
        (2, $$たる者$$),
        (3, $$たるもの$$),
        (3, $$たる者$$),
        (4, $$たる$$),
        (5, $$たるもの$$),
        (5, $$たる者$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-185 — 〜て敵わない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-185',
    'grammar',
    'N1',
    $$〜て敵わない$$,
    $$te kanawanai$$,
    $$Insuportável / Não aguento / Demais$$,
    $$て敵わない indica que uma situação é tão desagradável que a pessoa não consegue suportar. Equivale a "insuportável" ou "não aguento".

Costuma vir com adjetivos que expressam incômodo, como quente, barulhento, dolorido ou chato. Por exemplo, "o barulho dos vizinhos é insuportável".

É uma expressão coloquial, com tom de reclamação.$$,
    $$Também é escrito てかなわない, em hiragana.

É parecido com てたまらない, mas て敵わない é usado só com coisas desagradáveis.$$,
    $$Adjetivo い (sem い) + くて敵わない
Adjetivo な + で敵わない
Verbo (forma て) + 敵わない$$,
    $$て敵わない$$,
    $$て敵わない|でかなわない|てかなわない|で敵わない|て敵いません$$,
    ARRAY['て', '敵わない']::text[],
    ARRAY['て敵わない', 'てかなわない', 'で敵わない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-185', $$隣の家がうるさくて敵わない。$$, $$となりのいえがうるさくてかなわない。$$, $$O barulho da casa vizinha é insuportável.$$),
    ('n1-grammar-185', $$今年の夏は暑くてかなわない。$$, $$ことしのなつはあつくてかなわない。$$, $$O calor deste verão é insuportável.$$),
    ('n1-grammar-185', $$毎日同じことを言われて敵わない。$$, $$まいにちおなじことをいわれてかなわない。$$, $$Não aguento ouvir a mesma coisa todo dia.$$),
    ('n1-grammar-185', $$この仕事は面倒で敵わない。$$, $$このしごとはめんどうでかなわない。$$, $$Este trabalho é chato demais.$$),
    ('n1-grammar-185', $$歯が痛くてかなわない。$$, $$はがいたくてかなわない。$$, $$Meu dente dói insuportavelmente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$蚊に刺されて、かゆく____。$$, $$Fui picado por mosquito e a coceira é insuportável.$$),
        (2, $$部屋が狭く____。$$, $$O quarto é apertado demais, não aguento.$$),
        (3, $$彼の自慢話が長く____。$$, $$As histórias de vangloria dele são longas demais, não aguento.$$),
        (4, $$毎朝の満員電車が不快____。$$, $$O trem lotado toda manhã é insuportável.$$),
        (5, $$母に毎日勉強しろと言われ____。$$, $$Não aguento minha mãe mandando eu estudar todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-185', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て敵わない$$),
        (1, $$てかなわない$$),
        (2, $$て敵わない$$),
        (2, $$てかなわない$$),
        (3, $$て敵わない$$),
        (3, $$てかなわない$$),
        (4, $$で敵わない$$),
        (4, $$でかなわない$$),
        (5, $$て敵わない$$),
        (5, $$てかなわない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-186 — 〜てからというもの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-186',
    'grammar',
    'N1',
    $$〜てからというもの$$,
    $$te kara to iu mono$$,
    $$Desde que / Desde então / A partir do momento em que$$,
    $$てからというもの indica que, a partir de um acontecimento, a situação mudou e continua diferente até agora. Equivale a "desde que" ou "a partir do momento em que".

A pessoa destaca uma mudança grande e duradoura. Por exemplo, "desde que meu filho nasceu, minha vida mudou completamente".

É uma expressão um pouco formal e emotiva.$$,
    $$É parecido com て以来, mas てからというもの destaca mais a emoção e a mudança.

A segunda parte descreve um estado que continua, não uma ação única.$$,
    $$Verbo (forma て) + からというもの$$,
    $$てからというもの$$,
    $$てからというもの|でからというもの$$,
    ARRAY['て', 'から', 'という', 'もの']::text[],
    ARRAY['てからというもの', 'でからというもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-186', $$子供が生まれてからというもの、生活が一変した。$$, $$こどもがうまれてからというもの、せいかつがいっぺんした。$$, $$Desde que meu filho nasceu, minha vida mudou completamente.$$),
    ('n1-grammar-186', $$彼女に出会ってからというもの、毎日が楽しい。$$, $$かのじょにであってからというもの、まいにちがたのしい。$$, $$Desde que a conheci, todos os dias são divertidos.$$),
    ('n1-grammar-186', $$日本に来てからというもの、和食ばかり食べている。$$, $$にほんにきてからというもの、わしょくばかりたべている。$$, $$Desde que vim ao Japão, só como comida japonesa.$$),
    ('n1-grammar-186', $$犬を飼い始めてからというもの、毎朝散歩している。$$, $$いぬをかいはじめてからというもの、まいあささんぽしている。$$, $$Desde que comecei a ter um cachorro, caminho toda manhã.$$),
    ('n1-grammar-186', $$父が亡くなってからというもの、母は元気がない。$$, $$ちちがなくなってからというもの、はははげんきがない。$$, $$Desde que meu pai faleceu, minha mãe anda desanimada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たばこをやめ____、体の調子がいい。$$, $$Desde que parei de fumar, me sinto bem.$$),
        (2, $$スマホを買っ____、本を読まなくなった。$$, $$Desde que comprei um smartphone, parei de ler livros.$$),
        (3, $$あの事故があっ____、彼は車を運転しなくなった。$$, $$Desde aquele acidente, ele parou de dirigir.$$),
        (4, $$ヨガを始め____、よく眠れるようになった。$$, $$Desde que comecei a fazer ioga, passei a dormir bem.$$),
        (5, $$彼が転校し____、クラスが静かになった。$$, $$Desde que ele mudou de escola, a turma ficou quieta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てからというもの$$),
        (2, $$てからというもの$$),
        (3, $$てからというもの$$),
        (4, $$てからというもの$$),
        (5, $$てからというもの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-187 — 〜てみせる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-187',
    'grammar',
    'N1',
    $$〜てみせる$$,
    $$te miseru$$,
    $$Vou conseguir / Vou provar / Mostrar como se faz$$,
    $$てみせる tem dois usos principais.

O primeiro expressa uma determinação forte de fazer algo, muitas vezes para provar algo aos outros. Equivale a "vou conseguir" ou "vou provar". Por exemplo, "da próxima vez, vou ganhar com certeza".

O segundo indica mostrar a alguém como se faz algo, como uma demonstração. Equivale a "mostrar como se faz". Por exemplo, "o professor mostrou como se faz o exercício".$$,
    $$No uso de determinação, costuma vir com 必ず, 絶対に ou きっと.

O sujeito do uso de determinação é a primeira pessoa.$$,
    $$Verbo (forma て) + みせる (determinação)
Verbo (forma て) + みせる (demonstração)$$,
    $$てみせる$$,
    $$てみせる|でみせる|てみせた|でみせた|てみせます|でみせます|てみせて$$,
    ARRAY['て', 'みせる']::text[],
    ARRAY['てみせる', 'てみせます', 'てみせた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-187', $$次の試合では、必ず勝ってみせる。$$, $$つぎのしあいでは、かならずかってみせる。$$, $$Na próxima partida, vou ganhar com certeza.$$),
    ('n1-grammar-187', $$いつか絶対に有名になってみせます。$$, $$いつかぜったいにゆうめいになってみせます。$$, $$Um dia vou ficar famoso, pode apostar.$$),
    ('n1-grammar-187', $$先生は生徒たちに泳いでみせた。$$, $$せんせいはせいとたちにおよいでみせた。$$, $$O professor mostrou aos alunos como se nada.$$),
    ('n1-grammar-187', $$今度こそ合格してみせる。$$, $$こんどこそごうかくしてみせる。$$, $$Desta vez vou passar, pode ter certeza.$$),
    ('n1-grammar-187', $$母は料理の作り方をやってみせてくれた。$$, $$はははりょうりのつくりかたをやってみせてくれた。$$, $$Minha mãe me mostrou como se faz a comida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$馬鹿にされたけど、絶対に成功し____。$$, $$Zombaram de mim, mas vou ter sucesso, pode apostar.$$),
        (2, $$この記録は、必ず破っ____。$$, $$Vou quebrar este recorde, com certeza.$$),
        (3, $$コーチは正しいフォームを見せるために、自分で投げ____。$$, $$Para mostrar a forma correta, o técnico arremessou ele mesmo.$$),
        (4, $$来年こそ、彼女を振り向かせ____。$$, $$No ano que vem, vou fazer ela me notar, pode ter certeza.$$),
        (5, $$どんなに難しくても、やり遂げ____。$$, $$Por mais difícil que seja, vou conseguir até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てみせる$$),
        (1, $$てみせます$$),
        (2, $$てみせる$$),
        (2, $$てみせます$$),
        (3, $$てみせた$$),
        (4, $$てみせる$$),
        (4, $$てみせます$$),
        (5, $$てみせる$$),
        (5, $$てみせます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-188 — 〜てしかるべきだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-188',
    'grammar',
    'N1',
    $$〜てしかるべきだ$$,
    $$te shikarubeki da$$,
    $$Deveria / Seria natural que / É justo que$$,
    $$てしかるべきだ indica que algo deveria ser feito, porque é natural ou justo. Equivale a "deveria" ou "seria natural que".

Muitas vezes a pessoa critica o fato de algo não ter sido feito. Por exemplo, "o governo deveria ter agido mais cedo" ou "um esforço desses merece reconhecimento".

É uma expressão formal.$$,
    $$É parecido com べきだ e のが当然だ, mas てしかるべきだ é mais formal.

A forma しかるべき, antes de substantivos, significa "adequado", como しかるべき処置.$$,
    $$Verbo (forma て) + しかるべきだ
Adjetivo い (sem い) + くてしかるべきだ
Adjetivo な / Substantivo + でしかるべきだ$$,
    $$てしかるべきだ$$,
    $$てしかるべき|でしかるべき$$,
    ARRAY['て', 'しかるべき', 'だ']::text[],
    ARRAY['てしかるべきだ', 'てしかるべきです', 'でしかるべきだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-188', $$彼の努力は、もっと評価されてしかるべきだ。$$, $$かれのどりょくは、もっとひょうかされてしかるべきだ。$$, $$O esforço dele deveria ser mais reconhecido.$$),
    ('n1-grammar-188', $$事故の責任者は、謝罪してしかるべきだ。$$, $$じこのせきにんしゃは、しゃざいしてしかるべきだ。$$, $$O responsável pelo acidente deveria pedir desculpas.$$),
    ('n1-grammar-188', $$この問題は、もっと早く解決されてしかるべきだった。$$, $$このもんだいは、もっとはやくかいけつされてしかるべきだった。$$, $$Este problema deveria ter sido resolvido mais cedo.$$),
    ('n1-grammar-188', $$これだけ働いたのだから、給料はもっと高くてしかるべきだ。$$, $$これだけはたらいたのだから、きゅうりょうはもっとたかくてしかるべきだ。$$, $$Trabalhando tanto assim, o salário deveria ser mais alto.$$),
    ('n1-grammar-188', $$子供の意見も尊重されてしかるべきです。$$, $$こどものいけんもそんちょうされてしかるべきです。$$, $$A opinião das crianças também deveria ser respeitada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ミスをしたのだから、彼は謝っ____。$$, $$Ele errou, então deveria pedir desculpas.$$),
        (2, $$彼女の才能は、もっと注目され____。$$, $$O talento dela deveria receber mais atenção.$$),
        (3, $$国はこの問題に対策をとっ____。$$, $$O país deveria tomar medidas contra este problema.$$),
        (4, $$お世話になったのだから、お礼を言っ____。$$, $$Já que te ajudaram, você deveria agradecer.$$),
        (5, $$社員の意見も聞かれ____。$$, $$A opinião dos funcionários também deveria ser ouvida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしかるべきだ$$),
        (1, $$てしかるべきです$$),
        (2, $$てしかるべきだ$$),
        (2, $$てしかるべきです$$),
        (3, $$てしかるべきだ$$),
        (3, $$てしかるべきです$$),
        (4, $$てしかるべきだ$$),
        (4, $$てしかるべきです$$),
        (5, $$てしかるべきだ$$),
        (5, $$てしかるべきです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-189 — 〜て済むことではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-189',
    'grammar',
    'N1',
    $$〜て済むことではない$$,
    $$te sumu koto dewa nai$$,
    $$Não se resolve com / Não basta / Não é algo que se resolva$$,
    $$て済むことではない indica que uma situação é tão grave que não pode ser resolvida de forma simples. Equivale a "não se resolve com" ou "não basta".

Muitas vezes é usado quando alguém tenta resolver um problema sério apenas pedindo desculpas ou pagando. Por exemplo, "isso não se resolve só pedindo desculpas".

O tom é de crítica forte.$$,
    $$Expressões comuns são 謝って済むことではない e お金で済む問題ではない.

É parecido com では済まない.$$,
    $$Verbo (forma て) + 済むことではない
Verbo (forma て) + 済む問題ではない$$,
    $$て済むことではない$$,
    $$て済むことではない|て済む問題ではない|て済むことじゃない|て済む話ではない|てすむことではない$$,
    ARRAY['て', '済む', 'こと', 'では', 'ない']::text[],
    ARRAY['て済むことではない', 'て済む問題ではない', 'て済むことじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-189', $$人を傷つけておいて、謝って済むことではない。$$, $$ひとをきずつけておいて、あやまってすむことではない。$$, $$Machucar alguém não é algo que se resolva só pedindo desculpas.$$),
    ('n1-grammar-189', $$これはお金を払って済む問題ではない。$$, $$これはおかねをはらってすむもんだいではない。$$, $$Isso não é um problema que se resolva pagando.$$),
    ('n1-grammar-189', $$知らなかったと言って済むことではない。$$, $$しらなかったといってすむことではない。$$, $$Não basta dizer que não sabia.$$),
    ('n1-grammar-189', $$ごめんと言って済むことじゃないよ。$$, $$ごめんといってすむことじゃないよ。$$, $$Não basta dizer desculpa.$$),
    ('n1-grammar-189', $$会社の信用を失ったのは、謝って済む話ではない。$$, $$かいしゃのしんようをうしなったのは、あやまってすむはなしではない。$$, $$Perder a confiança na empresa não se resolve só pedindo desculpas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破っておいて、謝っ____。$$, $$Quebrar a promessa não é algo que se resolva só pedindo desculpas.$$),
        (2, $$命に関わることだ。笑っ____。$$, $$É algo que envolve vidas. Não se resolve com risadas.$$),
        (3, $$反省していると言っ____。$$, $$Não basta dizer que está arrependido.$$),
        (4, $$この被害は、お金で弁償し____。$$, $$Estes danos não se resolvem só indenizando com dinheiro.$$),
        (5, $$ミスを隠そうとしたのは、忘れていたと言っ____。$$, $$Tentar esconder o erro não se resolve dizendo que esqueceu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て済むことではない$$),
        (1, $$て済む問題ではない$$),
        (1, $$て済むことじゃない$$),
        (2, $$て済むことではない$$),
        (2, $$て済む問題ではない$$),
        (2, $$て済むことじゃない$$),
        (3, $$て済むことではない$$),
        (3, $$て済む問題ではない$$),
        (3, $$て済むことじゃない$$),
        (4, $$て済むことではない$$),
        (4, $$て済む問題ではない$$),
        (5, $$て済むことではない$$),
        (5, $$て済む問題ではない$$),
        (5, $$て済むことじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-190 — 〜てやまない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-190',
    'grammar',
    'N1',
    $$〜てやまない$$,
    $$te yamanai$$,
    $$Sinceramente / Do fundo do coração / Não deixar de$$,
    $$てやまない indica um sentimento forte e contínuo, que não para. Equivale a "sinceramente" ou "do fundo do coração".

Costuma vir com verbos de sentimento ou desejo, como desejar, esperar, amar e respeitar. Por exemplo, "desejo sinceramente o seu sucesso".

É uma expressão muito formal, usada em discursos, cartas e mensagens.$$,
    $$Combinações comuns são 願ってやまない, 祈ってやまない, 愛してやまない e 期待してやまない.

O sujeito costuma ser a primeira pessoa.$$,
    $$Verbo (forma て) + やまない$$,
    $$てやまない$$,
    $$てやまない|てやまなかった|でやまない|てやみません$$,
    ARRAY['て', 'やまない']::text[],
    ARRAY['てやまない', 'てやみません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-190', $$皆様のご健康を願ってやみません。$$, $$みなさまのごけんこうをねがってやみません。$$, $$Desejo sinceramente saúde a todos.$$),
    ('n1-grammar-190', $$世界の平和を祈ってやまない。$$, $$せかいのへいわをいのってやまない。$$, $$Rezo do fundo do coração pela paz no mundo.$$),
    ('n1-grammar-190', $$彼は故郷を愛してやまなかった。$$, $$かれはこきょうをあいしてやまなかった。$$, $$Ele amava profundamente sua terra natal.$$),
    ('n1-grammar-190', $$君の活躍を期待してやまない。$$, $$きみのかつやくをきたいしてやまない。$$, $$Espero sinceramente o seu sucesso.$$),
    ('n1-grammar-190', $$多くの人が尊敬してやまない先生だ。$$, $$おおくのひとがそんけいしてやまないせんせいだ。$$, $$É um professor que muitas pessoas respeitam profundamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お二人の幸せを願っ____。$$, $$Desejo do fundo do coração a felicidade de vocês dois.$$),
        (2, $$被災地の一日も早い復興を祈っ____。$$, $$Rezo sinceramente pela rápida recuperação das áreas atingidas.$$),
        (3, $$若い世代の成長を期待し____。$$, $$Espero sinceramente o crescimento da nova geração.$$),
        (4, $$彼女は音楽を愛し____人だった。$$, $$Ela era uma pessoa que amava profundamente a música.$$),
        (5, $$皆様のご成功を祈っ____。$$, $$Desejo sinceramente o sucesso de todos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-190', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てやまない$$),
        (1, $$てやみません$$),
        (2, $$てやまない$$),
        (2, $$てやみません$$),
        (3, $$てやまない$$),
        (3, $$てやみません$$),
        (4, $$てやまない$$),
        (5, $$てやまない$$),
        (5, $$てやみません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-191 — 〜手前
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-191',
    'grammar',
    'N1',
    $$〜手前$$,
    $$temae$$,
    $$Por consideração a / Diante de / Já que$$,
    $$手前 indica que, por causa de algo que a pessoa disse, fez ou por causa da presença de alguém, ela sente que precisa agir de certa forma para manter a reputação. Equivale a "já que" ou "por consideração a".

A pessoa age assim para não passar vergonha ou não perder a credibilidade. Por exemplo, "já que eu disse que faria, não posso desistir agora".

Também é usado com pessoas, como "diante dos filhos, não posso chorar".$$,
    $$A segunda parte costuma ter expressões como わけにはいかない, しかない ou なければならない.

Não se confunde com 手前 com sentido de "na frente de" ou "antes de", como 駅の手前.$$,
    $$Verbo (forma simples) + 手前
Substantivo + の + 手前$$,
    $$手前$$,
    $$手前|てまえ$$,
    ARRAY['手前']::text[],
    ARRAY['手前', 'の手前']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-191', $$やると言った手前、今さらやめられない。$$, $$やるといったてまえ、いまさらやめられない。$$, $$Já que eu disse que faria, não posso desistir agora.$$),
    ('n1-grammar-191', $$子供の手前、泣くわけにはいかなかった。$$, $$こどものてまえ、なくわけにはいかなかった。$$, $$Diante dos filhos, eu não podia chorar.$$),
    ('n1-grammar-191', $$約束した手前、行かないわけにはいかない。$$, $$やくそくしたてまえ、いかないわけにはいかない。$$, $$Já que prometi, não posso deixar de ir.$$),
    ('n1-grammar-191', $$部下の手前、ミスを認めにくかった。$$, $$ぶかのてまえ、ミスをみとめにくかった。$$, $$Diante dos subordinados, foi difícil admitir o erro.$$),
    ('n1-grammar-191', $$みんなに自慢した手前、失敗はできない。$$, $$みんなにじまんしたてまえ、しっぱいはできない。$$, $$Já que me gabei para todos, não posso falhar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大丈夫だと言った____、助けを求められない。$$, $$Já que eu disse que estava tudo bem, não posso pedir ajuda.$$),
        (2, $$客の____、店員同士でけんかはできない。$$, $$Diante dos clientes, os atendentes não podem brigar entre si.$$),
        (3, $$先生に推薦してもらった____、頑張らなければならない。$$, $$Já que o professor me recomendou, preciso me esforçar.$$),
        (4, $$家族の____、弱音を吐くわけにはいかない。$$, $$Diante da família, não posso me queixar.$$),
        (5, $$引き受けた____、最後までやるしかない。$$, $$Já que aceitei, só me resta fazer até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-191', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$手前$$),
        (2, $$手前$$),
        (3, $$手前$$),
        (4, $$手前$$),
        (5, $$手前$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-192 — 〜てもどうにもならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-192',
    'grammar',
    'N1',
    $$〜てもどうにもならない$$,
    $$te mo dou nimo naranai$$,
    $$Não adianta / Não muda nada / Não resolve$$,
    $$てもどうにもならない indica que, mesmo fazendo algo, a situação não vai mudar ou melhorar. Equivale a "não adianta" ou "não muda nada".

A pessoa mostra resignação diante de algo que não pode ser resolvido. Por exemplo, "não adianta se arrepender agora".

É uma expressão comum na fala.$$,
    $$É parecido com ても仕方がない e ても無駄だ.

A expressão どうにもならない sozinha significa "não há nada a fazer".$$,
    $$Verbo (forma て) + もどうにもならない
Adjetivo い (sem い) + くてもどうにもならない$$,
    $$てもどうにもならない$$,
    $$てもどうにもならない|でもどうにもならない|てもどうにもなりません|でもどうにもなりません|てもどうにもならなかった|でもどうにもならなかった$$,
    ARRAY['て', 'も', 'どうにも', 'ならない']::text[],
    ARRAY['てもどうにもならない', 'でもどうにもならない', 'てもどうにもなりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-192', $$今さら後悔してもどうにもならない。$$, $$いまさらこうかいしてもどうにもならない。$$, $$Não adianta se arrepender agora.$$),
    ('n1-grammar-192', $$一人で悩んでもどうにもならないよ。$$, $$ひとりでなやんでもどうにもならないよ。$$, $$Não adianta se angustiar sozinho.$$),
    ('n1-grammar-192', $$泣いてもどうにもならないから、次のことを考えよう。$$, $$ないてもどうにもならないから、つぎのことをかんがえよう。$$, $$Chorar não muda nada, então vamos pensar no próximo passo.$$),
    ('n1-grammar-192', $$文句を言ってもどうにもなりません。$$, $$もんくをいってもどうにもなりません。$$, $$Reclamar não resolve nada.$$),
    ('n1-grammar-192', $$急いでもどうにもならなかった。$$, $$いそいでもどうにもならなかった。$$, $$Mesmo correndo, não adiantou nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$過ぎたことを考え____。$$, $$Não adianta pensar no que já passou.$$),
        (2, $$怒っ____、問題は解決しない。$$, $$Ficar bravo não adianta, o problema não se resolve.$$),
        (3, $$今から急い____。$$, $$Correr agora não adianta.$$),
        (4, $$心配し____から、今日はもう寝よう。$$, $$Preocupar-se não muda nada, então vamos dormir.$$),
        (5, $$いくら頼ん____。彼は決めたら変えない。$$, $$Por mais que peça, não adianta. Quando ele decide, não muda.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-192', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てもどうにもならない$$),
        (1, $$てもどうにもなりません$$),
        (2, $$てもどうにもならないし$$),
        (3, $$でもどうにもならない$$),
        (3, $$でもどうにもなりません$$),
        (4, $$てもどうにもならない$$),
        (5, $$でもどうにもならない$$),
        (5, $$でもどうにもなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-193 — 〜ても差し支えない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-193',
    'grammar',
    'N1',
    $$〜ても差し支えない$$,
    $$te mo sashitsukae nai$$,
    $$Não há problema em / Pode / Não tem inconveniente$$,
    $$ても差し支えない indica que algo é permitido ou não causa problema. Equivale a "não há problema em" ou "pode".

É uma forma mais formal e educada de てもいい e てもかまわない, usada em situações de trabalho, documentos e conversas formais. Por exemplo, "não há problema em preencher com lápis".

A forma ても差し支えありません é ainda mais educada.$$,
    $$É muito usado para pedir permissão de forma educada, como 〜ても差し支えないでしょうか.

Também é escrito ても差しつかえない.$$,
    $$Verbo (forma て) + も差し支えない
Adjetivo い (sem い) + くても差し支えない
Adjetivo な / Substantivo + でも差し支えない$$,
    $$ても差し支えない$$,
    $$ても差し支え|でも差し支え|ても差しつかえ|でも差しつかえ$$,
    ARRAY['て', 'も', '差し支え', 'ない']::text[],
    ARRAY['ても差し支えない', 'ても差し支えありません', 'でも差し支えない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-193', $$鉛筆で書いても差し支えありません。$$, $$えんぴつでかいてもさしつかえありません。$$, $$Não há problema em escrever a lápis.$$),
    ('n1-grammar-193', $$明日の会議に遅れても差し支えないでしょうか。$$, $$あしたのかいぎにおくれてもさしつかえないでしょうか。$$, $$Haveria algum problema se eu me atrasasse para a reunião de amanhã?$$),
    ('n1-grammar-193', $$少しくらい遅れても差し支えない。$$, $$すこしくらいおくれてもさしつかえない。$$, $$Não tem problema atrasar um pouco.$$),
    ('n1-grammar-193', $$名前は書かなくても差し支えありません。$$, $$なまえはかかなくてもさしつかえありません。$$, $$Não há problema em não escrever o nome.$$),
    ('n1-grammar-193', $$日にちは来週でも差し支えない。$$, $$ひにちはらいしゅうでもさしつかえない。$$, $$Não tem inconveniente que a data seja na semana que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は自由に使っ____。$$, $$Pode usar esta sala à vontade.$$),
        (2, $$お支払いはカード____。$$, $$Não há problema em pagar com cartão.$$),
        (3, $$今日中でなく____。$$, $$Não tem problema não ser hoje.$$),
        (4, $$お電話し____でしょうか。$$, $$Haveria algum problema se eu ligasse?$$),
        (5, $$写真を撮っ____。$$, $$Não há problema em tirar fotos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-193', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても差し支えない$$),
        (1, $$ても差し支えありません$$),
        (2, $$でも差し支えない$$),
        (2, $$でも差し支えありません$$),
        (3, $$ても差し支えない$$),
        (3, $$ても差し支えありません$$),
        (4, $$ても差し支えない$$),
        (5, $$ても差し支えない$$),
        (5, $$ても差し支えありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-194 — 〜ても知らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-194',
    'grammar',
    'N1',
    $$〜ても知らない$$,
    $$te mo shiranai$$,
    $$Depois não diga que não avisei / Problema seu / Não me responsabilizo$$,
    $$ても知らない é usado para avisar alguém de que, se algo ruim acontecer, a responsabilidade é da própria pessoa. Equivale a "depois não diga que não avisei" ou "problema seu".

O tom é de advertência, às vezes com irritação. Por exemplo, "se não estudar, vai reprovar, depois não diga que não avisei".

É uma expressão coloquial.$$,
    $$A forma たら知らない também é muito usada, com o mesmo sentido.

É usada com pessoas próximas, como familiares e amigos.$$,
    $$Verbo (forma て) + も知らない / も知らないよ
Verbo (forma たら) + 知らない$$,
    $$ても知らない$$,
    $$ても知らない|でも知らない|ても知らないよ|でも知りません|ても知りません|たら知らない$$,
    ARRAY['て', 'も', '知らない']::text[],
    ARRAY['ても知らない', 'でも知らない', 'たら知らない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-194', $$勉強しないで、試験に落ちても知らないよ。$$, $$べんきょうしないで、しけんにおちてもしらないよ。$$, $$Se não estudar e reprovar, depois não diga que não avisei.$$),
    ('n1-grammar-194', $$そんなに食べて、お腹を壊しても知らないからね。$$, $$そんなにたべて、おなかをこわしてもしらないからね。$$, $$Comendo tanto assim, se passar mal, problema seu.$$),
    ('n1-grammar-194', $$傘を持たないで、雨にぬれても知らないよ。$$, $$かさをもたないで、あめにぬれてもしらないよ。$$, $$Se sair sem guarda-chuva e se molhar, não me responsabilizo.$$),
    ('n1-grammar-194', $$夜更かしして、明日起きられなくても知らない。$$, $$よふかしして、あしたおきられなくてもしらない。$$, $$Se ficar acordado até tarde e não conseguir acordar amanhã, problema seu.$$),
    ('n1-grammar-194', $$先生に言いつけたら知らないぞ。$$, $$せんせいにいいつけたらしらないぞ。$$, $$Se você contar para o professor, vai ver só.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$そんな格好で出かけて、風邪をひい____。$$, $$Saindo assim, se pegar resfriado, depois não diga que não avisei.$$),
        (2, $$早く準備しないと、遅れ____。$$, $$Se não se arrumar logo e se atrasar, problema seu.$$),
        (3, $$無理をして、倒れ____。$$, $$Se forçar e passar mal, não me responsabilizo.$$),
        (4, $$お金を使いすぎて、後で困っ____。$$, $$Se gastar demais e passar aperto depois, problema seu.$$),
        (5, $$宿題をしないで、先生に怒られ____。$$, $$Se não fizer a lição e levar bronca do professor, depois não diga que não avisei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-194', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ても知らないよ$$),
        (1, $$ても知らない$$),
        (2, $$ても知らないよ$$),
        (2, $$ても知らない$$),
        (3, $$ても知らないよ$$),
        (3, $$ても知らない$$),
        (4, $$ても知らないよ$$),
        (4, $$ても知らない$$),
        (5, $$ても知らないよ$$),
        (5, $$ても知らない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-195 — 〜と相まって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-195',
    'grammar',
    'N1',
    $$〜と相まって$$,
    $$to aimatte$$,
    $$Somado a / Combinado com / Junto com$$,
    $$と相まって indica que dois fatores se combinam e produzem um efeito maior. Equivale a "somado a" ou "combinado com".

Muitas vezes os dois fatores se reforçam, para o bem ou para o mal. Por exemplo, "o bom tempo, somado ao feriado, trouxe muitos turistas".

É uma expressão formal, comum em textos e notícias.$$,
    $$Também é escrito とあいまって.

A forma も相まって também é muito usada, como 天気も相まって.$$,
    $$Substantivo + と相まって
Substantivo + が + Substantivo + と相まって$$,
    $$と相まって$$,
    $$と相まって|も相まって|が相まって|とあいまって|があいまって$$,
    ARRAY['と', '相まって']::text[],
    ARRAY['と相まって', 'も相まって', 'が相まって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-195', $$好天と連休が相まって、観光地は大変なにぎわいだった。$$, $$こうてんとれんきゅうがあいまって、かんこうちはたいへんなにぎわいだった。$$, $$O bom tempo, somado ao feriado prolongado, deixou os pontos turísticos muito movimentados.$$),
    ('n1-grammar-195', $$彼の才能は努力と相まって、大きく花開いた。$$, $$かれのさいのうはどりょくとあいまって、おおきくはなひらいた。$$, $$O talento dele, combinado com o esforço, floresceu muito.$$),
    ('n1-grammar-195', $$美しい音楽と相まって、映画はさらに感動的になった。$$, $$うつくしいおんがくとあいまって、えいがはさらにかんどうてきになった。$$, $$Junto com a bela música, o filme ficou ainda mais emocionante.$$),
    ('n1-grammar-195', $$円安も相まって、外国人観光客が増えた。$$, $$えんやすもあいまって、がいこくじんかんこうきゃくがふえた。$$, $$Somado ao iene fraco, o número de turistas estrangeiros aumentou.$$),
    ('n1-grammar-195', $$疲れと寝不足が相まって、体調を崩した。$$, $$つかれとねぶそくがあいまって、たいちょうをくずした。$$, $$O cansaço, combinado com a falta de sono, me deixou doente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$景色の美しさ____、旅行は最高だった。$$, $$Somado à beleza da paisagem, a viagem foi excelente.$$),
        (2, $$新鮮な材料と料理人の腕____、絶品の料理ができた。$$, $$Ingredientes frescos, combinados com a habilidade do cozinheiro, resultaram num prato excelente.$$),
        (3, $$値段の安さ____、この商品はよく売れている。$$, $$Somado ao preço baixo, este produto está vendendo bem.$$),
        (4, $$不景気____、失業者が増えている。$$, $$Somado à recessão, o número de desempregados está aumentando.$$),
        (5, $$彼女の歌声は演奏____、観客を魅了した。$$, $$A voz dela, combinada com a música, encantou o público.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-195', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と相まって$$),
        (1, $$も相まって$$),
        (1, $$とあいまって$$),
        (2, $$が相まって$$),
        (3, $$と相まって$$),
        (3, $$も相まって$$),
        (3, $$とあいまって$$),
        (4, $$と相まって$$),
        (4, $$も相まって$$),
        (4, $$とあいまって$$),
        (5, $$と相まって$$),
        (5, $$とあいまって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-196 — 〜とあれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-196',
    'grammar',
    'N1',
    $$〜とあれば$$,
    $$to areba$$,
    $$Se for para / Se é para / Sendo para$$,
    $$とあれば indica que, se a situação for aquela, a pessoa está disposta a fazer algo especial, mesmo difícil. Equivale a "se for para" ou "se é para".

Muitas vezes mostra uma grande dedicação a algo ou alguém. Por exemplo, "se for pelos filhos, os pais fazem qualquer coisa".

É uma expressão um pouco formal.$$,
    $$Costuma aparecer como のためとあれば, "se for por...".

A segunda parte costuma mostrar disposição para fazer qualquer coisa.$$,
    $$Substantivo + とあれば
Verbo (forma simples) + とあれば
Substantivo + のためとあれば$$,
    $$とあれば$$,
    $$とあれば|とあらば$$,
    ARRAY['と', 'あれば']::text[],
    ARRAY['とあれば', 'とあらば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-196', $$子供のためとあれば、親は何でもする。$$, $$こどものためとあれば、おやはなんでもする。$$, $$Se for pelos filhos, os pais fazem qualquer coisa.$$),
    ('n1-grammar-196', $$社長の命令とあれば、従うしかない。$$, $$しゃちょうのめいれいとあれば、したがうしかない。$$, $$Se é ordem do presidente, só resta obedecer.$$),
    ('n1-grammar-196', $$あなたの頼みとあれば、断れません。$$, $$あなたのたのみとあれば、ことわれません。$$, $$Sendo um pedido seu, não posso recusar.$$),
    ('n1-grammar-196', $$必要とあれば、いつでも手伝います。$$, $$ひつようとあれば、いつでもてつだいます。$$, $$Se for necessário, ajudo a qualquer momento.$$),
    ('n1-grammar-196', $$好きな歌手のコンサートとあれば、遠くても行く。$$, $$すきなかしゅのコンサートとあれば、とおくてもいく。$$, $$Se for show do meu cantor favorito, vou mesmo que seja longe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家族のため____、どんな苦労もいとわない。$$, $$Se for pela família, não me importo com nenhum sacrifício.$$),
        (2, $$君の頼み____、喜んで引き受けるよ。$$, $$Sendo um pedido seu, aceito com prazer.$$),
        (3, $$お客様のご希望____、すぐに対応します。$$, $$Se for o desejo do cliente, atendemos imediatamente.$$),
        (4, $$必要____、もう一度説明します。$$, $$Se for necessário, explico mais uma vez.$$),
        (5, $$夢をかなえるため____、海外にも行く。$$, $$Se for para realizar o meu sonho, vou até para o exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-196', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とあれば$$),
        (1, $$とあらば$$),
        (2, $$とあれば$$),
        (2, $$とあらば$$),
        (3, $$とあれば$$),
        (3, $$とあらば$$),
        (4, $$とあれば$$),
        (4, $$とあらば$$),
        (5, $$とあれば$$),
        (5, $$とあらば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-197 — 〜とあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-197',
    'grammar',
    'N1',
    $$〜とあって$$,
    $$to atte$$,
    $$Por ser / Como / Já que$$,
    $$とあって indica uma situação especial que explica um resultado natural. Equivale a "por ser" ou "como".

É muito usado em notícias e descrições para explicar por que algo aconteceu. Por exemplo, "como era feriado, o parque estava cheio" ou "por ser o último dia, muita gente veio".

É uma expressão formal e objetiva.$$,
    $$Não se usa para falar de si mesmo.

A segunda parte descreve um fato, não um desejo ou uma ordem.

É parecido com ので e だから, mas とあって destaca que a situação é especial.$$,
    $$Substantivo + とあって
Verbo / Adjetivo (forma simples) + とあって$$,
    $$とあって$$,
    $$とあって$$,
    ARRAY['と', 'あって']::text[],
    ARRAY['とあって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-197', $$連休とあって、空港は旅行客でいっぱいだった。$$, $$れんきゅうとあって、くうこうはりょこうきゃくでいっぱいだった。$$, $$Por ser feriado prolongado, o aeroporto estava cheio de viajantes.$$),
    ('n1-grammar-197', $$最終日とあって、会場には多くの人が訪れた。$$, $$さいしゅうびとあって、かいじょうにはおおくのひとがおとずれた。$$, $$Como era o último dia, muitas pessoas visitaram o local.$$),
    ('n1-grammar-197', $$人気歌手が来るとあって、ファンが集まった。$$, $$にんきかしゅがくるとあって、ファンがあつまった。$$, $$Como um cantor famoso viria, os fãs se reuniram.$$),
    ('n1-grammar-197', $$初めての海外旅行とあって、彼女は緊張していた。$$, $$はじめてのかいがいりょこうとあって、かのじょはきんちょうしていた。$$, $$Por ser a primeira viagem ao exterior, ela estava nervosa.$$),
    ('n1-grammar-197', $$年に一度の祭りとあって、町はにぎわっている。$$, $$ねんにいちどのまつりとあって、まちはにぎわっている。$$, $$Por ser o festival anual, a cidade está movimentada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏休み____、プールは子供でいっぱいだ。$$, $$Por serem férias de verão, a piscina está cheia de crianças.$$),
        (2, $$セール中____、店は大混雑している。$$, $$Como está em liquidação, a loja está lotada.$$),
        (3, $$決勝戦____、スタジアムは満員だった。$$, $$Por ser a final, o estádio estava lotado.$$),
        (4, $$無料で参加できる____、多くの申し込みがあった。$$, $$Como dava para participar de graça, houve muitas inscrições.$$),
        (5, $$久しぶりの晴れ____、公園は家族連れでにぎわった。$$, $$Por ser um dia de sol depois de muito tempo, o parque ficou cheio de famílias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-197', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とあって$$),
        (2, $$とあって$$),
        (3, $$とあって$$),
        (4, $$とあって$$),
        (5, $$とあって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-198 — 〜とばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-198',
    'grammar',
    'N1',
    $$〜とばかりに$$,
    $$to bakari ni$$,
    $$Como se dissesse / Como quem diz / Como se fosse$$,
    $$とばかりに indica que alguém não disse nada, mas a atitude ou expressão deixava claro o que pensava. Equivale a "como se dissesse" ou "como quem diz".

Por exemplo, "ele me olhou como quem diz 'saia daqui'".

Também pode indicar que alguém aproveitou uma oportunidade com entusiasmo, como "aproveitando a chance, ele começou a falar".$$,
    $$Expressões comuns são ここぞとばかりに e 待ってましたとばかりに.

Não se usa para falar de si mesmo.$$,
    $$Frase (fala imaginada) + とばかりに + Ação
Substantivo + とばかりに$$,
    $$とばかりに$$,
    $$とばかりに|とばかり$$,
    ARRAY['と', 'ばかり', 'に']::text[],
    ARRAY['とばかりに', 'とばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-198', $$彼は早く帰れとばかりに、時計を見た。$$, $$かれははやくかえれとばかりに、とけいをみた。$$, $$Ele olhou o relógio como quem diz: vá embora logo.$$),
    ('n1-grammar-198', $$子供はもういらないとばかりに、お皿を押しのけた。$$, $$こどもはもういらないとばかりに、おさらをおしのけた。$$, $$A criança empurrou o prato como se dissesse: não quero mais.$$),
    ('n1-grammar-198', $$ここぞとばかりに、彼は自分の意見を述べた。$$, $$ここぞとばかりに、かれはじぶんのいけんをのべた。$$, $$Aproveitando a chance, ele expôs sua opinião.$$),
    ('n1-grammar-198', $$待ってましたとばかりに、観客は拍手をした。$$, $$まってましたとばかりに、かんきゃくははくしゅをした。$$, $$O público aplaudiu como quem diz: finalmente!$$),
    ('n1-grammar-198', $$彼女は知らないとばかりに、横を向いた。$$, $$かのじょはしらないとばかりに、よこをむいた。$$, $$Ela virou o rosto como quem diz: não sei de nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店員は早く買え____、こちらを見ていた。$$, $$O vendedor me olhava como quem diz: compre logo.$$),
        (2, $$犬は遊んでほしい____、しっぽを振った。$$, $$O cachorro abanou o rabo como se dissesse: brinque comigo.$$),
        (3, $$ここぞ____、セールで買い物をした。$$, $$Aproveitando a chance, fiz compras na liquidação.$$),
        (4, $$彼はお前のせいだ____、私をにらんだ。$$, $$Ele me encarou como quem diz: a culpa é sua.$$),
        (5, $$待ってました____、子供たちはケーキに飛びついた。$$, $$As crianças avançaram no bolo como quem diz: finalmente!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-198', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とばかりに$$),
        (2, $$とばかりに$$),
        (3, $$とばかりに$$),
        (4, $$とばかりに$$),
        (5, $$とばかりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-199 — 〜といえども
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-199',
    'grammar',
    'N1',
    $$〜といえども$$,
    $$to iedomo$$,
    $$Mesmo sendo / Embora / Ainda que$$,
    $$といえども indica que, mesmo considerando uma condição especial, a conclusão é diferente do que se esperaria. Equivale a "mesmo sendo" ou "embora".

Muitas vezes a primeira parte é alguém ou algo de alto nível, e a segunda mostra que nem assim algo é possível ou permitido. Por exemplo, "mesmo sendo criança, deve-se seguir as regras" ou "mesmo um especialista pode errar".

É uma expressão muito formal.$$,
    $$É uma forma formal de といっても e でも.

Expressões comuns são 子供といえども, プロといえども e 一日といえども.$$,
    $$Substantivo + といえども
Verbo / Adjetivo (forma simples) + といえども
たとえ / いかに + 〜といえども$$,
    $$といえども$$,
    $$といえども|と言えども$$,
    ARRAY['と', 'いえども']::text[],
    ARRAY['といえども', 'と言えども']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-199', $$子供といえども、ルールは守らなければならない。$$, $$こどもといえども、ルールはまもらなければならない。$$, $$Mesmo sendo criança, é preciso seguir as regras.$$),
    ('n1-grammar-199', $$専門家といえども、間違えることはある。$$, $$せんもんかといえども、まちがえることはある。$$, $$Mesmo um especialista às vezes erra.$$),
    ('n1-grammar-199', $$いかに忙しいといえども、食事はとるべきだ。$$, $$いかにいそがしいといえども、しょくじはとるべきだ。$$, $$Por mais ocupado que esteja, deve-se comer.$$),
    ('n1-grammar-199', $$一日といえども、練習を休むわけにはいかない。$$, $$いちにちといえども、れんしゅうをやすむわけにはいかない。$$, $$Não posso faltar ao treino, nem que seja um dia.$$),
    ('n1-grammar-199', $$社長といえども、法律には従わなければならない。$$, $$しゃちょうといえども、ほうりつにはしたがわなければならない。$$, $$Mesmo sendo presidente, é preciso obedecer à lei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$プロ____、失敗することはある。$$, $$Mesmo um profissional às vezes falha.$$),
        (2, $$たとえ親____、子供の手紙を勝手に読んではいけない。$$, $$Mesmo sendo pai, não se deve ler as cartas dos filhos sem permissão.$$),
        (3, $$春____、朝晩はまだ寒い。$$, $$Embora seja primavera, de manhã e à noite ainda faz frio.$$),
        (4, $$一円____、無駄にしてはいけない。$$, $$Não se deve desperdiçar nem um único iene.$$),
        (5, $$大企業____、倒産する可能性はある。$$, $$Mesmo uma grande empresa pode falir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-199', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といえども$$),
        (1, $$と言えども$$),
        (2, $$といえども$$),
        (2, $$と言えども$$),
        (3, $$といえども$$),
        (3, $$と言えども$$),
        (4, $$といえども$$),
        (4, $$と言えども$$),
        (5, $$といえども$$),
        (5, $$と言えども$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-200 — 〜と言えなくもない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-200',
    'grammar',
    'N1',
    $$〜と言えなくもない$$,
    $$to ienaku mo nai$$,
    $$Pode-se dizer que / Não deixa de ser / Até que dá para dizer$$,
    $$と言えなくもない é uma dupla negação que expressa uma opinião com cautela. Equivale a "pode-se dizer que" ou "não deixa de ser".

A pessoa admite uma ideia, mas sem muita certeza ou entusiasmo. Por exemplo, "pode-se dizer que este resultado é um sucesso" ou "não deixa de ser verdade".

É uma forma indireta e um pouco formal.$$,
    $$É parecido com と言えないこともない, que tem o mesmo sentido.

É usado quando a pessoa não quer afirmar algo com força.$$,
    $$Frase (forma simples) + と言えなくもない
Substantivo / Adjetivo な + だ + と言えなくもない$$,
    $$と言えなくもない$$,
    $$と言えなくもない|といえなくもない|と言えないこともない|と言えなくもありません$$,
    ARRAY['と', '言えなく', 'も', 'ない']::text[],
    ARRAY['と言えなくもない', 'と言えないこともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-200', $$この結果は、成功だと言えなくもない。$$, $$このけっかは、せいこうだといえなくもない。$$, $$Pode-se dizer que este resultado é um sucesso.$$),
    ('n1-grammar-200', $$彼の意見も、正しいと言えなくもない。$$, $$かれのいけんも、ただしいといえなくもない。$$, $$A opinião dele também não deixa de estar correta.$$),
    ('n1-grammar-200', $$この料理は、おいしいと言えなくもない。$$, $$このりょうりは、おいしいといえなくもない。$$, $$Até que dá para dizer que esta comida é gostosa.$$),
    ('n1-grammar-200', $$彼女の態度は、少し失礼だと言えないこともない。$$, $$かのじょのたいどは、すこししつれいだといえないこともない。$$, $$A atitude dela não deixa de ser um pouco rude.$$),
    ('n1-grammar-200', $$これも一つの方法だと言えなくもない。$$, $$これもひとつのほうほうだといえなくもない。$$, $$Pode-se dizer que este também é um método.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この絵は、上手だ____。$$, $$Até que dá para dizer que este quadro é bem feito.$$),
        (2, $$彼の行動は、勇気がある____。$$, $$Pode-se dizer que a atitude dele foi corajosa.$$),
        (3, $$この値段なら、安い____。$$, $$Com este preço, não deixa de ser barato.$$),
        (4, $$今回の失敗は、いい経験だった____。$$, $$Pode-se dizer que este fracasso foi uma boa experiência.$$),
        (5, $$彼は天才だ____。$$, $$Até que dá para dizer que ele é um gênio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-200', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言えなくもない$$),
        (1, $$と言えないこともない$$),
        (2, $$と言えなくもない$$),
        (2, $$と言えないこともない$$),
        (3, $$と言えなくもない$$),
        (3, $$と言えないこともない$$),
        (4, $$と言えなくもない$$),
        (4, $$と言えないこともない$$),
        (5, $$と言えなくもない$$),
        (5, $$と言えないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-201 — 〜といい〜といい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-201',
    'grammar',
    'N1',
    $$〜といい〜といい$$,
    $$to ii ~ to ii$$,
    $$Tanto... quanto / Seja... seja / Em todos os aspectos$$,
    $$といい〜といい serve para dar dois exemplos e mostrar que, em todos os aspectos, a avaliação é a mesma. Equivale a "tanto... quanto" ou "seja... seja".

A pessoa avalia algo de forma geral, destacando dois pontos. Pode ser elogio ou crítica. Por exemplo, "tanto o sabor quanto o preço, este restaurante é perfeito".

É uma expressão um pouco formal.$$,
    $$A avaliação no final vale para o todo, não só para os dois exemplos.

É parecido com も〜も, mas といい〜といい destaca que os exemplos representam o conjunto.$$,
    $$Substantivo + といい + Substantivo + といい + Avaliação$$,
    $$といい〜といい$$,
    $$といい$$,
    ARRAY['と', 'いい']::text[],
    ARRAY['といい〜といい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-201', $$味といい値段といい、この店は最高だ。$$, $$あじといいねだんといい、このみせはさいこうだ。$$, $$Tanto no sabor quanto no preço, esta loja é excelente.$$),
    ('n1-grammar-201', $$デザインといい色といい、このドレスは素敵だ。$$, $$デザインといいいろといい、このドレスはすてきだ。$$, $$Seja no design, seja na cor, este vestido é lindo.$$),
    ('n1-grammar-201', $$顔といい声といい、彼は父親にそっくりだ。$$, $$かおといいこえといい、かれはちちおやにそっくりだ。$$, $$Tanto no rosto quanto na voz, ele é igualzinho ao pai.$$),
    ('n1-grammar-201', $$態度といい言葉遣いといい、彼は失礼だ。$$, $$たいどといいことばづかいといい、かれはしつれいだ。$$, $$Tanto na atitude quanto no jeito de falar, ele é mal-educado.$$),
    ('n1-grammar-201', $$景色といい料理といい、この旅館は文句なしだ。$$, $$けしきといいりょうりといい、このりょかんはもんくなしだ。$$, $$Seja pela paisagem, seja pela comida, esta pousada é impecável.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$性格____能力といい、彼女はリーダーにふさわしい。$$, $$Tanto pela personalidade quanto pela capacidade, ela é adequada para ser líder.$$),
        (2, $$この部屋は広さといい明るさ____、申し分ない。$$, $$Tanto no tamanho quanto na luminosidade, este quarto é impecável.$$),
        (3, $$服装____髪型といい、彼は目立つ。$$, $$Seja pela roupa, seja pelo cabelo, ele chama a atenção.$$),
        (4, $$ストーリーといい演技____、素晴らしい映画だった。$$, $$Tanto na história quanto na atuação, foi um filme excelente.$$),
        (5, $$天気____会場といい、最高のイベントになった。$$, $$Tanto pelo tempo quanto pelo local, o evento foi excelente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-201', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といい$$),
        (2, $$といい$$),
        (3, $$といい$$),
        (4, $$といい$$),
        (5, $$といい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-202 — 〜といったらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-202',
    'grammar',
    'N1',
    $$〜といったらない$$,
    $$to ittara nai$$,
    $$Indescritível / Não tem palavras / Demais$$,
    $$といったらない indica que um sentimento ou característica é tão intenso que não há palavras para descrevê-lo. Equivale a "indescritível" ou "não tem palavras".

Pode ser usado com coisas boas ou ruins. Por exemplo, "a beleza daquela paisagem é indescritível" ou "a vergonha que passei foi enorme".

A forma といったらありはしない e a forma coloquial ったらない também existem.$$,
    $$Costuma vir com substantivos formados com さ, como 美しさ, 寒さ ou 悔しさ.

Na fala, aparece como ったらない ou ったらありゃしない.$$,
    $$Adjetivo い + といったらない
Adjetivo な / Substantivo + といったらない
Adjetivo い (raiz) + さ + といったらない$$,
    $$といったらない$$,
    $$といったらない|といったらなかった|ったらない|といったらありはしない|といったらありません$$,
    ARRAY['と', 'いったら', 'ない']::text[],
    ARRAY['といったらない', 'ったらない', 'といったらありはしない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-202', $$あの景色の美しさといったらない。$$, $$あのけしきのうつくしさといったらない。$$, $$A beleza daquela paisagem é indescritível.$$),
    ('n1-grammar-202', $$試合に負けた時の悔しさといったらなかった。$$, $$しあいにまけたときのくやしさといったらなかった。$$, $$A frustração quando perdemos a partida foi indescritível.$$),
    ('n1-grammar-202', $$彼の話のつまらなさといったらない。$$, $$かれのはなしのつまらなさといったらない。$$, $$A conversa dele é chata demais.$$),
    ('n1-grammar-202', $$人前で転んだ時の恥ずかしさといったらありはしない。$$, $$ひとまえでころんだときのはずかしさといったらありはしない。$$, $$A vergonha que passei ao cair na frente dos outros foi indescritível.$$),
    ('n1-grammar-202', $$この子のかわいさったらない。$$, $$このこのかわいさったらない。$$, $$Esta criança é fofa demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$初めて富士山を見た時の感動____。$$, $$A emoção quando vi o monte Fuji pela primeira vez foi indescritível.$$),
        (2, $$今朝の寒さ____。$$, $$O frio desta manhã é indescritível.$$),
        (3, $$合格を知った時のうれしさ____。$$, $$A alegria quando soube que passei foi indescritível.$$),
        (4, $$彼の部屋の汚さ____。$$, $$A sujeira do quarto dele é indescritível.$$),
        (5, $$赤ちゃんの寝顔のかわいさ____。$$, $$A fofura do rostinho do bebê dormindo é indescritível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-202', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といったらなかった$$),
        (2, $$といったらない$$),
        (3, $$といったらなかった$$),
        (4, $$といったらない$$),
        (5, $$といったらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-203 — 〜という
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-203',
    'grammar',
    'N1',
    $$〜という$$,
    $$to iu$$,
    $$Nada menos que / Cerca de / Todos os$$,
    $$という, entre um número e um substantivo, destaca que a quantidade é muito grande. Equivale a "nada menos que" ou "cerca de".

Por exemplo, "nada menos que mil pessoas vieram" ou "milhares de estrelas".

Também aparece na estrutura 〜という〜, repetindo a palavra, para indicar "todos os", como "todas as janelas foram quebradas".$$,
    $$Expressões comuns são 何千という人, 何万という星 e 窓という窓.

É uma forma de dar ênfase, não de citar algo.$$,
    $$Número + という + Substantivo
Substantivo + という + Mesmo substantivo$$,
    $$という$$,
    $$という$$,
    ARRAY['と', 'いう']::text[],
    ARRAY['という']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-203', $$コンサートには何万という人が集まった。$$, $$コンサートにはなんまんというひとがあつまった。$$, $$Dezenas de milhares de pessoas se reuniram no show.$$),
    ('n1-grammar-203', $$空には何千という星が輝いていた。$$, $$そらにはなんぜんというほしがかがやいていた。$$, $$Milhares de estrelas brilhavam no céu.$$),
    ('n1-grammar-203', $$台風で、窓という窓が割れた。$$, $$たいふうで、まどというまどがわれた。$$, $$Com o tufão, todas as janelas se quebraram.$$),
    ('n1-grammar-203', $$百年という長い歴史がある店だ。$$, $$ひゃくねんというながいれきしがあるみせだ。$$, $$É uma loja com nada menos que cem anos de história.$$),
    ('n1-grammar-203', $$彼は三十年という長い間、この会社で働いた。$$, $$かれはさんじゅうねんというながいあいだ、このかいしゃではたらいた。$$, $$Ele trabalhou nesta empresa por nada menos que trinta anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この寺には、何百____人が毎日訪れる。$$, $$Centenas de pessoas visitam este templo todos os dias.$$),
        (2, $$店の前には、何十メートル____行列ができていた。$$, $$Havia uma fila de dezenas de metros em frente à loja.$$),
        (3, $$部屋の本____本が床に落ちた。$$, $$Todos os livros do quarto caíram no chão.$$),
        (4, $$千年____歴史を持つ町だ。$$, $$É uma cidade com nada menos que mil anos de história.$$),
        (5, $$何百万____人がその番組を見た。$$, $$Milhões de pessoas assistiram a esse programa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-203', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$という$$),
        (2, $$という$$),
        (3, $$という$$),
        (4, $$という$$),
        (5, $$という$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-204 — 〜というか〜というか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-204',
    'grammar',
    'N1',
    $$〜というか〜というか$$,
    $$to iu ka ~ to iu ka$$,
    $$Ou melhor... ou / Não sei se é... ou / Seja... seja$$,
    $$というか〜というか serve para descrever algo usando duas palavras, porque a pessoa não encontra uma única palavra exata. Equivale a "não sei se é... ou..." ou "seja... seja".

Muitas vezes a pessoa está surpresa ou confusa com algo. Por exemplo, "não sei se ele é corajoso ou imprudente".

É uma expressão coloquial.$$,
    $$Na fala, também aparece como っていうか.

Muitas vezes termina com uma conclusão geral, como 〜人だ ou 〜ことだ.$$,
    $$Substantivo / Adjetivo + というか + Substantivo / Adjetivo + というか$$,
    $$というか〜というか$$,
    $$というか|っていうか$$,
    ARRAY['という', 'か']::text[],
    ARRAY['というか〜というか', 'っていうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-204', $$彼は勇敢というか無謀というか、何でも挑戦する。$$, $$かれはゆうかんというかむぼうというか、なんでもちょうせんする。$$, $$Não sei se ele é corajoso ou imprudente, mas encara qualquer coisa.$$),
    ('n1-grammar-204', $$その話は、悲しいというか、むなしいというか、複雑な気持ちになった。$$, $$そのはなしは、かなしいというか、むなしいというか、ふくざつなきもちになった。$$, $$Essa história me deixou com um sentimento misto, entre triste e vazio.$$),
    ('n1-grammar-204', $$彼女は素直というか単純というか、すぐ信じてしまう。$$, $$かのじょはすなおというかたんじゅんというか、すぐしんじてしまう。$$, $$Não sei se ela é sincera ou ingênua, mas acredita em tudo na hora.$$),
    ('n1-grammar-204', $$この料理は、甘いというか辛いというか、不思議な味だ。$$, $$このりょうりは、あまいというかからいというか、ふしぎなあじだ。$$, $$Este prato tem um sabor estranho, entre doce e apimentado.$$),
    ('n1-grammar-204', $$あの人は真面目というか頑固というか、ルールを絶対に曲げない。$$, $$あのひとはまじめというかがんこというか、ルールをぜったいにまげない。$$, $$Não sei se é seriedade ou teimosia, mas aquela pessoa nunca quebra as regras.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は優しいというか弱い____、人に強く言えない。$$, $$Não sei se ele é gentil ou fraco, mas não consegue falar firme com as pessoas.$$),
        (2, $$あの子は元気____うるさいというか、とにかくよくしゃべる。$$, $$Não sei se essa criança é animada ou barulhenta, mas fala muito.$$),
        (3, $$その映画は怖いというか気持ち悪い____、二度と見たくない。$$, $$Esse filme é assustador ou nojento, sei lá, não quero ver de novo.$$),
        (4, $$彼女は大胆____無神経というか、何でも口に出す。$$, $$Não sei se ela é ousada ou insensível, mas diz tudo o que pensa.$$),
        (5, $$この部屋は広い____寂しいというか、落ち着かない。$$, $$Este quarto é espaçoso ou vazio, sei lá, não me sinto à vontade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-204', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というか$$),
        (2, $$というか$$),
        (3, $$というか$$),
        (4, $$というか$$),
        (5, $$というか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-205 — 〜というもの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-205',
    'grammar',
    'N1',
    $$〜というもの$$,
    $$to iu mono$$,
    $$Durante todo / Por todo esse tempo / Ao longo de$$,
    $$というもの, depois de uma expressão de tempo, indica que algo continuou durante todo aquele período. Equivale a "durante todo" ou "por todo esse tempo".

A pessoa destaca que o período foi longo e que a situação se manteve. Por exemplo, "nestes três dias, não dormi quase nada".

É uma expressão um pouco literária.$$,
    $$Costuma vir com ここ, como ここ一週間というもの.

É diferente de てからというもの, que significa "desde que".$$,
    $$Expressão de tempo + というもの + Situação contínua
ここ + Expressão de tempo + というもの$$,
    $$というもの$$,
    $$というもの$$,
    ARRAY['と', 'いう', 'もの']::text[],
    ARRAY['というもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-205', $$この三日間というもの、ほとんど寝ていない。$$, $$このみっかかんというもの、ほとんどねていない。$$, $$Nestes três dias inteiros, quase não dormi.$$),
    ('n1-grammar-205', $$ここ一週間というもの、雨が降り続いている。$$, $$ここいっしゅうかんというもの、あめがふりつづいている。$$, $$Durante toda esta última semana, não parou de chover.$$),
    ('n1-grammar-205', $$この一年というもの、彼から何の連絡もない。$$, $$このいちねんというもの、かれからなんのれんらくもない。$$, $$Durante todo este ano, não tive nenhuma notícia dele.$$),
    ('n1-grammar-205', $$ここ数か月というもの、仕事が忙しくて休みがない。$$, $$ここすうかげつというもの、しごとがいそがしくてやすみがない。$$, $$Nestes últimos meses, o trabalho está tão corrido que não tenho folga.$$),
    ('n1-grammar-205', $$この十年というもの、彼女は一度も故郷に帰っていない。$$, $$このじゅうねんというもの、かのじょはいちどもこきょうにかえっていない。$$, $$Nestes dez anos, ela não voltou nenhuma vez à terra natal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ここ二、三日____、食欲がない。$$, $$Nestes últimos dois ou três dias, estou sem apetite.$$),
        (2, $$この一か月____、毎日残業している。$$, $$Durante todo este mês, faço hora extra todos os dias.$$),
        (3, $$この半年____、一度も映画を見ていない。$$, $$Nestes seis meses, não vi nenhum filme.$$),
        (4, $$ここ数年____、物価が上がり続けている。$$, $$Nestes últimos anos, os preços não param de subir.$$),
        (5, $$この一週間____、彼女は元気がない。$$, $$Durante toda esta semana, ela anda desanimada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-205', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というもの$$),
        (2, $$というもの$$),
        (3, $$というもの$$),
        (4, $$というもの$$),
        (5, $$というもの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-206 — 〜というところだ / 〜といったところだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-206',
    'grammar',
    'N1',
    $$〜というところだ / 〜といったところだ$$,
    $$to iu tokoro da / to itta tokoro da$$,
    $$Mais ou menos / No máximo / É por aí$$,
    $$というところだ e といったところだ indicam que algo está aproximadamente em um certo nível, geralmente não muito alto. Equivalem a "mais ou menos" ou "no máximo".

A pessoa dá uma estimativa modesta. Por exemplo, "o salário é de no máximo duzentos mil ienes" ou "o resultado foi mais ou menos razoável".

É uma expressão comum na fala.$$,
    $$Muitas vezes a pessoa quer dizer que o nível não é tão grande quanto se imagina.

Também aparece como というところです, mais educado.$$,
    $$Substantivo / Número + というところだ
Substantivo / Número + といったところだ$$,
    $$というところだ$$,
    $$というところだ|といったところだ|というところです|といったところです$$,
    ARRAY['という', 'ところ', 'だ']::text[],
    ARRAY['というところだ', 'といったところだ', 'というところです', 'といったところです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-206', $$ここから駅までは、歩いて十分というところだ。$$, $$ここからえきまでは、あるいてじゅっぷんというところだ。$$, $$Daqui até a estação são uns dez minutos a pé, mais ou menos.$$),
    ('n1-grammar-206', $$この仕事の給料は、月二十万円といったところだ。$$, $$このしごとのきゅうりょうは、つきにじゅうまんえんといったところだ。$$, $$O salário deste trabalho é de no máximo duzentos mil ienes por mês.$$),
    ('n1-grammar-206', $$試験の出来は、まあまあといったところです。$$, $$しけんのできは、まあまあといったところです。$$, $$Fui mais ou menos na prova.$$),
    ('n1-grammar-206', $$参加者は五十人というところだろう。$$, $$さんかしゃはごじゅうにんというところだろう。$$, $$Os participantes devem ser uns cinquenta, é por aí.$$),
    ('n1-grammar-206', $$完成まであと一週間といったところだ。$$, $$かんせいまであといっしゅうかんといったところだ。$$, $$Falta mais ou menos uma semana para terminar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の英語は、日常会話ができる程度____。$$, $$Meu inglês é mais ou menos o suficiente para conversas do dia a dia.$$),
        (2, $$今年の売り上げは、去年と同じくらい____。$$, $$As vendas deste ano estão mais ou menos iguais às do ano passado.$$),
        (3, $$この店の味は、普通____。$$, $$O sabor desta loja é mais ou menos normal.$$),
        (4, $$ゴールまで、あと少し____。$$, $$Falta mais ou menos pouco para chegar ao objetivo.$$),
        (5, $$今の気温は、十度____。$$, $$A temperatura agora está em uns dez graus, é por aí.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-206', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というところだ$$),
        (1, $$といったところだ$$),
        (1, $$というところです$$),
        (1, $$といったところです$$),
        (2, $$というところだ$$),
        (2, $$といったところだ$$),
        (2, $$というところです$$),
        (2, $$といったところです$$),
        (3, $$というところだ$$),
        (3, $$といったところだ$$),
        (3, $$というところです$$),
        (3, $$といったところです$$),
        (4, $$というところだ$$),
        (4, $$といったところだ$$),
        (4, $$というところです$$),
        (4, $$といったところです$$),
        (5, $$というところだ$$),
        (5, $$といったところだ$$),
        (5, $$というところです$$),
        (5, $$といったところです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-207 — 〜というわけだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-207',
    'grammar',
    'N1',
    $$〜というわけだ$$,
    $$to iu wake da$$,
    $$Ou seja / Isso quer dizer que / É por isso que$$,
    $$というわけだ serve para tirar uma conclusão ou dar uma explicação a partir de informações anteriores. Equivale a "ou seja" ou "é por isso que".

A pessoa junta os fatos e chega a um resultado lógico. Por exemplo, "o trem parou, por isso ele se atrasou" ou "ou seja, vamos ter que começar de novo".

É uma expressão muito comum na fala e na escrita.$$,
    $$É parecido com わけだ, mas というわけだ destaca mais a explicação ou o resumo.

Na fala, aparece como ってわけだ.$$,
    $$Frase (forma simples) + というわけだ
Substantivo / Adjetivo な + だ + というわけだ$$,
    $$というわけだ$$,
    $$というわけだ|というわけです|ってわけだ|というわけか$$,
    ARRAY['という', 'わけ', 'だ']::text[],
    ARRAY['というわけだ', 'というわけです', 'ってわけだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-207', $$電車が止まった。それで遅刻したというわけだ。$$, $$でんしゃがとまった。それでちこくしたというわけだ。$$, $$O trem parou. Foi por isso que ele se atrasou.$$),
    ('n1-grammar-207', $$つまり、最初からやり直しというわけです。$$, $$つまり、さいしょからやりなおしというわけです。$$, $$Ou seja, vamos ter que começar de novo.$$),
    ('n1-grammar-207', $$彼は留学していたから、英語が上手というわけだ。$$, $$かれはりゅうがくしていたから、えいごがじょうずというわけだ。$$, $$Ele fez intercâmbio, é por isso que fala bem inglês.$$),
    ('n1-grammar-207', $$毎日練習した結果、優勝できたというわけです。$$, $$まいにちれんしゅうしたけっか、ゆうしょうできたというわけです。$$, $$Treinamos todo dia e, como resultado, vencemos.$$),
    ('n1-grammar-207', $$なるほど、それで彼女は怒っていたってわけだ。$$, $$なるほど、それでかのじょはおこっていたってわけだ。$$, $$Entendi, é por isso que ela estava brava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅から近いので、家賃が高い____。$$, $$Fica perto da estação, é por isso que o aluguel é caro.$$),
        (2, $$彼女は医者の娘だから、病気に詳しい____。$$, $$Ela é filha de médico, é por isso que entende de doenças.$$),
        (3, $$要するに、計画は中止____。$$, $$Ou seja, o plano foi cancelado.$$),
        (4, $$雪が降ったので、試合が延期された____。$$, $$Nevou, por isso a partida foi adiada.$$),
        (5, $$それで、君が代わりに来た____。$$, $$Então é por isso que você veio no lugar dele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-207', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というわけだ$$),
        (1, $$というわけです$$),
        (2, $$というわけだ$$),
        (2, $$というわけです$$),
        (3, $$というわけだ$$),
        (3, $$というわけです$$),
        (4, $$というわけだ$$),
        (4, $$というわけです$$),
        (5, $$というわけだ$$),
        (5, $$というわけか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-208 — 〜というわけではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-208',
    'grammar',
    'N1',
    $$〜というわけではない$$,
    $$to iu wake dewa nai$$,
    $$Não quer dizer que / Não é que / Não significa que$$,
    $$というわけではない serve para negar uma conclusão que os outros poderiam tirar. Equivale a "não quer dizer que" ou "não é que".

A pessoa corrige um possível mal-entendido. Por exemplo, "não é que eu odeie, só não gosto muito" ou "ser caro não quer dizer que seja bom".

Muitas vezes vem com からといって antes.$$,
    $$É parecido com わけではない, mas というわけではない é um pouco mais enfático.

É usado para suavizar uma negação.$$,
    $$Frase (forma simples) + というわけではない
Substantivo / Adjetivo な + だ + というわけではない
〜からといって、〜というわけではない$$,
    $$というわけではない$$,
    $$というわけではない|というわけではありません|というわけじゃない|ってわけじゃない$$,
    ARRAY['という', 'わけ', 'では', 'ない']::text[],
    ARRAY['というわけではない', 'というわけではありません', 'というわけじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-208', $$嫌いというわけではないが、あまり好きではない。$$, $$きらいというわけではないが、あまりすきではない。$$, $$Não é que eu odeie, só não gosto muito.$$),
    ('n1-grammar-208', $$高いからといって、いいものだというわけではない。$$, $$たかいからといって、いいものだというわけではない。$$, $$Ser caro não quer dizer que seja bom.$$),
    ('n1-grammar-208', $$忙しいから行けないというわけではありません。$$, $$いそがしいからいけないというわけではありません。$$, $$Não é que eu não possa ir por estar ocupado.$$),
    ('n1-grammar-208', $$日本人だから、誰でも敬語が上手というわけじゃない。$$, $$にほんじんだから、だれでもけいごがじょうずというわけじゃない。$$, $$Ser japonês não significa que todo mundo seja bom em linguagem honorífica.$$),
    ('n1-grammar-208', $$お金があれば幸せというわけではない。$$, $$おかねがあればしあわせというわけではない。$$, $$Ter dinheiro não quer dizer que se seja feliz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$反対している____が、少し心配だ。$$, $$Não é que eu seja contra, mas estou um pouco preocupado.$$),
        (2, $$有名な大学を出たからといって、仕事ができる____。$$, $$Ter se formado numa universidade famosa não quer dizer que seja bom no trabalho.$$),
        (3, $$毎日運動すれば、やせる____。$$, $$Fazer exercício todo dia não significa que você vá emagrecer.$$),
        (4, $$彼が悪い____が、少し配慮が足りなかった。$$, $$Não é que ele esteja errado, mas faltou um pouco de consideração.$$),
        (5, $$子供だから何もわからない____。$$, $$Ser criança não quer dizer que não entenda nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-208', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というわけではない$$),
        (2, $$というわけではない$$),
        (2, $$というわけではありません$$),
        (2, $$というわけじゃない$$),
        (3, $$というわけではない$$),
        (3, $$というわけではありません$$),
        (3, $$というわけじゃない$$),
        (4, $$というわけではない$$),
        (5, $$というわけではない$$),
        (5, $$というわけではありません$$),
        (5, $$というわけじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-209 — 〜といわず〜といわず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-209',
    'grammar',
    'N1',
    $$〜といわず〜といわず$$,
    $$to iwazu ~ to iwazu$$,
    $$Tanto... quanto / Por todo lado / Sem distinção$$,
    $$といわず〜といわず indica que algo acontece em todos os lugares ou partes, sem exceção. Equivale a "tanto... quanto" ou "por todo lado".

A pessoa dá dois exemplos para mostrar que a situação se aplica a tudo. Por exemplo, "tanto as mãos quanto o rosto ficaram cobertos de lama".

É uma expressão um pouco literária.$$,
    $$Os dois substantivos costumam ser partes de um todo, como partes do corpo, lugares ou horários.

É parecido com も〜も, mas mais enfático.$$,
    $$Substantivo + といわず + Substantivo + といわず$$,
    $$といわず〜といわず$$,
    $$といわず|と言わず$$,
    ARRAY['と', 'いわず']::text[],
    ARRAY['といわず〜といわず', 'と言わず〜と言わず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-209', $$子供は手といわず顔といわず、泥だらけだった。$$, $$こどもはてといわずかおといわず、どろだらけだった。$$, $$A criança estava coberta de lama, tanto nas mãos quanto no rosto.$$),
    ('n1-grammar-209', $$彼は昼といわず夜といわず、働き続けた。$$, $$かれはひるといわずよるといわず、はたらきつづけた。$$, $$Ele trabalhou sem parar, tanto de dia quanto de noite.$$),
    ('n1-grammar-209', $$部屋といわず廊下といわず、本が積んである。$$, $$へやといわずろうかといわず、ほんがつんである。$$, $$Há livros empilhados por todo lado, tanto no quarto quanto no corredor.$$),
    ('n1-grammar-209', $$平日といわず週末といわず、店はいつも混んでいる。$$, $$へいじつといわずしゅうまつといわず、みせはいつもこんでいる。$$, $$A loja está sempre cheia, tanto nos dias úteis quanto no fim de semana.$$),
    ('n1-grammar-209', $$机の上といわず床の上といわず、ごみが散らかっている。$$, $$つくえのうえといわずゆかのうえといわず、ごみがちらかっている。$$, $$Há lixo espalhado por todo lado, tanto em cima da mesa quanto no chão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$蚊に刺されて、腕____足といわず、かゆい。$$, $$Fui picado por mosquitos e coça tudo, tanto os braços quanto as pernas.$$),
        (2, $$彼女は家の中といわず外____、いつも歌っている。$$, $$Ela está sempre cantando, tanto dentro de casa quanto fora.$$),
        (3, $$雨の日____晴れの日といわず、彼は毎日走っている。$$, $$Ele corre todos os dias, tanto com chuva quanto com sol.$$),
        (4, $$壁といわず天井____、落書きだらけだ。$$, $$Está tudo coberto de pichações, tanto as paredes quanto o teto.$$),
        (5, $$朝____夜といわず、電話がかかってくる。$$, $$As ligações chegam a qualquer hora, de manhã ou à noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-209', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といわず$$),
        (1, $$と言わず$$),
        (2, $$といわず$$),
        (2, $$と言わず$$),
        (3, $$といわず$$),
        (3, $$と言わず$$),
        (4, $$といわず$$),
        (4, $$と言わず$$),
        (5, $$といわず$$),
        (5, $$と言わず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-210 — 〜ときている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-210',
    'grammar',
    'N1',
    $$〜ときている$$,
    $$to kite iru$$,
    $$E ainda por cima / E para completar / Sendo ainda$$,
    $$ときている apresenta uma característica especial que, somada a outras, leva a uma conclusão. Equivale a "e ainda por cima" ou "e para completar".

Pode ser usado para elogiar ou criticar. Por exemplo, "o restaurante é gostoso e ainda por cima barato, então vive cheio".

É uma expressão coloquial e enfática.$$,
    $$A segunda parte costuma ser uma conclusão natural, como 人気があるのも当然だ.

Na fala, aparece como ときてる.$$,
    $$Frase (forma simples) + ときている
Substantivo / Adjetivo な + ときている$$,
    $$ときている$$,
    $$ときている|ときてる|ときています$$,
    ARRAY['と', 'きて', 'いる']::text[],
    ARRAY['ときている', 'ときてる', 'ときています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-210', $$この店は安くておいしいときているから、いつも混んでいる。$$, $$このみせはやすくておいしいときているから、いつもこんでいる。$$, $$Esta loja é barata e ainda por cima gostosa, então vive cheia.$$),
    ('n1-grammar-210', $$彼は頭がよくて、ハンサムときている。もてるのも当然だ。$$, $$かれはあたまがよくて、ハンサムときている。もてるのもとうぜんだ。$$, $$Ele é inteligente e ainda por cima bonito. É natural que faça sucesso.$$),
    ('n1-grammar-210', $$給料は安いし、残業も多いときている。辞めたくなるよ。$$, $$きゅうりょうはやすいし、ざんぎょうもおおいときている。やめたくなるよ。$$, $$O salário é baixo e ainda por cima tem muita hora extra. Dá vontade de sair.$$),
    ('n1-grammar-210', $$この部屋は狭いうえに、駅から遠いときている。$$, $$このへやはせまいうえに、えきからとおいときている。$$, $$Este quarto é pequeno e, para completar, longe da estação.$$),
    ('n1-grammar-210', $$あの子はかわいくて、性格もいいときてる。$$, $$あのこはかわいくて、せいかくもいいときてる。$$, $$Essa menina é bonita e ainda por cima tem um ótimo caráter.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は燃費がよくて、値段も安い____。$$, $$Este carro é econômico e ainda por cima barato.$$),
        (2, $$雨が降っているうえに、風も強い____。$$, $$Está chovendo e, para completar, o vento está forte.$$),
        (3, $$彼女は美人で、料理も上手____。$$, $$Ela é bonita e ainda por cima cozinha bem.$$),
        (4, $$この仕事はきついうえに、給料も安い____。$$, $$Este trabalho é pesado e, para completar, o salário é baixo.$$),
        (5, $$あのホテルは景色がよくて、温泉もある____。$$, $$Aquele hotel tem uma vista bonita e ainda por cima tem fonte termal.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-210', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ときている$$),
        (1, $$ときてる$$),
        (2, $$ときている$$),
        (2, $$ときてる$$),
        (3, $$ときている$$),
        (3, $$ときてる$$),
        (4, $$ときている$$),
        (4, $$ときてる$$),
        (5, $$ときている$$),
        (5, $$ときてる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-211 — 〜とみると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-211',
    'grammar',
    'N1',
    $$〜とみると$$,
    $$to miru to$$,
    $$Ao perceber que / Quando viu que / Assim que notou$$,
    $$とみると indica que, ao perceber ou julgar uma situação, alguém reage imediatamente. Equivale a "ao perceber que" ou "quando viu que".

A primeira parte é a avaliação da situação, e a segunda é a reação rápida. Por exemplo, "ao perceber que ia chover, ele recolheu a roupa".

É uma expressão um pouco formal, parecida com と見るや.$$,
    $$Também é escrito と見ると.

Não se usa para falar de si mesmo, mas sim de outras pessoas ou animais.$$,
    $$Frase (forma simples) + とみると + Reação
Frase (forma simples) + と見ると + Reação$$,
    $$とみると$$,
    $$とみると|と見ると|とみれば|と見れば$$,
    ARRAY['と', 'みる', 'と']::text[],
    ARRAY['とみると', 'と見ると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-211', $$雨が降りそうだとみると、母は洗濯物を取り込んだ。$$, $$あめがふりそうだとみると、はははせんたくものをとりこんだ。$$, $$Ao perceber que ia chover, minha mãe recolheu a roupa.$$),
    ('n1-grammar-211', $$相手が弱いとみると、彼は強気になった。$$, $$あいてがよわいとみると、かれはつよきになった。$$, $$Quando viu que o adversário era fraco, ele ficou confiante.$$),
    ('n1-grammar-211', $$売れると見ると、会社はすぐに生産を増やした。$$, $$うれるとみると、かいしゃはすぐにせいさんをふやした。$$, $$Assim que notou que ia vender, a empresa aumentou a produção.$$),
    ('n1-grammar-211', $$敵が来るとみると、鳥たちは一斉に飛び立った。$$, $$てきがくるとみると、とりたちはいっせいにとびたった。$$, $$Ao perceber que o inimigo vinha, os pássaros voaram todos juntos.$$),
    ('n1-grammar-211', $$勝てないとみると、彼はすぐに作戦を変えた。$$, $$かてないとみると、かれはすぐにさくせんをかえた。$$, $$Quando viu que não ia ganhar, ele mudou a estratégia na hora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店が混んでいる____、彼は別の店に行った。$$, $$Ao perceber que a loja estava cheia, ele foi a outra.$$),
        (2, $$チャンスだ____、選手はシュートを打った。$$, $$Quando viu que era a chance, o atleta chutou.$$),
        (3, $$危ない____、犬は逃げ出した。$$, $$Ao perceber o perigo, o cachorro fugiu.$$),
        (4, $$相手が怒っている____、彼はすぐに謝った。$$, $$Quando viu que o outro estava bravo, ele pediu desculpas na hora.$$),
        (5, $$間に合わない____、彼女はタクシーを呼んだ。$$, $$Ao perceber que não ia dar tempo, ela chamou um táxi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-211', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とみると$$),
        (1, $$と見ると$$),
        (2, $$とみると$$),
        (2, $$と見ると$$),
        (3, $$とみると$$),
        (3, $$と見ると$$),
        (4, $$とみると$$),
        (4, $$と見ると$$),
        (5, $$とみると$$),
        (5, $$と見ると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-212 — 〜と見るや
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-212',
    'grammar',
    'N1',
    $$〜と見るや$$,
    $$to miru ya$$,
    $$No instante em que viu / Assim que percebeu / Mal notou$$,
    $$と見るや indica que, no exato momento em que alguém percebe uma situação, reage imediatamente. Equivale a "no instante em que viu" ou "mal notou".

É mais enfático e literário que とみると, destacando a rapidez da reação. Por exemplo, "no instante em que viu a polícia, o ladrão fugiu".

É uma expressão comum na escrita.$$,
    $$É parecido com や否や e が早いか.

Também é escrito とみるや.

Não se usa para falar de si mesmo.$$,
    $$Frase (forma simples) + と見るや + Reação imediata
Substantivo + と見るや$$,
    $$と見るや$$,
    $$と見るや|とみるや$$,
    ARRAY['と', '見る', 'や']::text[],
    ARRAY['と見るや', 'とみるや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-212', $$警察が来たと見るや、犯人は逃げ出した。$$, $$けいさつがきたとみるや、はんにんはにげだした。$$, $$No instante em que viu a polícia chegar, o criminoso fugiu.$$),
    ('n1-grammar-212', $$チャンスと見るや、彼はすぐに行動した。$$, $$チャンスとみるや、かれはすぐにこうどうした。$$, $$Mal notou a oportunidade, ele agiu na hora.$$),
    ('n1-grammar-212', $$形勢が不利と見るや、相手は作戦を変えた。$$, $$けいせいがふりとみるや、あいてはさくせんをかえた。$$, $$Assim que percebeu que estava em desvantagem, o adversário mudou de estratégia.$$),
    ('n1-grammar-212', $$値段が下がったと見るや、客が殺到した。$$, $$ねだんがさがったとみるや、きゃくがさっとうした。$$, $$No instante em que viram o preço cair, os clientes invadiram a loja.$$),
    ('n1-grammar-212', $$雨がやんだと見るや、子供たちは外に飛び出した。$$, $$あめがやんだとみるや、こどもたちはそとにとびだした。$$, $$Mal notaram que a chuva tinha parado, as crianças saíram correndo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$相手が疲れた____、彼は一気に攻めた。$$, $$No instante em que viu o adversário cansado, ele atacou com tudo.$$),
        (2, $$席が空いた____、彼女はすぐに座った。$$, $$Mal notou que um lugar vagou, ela sentou na hora.$$),
        (3, $$儲かる____、多くの会社が参入した。$$, $$Assim que perceberam que dava lucro, muitas empresas entraram no mercado.$$),
        (4, $$敵が弱った____、兵士たちは前進した。$$, $$No instante em que viram o inimigo enfraquecido, os soldados avançaram.$$),
        (5, $$先生がいない____、生徒たちは騒ぎ始めた。$$, $$Mal perceberam que o professor não estava, os alunos começaram a fazer bagunça.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-212', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と見るや$$),
        (1, $$とみるや$$),
        (2, $$と見るや$$),
        (2, $$とみるや$$),
        (3, $$と見るや$$),
        (3, $$とみるや$$),
        (4, $$と見るや$$),
        (4, $$とみるや$$),
        (5, $$と見るや$$),
        (5, $$とみるや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-213 — 〜となると / 〜となれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-213',
    'grammar',
    'N1',
    $$〜となると / 〜となれば$$,
    $$to naru to / to nareba$$,
    $$Quando se trata de / Se for para / Nesse caso$$,
    $$となると e となれば indicam que, se uma situação se tornar realidade, algo muda ou se torna necessário. Equivalem a "quando se trata de" ou "se for para".

Muitas vezes a pessoa mostra que a situação é especial e exige outra atitude. Por exemplo, "conversar é uma coisa, mas quando se trata de discursar em público, fico nervoso".

Também indicam uma conclusão, como "se for assim, temos que mudar o plano".$$,
    $$É parecido com なら e と, mas となると destaca que a situação é especial ou importante.

A forma となったら também é usada.$$,
    $$Substantivo + となると / となれば
Verbo (forma simples) + となると / となれば$$,
    $$となると$$,
    $$となると|となれば|となったら$$,
    ARRAY['と', 'なる', 'と']::text[],
    ARRAY['となると', 'となれば', 'となったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-213', $$話すのは平気だが、人前でスピーチとなると緊張する。$$, $$はなすのはへいきだが、ひとまえでスピーチとなるときんちょうする。$$, $$Conversar não me incomoda, mas quando se trata de discursar em público, fico nervoso.$$),
    ('n1-grammar-213', $$留学するとなれば、お金がたくさん必要だ。$$, $$りゅうがくするとなれば、おかねがたくさんひつようだ。$$, $$Se for para fazer intercâmbio, vai precisar de muito dinheiro.$$),
    ('n1-grammar-213', $$彼が来ないとなると、計画を変えなければならない。$$, $$かれがこないとなると、けいかくをかえなければならない。$$, $$Se ele não vier, vamos ter que mudar o plano.$$),
    ('n1-grammar-213', $$いざ結婚となると、決めることがたくさんある。$$, $$いざけっこんとなると、きめることがたくさんある。$$, $$Quando chega a hora de casar, há muita coisa para decidir.$$),
    ('n1-grammar-213', $$一人で行くとなったら、少し不安だ。$$, $$ひとりでいくとなったら、すこしふあんだ。$$, $$Se for para ir sozinho, fico um pouco inseguro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理は好きだが、毎日作る____大変だ。$$, $$Gosto de cozinhar, mas quando se trata de fazer todo dia, é difícil.$$),
        (2, $$家を買う____、よく考えなければならない。$$, $$Se for para comprar uma casa, é preciso pensar bem.$$),
        (3, $$会議が中止____、資料は必要ない。$$, $$Se a reunião for cancelada, os materiais não serão necessários.$$),
        (4, $$社長が出席する____、準備をしっかりしないと。$$, $$Se o presidente for participar, temos que nos preparar bem.$$),
        (5, $$いざ本番____、手が震えてしまう。$$, $$Quando chega a hora da apresentação, minhas mãos tremem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-213', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$となると$$),
        (1, $$となれば$$),
        (1, $$となったら$$),
        (2, $$となると$$),
        (2, $$となれば$$),
        (2, $$となったら$$),
        (3, $$となると$$),
        (3, $$となれば$$),
        (3, $$となったら$$),
        (4, $$となると$$),
        (4, $$となれば$$),
        (4, $$となったら$$),
        (5, $$となると$$),
        (5, $$となれば$$),
        (5, $$となったら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-214 — 〜とされる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-214',
    'grammar',
    'N1',
    $$〜とされる$$,
    $$to sareru$$,
    $$É considerado / Diz-se que / Acredita-se que$$,
    $$とされる indica que algo é considerado ou aceito de forma geral, por pessoas, especialistas ou pela sociedade. Equivale a "é considerado" ou "diz-se que".

É uma expressão objetiva e formal, usada em textos, notícias e explicações. Por exemplo, "este templo é considerado o mais antigo do Japão".

A forma とされている é a mais comum.$$,
    $$É parecido com と言われている, mas とされる é mais formal.

Muitas vezes é usado para regras ou definições, como 〜は禁止とされている.$$,
    $$Frase (forma simples) + とされる / とされている
Substantivo + とされる$$,
    $$とされる$$,
    $$とされる|とされている|とされています|とされた|とされて$$,
    ARRAY['と', 'される']::text[],
    ARRAY['とされる', 'とされている', 'とされています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-214', $$この寺は日本で一番古いとされている。$$, $$このてらはにほんでいちばんふるいとされている。$$, $$Este templo é considerado o mais antigo do Japão.$$),
    ('n1-grammar-214', $$この地域では、白い鳥は幸運のしるしとされる。$$, $$このちいきでは、しろいとりはこううんのしるしとされる。$$, $$Nesta região, os pássaros brancos são considerados sinal de boa sorte.$$),
    ('n1-grammar-214', $$ストレスは多くの病気の原因とされている。$$, $$ストレスはおおくのびょうきのげんいんとされている。$$, $$Acredita-se que o estresse seja a causa de muitas doenças.$$),
    ('n1-grammar-214', $$この絵は有名な画家の作品とされています。$$, $$このえはゆうめいながかのさくひんとされています。$$, $$Diz-se que este quadro é obra de um pintor famoso.$$),
    ('n1-grammar-214', $$館内での撮影は禁止とされている。$$, $$かんないでのさつえいはきんしとされている。$$, $$Fotografar dentro do prédio é considerado proibido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この薬は効果がある____。$$, $$Considera-se que este remédio é eficaz.$$),
        (2, $$日本では、四は縁起が悪い数字____。$$, $$No Japão, o quatro é considerado um número de azar.$$),
        (3, $$この遺跡は二千年前のもの____。$$, $$Acredita-se que estas ruínas sejam de dois mil anos atrás.$$),
        (4, $$運動不足は肥満の原因____。$$, $$Considera-se que a falta de exercício seja causa de obesidade.$$),
        (5, $$この行為は法律違反____。$$, $$Este ato é considerado uma violação da lei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-214', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とされる$$),
        (1, $$とされている$$),
        (1, $$とされています$$),
        (2, $$とされる$$),
        (2, $$とされている$$),
        (2, $$とされています$$),
        (3, $$とされる$$),
        (3, $$とされている$$),
        (3, $$とされています$$),
        (4, $$とされる$$),
        (4, $$とされている$$),
        (4, $$とされています$$),
        (5, $$とされる$$),
        (5, $$とされている$$),
        (5, $$とされています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-215 — 〜ときたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-215',
    'grammar',
    'N1',
    $$〜ときたら$$,
    $$to kitara$$,
    $$Quanto a / Falando de / Esse aí$$,
    $$ときたら apresenta uma pessoa ou coisa como tema, geralmente para criticar ou reclamar. Equivale a "quanto a..." ou "falando de...".

O tom é de irritação, desaprovação ou desânimo. Por exemplo, "quanto ao meu marido, não ajuda em nada em casa".

É uma expressão coloquial.$$,
    $$Costuma ser usado com pessoas próximas, como família, colegas ou vizinhos.

É parecido com といったら e は, mas ときたら sempre tem tom negativo.$$,
    $$Substantivo + ときたら + Crítica / Reclamação$$,
    $$ときたら$$,
    $$ときたら$$,
    ARRAY['と', 'きたら']::text[],
    ARRAY['ときたら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-215', $$うちの夫ときたら、家事を全然手伝わない。$$, $$うちのおっとときたら、かじをぜんぜんてつだわない。$$, $$Quanto ao meu marido, não ajuda em nada nas tarefas de casa.$$),
    ('n1-grammar-215', $$最近の若者ときたら、挨拶もできない。$$, $$さいきんのわかものときたら、あいさつもできない。$$, $$Os jovens de hoje nem sabem cumprimentar.$$),
    ('n1-grammar-215', $$この部屋ときたら、狭くて暗い。$$, $$このへやときたら、せまくてくらい。$$, $$Este quarto é pequeno e escuro.$$),
    ('n1-grammar-215', $$弟ときたら、ゲームばかりしている。$$, $$おとうとときたら、ゲームばかりしている。$$, $$Quanto ao meu irmão, só fica jogando videogame.$$),
    ('n1-grammar-215', $$あの店のサービスときたら、ひどいものだ。$$, $$あのみせのサービスときたら、ひどいものだ。$$, $$O atendimento daquela loja é horrível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$隣の犬____、一日中ほえている。$$, $$Quanto ao cachorro do vizinho, late o dia inteiro.$$),
        (2, $$うちの息子____、勉強もしないで遊んでばかりだ。$$, $$Quanto ao meu filho, não estuda e só fica brincando.$$),
        (3, $$今年の夏の暑さ____、我慢できない。$$, $$O calor deste verão é insuportável.$$),
        (4, $$あの政治家____、嘘ばかりつく。$$, $$Quanto àquele político, só conta mentiras.$$),
        (5, $$この電車____、毎日遅れる。$$, $$Esse trem aí atrasa todos os dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-215', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ときたら$$),
        (2, $$ときたら$$),
        (3, $$ときたら$$),
        (4, $$ときたら$$),
        (5, $$ときたら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-216 — 〜ところを
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-216',
    'grammar',
    'N1',
    $$〜ところを$$,
    $$tokoro wo$$,
    $$Apesar de / Num momento em que / Bem quando$$,
    $$ところを tem dois usos principais.

O primeiro é usado em agradecimentos e desculpas formais, para mostrar consideração pela situação da outra pessoa. Equivale a "apesar de". Por exemplo, "obrigado por ter vindo apesar de estar tão ocupado".

O segundo indica que alguém foi pego ou visto no momento de fazer algo. Equivale a "bem quando". Por exemplo, "o ladrão foi pego no momento em que roubava".$$,
    $$Expressões comuns são お忙しいところを, お休みのところを e お疲れのところを.

No segundo uso, costuma vir com verbos como 見られる, 見つかる e 捕まる.$$,
    $$Adjetivo い / Substantivo + の + ところを + Agradecimento / Desculpa
Verbo (forma ている / dicionário) + ところを + 見る / 見つかる / 捕まる$$,
    $$ところを$$,
    $$ところを$$,
    ARRAY['ところ', 'を']::text[],
    ARRAY['ところを']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-216', $$お忙しいところを、ありがとうございました。$$, $$おいそがしいところを、ありがとうございました。$$, $$Obrigado por ter vindo apesar de estar tão ocupado.$$),
    ('n1-grammar-216', $$お休みのところを、申し訳ありません。$$, $$おやすみのところを、もうしわけありません。$$, $$Desculpe incomodar no seu dia de folga.$$),
    ('n1-grammar-216', $$泥棒は盗んでいるところを警察に捕まった。$$, $$どろぼうはぬすんでいるところをけいさつにつかまった。$$, $$O ladrão foi pego pela polícia no momento em que roubava.$$),
    ('n1-grammar-216', $$たばこを吸っているところを先生に見られた。$$, $$たばこをすっているところをせんせいにみられた。$$, $$O professor me viu bem quando eu estava fumando.$$),
    ('n1-grammar-216', $$お疲れのところを、すみません。$$, $$おつかれのところを、すみません。$$, $$Desculpe incomodar quando você está cansado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お寒い____、お越しいただきありがとうございます。$$, $$Obrigado por ter vindo apesar do frio.$$),
        (2, $$寝ている____起こしてしまって、ごめんなさい。$$, $$Desculpe ter te acordado enquanto dormia.$$),
        (3, $$カンニングをしている____見つかった。$$, $$Fui descoberto bem quando estava colando.$$),
        (4, $$お食事中の____、失礼します。$$, $$Desculpe interromper sua refeição.$$),
        (5, $$彼女と歩いている____友達に見られた。$$, $$Um amigo me viu bem quando eu estava andando com ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-216', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところを$$),
        (2, $$ところを$$),
        (3, $$ところを$$),
        (4, $$ところを$$),
        (5, $$ところを$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-217 — 〜ともあろうものが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-217',
    'grammar',
    'N1',
    $$〜ともあろうものが$$,
    $$tomo arou mono ga$$,
    $$Logo alguém que é / Justo um / Mesmo sendo$$,
    $$ともあろうものが indica surpresa ou crítica porque alguém em uma posição importante fez algo inadequado. Equivale a "logo alguém que é..." ou "justo um...".

A primeira parte é uma posição respeitada, e a segunda é uma atitude que não combina com ela. Por exemplo, "logo um professor, cometer um erro desses".

É uma expressão formal, com tom de crítica forte.$$,
    $$Também aparece como ともあろう人が.

É usado para criticar quem deveria dar o exemplo.$$,
    $$Substantivo (posição) + ともあろうものが / ともあろう者が
Substantivo + ともあろう + Substantivo$$,
    $$ともあろうものが$$,
    $$ともあろうものが|ともあろう者が|ともあろう人が|ともあろう$$,
    ARRAY['とも', 'あろう', 'もの', 'が']::text[],
    ARRAY['ともあろうものが', 'ともあろう者が', 'ともあろう人が']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-217', $$教師ともあろうものが、生徒に暴力を振るうとは。$$, $$きょうしともあろうものが、せいとにぼうりょくをふるうとは。$$, $$Logo um professor, agredir um aluno...$$),
    ('n1-grammar-217', $$警察官ともあろう者が、法律を破るなんて。$$, $$けいさつかんともあろうものが、ほうりつをやぶるなんて。$$, $$Justo um policial, quebrar a lei...$$),
    ('n1-grammar-217', $$大臣ともあろう人が、そんな発言をするとは驚いた。$$, $$だいじんともあろうひとが、そんなはつげんをするとはおどろいた。$$, $$Fiquei surpreso que logo um ministro fizesse uma declaração dessas.$$),
    ('n1-grammar-217', $$プロともあろうものが、こんな簡単なミスをするなんて。$$, $$プロともあろうものが、こんなかんたんなミスをするなんて。$$, $$Logo um profissional, cometer um erro tão simples...$$),
    ('n1-grammar-217', $$医者ともあろう者が、患者の秘密をもらすとは。$$, $$いしゃともあろうものが、かんじゃのひみつをもらすとは。$$, $$Justo um médico, revelar os segredos dos pacientes...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長____、会社のお金を使い込むとは。$$, $$Logo o presidente, desviar o dinheiro da empresa...$$),
        (2, $$裁判官____、賄賂を受け取るなんて。$$, $$Justo um juiz, aceitar propina...$$),
        (3, $$大学教授____、論文を盗むとは信じられない。$$, $$É inacreditável que logo um professor universitário plagie um artigo.$$),
        (4, $$チャンピオン____、こんな相手に負けるとは。$$, $$Logo o campeão, perder para um adversário desses...$$),
        (5, $$政治家____、嘘をつくなんて許せない。$$, $$É imperdoável que logo um político minta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-217', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともあろうものが$$),
        (1, $$ともあろう者が$$),
        (1, $$ともあろう人が$$),
        (2, $$ともあろうものが$$),
        (2, $$ともあろう者が$$),
        (2, $$ともあろう人が$$),
        (3, $$ともあろうものが$$),
        (3, $$ともあろう者が$$),
        (3, $$ともあろう人が$$),
        (4, $$ともあろうものが$$),
        (4, $$ともあろう者が$$),
        (4, $$ともあろう人が$$),
        (5, $$ともあろうものが$$),
        (5, $$ともあろう者が$$),
        (5, $$ともあろう人が$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-218 — 〜ともなく / 〜ともなしに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-218',
    'grammar',
    'N1',
    $$〜ともなく / 〜ともなしに$$,
    $$tomo naku / tomo nashi ni$$,
    $$Sem querer / Sem intenção / Distraidamente$$,
    $$ともなく e ともなしに indicam que alguém fez algo sem intenção clara, de forma distraída. Equivalem a "sem querer" ou "distraidamente".

Costumam vir com verbos como ver, ouvir ou pensar. Por exemplo, "liguei a TV sem intenção de assistir".

Com palavras interrogativas, como どこからともなく, significam "de algum lugar que não se sabe".$$,
    $$Expressões comuns são 見るともなく見る, 聞くともなく聞く e どこからともなく.

É uma expressão literária.$$,
    $$Verbo (forma dicionário) + ともなく / ともなしに + Mesmo verbo
Palavra interrogativa + ともなく$$,
    $$ともなく$$,
    $$ともなく|ともなしに$$,
    ARRAY['とも', 'なく']::text[],
    ARRAY['ともなく', 'ともなしに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-218', $$見るともなくテレビを見ていた。$$, $$みるともなくテレビをみていた。$$, $$Estava vendo TV sem prestar atenção.$$),
    ('n1-grammar-218', $$聞くともなしに、隣の人の話が聞こえてきた。$$, $$きくともなしに、となりのひとのはなしがきこえてきた。$$, $$Sem querer, acabei ouvindo a conversa de quem estava ao lado.$$),
    ('n1-grammar-218', $$どこからともなく、いいにおいがしてきた。$$, $$どこからともなく、いいにおいがしてきた。$$, $$De algum lugar, veio um cheiro bom.$$),
    ('n1-grammar-218', $$考えるともなく、昔のことを思い出していた。$$, $$かんがえるともなく、むかしのことをおもいだしていた。$$, $$Distraidamente, fiquei lembrando do passado.$$),
    ('n1-grammar-218', $$誰からともなく、拍手が起こった。$$, $$だれからともなく、はくしゅがおこった。$$, $$Sem que se soubesse quem começou, surgiram aplausos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$窓の外を見る____見ていた。$$, $$Estava olhando pela janela distraidamente.$$),
        (2, $$ラジオを聞く____聞いていたら、懐かしい曲が流れた。$$, $$Estava ouvindo rádio sem prestar atenção quando tocou uma música nostálgica.$$),
        (3, $$どこから____、音楽が聞こえてくる。$$, $$De algum lugar, vem o som de música.$$),
        (4, $$誰に言う____、彼はつぶやいた。$$, $$Ele murmurou sem se dirigir a ninguém.$$),
        (5, $$いつから____、二人は付き合い始めた。$$, $$Sem que se saiba quando, os dois começaram a namorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-218', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともなく$$),
        (1, $$ともなしに$$),
        (2, $$ともなく$$),
        (2, $$ともなしに$$),
        (3, $$ともなく$$),
        (4, $$ともなく$$),
        (5, $$ともなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-219 — ともすれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-219',
    'grammar',
    'N1',
    $$ともすれば$$,
    $$tomo sureba$$,
    $$Tendência a / Facilmente / Às vezes acaba$$,
    $$ともすれば indica que algo tende a acontecer facilmente, geralmente algo negativo. Equivale a "facilmente" ou "tendência a".

A pessoa mostra que, se não tomar cuidado, aquilo acaba acontecendo. Por exemplo, "as pessoas tendem a esquecer o que é importante".

Costuma vir junto com がちだ ou しやすい no fim da frase.$$,
    $$A forma ともすると tem o mesmo sentido.

É uma expressão formal, comum na escrita.$$,
    $$ともすれば + Frase + がちだ / しやすい
ともすると + Frase$$,
    $$ともすれば$$,
    $$ともすれば|ともすると$$,
    ARRAY['とも', 'すれば']::text[],
    ARRAY['ともすれば', 'ともすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-219', $$忙しいと、ともすれば家族のことを忘れがちだ。$$, $$いそがしいと、ともすればかぞくのことをわすれがちだ。$$, $$Quando se está ocupado, há a tendência de esquecer a família.$$),
    ('n1-grammar-219', $$人はともすれば、楽な方へ流されやすい。$$, $$ひとはともすれば、らくなほうへながされやすい。$$, $$As pessoas tendem facilmente a ir pelo caminho mais fácil.$$),
    ('n1-grammar-219', $$ともすると、自分の意見ばかり言ってしまう。$$, $$ともすると、じぶんのいけんばかりいってしまう。$$, $$Às vezes acabo falando só da minha opinião.$$),
    ('n1-grammar-219', $$若いころは、ともすれば無理をしがちだ。$$, $$わかいころは、ともすればむりをしがちだ。$$, $$Quando se é jovem, há a tendência de se forçar demais.$$),
    ('n1-grammar-219', $$ともすれば、大切なことを見失ってしまう。$$, $$ともすれば、たいせつなことをみうしなってしまう。$$, $$Facilmente acabamos perdendo de vista o que é importante.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$冬は、____運動不足になりがちだ。$$, $$No inverno, há a tendência de faltar exercício.$$),
        (2, $$____、人は他人と自分を比べてしまう。$$, $$As pessoas facilmente acabam se comparando com os outros.$$),
        (3, $$一人暮らしだと、____食事が偏りがちだ。$$, $$Morando sozinho, há a tendência de ter uma alimentação desequilibrada.$$),
        (4, $$慣れてくると、____注意が足りなくなる。$$, $$Quando a gente se acostuma, facilmente a atenção diminui.$$),
        (5, $$試験前は、____夜更かししがちだ。$$, $$Antes das provas, há a tendência de ficar acordado até tarde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-219', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともすれば$$),
        (1, $$ともすると$$),
        (2, $$ともすれば$$),
        (2, $$ともすると$$),
        (3, $$ともすれば$$),
        (3, $$ともすると$$),
        (4, $$ともすれば$$),
        (4, $$ともすると$$),
        (5, $$ともすれば$$),
        (5, $$ともすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-220 — 〜とも〜とも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-220',
    'grammar',
    'N1',
    $$〜とも〜とも$$,
    $$tomo ~ tomo$$,
    $$Nem... nem / Se... ou se / Seja... seja$$,
    $$とも〜とも apresenta duas possibilidades e mostra que não se sabe qual é a verdadeira, ou que nenhuma foi dita. Equivale a "nem... nem" ou "se... ou se".

Muitas vezes aparece com verbos como dizer, decidir ou responder. Por exemplo, "ele não disse nem que sim, nem que não".

É uma expressão um pouco literária.$$,
    $$Expressões comuns são 行くとも行かないとも言わない e 賛成とも反対とも言わない.

A segunda parte costuma ser negativa.$$,
    $$Verbo / Frase + とも + Verbo / Frase (oposto) + とも + Verbo (dizer / responder)$$,
    $$とも〜とも$$,
    $$とも$$,
    ARRAY['とも']::text[],
    ARRAY['とも〜とも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-220', $$彼は行くとも行かないとも言わなかった。$$, $$かれはいくともいかないともいわなかった。$$, $$Ele não disse nem que ia, nem que não ia.$$),
    ('n1-grammar-220', $$彼女は賛成とも反対とも言わない。$$, $$かのじょはさんせいともはんたいともいわない。$$, $$Ela não diz se é a favor ou contra.$$),
    ('n1-grammar-220', $$その話が本当とも嘘とも判断できない。$$, $$そのはなしがほんとうともうそともはんだんできない。$$, $$Não dá para julgar se essa história é verdade ou mentira.$$),
    ('n1-grammar-220', $$彼はおいしいともまずいとも言わずに食べた。$$, $$かれはおいしいともまずいともいわずにたべた。$$, $$Ele comeu sem dizer se estava gostoso ou ruim.$$),
    ('n1-grammar-220', $$社長は許可するともしないとも答えなかった。$$, $$しゃちょうはきょかするともしないともこたえなかった。$$, $$O presidente não respondeu se ia permitir ou não.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は来る____来ないとも言わなかった。$$, $$Ele não disse nem que vinha, nem que não vinha.$$),
        (2, $$先生はいい____悪いとも言わなかった。$$, $$O professor não disse se estava bom ou ruim.$$),
        (3, $$彼女は好きとも嫌い____言わない。$$, $$Ela não diz se gosta ou não.$$),
        (4, $$結果が成功____失敗とも言えない。$$, $$Não dá para dizer se o resultado foi sucesso ou fracasso.$$),
        (5, $$彼は買う____買わないとも決めていない。$$, $$Ele não decidiu se compra ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-220', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とも$$),
        (2, $$とも$$),
        (3, $$とも$$),
        (4, $$とも$$),
        (5, $$とも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-221 — とりわけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-221',
    'grammar',
    'N1',
    $$とりわけ$$,
    $$toriwake$$,
    $$Especialmente / Sobretudo / Principalmente$$,
    $$とりわけ destaca algo que se sobressai dentro de um grupo. Equivale a "especialmente" ou "sobretudo".

A pessoa fala de várias coisas e depois aponta a mais importante ou marcante. Por exemplo, "gosto de frutas, especialmente de morango".

É uma palavra um pouco formal, parecida com 特に.$$,
    $$É parecido com 特に e 中でも, mas とりわけ é um pouco mais formal.

Também é escrito 取り分け, mas a forma em hiragana é mais comum.$$,
    $$とりわけ + Substantivo / Frase$$,
    $$とりわけ$$,
    $$とりわけ|取り分け$$,
    ARRAY['とりわけ']::text[],
    ARRAY['とりわけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-221', $$果物は何でも好きだが、とりわけいちごが好きだ。$$, $$くだものはなんでもすきだが、とりわけいちごがすきだ。$$, $$Gosto de todas as frutas, mas especialmente de morango.$$),
    ('n1-grammar-221', $$今年の夏は、とりわけ暑かった。$$, $$ことしのなつは、とりわけあつかった。$$, $$O verão deste ano foi especialmente quente.$$),
    ('n1-grammar-221', $$この町は、とりわけ秋の景色が美しい。$$, $$このまちは、とりわけあきのけしきがうつくしい。$$, $$Esta cidade é bonita, sobretudo no outono.$$),
    ('n1-grammar-221', $$彼はスポーツが得意で、とりわけ水泳が上手だ。$$, $$かれはスポーツがとくいで、とりわけすいえいがじょうずだ。$$, $$Ele é bom em esportes, principalmente em natação.$$),
    ('n1-grammar-221', $$日本の文化の中でも、とりわけ茶道に興味がある。$$, $$にほんのぶんかのなかでも、とりわけさどうにきょうみがある。$$, $$Dentro da cultura japonesa, me interesso especialmente pela cerimônia do chá.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の作品はどれもいいが、____この絵が素晴らしい。$$, $$Todas as obras dela são boas, mas especialmente este quadro é excelente.$$),
        (2, $$今日は____寒いので、暖かくしてください。$$, $$Hoje está especialmente frio, então se agasalhe.$$),
        (3, $$この料理は、____スープがおいしい。$$, $$Neste prato, a sopa é especialmente gostosa.$$),
        (4, $$子供たちは、____動物園が好きだ。$$, $$As crianças gostam sobretudo do zoológico.$$),
        (5, $$このクラスの学生は優秀だが、____彼は目立つ。$$, $$Os alunos desta turma são ótimos, mas ele se destaca especialmente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-221', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とりわけ$$),
        (2, $$とりわけ$$),
        (3, $$とりわけ$$),
        (4, $$とりわけ$$),
        (5, $$とりわけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-222 — 〜としたことが
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-222',
    'grammar',
    'N1',
    $$〜としたことが$$,
    $$to shita koto ga$$,
    $$Logo eu / Justo eu / Que vergonha$$,
    $$としたことが expressa surpresa e arrependimento por alguém ter cometido um erro que normalmente não cometeria. Equivale a "logo eu" ou "justo eu".

Geralmente é usado pela própria pessoa para falar de si mesma, com um tom de autocrítica. Por exemplo, "logo eu, esqueci a reunião".

Também pode ser usado para falar de alguém muito confiável que cometeu um erro.$$,
    $$A forma mais comum é 私としたことが.

Costuma terminar com てしまった ou なんて.$$,
    $$Substantivo (pessoa) + としたことが + Erro$$,
    $$としたことが$$,
    $$としたことが$$,
    ARRAY['と', 'した', 'こと', 'が']::text[],
    ARRAY['としたことが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-222', $$私としたことが、会議の時間を忘れてしまった。$$, $$わたしとしたことが、かいぎのじかんをわすれてしまった。$$, $$Logo eu, acabei esquecendo o horário da reunião.$$),
    ('n1-grammar-222', $$僕としたことが、こんな簡単なミスをするなんて。$$, $$ぼくとしたことが、こんなかんたんなミスをするなんて。$$, $$Justo eu, cometer um erro tão simples...$$),
    ('n1-grammar-222', $$あの慎重な彼としたことが、財布を落としたらしい。$$, $$あのしんちょうなかれとしたことが、さいふをおとしたらしい。$$, $$Logo ele, tão cuidadoso, parece que perdeu a carteira.$$),
    ('n1-grammar-222', $$私としたことが、大事な書類を家に置いてきた。$$, $$わたしとしたことが、だいじなしょるいをいえにおいてきた。$$, $$Que vergonha, deixei os documentos importantes em casa.$$),
    ('n1-grammar-222', $$ベテランの彼女としたことが、道に迷ったそうだ。$$, $$ベテランのかのじょとしたことが、みちにまよったそうだ。$$, $$Logo ela, tão experiente, parece que se perdeu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____、約束を忘れてしまった。$$, $$Logo eu, acabei esquecendo a promessa.$$),
        (2, $$僕____、寝坊するなんて。$$, $$Justo eu, dormir demais...$$),
        (3, $$真面目な彼____、遅刻したらしい。$$, $$Logo ele, tão sério, parece que se atrasou.$$),
        (4, $$私____、鍵を閉め忘れた。$$, $$Que vergonha, esqueci de trancar a porta.$$),
        (5, $$料理上手の母____、塩と砂糖を間違えた。$$, $$Logo minha mãe, que cozinha tão bem, confundiu sal com açúcar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-222', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$としたことが$$),
        (2, $$としたことが$$),
        (3, $$としたことが$$),
        (4, $$としたことが$$),
        (5, $$としたことが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-223 — とっさに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-223',
    'grammar',
    'N1',
    $$とっさに$$,
    $$tossa ni$$,
    $$Instintivamente / Num reflexo / Sem pensar$$,
    $$とっさに indica que alguém reage imediatamente a uma situação inesperada, sem tempo para pensar. Equivale a "instintivamente" ou "num reflexo".

Por exemplo, "quando a bola veio, me abaixei instintivamente" ou "sem pensar, menti".

É muito usado para descrever reações rápidas em situações de surpresa ou perigo.$$,
    $$A forma とっさの vem antes de substantivos, como とっさの判断 e とっさの出来事.

É parecido com 思わず, mas とっさに destaca a rapidez da reação.$$,
    $$とっさに + Verbo
とっさの + Substantivo$$,
    $$とっさに$$,
    $$とっさに|とっさの$$,
    ARRAY['とっさ', 'に']::text[],
    ARRAY['とっさに', 'とっさの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-223', $$ボールが飛んできたので、とっさに頭を下げた。$$, $$ボールがとんできたので、とっさにあたまをさげた。$$, $$A bola veio voando, e eu me abaixei instintivamente.$$),
    ('n1-grammar-223', $$名前を聞かれて、とっさに嘘をついてしまった。$$, $$なまえをきかれて、とっさにうそをついてしまった。$$, $$Quando me perguntaram o nome, menti sem pensar.$$),
    ('n1-grammar-223', $$車が来たので、とっさに子供の手を引いた。$$, $$くるまがきたので、とっさにこどものてをひいた。$$, $$Um carro veio e, num reflexo, puxei a mão da criança.$$),
    ('n1-grammar-223', $$とっさの判断で、事故を防ぐことができた。$$, $$とっさのはんだんで、じこをふせぐことができた。$$, $$Graças a uma decisão rápida, conseguimos evitar o acidente.$$),
    ('n1-grammar-223', $$急に質問されて、とっさに答えられなかった。$$, $$きゅうにしつもんされて、とっさにこたえられなかった。$$, $$Me perguntaram de repente e não consegui responder na hora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$転びそうになって、____手すりにつかまった。$$, $$Quase caí e, instintivamente, me segurei no corrimão.$$),
        (2, $$彼は____ブレーキを踏んだ。$$, $$Ele pisou no freio num reflexo.$$),
        (3, $$____のことで、何も言えなかった。$$, $$Foi tão de repente que não consegui dizer nada.$$),
        (4, $$知らない人に話しかけられて、____逃げてしまった。$$, $$Um desconhecido falou comigo e, sem pensar, saí correndo.$$),
        (5, $$彼女は____目を閉じた。$$, $$Ela fechou os olhos instintivamente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-223', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とっさに$$),
        (2, $$とっさに$$),
        (3, $$とっさ$$),
        (4, $$とっさに$$),
        (5, $$とっさに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-224 — 〜とて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-224',
    'grammar',
    'N1',
    $$〜とて$$,
    $$tote$$,
    $$Mesmo / Até mesmo / Mesmo que$$,
    $$とて é uma forma antiga e formal de でも ou だって. Equivale a "mesmo" ou "até mesmo".

A pessoa mostra que, mesmo em um caso especial, a situação é igual. Por exemplo, "mesmo um especialista não sabe a resposta" ou "eu também não sou exceção".

Também aparece como たとて, com o sentido de "mesmo que".$$,
    $$É usado principalmente na escrita e em falas formais.

Expressões comuns são 私とて, 子供とて e いくら〜たとて.$$,
    $$Substantivo + とて
Verbo (forma た) + とて (mesmo que)$$,
    $$とて$$,
    $$とて$$,
    ARRAY['とて']::text[],
    ARRAY['とて', 'たとて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-224', $$私とて、失敗することはある。$$, $$わたしとて、しっぱいすることはある。$$, $$Até mesmo eu às vezes erro.$$),
    ('n1-grammar-224', $$専門家とて、すべてを知っているわけではない。$$, $$せんもんかとて、すべてをしっているわけではない。$$, $$Mesmo um especialista não sabe tudo.$$),
    ('n1-grammar-224', $$子供とて、ルールは守らなければならない。$$, $$こどもとて、ルールはまもらなければならない。$$, $$Mesmo uma criança precisa seguir as regras.$$),
    ('n1-grammar-224', $$今から急いだとて、間に合わないだろう。$$, $$いまからいそいだとて、まにあわないだろう。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-224', $$彼とて、悪気があったわけではない。$$, $$かれとて、わるぎがあったわけではない。$$, $$Até mesmo ele não fez por mal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長____、一人では何もできない。$$, $$Mesmo o presidente não consegue fazer nada sozinho.$$),
        (2, $$母____、毎日料理をするのは大変だろう。$$, $$Até mesmo para minha mãe deve ser difícil cozinhar todos os dias.$$),
        (3, $$いくら謝った____、許してもらえない。$$, $$Mesmo que peça desculpas, não vou ser perdoado.$$),
        (4, $$私____、本当は行きたくない。$$, $$Até mesmo eu, na verdade, não quero ir.$$),
        (5, $$天才____、努力なしには成功できない。$$, $$Mesmo um gênio não consegue ter sucesso sem esforço.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-224', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とて$$),
        (2, $$とて$$),
        (3, $$とて$$),
        (4, $$とて$$),
        (5, $$とて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-225 — 〜とは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-225',
    'grammar',
    'N1',
    $$〜とは$$,
    $$to wa$$,
    $$Que / Quem diria que / É surpreendente que$$,
    $$とは, no fim de uma frase, expressa surpresa, espanto ou indignação diante de algo inesperado. Equivale a "que...!" ou "quem diria que...".

Muitas vezes a frase fica incompleta, porque a emoção já basta. Por exemplo, "quem diria que ele ia passar!" ou "que absurdo ele mentir assim!".

Também é usado para definir algo, com o sentido de "o que é...", como "o que é felicidade?".$$,
    $$No uso de surpresa, costuma terminar com 驚いた, 思わなかった ou ficar sem continuação.

É parecido com なんて, mas とは é mais formal.$$,
    $$Frase (forma simples) + とは (surpresa)
Substantivo + とは + Definição$$,
    $$とは$$,
    $$とは$$,
    ARRAY['と', 'は']::text[],
    ARRAY['とは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-225', $$あの彼が試験に合格するとは。$$, $$あのかれがしけんにごうかくするとは。$$, $$Quem diria que ele ia passar na prova!$$),
    ('n1-grammar-225', $$こんなところで会うとは思わなかった。$$, $$こんなところであうとはおもわなかった。$$, $$Não imaginava que nos encontraríamos num lugar desses.$$),
    ('n1-grammar-225', $$子供にこんなことを言うとは、ひどい親だ。$$, $$こどもにこんなことをいうとは、ひどいおやだ。$$, $$Dizer uma coisa dessas a uma criança, que pai horrível.$$),
    ('n1-grammar-225', $$幸せとは、何だろう。$$, $$しあわせとは、なんだろう。$$, $$O que será a felicidade?$$),
    ('n1-grammar-225', $$一日でこんなに雪が積もるとは驚いた。$$, $$いちにちでこんなにゆきがつもるとはおどろいた。$$, $$Fiquei surpreso que tenha acumulado tanta neve em um dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$まさか彼が犯人だった____。$$, $$Quem diria que ele era o culpado!$$),
        (2, $$十年ぶりに会えるなんて、こんな日が来る____思わなかった。$$, $$Não imaginava que chegaria o dia de nos reencontrarmos depois de dez anos.$$),
        (3, $$友情____、何だろう。$$, $$O que é a amizade?$$),
        (4, $$あんなに簡単な問題を間違える____。$$, $$Que absurdo errar um problema tão fácil!$$),
        (5, $$この年で結婚する____、自分でも驚いている。$$, $$Até eu estou surpreso de me casar nesta idade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-225', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは$$),
        (2, $$とは$$),
        (3, $$とは$$),
        (4, $$とは$$),
        (5, $$とは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-226 — 〜とはいえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-226',
    'grammar',
    'N1',
    $$〜とはいえ$$,
    $$to wa ie$$,
    $$Embora / Apesar de / Mesmo que$$,
    $$とはいえ reconhece um fato, mas mostra que a realidade não é exatamente como se esperaria. Equivale a "embora" ou "apesar de".

A primeira parte admite algo, e a segunda mostra uma ressalva. Por exemplo, "embora seja primavera, ainda faz frio".

Também aparece no começo da frase, com o sentido de "mesmo assim".$$,
    $$É parecido com といっても e けれども, mas とはいえ é mais formal.

Também é escrito とは言え.$$,
    $$Frase (forma simples) + とはいえ
Substantivo + とはいえ
とはいえ、 + Frase (no começo)$$,
    $$とはいえ$$,
    $$とはいえ|とは言え$$,
    ARRAY['と', 'は', 'いえ']::text[],
    ARRAY['とはいえ', 'とは言え']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-226', $$春とはいえ、まだ寒い日が続いている。$$, $$はるとはいえ、まださむいひがつづいている。$$, $$Embora seja primavera, os dias continuam frios.$$),
    ('n1-grammar-226', $$仕事とはいえ、毎日残業するのはつらい。$$, $$しごととはいえ、まいにちざんぎょうするのはつらい。$$, $$Embora seja trabalho, fazer hora extra todo dia é duro.$$),
    ('n1-grammar-226', $$わざとではないとはいえ、迷惑をかけてしまった。$$, $$わざとではないとはいえ、めいわくをかけてしまった。$$, $$Apesar de não ter sido de propósito, acabei causando incômodo.$$),
    ('n1-grammar-226', $$試験は終わった。とはいえ、まだ安心できない。$$, $$しけんはおわった。とはいえ、まだあんしんできない。$$, $$A prova acabou. Mesmo assim, ainda não dá para relaxar.$$),
    ('n1-grammar-226', $$安いとはいえ、この品質では買えない。$$, $$やすいとはいえ、このひんしつではかえない。$$, $$Embora seja barato, com esta qualidade não dá para comprar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、やっていいことと悪いことがある。$$, $$Embora seja criança, há coisas que se pode e não se pode fazer.$$),
        (2, $$夏休み____、毎日宿題がある。$$, $$Apesar de ser férias de verão, há lição de casa todos os dias.$$),
        (3, $$慣れた道____、夜は気をつけて運転しよう。$$, $$Embora seja um caminho conhecido, vamos dirigir com cuidado à noite.$$),
        (4, $$病気は治った。____、無理はしないほうがいい。$$, $$A doença sarou. Mesmo assim, é melhor não forçar.$$),
        (5, $$冗談____、言っていいことではない。$$, $$Mesmo que seja brincadeira, não é algo que se possa dizer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-226', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とはいえ$$),
        (1, $$とは言え$$),
        (2, $$とはいえ$$),
        (2, $$とは言え$$),
        (3, $$とはいえ$$),
        (3, $$とは言え$$),
        (4, $$とはいえ$$),
        (4, $$とは言え$$),
        (5, $$とはいえ$$),
        (5, $$とは言え$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-227 — 〜とは比べものにならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-227',
    'grammar',
    'N1',
    $$〜とは比べものにならない$$,
    $$to wa kurabemono ni naranai$$,
    $$Não tem comparação com / Muito superior a / Nem se compara$$,
    $$とは比べものにならない indica que a diferença entre duas coisas é tão grande que nem dá para comparar. Equivale a "não tem comparação com" ou "nem se compara".

Pode indicar que algo é muito melhor ou muito pior. Por exemplo, "a comida daqui não tem comparação com a de outros lugares".

É uma expressão comum na fala e na escrita.$$,
    $$Também é escrito とは比べ物にならない.

A forma とは比べものにならないほど reforça a diferença.$$,
    $$Substantivo + とは比べものにならない
Substantivo + とは比べものにならないほど + Adjetivo$$,
    $$とは比べものにならない$$,
    $$とは比べものにならない|とは比べ物にならない|とは比べものにならないほど|とは比べものになりません$$,
    ARRAY['と', 'は', '比べもの', 'に', 'ならない']::text[],
    ARRAY['とは比べものにならない', 'とは比べ物にならない', 'とは比べものにならないほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-227', $$この店の味は、他の店とは比べものにならない。$$, $$このみせのあじは、ほかのみせとはくらべものにならない。$$, $$O sabor desta loja não tem comparação com o de outras.$$),
    ('n1-grammar-227', $$今の生活は、昔とは比べものにならないほど便利だ。$$, $$いまのせいかつは、むかしとはくらべものにならないほどべんりだ。$$, $$A vida de hoje é muito mais prática do que antigamente, nem se compara.$$),
    ('n1-grammar-227', $$プロの技術は、素人とは比べ物にならない。$$, $$プロのぎじゅつは、しろうととはくらべものにならない。$$, $$A técnica de um profissional não tem comparação com a de um amador.$$),
    ('n1-grammar-227', $$この部屋の広さは、前の部屋とは比べものにならない。$$, $$このへやのひろさは、まえのへやとはくらべものにならない。$$, $$O tamanho deste quarto nem se compara com o anterior.$$),
    ('n1-grammar-227', $$東京の人口は、私の町とは比べものにならない。$$, $$とうきょうのじんこうは、わたしのまちとはくらべものにならない。$$, $$A população de Tóquio não tem comparação com a da minha cidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しいパソコンの速さは、古いの____。$$, $$A velocidade do computador novo não tem comparação com a do antigo.$$),
        (2, $$本物の美しさは、写真____。$$, $$A beleza do original nem se compara com a da foto.$$),
        (3, $$彼の実力は、私____。$$, $$A habilidade dele é muito superior à minha.$$),
        (4, $$この地域の寒さは、東京____ほど厳しい。$$, $$O frio desta região é muito mais rigoroso que o de Tóquio, nem se compara.$$),
        (5, $$今の技術は、十年前____。$$, $$A tecnologia atual não tem comparação com a de dez anos atrás.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-227', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは比べものにならない$$),
        (1, $$とは比べ物にならない$$),
        (2, $$とは比べものにならない$$),
        (2, $$とは比べ物にならない$$),
        (3, $$とは比べものにならない$$),
        (3, $$とは比べ物にならない$$),
        (4, $$とは比べものにならない$$),
        (4, $$とは比べ物にならない$$),
        (5, $$とは比べものにならない$$),
        (5, $$とは比べ物にならない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-228 — 〜とは打って変わって / 〜とは打って変わり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-228',
    'grammar',
    'N1',
    $$〜とは打って変わって / 〜とは打って変わり$$,
    $$to wa utte kawatte / to wa utte kawari$$,
    $$Completamente diferente de / Ao contrário de / Mudou totalmente$$,
    $$とは打って変わって indica que uma situação mudou de forma total e repentina, ficando oposta ao que era antes. Equivale a "completamente diferente de" ou "ao contrário de".

Por exemplo, "ao contrário de ontem, hoje está um dia lindo" ou "ele está completamente diferente de antes, muito animado".

É uma expressão um pouco formal.$$,
    $$Expressões comuns são 昨日とは打って変わって e 以前とは打って変わって.

Também é escrito とはうって変わって.$$,
    $$Substantivo + とは打って変わって / とは打って変わり$$,
    $$とは打って変わって$$,
    $$とは打って変わって|とは打って変わり|とはうって変わって|とはうってかわって|打って変わって$$,
    ARRAY['と', 'は', '打って', '変わって']::text[],
    ARRAY['とは打って変わって', 'とは打って変わり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-228', $$昨日の雨とは打って変わって、今日はいい天気だ。$$, $$きのうのあめとはうってかわって、きょうはいいてんきだ。$$, $$Ao contrário da chuva de ontem, hoje está um tempo ótimo.$$),
    ('n1-grammar-228', $$以前とは打って変わって、彼は明るくなった。$$, $$いぜんとはうってかわって、かれはあかるくなった。$$, $$Ele ficou animado, completamente diferente de antes.$$),
    ('n1-grammar-228', $$前半とは打って変わり、後半はいい試合になった。$$, $$ぜんはんとはうってかわり、こうはんはいいしあいになった。$$, $$Ao contrário do primeiro tempo, o segundo tempo foi um bom jogo.$$),
    ('n1-grammar-228', $$にぎやかな昼間とは打って変わって、夜の町は静かだ。$$, $$にぎやかなひるまとはうってかわって、よるのまちはしずかだ。$$, $$Ao contrário do dia movimentado, a cidade à noite é silenciosa.$$),
    ('n1-grammar-228', $$彼女は結婚してから、以前とは打って変わって家庭的になった。$$, $$かのじょはけっこんしてから、いぜんとはうってかわってかていてきになった。$$, $$Depois de casar, ela mudou totalmente e ficou caseira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先週の暑さ____、今週は涼しい。$$, $$Ao contrário do calor da semana passada, esta semana está fresca.$$),
        (2, $$去年の不調____、今年は好成績を残した。$$, $$Completamente diferente do mau momento do ano passado, este ano teve ótimos resultados.$$),
        (3, $$試験前の不安な顔____、彼は笑顔だった。$$, $$Ao contrário da cara preocupada antes da prova, ele estava sorrindo.$$),
        (4, $$昔____、この町は観光客でにぎわっている。$$, $$Completamente diferente de antigamente, esta cidade está cheia de turistas.$$),
        (5, $$朝の静けさ____、昼の駅は人でいっぱいだ。$$, $$Ao contrário do silêncio da manhã, a estação ao meio-dia está lotada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-228', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは打って変わって$$),
        (1, $$とは打って変わり$$),
        (2, $$とは打って変わって$$),
        (2, $$とは打って変わり$$),
        (3, $$とは打って変わって$$),
        (3, $$とは打って変わり$$),
        (4, $$とは打って変わって$$),
        (4, $$とは打って変わり$$),
        (5, $$とは打って変わって$$),
        (5, $$とは打って変わり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-229 — 〜つ〜つ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-229',
    'grammar',
    'N1',
    $$〜つ〜つ$$,
    $$tsu ~ tsu$$,
    $$Ora... ora / Um ao outro / Mutuamente$$,
    $$つ〜つ indica que duas ações opostas se alternam repetidamente. Equivale a "ora... ora" ou "um ao outro".

A estrutura usa pares de verbos opostos ou um verbo na forma ativa e passiva. Por exemplo, 抜きつ抜かれつ significa "ora ultrapassando, ora sendo ultrapassado".

Aparece principalmente em expressões fixas.$$,
    $$Expressões comuns são 行きつ戻りつ, 持ちつ持たれつ, 抜きつ抜かれつ e 差しつ差されつ.

持ちつ持たれつ significa "ajuda mútua".$$,
    $$Verbo A (forma ます sem ます) + つ + Verbo B (forma ます sem ます) + つ$$,
    $$〜つ〜つ$$,
    $$つ戻りつ|つ持たれつ|つ抜かれつ|つ差されつ|つ追われつ|つ浮きつ|つ沈みつ$$,
    ARRAY['つ']::text[],
    ARRAY['行きつ戻りつ', '持ちつ持たれつ', '抜きつ抜かれつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-229', $$彼は部屋の前を行きつ戻りつしていた。$$, $$かれはへやのまえをいきつもどりつしていた。$$, $$Ele ficava indo e voltando em frente ao quarto.$$),
    ('n1-grammar-229', $$人間は持ちつ持たれつの関係で生きている。$$, $$にんげんはもちつもたれつのかんけいでいきている。$$, $$Os seres humanos vivem numa relação de ajuda mútua.$$),
    ('n1-grammar-229', $$二人のランナーは抜きつ抜かれつのレースをした。$$, $$ふたりのランナーはぬきつぬかれつのレースをした。$$, $$Os dois corredores fizeram uma corrida em que ora um passava, ora o outro.$$),
    ('n1-grammar-229', $$父と息子は、差しつ差されつお酒を飲んだ。$$, $$ちちとむすこは、さしつさされつおさけをのんだ。$$, $$Pai e filho beberam servindo um ao outro.$$),
    ('n1-grammar-229', $$二台のパトカーは追いつ追われつで走った。$$, $$にだいのパトカーはおいつおわれつではしった。$$, $$As duas viaturas corriam ora perseguindo, ora sendo perseguidas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は駅の前を行き____戻りつしていた。$$, $$Ela ficava indo e voltando em frente à estação.$$),
        (2, $$近所の人とは、持ち____持たれつの関係だ。$$, $$Com os vizinhos, temos uma relação de ajuda mútua.$$),
        (3, $$試合は抜き____抜かれつの接戦だった。$$, $$A partida foi disputada, ora um na frente, ora o outro.$$),
        (4, $$二人は差し____差されつ、夜遅くまで飲んだ。$$, $$Os dois beberam até tarde, servindo um ao outro.$$),
        (5, $$木の葉が川を浮き____沈みつ流れていった。$$, $$As folhas desciam o rio ora boiando, ora afundando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-229', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つ$$),
        (2, $$つ$$),
        (3, $$つ$$),
        (4, $$つ$$),
        (5, $$つ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-230 — 〜尽くす
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-230',
    'grammar',
    'N1',
    $$〜尽くす$$,
    $$tsukusu$$,
    $$Completamente / Até o fim / Totalmente$$,
    $$尽くす, depois de outro verbo, indica que a ação foi feita de forma completa, até não restar nada. Equivale a "completamente" ou "até o fim".

Por exemplo, "comeu tudo até acabar" ou "conhece a cidade completamente".

Sozinho, 尽くす também significa "dedicar-se" a alguém ou algo, como "dedicar-se à família".$$,
    $$Combinações comuns são 食べ尽くす, 使い尽くす, 知り尽くす, 燃え尽きる e 言い尽くす.

全力を尽くす significa "dar o melhor de si".$$,
    $$Verbo (forma ます sem ます) + 尽くす
Substantivo + に + 尽くす (dedicar-se)$$,
    $$尽くす$$,
    $$尽くす|尽くした|尽くして|尽くし|つくす|つくした$$,
    ARRAY['尽くす']::text[],
    ARRAY['尽くす', '尽くした', '尽くして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-230', $$彼はこの町のことを知り尽くしている。$$, $$かれはこのまちのことをしりつくしている。$$, $$Ele conhece esta cidade completamente.$$),
    ('n1-grammar-230', $$お金を使い尽くしてしまった。$$, $$おかねをつかいつくしてしまった。$$, $$Gastei todo o dinheiro até não sobrar nada.$$),
    ('n1-grammar-230', $$子供たちは、ケーキを食べ尽くした。$$, $$こどもたちは、ケーキをたべつくした。$$, $$As crianças comeram o bolo inteiro.$$),
    ('n1-grammar-230', $$全力を尽くしたので、後悔はない。$$, $$ぜんりょくをつくしたので、こうかいはない。$$, $$Dei o meu melhor, então não me arrependo.$$),
    ('n1-grammar-230', $$彼女は家族のために尽くした。$$, $$かのじょはかぞくのためにつくした。$$, $$Ela se dedicou à família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$言いたいことは言い____。$$, $$Disse tudo o que queria dizer.$$),
        (2, $$持っている力をすべて出し____。$$, $$Usei todas as minhas forças até o fim.$$),
        (3, $$彼は料理の技術を知り____いる。$$, $$Ele domina completamente as técnicas culinárias.$$),
        (4, $$試合では最善を____つもりだ。$$, $$Pretendo dar o meu melhor na partida.$$),
        (5, $$この会社のために、三十年間____きた。$$, $$Me dediquei a esta empresa por trinta anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-230', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$尽くした$$),
        (2, $$尽くした$$),
        (3, $$尽くして$$),
        (4, $$尽くす$$),
        (5, $$尽くして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-231 — 〜ってば / 〜ったら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-231',
    'grammar',
    'N1',
    $$〜ってば / 〜ったら$$,
    $$tteba / ttara$$,
    $$Já disse / Ora essa / Puxa$$,
    $$ってば e ったら são partículas coloquiais usadas no fim da frase ou depois de um nome. Têm dois usos principais.

O primeiro, no fim da frase, mostra impaciência porque a pessoa já disse algo e o outro não escuta. Equivale a "já disse!" ou "estou falando!". Por exemplo, "já disse que estou bem!".

O segundo, depois de um nome, mostra irritação, surpresa ou carinho em relação à pessoa. Equivale a "ora essa" ou "puxa". Por exemplo, "puxa, minha mãe esqueceu de novo".$$,
    $$São usados apenas em conversas informais com pessoas próximas.

ったら depois de um nome é parecido com ときたら, mas soa mais leve.$$,
    $$Frase + ってば / ったら
Substantivo (pessoa) + ったら / ってば + Frase$$,
    $$ってば$$,
    $$ってば|ったら$$,
    ARRAY['ってば']::text[],
    ARRAY['ってば', 'ったら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-231', $$大丈夫だってば。心配しないで。$$, $$だいじょうぶだってば。しんぱいしないで。$$, $$Já disse que estou bem. Não se preocupe.$$),
    ('n1-grammar-231', $$早くしてってば。$$, $$はやくしてってば。$$, $$Anda logo, estou falando!$$),
    ('n1-grammar-231', $$お母さんったら、また鍵を忘れたの？$$, $$おかあさんったら、またかぎをわすれたの？$$, $$Puxa, mãe, esqueceu a chave de novo?$$),
    ('n1-grammar-231', $$もう、あなたったら。$$, $$もう、あなたったら。$$, $$Ora essa, você hein.$$),
    ('n1-grammar-231', $$行かないってば。何度言ったらわかるの。$$, $$いかないってば。なんどいったらわかるの。$$, $$Já disse que não vou. Quantas vezes vou ter que repetir?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$知らない____。本当だよ。$$, $$Já disse que não sei. É verdade.$$),
        (2, $$もう寝る____。$$, $$Já disse que vou dormir.$$),
        (3, $$うちの犬____、またスリッパをかんでいる。$$, $$Puxa, nosso cachorro está mordendo o chinelo de novo.$$),
        (4, $$ねえ、聞いてる____。$$, $$Ei, está me ouvindo ou não?$$),
        (5, $$お父さん____、また同じ話をしている。$$, $$Ora essa, o papai está contando a mesma história de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-231', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ってば$$),
        (2, $$ってば$$),
        (3, $$ったら$$),
        (3, $$ってば$$),
        (4, $$ってば$$),
        (4, $$ったら$$),
        (5, $$ったら$$),
        (5, $$ってば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-232 — 〜うちに入らない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-232',
    'grammar',
    'N1',
    $$〜うちに入らない$$,
    $$uchi ni hairanai$$,
    $$Não conta como / Nem dá para chamar de / Não chega a ser$$,
    $$うちに入らない indica que algo é tão pequeno ou simples que nem merece ser considerado como aquilo. Equivale a "não conta como" ou "nem dá para chamar de".

A pessoa minimiza algo, muitas vezes por modéstia ou comparação. Por exemplo, "correr cinco minutos nem conta como exercício".

É uma expressão comum na fala.$$,
    $$É parecido com とは言えない.

Muitas vezes vem com expressões como こんなの ou これくらい.$$,
    $$Substantivo + のうちに入らない
Verbo (forma dicionário) + うちに入らない$$,
    $$うちに入らない$$,
    $$うちに入らない|うちにはいらない|うちに入りません$$,
    ARRAY['うち', 'に', '入らない']::text[],
    ARRAY['うちに入らない', 'うちに入りません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-232', $$五分歩くだけでは、運動のうちに入らない。$$, $$ごふんあるくだけでは、うんどうのうちにはいらない。$$, $$Andar só cinco minutos nem conta como exercício.$$),
    ('n1-grammar-232', $$これくらいの雨は、雨のうちに入らない。$$, $$これくらいのあめは、あめのうちにはいらない。$$, $$Uma chuva dessas nem dá para chamar de chuva.$$),
    ('n1-grammar-232', $$一時間の残業なんて、残業のうちに入らないよ。$$, $$いちじかんのざんぎょうなんて、ざんぎょうのうちにはいらないよ。$$, $$Uma hora extra nem conta como hora extra.$$),
    ('n1-grammar-232', $$私の料理は、料理のうちに入りません。$$, $$わたしのりょうりは、りょうりのうちにはいりません。$$, $$O que eu faço nem dá para chamar de culinária.$$),
    ('n1-grammar-232', $$少し話しただけで、知り合いのうちに入らない。$$, $$すこしはなしただけで、しりあいのうちにはいらない。$$, $$Só conversamos um pouco, não chega a ser um conhecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この程度の寒さは、寒さの____。$$, $$Um frio desses nem conta como frio.$$),
        (2, $$十分の勉強なんて、勉強の____。$$, $$Dez minutos de estudo nem dá para chamar de estudo.$$),
        (3, $$こんなけがは、けがの____よ。$$, $$Um machucado desses nem conta como machucado.$$),
        (4, $$一回会っただけでは、友達の____。$$, $$Ter se encontrado uma vez só não chega a ser amizade.$$),
        (5, $$このくらいの量は、食べた____。$$, $$Uma quantidade dessas nem conta como ter comido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-232', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うちに入らない$$),
        (1, $$うちに入りません$$),
        (2, $$うちに入らない$$),
        (2, $$うちに入りません$$),
        (3, $$うちに入らない$$),
        (4, $$うちに入らない$$),
        (4, $$うちに入りません$$),
        (5, $$うちに入らない$$),
        (5, $$うちに入りません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-233 — 〜わ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-233',
    'grammar',
    'N1',
    $$〜わ$$,
    $$wa$$,
    $$Viu / Hein / Ora$$,
    $$わ, no fim da frase, é uma partícula que dá ênfase leve ou mostra emoção, como surpresa ou decisão. Equivale a "viu", "hein" ou "ora".

No japonês padrão, é usada principalmente por mulheres, de forma suave. No dialeto de Kansai, é usada por todos, com um tom mais forte.

Também aparece como わよ e わね, para chamar a atenção do outro ou buscar concordância.$$,
    $$No japonês padrão, soa feminino e um pouco antiquado.

No dialeto de Kansai, é muito comum, como em 行くわ ou ええわ.

Não se usa em situações formais.$$,
    $$Frase (forma simples) + わ
Frase + わよ / わね$$,
    $$わ$$,
    $$わ。|わよ|わね$$,
    ARRAY['わ']::text[],
    ARRAY['わ', 'わよ', 'わね']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-233', $$もう帰るわ。$$, $$もうかえるわ。$$, $$Já vou embora, viu.$$),
    ('n1-grammar-233', $$この服、すてきだわ。$$, $$このふく、すてきだわ。$$, $$Esta roupa é linda, hein.$$),
    ('n1-grammar-233', $$私も行きたいわね。$$, $$わたしもいきたいわね。$$, $$Eu também quero ir, né.$$),
    ('n1-grammar-233', $$それは知らなかったわ。$$, $$それはしらなかったわ。$$, $$Isso eu não sabia, ora.$$),
    ('n1-grammar-233', $$早く来ないと、置いていくわよ。$$, $$はやくこないと、おいていくわよ。$$, $$Se não vier logo, vou te deixar para trás, viu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日はとても疲れた____。$$, $$Hoje estou muito cansada, viu.$$),
        (2, $$あら、雨が降ってきた____。$$, $$Ah, começou a chover, hein.$$),
        (3, $$この料理、おいしい____ね。$$, $$Esta comida está gostosa, né.$$),
        (4, $$遅れたら、先生に怒られる____よ。$$, $$Se se atrasar, o professor vai brigar, viu.$$),
        (5, $$じゃあ、私が行く____。$$, $$Então eu vou, ora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-233', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わ$$),
        (2, $$わ$$),
        (3, $$わ$$),
        (4, $$わ$$),
        (5, $$わ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-234 — 〜はどうであれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-234',
    'grammar',
    'N1',
    $$〜はどうであれ$$,
    $$wa dou de are$$,
    $$Seja como for / Independentemente de / Não importa como$$,
    $$はどうであれ indica que, não importa como algo seja, a conclusão não muda. Equivale a "seja como for" ou "independentemente de".

A pessoa deixa de lado um aspecto para destacar outro mais importante. Por exemplo, "independentemente do resultado, você se esforçou muito".

É uma expressão formal.$$,
    $$É parecido com はともかく e に関わらず.

Expressões comuns são 結果はどうであれ, 理由はどうであれ e 事情はどうであれ.$$,
    $$Substantivo + はどうであれ
Substantivo + がどうであれ$$,
    $$はどうであれ$$,
    $$はどうであれ|がどうであれ|はどうあれ$$,
    ARRAY['は', 'どう', 'で', 'あれ']::text[],
    ARRAY['はどうであれ', 'がどうであれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-234', $$結果はどうであれ、よく頑張った。$$, $$けっかはどうであれ、よくがんばった。$$, $$Seja qual for o resultado, você se esforçou muito.$$),
    ('n1-grammar-234', $$理由はどうであれ、暴力は許されない。$$, $$りゆうはどうであれ、ぼうりょくはゆるされない。$$, $$Independentemente do motivo, a violência não é perdoável.$$),
    ('n1-grammar-234', $$他人がどうであれ、自分は自分の道を行く。$$, $$たにんがどうであれ、じぶんはじぶんのみちをいく。$$, $$Não importa como os outros sejam, eu sigo o meu caminho.$$),
    ('n1-grammar-234', $$事情はどうであれ、約束は守るべきだ。$$, $$じじょうはどうであれ、やくそくはまもるべきだ。$$, $$Sejam quais forem as circunstâncias, deve-se cumprir a promessa.$$),
    ('n1-grammar-234', $$見た目はどうであれ、味はいい。$$, $$みためはどうであれ、あじはいい。$$, $$Não importa a aparência, o sabor é bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$動機____、彼のしたことは正しい。$$, $$Seja qual for a motivação, o que ele fez está certo.$$),
        (2, $$周りの意見____、私は自分で決める。$$, $$Não importa a opinião dos outros, eu decido sozinho.$$),
        (3, $$過去____、大切なのは今だ。$$, $$Seja como for o passado, o importante é o agora.$$),
        (4, $$形____、気持ちが大切だ。$$, $$Independentemente da forma, o que importa é a intenção.$$),
        (5, $$やり方____、結果を出すことが大事だ。$$, $$Não importa o método, o importante é ter resultados.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-234', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はどうであれ$$),
        (2, $$はどうであれ$$),
        (3, $$はどうであれ$$),
        (4, $$はどうであれ$$),
        (5, $$はどうであれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-235 — 〜はおろか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-235',
    'grammar',
    'N1',
    $$〜はおろか$$,
    $$wa oroka$$,
    $$Sem falar de / Nem mesmo / Muito menos$$,
    $$はおろか indica que, se nem o caso mais simples é possível, o caso mais difícil é ainda menos possível. Equivale a "sem falar de" ou "nem mesmo".

A primeira parte é algo mais óbvio ou grande, e a segunda é algo mais básico, que também não acontece. Por exemplo, "não sei nem escrever hiragana, sem falar de kanji".

É uma expressão formal, geralmente com tom negativo.$$,
    $$É parecido com どころか e はもちろん, mas はおろか costuma ter tom negativo e de surpresa.

A segunda parte costuma ter も, さえ ou すら.$$,
    $$Substantivo + はおろか + Substantivo + も / さえ / すら + Frase negativa$$,
    $$はおろか$$,
    $$はおろか$$,
    ARRAY['は', 'おろか']::text[],
    ARRAY['はおろか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-235', $$彼は漢字はおろか、ひらがなも書けない。$$, $$かれはかんじはおろか、ひらがなもかけない。$$, $$Ele não sabe escrever nem hiragana, sem falar de kanji.$$),
    ('n1-grammar-235', $$忙しくて、旅行はおろか、休む時間もない。$$, $$いそがしくて、りょこうはおろか、やすむじかんもない。$$, $$Estou tão ocupado que não tenho nem tempo para descansar, muito menos para viajar.$$),
    ('n1-grammar-235', $$車はおろか、自転車も持っていない。$$, $$くるまはおろか、じてんしゃももっていない。$$, $$Não tenho nem bicicleta, sem falar de carro.$$),
    ('n1-grammar-235', $$彼女は外国語はおろか、日本語の敬語さえ使えない。$$, $$かのじょはがいこくごはおろか、にほんごのけいごさえつかえない。$$, $$Ela não consegue usar nem a linguagem honorífica do japonês, muito menos línguas estrangeiras.$$),
    ('n1-grammar-235', $$けがで、走ることはおろか、歩くこともできない。$$, $$けがで、はしることはおろか、あるくこともできない。$$, $$Com a lesão, não consigo nem andar, muito menos correr.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は料理____、お湯も沸かせない。$$, $$Ele não sabe nem ferver água, sem falar de cozinhar.$$),
        (2, $$貯金____、生活費も足りない。$$, $$Não tenho nem para as despesas do dia a dia, muito menos para poupar.$$),
        (3, $$この村には病院____、コンビニさえない。$$, $$Esta vila não tem nem loja de conveniência, sem falar de hospital.$$),
        (4, $$彼は謝罪____、挨拶すらしなかった。$$, $$Ele não cumprimentou nem sequer, muito menos pediu desculpas.$$),
        (5, $$海外旅行____、国内旅行もしたことがない。$$, $$Nunca viajei nem dentro do país, sem falar do exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-235', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はおろか$$),
        (2, $$はおろか$$),
        (3, $$はおろか$$),
        (4, $$はおろか$$),
        (5, $$はおろか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-236 — 〜はさておき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-236',
    'grammar',
    'N1',
    $$〜はさておき$$,
    $$wa sateoki$$,
    $$Deixando de lado / Seja como for / Por enquanto não falemos de$$,
    $$はさておき indica que um assunto é deixado de lado por enquanto, para falar de algo mais importante. Equivale a "deixando de lado" ou "por enquanto não falemos de".

Por exemplo, "deixando o preço de lado, vamos ver primeiro a qualidade".

Também aparece como 冗談はさておき, "brincadeiras à parte", para mudar para um assunto sério.$$,
    $$É parecido com はともかく e は別として.

Expressões comuns são 冗談はさておき, それはさておき e 何はさておき.

何はさておき significa "antes de mais nada".$$,
    $$Substantivo + はさておき
Frase + かどうか + はさておき$$,
    $$はさておき$$,
    $$はさておき|はさて置き$$,
    ARRAY['は', 'さておき']::text[],
    ARRAY['はさておき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-236', $$値段はさておき、まず品質を確認しよう。$$, $$ねだんはさておき、まずひんしつをかくにんしよう。$$, $$Deixando o preço de lado, vamos primeiro verificar a qualidade.$$),
    ('n1-grammar-236', $$冗談はさておき、本題に入りましょう。$$, $$じょうだんはさておき、ほんだいにはいりましょう。$$, $$Brincadeiras à parte, vamos ao assunto principal.$$),
    ('n1-grammar-236', $$何はさておき、無事でよかった。$$, $$なにはさておき、ぶじでよかった。$$, $$Antes de mais nada, que bom que está tudo bem.$$),
    ('n1-grammar-236', $$できるかどうかはさておき、やってみよう。$$, $$できるかどうかはさておき、やってみよう。$$, $$Deixando de lado se dá ou não, vamos tentar.$$),
    ('n1-grammar-236', $$それはさておき、明日の予定はどうなっている？$$, $$それはさておき、あしたのよていはどうなっている？$$, $$Deixando isso de lado, como estão os planos para amanhã?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$細かいこと____、全体の計画を立てよう。$$, $$Deixando os detalhes de lado, vamos fazer o plano geral.$$),
        (2, $$勝ち負け____、楽しむことが大切だ。$$, $$Deixando de lado ganhar ou perder, o importante é se divertir.$$),
        (3, $$何____、まず休みたい。$$, $$Antes de mais nada, quero descansar.$$),
        (4, $$費用の問題____、場所を決めましょう。$$, $$Deixando a questão dos custos de lado, vamos decidir o local.$$),
        (5, $$それ____、最近元気？$$, $$Deixando isso de lado, como você está?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-236', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はさておき$$),
        (2, $$はさておき$$),
        (3, $$はさておき$$),
        (4, $$はさておき$$),
        (5, $$はさておき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-237 — 〜はそっちのけで / 〜をそっちのけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-237',
    'grammar',
    'N1',
    $$〜はそっちのけで / 〜をそっちのけで$$,
    $$wa socchinoke de / wo socchinoke de$$,
    $$Deixando de lado / Esquecendo de / Sem dar atenção a$$,
    $$そっちのけで indica que alguém deixou de lado algo importante para se dedicar a outra coisa. Equivale a "deixando de lado" ou "sem dar atenção a".

O tom costuma ser de crítica, porque a pessoa negligencia algo que deveria fazer. Por exemplo, "deixando os estudos de lado, só joga videogame".

É uma expressão coloquial.$$,
    $$É parecido com をよそに e を後回しにして.

A forma そっちのけにする também é usada.$$,
    $$Substantivo + はそっちのけで / をそっちのけで + Outra atividade$$,
    $$そっちのけで$$,
    $$そっちのけで|そっちのけに|そっちのけ$$,
    ARRAY['そっちのけ', 'で']::text[],
    ARRAY['はそっちのけで', 'をそっちのけで', 'そっちのけにする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-237', $$勉強はそっちのけで、ゲームばかりしている。$$, $$べんきょうはそっちのけで、ゲームばかりしている。$$, $$Deixando os estudos de lado, só fica jogando videogame.$$),
    ('n1-grammar-237', $$仕事をそっちのけで、おしゃべりをしている。$$, $$しごとをそっちのけで、おしゃべりをしている。$$, $$Estão conversando sem dar atenção ao trabalho.$$),
    ('n1-grammar-237', $$子供たちは宿題そっちのけで、外で遊んでいる。$$, $$こどもたちはしゅくだいそっちのけで、そとであそんでいる。$$, $$As crianças estão brincando lá fora, esquecendo a lição de casa.$$),
    ('n1-grammar-237', $$彼は家族をそっちのけで、趣味に夢中だ。$$, $$かれはかぞくをそっちのけで、しゅみにむちゅうだ。$$, $$Ele está vidrado no hobby, deixando a família de lado.$$),
    ('n1-grammar-237', $$主役はそっちのけで、みんな料理に夢中だった。$$, $$しゅやくはそっちのけで、みんなりょうりにむちゅうだった。$$, $$Todos estavam vidrados na comida, esquecendo o homenageado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$練習____、彼はスマホを見ている。$$, $$Deixando o treino de lado, ele fica olhando o celular.$$),
        (2, $$自分の仕事を____、人の手伝いばかりしている。$$, $$Deixando o próprio trabalho de lado, só fica ajudando os outros.$$),
        (3, $$試験勉強____、漫画を読んでいる。$$, $$Deixando o estudo para a prova de lado, está lendo mangá.$$),
        (4, $$彼女は彼氏____、友達と話している。$$, $$Ela está conversando com as amigas, sem dar atenção ao namorado.$$),
        (5, $$会議の議題____、雑談ばかりだった。$$, $$Deixando a pauta da reunião de lado, foi só conversa fiada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-237', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はそっちのけで$$),
        (1, $$をそっちのけで$$),
        (2, $$そっちのけで$$),
        (2, $$そっちのけにして$$),
        (3, $$はそっちのけで$$),
        (3, $$をそっちのけで$$),
        (4, $$をそっちのけで$$),
        (4, $$はそっちのけで$$),
        (5, $$はそっちのけで$$),
        (5, $$をそっちのけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-238 — 〜わ〜わで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-238',
    'grammar',
    'N1',
    $$〜わ〜わで$$,
    $$wa ~ wa de$$,
    $$Entre... e / Não só... como também / Um atrás do outro$$,
    $$わ〜わで serve para listar vários problemas que aconteceram ao mesmo tempo, mostrando que a situação foi muito difícil. Equivale a "entre... e" ou "não só..., como também".

A pessoa reclama de uma série de coisas ruins. Por exemplo, "entre chuva e vento, foi um dia horrível".

É uma expressão coloquial.$$,
    $$Costuma terminar com 大変だった ou さんざんだった.

A forma 〜わ〜わ também aparece sem で, como 出るわ出るわ, "sai um atrás do outro".$$,
    $$Verbo / Adjetivo い (forma simples) + わ + Verbo / Adjetivo い + わで$$,
    $$わ〜わで$$,
    $$わで$$,
    ARRAY['わ', 'わ', 'で']::text[],
    ARRAY['わ〜わで', 'わ〜わ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-238', $$雨は降るわ風は吹くわで、ひどい一日だった。$$, $$あめはふるわかぜはふくわで、ひどいいちにちだった。$$, $$Entre chuva e vento, foi um dia horrível.$$),
    ('n1-grammar-238', $$財布はなくすわ電車は遅れるわで、さんざんだった。$$, $$さいふはなくすわでんしゃはおくれるわで、さんざんだった。$$, $$Perdi a carteira e o trem atrasou, foi um desastre.$$),
    ('n1-grammar-238', $$子供は泣くわ犬はほえるわで、うるさくて眠れない。$$, $$こどもはなくわいぬはほえるわで、うるさくてねむれない。$$, $$Entre a criança chorando e o cachorro latindo, não dá para dormir de tanto barulho.$$),
    ('n1-grammar-238', $$熱は出るわ咳は止まらないわで、大変だった。$$, $$ねつはでるわせきはとまらないわで、たいへんだった。$$, $$Tive febre e a tosse não parava, foi muito difícil.$$),
    ('n1-grammar-238', $$道は混んでいるわ店は休みだわで、旅行は失敗だった。$$, $$みちはこんでいるわみせはやすみだわで、りょこうはしっぱいだった。$$, $$A estrada estava cheia e a loja fechada, a viagem foi um fracasso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝坊するわ、忘れ物をする____、今日はついていない。$$, $$Dormi demais e esqueci coisas, hoje não é meu dia.$$),
        (2, $$値段は高いわ、味はまずい____、二度と行かない。$$, $$Era caro e a comida ruim, nunca mais vou.$$),
        (3, $$仕事は多いわ、上司は厳しい____、毎日つらい。$$, $$Tem muito trabalho e o chefe é rígido, todo dia é duro.$$),
        (4, $$足は痛いわ、荷物は重い____、もう歩けない。$$, $$O pé dói e a bagagem está pesada, não consigo mais andar.$$),
        (5, $$宿題はあるわ、試験はある____、遊ぶ暇がない。$$, $$Tem lição de casa e prova, não sobra tempo para brincar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-238', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わで$$),
        (2, $$わで$$),
        (3, $$わで$$),
        (4, $$わで$$),
        (5, $$わで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-239 — 〜や否や
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-239',
    'grammar',
    'N1',
    $$〜や否や$$,
    $$ya ina ya$$,
    $$Mal / Assim que / No instante em que$$,
    $$や否や indica que, logo depois de uma ação, outra aconteceu imediatamente. Equivale a "mal..." ou "no instante em que".

É uma expressão muito formal e literária, que destaca a rapidez. Por exemplo, "mal soou o sinal, os alunos saíram correndo".

A forma curta や também tem o mesmo sentido.$$,
    $$É parecido com が早いか e とたんに.

A segunda parte é um fato já ocorrido, por isso costuma estar no passado.

Não se usa com intenções ou pedidos.$$,
    $$Verbo (forma dicionário) + や否や + Ação seguinte (passado)
Verbo (forma dicionário) + や + Ação seguinte$$,
    $$や否や$$,
    $$や否や|やいなや$$,
    ARRAY['や', '否', 'や']::text[],
    ARRAY['や否や', 'やいなや']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-239', $$ベルが鳴るや否や、生徒たちは教室を飛び出した。$$, $$ベルがなるやいなや、せいとたちはきょうしつをとびだした。$$, $$Mal tocou o sinal, os alunos saíram correndo da sala.$$),
    ('n1-grammar-239', $$彼は家に着くや否や、ベッドに倒れ込んだ。$$, $$かれはいえにつくやいなや、ベッドにたおれこんだ。$$, $$Mal chegou em casa, ele desabou na cama.$$),
    ('n1-grammar-239', $$その知らせを聞くや否や、彼女は泣き出した。$$, $$そのしらせをきくやいなや、かのじょはなきだした。$$, $$No instante em que ouviu a notícia, ela começou a chorar.$$),
    ('n1-grammar-239', $$新商品は発売されるや否や、売り切れた。$$, $$しんしょうひんははつばいされるやいなや、うりきれた。$$, $$Mal foi lançado, o novo produto esgotou.$$),
    ('n1-grammar-239', $$ドアが開くや否や、客が店内に殺到した。$$, $$ドアがあくやいなや、きゃくがてんないにさっとうした。$$, $$No instante em que a porta abriu, os clientes invadiram a loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試合が終わる____、選手たちは抱き合った。$$, $$Mal a partida terminou, os jogadores se abraçaram.$$),
        (2, $$彼は電車に乗る____、眠ってしまった。$$, $$Mal entrou no trem, ele adormeceu.$$),
        (3, $$先生が教室を出る____、学生たちは騒ぎ始めた。$$, $$No instante em que o professor saiu da sala, os alunos começaram a fazer bagunça.$$),
        (4, $$チケットは販売が始まる____、完売した。$$, $$Mal começaram as vendas, os ingressos esgotaram.$$),
        (5, $$犬は私の顔を見る____、しっぽを振った。$$, $$Assim que viu meu rosto, o cachorro abanou o rabo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-239', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$や否や$$),
        (1, $$やいなや$$),
        (2, $$や否や$$),
        (2, $$やいなや$$),
        (3, $$や否や$$),
        (3, $$やいなや$$),
        (4, $$や否や$$),
        (4, $$やいなや$$),
        (5, $$や否や$$),
        (5, $$やいなや$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-240 — 〜やしない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-240',
    'grammar',
    'N1',
    $$〜やしない$$,
    $$ya shinai$$,
    $$Nem / De jeito nenhum / Nunca que$$,
    $$やしない é uma forma coloquial e enfática de negação. Equivale a "nem..." ou "de jeito nenhum".

A pessoa nega algo com força, muitas vezes com irritação ou desânimo. Por exemplo, "ninguém me ouve nem um pouco" ou "isso nunca que vai dar certo".

Na fala, também aparece como やしねえ ou ゃしない.$$,
    $$É uma forma enfática de ない, usada na fala.

Expressões comuns são わかりやしない, できやしない e 来やしない.$$,
    $$Verbo (forma ます sem ます) + やしない
する → しやしない
来る → 来やしない$$,
    $$やしない$$,
    $$やしない|やしません|ゃしない$$,
    ARRAY['や', 'しない']::text[],
    ARRAY['やしない', 'やしません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-240', $$そんなこと、誰も信じやしない。$$, $$そんなこと、だれもしんじやしない。$$, $$Ninguém vai acreditar numa coisa dessas, de jeito nenhum.$$),
    ('n1-grammar-240', $$いくら説明しても、彼はわかりやしない。$$, $$いくらせつめいしても、かれはわかりやしない。$$, $$Por mais que eu explique, ele nem entende.$$),
    ('n1-grammar-240', $$こんなに遅いと、間に合いやしない。$$, $$こんなにおそいと、まにあいやしない。$$, $$Desse jeito tão lento, nunca que vai dar tempo.$$),
    ('n1-grammar-240', $$待っても、彼は来やしないよ。$$, $$まっても、かれはきやしないよ。$$, $$Mesmo esperando, ele não vem de jeito nenhum.$$),
    ('n1-grammar-240', $$そんな簡単に、夢がかないやしない。$$, $$そんなかんたんに、ゆめがかないやしない。$$, $$Sonhos não se realizam assim tão fácil, de jeito nenhum.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんな問題、子供にでき____。$$, $$Uma criança nunca que consegue fazer um problema desses.$$),
        (2, $$怒鳴っても、犬は言うことを聞き____。$$, $$Mesmo gritando, o cachorro não obedece de jeito nenhum.$$),
        (3, $$そんなに急いでも、終わり____。$$, $$Mesmo correndo tanto, não vai terminar de jeito nenhum.$$),
        (4, $$一人で行っても、楽しくあり____。$$, $$Ir sozinho não tem graça nenhuma.$$),
        (5, $$彼女は私の話なんか聞き____。$$, $$Ela nem ouve o que eu digo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-240', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やしない$$),
        (2, $$やしない$$),
        (3, $$やしない$$),
        (4, $$やしない$$),
        (5, $$やしない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-241 — やれ〜やれ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-241',
    'grammar',
    'N1',
    $$やれ〜やれ$$,
    $$yare ~ yare$$,
    $$Ora é... ora é / Uma hora é... outra hora é / É isso e aquilo$$,
    $$やれ〜やれ serve para listar várias coisas que alguém fala ou exige repetidamente, geralmente com tom de reclamação. Equivale a "ora é..., ora é..." ou "é isso e aquilo".

A pessoa mostra irritação com tantas exigências ou acontecimentos. Por exemplo, "ora é reunião, ora é relatório, nunca tenho tempo".

É uma expressão coloquial.$$,
    $$Costuma ser seguido de と ou で, como やれ〜だ、やれ〜だと.

É parecido com 〜とか〜とか e 〜だの〜だの.$$,
    $$やれ + Substantivo / Frase + だ、やれ + Substantivo / Frase + だ$$,
    $$やれ〜やれ$$,
    $$やれ$$,
    ARRAY['やれ']::text[],
    ARRAY['やれ〜やれ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-241', $$やれ会議だ、やれ報告書だと、休む暇がない。$$, $$やれかいぎだ、やれほうこくしょだと、やすむひまがない。$$, $$Ora é reunião, ora é relatório, não tenho tempo para descansar.$$),
    ('n1-grammar-241', $$母はやれ勉強しろ、やれ早く寝ろとうるさい。$$, $$はははやれべんきょうしろ、やれはやくねろとうるさい。$$, $$Minha mãe vive enchendo: ora é para estudar, ora é para dormir cedo.$$),
    ('n1-grammar-241', $$やれ結婚式だ、やれ引っ越しだと、お金がかかる。$$, $$やれけっこんしきだ、やれひっこしだと、おかねがかかる。$$, $$Uma hora é casamento, outra hora é mudança, só se gasta dinheiro.$$),
    ('n1-grammar-241', $$子供はやれお腹がすいた、やれ眠いと文句ばかり言う。$$, $$こどもはやれおなかがすいた、やれねむいともんくばかりいう。$$, $$A criança só reclama: ora está com fome, ora está com sono.$$),
    ('n1-grammar-241', $$やれ寒いだ、やれ暑いだと、彼はいつも不満を言っている。$$, $$やれさむいだ、やれあついだと、かれはいつもふまんをいっている。$$, $$Ora está frio, ora está calor, ele vive reclamando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____テストだ、やれ宿題だと、学生は忙しい。$$, $$Ora é prova, ora é lição de casa, os alunos vivem ocupados.$$),
        (2, $$上司はやれ遅い、____雑だと文句を言う。$$, $$O chefe reclama que é lento, que é desleixado.$$),
        (3, $$____病院だ、やれ買い物だと、毎日出かけている。$$, $$Ora é hospital, ora é compras, saio todos os dias.$$),
        (4, $$妻はやれ掃除しろ、____片付けろと言う。$$, $$Minha esposa manda limpar e arrumar, uma coisa atrás da outra.$$),
        (5, $$____新年会だ、やれ歓迎会だと、飲み会が多い。$$, $$Ora é festa de Ano-Novo, ora é festa de boas-vindas, há muitas confraternizações.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-241', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やれ$$),
        (2, $$やれ$$),
        (3, $$やれ$$),
        (4, $$やれ$$),
        (5, $$やれ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-242 — 〜ようが / 〜ようと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-242',
    'grammar',
    'N1',
    $$〜ようが / 〜ようと$$,
    $$you ga / you to$$,
    $$Mesmo que / Não importa se / Por mais que$$,
    $$ようが e ようと indicam que, mesmo que algo aconteça, a decisão ou o resultado não muda. Equivalem a "mesmo que" ou "não importa se".

Vêm depois da forma volitiva do verbo e costumam aparecer junto com palavras interrogativas, como 何, 誰 e どんなに. Por exemplo, "digam o que disserem, não vou mudar de ideia".

É uma expressão enfática e um pouco formal.$$,
    $$É parecido com ても, mas ようが é mais forte e enfático.

A segunda parte costuma mostrar uma decisão firme ou indiferença.$$,
    $$Verbo (forma volitiva) + が / と
Adjetivo い (sem い) + かろうが / かろうと
Substantivo / Adjetivo な + だろうが / であろうと$$,
    $$ようが$$,
    $$ようが|ようと|うが|うと$$,
    ARRAY['よう', 'が']::text[],
    ARRAY['ようが', 'ようと', 'うが', 'うと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-242', $$誰が何と言おうが、私の気持ちは変わらない。$$, $$だれがなんといおうが、わたしのきもちはかわらない。$$, $$Digam o que disserem, meu sentimento não vai mudar.$$),
    ('n1-grammar-242', $$雨が降ろうと、試合は行われる。$$, $$あめがふろうと、しあいはおこなわれる。$$, $$Mesmo que chova, a partida será realizada.$$),
    ('n1-grammar-242', $$どんなに反対されようが、彼と結婚する。$$, $$どんなにはんたいされようが、かれとけっこんする。$$, $$Por mais que sejam contra, vou me casar com ele.$$),
    ('n1-grammar-242', $$何を食べようと、太らない体質だ。$$, $$なにをたべようと、ふとらないたいしつだ。$$, $$Não importa o que eu coma, sou do tipo que não engorda.$$),
    ('n1-grammar-242', $$どこに住もうが、私の自由だ。$$, $$どこにすもうが、わたしのじゆうだ。$$, $$Onde quer que eu more, é escolha minha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いくら頼まれ____、その仕事は引き受けない。$$, $$Por mais que me peçam, não vou aceitar esse trabalho.$$),
        (2, $$他人が何をし____、気にしない。$$, $$Não importa o que os outros façam, não ligo.$$),
        (3, $$どんなに疲れてい____、毎日運動している。$$, $$Por mais cansado que esteja, me exercito todos os dias.$$),
        (4, $$誰が来____、ドアを開けてはいけない。$$, $$Não importa quem venha, não se deve abrir a porta.$$),
        (5, $$失敗し____、もう一度挑戦する。$$, $$Mesmo que eu falhe, vou tentar de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-242', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようが$$),
        (1, $$ようと$$),
        (2, $$ようが$$),
        (2, $$ようと$$),
        (3, $$ようが$$),
        (3, $$ようと$$),
        (4, $$ようが$$),
        (4, $$ようと$$),
        (5, $$ようが$$),
        (5, $$ようと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-243 — 〜ようが〜まいが / 〜ようと〜まいと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-243',
    'grammar',
    'N1',
    $$〜ようが〜まいが / 〜ようと〜まいと$$,
    $$you ga ~ mai ga / you to ~ mai to$$,
    $$Quer... quer não / Fazendo ou não / Seja ou não$$,
    $$ようが〜まいが e ようと〜まいと apresentam uma ação e sua negação, mostrando que, em qualquer caso, o resultado é o mesmo. Equivalem a "quer..., quer não" ou "fazendo ou não".

Por exemplo, "quer você vá, quer não, para mim tanto faz" ou "chovendo ou não, a partida acontece".

Também aparece com dois verbos diferentes, como ようが〜ようが.$$,
    $$まい é uma forma antiga de negação de intenção.

É parecido com 〜ても〜なくても.$$,
    $$Verbo (forma volitiva) + が + Mesmo verbo + まいが
Verbo (forma volitiva) + と + Mesmo verbo + まいと
Verbo A (forma volitiva) + が + Verbo B (forma volitiva) + が$$,
    $$ようが〜まいが$$,
    $$まいが|まいと|ようが$$,
    ARRAY['よう', 'が', 'まい', 'が']::text[],
    ARRAY['ようが〜まいが', 'ようと〜まいと', 'ようが〜ようが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-243', $$君が行こうが行くまいが、私には関係ない。$$, $$きみがいこうがいくまいが、わたしにはかんけいない。$$, $$Quer você vá, quer não, não tem nada a ver comigo.$$),
    ('n1-grammar-243', $$雨が降ろうと降るまいと、イベントは行います。$$, $$あめがふろうとふるまいと、イベントはおこないます。$$, $$Chovendo ou não, o evento será realizado.$$),
    ('n1-grammar-243', $$彼が来ようが来まいが、会議は始める。$$, $$かれがこようがこまいが、かいぎははじめる。$$, $$Quer ele venha, quer não, a reunião vai começar.$$),
    ('n1-grammar-243', $$食べようが食べまいが、あなたの自由だ。$$, $$たべようがたべまいが、あなたのじゆうだ。$$, $$Comer ou não comer é escolha sua.$$),
    ('n1-grammar-243', $$笑われようが怒られようが、自分の道を行く。$$, $$わらわれようがおこられようが、じぶんのみちをいく。$$, $$Rindo de mim ou brigando comigo, vou seguir meu caminho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$信じようが信じ____、これは本当の話だ。$$, $$Acreditando ou não, esta é uma história verdadeira.$$),
        (2, $$参加しようとし____と、連絡はしてください。$$, $$Participando ou não, entre em contato.$$),
        (3, $$勝とうが負け____、全力を尽くそう。$$, $$Ganhando ou perdendo, vamos dar o nosso melhor.$$),
        (4, $$彼が謝ろうが謝る____、もう許さない。$$, $$Ele pedindo desculpas ou não, não vou mais perdoar.$$),
        (5, $$賛成されようが反対され____、計画を進める。$$, $$Com apoio ou com oposição, vou seguir com o plano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-243', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まいが$$),
        (2, $$まい$$),
        (3, $$ようが$$),
        (4, $$まいが$$),
        (5, $$ようが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-244 — 〜ようものなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-244',
    'grammar',
    'N1',
    $$〜ようものなら$$,
    $$you mono nara$$,
    $$Se por acaso / Se ousar / Se acontecer de$$,
    $$ようものなら indica que, se algo acontecer, mesmo que seja pequeno, o resultado será muito ruim. Equivale a "se por acaso" ou "se ousar".

O tom é de exagero e advertência. Por exemplo, "se você ousar se atrasar, o chefe vai ficar furioso".

É uma expressão um pouco formal, mas também aparece na fala.$$,
    $$A forma ようもんなら é mais coloquial.

É diferente de ものなら com a forma potencial, que expressa um desejo difícil de realizar.$$,
    $$Verbo (forma volitiva) + ものなら + Resultado muito ruim$$,
    $$ようものなら$$,
    $$ようものなら|うものなら|ようもんなら|うもんなら$$,
    ARRAY['よう', 'もの', 'なら']::text[],
    ARRAY['ようものなら', 'うものなら', 'ようもんなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-244', $$遅刻でもしようものなら、部長に怒鳴られる。$$, $$ちこくでもしようものなら、ぶちょうにどなられる。$$, $$Se por acaso eu me atrasar, o gerente vai gritar comigo.$$),
    ('n1-grammar-244', $$母に嘘をつこうものなら、大変なことになる。$$, $$ははにうそをつこうものなら、たいへんなことになる。$$, $$Se eu ousar mentir para minha mãe, vai ser um problemão.$$),
    ('n1-grammar-244', $$この店で大声を出そうものなら、すぐに追い出される。$$, $$このみせでおおごえをだそうものなら、すぐにおいだされる。$$, $$Se você ousar falar alto nesta loja, vai ser expulso na hora.$$),
    ('n1-grammar-244', $$一言でも文句を言おうものなら、彼はすぐに怒る。$$, $$ひとことでももんくをいおうものなら、かれはすぐにおこる。$$, $$Se acontecer de você reclamar uma palavra, ele fica bravo na hora.$$),
    ('n1-grammar-244', $$試験に落ちようものなら、親に何を言われるかわからない。$$, $$しけんにおちようものなら、おやになにをいわれるかわからない。$$, $$Se por acaso eu reprovar, nem sei o que meus pais vão dizer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の誕生日を忘れ____、口をきいてもらえなくなる。$$, $$Se por acaso eu esquecer o aniversário dela, ela para de falar comigo.$$),
        (2, $$この秘密を誰かに話そ____、大問題になる。$$, $$Se você ousar contar este segredo a alguém, vai ser um grande problema.$$),
        (3, $$少しでも失敗し____、すぐにクビになる。$$, $$Se por acaso eu errar um pouco, sou demitido na hora.$$),
        (4, $$父の車に傷をつけ____、ひどく叱られる。$$, $$Se acontecer de eu arranhar o carro do meu pai, vou levar uma bronca enorme.$$),
        (5, $$あの先生の授業で寝____、廊下に立たされる。$$, $$Se você ousar dormir na aula daquele professor, vai ficar de castigo no corredor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-244', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようものなら$$),
        (1, $$ようもんなら$$),
        (2, $$うものなら$$),
        (2, $$うもんなら$$),
        (3, $$ようものなら$$),
        (3, $$ようもんなら$$),
        (4, $$ようものなら$$),
        (4, $$ようもんなら$$),
        (5, $$ようものなら$$),
        (5, $$ようもんなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-245 — 〜ずにはおかない / 〜ないではおかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-245',
    'grammar',
    'N1',
    $$〜ずにはおかない / 〜ないではおかない$$,
    $$zu niwa okanai / nai dewa okanai$$,
    $$Não deixar de / Com certeza vai / Inevitavelmente$$,
    $$ずにはおかない e ないではおかない têm dois usos principais.

O primeiro indica que algo inevitavelmente causa uma reação ou sentimento nas pessoas. Equivale a "não deixar de" ou "inevitavelmente". Por exemplo, "este filme não deixa de emocionar quem assiste".

O segundo expressa uma determinação forte de fazer algo. Equivale a "com certeza vou". Por exemplo, "vou descobrir a verdade, custe o que custar".

É uma expressão formal e enfática.$$,
    $$Atenção à forma de する, que vira せずにはおかない.

No primeiro uso, o sujeito costuma ser algo que provoca uma reação, como uma obra ou um acontecimento.$$,
    $$Verbo (forma ない sem ない) + ずにはおかない
Verbo (forma ない) + ではおかない
する → せずにはおかない$$,
    $$ずにはおかない$$,
    $$ずにはおかない|ないではおかない|ずにはおかなかった|ずにはおきません$$,
    ARRAY['ず', 'に', 'は', 'おかない']::text[],
    ARRAY['ずにはおかない', 'ないではおかない', 'せずにはおかない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-245', $$この映画は、見る人を感動させずにはおかない。$$, $$このえいがは、みるひとをかんどうさせずにはおかない。$$, $$Este filme não deixa de emocionar quem assiste.$$),
    ('n1-grammar-245', $$彼の言葉は、聞く人の心を動かさずにはおかない。$$, $$かれのことばは、きくひとのこころをうごかさずにはおかない。$$, $$As palavras dele inevitavelmente tocam o coração de quem ouve.$$),
    ('n1-grammar-245', $$真実を明らかにせずにはおかない。$$, $$しんじつをあきらかにせずにはおかない。$$, $$Vou revelar a verdade, custe o que custar.$$),
    ('n1-grammar-245', $$彼の態度は、周りの人を怒らせないではおかない。$$, $$かれのたいどは、まわりのひとをおこらせないではおかない。$$, $$A atitude dele não deixa de irritar as pessoas em volta.$$),
    ('n1-grammar-245', $$今度こそ、犯人を捕まえずにはおかない。$$, $$こんどこそ、はんにんをつかまえずにはおかない。$$, $$Desta vez, vou pegar o culpado com certeza.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この写真は、見る人を驚かせ____。$$, $$Esta foto não deixa de surpreender quem vê.$$),
        (2, $$彼女の歌声は、聴く人を魅了せ____。$$, $$A voz dela inevitavelmente encanta quem ouve.$$),
        (3, $$こんな失礼なことをされたら、謝らせ____。$$, $$Depois de uma grosseria dessas, vou fazer ele pedir desculpas, com certeza.$$),
        (4, $$この事件は、社会に大きな影響を与え____だろう。$$, $$Este caso inevitavelmente vai ter grande impacto na sociedade.$$),
        (5, $$その小説は、読む人を考えさせ____。$$, $$Esse romance não deixa de fazer o leitor refletir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-245', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずにはおかない$$),
        (1, $$ないではおかない$$),
        (2, $$ずにはおかない$$),
        (3, $$ずにはおかない$$),
        (3, $$ないではおかない$$),
        (4, $$ずにはおかない$$),
        (4, $$ないではおかない$$),
        (5, $$ずにはおかない$$),
        (5, $$ないではおかない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-246 — 〜ともなると / 〜ともなれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-246',
    'grammar',
    'N1',
    $$〜ともなると / 〜ともなれば$$,
    $$tomo naru to / tomo nareba$$,
    $$Quando chega a / Ao se tornar / Em se tratando de$$,
    $$ともなると e ともなれば indicam que, quando algo chega a um nível, idade ou posição especial, a situação naturalmente muda. Equivalem a "quando chega a" ou "em se tratando de".

Por exemplo, "quando se chega aos cinquenta anos, o corpo começa a ficar cansado" ou "em se tratando de um presidente, a responsabilidade é enorme".

É uma expressão formal.$$,
    $$É parecido com となると, mas ともなると destaca mais que o nível é alto ou especial.

A segunda parte mostra uma situação natural ou esperada para aquele nível.$$,
    $$Substantivo (idade / posição / época) + ともなると / ともなれば
Verbo (forma dicionário) + ともなると / ともなれば$$,
    $$ともなると$$,
    $$ともなると|ともなれば|ともなったら$$,
    ARRAY['とも', 'なる', 'と']::text[],
    ARRAY['ともなると', 'ともなれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-246', $$五十歳ともなると、体力が落ちてくる。$$, $$ごじゅっさいともなると、たいりょくがおちてくる。$$, $$Quando se chega aos cinquenta anos, a resistência física começa a cair.$$),
    ('n1-grammar-246', $$社長ともなれば、責任は重い。$$, $$しゃちょうともなれば、せきにんはおもい。$$, $$Em se tratando de um presidente, a responsabilidade é grande.$$),
    ('n1-grammar-246', $$年末ともなると、どこも忙しい。$$, $$ねんまつともなると、どこもいそがしい。$$, $$Quando chega o fim do ano, todo lugar fica atarefado.$$),
    ('n1-grammar-246', $$大学生ともなれば、自分のことは自分でするべきだ。$$, $$だいがくせいともなれば、じぶんのことはじぶんでするべきだ。$$, $$Ao se tornar universitário, deve-se cuidar das próprias coisas.$$),
    ('n1-grammar-246', $$週末ともなると、この公園は家族連れでいっぱいだ。$$, $$しゅうまつともなると、このこうえんはかぞくづれでいっぱいだ。$$, $$Quando chega o fim de semana, este parque fica cheio de famílias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$プロ____、毎日の練習は欠かせない。$$, $$Em se tratando de um profissional, o treino diário é indispensável.$$),
        (2, $$冬____、この辺りは雪で真っ白になる。$$, $$Quando chega o inverno, esta região fica toda branca de neve.$$),
        (3, $$親____、子供の将来を考えるものだ。$$, $$Ao se tornar pai, a pessoa passa a pensar no futuro dos filhos.$$),
        (4, $$夏休み____、観光地は人であふれる。$$, $$Quando chegam as férias de verão, os pontos turísticos ficam lotados.$$),
        (5, $$七十歳____、無理はできない。$$, $$Quando se chega aos setenta anos, não dá para forçar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-246', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともなると$$),
        (1, $$ともなれば$$),
        (2, $$ともなると$$),
        (2, $$ともなれば$$),
        (3, $$ともなると$$),
        (3, $$ともなれば$$),
        (4, $$ともなると$$),
        (4, $$ともなれば$$),
        (5, $$ともなると$$),
        (5, $$ともなれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-247 — 〜ずくめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-247',
    'grammar',
    'N1',
    $$〜ずくめ$$,
    $$zukume$$,
    $$Só / Cheio de / Repleto de$$,
    $$ずくめ indica que algo está completamente cheio de uma mesma coisa, ou que só há aquilo. Equivale a "só" ou "repleto de".

Pode ser usado com cores, como "todo de preto", ou com situações, como "só coisas boas" ou "repleto de regras".

É uma expressão um pouco literária.$$,
    $$Expressões comuns são 黒ずくめ, いいことずくめ, 規則ずくめ e ごちそうずくめ.

É parecido com だらけ e ばかり, mas ずくめ pode ser usado com coisas boas.$$,
    $$Substantivo + ずくめ
Substantivo + ずくめの + Substantivo$$,
    $$ずくめ$$,
    $$ずくめ$$,
    ARRAY['ずくめ']::text[],
    ARRAY['ずくめ', 'ずくめの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-247', $$黒ずくめの男が店に入ってきた。$$, $$くろずくめのおとこがみせにはいってきた。$$, $$Um homem todo de preto entrou na loja.$$),
    ('n1-grammar-247', $$今年はいいことずくめの一年だった。$$, $$ことしはいいことずくめのいちねんだった。$$, $$Este ano foi cheio de coisas boas.$$),
    ('n1-grammar-247', $$この学校は規則ずくめで、自由がない。$$, $$このがっこうはきそくずくめで、じゆうがない。$$, $$Esta escola é repleta de regras, não há liberdade.$$),
    ('n1-grammar-247', $$結婚式は、ごちそうずくめだった。$$, $$けっこんしきは、ごちそうずくめだった。$$, $$O casamento foi repleto de banquetes.$$),
    ('n1-grammar-247', $$最近は失敗ずくめで、落ち込んでいる。$$, $$さいきんはしっぱいずくめで、おちこんでいる。$$, $$Ultimamente só tenho tido fracassos e estou desanimado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女はいつも白____の服を着ている。$$, $$Ela sempre usa roupas todas brancas.$$),
        (2, $$今日は朝からいいこと____だ。$$, $$Hoje, desde a manhã, só aconteceram coisas boas.$$),
        (3, $$この会社は規則____で、息が詰まる。$$, $$Esta empresa é cheia de regras, é sufocante.$$),
        (4, $$旅行中は、おいしいもの____だった。$$, $$Durante a viagem, só comi coisas gostosas.$$),
        (5, $$黒____の格好で、何だか怪しい。$$, $$Vestido todo de preto, parece meio suspeito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-247', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずくめ$$),
        (2, $$ずくめ$$),
        (3, $$ずくめ$$),
        (4, $$ずくめ$$),
        (5, $$ずくめ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-248 — 〜ずじまい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-248',
    'grammar',
    'N1',
    $$〜ずじまい$$,
    $$zu jimai$$,
    $$Acabar não / Ficar sem / Nunca chegar a$$,
    $$ずじまい indica que a pessoa queria fazer algo, mas no fim acabou não fazendo, e a oportunidade passou. Equivale a "acabar não..." ou "nunca chegar a".

Muitas vezes há arrependimento. Por exemplo, "fui a Kyoto, mas acabei não visitando o templo" ou "nunca cheguei a dizer o que sentia".

A forma ずじまいだ ou ずじまいになる é a mais comum.$$,
    $$Atenção à forma de する, que vira せずじまい.

É parecido com ないままだった, mas ずじまい destaca o arrependimento.$$,
    $$Verbo (forma ない sem ない) + ずじまい
する → せずじまい$$,
    $$ずじまい$$,
    $$ずじまい$$,
    ARRAY['ず', 'じまい']::text[],
    ARRAY['ずじまい', 'ずじまいだ', 'ずじまいになる']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-248', $$京都に行ったのに、金閣寺は見ずじまいだった。$$, $$きょうとにいったのに、きんかくじはみずじまいだった。$$, $$Fui a Kyoto, mas acabei não vendo o Kinkaku-ji.$$),
    ('n1-grammar-248', $$彼女に気持ちを伝えずじまいだった。$$, $$かのじょにきもちをつたえずじまいだった。$$, $$Nunca cheguei a dizer a ela o que sentia.$$),
    ('n1-grammar-248', $$買った本を、結局読まずじまいになった。$$, $$かったほんを、けっきょくよまずじまいになった。$$, $$Acabei nunca lendo o livro que comprei.$$),
    ('n1-grammar-248', $$忙しくて、彼に会わずじまいで帰国した。$$, $$いそがしくて、かれにあわずじまいできこくした。$$, $$Estava tão ocupado que voltei para o meu país sem chegar a encontrá-lo.$$),
    ('n1-grammar-248', $$名前を聞かずじまいで、別れてしまった。$$, $$なまえをきかずじまいで、わかれてしまった。$$, $$Nos despedimos sem que eu chegasse a perguntar o nome.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$せっかく買った服を、一度も着____だった。$$, $$Acabei nunca usando a roupa que comprei.$$),
        (2, $$祖父に本当のことを言わ____だった。$$, $$Nunca cheguei a contar a verdade ao meu avô.$$),
        (3, $$旅行中、雨で富士山は見え____だった。$$, $$Durante a viagem, por causa da chuva, acabei não vendo o monte Fuji.$$),
        (4, $$質問しようと思ったが、結局せ____だった。$$, $$Pensei em fazer uma pergunta, mas acabei não fazendo.$$),
        (5, $$お礼を言わ____で、引っ越してしまった。$$, $$Me mudei sem chegar a agradecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-248', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずじまい$$),
        (2, $$ずじまい$$),
        (3, $$ずじまい$$),
        (4, $$ずじまい$$),
        (5, $$ずじまい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-249 — 〜ようにも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-249',
    'grammar',
    'N1',
    $$〜ようにも〜ない$$,
    $$you nimo ~ nai$$,
    $$Mesmo querendo não dá / Por mais que queira não consegue / Não há como$$,
    $$ようにも〜ない indica que a pessoa quer fazer algo, mas não consegue por algum motivo. Equivale a "mesmo querendo, não dá" ou "por mais que queira, não consegue".

A estrutura repete o mesmo verbo, primeiro na forma volitiva e depois na forma potencial negativa. Por exemplo, "mesmo querendo sair, não consigo por causa da chuva".

É uma expressão de impotência diante da situação.$$,
    $$A segunda parte costuma ser できない ou a forma potencial negativa do verbo.

Muitas vezes há um motivo explicado antes, como falta de dinheiro, tempo ou informação.$$,
    $$Verbo (forma volitiva) + にも + Mesmo verbo (forma potencial negativa)$$,
    $$ようにも〜ない$$,
    $$ようにも|うにも$$,
    ARRAY['よう', 'に', 'も', 'ない']::text[],
    ARRAY['ようにも〜ない', 'うにも〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-249', $$連絡先がわからないので、連絡しようにもできない。$$, $$れんらくさきがわからないので、れんらくしようにもできない。$$, $$Como não sei o contato, mesmo querendo entrar em contato, não dá.$$),
    ('n1-grammar-249', $$お金がないので、買おうにも買えない。$$, $$おかねがないので、かおうにもかえない。$$, $$Como não tenho dinheiro, mesmo querendo comprar, não consigo.$$),
    ('n1-grammar-249', $$足をけがして、歩こうにも歩けない。$$, $$あしをけがして、あるこうにもあるけない。$$, $$Machuquei o pé e, por mais que queira andar, não consigo.$$),
    ('n1-grammar-249', $$雨がひどくて、出かけようにも出かけられない。$$, $$あめがひどくて、でかけようにもでかけられない。$$, $$A chuva está tão forte que, mesmo querendo sair, não dá.$$),
    ('n1-grammar-249', $$頭が痛くて、寝ようにも寝られない。$$, $$あたまがいたくて、ねようにもねられない。$$, $$Estou com tanta dor de cabeça que, mesmo querendo dormir, não consigo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$忙しくて、休もう____休めない。$$, $$Estou tão ocupado que, mesmo querendo descansar, não consigo.$$),
        (2, $$声が出なくて、話そう____話せない。$$, $$Estou sem voz e, por mais que queira falar, não consigo.$$),
        (3, $$材料がなくて、作ろう____作れない。$$, $$Sem ingredientes, mesmo querendo cozinhar, não dá.$$),
        (4, $$電話番号を忘れて、かけよう____かけられない。$$, $$Esqueci o número e, mesmo querendo ligar, não consigo.$$),
        (5, $$道が混んでいて、急ごう____急げない。$$, $$A estrada está tão cheia que, por mais que queira me apressar, não dá.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-249', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも$$),
        (2, $$にも$$),
        (3, $$にも$$),
        (4, $$にも$$),
        (5, $$にも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n1-grammar-250 — 〜ゆえに / 〜がゆえに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-250',
    'grammar',
    'N1',
    $$〜ゆえに / 〜がゆえに$$,
    $$yue ni / ga yue ni$$,
    $$Por causa de / Por ser / Justamente porque$$,
    $$ゆえに e がゆえに indicam a causa ou o motivo de algo, de forma muito formal. Equivalem a "por causa de" ou "por ser".

São usados principalmente na escrita, em textos acadêmicos, discursos e textos literários. Por exemplo, "justamente por ser jovem, ele comete erros".

A forma ゆえの vem antes de substantivos.$$,
    $$É uma forma antiga e formal de から e ので.

No começo da frase, ゆえに significa "portanto", como em lógica e matemática.$$,
    $$Verbo / Adjetivo (forma simples) + (が)ゆえに
Substantivo + (である) + がゆえに
Substantivo + ゆえの + Substantivo$$,
    $$ゆえに$$,
    $$ゆえに|ゆえの|ゆえ|故に$$,
    ARRAY['ゆえ', 'に']::text[],
    ARRAY['ゆえに', 'がゆえに', 'ゆえの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-250', $$若いがゆえに、失敗することもある。$$, $$わかいがゆえに、しっぱいすることもある。$$, $$Justamente por ser jovem, às vezes se erra.$$),
    ('n1-grammar-250', $$彼は正直であるがゆえに、損をすることが多い。$$, $$かれはしょうじきであるがゆえに、そんをすることがおおい。$$, $$Por ser honesto, ele muitas vezes sai perdendo.$$),
    ('n1-grammar-250', $$貧しさゆえに、学校に行けない子供がいる。$$, $$まずしさゆえに、がっこうにいけないこどもがいる。$$, $$Há crianças que não podem ir à escola por causa da pobreza.$$),
    ('n1-grammar-250', $$それは若さゆえの過ちだった。$$, $$それはわかさゆえのあやまちだった。$$, $$Aquilo foi um erro por causa da juventude.$$),
    ('n1-grammar-250', $$愛するがゆえに、彼女は彼と別れた。$$, $$あいするがゆえに、かのじょはかれとわかれた。$$, $$Justamente por amá-lo, ela terminou com ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$経験が少ない____、判断を誤った。$$, $$Por ter pouca experiência, errou no julgamento.$$),
        (2, $$有名である____、彼には自由がない。$$, $$Justamente por ser famoso, ele não tem liberdade.$$),
        (3, $$病気____、仕事を辞めざるを得なかった。$$, $$Por causa da doença, ele foi obrigado a deixar o trabalho.$$),
        (4, $$それは親の愛情____の厳しさだった。$$, $$Aquela rigidez era por causa do amor dos pais.$$),
        (5, $$便利である____、使いすぎてしまう。$$, $$Justamente por ser prático, acabamos usando demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-250', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がゆえに$$),
        (1, $$ゆえに$$),
        (2, $$がゆえに$$),
        (2, $$ゆえに$$),
        (3, $$ゆえに$$),
        (4, $$ゆえ$$),
        (5, $$がゆえに$$),
        (5, $$ゆえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
