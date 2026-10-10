-- n4-grammar-79 — それでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-79',
    'grammar',
    'N4',
    $$それでも$$,
    $$soredemo$$,
    $$Mesmo assim / Ainda assim / Apesar disso$$,
    $$それでも é uma conjunção que significa "mesmo assim" ou "ainda assim". Ela liga duas frases quando a segunda acontece apesar da primeira.

A primeira frase apresenta uma situação que normalmente impediria algo. Depois, それでも introduz o resultado que aconteceu mesmo com essa dificuldade.

Por exemplo, "falhei várias vezes. Mesmo assim, não desisti".

Ela costuma mostrar persistência, determinação ou surpresa. É diferente de でも e しかし, que apenas introduzem um contraste. それでも destaca que algo continuou apesar do obstáculo.$$,
    $$それでも também é usado sozinho em conversas, como uma reação: "mesmo assim (eu quero / eu vou)".

Na escrita mais formal, expressões como にもかかわらず têm sentido parecido, mas são usadas dentro da mesma frase.

Uma frase com それでも muitas vezes transmite emoção ou força de vontade, por isso é comum em histórias e discursos motivacionais.$$,
    $$Frase 1 (com ponto final) + それでも、 + Frase 2$$,
    $$それでも$$,
    $$それでも$$,
    ARRAY['それでも']::text[],
    ARRAY['それでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-79', $$何度も失敗した。それでも、彼は諦めなかった。$$, $$なんどもしっぱいした。それでも、かれはあきらめなかった。$$, $$Ele falhou várias vezes. Mesmo assim, não desistiu.$$),
    ('n4-grammar-79', $$雨が強く降っていた。それでも、試合は続いた。$$, $$あめがつよくふっていた。それでも、しあいはつづいた。$$, $$Chovia forte. Ainda assim, a partida continuou.$$),
    ('n4-grammar-79', $$値段は高い。それでも、買いたい。$$, $$ねだんはたかい。それでも、かいたい。$$, $$O preço é alto. Mesmo assim, quero comprar.$$),
    ('n4-grammar-79', $$医者に止められた。それでも、父はタバコをやめない。$$, $$いしゃにとめられた。それでも、ちちはタバコをやめない。$$, $$O médico proibiu. Mesmo assim, meu pai não para de fumar.$$),
    ('n4-grammar-79', $$みんなに反対されました。それでも、私は留学することにしました。$$, $$みんなにはんたいされました。それでも、わたしはりゅうがくすることにしました。$$, $$Todos foram contra. Mesmo assim, decidi fazer intercâmbio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は熱があった。____、会社に行った。$$, $$Ele estava com febre. Mesmo assim, foi à empresa.$$),
        (2, $$この仕事は大変だ。____、私は好きだ。$$, $$Este trabalho é pesado. Mesmo assim, eu gosto.$$),
        (3, $$何度も説明した。____、彼はわからなかった。$$, $$Expliquei várias vezes. Ainda assim, ele não entendeu.$$),
        (4, $$道はとても混んでいた。____、時間に間に合った。$$, $$O trânsito estava muito ruim. Mesmo assim, cheguei a tempo.$$),
        (5, $$夜遅くまで勉強しました。____、試験に落ちてしまいました。$$, $$Estudei até tarde da noite. Mesmo assim, fui reprovado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それでも$$),
        (2, $$それでも$$),
        (3, $$それでも$$),
        (4, $$それでも$$),
        (5, $$それでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
