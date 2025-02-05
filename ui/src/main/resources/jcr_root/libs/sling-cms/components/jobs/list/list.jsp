<%-- /*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */ --%>
 <%@include file="/libs/sling-cms/global.jsp"%>
 <div class="reload-container" data-path="${resource.path}.html">
    <table class="table is-fullwidth is-striped">
        <thead>
            <tr>
                <th scope="col">
                    #
                </th>
                <th scope="col">
                    <fmt:message key="Job Name" />
                </th>
                <th scope="col">
                    <fmt:message key="Started" />
                </th>
                <th scope="col">
                    <fmt:message key="Finished" />
                </th>
                <th scope="col">
                    <fmt:message key="State" />
                </th>
                <th scope="col" class="is-sr-only">
                </th>
            </tr>
        </thead>
        <tbody>
            <sling:adaptTo var="jobManager" adaptable="${slingRequest}" adaptTo="org.apache.sling.cms.CMSJobManager" />
            <c:set var="count" value="1" />
            <c:forEach var="job" items="${jobManager.jobs}">
                
                <tr class="sortable__row">
                    <td class="Cell-Static" title="# ${status.index + 1}" data-sort-value="<fmt:formatNumber pattern="0000" value="${count}" />">
                        ${count}
                    </td>
                    <td>
                        <a href="/cms/jobs/view.html/${job.id}">
                            <fmt:message key="${job.properties._titleKey}" />
                        </a><br/>
                        <small>${job.topic}</small>
                    </td>
                    <td>
                        <fmt:formatDate value="${job.created.time}" type="both" dateStyle="long" timeStyle="long" />
                    </td>
                    <td>
                        <c:if test="${job.finishedDate != null}">
                            <fmt:formatDate value="${job.finishedDate.time}" type="both" dateStyle="long" timeStyle="long" />
                        </c:if>
                    </td>
                    <td>
                        <fmt:message key="${job.jobState}" var="stateMessage" />
                        <sling:encode value="${stateMessage}" mode="HTML" />
                    </td>
                    <td class="is-sr-only cell-actions">
                        <fmt:message key="Remove Job" var="removeJobMessage" />
                        <a class="button Fetch-Modal" data-title="${removeJobMessage}" data-path=".Main-Content form" href="/cms/jobs/delete.html/bin/cms/removejob?id=${job.id}" title="${removeJobMessage}">
                            <span class="jam jam-trash">
                            </span>
                        </a>
                    </td>
                </tr>
                
                <c:set var="count" value="${count + 1}" />
            </c:forEach>
        </tbody>
    </table>
</div>