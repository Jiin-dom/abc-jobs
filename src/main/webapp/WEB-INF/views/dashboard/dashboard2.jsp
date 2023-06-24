<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
    	ul.friend-list {
    margin: 0;
    padding: 0;
}

ul.friend-list li {
    list-style-type: none;
    display: flex;
    align-items: center;
}

ul.friend-list li:hover {
    background: rgba(0, 0, 0, .1);
    cursor: pointer;
}

ul.friend-list .left img {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    margin-right: 20px;
}

ul.friend-list li {
    padding: 10px;
}

ul.friend-list .right h3 {
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 0;
}

ul.friend-list .right p {
    font-size: 11px;
    color: #6c757d;
    margin: 0;
}

.social-timeline-card .dropdown-toggle::after {
    display: none;
}

.info-card h4 {
    font-size: 15px;
}

.info-card h2 {
    font-size: 18px;
    margin-bottom: 20px;
}

.social-about .social-info {
    font-size: 16px;
    margin-bottom: 20px;
}

.social-about p {
    margin-bottom: 20px;
}
    </style>
</head>
<body>

       <jsp:include page="../header2.jsp">
           <jsp:param value="Dashboard" name="HTMLtitle" />
       </jsp:include>

           <div class="container dashboard-container">
            <div class="alert alert-success alert-dismissible fade show ${message == null ? " d-none" : "d-flex" }"
                role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            
 
            <div class="container container-dashboard">
            	<img src="images/profheader.png" class="headerimg">
            	<div class="row border mb-4 row-no-margin" style="margin: 0px 0px 24px;">
					
            		<div
	                    class="col-2 rounded-circle align-self-stretch text-center fs-1 d-flex align-items-center justify-content-center bg-primary bg-gradient text-white profileshape">
	                    <span>${f}</span>
	                    <span>${l}</span>
	                </div>
	                <div class="col-7 p-5">
	                    <h2>${fullName}</h2>
	                    <p class="profile-p profile-p-1">${headline}</p>
	                    <p class="profile-p profile-p-2">${city}, ${country}</p>
	                    <p class="contacts nav-links profile-p" data-bs-toggle="modal" data-bs-target="#contactsModal">Contact info</p>
	                </div>
	                <div class="col-2 align-self-center">
	                    <a href="profile" class="btn btn-primary">Edit Profile</a>
	                </div>
            	</div>
            </div>
            

            <div class="row" style="margin: 0px 0px 24px;">
                <div class="col-9">
                    <div class="mb-3 bottomOf-profile">
                        <h3>About</h3>
                        
                        <p>${about}</p>
                        <hr>
                        <div class="add-about addopt" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        	<i class="bi bi-plus-square"></i><p class="p-bottom"> Add about</p>
                        </div>
                        
                    </div>
                    <div class=" mb-3 bottomOf-profile " >
                        <h3>Education</h3>
                        
