<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/layouts/teacher/header.jsp" %>
<%@ include file="/layouts/teacher/nav.jsp" %>
<style>
.chat-container {
    max-width: 800px;
    margin: auto;
    height: 90vh;
    border: 1px solid #ddd;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
}

.chat-header {
    padding: 15px 20px;
    background-color: #007bff;
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.chat-messages {
    flex: 1;
    overflow-y: auto;
    padding: 20px;
    background-color: #f8f9fa;
}

.chat-message {
    display: flex;
    align-items: flex-end;
    margin-bottom: 20px;
}

.chat-message.sent {
    flex-direction: row-reverse;
}

.chat-message .avatar {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    object-fit: cover;
    margin: 0 10px;
}

.chat-bubble {
    max-width: 70%;
    padding: 12px 16px;
    border-radius: 16px;
    position: relative;
}

.chat-bubble.sent {
    background-color: #d1e7dd;
    text-align: right;
}

.chat-bubble.received {
    background-color: #ffffff;
    text-align: left;
}

.chat-bubble .name {
    font-weight: bold;
    margin-bottom: 4px;
}

.chat-bubble .time {
    font-size: 0.75rem;
    color: #888;
    margin-top: 5px;
}

.chat-form {
    padding: 10px 15px;
    background-color: #fff;
    border-top: 1px solid #ddd;
}

.chat-input-group {
    display: flex;
    align-items: flex-end;
    gap: 10px;
}

.chat-input-group textarea {
    flex-grow: 1;
    resize: none;
    border-radius: 20px;
    padding: 10px 16px;
    font-size: 15px;
    border: 1px solid #ced4da;
    background-color: #f1f3f5;
    max-height: 200px;
    overflow-y: auto;
}

.chat-input-group textarea:focus {
    background-color: #fff;
    border-color: #007bff;
    outline: none;
}

.send-btn {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.send-btn:hover {
    background-color: #0056b3;
}
</style>

<script>
// Auto-grow textarea
function autoResize(el) {
    el.style.height = "auto";
    el.style.height = (el.scrollHeight) + "px";
}
</script>


<section class="py-5">
    <div class="chat-container shadow-sm">

        <!-- Chat Header -->
        <div class="chat-header">
            Conversation: ${conversation.title}
        </div>

        <!-- Messages -->
        <div class="chat-messages">
            <c:forEach items="${conversation.messages}" var="message">
                <c:choose>
                    <c:when test="${message.sender.id == auth_user.id}">
                        <div class="chat-message sent">
                            <img src="${message.sender.profile_image != null ? message.sender.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-5.webp'}"
                                 class="avatar" alt="avatar">
                            <div class="chat-bubble sent">
                                <div class="name">${message.sender.firstName} ${message.sender.lastName}</div>
                                <div>${message.message}</div>
                                <div class="time">13 mins ago</div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="chat-message received">
                            <img src="${message.sender.profile_image != null ? message.sender.profile_image : 'https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp'}"
                                 class="avatar" alt="avatar">
                            <div class="chat-bubble received">
                                <div class="name">${message.sender.firstName} ${message.sender.lastName}</div>
                                <div>${message.message}</div>
                                <div class="time">10 mins ago</div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <!-- Form -->
        <div class="chat-form">
            <form action="/chat" method="post">
                <input type="hidden" name="conversation_id" value="${param.conversation_id}">
                <div class="chat-input-group">
                    <textarea class="form-control" rows="1" name="message" placeholder="Type a message..."
                        oninput="autoResize(this)"></textarea>
                    <button type="submit" class="send-btn"><i class="fas fa-paper-plane"></i></button>
                </div>
            </form>
        </div>

    </div>
</section>

<%@ include file="/layouts/teacher/footer.jsp" %>
