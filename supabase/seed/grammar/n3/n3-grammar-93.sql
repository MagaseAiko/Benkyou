-- n3-grammar-93 — 〜をはじめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-93',
    'grammar',
    'N3',
    $$〜をはじめ$$,
    $$wo hajime$$,
    $$A começar por / Incluindo / Como por exemplo$$,
    $$をはじめ é usado para citar o exemplo mais importante ou mais representativo de um grupo, e depois indicar que há outros. Equivale a "a começar por", "incluindo" ou "como por exemplo".

O primeiro elemento é o destaque, e a segunda parte fala do grupo inteiro, muitas vezes com palavras como 多くの, いろいろな ou 全員.

Por exemplo, "a começar pelo presidente, todos os funcionários compareceram" ou "a começar pelo sushi, a culinária japonesa é popular no mundo".

A forma をはじめとして é mais formal, e をはじめとする vem antes de um substantivo.

É uma expressão formal, muito usada em discursos, cerimônias, notícias e textos escritos.$$,
    $$Em discursos de agradecimento, frases como 社長をはじめ、皆様に感謝します são muito comuns.

O elemento citado primeiro costuma ser o mais importante, mais famoso ou de maior hierarquia.

Na conversa casual, os japoneses preferem や〜など ou とか.$$,
    $$Substantivo (exemplo principal) + をはじめ、 + Grupo
Substantivo + をはじめとして、 + Grupo (mais formal)
Substantivo + をはじめとする + Substantivo

Escrita: をはじめ / を始め$$,
    $$をはじめ$$,
    $$をはじめ|を始め$$,
    ARRAY['を', 'はじめ']::text[],
    ARRAY['をはじめ', 'をはじめとして', 'をはじめとする']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-93', $$東京をはじめ、日本の大都市はどこも人が多い。$$, $$とうきょうをはじめ、にほんのだいとしはどこもひとがおおい。$$, $$A começar por Tóquio, todas as grandes cidades do Japão têm muita gente.$$),
    ('n3-grammar-93', $$会議には社長をはじめ、社員全員が出席した。$$, $$かいぎにはしゃちょうをはじめ、しゃいんぜんいんがしゅっせきした。$$, $$Na reunião, a começar pelo presidente, todos os funcionários compareceram.$$),
    ('n3-grammar-93', $$すしをはじめ、日本料理は世界で人気がある。$$, $$すしをはじめ、にほんりょうりはせかいでにんきがある。$$, $$A começar pelo sushi, a culinária japonesa é popular no mundo.$$),
    ('n3-grammar-93', $$両親をはじめ、多くの人に助けられた。$$, $$りょうしんをはじめ、おおくのひとにたすけられた。$$, $$Fui ajudado por muitas pessoas, a começar pelos meus pais.$$),
    ('n3-grammar-93', $$この町には、お寺をはじめとして古い建物が多い。$$, $$このまちには、おてらをはじめとしてふるいたてものがおおい。$$, $$Esta cidade tem muitos prédios antigos, como por exemplo os templos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$式には校長先生____、多くの先生が来た。$$, $$A começar pelo diretor, muitos professores vieram à cerimônia.$$),
        (2, $$私はサッカー____、いろいろなスポーツが好きだ。$$, $$Gosto de vários esportes, a começar pelo futebol.$$),
        (3, $$京都____、日本には有名な観光地がたくさんある。$$, $$A começar por Kyoto, o Japão tem muitos pontos turísticos famosos.$$),
        (4, $$家族____、友達みんなが応援してくれた。$$, $$Todos me apoiaram, a começar pela minha família e pelos amigos.$$),
        (5, $$中国____、アジアの国々との交流が増えている。$$, $$O intercâmbio com os países asiáticos, a começar pela China, está aumentando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をはじめ$$),
        (2, $$をはじめ$$),
        (3, $$をはじめ$$),
        (4, $$をはじめ$$),
        (5, $$をはじめ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
