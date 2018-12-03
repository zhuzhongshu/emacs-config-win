(require 'projectile)

(setq projectile-completion-system 'helm)
(setq projectile-tags-backend "ggtags")

(add-to-list 'projectile-globally-ignored-files ".so")
(add-to-list 'projectile-globally-ignored-files ".o")

