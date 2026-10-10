-- n3-grammar-64 — 〜ながらも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-64',
    'grammar',
    'N3',
    $$〜ながらも$$,
    $$nagara mo$$,
    $$Apesar de / Embora / Mesmo sendo$$,
    $$ながらも é usado para expressar contraste: apesar de uma situação, acontece algo que não se esperaria. Equivale a "apesar de", "embora" ou "mesmo sendo".

Esse uso de ながら é diferente do ながら do N4, que indica duas ações ao mesmo tempo. Aqui, a ideia é de concessão: "mesmo sendo assim, ...".

Ele vem depois do verbo na forma ます sem ます, de adjetivos い, de adjetivos な (sem な) e de substantivos.

Por exemplo, "apesar de pobre, vive feliz" ou "mesmo sabendo que era errado, menti".

A forma com も (ながらも) reforça o contraste. A forma sem も (ながら) também é usada, principalmente em expressões fixas como 残念ながら (infelizmente).$$,
    $$Com verbos, ながらも aparece muito com verbos de estado, como 知る, わかる e いる: 知りながらも (mesmo sabendo).

Expressões fixas como 残念ながら (infelizmente) e 恥ずかしながら (com vergonha, confesso que...) vêm desse uso.

ながらも soa um pouco mais formal e literário que のに ou けど.$$,
    $$Verbo na forma ます sem ます + ながらも
Adjetivo い + ながらも
Adjetivo な (sem な) + ながらも
Substantivo + ながらも

Forma curta: ながら (残念ながら / 狭いながら)$$,
    $$ながらも$$,
    $$ながらも|ながら$$,
    ARRAY['ながら', 'も']::text[],
    ARRAY['ながらも', 'ながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-64', $$彼は貧しいながらも、幸せに暮らしている。$$, $$かれはまずしいながらも、しあわせにくらしている。$$, $$Apesar de pobre, ele vive feliz.$$),
    ('n3-grammar-64', $$狭いながらも、楽しい我が家だ。$$, $$せまいながらも、たのしいわがやだ。$$, $$Embora pequena, é a nossa casa querida.$$),
    ('n3-grammar-64', $$悪いと知りながらも、うそをついてしまった。$$, $$わるいとしりながらも、うそをついてしまった。$$, $$Mesmo sabendo que era errado, acabei mentindo.$$),
    ('n3-grammar-64', $$子供ながらも、彼はしっかりしている。$$, $$こどもながらも、かれはしっかりしている。$$, $$Mesmo sendo criança, ele é bem responsável.$$),
    ('n3-grammar-64', $$少しずつながらも、日本語が上達している。$$, $$すこしずつながらも、にほんごがじょうたつしている。$$, $$Embora aos poucos, meu japonês está melhorando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は疲れてい____、笑顔で働いていた。$$, $$Apesar de cansada, ela trabalhava sorrindo.$$),
        (2, $$小さい____、きれいな庭がある。$$, $$Embora pequeno, há um jardim bonito.$$),
        (3, $$危ないとわかってい____、彼は行ってしまった。$$, $$Mesmo sabendo que era perigoso, ele foi.$$),
        (4, $$残念____、今回は参加できません。$$, $$Infelizmente, desta vez não poderei participar.$$),
        (5, $$狭い____、居心地のいい部屋だ。$$, $$Embora pequeno, é um quarto aconchegante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながらも$$),
        (2, $$ながらも$$),
        (3, $$ながらも$$),
        (4, $$ながら$$),
        (5, $$ながらも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
