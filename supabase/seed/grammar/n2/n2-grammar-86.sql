-- n2-grammar-86 — 〜にあたって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-86',
    'grammar',
    'N2',
    $$〜にあたって$$,
    $$ni atatte$$,
    $$Por ocasião de / Ao / No momento de$$,
    $$にあたって indica um momento importante ou especial em que algo é feito. Equivale a "por ocasião de" ou "ao".

É usado antes de começar algo significativo, como uma viagem, um novo trabalho, uma cerimônia ou uma mudança. A segunda parte costuma falar de uma preparação, um cuidado ou uma mensagem. Por exemplo, "ao começar o novo ano letivo, o diretor fez um discurso".

É uma expressão formal, comum em discursos e documentos.$$,
    $$にあたり é ainda mais formal.

É parecido com に際して, mas にあたって destaca um momento especial ou uma etapa importante.

Não se usa para situações comuns do dia a dia.$$,
    $$Substantivo + にあたって / にあたり
Verbo (forma dicionário) + にあたって / にあたり$$,
    $$にあたって$$,
    $$にあたって|にあたり|に当たって|に当たり$$,
    ARRAY['に', 'あたって']::text[],
    ARRAY['にあたって', 'にあたり', 'に当たって', 'にあたっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-86', $$留学するにあたって、両親に相談した。$$, $$りゅうがくするにあたって、りょうしんにそうだんした。$$, $$Ao decidir estudar no exterior, conversei com meus pais.$$),
    ('n2-grammar-86', $$新年を迎えるにあたって、目標を立てた。$$, $$しんねんをむかえるにあたって、もくひょうをたてた。$$, $$Por ocasião do Ano-Novo, estabeleci metas.$$),
    ('n2-grammar-86', $$開会にあたり、一言ご挨拶申し上げます。$$, $$かいかいにあたり、ひとことごあいさつもうしあげます。$$, $$Na abertura, gostaria de dizer algumas palavras.$$),
    ('n2-grammar-86', $$工事を始めるにあたって、近所に説明をした。$$, $$こうじをはじめるにあたって、きんじょにせつめいをした。$$, $$Ao começar a obra, demos explicações aos vizinhos.$$),
    ('n2-grammar-86', $$引っ越しにあたって、いらない物を捨てた。$$, $$ひっこしにあたって、いらないものをすてた。$$, $$Por ocasião da mudança, joguei fora as coisas que não precisava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しい店を開く____、たくさん準備をした。$$, $$Ao abrir a nova loja, fizemos muitos preparativos.$$),
        (2, $$卒業____、先生にお礼の手紙を書いた。$$, $$Por ocasião da formatura, escrevi uma carta de agradecimento ao professor.$$),
        (3, $$契約を結ぶ____、内容をよく確認してください。$$, $$Ao firmar o contrato, verifique bem o conteúdo.$$),
        (4, $$結婚する____、家を買った。$$, $$Por ocasião do casamento, compramos uma casa.$$),
        (5, $$試合を始める____、選手たちが握手をした。$$, $$No momento de começar a partida, os jogadores trocaram apertos de mão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にあたって$$),
        (1, $$にあたり$$),
        (1, $$に当たって$$),
        (1, $$に当たり$$),
        (2, $$にあたって$$),
        (2, $$にあたり$$),
        (2, $$に当たって$$),
        (2, $$に当たり$$),
        (3, $$にあたって$$),
        (3, $$にあたり$$),
        (3, $$に当たって$$),
        (3, $$に当たり$$),
        (4, $$にあたって$$),
        (4, $$にあたり$$),
        (4, $$に当たって$$),
        (4, $$に当たり$$),
        (5, $$にあたって$$),
        (5, $$にあたり$$),
        (5, $$に当たって$$),
        (5, $$に当たり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
