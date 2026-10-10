-- n3-grammar-158 — 〜つもりだった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-158',
    'grammar',
    'N3',
    $$〜つもりだった$$,
    $$tsumori datta$$,
    $$Pretendia / Tinha a intenção de / Achava que tinha$$,
    $$つもりだった é o passado de つもり e tem dois usos principais.

O primeiro é falar de uma intenção que não se realizou: "eu pretendia..., mas...". Por exemplo, "ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde". Muitas vezes vem seguido de が, けど ou のに.

O segundo é dizer que a pessoa achava que tinha feito algo, mas na realidade não fez, ou fez errado. Nesse caso, usa-se o verbo na forma た antes de つもりだった: "eu achava que tinha trancado a porta, mas estava aberta".

Com substantivos e の, つもりだった mostra que a intenção era uma, mas o efeito foi outro: "era para ser uma brincadeira, mas ela ficou brava".$$,
    $$たつもり, sem だった, também significa "fazer de conta" ou "imaginar que fez", como em 旅行したつもりで貯金する.

つもりだった é muito útil para se justificar com educação quando algo deu errado.

No uso de "achava que tinha feito", a frase mostra um engano ou esquecimento.$$,
    $$Verbo na forma de dicionário + つもりだった + が / のに (pretendia, mas)
Verbo na forma た + つもりだった + が (achava que tinha feito)
Substantivo + の + つもりだった (era para ser...)

Educado: つもりでした$$,
    $$つもりだった$$,
    $$つもりだった|つもりでした$$,
    ARRAY['つもり', 'だった']::text[],
    ARRAY['つもりだった', 'つもりでした', 'たつもりだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-158', $$昨日は早く寝るつもりだったが、遅くなってしまった。$$, $$きのうははやくねるつもりだったが、おそくなってしまった。$$, $$Ontem eu pretendia dormir cedo, mas acabei ficando acordado até tarde.$$),
    ('n3-grammar-158', $$今日は勉強するつもりだったのに、一日中寝てしまった。$$, $$きょうはべんきょうするつもりだったのに、いちにちじゅうねてしまった。$$, $$Hoje eu pretendia estudar, mas acabei dormindo o dia inteiro.$$),
    ('n3-grammar-158', $$電話するつもりでしたが、忘れてしまいました。$$, $$でんわするつもりでしたが、わすれてしまいました。$$, $$Eu tinha a intenção de ligar, mas acabei esquecendo.$$),
    ('n3-grammar-158', $$冗談のつもりだったが、彼女を怒らせてしまった。$$, $$じょうだんのつもりだったが、かのじょをおこらせてしまった。$$, $$Era para ser uma brincadeira, mas acabei deixando ela brava.$$),
    ('n3-grammar-158', $$鍵をかけたつもりだったが、開いていた。$$, $$かぎをかけたつもりだったが、あいていた。$$, $$Eu achava que tinha trancado, mas estava aberto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$週末は旅行に行く____が、雨で中止になった。$$, $$Eu pretendia viajar no fim de semana, mas foi cancelado por causa da chuva.$$),
        (2, $$引っ越しを手伝う____のに、寝坊してしまった。$$, $$Eu pretendia ajudar na mudança, mas acabei dormindo demais.$$),
        (3, $$親切の____が、迷惑だったようだ。$$, $$Era para ser uma gentileza, mas parece que foi um incômodo.$$),
        (4, $$早く起きる____が、起きられなかった。$$, $$Eu pretendia acordar cedo, mas não consegui.$$),
        (5, $$窓を閉めた____が、開いていた。$$, $$Achava que tinha fechado a janela, mas estava aberta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つもりだった$$),
        (1, $$つもりでした$$),
        (2, $$つもりだった$$),
        (3, $$つもりだった$$),
        (4, $$つもりでした$$),
        (4, $$つもりだった$$),
        (5, $$つもりだった$$),
        (5, $$つもりでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
