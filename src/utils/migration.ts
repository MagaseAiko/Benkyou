import { supabase } from "./supabase.ts";

const data = [
  {
    "id": "n5-grammar-1",
    "type": "grammar",
    "level": "N5",
    "japanese": "〜ちゃいけない / 〜じゃいけない",
    "reading": "chai ikenai / ja ikenai",
    "translation": "Não pode / É proibido",
    "explanation": "Usado para dizer que algo é proibido ou não permitido. A forma ちゃ é contração de ては, então a forma completa é 〜てはいけない.",
    "examples": [
      {
        "japanese": "ここでタバコを吸っちゃいけません。",
        "reading": "ここでたばこをすっちゃいけません。",
        "translation": "Não pode fumar aqui."
      },
      {
        "japanese": "学校でスマホを使っちゃいけない。",
        "reading": "がっこうですまほをつかっちゃいけない。",
        "translation": "Não pode usar celular na escola."
      }
    ],
    "review_sentences": [
      {
        "sentence": "ここでタバコを吸って ____。",
        "translation": "Você não pode fumar aqui.",
        "answers": ["はいけない", "ちゃいけない"]
      }
    ],
    "notes": "Forma informal de 〜てはいけない."
  },
  {
    "id": "n5-grammar-2",
    "type": "grammar",
    "level": "N5",
    "japanese": "だ / です",
    "reading": "da / desu",
    "translation": "Verbo 'ser' ou 'é'",
    "explanation": "Usado para afirmar que algo é alguma coisa. です é a forma educada e だ é a forma informal.",
    "examples": [
      {
        "japanese": "私は学生です。",
        "reading": "わたしはがくせいです。",
        "translation": "Eu sou estudante."
      },
      {
        "japanese": "彼は先生だ。",
        "reading": "かれはせんせいだ。",
        "translation": "Ele é professor."
      }
    ],
    "review_sentences": [
      {
        "sentence": "私は日本人 ____。",
        "translation": "Eu sou japonês.",
        "answers": ["です", "だ"]
      }
    ],
    "notes": "Usado com substantivos e adjetivos な."
  },
  {
    "id": "n5-grammar-3",
    "type": "grammar",
    "level": "N5",
    "japanese": "だけ",
    "reading": "dake",
    "translation": "Apenas / somente",
    "explanation": "Indica limitação. Algo é apenas aquilo e nada mais.",
    "examples": [
      {
        "japanese": "水だけ飲みます。",
        "reading": "みずだけのみます。",
        "translation": "Eu bebo apenas água."
      },
      {
        "japanese": "今日は日本語だけ勉強しました。",
        "reading": "きょうはにほんごだけべんきょうしました。",
        "translation": "Hoje eu estudei apenas japonês."
      }
    ],
    "review_sentences": [
      {
        "sentence": "今日はコーヒー ____ 飲みました。",
        "translation": "Hoje eu bebi apenas café.",
        "answers": ["だけ"]
      }
    ],
    "notes": "Equivalente a 'só' ou 'somente'."
  },
  {
    "id": "n5-grammar-4",
    "type": "grammar",
    "level": "N5",
    "japanese": "だろう",
    "reading": "darou",
    "translation": "Provavelmente / acho que",
    "explanation": "Usado para expressar suposição ou opinião do falante.",
    "examples": [
      {
        "japanese": "明日は雨だろう。",
        "reading": "あしたはあめだろう。",
        "translation": "Provavelmente amanhã vai chover."
      },
      {
        "japanese": "彼は来ないだろう。",
        "reading": "かれはこないだろう。",
        "translation": "Ele provavelmente não virá."
      }
    ],
    "review_sentences": [
      {
        "sentence": "今日は寒い ____。",
        "translation": "Hoje provavelmente está frio.",
        "answers": ["だろう"]
      }
    ],
    "notes": "Forma mais informal de でしょう."
  },
  {
    "id": "n5-grammar-5",
    "type": "grammar",
    "level": "N5",
    "japanese": "で",
    "reading": "de",
    "translation": "Em / com / por",
    "explanation": "Partícula usada para indicar o local onde uma ação acontece ou o meio utilizado.",
    "examples": [
      {
        "japanese": "学校で勉強します。",
        "reading": "がっこうでべんきょうします。",
        "translation": "Estudo na escola."
      },
      {
        "japanese": "バスで行きます。",
        "reading": "ばすでいきます。",
        "translation": "Vou de ônibus."
      }
    ],
    "review_sentences": [
      {
        "sentence": "私はバス ____ 学校へ行きます。",
        "translation": "Eu vou para a escola de ônibus.",
        "answers": ["で"]
      }
    ],
    "notes": "Indica local da ação."
  }
];

async function seed() {
  for (const grammar of data) {
    // 1. Inserir grammar
    const { error: grammarError } = await supabase
      .from("grammar")
      .insert({
        id: grammar.id,
        type: grammar.type,
        level: grammar.level,
        japanese: grammar.japanese,
        reading: grammar.reading,
        translation: grammar.translation,
        explanation: grammar.explanation,
        notes: grammar.notes,
      });

    if (grammarError) {
      console.error("Erro grammar:", grammarError);
      continue;
    }

    // 2. Inserir examples
    for (const example of grammar.examples) {
      await supabase.from("examples").insert({
        grammar_id: grammar.id,
        japanese: example.japanese,
        reading: example.reading,
        translation: example.translation,
      });
    }

    // 3. Inserir review_sentences + answers
    for (const review of grammar.review_sentences) {
      const { data: reviewData, error: reviewError } = await supabase
        .from("review_sentences")
        .insert({
          grammar_id: grammar.id,
          sentence: review.sentence,
          translation: review.translation,
        })
        .select()
        .single();

      if (reviewError) {
        console.error("Erro review:", reviewError);
        continue;
      }

      // inserir respostas
      const answers = review.answers.map((answer: string) => ({
        review_sentence_id: reviewData.id,
        answer,
      }));

      await supabase.from("review_answers").insert(answers);
    }
  }

  console.log("Seed finalizado 🚀");
}

seed();