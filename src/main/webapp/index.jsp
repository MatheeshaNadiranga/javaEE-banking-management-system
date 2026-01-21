<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Future Bank Dashboard</title>
    <!-- Modern Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Icons (Font Awesome for demo) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --primary: #2563EB;
            --primary-dark: #1D4ED8;
            --primary-light: #3B82F6;
            --success: #10B981;
            --success-dark: #059669;
            --error: #EF4444;
            --warning: #F59E0B;
            --background: #F8FAFC;
            --surface: #FFFFFF;
            --text: #1E293B;
            --text-secondary: #64748B;
            --muted: #94A3B8;
            --border: #E2E8F0;
            --radius: 12px;
            --radius-sm: 8px;
            --shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
            --transition: all 0.2s cubic-bezier(.4,0,.2,1);
            --focus: 0 0 0 3px rgba(37,99,235,0.15);
            --font: 'Inter', sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            background: var(--background);
            color: var(--text);
            font-family: var(--font);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1.25rem 5%;
            background: var(--surface);
            box-shadow: var(--shadow-md);
            border-bottom: 1px solid var(--border);
            position: sticky;
            top: 0;
            z-index: 100;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .logo {
            font-weight: 700;
            font-size: clamp(1.25rem, 4vw, 1.75rem);
            color: var(--primary);
            letter-spacing: -0.5px;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
        }

        .logo:hover {
            color: var(--primary-dark);
        }

        .logo i {
            font-size: 1.5rem;
        }

        .search-bar {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            flex: 1;
            max-width: 450px;
            min-width: 200px;
        }

        .search-bar input[type="text"] {
            flex: 1;
            padding: 0.625rem 1rem;
            border: 2px solid var(--border);
            border-radius: var(--radius-sm);
            font-size: 0.9375rem;
            outline: none;
            transition: var(--transition);
            background: var(--background);
            font-family: var(--font);
        }

        .search-bar input[type="text"]:focus {
            border-color: var(--primary);
            box-shadow: var(--focus);
            background: var(--surface);
        }

        .search-bar button {
            background: var(--primary);
            color: #fff;
            border: none;
            border-radius: var(--radius-sm);
            padding: 0.625rem 1.25rem;
            font-weight: 600;
            font-size: 0.9375rem;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            white-space: nowrap;
            font-family: var(--font);
        }

        .search-bar button:focus, .search-bar button:hover {
            background: var(--primary-dark);
            outline: none;
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .search-bar button:active {
            transform: translateY(0);
        }

        /* Main Layout */
        .main {
            flex: 1;
            display: grid;
            grid-template-columns: minmax(300px, 420px) 1fr;
            gap: 1.5rem;
            padding: 1.5rem 5%;
            align-items: start;
            max-width: 1600px;
            margin: 0 auto;
            width: 100%;
        }

        /* Left Panel: Form */
        .panel-left {
            background: var(--surface);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 1.75rem;
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            border: 1px solid var(--border);
        }

        .panel-left h2 {
            margin: 0 0 0.5rem 0;
            font-size: clamp(1.25rem, 3vw, 1.5rem);
            font-weight: 700;
            color: var(--text);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .panel-left h2 i {
            color: var(--primary);
            font-size: 1.25rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-weight: 600;
            font-size: 0.875rem;
            color: var(--text);
            letter-spacing: 0.01em;
        }

        .form-group input, .form-group textarea {
            padding: 0.75rem 1rem;
            border: 2px solid var(--border);
            border-radius: var(--radius-sm);
            font-size: 0.9375rem;
            outline: none;
            transition: var(--transition);
            background: var(--background);
            color: var(--text);
            font-family: var(--font);
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: var(--primary);
            box-shadow: var(--focus);
            background: var(--surface);
        }

        .form-group input[disabled] {
            background: #F1F5F9;
            color: var(--muted);
            cursor: not-allowed;
            opacity: 0.6;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }

        .form-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
            margin-top: 0.5rem;
        }

        .form-actions button {
            padding: 0.875rem 1rem;
            border: none;
            border-radius: var(--radius-sm);
            font-size: 0.9375rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            font-family: var(--font);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background: var(--primary);
            color: #fff;
            box-shadow: var(--shadow);
        }

        .btn-primary:focus, .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            background: var(--muted);
            cursor: not-allowed;
            transform: none;
        }

        .btn-outline {
            background: transparent;
            color: var(--text-secondary);
            border: 2px solid var(--border);
        }

        .btn-outline:focus, .btn-outline:hover {
            background: var(--background);
            border-color: var(--text-secondary);
            color: var(--text);
        }

        .error-message {
            color: var(--error);
            font-size: 0.8125rem;
            min-height: 1.2em;
            transition: var(--transition);
            font-weight: 500;
            margin-top: -0.25rem;
        }

        /* Right Panel: Table and Actions */
        .panel-right {
            background: var(--surface);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 1.75rem;
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            border: 1px solid var(--border);
            min-height: 500px;
        }

        .panel-right h2 {
            margin: 0 0 0.5rem 0;
            font-size: clamp(1.25rem, 3vw, 1.5rem);
            font-weight: 700;
            color: var(--text);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .panel-right h2 i {
            color: var(--primary);
            font-size: 1.25rem;
        }

        .accounts-table-container {
            overflow-x: auto;
            overflow-y: auto;
            border-radius: var(--radius-sm);
            border: 1px solid var(--border);
            background: var(--surface);
        }

        table.accounts-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.875rem;
            background: var(--surface);
            min-width: 800px;
        }

        table.accounts-table th, table.accounts-table td {
            padding: 0.875rem 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }

        table.accounts-table th {
            background: var(--background);
            color: var(--text);
            font-weight: 700;
            font-size: 0.8125rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        table.accounts-table tbody tr {
            transition: var(--transition);
        }

        table.accounts-table tbody tr:hover {
            background: #F8FAFC;
        }

        table.accounts-table tr:last-child td {
            border-bottom: none;
        }

        .actions-cell {
            display: flex;
            gap: 0.5rem;
            justify-content: flex-start;
        }

        .action-btn {
            border: none;
            background: var(--background);
            color: var(--primary);
            font-size: 1rem;
            cursor: pointer;
            padding: 0.5rem 0.625rem;
            border-radius: var(--radius-sm);
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .action-btn:focus, .action-btn:hover {
            background: var(--primary);
            color: white;
            outline: none;
            transform: translateY(-1px);
            box-shadow: var(--shadow);
        }

        .action-btn:active {
            transform: translateY(0);
        }

        .action-btn.delete {
            color: var(--error);
        }

        .action-btn.delete:focus, .action-btn.delete:hover {
            background: var(--error);
            color: white;
        }

        /* Transaction Button */
        .transaction-bar {
            display: flex;
            justify-content: flex-end;
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid var(--border);
        }

        .transaction-btn {
            background: var(--success);
            color: #fff;
            border: none;
            border-radius: var(--radius-sm);
            padding: 0.875rem 1.5rem;
            font-size: 0.9375rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.625rem;
            box-shadow: var(--shadow);
            font-family: var(--font);
        }

        .transaction-btn:focus, .transaction-btn:hover {
            background: var(--success-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .transaction-btn:active {
            transform: translateY(0);
        }

        /* Modal/Popup */
        .modal-overlay {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(4px);
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            padding: 1rem;
        }

        .modal-overlay.active {
            display: flex;
        }

        .modal {
            background: var(--surface);
            border-radius: var(--radius);
            box-shadow: var(--shadow-xl);
            padding: 2rem;
            max-width: 600px;
            width: 100%;
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            outline: none;
            border: 1px solid var(--border);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .modal-title {
            font-size: 1.375rem;
            font-weight: 700;
            color: var(--text);
            display: flex;
            align-items: center;
            gap: 0.625rem;
        }

        .modal-title i {
            color: var(--primary);
        }

        .modal-close {
            background: var(--background);
            border: none;
            color: var(--text-secondary);
            font-size: 1.5rem;
            cursor: pointer;
            border-radius: 50%;
            transition: var(--transition);
            width: 2.5rem;
            height: 2.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-close:focus, .modal-close:hover {
            background: var(--error);
            color: white;
            outline: none;
            transform: rotate(90deg);
        }

        .modal-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
        }

        .modal-section {
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
        }

        .modal-section label {
            font-weight: 600;
            font-size: 0.875rem;
            color: var(--text);
            letter-spacing: 0.01em;
        }

        .modal-section select, .modal-section input[type="number"] {
            padding: 0.75rem 1rem;
            border: 2px solid var(--border);
            border-radius: var(--radius-sm);
            font-size: 0.9375rem;
            outline: none;
            transition: var(--transition);
            background: var(--background);
            color: var(--text);
            font-family: var(--font);
        }

        .modal-section select:focus, .modal-section input[type="number"]:focus {
            border-color: var(--primary);
            box-shadow: var(--focus);
            background: var(--surface);
        }

        .modal-section input[disabled] {
            background: #F1F5F9;
            color: var(--muted);
            cursor: not-allowed;
            opacity: 0.6;
        }

        .modal-actions {
            display: flex;
            gap: 0.75rem;
            justify-content: flex-end;
            flex-wrap: wrap;
        }

        .modal-actions button {
            padding: 0.875rem 1.5rem;
            border-radius: var(--radius-sm);
            border: none;
            font-size: 0.9375rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            font-family: var(--font);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .modal-actions .btn-primary {
            background: var(--primary);
            color: #fff;
            box-shadow: var(--shadow);
        }

        .modal-actions .btn-primary:focus, .modal-actions .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .modal-actions .btn-primary:disabled {
            background: var(--muted);
            cursor: not-allowed;
            transform: none;
        }

        .modal-actions .btn-outline {
            background: transparent;
            color: var(--text-secondary);
            border: 2px solid var(--border);
        }

        .modal-actions .btn-outline:focus, .modal-actions .btn-outline:hover {
            background: var(--background);
            border-color: var(--text-secondary);
            color: var(--text);
        }

        .modal-error {
            color: var(--error);
            font-size: 0.875rem;
            min-height: 1.2em;
            font-weight: 500;
            padding: 0.75rem 1rem;
            background: #FEF2F2;
            border-radius: var(--radius-sm);
            border-left: 3px solid var(--error);
        }

        .modal-error:empty {
            display: none;
        }

        /* Toast Notification */
        .toast {
            position: fixed;
            z-index: 2000;
            right: 1rem;
            top: 5rem;
            min-width: 280px;
            max-width: 400px;
            background: var(--surface);
            color: var(--text);
            border-radius: var(--radius);
            box-shadow: var(--shadow-xl);
            padding: 1rem 1.25rem;
            display: flex;
            align-items: center;
            gap: 0.875rem;
            font-size: 0.9375rem;
            font-weight: 500;
            opacity: 0;
            pointer-events: none;
            transform: translateX(400px);
            transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            border: 1px solid var(--border);
        }

        .toast.show {
            opacity: 1;
            pointer-events: auto;
            transform: translateX(0);
        }

        .toast.success {
            border-left: 4px solid var(--success);
        }

        .toast.error {
            border-left: 4px solid var(--error);
        }

        .toast.info {
            border-left: 4px solid var(--primary);
        }

        .toast .toast-icon {
            font-size: 1.375rem;
            flex-shrink: 0;
        }

        .toast.success .toast-icon {
            color: var(--success);
        }

        .toast.error .toast-icon {
            color: var(--error);
        }

        .toast.info .toast-icon {
            color: var(--primary);
        }

        /* Loading Overlay */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(15, 23, 42, 0.5);
            backdrop-filter: blur(2px);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

        .loading-overlay.active {
            display: flex;
        }

        .loader {
            border: 4px solid var(--border);
            border-top: 4px solid var(--primary);
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .main {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .panel-left, .panel-right {
                max-width: 100%;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 1rem 4%;
            }

            .main {
                padding: 1rem 4%;
                gap: 1.25rem;
            }

            .panel-left, .panel-right {
                padding: 1.25rem;
            }

            .search-bar {
                order: 3;
                flex-basis: 100%;
                max-width: 100%;
            }

            .search-bar button span {
                display: none;
            }

            .form-actions {
                grid-template-columns: 1fr;
            }

            .modal {
                padding: 1.5rem;
                margin: 1rem;
                max-height: 90vh;
                overflow-y: auto;
            }

            .modal-content {
                grid-template-columns: 1fr;
            }

            .modal-actions {
                flex-direction: column-reverse;
            }

            .modal-actions button {
                width: 100%;
            }

            table.accounts-table {
                font-size: 0.8125rem;
            }

            table.accounts-table th, table.accounts-table td {
                padding: 0.625rem 0.75rem;
            }

            .toast {
                right: 0.75rem;
                left: 0.75rem;
                min-width: auto;
                max-width: calc(100% - 1.5rem);
            }
        }

        @media (max-width: 480px) {
            .logo {
                font-size: 1.125rem;
            }

            .panel-left h2, .panel-right h2 {
                font-size: 1.125rem;
            }

            .search-bar input[type="text"] {
                font-size: 0.875rem;
                padding: 0.5rem 0.75rem;
            }

            .search-bar button {
                padding: 0.5rem 1rem;
            }
        }

        /* Scrollbar Styling */
        .accounts-table-container::-webkit-scrollbar,
        .modal::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        .accounts-table-container::-webkit-scrollbar-track,
        .modal::-webkit-scrollbar-track {
            background: var(--background);
            border-radius: 4px;
        }

        .accounts-table-container::-webkit-scrollbar-thumb,
        .modal::-webkit-scrollbar-thumb {
            background: var(--muted);
            border-radius: 4px;
        }

        .accounts-table-container::-webkit-scrollbar-thumb:hover,
        .modal::-webkit-scrollbar-thumb:hover {
            background: var(--text-secondary);
        }
    </style>
</head>
<body>
<!-- Loading Overlay -->
<div class="loading-overlay" id="loadingOverlay">
    <div class="loader"></div>
</div>

<!-- Header -->
<header class="header">
    <a href="#" class="logo">
        <i class="fas fa-university"></i>
        <span>FutureBank</span>
    </a>
    <form class="search-bar" id="searchForm" autocomplete="off" role="search" aria-label="Search by account number">
        <input type="text" id="searchInput" placeholder="Search by Account Number" aria-label="Account Number" maxlength="12" />
        <button type="submit" aria-label="Search">
            <i class="fas fa-search"></i>
            <span>Search</span>
        </button>
    </form>
</header>

<!-- Main Content -->
<main class="main">
    <!-- Left Panel: Account Creation Form -->
    <section class="panel-left" aria-label="Create or Update Account">
        <h2 id="formTitle">
            <i class="fas fa-user-plus"></i>
            Create New Account
        </h2>
        <form id="accountForm" autocomplete="off" novalidate>
            <div class="form-group">
                <label for="nameInput">Full Name</label>
                <input type="text" id="nameInput" name="name" required minlength="2" maxlength="40" autocomplete="off" placeholder="Enter full name" />
                <div class="error-message" id="nameError"></div>
            </div>

            <div class="form-group">
                <label for="ageInput">Age</label>
                <input type="number" id="ageInput" name="age" required min="18" max="120" autocomplete="off" placeholder="Enter age" />
                <div class="error-message" id="ageError"></div>
            </div>

            <div class="form-group">
                <label for="nicInput">NIC Number</label>
                <input type="text" id="nicInput" name="nic" required maxlength="12" autocomplete="off" placeholder="Enter NIC" />
                <div class="error-message" id="nicError"></div>
            </div>

            <div class="form-group">
                <label for="accountNumberInput">Account Number</label>
                <input type="text" id="accountNumberInput" name="accountNumber" required maxlength="12" autocomplete="off" placeholder="Enter account number" />
                <div class="error-message" id="accountNumberError"></div>
            </div>

            <div class="form-group">
                <label for="initialPaymentInput">Initial Payment Amount</label>
                <input type="number" id="initialPaymentInput" name="initialPayment" required min="1000" autocomplete="off" placeholder="Minimum 1000" />
                <div class="error-message" id="initialPaymentError"></div>
            </div>

            <div class="form-group">
                <label for="addressInput">Address</label>
                <textarea id="addressInput" name="address" required minlength="5" maxlength="100" rows="2" placeholder="Enter address"></textarea>
                <div class="error-message" id="addressError"></div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn-primary" id="submitBtn">
                    <i class="fas fa-check"></i>
                    Create Account
                </button>
                <button type="button" class="btn-outline" id="resetBtn">
                    <i class="fas fa-redo"></i>
                    Reset
                </button>
            </div>
        </form>
    </section>

    <!-- Right Panel: Account Table and Actions -->
    <section class="panel-right" aria-label="Account List and Actions">
        <h2>
            <i class="fas fa-table"></i>
            All Accounts
        </h2>
        <div class="accounts-table-container" id="accountsTableContainer">
            <table class="accounts-table" id="accountsTable" aria-label="Accounts Table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Age</th>
                    <th>NIC</th>
                    <th>Account #</th>
                    <th>Balance</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody id="accountsTableBody">
                <!-- Dynamic rows -->
                </tbody>
            </table>
        </div>
        <div class="transaction-bar">
            <button class="transaction-btn" id="transactionBtn" aria-haspopup="dialog">
                <i class="fas fa-exchange-alt"></i>
                New Transaction
            </button>
        </div>
    </section>
</main>

<!-- Transaction Modal -->
<div class="modal-overlay" id="modalOverlay" role="dialog" aria-modal="true" aria-labelledby="modalTitle" tabindex="-1">
    <div class="modal" id="transactionModal" tabindex="0">
        <div class="modal-header">
        <span class="modal-title" id="modalTitle">
          <i class="fas fa-money-bill-transfer"></i>
          Account Transaction
        </span>
            <button class="modal-close" id="modalCloseBtn" aria-label="Close">&times;</button>
        </div>
        <form id="transactionForm" autocomplete="off" novalidate>
            <div class="modal-content">
                <div class="modal-section">
                    <label for="senderSelect">Sender Account</label>
                    <select id="senderSelect" required></select>
                    <label for="senderName">Account Holder Name</label>
                    <input type="text" id="senderName" disabled />
                    <label for="transferAmount">Transfer Amount</label>
                    <input type="number" id="transferAmount" min="1" required placeholder="Enter amount" />
                </div>
                <div class="modal-section">
                    <label for="receiverSelect">Receiver Account</label>
                    <select id="receiverSelect" required></select>
                    <label for="receiverName">Account Holder Name</label>
                    <input type="text" id="receiverName" disabled />
                </div>
            </div>
            <div class="modal-error" id="transactionError"></div>
            <div class="modal-actions">
                <button type="button" class="btn-outline" id="modalCancelBtn">
                    <i class="fas fa-times"></i>
                    Cancel
                </button>
                <button type="submit" class="btn-primary">
                    <i class="fas fa-paper-plane"></i>
                    Transfer Funds
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Toast Notification -->
<div class="toast" id="toast" role="status" aria-live="polite"></div>

<!-- JavaScript -->
<script>
    // --- API Configuration with Debugging ---
    const CONTEXT_PATH = '<%= request.getContextPath() %>';
    const FULL_URL = window.location.href;
    const BASE_URL = window.location.origin;


    let API_BASE_URL = '';
    if (CONTEXT_PATH && CONTEXT_PATH !== '') {
        API_BASE_URL = CONTEXT_PATH;
    } else {

        const pathParts = window.location.pathname.split('/');
        if (pathParts.length > 1 && pathParts[1]) {
            API_BASE_URL = '/' + pathParts[1];
        }
    }


    const API_ENDPOINTS = {
        accounts: API_BASE_URL + '/accounts',
        transactions: API_BASE_URL + '/transactions'
    };


    console.log('=== API Configuration Debug ===');
    console.log('Context Path from JSP:', CONTEXT_PATH);
    console.log('Current URL:', FULL_URL);
    console.log('Calculated API Base URL:', API_BASE_URL);
    console.log('Accounts Endpoint:', API_ENDPOINTS.accounts);
    console.log('Transactions Endpoint:', API_ENDPOINTS.transactions);
    console.log('==============================');


    function showToast(message, type = 'info') {
        const toast = document.getElementById('toast');
        toast.textContent = '';
        toast.className = 'toast ' + type;
        const icon = document.createElement('span');
        icon.className = 'toast-icon';
        if (type === 'success') icon.innerHTML = '<i class="fas fa-check-circle"></i>';
        else if (type === 'error') icon.innerHTML = '<i class="fas fa-times-circle"></i>';
        else icon.innerHTML = '<i class="fas fa-info-circle"></i>';
        toast.appendChild(icon);
        toast.appendChild(document.createTextNode(message));
        toast.classList.add('show');
        setTimeout(() => { toast.classList.remove('show'); }, 3200);
    }

    function showLoading() {
        document.getElementById('loadingOverlay').classList.add('active');
    }

    function hideLoading() {
        document.getElementById('loadingOverlay').classList.remove('active');
    }


    async function apiRequest(url, options = {}) {
        try {
            showLoading();
            const response = await fetch(url, {
                headers: {
                    'Content-Type': 'application/json',
                    ...options.headers
                },
                ...options
            });

            hideLoading();

            if (!response.ok) {
                throw new Error(`HTTP error! status: \${response.status}`);
            }


            if (response.status === 204) {
                return null;
            }

            const data = await response.json();


            if (typeof data === 'string') {
                return { success: !data.toLowerCase().includes('failed'), message: data };
            }

            return data;
        } catch (error) {
            hideLoading();
            console.error('API Error:', error);
            throw error;
        }
    }


    async function fetchAllAccounts() {
        return await apiRequest(API_ENDPOINTS.accounts);
    }

    async function createAccountAPI(accountData) {
        return await apiRequest(API_ENDPOINTS.accounts, {
            method: 'POST',
            body: JSON.stringify(accountData)
        });
    }

    async function updateAccountAPI(accountData) {
        return await apiRequest(API_ENDPOINTS.accounts, {
            method: 'PUT',
            body: JSON.stringify(accountData)
        });
    }

    async function deleteAccountAPI(accountNumber) {
        return await apiRequest(API_BASE_URL + '/accounts?account=' + accountNumber, {
            method: 'DELETE'
        });
    }

    async function searchAccountAPI(accountNumber) {
        return await apiRequest(API_BASE_URL + '/accounts?account=' + accountNumber);
    }

    async function transferFundsAPI(transferData) {
        return await apiRequest(API_ENDPOINTS.transactions, {
            method: 'POST',
            body: JSON.stringify(transferData)
        });
    }

    // Sri Lankan NIC: old (9 digits + V/X), new (12 digits)
    const NIC_REGEX = /^(\d{9}[vVxX]|\d{12})$/;

    // --- DOM Elements ---
    const accountForm = document.getElementById('accountForm');
    const submitBtn = document.getElementById('submitBtn');
    const resetBtn = document.getElementById('resetBtn');
    const formTitle = document.getElementById('formTitle');
    const accountsTableBody = document.getElementById('accountsTableBody');
    const searchForm = document.getElementById('searchForm');
    const searchInput = document.getElementById('searchInput');
    const transactionBtn = document.getElementById('transactionBtn');
    const modalOverlay = document.getElementById('modalOverlay');
    const transactionModal = document.getElementById('transactionModal');
    const modalCloseBtn = document.getElementById('modalCloseBtn');
    const modalCancelBtn = document.getElementById('modalCancelBtn');
    const transactionForm = document.getElementById('transactionForm');
    const senderSelect = document.getElementById('senderSelect');
    const receiverSelect = document.getElementById('receiverSelect');
    const senderName = document.getElementById('senderName');
    const receiverName = document.getElementById('receiverName');
    const transferAmount = document.getElementById('transferAmount');
    const transactionError = document.getElementById('transactionError');

    // Form fields
    const nameInput = document.getElementById('nameInput');
    const ageInput = document.getElementById('ageInput');
    const nicInput = document.getElementById('nicInput');
    const accountNumberInput = document.getElementById('accountNumberInput');
    const initialPaymentInput = document.getElementById('initialPaymentInput');
    const addressInput = document.getElementById('addressInput');

    // Error fields
    const nameError = document.getElementById('nameError');
    const ageError = document.getElementById('ageError');
    const nicError = document.getElementById('nicError');
    const accountNumberError = document.getElementById('accountNumberError');
    const initialPaymentError = document.getElementById('initialPaymentError');
    const addressError = document.getElementById('addressError');

    // --- State ---
    let isUpdateMode = false;
    let updateAccountNumber = null;
    let accountsCache = [];

    // --- Initialization ---
    document.addEventListener('DOMContentLoaded', async () => {
        await loadAccounts();
        resetForm();
    });

    // --- Load Accounts ---
    async function loadAccounts() {
        try {
            const data = await fetchAllAccounts();
            accountsCache = Array.isArray(data) ? data : [];
            renderAccountsTable();
        } catch (error) {
            showToast('Failed to load accounts: ' + error.message, 'error');
            accountsCache = [];
            renderAccountsTable();
        }
    }

    // --- Form Validation ---
    function validateForm(fields) {
        let valid = true;
        // Name
        if (!fields.name || fields.name.trim().length < 2) {
            nameError.textContent = 'Name is required (min 2 chars).';
            valid = false;
        } else {
            nameError.textContent = '';
        }
        // Age
        const age = Number(fields.age);
        if (!fields.age || isNaN(age) || age < 18 || age > 120) {
            ageError.textContent = 'Age must be between 18 and 120.';
            valid = false;
        } else {
            ageError.textContent = '';
        }
        // NIC
        if (!fields.nic || !NIC_REGEX.test(fields.nic.trim())) {
            nicError.textContent = 'Invalid NIC format.';
            valid = false;
        } else {
            nicError.textContent = '';
        }
        // Account Number
        if (!fields.accountNumber || !/^\d{8,12}$/.test(fields.accountNumber)) {
            accountNumberError.textContent = 'Account number must be 8-12 digits.';
            valid = false;
        } else {
            accountNumberError.textContent = '';
        }
        // Initial Payment (only for create mode)
        if (!isUpdateMode) {
            const payment = Number(fields.initialPayment);
            if (!fields.initialPayment || isNaN(payment) || payment < 1000) {
                initialPaymentError.textContent = 'Minimum initial payment is 1000.';
                valid = false;
            } else {
                initialPaymentError.textContent = '';
            }
        }
        // Address
        if (!fields.address || fields.address.trim().length < 5) {
            addressError.textContent = 'Address is required (min 5 chars).';
            valid = false;
        } else {
            addressError.textContent = '';
        }
        return valid;
    }

    // --- Form Handlers ---
    accountForm.addEventListener('submit', async function(e) {
        e.preventDefault();
        const fields = {
            name: nameInput.value.trim(),
            age: ageInput.value.trim(),
            nic: nicInput.value.trim(),
            accountNumber: accountNumberInput.value.trim(),
            initialPayment: initialPaymentInput.value.trim(),
            address: addressInput.value.trim()
        };
        if (!validateForm(fields)) return;

        submitBtn.disabled = true;

        if (isUpdateMode) {
            await updateAccount(fields);
        } else {
            await createAccount(fields);
        }

        submitBtn.disabled = false;
    });

    resetBtn.addEventListener('click', resetForm);

    function resetForm() {
        accountForm.reset();
        nameError.textContent = '';
        ageError.textContent = '';
        nicError.textContent = '';
        accountNumberError.textContent = '';
        initialPaymentError.textContent = '';
        addressError.textContent = '';
        submitBtn.innerHTML = '<i class="fas fa-check"></i> Create Account';
        formTitle.innerHTML = '<i class="fas fa-user-plus"></i> Create New Account';
        isUpdateMode = false;
        updateAccountNumber = null;
        accountNumberInput.disabled = false;
        initialPaymentInput.disabled = false;
    }

    // --- CRUD Functions ---
    async function createAccount(fields) {
        try {
            // Match DTO field names: idNumber instead of nic
            const accountData = {
                name: fields.name,
                age: Number(fields.age),
                idNumber: fields.nic,  // Map to idNumber as per DTO
                accountNumber: Number(fields.accountNumber),  // Convert to int
                balance: Number(fields.initialPayment),
                address: fields.address
            };

            const result = await createAccountAPI(accountData);
            await loadAccounts();

            if (result && result.success !== false) {
                showToast('Account created successfully!', 'success');
                resetForm();
            } else {
                showToast(result?.message || 'Failed to create account', 'error');
            }
        } catch (error) {
            showToast('Failed to create account: ' + error.message, 'error');
        }
    }

    async function updateAccount(fields) {
        try {
            // Match DTO field names and backend update logic
            // Backend update doesn't update balance or accountNumber
            const accountData = {
                name: fields.name,
                age: Number(fields.age),
                idNumber: fields.nic,  // Map to idNumber as per DTO
                accountNumber: Number(updateAccountNumber),  // Include for identification
                address: fields.address
            };

            const result = await updateAccountAPI(accountData);
            await loadAccounts();

            if (result && result.success !== false) {
                showToast('Account updated successfully!', 'success');
                resetForm();
            } else {
                showToast(result?.message || 'Failed to update account', 'error');
            }
        } catch (error) {
            showToast('Failed to update account: ' + error.message, 'error');
        }
    }

    function handleUpdate(accountNumber) {
        const acc = accountsCache.find(acc => acc.accountNumber === accountNumber);
        if (!acc) return;

        nameInput.value = acc.name;
        ageInput.value = acc.age;
        nicInput.value = acc.idNumber;  // Use idNumber from DTO
        accountNumberInput.value = acc.accountNumber;
        initialPaymentInput.value = acc.balance;
        addressInput.value = acc.address;
        accountNumberInput.disabled = true;
        initialPaymentInput.disabled = true;
        submitBtn.innerHTML = '<i class="fas fa-save"></i> Update';
        formTitle.innerHTML = '<i class="fas fa-user-edit"></i> Update Account';
        isUpdateMode = true;
        updateAccountNumber = acc.accountNumber;
        nameInput.focus();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    async function handleDelete(accountNumber) {
        if (!confirm('Are you sure you want to delete this account?')) return;

        try {
            const result = await deleteAccountAPI(accountNumber);
            await loadAccounts();

            if (result && result.success !== false) {
                showToast('Account deleted successfully.', 'success');
            } else {
                showToast(result?.message || 'Failed to delete account', 'error');
            }

            if (isUpdateMode && updateAccountNumber === accountNumber) {
                resetForm();
            }
        } catch (error) {
            showToast('Failed to delete account: ' + error.message, 'error');
        }
    }

    // --- Table Rendering ---
    function renderAccountsTable(highlightAccountNumber = null) {
        accountsTableBody.innerHTML = '';

        if (accountsCache.length === 0) {
            accountsTableBody.innerHTML = `
          <tr>
            <td colspan="7" style="text-align: center; padding: 3rem; color: var(--text-secondary);">
              <i class="fas fa-inbox" style="font-size: 3rem; margin-bottom: 1rem; display: block; opacity: 0.3;"></i>
              No accounts found. Create your first account!
            </td>
          </tr>
        `;
            return;
        }

        accountsCache.forEach(acc => {
            const tr = document.createElement('tr');
            if (highlightAccountNumber && acc.accountNumber == highlightAccountNumber) {
                tr.style.background = '#DBEAFE';
            }
            tr.innerHTML = `
          <td><strong>\${acc.name}</strong></td>
          <td>\${acc.age}</td>
          <td>\${acc.idNumber}</td>
          <td><code style="background: var(--background); padding: 0.25rem 0.5rem; border-radius: 4px; font-size: 0.8125rem;">\${acc.accountNumber}</code></td>
          <td><strong style="color: var(--success);">Rs. \${acc.balance.toLocaleString()}</strong></td>
          <td style="max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" title="\${acc.address}">\${acc.address}</td>
          <td class="actions-cell">
            <button class="action-btn update" title="Update Account" aria-label="Update" tabindex="0">
              <i class="fas fa-edit"></i>
            </button>
            <button class="action-btn delete" title="Delete Account" aria-label="Delete" tabindex="0">
              <i class="fas fa-trash"></i>
            </button>
          </td>
        `;
            // Action handlers
            const updateBtn = tr.querySelector('.update');
            const deleteBtn = tr.querySelector('.delete');
            updateBtn.addEventListener('click', () => handleUpdate(acc.accountNumber));
            deleteBtn.addEventListener('click', () => handleDelete(acc.accountNumber));
            accountsTableBody.appendChild(tr);
        });
    }

    // --- Search Functionality ---
    searchForm.addEventListener('submit', async function(e) {
        e.preventDefault();
        const query = searchInput.value.trim();
        if (!query) {
            showToast('Please enter an account number.', 'error');
            return;
        }

        try {
            const result = await searchAccountAPI(query);

            if (result && result.accountNumber) {
                // Reload to ensure we have latest data
                await loadAccounts();
                renderAccountsTable(result.accountNumber);
                showToast('Account found and highlighted.', 'success');

                // Scroll into view
                const rows = accountsTableBody.querySelectorAll('tr');
                rows.forEach(row => {
                    const accountCell = row.children[3];
                    if (accountCell && accountCell.textContent.includes(query)) {
                        row.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                });
            } else {
                showToast('Account not found.', 'error');
                await loadAccounts();
            }
        } catch (error) {
            showToast('Account not found.', 'error');
            await loadAccounts();
        }
    });

    // --- Transaction Modal Logic ---
    transactionBtn.addEventListener('click', openTransactionModal);
    modalCloseBtn.addEventListener('click', closeTransactionModal);
    modalCancelBtn.addEventListener('click', closeTransactionModal);

    function openTransactionModal() {
        if (accountsCache.length < 2) {
            showToast('You need at least 2 accounts to make a transaction.', 'error');
            return;
        }
        populateAccountDropdowns();
        transactionForm.reset();
        senderName.value = '';
        receiverName.value = '';
        transferAmount.value = '';
        transactionError.textContent = '';
        modalOverlay.classList.add('active');
        transactionModal.focus();
        // Trap focus inside modal
        trapFocus(transactionModal);
    }

    function closeTransactionModal() {
        modalOverlay.classList.remove('active');
        transactionBtn.focus();
    }

    // Trap focus in modal for accessibility
    function trapFocus(modal) {
        const focusable = modal.querySelectorAll('select, input:not([disabled]), button');
        const first = focusable[0];
        const last = focusable[focusable.length - 1];

        const handleKeyDown = function(e) {
            if (e.key === 'Tab') {
                if (e.shiftKey) {
                    if (document.activeElement === first) {
                        e.preventDefault();
                        last.focus();
                    }
                } else {
                    if (document.activeElement === last) {
                        e.preventDefault();
                        first.focus();
                    }
                }
            }
            if (e.key === 'Escape') {
                closeTransactionModal();
            }
        };

        modal.addEventListener('keydown', handleKeyDown);
    }

    // Populate dropdowns and autofill names
    function populateAccountDropdowns() {
        senderSelect.innerHTML = '';
        receiverSelect.innerHTML = '';

        accountsCache.forEach(acc => {
            const opt1 = document.createElement('option');
            opt1.value = acc.accountNumber;
            opt1.textContent = `\${acc.accountNumber} - \${acc.name}`;
            senderSelect.appendChild(opt1);

            const opt2 = document.createElement('option');
            opt2.value = acc.accountNumber;
            opt2.textContent = `\${acc.accountNumber} - \${acc.name}`;
            receiverSelect.appendChild(opt2);
        });

        // Prevent selecting same account
        senderSelect.addEventListener('change', updateReceiverOptions);
        receiverSelect.addEventListener('change', updateSenderOptions);
        senderSelect.selectedIndex = 0;
        receiverSelect.selectedIndex = 1 >= accountsCache.length ? 0 : 1;
        updateSenderReceiverNames();
    }

    function updateReceiverOptions() {
        const senderVal = senderSelect.value;
        Array.from(receiverSelect.options).forEach(opt => {
            opt.disabled = opt.value === senderVal;
        });
        if (receiverSelect.value === senderVal) {
            receiverSelect.selectedIndex = Array.from(receiverSelect.options).findIndex(opt => !opt.disabled);
        }
        updateSenderReceiverNames();
    }

    function updateSenderOptions() {
        const receiverVal = receiverSelect.value;
        Array.from(senderSelect.options).forEach(opt => {
            opt.disabled = opt.value === receiverVal;
        });
        if (senderSelect.value === receiverVal) {
            senderSelect.selectedIndex = Array.from(senderSelect.options).findIndex(opt => !opt.disabled);
        }
        updateSenderReceiverNames();
    }

    senderSelect.addEventListener('change', updateSenderReceiverNames);
    receiverSelect.addEventListener('change', updateSenderReceiverNames);

    function updateSenderReceiverNames() {
        const senderAcc = accountsCache.find(acc => acc.accountNumber == senderSelect.value);
        const receiverAcc = accountsCache.find(acc => acc.accountNumber == receiverSelect.value);
        senderName.value = senderAcc ? senderAcc.name : '';
        receiverName.value = receiverAcc ? receiverAcc.name : '';
    }

    // --- Transaction Submission ---
    transactionForm.addEventListener('submit', async function(e) {
        e.preventDefault();
        const senderAccNum = senderSelect.value;
        const receiverAccNum = receiverSelect.value;
        const amount = Number(transferAmount.value);

        if (!senderAccNum || !receiverAccNum || senderAccNum === receiverAccNum) {
            transactionError.textContent = 'Please select different sender and receiver accounts.';
            return;
        }
        if (!amount || isNaN(amount) || amount <= 0) {
            transactionError.textContent = 'Please enter a valid transfer amount.';
            return;
        }

        const sender = accountsCache.find(acc => acc.accountNumber == senderAccNum);
        if (!sender) {
            transactionError.textContent = 'Invalid sender account.';
            return;
        }
        if (sender.balance < amount) {
            transactionError.textContent = `Insufficient balance. Available: Rs. \${sender.balance.toLocaleString()}`;
            return;
        }

        try {
            // Match TransactionDetails DTO field names
            const transferData = {
                sendersAccountNumber: String(senderAccNum),
                receiversAccountNumber: String(receiverAccNum),
                amount: amount
            };

            const result = await transferFundsAPI(transferData);
            await loadAccounts();

            const senderName = sender.name;
            const receiver = accountsCache.find(acc => acc.accountNumber == receiverAccNum);
            const receiverName = receiver ? receiver.name : 'Unknown';

            if (result && result.success !== false) {
                showToast(`Successfully transferred Rs. \${amount.toLocaleString()} from \${senderName} to \${receiverName}!`, 'success');
                closeTransactionModal();
            } else {
                transactionError.textContent = result?.message || 'Transaction failed';
            }
        } catch (error) {
            transactionError.textContent = error.message;
        }
    });

    // --- Accessibility: Close modal on overlay click ---
    modalOverlay.addEventListener('mousedown', function(e) {
        if (e.target === modalOverlay) closeTransactionModal();
    });
</script>
</body>
</html>
