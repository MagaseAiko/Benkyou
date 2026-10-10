-- n2-grammar-118 — 〜のみならず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-118',
    'grammar',
    'N2',
    $$〜のみならず$$,
    $$nomi narazu$$,
    $$Não apenas / Não só / Além de$$,
    $$のみならず indica que algo não se limita a um caso e se estende a outros. Equivale a "não apenas" ou "não só".

Tem o mesmo sentido de だけでなく, mas é bem mais formal e aparece principalmente na escrita, em discursos e notícias.

Por exemplo, "este problema afeta não apenas o Japão, mas o mundo inteiro". Depois, costuma vir も.$$,
    $$A forma のみならず também pode aparecer no começo de frase com o sentido de "além disso".

É parecido com ばかりか e に限らず.$$,
    $$Substantivo + のみならず + Frase (com も)
Verbo / Adjetivo (forma simples) + のみならず
Adjetivo な / Substantivo + である + のみならず$$,
    $$のみならず$$,
    $$のみならず$$,
    ARRAY['のみ', 'ならず']::text[],
    ARRAY['のみならず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-118', $$この問題は日本のみならず、世界中に関わる。$$, $$このもんだいはにほんのみならず、せかいじゅうにかかわる。$$, $$Este problema afeta não apenas o Japão, mas o mundo inteiro.$$),
    ('n2-grammar-118', $$彼は歌手であるのみならず、俳優としても活躍している。$$, $$かれはかしゅであるのみならず、はいゆうとしてもかつやくしている。$$, $$Ele não é apenas cantor, também faz sucesso como ator.$$),
    ('n2-grammar-118', $$この映画は子供のみならず、大人にも人気がある。$$, $$このえいがはこどものみならず、おとなにもにんきがある。$$, $$Este filme é popular não só entre crianças, mas também entre adultos.$$),
    ('n2-grammar-118', $$彼女は英語のみならず、フランス語も話せる。$$, $$かのじょはえいごのみならず、フランスごもはなせる。$$, $$Ela fala não apenas inglês, mas também francês.$$),
    ('n2-grammar-118', $$値段が高いのみならず、品質も悪い。$$, $$ねだんがたかいのみならず、ひんしつもわるい。$$, $$Não apenas o preço é alto, a qualidade também é ruim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は観光地として国内____、海外でも有名だ。$$, $$Esta cidade é famosa como destino turístico não só no país, mas também no exterior.$$),
        (2, $$彼は勉強____、スポーツも得意だ。$$, $$Ele é bom não apenas nos estudos, mas também nos esportes.$$),
        (3, $$環境問題は政府____、個人も考えるべきだ。$$, $$Os problemas ambientais devem ser pensados não só pelo governo, mas também pelos indivíduos.$$),
        (4, $$この薬は効果がない____、副作用もある。$$, $$Este remédio não só não faz efeito, como também tem efeitos colaterais.$$),
        (5, $$このレストランは味____、雰囲気もいい。$$, $$Este restaurante é bom não apenas no sabor, mas também no ambiente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のみならず$$),
        (2, $$のみならず$$),
        (3, $$のみならず$$),
        (4, $$のみならず$$),
        (5, $$のみならず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
