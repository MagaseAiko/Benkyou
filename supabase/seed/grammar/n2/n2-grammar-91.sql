-- n2-grammar-91 — 〜に関わらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-91',
    'grammar',
    'N2',
    $$〜に関わらず$$,
    $$ni kakawarazu$$,
    $$Independentemente de / Seja qual for / Não importa$$,
    $$に関わらず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "não importa".

Costuma vir depois de palavras que indicam diferença ou opostos, como idade, sexo, tempo, quantidade, ou de pares como "chover ou não chover". Por exemplo, "independentemente da idade, qualquer pessoa pode participar".

É uma expressão formal, muito usada em avisos e regras.$$,
    $$Pares comuns são 好き嫌いに関わらず, 経験の有無に関わらず e 参加するしないに関わらず.

É parecido com を問わず. Também pode ser escrito にかかわらず.

Não se confunde com にも関わらず, que significa "apesar de".$$,
    $$Substantivo (diferença / tipo) + に関わらず
Verbo (forma dicionário) + Verbo (forma ない) + に関わらず
Adjetivo い + Adjetivo い (forma ない) + に関わらず$$,
    $$に関わらず$$,
    $$に関わらず|にかかわらず|に関わりなく|にかかわりなく$$,
    ARRAY['に', '関わらず']::text[],
    ARRAY['に関わらず', 'にかかわらず', 'に関わりなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-91', $$年齢に関わらず、誰でも参加できます。$$, $$ねんれいにかかわらず、だれでもさんかできます。$$, $$Independentemente da idade, qualquer pessoa pode participar.$$),
    ('n2-grammar-91', $$天気に関わらず、試合は行われます。$$, $$てんきにかかわらず、しあいはおこなわれます。$$, $$A partida será realizada seja qual for o tempo.$$),
    ('n2-grammar-91', $$経験の有無に関わらず、応募できます。$$, $$けいけんのうむにかかわらず、おうぼできます。$$, $$É possível se candidatar com ou sem experiência.$$),
    ('n2-grammar-91', $$好き嫌いにかかわらず、全部食べなさい。$$, $$すききらいにかかわらず、ぜんぶたべなさい。$$, $$Gostando ou não, coma tudo.$$),
    ('n2-grammar-91', $$参加するしないに関わらず、連絡してください。$$, $$さんかするしないにかかわらず、れんらくしてください。$$, $$Participando ou não, entre em contato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$性別____、能力のある人を採用します。$$, $$Independentemente do sexo, contratamos pessoas capacitadas.$$),
        (2, $$雨が降る降らない____、イベントは開催します。$$, $$Chovendo ou não, o evento será realizado.$$),
        (3, $$国籍____、誰でも利用できます。$$, $$Independentemente da nacionalidade, qualquer pessoa pode usar.$$),
        (4, $$金額の大小____、寄付は大歓迎です。$$, $$Não importa se o valor é grande ou pequeno, doações são muito bem-vindas.$$),
        (5, $$昼夜____、この店は営業している。$$, $$Esta loja funciona seja de dia ou de noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関わらず$$),
        (1, $$にかかわらず$$),
        (1, $$に関わりなく$$),
        (2, $$に関わらず$$),
        (2, $$にかかわらず$$),
        (2, $$に関わりなく$$),
        (3, $$に関わらず$$),
        (3, $$にかかわらず$$),
        (3, $$に関わりなく$$),
        (4, $$に関わらず$$),
        (4, $$にかかわらず$$),
        (4, $$に関わりなく$$),
        (5, $$に関わらず$$),
        (5, $$にかかわらず$$),
        (5, $$に関わりなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
