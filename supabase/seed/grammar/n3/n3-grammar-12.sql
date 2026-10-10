-- n3-grammar-12 — 〜べきではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-12',
    'grammar',
    'N3',
    $$〜べきではない$$,
    $$beki de wa nai$$,
    $$Não deve / Não deveria$$,
    $$べきではない é a forma negativa de べきだ. Ela expressa que algo não deve ser feito, segundo a moral, o bom senso ou a opinião de quem fala. Equivale a "não deve" ou "não deveria".

É usada para criticar comportamentos, dar conselhos fortes ou expressar princípios. Por exemplo, "não se deve falar mal dos outros" ou "não se deve dirigir depois de beber".

Ela vem depois do verbo na forma de dicionário. Na fala, べきではない costuma virar べきじゃない.

No passado, べきではなかった expressa arrependimento por algo que a pessoa fez: "eu não devia ter dito aquilo".

Atenção: o negativo fica em べき, e não no verbo. Diz-se 言うべきではない, e não 言わないべきだ.$$,
    $$Como べきではない é forte, é comum suavizar com と思う ao dar opinião.

Para proibições oficiais, como regras de um lugar, o japonês usa てはいけない ou 禁止.

Em debates e textos de opinião, べきではない aparece com frequência para argumentar contra algo.$$,
    $$Verbo na forma de dicionário + べきではない
Verbo + べきではありません (educado)
Verbo + べきじゃない (fala)

Passado (arrependimento): べきではなかった$$,
    $$べきではない$$,
    $$べきではない|べきじゃない|べきではありません|べきではなかった$$,
    ARRAY['べき', 'では', 'ない']::text[],
    ARRAY['べきではない', 'べきじゃない', 'べきではありません', 'べきではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-12', $$人の悪口を言うべきではない。$$, $$ひとのわるくちをいうべきではない。$$, $$Não se deve falar mal dos outros.$$),
    ('n3-grammar-12', $$子供は夜遅くまで外にいるべきではありません。$$, $$こどもはよるおそくまでそとにいるべきではありません。$$, $$Crianças não deveriam ficar na rua até tarde da noite.$$),
    ('n3-grammar-12', $$お酒を飲んだら、運転するべきではない。$$, $$おさけをのんだら、うんてんするべきではない。$$, $$Depois de beber, não se deve dirigir.$$),
    ('n3-grammar-12', $$簡単にあきらめるべきではないと思う。$$, $$かんたんにあきらめるべきではないとおもう。$$, $$Acho que não devemos desistir tão fácil.$$),
    ('n3-grammar-12', $$彼にあんなことを言うべきではなかった。$$, $$かれにあんなことをいうべきではなかった。$$, $$Eu não devia ter dito aquilo para ele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$他人のプライバシーに入る____。$$, $$Não se deve invadir a privacidade dos outros.$$),
        (2, $$授業中は携帯を使う____。$$, $$Não se deve usar o celular durante a aula.$$),
        (3, $$食べ物を無駄にする____。$$, $$Não se deve desperdiçar comida.$$),
        (4, $$疲れているときに、大事なことを決める____。$$, $$Não se deve tomar decisões importantes quando se está cansado.$$),
        (5, $$彼にあの秘密を話す____。$$, $$Eu não devia ter contado aquele segredo para ele.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べきではない$$),
        (1, $$べきではありません$$),
        (2, $$べきではない$$),
        (2, $$べきではありません$$),
        (3, $$べきではない$$),
        (3, $$べきではありません$$),
        (4, $$べきではない$$),
        (4, $$べきではありません$$),
        (5, $$べきではなかった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
