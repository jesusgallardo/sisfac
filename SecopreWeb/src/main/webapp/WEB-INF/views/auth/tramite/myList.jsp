	<%@ include file="/WEB-INF/views/auth/common/springTags.jsp"%>
			
			<div class="row" style="display: inline;">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE FORM PORTLET-->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-green-haze">
								<i class="icon-settings font-green-haze"></i>
								<span class="caption-subject bold uppercase">Estatus de sus Ordenes de Venta</span>
							</div>
							<div class="actions">
								<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
								
								<div class="col-md-6">
										<div class="btn-group">
											
											<input type="hidden" name="canCapture" id="canCaptureValue" value="${canUserCapture}">
											
											<c:if test="${canUserCapture == true}">
												<button id="canCaptureButton" class="btn green" onclick="sendRequestJQ('auth/tram/add','dashboard','initTramitePage()','GET');">
													<spring:message code="application.add"/> <i class="fa fa-plus"></i>
												</button>
											</c:if>
											
											<c:if test="${canUserCapture == false}">
												<a id="canCaptureButton" class="btn green canCaptureButton disabledWithPopup">
													<spring:message code="application.add"/> <i class="fa fa-plus"></i>
												</a>
												
												<!-- tooltip popup -->
												<div class="tooltip-popup">	
													<div class="qtip-titlebar">
										        		<div id="qtip-{id}-title" class="qtip-title">Captura No disponible</div>
										    		</div>
											    	<div id="qtip-{id}-content" class="qtip-content ui-widget-content" aria-atomic="true" style="background-color:white">
	       
														<table class="popupContainer">
															<tbody>
																<c:if test="${isValidDate == false}">
																	<tr> 
																		<td>
																		<a href="#" onclick="showDueDates();" >
																			Fecha de Captura no valida
																		</a>
																		</td>
																	</tr>
																</c:if>
																<c:if test="${hasUserRequestInProcess == true}">
																	<tr>
																		<td>
																			<a href="#" onclick="sendRequestJQ('auth/tram/mylist','dashboard','initMyTramiteListPage()','GET');" >
																			Cuenta con solicitudes activas en etapa de captura
																		</a>
																		</td>
																	</tr>
																</c:if>
															</tbody>
														</table>
													</div>
												</div>
												
											</c:if>
											
											
										</div>
									</div>
								
								
									<div class="col-md-6">
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button class="btn dropdown-toggle" data-toggle="dropdown"><spring:message code="application.tools"/><i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li>
													<a href="javascript:;" onclick="exportToExcel('#formalityList', initMyTramiteListPage);"><spring:message code="application.export.excel"/></a>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="row" style="margin-top:10px;">
									<div class="col-md-12">
										<div class="btn-group">
											<input type="text" id="formalityDateSearch" placeholder="Buscar..." class="form-control input-medium">
										</div>
									</div>
								</div>
							</div>
						<div>	
					
							<table class="table table-striped table-bordered table-hover" id="formalityList">
							<thead>
							<tr>
								<th style="visible:false;">id</th>
								<th>Orden</th>
								<th>Cliente</th>
								<th>Estado</th>
								<th>Importe</th>
								<th>Fecha Creaci�n</th>
								<th>Siguiente Etapa</th>
								<th>Opciones</th>
							</tr>
							</thead>
							<tbody>
								<c:forEach items="${inboxList}" var="inboxItem">
									<tr class="odd gradeX">
										<td style="visible:false;">${inboxItem.requestId}</td>
										<td>${inboxItem.folio}</td>
										<td>${inboxItem.justification}</td>
										<td>${inboxItem.districtDescription}</td>
										<td>${inboxItem.totalAmountStr}</td>
										<td>${inboxItem.creationDateStr}</td>
										
										<td>
										<a href="#" onclick="sendRequestJQ('${inboxItem.nextStageURL}','dashboard','${inboxItem.nextStageJSFunction}','GET');">
													${inboxItem.nextDescription}
												</a>
<%-- 											<c:if test="${inboxItem.requestFinished == true}"> --%>
<%-- 												<a href="#" onclick="sendRequestJQ('${inboxItem.nextStageURL}','dashboard','${inboxItem.nextStageJSFunction}','GET');"> --%>
<%-- 													${inboxItem.nextDescription} --%>
<!-- 												</a> -->
<%-- 											</c:if> --%>
<%-- 											<c:if test="${inboxItem.requestFinished == false}"> --%>
<%-- 												${inboxItem.nextDescription} --%>
<%-- 											</c:if> --%>
										</td>
										
										<td>
											
											<a href="javascript:;" class="btn btn-xs tooltip-control"><i class="fa fa-folder-open"></i></a>
											
											<!-- tooltip popup -->
											<div class="tooltip-popup">
											 	<div class="qtip-titlebar">
										        	<div id="qtip-{id}-title" class="qtip-title">Opciones</div>
										    	</div>
										    	
										    	<div id="qtip-{id}-content" class="qtip-content ui-widget-content" aria-atomic="true">
       
													<table class="popupContainer">
														<tbody>
																<tr>
																	<td>
																		<a href="#" onclick="showDataHistory('${inboxItem.requestId}')" >
																			Ver historia del Folio
																		</a>
																	</td>
																</tr>
															<c:if test="${inboxItem.isOperated == true && inboxItem.formalityId != 3}">
																<tr>
																	<td>
																		<a href="#" onclick="openResourceNative('wf/download/format/${inboxItem.requestId}','dashboard','()','GET');">
																			Descargar Formato
																		</a>
																	</td>
																</tr>
															</c:if>
															<c:if test="${inboxItem.hasDocument}">
																<tr>
																	<td>
																		<a href="#" onclick="openResourceNative('wf/download/${inboxItem.requestId}','dashboard','()','GET');">
																			Ver documento anexo
																		</a>
																	</td>
																</tr>
															</c:if>
															
														</tbody>
													</table>
												</div>
											</div>
										</td>
									</tr>							
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div>
					<!-- END SAMPLE FORM PORTLET-->
				</div>
			</div>
