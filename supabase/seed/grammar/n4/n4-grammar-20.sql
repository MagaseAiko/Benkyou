-- n4-grammar-20 — 〜はずがない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-20',
    'grammar',
    'N4',
    $$〜はずがない$$,
    $$hazu ga nai$$,
    $$Não tem como / É impossível que / Não pode ser$$,
    $$はずがない é usado para dizer, com muita convicção, que algo é impossível ou não pode ser verdade. Equivale a "não tem como" ou "é impossível que".

Ela é a forma negativa forte de はずだ. Quem fala tem um motivo claro para acreditar que aquilo simplesmente não pode acontecer, como um fato conhecido ou uma lógica óbvia.

É comum em situações de descrença, quando alguém ouve algo que contraria tudo o que sabe, ou ao defender alguém de uma acusação.

A ligação é igual à de はずだ: verbos e adjetivos na forma simples, adjetivos な com な, substantivos com の.

A versão com は, はずはない, tem o mesmo sentido e às vezes soa um pouco mais suave.$$,
    $$Compare: ないはずだ significa "não deve" (expectativa), enquanto はずがない significa "é impossível" (convicção forte).

Em conversas, a expressão そんなはずはない é muito usada para reagir a algo inacreditável: "não pode ser!".

Por ser tão forte, はずがない pode soar teimoso se usado sem um bom motivo.$$,
    $$Verbo (forma simples) + はずがない
Adjetivo い + はずがない
Adjetivo な + な + はずがない
Substantivo + の + はずがない

Educado: はずがありません
Variação: はずはない / はずはありません$$,
    $$はずがない$$,
    $$はずがない|はずがありません|はずはない|はずはありません$$,
    ARRAY['はず', 'が', 'ない']::text[],
    ARRAY['はずがない', 'はずがありません', 'はずはない', 'はずはありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-20', $$彼がそんなことを言うはずがない。$$, $$かれがそんなことをいうはずがない。$$, $$Não tem como ele dizer uma coisa dessas.$$),
    ('n4-grammar-20', $$あんなに勉強したのだから、落ちるはずがありません。$$, $$あんなにべんきょうしたのだから、おちるはずがありません。$$, $$Com tanto estudo, é impossível ser reprovado.$$),
    ('n4-grammar-20', $$鍵をかけたから、ドアが開いているはずがない。$$, $$かぎをかけたから、ドアがあいているはずがない。$$, $$Eu tranquei, então não tem como a porta estar aberta.$$),
    ('n4-grammar-20', $$田中さんは今アメリカにいるので、ここにいるはずがない。$$, $$たなかさんはいまアメリカにいるので、ここにいるはずがない。$$, $$O Tanaka está nos Estados Unidos agora, então não tem como ele estar aqui.$$),
    ('n4-grammar-20', $$こんなに安いのに、おいしいはずはないと思っていた。$$, $$こんなにやすいのに、おいしいはずはないとおもっていた。$$, $$Achava que, sendo tão barato, não tinha como ser gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は正直な人だから、うそをつく____。$$, $$Ela é uma pessoa honesta, então não tem como mentir.$$),
        (2, $$まだ朝の六時だから、店が開いている____。$$, $$Ainda são seis da manhã, então não tem como a loja estar aberta.$$),
        (3, $$初めて作ったのに、そんなに上手にできる____。$$, $$É a primeira vez que faço, não tem como ficar tão bom.$$),
        (4, $$あの優しい先生が怒る____。$$, $$Não tem como aquele professor tão gentil ficar bravo.$$),
        (5, $$子供にこんな難しい問題がわかる____。$$, $$Não tem como uma criança entender uma questão tão difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はずがない$$),
        (1, $$はずがありません$$),
        (1, $$はずはない$$),
        (1, $$はずはありません$$),
        (2, $$はずがない$$),
        (2, $$はずがありません$$),
        (2, $$はずはない$$),
        (2, $$はずはありません$$),
        (3, $$はずがない$$),
        (3, $$はずがありません$$),
        (3, $$はずはない$$),
        (3, $$はずはありません$$),
        (4, $$はずがない$$),
        (4, $$はずがありません$$),
        (4, $$はずはない$$),
        (4, $$はずはありません$$),
        (5, $$はずがない$$),
        (5, $$はずがありません$$),
        (5, $$はずはない$$),
        (5, $$はずはありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
