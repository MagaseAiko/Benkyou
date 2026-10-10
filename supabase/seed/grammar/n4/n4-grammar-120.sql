-- n4-grammar-120 — 〜やすい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-120',
    'grammar',
    'N4',
    $$〜やすい$$,
    $$yasui$$,
    $$Fácil de / Tende a / Propenso a$$,
    $$やすい é usado para dizer que algo é fácil de fazer. Equivale a "fácil de".

Ele é formado tirando ます do verbo e acrescentando やすい. O resultado funciona como um adjetivo い e se conjuga como tal: やすくない, やすかった, やすくて.

O uso principal é falar de facilidade, como uma caneta fácil de escrever ou uma explicação fácil de entender.

Outro uso importante é indicar tendência. Com verbos que descrevem algo que acontece sem querer, como pegar resfriado, quebrar ou escorregar, やすい significa "tender a" ou "ser propenso a".

O oposto de やすい é にくい, que significa "difícil de".$$,
    $$Não confunda com o adjetivo 安い (barato). Os dois têm a mesma pronúncia, mas este やすい vem sempre depois de um verbo.

No sentido de tendência, やすい costuma aparecer com coisas negativas, como doenças e acidentes.

A expressão わかりやすい (fácil de entender) é um dos elogios mais comuns para explicações e professores.$$,
    $$Verbo na forma ます sem ます + やすい

Negativo: やすくない
Passado: やすかった
Ligando: やすくて
Mudança: やすくなる$$,
    $$やすい$$,
    $$やすい|やすく|やすかった$$,
    ARRAY['やすい']::text[],
    ARRAY['やすい', 'やすくない', 'やすかった', 'やすくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-120', $$このペンは書きやすいです。$$, $$このペンはかきやすいです。$$, $$Esta caneta é fácil de escrever.$$),
    ('n4-grammar-120', $$先生の説明はわかりやすい。$$, $$せんせいのせつめいはわかりやすい。$$, $$A explicação do professor é fácil de entender.$$),
    ('n4-grammar-120', $$この靴は軽くて歩きやすい。$$, $$このくつはかるくてあるきやすい。$$, $$Estes sapatos são leves e confortáveis para andar.$$),
    ('n4-grammar-120', $$冬は風邪をひきやすいので、気をつけてください。$$, $$ふゆはかぜをひきやすいので、きをつけてください。$$, $$No inverno a gente pega resfriado com facilidade, então tome cuidado.$$),
    ('n4-grammar-120', $$この町は住みやすくて、気に入っています。$$, $$このまちはすみやすくて、きにいっています。$$, $$Esta cidade é boa de morar e eu gosto muito dela.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この本は字が大きくて読み____です。$$, $$Este livro tem letras grandes e é fácil de ler.$$),
        (2, $$このアプリは使い____。$$, $$Este aplicativo é fácil de usar.$$),
        (3, $$ガラスは割れ____から、気をつけて。$$, $$Vidro quebra fácil, então tome cuidado.$$),
        (4, $$このかばんは軽くて持ち____。$$, $$Esta bolsa é leve e fácil de carregar.$$),
        (5, $$雨の日は道が滑り____なります。$$, $$Em dias de chuva, as ruas ficam escorregadias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やすい$$),
        (2, $$やすい$$),
        (2, $$やすいです$$),
        (3, $$やすい$$),
        (4, $$やすい$$),
        (4, $$やすいです$$),
        (5, $$やすく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