<%--                         <p>${educ}</p> --%>
                        
                        <c:forEach var="e" items="${ed}">
		                    <div class="d-flex align-items-center">
		                        <i class='bx bx-book fs-2'></i>
		                        <div class="p-3">
		                            <h4>${e.getEducationName()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
		                            <small>${e.getIntitutionName()}</small>
		                        </div>
		                    </div>
		                </c:forEach>
		                <hr>
                        <div class="add-educ addopt" data-bs-toggle="modal" data-bs-target="#educations">
                        	<i class="bi bi-plus-square"></i><p class="p-bottom"> Add education</p>
                        </div>
                                         
                    </div>
                    <div class="mb-3 bottomOf-profile  educ-last">
                        <h3>Experience</h3>
                        
                        <c:forEach var="e" items="${ex}">
		                    <div class="d-flex align-items-center">
		                        <i class='bx bx-map-pin fs-2'></i>
		                        <div class="p-3">
		                            <h4>${e.getPosition()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
		                            <small>${e.getCompany()}</small>
		                        </div>
		                    </div>
		                </c:forEach>
                        <hr>
                        <div class="add-exp addopt" data-bs-toggle="modal"
                                data-bs-target="#experiences">
                        	<i class="bi bi-plus-square" ></i><p class="p-bottom"> Add experience</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-3">
                	<div class="side bottomOf-profile">
                		 
                    
                        <h5 class="card-title" style="font-size: 18px;">People you may know</h5>
                        <ul class="friend-list">
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Zephaniah </h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>John Doe</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Hovo Anthelme</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Quinctus Ifor</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar5.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Magne Viraja</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>JB Keer</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Barbra Quintillus</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Perseus Sudarshan</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                            <li>
                                <div class="left">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
                                </div>
                                <div class="right">
                                    <h3>Kervin Curt</h3>
                                    <p>10 Friends</p>
                                </div>
                            </li>
                        </ul>

                	</div>
                </div>
                
            </div>

        </div>
        
        
        <jsp:include page="../footer.jsp"></jsp:include>
        
        
        <!-- Button trigger modal -->
		
		<!-- Modal -->
		<form action="about" method="post">
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">About</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <textarea class="form-control" name="about" id="about" placeholder="Type here"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form>
		
<!-- 		<form action="educ" method="post">
		<div class="modal fade" id="educModal" tabindex="-1" aria-labelledby="educModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Education</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <textarea class="form-control" name="educ" id="about" placeholder="Type here"></textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		</form> -->
		
		<div>
             <div class="d-flex">
<!--                  <h3>Education</h3>
                 <button type="button" class="btn btn-primary ms-auto" data-bs-toggle="modal"
                     data-bs-target="#educations">
                     Add Education
                 </button> -->
                 <form action="educ" method="post">
                 <div class="modal fade" id="educations" tabindex="-1" aria-labelledby="educationsLabel"
                     aria-hidden="true">
                     <div class="modal-dialog">
                         <div class="modal-content">
                             <div class="modal-header">
                                 <h1 class="modal-title fs-5" id="educationsLabel">Add Education</h1>
                                 <button type="button" class="btn-close" data-bs-dismiss="modal"
                                     aria-label="Close"></button>
                             </div>
                             <div class="modal-body">
                                 <div class="form-floating mb-3">
                                     <input type="text" class="form-control" id="intitutionName"
                                         name="intitutionName">
                                     <label for="intitutionName">Institution Name</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="date" class="form-control" id="startDateED"
                                         name="startDateED">
                                     <label for="startDateED">Start Date</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="date" class="form-control" id="endDateED" name="endDateED">
                                     <label for="endDateED">End Date</label>
                                 </div>
                                 <div class="form-floating mb-3">
                                     <input type="text" class="form-control" id="educationName"
                                         name="educationName">
                                     <label for="educationName">Education Name</label>
                                 </div>
                             </div>
                             <div class="modal-footer">
                                 <button type="button" class="btn btn-primary" data-bs-dismiss="modal"
                                     id="edBtn">Add</button>
                             </div>
                         </div>
                     </div>
                    
                 </div>
				</form>
             </div>
             
<%--              <div id="educationsMD"></div>
             <c:forEach var="e" items="${ed}">
                 <div class="d-flex align-items-center">
                     <i class='bx bx-map-pin fs-2'></i>
                     <div class="p-3">
                         <h4>${e.getEducationName()} (${e.getStartDate().split("-")[0]} - ${e.getEndDate().split("-")[0]})</h4>
                         <small>${e.getIntitutionName()}</small>
                     </div>
                 </div>
             </c:forEach>
         </div> --%>
<!--      </div>
     </div> -->
           
        <form action="exp" method="post">
        	<div class="modal fade" id="experiences" tabindex="-1" aria-labelledby="experiencesLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="experiencesLabel">Add Experience</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="position" name="position">
                                                <label for="position">Position</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="startDateEX"
                                                    name="startDateEX">
                                                <label for="startDateEX">Start Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="date" class="form-control" id="endDateEX" name="endDateEX">
                                                <label for="endDateEX">End Date</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="companyNameEX"
                                                    name="companyNameEX">
                                                <label for="companyNameEX">Company Name</label>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary" data-bs-dismiss="modal"
                                                id="exBtn">Add</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
    
        </form>
       
    <div class="modal fade" id="contactsModal" tabindex="-1" aria-labelledby="educModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Contact info</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="margin-left: 25px;">
		        <div>
		            <i class="bi bi-envelope-fill"></i> ${email}
		        </div>
		        <div>
		            <i class="bi bi-telephone-fill"></i> ${phone}
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
    
</body>
</html>