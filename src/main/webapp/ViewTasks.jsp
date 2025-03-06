<%@page import="beans.Task"%>
<%@page import="java.util.List"%>
<%@page import="dao.ToDoDAOImpl"%>
<%@page import="dao.ToDoDAOIntf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Tasks</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        .completed-task {
            text-decoration: line-through;
            color: #6c757d;
        }
        .task-container {
            max-width: 900px;
        }
    </style>
</head>
<body class="bg-light">
    <%
    ToDoDAOIntf dao = ToDoDAOImpl.getInstance();
    int regId = Integer.parseInt(session.getAttribute("regId").toString());
    String fname = dao.getFnameByRegId(regId);
    %>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">Task Manager</a>
            <div class="ms-auto d-flex align-items-center">
                <span class="me-3">Welcome, <strong><%=fname%></strong></span>
                <a href="./LogoutServlet" class="btn btn-outline-danger btn-sm">
                    <i class="bi bi-box-arrow-right me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="card shadow task-container mx-auto mb-4">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Add New Task</h5>
            </div>
            <div class="card-body">
                <form method="post" action="./AddTaskServlet" class="row g-3">
                    <div class="col-md-4">
                        <label for="taskName" class="form-label">Task Name</label>
                        <input type="text" class="form-control" id="taskName" name="taskName" required>
                    </div>
                    <div class="col-md-4">
                        <label for="taskDate" class="form-label">Task Date</label>
                        <input type="date" class="form-control" id="taskDate" name="taskDate" placeholder="dd-mm-yyyy" required>
                    </div>
                    <div class="col-md-4">
                        <label for="taskStatus" class="form-label">Task Status</label>
                        <select class="form-select" id="taskStatus" name="taskStatus">
                            <option value="1">Not Yet Started</option>
                            <option value="2">In Progress</option>
                            <option value="3">Completed</option>
                        </select>
                    </div>
                    <div class="col-12 mt-3 text-end">
                        <button type="reset" class="btn btn-secondary">
                            <i class="bi bi-x-circle me-1"></i>Clear
                        </button>
                        <button type="submit" class="btn btn-primary ms-2">
                            <i class="bi bi-plus-circle me-1"></i>Add Task
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="card shadow task-container mx-auto">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Your Tasks</h5>
                <span class="badge bg-light text-dark"><%=dao.findAllTasksByRegId(regId).size()%> tasks</span>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover table-striped mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>Task ID</th>
                                <th>Task Name</th>
                                <th>Task Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<Task> taskList = dao.findAllTasksByRegId(regId);
                            for(Task task : taskList) {
                                int taskId = task.getTaskId();
                                String taskName = task.getTaskName();
                                String taskDate = task.getTaskDate();
                                int taskStatus = task.getTaskStatus();
                                
                                String statusText = "";
                                String statusBadgeClass = "";
                                
                                if(taskStatus == 1) {
                                    statusText = "Not Started";
                                    statusBadgeClass = "bg-warning text-dark";
                                } else if(taskStatus == 2) {
                                    statusText = "In Progress";
                                    statusBadgeClass = "bg-info text-dark";
                                } else {
                                    statusText = "Completed";
                                    statusBadgeClass = "bg-success";
                                }
                            %>
                            <tr class="<%=taskStatus == 3 ? "completed-task" : ""%>">
                                <td><%=taskId%></td>
                                <td><%=taskName%></td>
                                <td><%=taskDate%></td>
                                <td><span class="badge <%=statusBadgeClass%>"><%=statusText%></span></td>
                                <td>
                                    <% if(taskStatus != 3) { %>
                                        <a href="./MarkTaskCompletedServlet?regId=<%=regId%>&taskId=<%=taskId%>" class="btn btn-sm btn-outline-success">
                                            <i class="bi bi-check-circle me-1"></i>Complete
                                        </a>
                                    <% } else { %>
                                        <span class="text-muted"><i class="bi bi-check-circle-fill me-1"></i>Done</span>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                            <% if(taskList.isEmpty()) { %>
                                <tr>
                                    <td colspan="5" class="text-center py-3">
                                        <div class="text-muted">
                                            <i class="bi bi-list-task fs-4 d-block mb-2"></i>
                                            No tasks found. Add a new task to get started!
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
