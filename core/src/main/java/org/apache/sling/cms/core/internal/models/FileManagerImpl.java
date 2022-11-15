/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.sling.cms.core.internal.models;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.cms.CMSConstants;
import org.apache.sling.cms.CMSUtils;
import org.apache.sling.cms.File;
import org.apache.sling.cms.FileManager;
import org.apache.sling.models.annotations.Model;

/**
 * A model used to retrieve files.
 */
@Model(adaptables = Resource.class, adapters = FileManager.class)
public class FileManagerImpl implements FileManager {

    private final File file;

    public FileManagerImpl(Resource containingResource) {
        Resource fileResource = CMSUtils.findParentResourceofType(containingResource, CMSConstants.NT_FILE);
        if (fileResource != null) {
            file = fileResource.adaptTo(File.class);
        } else {
            file = null;
        }
    }

    @Override
    public File getFile() {
        return file;
    }
}
