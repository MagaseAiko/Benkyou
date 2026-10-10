-- n3-grammar-09 — 〜ばかりで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-09',
    'grammar',
    'N3',
    $$〜ばかりで$$,
    $$bakari de$$,
    $$Só... e não / Apenas... sem$$,
    $$ばかりで é usado para criticar uma situação em que só acontece uma coisa, e o que deveria acontecer não acontece. Equivale a "só... e não..." ou "apenas..., sem...".

ばかり indica que algo se repete demais ("só isso"), e で liga essa situação à consequência negativa que vem depois.

Por exemplo, "ele só fala e não faz nada" ou "só chove e não dá para lavar roupa".

O tom é de reclamação, insatisfação ou crítica. A segunda parte geralmente é negativa, mostrando o problema causado pelo excesso.

Ele vem depois de substantivos, de verbos na forma de dicionário e de verbos na forma て (てばかりで).$$,
    $$A expressão 口ばかりで significa "só da boca para fora", ou seja, a pessoa fala muito e não age.

Em textos, também aparece a forma ばかりで、〜ない, enfatizando o que não acontece.

Para uma descrição neutra, sem crítica, prefira だけで.$$,
    $$Substantivo + ばかりで + Frase negativa
Verbo na forma de dicionário + ばかりで + Frase negativa
Verbo na forma て + ばかりで + Frase negativa$$,
    $$ばかりで$$,
    $$ばかりで$$,
    ARRAY['ばかり', 'で']::text[],
    ARRAY['ばかりで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-09', $$彼は口ばかりで、何もしない。$$, $$かれはくちばかりで、なにもしない。$$, $$Ele só fala e não faz nada.$$),
    ('n3-grammar-09', $$毎日雨ばかりで、洗濯ができない。$$, $$まいにちあめばかりで、せんたくができない。$$, $$Só chove todo dia, e não dá para lavar roupa.$$),
    ('n3-grammar-09', $$弟は遊んでばかりで、全然勉強しない。$$, $$おとうとはあそんでばかりで、ぜんぜんべんきょうしない。$$, $$Meu irmão mais novo só brinca e não estuda nada.$$),
    ('n3-grammar-09', $$彼女は文句を言うばかりで、手伝おうとしない。$$, $$かのじょはもんくをいうばかりで、てつだおうとしない。$$, $$Ela só reclama e não tenta ajudar.$$),
    ('n3-grammar-09', $$このクラスは男の子ばかりで、女の子がいない。$$, $$このクラスはおとこのこばかりで、おんなのこがいない。$$, $$Esta turma só tem meninos, não tem nenhuma menina.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は寝て____、仕事をしない。$$, $$Ele só dorme e não trabalha.$$),
        (2, $$最近は失敗____、自信がなくなった。$$, $$Ultimamente só tenho errado e perdi a confiança.$$),
        (3, $$この店は高い物____、買えるものがない。$$, $$Esta loja só tem coisa cara, não tem nada que eu possa comprar.$$),
        (4, $$子供は泣く____、何も話してくれない。$$, $$A criança só chora e não me conta nada.$$),
        (5, $$毎日同じ料理____、もう飽きた。$$, $$Todo dia é só a mesma comida, já enjoei.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりで$$),
        (2, $$ばかりで$$),
        (3, $$ばかりで$$),
        (4, $$ばかりで$$),
        (5, $$ばかりで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
