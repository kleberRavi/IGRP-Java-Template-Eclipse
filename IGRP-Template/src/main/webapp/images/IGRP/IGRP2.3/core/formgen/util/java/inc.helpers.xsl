<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="blockly.element.set_visible">		
		<xsl:variable name="field" select="field[@name='set_visible']"/>		
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>			
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.setVisible(</xsl:text><xsl:value-of select="$value"/><xsl:text>);</xsl:text>				
	</xsl:template>	
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 	
	<xsl:template name="blockly.element.set_visible_row">		
		<xsl:variable name="field" select="field[@name='set_visible_row']"/>					
		<xsl:text>row.hiddenButton(view.</xsl:text><xsl:value-of select="$field"/><xsl:text>);</xsl:text>				
	</xsl:template>
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="blockly.element.set_readonly">		
		<xsl:variable name="field" select="field[@name='set_readonly']"/>		
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>			
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.propertie().add("readonly", "</xsl:text><xsl:value-of select="$value"/><xsl:text>");</xsl:text>				
	</xsl:template>	
	<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 	
	<xsl:template name="blockly.element.set_disabled">		
		<xsl:variable name="field" select="field[@name='set_disabled']"/>
		<xsl:variable name="value"  select="field[@name='tru_fal']"/>					
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.propertie().add("disabled", "</xsl:text><xsl:value-of select="$value"/><xsl:text>");</xsl:text>								
	</xsl:template> 
	<xsl:template name="blockly.element.set_label">	
		<xsl:variable name="field"  select="field[@name='set_label']"/>	
	  	<xsl:variable name="label">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='opcao_label']"/>				
			</xsl:call-template>			
		</xsl:variable>							
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.setLabel(</xsl:text><xsl:value-of select="$label"/><xsl:text>);</xsl:text>								
	</xsl:template> 
	<xsl:template name="blockly.element.set_title">	
		<xsl:variable name="field"  select="field[@name='set_title']"/>	
	  	<xsl:variable name="title">	   	
			<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='opcao_title']"/>				
			</xsl:call-template>			
		</xsl:variable>							
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:text>.setTitle(</xsl:text><xsl:value-of select="$title"/><xsl:text>);</xsl:text>								
	</xsl:template> 
	<xsl:template name="blockly.element.set_sepator">	
		<xsl:variable name="field"  select="field[@name='set_separ']"/>	
	  	<xsl:variable name="noadd">	   	
			<xsl:call-template name="utils.meaning">			
				<xsl:with-param name="key" select="field[@name='set_noadd']"/>				
			</xsl:call-template>			
		</xsl:variable>							
		<xsl:text>view.</xsl:text><xsl:value-of select="$field"/><xsl:value-of select="$noadd"/><xsl:text>;</xsl:text>								
	</xsl:template> 
	
	<xsl:template name="blockly.element.set_remote">	
		<xsl:variable name="action"  select="field[@name='name_action']"/>	
	  	<xsl:variable name="value">	   	
		<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value1']"/>				
			</xsl:call-template>			
		</xsl:variable>															
		<xsl:value-of select="$newlineTab1"/>
		<xsl:text>public Response action</xsl:text><xsl:value-of select="$action"/><xsl:text>() throws IllegalArgumentException{</xsl:text>
		<xsl:value-of select="$newlineTab2"/>
		<xsl:text>nosi.core.webapp.helpers.RemoteXML remoteXml = Core.remoteXml();</xsl:text>
		<xsl:value-of select="$newlineTab2"/>
		<xsl:value-of select="$value"/>
		<xsl:value-of select="$newlineTab2"/>
		<xsl:text>String xml = remoteXml.build();</xsl:text>
		<xsl:value-of select="$newlineTab2"/>
	    <xsl:text>this.format = Response.FORMAT_XML;</xsl:text>
	    <xsl:value-of select="$newlineTab2"/>
		<xsl:text>return this.renderView( xml );</xsl:text>
		<xsl:value-of select="$newlineTab1"/>		
		<xsl:text>}</xsl:text> 	
	</xsl:template>
	
	<xsl:template name="blockly.element.set_properties">	
		<xsl:variable name="prop">	   	
			<xsl:call-template name="utils.meaning">			
				<xsl:with-param name="key" select="field[@name='set_prop']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="name"  select="field[@name='name']"/>
		<xsl:variable name="message"  select="field[@name='messagedrop']"/>			
	  	<xsl:variable name="value">	   	
		<xsl:call-template name="blockly.getValue">			
				<xsl:with-param name="value" select="*[@name='value1']"/>				
			</xsl:call-template>			
		</xsl:variable>	
		<xsl:variable name="valuetype">		
			<xsl:choose>
				<xsl:when test="value/block/value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value/block/value/block/value/block/field,'::')"/>				
				</xsl:when>				
				<xsl:when test="value/block/value/block/field != ''">				
					<xsl:value-of select="substring-before(value/block/value/block/field,'::')"/>				
				</xsl:when>					
				<xsl:otherwise>				
					<xsl:value-of select="substring-before(value/block/field,'::')"/>				
				</xsl:otherwise>				
			</xsl:choose>		
		</xsl:variable>		
		<xsl:variable name="value_convert">	
			<xsl:call-template name="utils.edited">				
				<xsl:with-param name="value" select="$value"></xsl:with-param>							
				<xsl:with-param name="from" select="$valuetype"></xsl:with-param>				
				<xsl:with-param name="to" select="'String'"></xsl:with-param>							
			</xsl:call-template>					
		</xsl:variable>																
		<xsl:text>remoteXml</xsl:text><xsl:value-of select="$prop"/><xsl:text>("</xsl:text>
		<xsl:if test="$prop = '.addMessage'">
			<xsl:value-of select="$message"/>
		</xsl:if>
		<xsl:if test="$prop = '.addPropertie'">
			<xsl:value-of select="$name"/>
		</xsl:if>
		<xsl:text>", </xsl:text><xsl:value-of select="$value_convert"/><xsl:text>);</xsl:text> 	
	</xsl:template>	
			
</xsl:stylesheet>
		