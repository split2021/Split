# API

## Application files description

**Note**:
- **Display rules**:

  - Empty / not used files are not listed below


- **Common directories and files**:

  - \_\_pycache__/ directories are python files compiled
  - \_\_init__.py files are python module files
  - admin.py files are application interaction with the backoffice description
  - apps.py files are Django required for applications detection
  - forms files are forms class based description
  - models files describe the database using the Django ORM
  - tests.py files are unitary tests



```
api                                       # Project directory
└───api                                   # API application
│   └───migrations                        # List the migrations needed to update the db
|       |   ...
|   |
│   │   admin.py                          # API interaction on the backoffice
│   │   apps.py
│   │   classviews.py                     # Base classes for API endpoints
│   │   models.py                         # API database classes described
│   │   responses.py                      # Base classes for API responses
│   │   tests.py
│   │   urls.py                           # API endpoints description
│   │   views.py                          # API endpoints logic
|
└───eip                                   # EIP application
│   └───migrations
|       |   ...
|   |
|   |   admin.py                          # EIP interaction on the backoffice
|   |   apps.py
|   |   models.py                         # EIP database classes described
|   |   tests.py
|
└───split                                 # Project application
│   └───templates
|       └───admin                         # Django backoffice override
|           |   base_site.html            # Base template override
|       |
|       └───split                         # Additional templates
|           |   user_update_profile.html  # User update template
|   |   
|   |   admin.py                          # Backoffice configuration
|   |   apps.py
|   |   forms.py
|   |   settings.py
|   |   urls.py
|   |   views.py                          # Additional backoffice views
|   |   wsgi.py
|
└───static                                # Django collected static files for production
│   └───admin
|       └───css
|       └───fonts
|       └───img
|       └───js
|
|   Dockerfile                            # Docker API container configuration
|   manage.py                             # Django commands entry point
|   README.md                             # This description file
|   requirements.txt                      # Project modules required list for pip -r
│
```
