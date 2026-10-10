-- n3-grammar-95 — 〜を通じて・〜を通して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-95',
    'grammar',
    'N3',
    $$〜を通じて・〜を通して$$,
    $$wo tsuujite / wo tooshite$$,
    $$Por meio de / Através de / Durante todo$$,
    $$を通じて e を通して têm dois usos principais.

O primeiro é indicar o meio ou o intermediário: "por meio de" ou "através de". Pode ser uma pessoa (conhecer alguém por meio de um amigo), uma ferramenta (falar com o mundo pela internet) ou uma experiência (aprender muito com o intercâmbio).

O segundo é indicar um período inteiro: "durante todo". Por exemplo, "esta ilha é quente o ano inteiro".

As duas formas são praticamente iguais. を通して soa um pouco mais concreto e é comum para experiências e meios diretos; を通じて soa um pouco mais formal e é comum para intermediários e períodos. Na prática, muitas vezes podem ser trocadas.$$,
    $$Para canais de comunicação, como internet, televisão e rádio, を通じて é muito comum em notícias.

Para experiências pessoais de aprendizado, を通して aparece mais: 経験を通して学ぶ.

O kanji 通 significa "passar através", o que ajuda a lembrar o sentido.$$,
    $$Substantivo (pessoa / meio / experiência) + を通じて / を通して + Verbo
Período (一年 / 一生) + を通じて / を通して + Estado contínuo

Formal: を通じ$$,
    $$を通じて$$,
    $$を通じて|を通して|をつうじて|をとおして|を通じ$$,
    ARRAY['を', '通じて', '通して']::text[],
    ARRAY['を通じて', 'を通して', 'を通じ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-95', $$友達を通じて、彼女と知り合った。$$, $$ともだちをつうじて、かのじょとしりあった。$$, $$Conheci-a por meio de um amigo.$$),
    ('n3-grammar-95', $$インターネットを通して、世界中の人と話せる。$$, $$インターネットをとおして、せかいじゅうのひととはなせる。$$, $$Pela internet, dá para falar com pessoas do mundo inteiro.$$),
    ('n3-grammar-95', $$この島は一年を通じて暖かい。$$, $$このしまはいちねんをつうじてあたたかい。$$, $$Esta ilha é quente o ano inteiro.$$),
    ('n3-grammar-95', $$留学を通して、多くのことを学んだ。$$, $$りゅうがくをとおして、おおくのことをまなんだ。$$, $$Aprendi muitas coisas por meio do intercâmbio.$$),
    ('n3-grammar-95', $$秘書を通して、社長に会う約束をした。$$, $$ひしょをとおして、しゃちょうにあうやくそくをした。$$, $$Por meio da secretária, marquei um encontro com o presidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先輩____、今の会社を紹介してもらった。$$, $$Fui apresentado à empresa atual por meio de um veterano.$$),
        (2, $$ボランティア活動____、たくさんの友達ができた。$$, $$Fiz muitos amigos por meio do trabalho voluntário.$$),
        (3, $$このあたりは一年____雨が多い。$$, $$Nesta região chove muito o ano inteiro.$$),
        (4, $$テレビ____、そのニュースを知った。$$, $$Fiquei sabendo dessa notícia pela televisão.$$),
        (5, $$スポーツ____、協力することの大切さを学んだ。$$, $$Por meio do esporte, aprendi a importância de cooperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を通じて$$),
        (1, $$を通して$$),
        (2, $$を通じて$$),
        (2, $$を通して$$),
        (3, $$を通じて$$),
        (3, $$を通して$$),
        (4, $$を通じて$$),
        (4, $$を通して$$),
        (5, $$を通じて$$),
        (5, $$を通して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
