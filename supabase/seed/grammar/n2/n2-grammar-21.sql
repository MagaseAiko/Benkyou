-- n2-grammar-21 — 〜得る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-21',
    'grammar',
    'N2',
    $$〜得る$$,
    $$uru / eru$$,
    $$Ser possível / Poder acontecer / Possível$$,
    $$得る é usado para dizer que algo é possível ou pode acontecer. Equivale a "ser possível", "poder acontecer" ou, antes de substantivos, "possível".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 起こり得る (pode acontecer), あり得る (é possível), 考え得る (que se pode pensar).

Ele não indica habilidade pessoal, como a forma potencial (話せる, 食べられる). Indica possibilidade objetiva: algo que pode ocorrer em certas condições.

A leitura mais comum na forma de dicionário é うる, principalmente em linguagem formal (起こりうる, ありうる). Nas outras formas, como 得ます e 得た, a leitura é え.

É uma expressão formal, muito usada em textos, notícias, relatórios e discursos.$$,
    $$あり得る e あり得ない são as formas mais comuns na conversa: "é possível" e "é impossível".

得る não é usado para habilidades pessoais: para "sei nadar", usa-se 泳げる, e não 泳ぎ得る.

考え得る限り significa "tudo o que se pode imaginar" e aparece em textos formais.$$,
    $$Verbo na forma ます sem ます + 得る (うる / える)
ある → あり得る (ありうる)
Verbo sem ます + 得る + Substantivo (que pode...)

Negativo: 得ない (えない)
Passado: 得た (えた)$$,
    $$得る$$,
    $$得る|得ます|得た|うる$$,
    ARRAY['得る']::text[],
    ARRAY['得る', 'うる', 'える', 'あり得る']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-21', $$地震はいつでも起こり得る。$$, $$じしんはいつでもおこりうる。$$, $$Terremotos podem acontecer a qualquer momento.$$),
    ('n2-grammar-21', $$それは誰にでもあり得ることだ。$$, $$それはだれにでもありうることだ。$$, $$Isso é algo que pode acontecer com qualquer pessoa.$$),
    ('n2-grammar-21', $$考え得るすべての方法を試した。$$, $$かんがえうるすべてのほうほうをためした。$$, $$Tentei todos os métodos possíveis.$$),
    ('n2-grammar-21', $$事故は起こり得るものとして、準備しておくべきだ。$$, $$じこはおこりうるものとして、じゅんびしておくべきだ。$$, $$Devemos nos preparar considerando que acidentes podem acontecer.$$),
    ('n2-grammar-21', $$彼の失敗は十分予想し得た。$$, $$かれのしっぱいはじゅうぶんよそうしえた。$$, $$O fracasso dele era perfeitamente previsível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$失敗は誰にでも起こり____。$$, $$O fracasso pode acontecer com qualquer um.$$),
        (2, $$それは十分あり____話だ。$$, $$Essa é uma história perfeitamente possível.$$),
        (3, $$考え____限りの手を尽くした。$$, $$Fizemos tudo o que era possível imaginar.$$),
        (4, $$このような問題は、どの会社でも起こり____。$$, $$Problemas como este podem acontecer em qualquer empresa.$$),
        (5, $$予想し____最悪の事態に備える。$$, $$Vamos nos preparar para a pior situação possível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$得る$$),
        (1, $$うる$$),
        (2, $$得る$$),
        (2, $$うる$$),
        (3, $$得る$$),
        (3, $$うる$$),
        (4, $$得る$$),
        (4, $$うる$$),
        (5, $$得る$$),
        (5, $$うる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
