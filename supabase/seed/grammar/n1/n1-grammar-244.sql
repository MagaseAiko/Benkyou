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
