def allMatches(teams):
   assert len(teams) >= 2, "Requires two or more teams!"

def main():
    jogos = allMatches(teams)
    print("[" + ", ".join(jogos) + "]")

main()
