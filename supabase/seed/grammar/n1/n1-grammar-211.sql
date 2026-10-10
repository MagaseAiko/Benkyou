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
