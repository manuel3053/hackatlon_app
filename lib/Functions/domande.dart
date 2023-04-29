class Quiz {
  final String question;
  final List<String> answers;
  final int solution;

  const Quiz({
    required this.question,
    required this.answers,
    required this.solution,
  });
}

List<Quiz> Quizes = [
  const Quiz(
      question:
          "What is the name of the natural process in which the Earth’s surface absorbs and captures the Sun’s energy, which makes the atmosphere warm?",
      answers: ["Greenline effect", "Greenhouse effect", "Greenfield effect"],
      solution: 1),
  const Quiz(
      question:
          "Which of the following terms refers to the natural environment of an organism?",
      answers: ["Habitat", "Biome", "Niche"],
      solution: 0),
  const Quiz(
      question:
          "Which natural process makes an organism suited to live in a specific environment?",
      answers: ["Participation", "Competition", "Adaptation"],
      solution: 2),
  const Quiz(
      question:
          "The shape of fish is streamlined over time to move faster in water. Which kind of adaptation is this?",
      answers: [
        "Structural adaptatio",
        "Behavioural adaptation",
        "Physiological adaptation"
      ],
      solution: 0),
  const Quiz(
      question:
          "Which of the following terms refer to the sequence in which one organism eats another and is eaten by another?",
      answers: ["Digestion chain", "Consumption chain", " Food chain"],
      solution: 2)
];
