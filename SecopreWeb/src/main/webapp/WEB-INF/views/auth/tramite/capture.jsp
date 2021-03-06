	<%@ include file="/WEB-INF/views/auth/common/springTags.jsp"%>
			
			<!-- INICIA DIV DE FORM DE ROLES -->			
			<div class="row" style="display: inline;">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE FORM PORTLET-->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-green-haze">
								<i class="icon-settings font-green-haze"></i>
								<span class="caption-subject bold uppercase">Captura de Detalle de Venta - | Venta ${folio}</span>
							</div>
							<div class="actions">
								<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
												
						<div class="portlet-body form">
							<!-- formulario -->	
							<div>
								<form:form cssClass="form-horizontal" method="POST" modelAttribute="requestForm" id="requestForm" 
								           action="auth/wf/capture/${requestForm.formalityCode}" novalidate="novalidate">
							
									<div class="form-body">
										<!-- Se incluyen los DIV de alertamiento en formularios -->
										<%@ include file="/WEB-INF/views/auth/common/alertForm.jsp"%>
										
										<!-- propiedades ocultas propias del folio -->
										<form:hidden path="requestId" />
										<form:hidden path="stageConfigId" />
										<form:hidden path="nextStageValueCode" id="nextStageValueCode" />
										<form:hidden path="districtId" id="districtId"/>
										<form:hidden path="formalityCode" id="formalityCode"/>
										<form:hidden path="formalityId" id="formalityId"/>
										
										<jsp:include page="/WEB-INF/views/auth/tramite/exception.jsp" flush="true"/>
										  
										<jsp:include page="/WEB-INF/views/auth/common/formality/${requestForm.formalityCode}.jsp" flush="true"/>
										  				
									</div>
								
									<!-- acciones -->
									<div class="form-actions margin-top-10">
										<div class="row">
											<div class="col-md-offset-2 col-md-10">
												<button type="button" class="btn default" onclick="sendRequestJQ('auth/tram/mylist','dashboard','noAction()','GET');"><spring:message code="application.back"/></button>
												<!-- <button type="button" class="btn default" id="partialSave">Guardado Parcial</button> -->
												<button type="button" class="btn green" id="saveAndContinue">Finalizar Venta</button>
											</div>
										</div>
									</div>
								
								</form:form>	
							</div>
										
						</div>
						
					</div>
					<!-- END SAMPLE FORM PORTLET-->
				</div>
			</div>
