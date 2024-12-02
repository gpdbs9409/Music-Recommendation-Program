import pygame

pygame.mixer.init()
pygame.mixer.music.load("your-audio-file.mp3")  # MP3 파일 경로
pygame.mixer.music.play()
input("Press Enter to stop the music...")
pygame.mixer.music.stop()

