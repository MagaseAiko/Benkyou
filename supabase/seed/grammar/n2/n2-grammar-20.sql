-- n2-grammar-20 — 〜得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-20',
    'grammar',
    'N2',
    $$〜得ない$$,
    $$enai / uenai$$,
    $$Ser impossível / Não poder / Não haver como$$,
    $$得ない é usado para dizer que algo é impossível ou não pode acontecer. Equivale a "ser impossível", "não poder" ou "não haver como".

Ele vem depois do verbo na forma ます sem ます. É a forma negativa de 得る (ser possível), que aparece no próximo item.

A forma mais conhecida é あり得ない (ありえない), que significa "é impossível", "não pode ser" e é muito usada na fala, inclusive como expressão de choque: "não acredito!".

Em outros verbos, 得ない soa formal e escrito, como em 理解し得ない (não é possível compreender) ou 想像し得ない (inimaginável).

A leitura costuma ser えない. Em textos formais, うる / うない também aparecem em algumas formas.$$,
    $$ありえない é muito comum entre jovens para expressar indignação ou surpresa: "isso é absurdo!".

Não confunda com ざるを得ない (não ter escolha a não ser), que é outra gramática do N2.

Fora de あり得ない, 得ない aparece principalmente em textos formais.$$,
    $$Verbo na forma ます sem ます + 得ない (えない)
ある → あり得ない (impossível)
する → し得ない

Educado: 得ません
Escrita: 得ない / えない$$,
    $$得ない$$,
    $$得ない|えない|得ません$$,
    ARRAY['得ない']::text[],
    ARRAY['得ない', 'えない', 'あり得ない', '得ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-20', $$そんなことはあり得ない。$$, $$そんなことはありえない。$$, $$Isso é impossível.$$),
    ('n2-grammar-20', $$彼が犯人だなんて、考え得ない。$$, $$かれがはんにんだなんて、かんがええない。$$, $$É impossível pensar que ele seja o culpado.$$),
    ('n2-grammar-20', $$この問題は一人では解決し得ない。$$, $$このもんだいはひとりではかいけつしえない。$$, $$Este problema não pode ser resolvido por uma pessoa sozinha.$$),
    ('n2-grammar-20', $$人間の想像し得ないことが起きた。$$, $$にんげんのそうぞうしえないことがおきた。$$, $$Aconteceu algo que ninguém poderia imaginar.$$),
    ('n2-grammar-20', $$彼の行動は理解し得ない。$$, $$かれのこうどうはりかいしえない。$$, $$O comportamento dele é impossível de compreender.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女がうそをつくなんて、あり____。$$, $$Ela mentir? Isso é impossível.$$),
        (2, $$安全対策をしたので、このような事故は二度と起こり____。$$, $$Tomamos medidas de segurança, então um acidente desses não pode acontecer de novo.$$),
        (3, $$子供には理解し____内容だ。$$, $$É um conteúdo impossível de compreender para crianças.$$),
        (4, $$それは想像し____ほどの美しさだった。$$, $$Era de uma beleza inimaginável.$$),
        (5, $$一日でこの量を終わらせることはあり____。$$, $$Terminar esta quantidade em um dia é impossível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$得ない$$),
        (1, $$えない$$),
        (2, $$得ない$$),
        (3, $$得ない$$),
        (4, $$得ない$$),
        (5, $$得ない$$),
        (5, $$えない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
