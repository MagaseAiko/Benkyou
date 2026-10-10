-- n4-grammar-41 — 〜までに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-41',
    'grammar',
    'N4',
    $$〜までに$$,
    $$made ni$$,
    $$Até (prazo) / Antes de / No máximo até$$,
    $$までに é usado para indicar um prazo, ou seja, o momento limite até o qual algo deve acontecer. Equivale a "até" no sentido de "antes de" ou "no máximo até".

A ação acontece uma vez, em algum momento antes do limite. Por exemplo, entregar um relatório até sexta significa entregar em qualquer momento antes de sexta acabar.

Isso é muito diferente de まで. まで indica que a ação continua o tempo todo até o limite, como trabalhar até as cinco. までに indica um prazo para uma ação pontual.

Ele vem depois de substantivos de tempo e de verbos na forma de dicionário.$$,
    $$Uma forma prática de escolher: se dá para dizer "antes de", use までに; se a ação dura o tempo todo até ali, use まで.

Em e-mails de trabalho, までに aparece o tempo todo para pedir entregas com prazo, como 金曜日までにお願いします.

Com verbos, a ação de までに ainda não aconteceu, por isso o verbo fica sempre na forma de dicionário.$$,
    $$Substantivo de tempo + までに
Verbo na forma de dicionário + までに$$,
    $$までに$$,
    $$までに$$,
    ARRAY['まで', 'に']::text[],
    ARRAY['までに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-41', $$金曜日までにレポートを出してください。$$, $$きんようびまでにレポートをだしてください。$$, $$Entregue o relatório até sexta-feira, por favor.$$),
    ('n4-grammar-41', $$今日は五時までに帰ります。$$, $$きょうはごじまでにかえります。$$, $$Hoje volto para casa até as cinco.$$),
    ('n4-grammar-41', $$夏休みが終わるまでに、宿題を全部します。$$, $$なつやすみがおわるまでに、しゅくだいをぜんぶします。$$, $$Vou fazer toda a lição antes de as férias de verão acabarem.$$),
    ('n4-grammar-41', $$来年までに日本語能力試験に合格したい。$$, $$らいねんまでににほんごのうりょくしけんにごうかくしたい。$$, $$Quero passar no exame de proficiência em japonês até o ano que vem.$$),
    ('n4-grammar-41', $$会議が始まるまでに、資料を準備しておきます。$$, $$かいぎがはじまるまでに、しりょうをじゅんびしておきます。$$, $$Vou preparar os documentos antes de a reunião começar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日の朝____この仕事を終わらせます。$$, $$Vou terminar este trabalho até amanhã de manhã.$$),
        (2, $$十時____駅に来てください。$$, $$Chegue à estação até as dez, por favor.$$),
        (3, $$月末____家賃を払わなければなりません。$$, $$Tenho que pagar o aluguel até o fim do mês.$$),
        (4, $$両親が帰ってくる____、部屋を片付けよう。$$, $$Vamos arrumar o quarto antes de nossos pais voltarem.$$),
        (5, $$三十歳になる____結婚したいです。$$, $$Quero me casar antes de fazer trinta anos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までに$$),
        (2, $$までに$$),
        (3, $$までに$$),
        (4, $$までに$$),
        (5, $$までに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
