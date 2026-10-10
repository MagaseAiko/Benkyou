-- n2-grammar-56 — 〜ことだから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-56',
    'grammar',
    'N2',
    $$〜ことだから$$,
    $$koto dakara$$,
    $$Como se trata de / Conhecendo / Sendo quem é$$,
    $$ことだから é usado para fazer uma suposição baseada no que se conhece sobre uma pessoa, geralmente sobre o caráter ou os hábitos dela. Equivale a "como se trata de...", "conhecendo..." ou "sendo quem é...".

A estrutura é Pessoa + の + ことだから. Muitas vezes, antes da pessoa vem uma descrição, como 真面目な彼 (ele, que é sério) ou いつも遅刻する彼 (ele, que sempre se atrasa).

A segunda parte é uma suposição, geralmente com だろう, に違いない, はずだ ou きっと.

Por exemplo, "conhecendo ele, que é tão sério, com certeza vai cumprir a promessa" ou "como se trata de uma criança, logo vai esquecer".

A suposição pode ser positiva ou negativa, dependendo do que se sabe da pessoa.$$,
    $$ことだから quase sempre é usado com pessoas, e não com objetos.

A estrutura mostra que quem fala conhece bem a pessoa e confia nesse conhecimento para prever o comportamento dela.

É comum em conversas entre amigos e família.$$,
    $$(Descrição +) Pessoa + の + ことだから、 + Suposição + だろう / に違いない / はずだ$$,
    $$ことだから$$,
    $$ことだから$$,
    ARRAY['こと', 'だから']::text[],
    ARRAY['ことだから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-56', $$真面目な彼のことだから、きっと約束を守るだろう。$$, $$まじめなかれのことだから、きっとやくそくをまもるだろう。$$, $$Conhecendo ele, que é tão sério, com certeza vai cumprir a promessa.$$),
    ('n2-grammar-56', $$子供のことだから、すぐ忘れるだろう。$$, $$こどものことだから、すぐわすれるだろう。$$, $$Como se trata de uma criança, logo vai esquecer.$$),
    ('n2-grammar-56', $$いつも遅刻する彼のことだから、今日も遅れるだろう。$$, $$いつもちこくするかれのことだから、きょうもおくれるだろう。$$, $$Sendo ele, que sempre se atrasa, hoje também deve chegar atrasado.$$),
    ('n2-grammar-56', $$料理上手な母のことだから、おいしい料理を作ってくれるだろう。$$, $$りょうりじょうずなははのことだから、おいしいりょうりをつくってくれるだろう。$$, $$Conhecendo minha mãe, que cozinha tão bem, ela deve fazer uma comida deliciosa.$$),
    ('n2-grammar-56', $$優しい田中さんのことだから、手伝ってくれるはずだ。$$, $$やさしいたなかさんのことだから、てつだってくれるはずだ。$$, $$Conhecendo o Tanaka, que é tão gentil, ele deve ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭のいい彼女の____、きっと合格するだろう。$$, $$Conhecendo ela, que é tão inteligente, com certeza vai passar.$$),
        (2, $$忙しい部長の____、今日も帰りが遅くなるだろう。$$, $$Sendo o gerente tão ocupado, hoje também deve voltar tarde.$$),
        (3, $$心配性の母の____、何度も電話してくるだろう。$$, $$Conhecendo minha mãe, que se preocupa tanto, ela deve ligar várias vezes.$$),
        (4, $$忘れっぽい彼の____、また約束を忘れているに違いない。$$, $$Sendo ele tão esquecido, com certeza esqueceu o compromisso de novo.$$),
        (5, $$正直な彼の____、うそはつかないだろう。$$, $$Conhecendo ele, que é tão honesto, não deve mentir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことだから$$),
        (2, $$ことだから$$),
        (3, $$ことだから$$),
        (4, $$ことだから$$),
        (5, $$ことだから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
