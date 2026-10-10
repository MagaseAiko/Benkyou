-- n2-grammar-74 — 〜ものなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-74',
    'grammar',
    'N2',
    $$〜ものなら$$,
    $$mono nara$$,
    $$Se pudesse / Se por acaso / Se ousar$$,
    $$ものなら tem dois usos principais.

O primeiro vem com a forma potencial e expressa um desejo que é difícil de realizar. Equivale a "se pudesse...". Por exemplo, "se pudesse voltar ao passado, eu voltaria". A segunda parte costuma ser um desejo ou um convite.

O segundo vem com a forma volitiva, como ようものなら, e indica que, se alguém fizer algo, o resultado será muito ruim. Equivale a "se ousar..." ou "se por acaso...". Por exemplo, "se você se atrasar, o professor vai ficar furioso".$$,
    $$No primeiro uso, a situação é quase impossível ou muito difícil.

O segundo uso tem um tom de exagero e advertência.

Na fala, aparece como もんなら.$$,
    $$Verbo (forma potencial) + ものなら、 + Desejo / Convite
Verbo (forma volitiva) + ものなら、 + Resultado ruim$$,
    $$ものなら$$,
    $$ものなら|もんなら$$,
    ARRAY['もの', 'なら']::text[],
    ARRAY['ものなら', 'もんなら', 'ようものなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-74', $$戻れるものなら、学生時代に戻りたい。$$, $$もどれるものなら、がくせいじだいにもどりたい。$$, $$Se pudesse voltar, eu voltaria à época de estudante.$$),
    ('n2-grammar-74', $$できるものなら、やってみなさい。$$, $$できるものなら、やってみなさい。$$, $$Se você consegue, então tente.$$),
    ('n2-grammar-74', $$遅刻でもしようものなら、先生にひどく怒られる。$$, $$ちこくでもしようものなら、せんせいにひどくおこられる。$$, $$Se por acaso você se atrasar, o professor vai ficar furioso.$$),
    ('n2-grammar-74', $$代われるものなら、代わってあげたい。$$, $$かわれるものなら、かわってあげたい。$$, $$Se pudesse, eu trocaria de lugar com você.$$),
    ('n2-grammar-74', $$彼に秘密を話そうものなら、すぐにみんなに知られてしまう。$$, $$かれにひみつをはなそうものなら、すぐにみんなにしられてしまう。$$, $$Se você ousar contar um segredo a ele, logo todo mundo vai saber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$行ける____、今すぐにでも日本に行きたい。$$, $$Se pudesse, iria ao Japão agora mesmo.$$),
        (2, $$やり直せる____、もう一度やり直したい。$$, $$Se pudesse recomeçar, gostaria de recomeçar mais uma vez.$$),
        (3, $$母に嘘をつこう____、大変なことになる。$$, $$Se você ousar mentir para a minha mãe, vai ser um problemão.$$),
        (4, $$勝てる____、勝ってみろ。$$, $$Se você consegue ganhar, tente ganhar.$$),
        (5, $$彼の前で失敗しよう____、ずっと笑われる。$$, $$Se por acaso você falhar na frente dele, vai ser motivo de piada para sempre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものなら$$),
        (1, $$もんなら$$),
        (2, $$ものなら$$),
        (2, $$もんなら$$),
        (3, $$ものなら$$),
        (3, $$もんなら$$),
        (4, $$ものなら$$),
        (4, $$もんなら$$),
        (5, $$ものなら$$),
        (5, $$もんなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
