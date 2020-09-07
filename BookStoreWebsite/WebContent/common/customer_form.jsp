
<table class="form">
	<tr>
		<td align="right">Email:</td>
		<td align="left"><input type="text" name="email" id="email"
			size="20" value="${customer.email}" /></td>
	</tr>
	<tr>
		<td align="right">Password:</td>
		<td align="left"><input type="password" name="password"
			id="password" size="20" value="${customer.password}" /></td>
	</tr>
	<tr>
		<td align="right">Confirm Password:</td>
		<td align="left"><input type="password" name="confirmPassword"
			id="confirmPassword" size="20" value="${customer.password}" /></td>
	</tr>

	<tr>
		<td align="right">First Name:</td>
		<td align="left"><input type="text" name="firstName"
			id="firstName" size="20" value="${customer.firstname}" /></td>
	</tr>
	<tr>
		<td align="right">Last Name:</td>
		<td align="left"><input type="text" name="lastName" id="lastName"
			size="20" value="${customer.lastname}" /></td>
	</tr>
	<tr>
		<td align="right">Address Line 01:</td>
		<td align="left"><input type="text" name="addressLine1"
			id="addressLine1" size="20" value="${customer.addressLine1}" /></td>
	</tr>
	<tr>
		<td align="right">Address Line 02:</td>
		<td align="left"><input type="text" name="addressLine2"
			id="addressLine2" size="20" value="${customer.addressLine2}" /></td>
	</tr>
	<tr>
		<td align="right">City:</td>
		<td align="left"><input type="text" name="city" id="city"
			size="20" value="${customer.city}" /></td>
	</tr>
	<tr>
		<td align="right">State:</td>
		<td align="left"><input type="text" name="state" id="state"
			size="20" value="${customer.state}" /></td>
	</tr>
	<tr>
		<td align="right">Country:</td>
		<td align="left"><select name="country" id="country"
			name="country">
				<c:forEach items="${mapCounties}" var="country">
					<option value="${country.value}"
						<c:if test='${customer.country eq country.value}'>selected='selected'</c:if>>${country.key}</option>
				</c:forEach>
		</select>
	</tr>
	<tr>
		<td align="right">Phone:</td>
		<td align="left"><input type="text" name="phone" id="phone"
			size="20" value="${customer.phone}" /></td>
	</tr>
	<tr>
		<td align="right">Zip Code:</td>
		<td align="left"><input type="text" name="zipCode" id="zipCode"
			size="20" value="${customer.zipcode}" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">Submit</button>
			<input type="button" value="Cancel" onclick="history.go(-1;)" />
		</td>
	</tr>


</table>