# 📝 Contact Form Validation

> Building a professional contact form with real-time validation and custom error messages using JavaScript.

---

# 📖 Overview

In this activity, I enhanced my personal website by implementing **client-side form validation** using JavaScript.

Instead of relying on the browser's default validation, I created custom validation rules that verify user input before the form is submitted. Invalid fields display clear error messages and visual feedback, while valid submissions show a confirmation message.

This practice introduced one of the most important aspects of front-end development: improving the user experience through interactive and reliable form validation.

---

# 🎯 Learning Objectives

During this activity I learned how to:

- Create custom form validation
- Handle form submission events
- Prevent the default browser behavior
- Validate text inputs
- Validate email addresses
- Validate message length
- Display custom error messages
- Apply CSS classes dynamically
- Show confirmation messages after successful validation

---

# 📂 Files

```text
03-CONTACT-FORM-VALIDATION
│
├── contacto.html
├── estilos.css
├── scripts.js
├── Screenshot-01.png
└── README.md
```

---

# ⚙️ How It Works

The validation process follows these steps:

1. The user fills out the contact form.
2. JavaScript listens for the **Submit** event.
3. The default form submission is prevented.
4. Each field is validated individually.
5. Error messages appear below invalid fields.
6. Invalid fields receive a red border.
7. If every field is valid, a success message is displayed.
8. The form is reset automatically.

---

# ✔️ Validation Rules

### 👤 Name

Requirements:

- Cannot be empty
- Leading and trailing spaces are ignored

---

### 📧 Email

Requirements:

- Must follow a valid email format

Example:

```
username@example.com
```

Validation is performed using a Regular Expression (Regex).

---

### 💬 Message

Requirements:

- Minimum of 20 characters
- Cannot be empty

---

# 💻 JavaScript Concepts

This activity uses:

- `addEventListener()`
- `submit`
- `preventDefault()`
- `trim()`
- `classList.add()`
- `classList.remove()`
- `textContent`
- `style.display`
- Regular Expressions (Regex)
- Conditional Statements
- Boolean Variables

---

# 🎨 CSS Features

The interface provides visual feedback through CSS by:

- Highlighting invalid fields
- Displaying error messages
- Styling the submit button
- Showing the success confirmation message
- Improving the overall user experience

---

# 🛠 Technologies Used

- HTML5
- CSS3
- JavaScript (ES6)
- Visual Studio Code
- Google Chrome

---

# 📚 What I Learned

After completing this activity, I can:

- Validate forms without reloading the page.
- Handle form submission events.
- Detect invalid user input.
- Display meaningful validation messages.
- Improve website usability.
- Manipulate CSS classes dynamically.
- Combine HTML, CSS, and JavaScript to create professional forms.

---

# 💡 Skills Developed

Throughout this practice I strengthened my understanding of:

- DOM Manipulation
- Event Handling
- Form Validation
- User Experience (UX)
- Conditional Logic
- JavaScript Events
- Dynamic CSS Styling

---

# ✅ Status

**Completed ✔️**

---

# 🚀 Conclusion

This activity represents one of the most practical uses of JavaScript in modern web development.

By implementing custom form validation, I learned how to verify user input, provide immediate feedback, and improve the overall user experience. These techniques are commonly used in professional websites and serve as a foundation for more advanced front-end and full-stack applications.

---

# ⭐ Key Takeaways

✔ Custom Form Validation

✔ JavaScript Events

✔ Regular Expressions (Regex)

✔ Dynamic DOM Manipulation

✔ Error Handling

✔ Interactive User Experience

---

**Happy Coding! 🚀**
