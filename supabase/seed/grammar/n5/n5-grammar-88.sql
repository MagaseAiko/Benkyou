-- n5-grammar-88 — 助数詞（つ・人・枚・本・個 など）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-88',
    'grammar',
    'N5',
    $$助数詞（つ・人・枚・本・個 など）$$,
    $$josuushi (tsu / nin / mai / hon / ko)$$,
    $$Contadores / Palavras para contar$$,
    $$助数詞 são os contadores: palavras que vêm depois dos números para contar coisas. Em japonês, não se diz apenas "três canetas": o número precisa de um contador que combine com o tipo de objeto.

Os contadores mais importantes do N5 são:
• つ: coisas em geral, sem contador específico (de 1 a 9).
• 人: pessoas.
• 枚: coisas finas e planas, como papel, camisetas, pratos e selos.
• 本: coisas longas e finas, como canetas, garrafas, guarda-chuvas e árvores.
• 個: coisas pequenas e arredondadas, como ovos e maçãs.
• 台: máquinas e veículos.
• 匹: animais pequenos.
• 冊: livros e cadernos.

Na frase, o número com contador costuma vir depois da partícula, logo antes do verbo. Também pode vir antes do substantivo, ligado por の.

A pronúncia de alguns números muda quando se juntam ao contador, como acontece com 本, 匹 e 人.$$,
    $$Os números um e dois de pessoas são irregulares: ひとり e ふたり. A partir de três, usa-se o número + にん.

Com 本, a leitura muda: いっぽん, にほん, さんぼん, よんほん, ろっぽん. O mesmo tipo de mudança acontece com 匹: いっぴき, にひき, さんびき.

Quando não se sabe o contador certo, つ é uma opção segura para objetos, até nove.$$,
    $$Número + Contador
Substantivo + が / を + Número + Contador + Verbo
Número + Contador + の + Substantivo

Perguntas: いくつ / 何人 / 何枚 / 何本 / 何個 / 何台 / 何匹 / 何冊

つ: ひとつ / ふたつ / みっつ / よっつ / いつつ / むっつ / ななつ / やっつ / ここのつ / とお
人: ひとり / ふたり / さんにん / よにん …$$,
    $$つ$$,
    $$つ|人|枚|本|個|台|匹|冊$$,
    ARRAY['つ', '人', '枚', '本', '個']::text[],
    ARRAY['つ', '人', '枚', '本', '個', '台', '匹', '冊']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-88', $$りんごを三つ買いました。$$, $$りんごをみっつかいました。$$, $$Comprei três maçãs.$$),
    ('n5-grammar-88', $$教室に学生が二十人います。$$, $$きょうしつにがくせいがにじゅうにんいます。$$, $$Tem vinte alunos na sala de aula.$$),
    ('n5-grammar-88', $$切手を五枚ください。$$, $$きってをごまいください。$$, $$Me dê cinco selos, por favor.$$),
    ('n5-grammar-88', $$かばんの中に鉛筆が二本あります。$$, $$かばんのなかにえんぴつがにほんあります。$$, $$Tem dois lápis dentro da bolsa.$$),
    ('n5-grammar-88', $$家に犬が一匹と猫が二匹います。$$, $$いえにいぬがいっぴきとねこがにひきいます。$$, $$Em casa tem um cachorro e dois gatos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の家族は四____です。$$, $$Minha família tem quatro pessoas.$$),
        (2, $$すみません、コピーを十____お願いします。$$, $$Com licença, dez cópias, por favor.$$),
        (3, $$ビールを二____ください。$$, $$Me dê duas garrafas de cerveja, por favor.$$),
        (4, $$スーパーで卵を三____買ってきてください。$$, $$Compre três ovos no supermercado, por favor.$$),
        (5, $$姉は車を一____持っています。$$, $$Minha irmã mais velha tem um carro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$人$$),
        (2, $$枚$$),
        (3, $$本$$),
        (4, $$個$$),
        (4, $$つ$$),
        (5, $$台$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
