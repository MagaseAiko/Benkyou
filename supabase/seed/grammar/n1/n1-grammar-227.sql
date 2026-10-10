-- n1-grammar-227 — 〜とは比べものにならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-227',
    'grammar',
    'N1',
    $$〜とは比べものにならない$$,
    $$to wa kurabemono ni naranai$$,
    $$Não tem comparação com / Muito superior a / Nem se compara$$,
    $$とは比べものにならない indica que a diferença entre duas coisas é tão grande que nem dá para comparar. Equivale a "não tem comparação com" ou "nem se compara".

Pode indicar que algo é muito melhor ou muito pior. Por exemplo, "a comida daqui não tem comparação com a de outros lugares".

É uma expressão comum na fala e na escrita.$$,
    $$Também é escrito とは比べ物にならない.

A forma とは比べものにならないほど reforça a diferença.$$,
    $$Substantivo + とは比べものにならない
Substantivo + とは比べものにならないほど + Adjetivo$$,
    $$とは比べものにならない$$,
    $$とは比べものにならない|とは比べ物にならない|とは比べものにならないほど|とは比べものになりません$$,
    ARRAY['と', 'は', '比べもの', 'に', 'ならない']::text[],
    ARRAY['とは比べものにならない', 'とは比べ物にならない', 'とは比べものにならないほど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-227', $$この店の味は、他の店とは比べものにならない。$$, $$このみせのあじは、ほかのみせとはくらべものにならない。$$, $$O sabor desta loja não tem comparação com o de outras.$$),
    ('n1-grammar-227', $$今の生活は、昔とは比べものにならないほど便利だ。$$, $$いまのせいかつは、むかしとはくらべものにならないほどべんりだ。$$, $$A vida de hoje é muito mais prática do que antigamente, nem se compara.$$),
    ('n1-grammar-227', $$プロの技術は、素人とは比べ物にならない。$$, $$プロのぎじゅつは、しろうととはくらべものにならない。$$, $$A técnica de um profissional não tem comparação com a de um amador.$$),
    ('n1-grammar-227', $$この部屋の広さは、前の部屋とは比べものにならない。$$, $$このへやのひろさは、まえのへやとはくらべものにならない。$$, $$O tamanho deste quarto nem se compara com o anterior.$$),
    ('n1-grammar-227', $$東京の人口は、私の町とは比べものにならない。$$, $$とうきょうのじんこうは、わたしのまちとはくらべものにならない。$$, $$A população de Tóquio não tem comparação com a da minha cidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しいパソコンの速さは、古いの____。$$, $$A velocidade do computador novo não tem comparação com a do antigo.$$),
        (2, $$本物の美しさは、写真____。$$, $$A beleza do original nem se compara com a da foto.$$),
        (3, $$彼の実力は、私____。$$, $$A habilidade dele é muito superior à minha.$$),
        (4, $$この地域の寒さは、東京____ほど厳しい。$$, $$O frio desta região é muito mais rigoroso que o de Tóquio, nem se compara.$$),
        (5, $$今の技術は、十年前____。$$, $$A tecnologia atual não tem comparação com a de dez anos atrás.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-227', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とは比べものにならない$$),
        (1, $$とは比べ物にならない$$),
        (2, $$とは比べものにならない$$),
        (2, $$とは比べ物にならない$$),
        (3, $$とは比べものにならない$$),
        (3, $$とは比べ物にならない$$),
        (4, $$とは比べものにならない$$),
        (4, $$とは比べ物にならない$$),
        (5, $$とは比べものにならない$$),
        (5, $$とは比べ物にならない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
