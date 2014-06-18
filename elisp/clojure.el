;;;###autoload
(defmacro clj->> (&rest body)
      (let ((result (pop body)))
        (dolist (form body result)
          (setq result (append form (list result))))))
;;;###autoload
(defmacro clj-> (&rest body)
      (let ((result (pop body)))
        (dolist (form body result)
          (setq result (append (list (car form) result)
                               (cdr form))))))
(provide 'clojure)
