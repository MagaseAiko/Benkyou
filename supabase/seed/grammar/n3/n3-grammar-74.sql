-- n3-grammar-74 — 〜に反して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-74',
    'grammar',
    'N3',
    $$〜に反して$$,
    $$ni hanshite$$,
    $$Ao contrário de / Contra / Contrariando$$,
    $$に反して é usado para dizer que um resultado foi contrário a uma expectativa, previsão, desejo ou regra. Equivale a "ao contrário de", "contrariando" ou "contra".

反する significa "ir contra" ou "ser oposto a". Assim, a estrutura mostra que a realidade foi na direção oposta.

Ela aparece muito com substantivos como 予想 (previsão), 期待 (expectativa), 意思 (vontade) e 規則 (regra).

Antes de um substantivo, usa-se に反する: 規則に反する行為 (um ato contra as regras).

É uma expressão formal, comum em notícias, relatórios e textos escritos.$$,
    $$予想に反して é uma das combinações mais usadas e equivale a "contra todas as previsões".

Com regras e leis, に反する indica uma violação: 法律に反する (ser contra a lei).

Na fala do dia a dia, os japoneses costumam usar 思ったより ou 予想と違って, que soam mais leves.$$,
    $$Substantivo (予想 / 期待 / 意思 / 規則) + に反して + Resultado
Substantivo + に反し + Resultado (mais formal)
Substantivo + に反する + Substantivo$$,
    $$に反して$$,
    $$に反して|に反し|に反する$$,
    ARRAY['に', '反して']::text[],
    ARRAY['に反して', 'に反し', 'に反する']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-74', $$予想に反して、試験は簡単だった。$$, $$よそうにはんして、しけんはかんたんだった。$$, $$Ao contrário do previsto, a prova foi fácil.$$),
    ('n3-grammar-74', $$親の期待に反して、彼は大学に行かなかった。$$, $$おやのきたいにはんして、かれはだいがくにいかなかった。$$, $$Contrariando as expectativas dos pais, ele não foi para a faculdade.$$),
    ('n3-grammar-74', $$天気予報に反して、一日中晴れた。$$, $$てんきよほうにはんして、いちにちじゅうはれた。$$, $$Ao contrário da previsão do tempo, fez sol o dia inteiro.$$),
    ('n3-grammar-74', $$規則に反する行為は許されない。$$, $$きそくにはんするこういはゆるされない。$$, $$Atos contra as regras não são permitidos.$$),
    ('n3-grammar-74', $$本人の意思に反して、転勤が決まった。$$, $$ほんにんのいしにはんして、てんきんがきまった。$$, $$Contra a vontade dele, a transferência foi decidida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$予想____、チームは負けてしまった。$$, $$Ao contrário do previsto, o time acabou perdendo.$$),
        (2, $$期待____、その映画はつまらなかった。$$, $$Contrariando as expectativas, esse filme foi chato.$$),
        (3, $$法律____行為をしてはいけない。$$, $$Não se deve praticar atos contra a lei.$$),
        (4, $$彼の意見は私の考え____いる。$$, $$A opinião dele é contrária ao que eu penso.$$),
        (5, $$みんなの心配____、手術は成功した。$$, $$Contrariando a preocupação de todos, a cirurgia foi um sucesso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に反して$$),
        (2, $$に反して$$),
        (3, $$に反する$$),
        (4, $$に反して$$),
        (5, $$に反して$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
