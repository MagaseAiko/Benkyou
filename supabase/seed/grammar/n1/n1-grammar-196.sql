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
