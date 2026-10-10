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
