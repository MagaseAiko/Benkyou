-- n3-grammar-69 — 〜直す
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-69',
    'grammar',
    'N3',
    $$〜直す$$,
    $$naosu$$,
    $$Refazer / Fazer de novo / Corrigir$$,
    $$直す, ligado a outro verbo, indica que uma ação é feita de novo, geralmente para corrigir ou melhorar algo. Equivale a "refazer", "fazer de novo" ou "corrigir".

A estrutura junta o verbo na forma ます sem ます com 直す. O resultado funciona como um verbo do grupo 1.

Por exemplo, reescrever algo que ficou errado, ler de novo para revisar, repensar um plano ou ligar de novo para alguém.

A ideia é de recomeço com o objetivo de acertar ou melhorar. Por isso, é muito usado em situações de erro, revisão e segunda chance.$$,
    $$見直す tem dois sentidos: "revisar" e "mudar a opinião sobre alguém para melhor".

やり直す é muito usado em frases de incentivo, como "pode recomeçar quantas vezes quiser".

かけ直す é a forma natural de dizer "vou ligar de novo" ao telefone.$$,
    $$Verbo na forma ます sem ます + 直す

Passado: 直した / 直しました
Pedido: 直してください

Combinações comuns: 書き直す / 読み直す / 考え直す / かけ直す / やり直す / 見直す$$,
    $$直す$$,
    $$直|なお$$,
    ARRAY['直す']::text[],
    ARRAY['直す', '直した', '直します', '直して']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-69', $$間違えたので、もう一度書き直した。$$, $$まちがえたので、もういちどかきなおした。$$, $$Errei e reescrevi tudo de novo.$$),
    ('n3-grammar-69', $$この文をもう一度読み直してください。$$, $$このぶんをもういちどよみなおしてください。$$, $$Leia esta frase mais uma vez, por favor.$$),
    ('n3-grammar-69', $$この計画は考え直したほうがいい。$$, $$このけいかくはかんがえなおしたほうがいい。$$, $$É melhor repensar este plano.$$),
    ('n3-grammar-69', $$番号を間違えたので、電話をかけ直した。$$, $$ばんごうをまちがえたので、でんわをかけなおした。$$, $$Liguei para o número errado e liguei de novo.$$),
    ('n3-grammar-69', $$失敗しても、またやり直せばいい。$$, $$しっぱいしても、またやりなおせばいい。$$, $$Mesmo que erre, é só recomeçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$字が汚いので、書き____ください。$$, $$A letra está feia, então reescreva, por favor.$$),
        (2, $$提出する前に、この作文をもう一度見____。$$, $$Antes de entregar, vou revisar esta redação mais uma vez.$$),
        (3, $$今、田中は席にいないので、後でかけ____ます。$$, $$O Tanaka não está na mesa agora, então ligaremos de novo mais tarde.$$),
        (4, $$うまくいかなかったから、最初からやり____。$$, $$Não deu certo, então vamos recomeçar do início.$$),
        (5, $$その問題について、もう一度考え____ほうがいい。$$, $$É melhor repensar esse problema mais uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$直して$$),
        (2, $$直します$$),
        (2, $$直した$$),
        (2, $$直しました$$),
        (3, $$直し$$),
        (4, $$直そう$$),
        (4, $$直します$$),
        (5, $$直した$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
