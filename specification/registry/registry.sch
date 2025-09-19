<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
            queryBinding="xslt2">
    <!--
         Copyright (c) 2021-2025 The Khronos Group Inc.

         SPDX-License-Identifier: Apache-2.0
    -->

    <sch:pattern name="Vendor tag naming requirements">
        <sch:rule context="tags/tag">
            <!-- Our tooling treats a trailing X in a vendor tag as an experimental version, this will cause  -->
            <!-- problems if someone adds a vendor tag that ends in X. -->
            <!-- Please see gitlab merge request !2518 for more details. -->
            <sch:assert test="not(ends-with(@name, 'X'))">
                Vendor tag cannot end in "X" but got <sch:value-of select="@name" />
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Extension uniqueness and basic requirements">
        <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#extensions -->
        <sch:rule context="extensions/extension">
            <sch:assert test="@name">
                Extension <sch:value-of select="@number" /> must have a name
            </sch:assert>

            <sch:assert test="starts-with(@name, 'XR_')">
                Extension <sch:value-of select="@number" /> (<sch:value-of select="@name" />) must start with XR_
            </sch:assert>

            <sch:let name="vendor-tags" value="//tags/tag/@name"/>
            <sch:let name="extension-vendor-tag" value="@name/tokenize(., '_')[2]"/>
            <sch:let name="experimental-base-tag" value="replace($extension-vendor-tag, 'X[0-9]*$', '')"/>
            <sch:assert test="($extension-vendor-tag = $vendor-tags) or ($experimental-base-tag = $vendor-tags)">
                Extension <sch:value-of select="@number" /> (<sch:value-of select="@name" />) must start with XR_ and vendor tag (but we got '<sch:value-of select="$extension-vendor-tag" />').
            </sch:assert>

            <sch:let name="extname" value="@name" />
            <sch:assert test="not(preceding::extension[@name = $extname])">
                Extension <sch:value-of select="@number" />: duplicate name "<sch:value-of select="$extname"/>" (count = <sch:value-of select="count(//extensions/extension[@name = $extname])"/>)
            </sch:assert>

            <sch:let name="extnum" value="@number" />
            <sch:assert test="not(preceding::extension[@number = $extnum])">
                <sch:value-of select="$extname"/> extension: duplicate number "<sch:value-of select="$extnum"/>" (count = <sch:value-of select="count(//extensions/extension[@number = $extnum])"/>)
            </sch:assert>

            <sch:let name="specver_name" value="concat($extname, '_SPEC_VERSION')"/>
            <sch:assert test="descendant::enum[@name = $specver_name]">
                <sch:value-of select="$extname"/> extension: missing version enum with name "<sch:value-of select="$specver_name"/>".
            </sch:assert>

            <sch:let name="extname_value" value="concat('&quot;', $extname, '&quot;')"/>
            <sch:assert test="descendant::enum[@value = $extname_value]">
                <sch:value-of select="$extname"/> extension: missing name enum with value "<sch:value-of select="$extname_value"/>".
            </sch:assert>
            <sch:let name="extname_name" value="concat(upper-case($extname), '_EXTENSION_NAME')"/>
            <sch:assert test="descendant::enum[ $extname_name]" >
                <sch:value-of select="$extname"/> extension: missing name enum with name "<sch:value-of select="$extname_name"/>".
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Use of vendor tag in naming">
        <!-- An element can only match one rule per pattern (first matching rule is used) -->
        <sch:rule id="exclusions" context="extensions/extension/require/command[@name='xrGetAudioOutputDeviceGuidOculus' or @name='xrGetAudioInputDeviceGuidOculus']"/>
        <sch:rule context="extensions/extension/require/type[@name]">
            <sch:let name="extension-vendor-tag" value="tokenize(../../@name, '_')[2]"/>
            <sch:assert test="ends-with(@name, $extension-vendor-tag)">
                Type name <sch:value-of select="@name"/> should end with the author ID (<sch:value-of select="$extension-vendor-tag"/> in the extension name).
            </sch:assert>
        </sch:rule>

        <sch:rule context="extensions/extension/require/enum[position() &gt; 2 and @name]">
            <sch:let name="extension-vendor-tag" value="tokenize(../../@name, '_')[2]"/>
            <sch:let name="alias" value="./@alias"/>
            <sch:assert test="ends-with(@name, $extension-vendor-tag) or ends-with($alias, $extension-vendor-tag)">
                Enumerant name <sch:value-of select="@name"/> should end with the author ID (<sch:value-of select="$extension-vendor-tag"/> in the extension name).
            </sch:assert>
        </sch:rule>

        <sch:rule context="extensions/extension/require/command[@name]">
            <sch:let name="extension-vendor-tag" value="tokenize(../../@name, '_')[2]"/>
            <sch:assert test="ends-with(@name, $extension-vendor-tag)">
                Function name <sch:value-of select="@name"/> should end with the author ID (<sch:value-of select="$extension-vendor-tag"/> in the extension name).
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Extension basic requirements">
        <sch:rule context="extensions/extension[@name]">

            <sch:let name="extname" value="@name" />
            <sch:let name="specver_name" value="concat($extname, '_SPEC_VERSION')"/>
            <sch:let name="first_child_element" value="require/*[1]"/>
            <sch:let name="first_child_element_is_enum" value="require/*[1][name() = 'enum']"/>
            <sch:let name="first_child_element_named_spec_version" value="require/*[1][@name = $specver_name]"/>
            <sch:assert test="$first_child_element_is_enum and $first_child_element_named_spec_version">
                <sch:value-of select="$extname"/> extension: First child element of 'require' should be a version enum named "<sch:value-of select="$specver_name"/>".
            </sch:assert>
            <sch:let name="second_child_element" value="require/*[2]"/>
            <sch:let name="extname_value" value="concat('&quot;', $extname, '&quot;')"/>
            <sch:let name="second_child_element_is_enum" value="require/*[2][name() = 'enum']"/>
            <sch:let name="first_child_element_named_ext_name" value="require/*[1][@name = $specver_name]"/>

            <sch:assert test="$second_child_element[name() = 'enum']">
                <sch:value-of select="$extname"/> extension: Second child element of 'require' should be a string enum (define) for the extension name.
            </sch:assert>
            <sch:assert test="$second_child_element[@value = $extname_value]">
                <sch:value-of select="$extname"/> extension: Second child element of 'require' should be a name enum with value "<sch:value-of select="$extname_value"/>"  instead of "<sch:value-of select="$second_child_element/attribute::value"/>".
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Active extension basic requirements">
        <!-- capitalization for "reserved" extension number name enums is often wrong, so just going to exclude those from this assert. -->
        <sch:rule context="extensions/extension[@supported = 'openxr']">
            <sch:let name="extname" value="@name" />
            <sch:let name="extname_name" value="concat(upper-case($extname), '_EXTENSION_NAME')"/>
            <sch:let name="second_child_element" value="require/*[2]"/>
            <sch:assert test="$second_child_element[attribute::name = $extname_name]" >
                <sch:value-of select="$extname"/> extension: Second child element of enabled extension's 'require' should be a name enum with name "<sch:value-of select="$extname_name"/>" instead of "<sch:value-of select="$second_child_element/attribute::name"/>"
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="KHR must be ratified">
        <!-- Verify that any KHR extensions have the ratified="openxr" attribute. -->
        <sch:rule context="extensions/extension[@supported = 'openxr' and starts-with(@name, 'XR_KHR_')]">
            <sch:let name="is_ratified" value="@ratified = 'openxr'"/>
            <sch:assert test="$is_ratified" >
                <sch:value-of select="@name"/> KHR extension must be ratified.
            </sch:assert>
        </sch:rule>
    </sch:pattern>


    <sch:pattern name="Extensions extend valid enums">
        <sch:rule context="extensions/extension/require/enum[@extends]">
            <sch:let name="attr_val" value="current()/@extends"/>
            <sch:assert test="/registry/enums[@name=$attr_val]">
                <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/@name"/> cannot extend enum <sch:value-of select="$attr_val"/> which does not exist.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Dependency features/extensions must exist -->
    <sch:pattern abstract="true" id="depends_base">
        <!-- Context is the tag with the depends= attribute -->
        <sch:rule context="$contextElement">
            <sch:let name="deps" value="tokenize(current()/@depends, '[,+()]\s*')"/>
            <sch:let name="feature_names" value="//feature/@name"/>
            <sch:let name="extensions" value="//extensions/extension/@name"/>

            <sch:assert test="every $id in $deps satisfies $id = $feature_names or $id = $extensions">
                <sch:value-of select="$queryType"/>: <sch:value-of select="$queryDesc"/> mentions an unknown feature in a dependency: <sch:value-of select="$deps"/>
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern is-a="depends_base">
        <sch:param name="contextElement" value="feature/require[@depends]"/>
        <sch:param name="queryType" value="current()/../@name"/>
        <sch:param name="queryDesc" value="'require within feature'"/>
    </sch:pattern>

    <sch:pattern is-a="depends_base">
        <sch:param name="contextElement" value="extensions/extension[@depends]"/>
        <sch:param name="queryType" value="current()/@name"/>
        <sch:param name="queryDesc" value="'extension'"/>
    </sch:pattern>

    <sch:pattern is-a="depends_base">
        <sch:param name="contextElement" value="extensions/extension/require[@depends]"/>
        <sch:param name="queryType" value="current()/../@name"/>
        <sch:param name="queryDesc" value="'require within extension'"/>
    </sch:pattern>

    <sch:pattern abstract="true" id="defined_types_base">
        <!-- Context is the function, etc  -->
        <sch:rule context="$entityElement">
            <sch:assert test="//types/type[@name = $queryType] or //types/type/name/text() = $queryType">
                <sch:value-of select="$entityElement"/>: <sch:value-of select="$queryDesc"/> uses an unknown type: <sch:value-of select="$queryType"/>
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Function return types must exist -->
    <sch:pattern is-a="defined_types_base">
        <sch:param name="entityElement" value="commands/command[param]"/>
        <sch:param name="queryType" value="current()/proto/type/text()"/>
        <sch:param name="queryDesc" value="'Return value'"/>
    </sch:pattern>

    <!-- bitvalues types must exist -->
    <sch:pattern is-a="defined_types_base">
        <sch:param name="entityElement" value="types/type[@bitvalues]"/>
        <sch:param name="queryType" value="current()/@bitvalues"/>
        <sch:param name="queryDesc" value="'bitvalues attribute'"/>
    </sch:pattern>


    <!-- Member/parameter types must exist -->
    <sch:pattern abstract="true" id="defined_types">
        <!-- Context is the struct member or function parameter with a type -->
        <sch:rule context="$contextElement">
            <sch:let name="struct_name" value="current()/../@name"/>
            <sch:let name="mp_name" value="current()/name/text()"/>
            <sch:let name="mp_type" value="current()/type/text()"/>
            <sch:assert test="//types/type[@name = $mp_type] or //types/type/name/text() = $mp_type">
                <sch:value-of select="$struct_or_func_name"/>: Parameter/field '<sch:value-of select="$mp_name"/>' uses an unknown type: <sch:value-of select="$mp_type"/>
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Parameter types must exist -->
    <sch:pattern is-a="defined_types">
        <sch:param name="contextElement" value="commands/command/param"/>
        <sch:param name="struct_or_func_name" value="current()/../proto/name/text()"/>
    </sch:pattern>

    <!-- Member types must exist -->
    <sch:pattern is-a="defined_types">
        <sch:param name="contextElement" value="types/type[@category = ('struct', 'union')]/member"/>
        <sch:param name="struct_or_func_name" value="current()/@name"/>
    </sch:pattern>

    <!-- look for structs with structextends -->
    <sch:pattern name="structextends">
        <sch:rule context="types/type[@structextends]">
            <sch:let name="structextends_names" value="current()/@structextends/tokenize(., ',')"/>
            <!-- the thing you extend must exist -->
            <sch:assert test="every $struct in $structextends_names satisfies /registry/types/type[@name=$struct]">
                <sch:value-of select="current()/@name"/> structextends: names <sch:value-of select="string-join($structextends_names, ', ')"/> but one of those types does not exist.
            </sch:assert>

            <sch:let name="structextends" value="/registry/types/type[@name=$structextends_names]"/>
            <!-- TODO this is an exception because we want to make sure the location array is populated, but the rest is returnedonly. -->
            <sch:let name="is_returnedonly_exception" value="$structextends/@name = ('XrHandJointLocationsEXT')"/>
            <!-- you probably want to agree on presence/absence of "returnedonly" with the struct you extend -->
            <sch:assert test="every $extend_type in $structextends satisfies count($extend_type/@returnedonly) = count(current()/@returnedonly) or $is_returnedonly_exception" role="warning">
                <sch:value-of select="current()/@name"/> structextends warning: This struct and one of the structs it extends, <sch:value-of select="$structextends_names"/>, do not agree on whether they are "returnedonly".
                    <sch:value-of select="current()/@name"/> says returnedonly=<sch:value-of select="count(current()/@returnedonly)"/>
                    This is not an always an error, but usually is.
            </sch:assert>
            <!-- can't extend a struct without a next pointer -->
            <sch:assert test="every $extend_type in $structextends satisfies $extend_type/member/name[text()='next']">
                <sch:value-of select="current()/@name"/> structextends: cannot extend <sch:value-of select="$structextends_names"/>, as one of these types does not have a next pointer.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- look for structs with parentstruct -->
    <sch:pattern name="parentstruct">
        <sch:rule context="types/type[@parentstruct]">
            <sch:let name="parentstruct_name" value="current()/@parentstruct"/>
            <!-- the parent struct must exist -->
            <sch:assert test="/registry/types/type[@name=$parentstruct_name]">
                <sch:value-of select="current()/@name"/> parentstruct: names <sch:value-of select="$parentstruct_name"/> as parent struct but that type does not exist.  Did you specify the wrong parent type name?
            </sch:assert>

            <sch:assert test="contains($parentstruct_name, 'BaseHeader')">
                <sch:value-of select="current()/@name"/> parentstruct: names <sch:value-of select="$parentstruct_name"/> as parent struct but that type name does not include "BaseHeader".  Did you specify the wrong parent type name?
            </sch:assert>

            <sch:let name="parentstruct" value="/registry/types/type[@name=$parentstruct_name]"/>

            <!-- parentstruct must have type and next -->
            <sch:assert test="$parentstruct/member/name[text()='type']">
                <sch:value-of select="current()/@name"/> parentstruct: names <sch:value-of select="$parentstruct_name"/> as parent, but <sch:value-of select="$parentstruct_name"/> cannot be a parent struct type, as it has no type field. Did you specify the wrong parent type name?
            </sch:assert>
            <sch:assert test="$parentstruct/member/name[text()='next']">
                <sch:value-of select="current()/@name"/> parentstruct: names <sch:value-of select="$parentstruct_name"/> as parent, but <sch:value-of select="$parentstruct_name"/> cannot be a parent struct type, as it has no next pointer. Did you specify the wrong parent type name?
            </sch:assert>

            <!-- parentstruct must not have a value for its type -->
            <sch:assert test="count($parentstruct/member/name[text()='next']/@value) = 0">
                <sch:value-of select="$parentstruct_name"/>: cannot be a parent struct type, as it has a value attribute for its type field. (indicated as the parent of <sch:value-of select="current()/@name"/>)
            </sch:assert>

            <!-- you must agree on presence/absence of "returnedonly" with the parent struct -->
            <!-- TODO fix exceptions -->
            <sch:let name="is_exception" value="current()/@name = ('XrEventDataPerfSettingsEXT', 'XrEventDataMainSessionVisibilityChangedEXTX', 'XrEventDataViveTrackerConnectedHTCX')"/>
            <sch:assert test="count($parentstruct/@returnedonly) = count(current()/@returnedonly) or $is_exception">
                <sch:value-of select="current()/@name"/>: parent returnedonly mismatch: The struct and its parent struct, <sch:value-of select="$parentstruct_name"/>, do not agree on whether they are "returnedonly".
                    <sch:value-of select="current()/@name"/> says <sch:value-of select="count(current()/@returnedonly)"/>,
                    but <sch:value-of select="$parentstruct_name"/> says <sch:value-of select="count($parentstruct/@returnedonly)"/>
                    Either both should have them, or neither should.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Make sure structs with a parent struct share their initial members. -->
    <sch:pattern>
        <sch:rule context="types/type[@parentstruct]/member">

            <sch:let name="struct_name" value="current()/ancestor::type/@name"/>
            <sch:let name="parentstruct_name" value="current()/ancestor::type/@parentstruct"/>
            <sch:let name="parentstruct" value="/registry/types/type[@name=$parentstruct_name]"/>
            <sch:let name="parent_member_count" value="count($parentstruct/member)" />
            <sch:let name="field_num" value="count(current()/preceding-sibling::member) + 1" />
            <sch:let name="field_name" value="current()/name/text()"/>
            <sch:let name="should_be_shared_with_parent" value="not($field_num > $parent_member_count)"/>
            <sch:let name="matching_parent_field" value="$parentstruct/member[position() = $field_num]" />
            <sch:let name="matching_parent_field_name" value="$matching_parent_field/name/text()" />
            <sch:let name="is_exception" value="$struct_name = 'XrCompositionLayerPassthroughFB' and $field_name = 'flags'"/>

            <sch:assert test="$field_name = $matching_parent_field_name or not($should_be_shared_with_parent) or $is_exception">
                <sch:value-of select="$struct_name"/>: field <sch:value-of select="$field_name"/> (field number <sch:value-of select="$field_num"/>) should have matching name to the corresponding parent field, but does not: <sch:value-of select="$matching_parent_field_name"/>. Please make them match.
            </sch:assert>

            <sch:let name="field_text" value="normalize-space(string-join(current()/text(), ' '))"/>
            <sch:let name="matching_parent_field_text" value="normalize-space(string-join($matching_parent_field/text(), ' '))" />
            <sch:assert test="$field_text = $matching_parent_field_text or not($should_be_shared_with_parent)">
                <sch:value-of select="$struct_name"/>: field <sch:value-of select="$field_name"/> (field number <sch:value-of select="$field_num"/>) should have matching text contents (type, modifiers, and name) to the corresponding parent field (<sch:value-of select="$matching_parent_field_name"/>) after normalizing spaces, but it does not: "<sch:value-of select="$field_text"/>" != "<sch:value-of select="$matching_parent_field_text"/>". Please make them match.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- some naming convention enforcement -->
    <sch:pattern name="common name types">
        <!-- Xr...Info types-->
        <sch:rule context="types/type[@category = 'struct' and ./member/name/text() = 'next' and contains(@name, 'Info') and starts-with(@name, 'Xr')]">
            <sch:assert test="count(current()/@returnedonly) = 0">
                <sch:value-of select="current()/@name"/>: Named as Xr...Info (an input struct), but it's marked as returnedonly (an output). Rename if this is an output struct, remove returnedonly if it is an input struct.
            </sch:assert>

            <!-- TODO fix the exceptions we can -->
            <sch:let name="is_exception" value="current()/@name = ('XrApiLayerNextInfo', 'XrFoveationProfileCreateInfoFB', 'XrSwapchainCreateInfoFoveationFB', 'XrFoveationLevelProfileCreateInfoFB', 'XrRenderModelPathInfoFB','XrRenderModelLoadInfoFB','XrKeyboardSpaceCreateInfoFB')"/>
            <sch:assert test="current()/member[name/text() = 'next']/text() = 'const ' or $is_exception">
                <sch:value-of select="current()/@name"/>: All Xr...Info are input structs, so next must be pointer to const. (If you do not want this to be an input struct, try using Xr...State for outputs that change during runtime, or Xr...Properties for outputs that do not)
            </sch:assert>
        </sch:rule>

        <!-- Xr...State types-->
        <sch:rule context="types/type[@category = 'struct' and ./member/name/text() = 'next' and contains(@name, 'State') and starts-with(@name, 'Xr')]">
            <sch:assert test="current()/member[name/text() = 'next']/text() != 'const '">
                <sch:value-of select="current()/@name"/>: All Xr...State are output structs, so next must be pointer to non-const. Fix the const-ness, or rename if this is not supposed to be an output struct.
            </sch:assert>
        </sch:rule>

        <!-- Xr...Properties types-->
        <sch:rule context="types/type[@category = 'struct' and ./member/name/text() = 'next' and contains(@name, 'Properties') and starts-with(@name, 'Xr')]">
            <sch:assert test="current()/member[name/text() = 'next']/text() != 'const '">
                <sch:value-of select="current()/@name"/>: All Xr....Properties are (at least) output structs, so next must be pointer to non-const. Fix the const-ness, or rename if this is not supposed to be an output struct.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Naming of SystemProperties types-->
    <sch:pattern>
        <sch:rule context="types/type[@category = 'struct' and @structextends = 'XrSystemProperties']">
            <sch:let name="is_exception" value="current()/@name = 'XrRenderModelCapabilitiesRequestFB'" />
            <sch:assert test="starts-with(@name, 'XrSystem') or $is_exception">
                <sch:value-of select="current()/@name"/>: Extends XrSystemProperties, but the name doesn't start with XrSystem. Should be named XrSystem...PropertiesAUTHOR.
            </sch:assert>
            <sch:assert test="contains(@name, 'Properties') or $is_exception">
                <sch:value-of select="current()/@name"/>: Extends XrSystemProperties, but the name doesn't include Properties. Should be named XrSystem...PropertiesAUTHOR.
            </sch:assert>
        </sch:rule>

        <sch:rule context="types/type[@category = 'struct' and starts-with(@name, 'XrSystem') and contains(@name, 'Properties')]">
            <sch:assert test="current()/@structextends = 'XrSystemProperties' or current()/@name = ('XrSystemProperties', 'XrSystemGraphicsProperties', 'XrSystemTrackingProperties')">
                <sch:value-of select="current()/@name"/>: Looks like XrSystem...PropertiesAUTHOR, but missing structextends=XrSystemProperties: Add that, or rename.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Naming of event data types-->
    <sch:pattern>
        <sch:rule context="types/type[@category = 'struct' and @structextends = 'XrEventDataBaseHeader']">
            <sch:assert test="starts-with(@name, 'XrEventData')">
                <sch:value-of select="current()/@name"/>: Extends XrEventDataBaseHeader, but the name doesn't start with XrEventData. Should be named XrEventData...AUTHOR.
            </sch:assert>
        </sch:rule>

        <sch:rule context="types/type[@category = 'struct' and starts-with(@name, 'XrEventData')]">
            <sch:assert test="current()/@parentstruct = 'XrEventDataBaseHeader' or current()/@name = ('XrEventDataBaseHeader', 'XrEventDataBuffer')">
                <sch:value-of select="current()/@name"/>: Looks like XrEventData...AUTHOR, but missing parentstruct=XrEventDataBaseHeader: Add that, or rename.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- XR_EXT_future struct naming -->
    <sch:pattern>
        <sch:rule context="types/type[@category = 'struct' and @parentstruct = 'XrFutureCompletionBaseHeaderEXT']">
            <sch:assert test="matches(current()/@name, 'Completion([A-Z]+(X[1-9])?)?$')">
                <sch:value-of select="current()/@name"/> name should contain Completion at the end because it is a XrFutureEXT Completion, for example XrFooCreateCompletionEXT.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- XR_EXT_future command naming -->
    <sch:pattern>
        <sch:rule context="command[param/type/text()='XrFutureEXT']">
            <sch:let name="command_name" value="current()/proto/name/text()"/>
            <sch:let name="is_exception" value="$command_name = ('xrPollFutureEXT', 'xrCancelFutureEXT')"/>

            <sch:assert test="matches($command_name, '^xr([A-Z][a-z]+)+(Async|Complete)([A-Z]+(X[1-9])?)?$') or $is_exception">
                <sch:value-of select="$command_name"/> has a XrFutureEXT parameter. Its name must contain Async or Complete at the end, for example xrCreateFooAsyncEXT.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- XR_EXT_future Async command parameter requirements -->
    <sch:pattern>
        <sch:rule context="command[param/type/text()='XrFutureEXT' and contains(proto/name/text(),'Async')]">
            <sch:let name="command_name" value="current()/proto/name/text()"/>
            <sch:let name="is_exception" value="$command_name = ('xrPollFutureEXT', 'xrCancelFutureEXT')"/>
            <sch:let name="last_param" value="current()/param[last()]/type/text()"/>
            <sch:let name="last_param_name" value="current()/param[last()]/name/text()"/>

            <sch:assert test="$last_param = 'XrFutureEXT' or $is_exception">
                <sch:value-of select="$command_name"/>: XrFutureEXT must be the last parameter.
            </sch:assert>

            <sch:assert test="$last_param_name = 'future' or $is_exception">
                <sch:value-of select="$command_name"/>: The XrFutureEXT parameter must be named 'future' not '<sch:value-of select="$last_param_name"/>'.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- XR_EXT_future Complete command parameter requirements -->
    <sch:pattern>
        <sch:rule context="command[param/type/text()='XrFutureEXT' and contains(proto/name/text(),'Complete')]">
            <sch:let name="command_name" value="current()/proto/name/text()"/>
            <sch:let name="is_exception" value="$command_name = ('xrPollFutureEXT', 'xrCancelFutureEXT')"/>
            <sch:let name="one_to_last_param" value="current()/param[last()-1]/type/text()"/>
            <sch:let name="one_to_last_param_name" value="current()/param[last()-1]/name/text()"/>
            <sch:let name="last_param" value="current()/param[last()]/type/text()"/>
            <sch:let name="last_param_name" value="current()/param[last()]/name/text()"/>
            <sch:let name="last_param_parent_type" value="//types/type[@name = $last_param]/@parentstruct"/>
            <sch:let name="errorcodes" value="current()/@errorcodes"/>

            <sch:assert test="$one_to_last_param = 'XrFutureEXT' or $is_exception">
                <sch:value-of select="$command_name"/> XrFutureEXT must be the second to last parameter.
            </sch:assert>

            <sch:assert test="$one_to_last_param_name = 'future' or $is_exception">
                <sch:value-of select="$command_name"/>: The XrFutureEXT parameter must be named 'future' not '<sch:value-of select="$one_to_last_param_name"/>'.
            </sch:assert>

            <sch:assert test="matches($last_param, 'Completion([A-Z]+(X[1-9])?)?$') or $is_exception">
                <sch:value-of select="$command_name"/>'s last parameter type name must end with 'Completion' or 'CompletionVENDOR', currently it is <sch:value-of select="$last_param"/>
            </sch:assert>

            <sch:assert test="$last_param_parent_type = 'XrFutureCompletionBaseHeaderEXT' or $is_exception">
                <sch:value-of select="$command_name"/>'s last parameter (<sch:value-of select="$last_param"/>) must have its parentstruct set to XrFutureCompletionBaseHeaderEXT, current value = <sch:value-of select="$last_param_parent_type"/>
            </sch:assert>

            <sch:assert test="$last_param_name = 'completion' or $is_exception">
                <sch:value-of select="$command_name"/>'s last parameter (<sch:value-of select="$last_param"/>) must be named 'completion' not '<sch:value-of select="$last_param_name"/>'.
            </sch:assert>

            <sch:assert test="contains($errorcodes, 'XR_ERROR_FUTURE_PENDING_EXT') or $is_exception">
                <sch:value-of select="$command_name"/>'s errorcodes must contain XR_ERROR_FUTURE_PENDING_EXT.
            </sch:assert>

            <sch:assert test="contains($errorcodes, 'XR_ERROR_FUTURE_INVALID_EXT') or $is_exception">
                <sch:value-of select="$command_name"/>'s errorcodes must contain XR_ERROR_FUTURE_INVALID_EXT.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <!-- Things with a parent struct -->
        <sch:rule context="types/type[@parentstruct]">
            <sch:let name="parentstruct_name" value="current()/@parentstruct" />
            <sch:let name="is_spacefilterinfo" value="$parentstruct_name = 'XrSpaceFilterInfoBaseHeaderFB'"/>
            <sch:let name="is_future_completion" value="$parentstruct_name = 'XrFutureCompletionBaseHeaderEXT'"/>
            <sch:let name="expected_prefix" value="if ($is_spacefilterinfo) then 'XrSpace' else substring-before($parentstruct_name, 'BaseHeader')"/>

            <!-- TODO fix exception with alias? -->
            <sch:let name="is_exception" value="current()/@name = ('XrInteractionProfileDpadBindingEXT', 'XrInteractionProfileAnalogThresholdVALVE')"/>
            <sch:assert test="starts-with(current()/@name, $expected_prefix) or $is_exception or $is_future_completion">
                <sch:value-of select="current()/@name"/>: Name should start with <sch:value-of select="$expected_prefix" /> because its parent struct type is <sch:value-of select="current()/@parentstruct" />.
            </sch:assert>

            <!-- Keep exceptions consistent -->
            <sch:assert test="if ($is_spacefilterinfo) then contains(current()/@name, 'FilterInfo') else true()">
                <sch:value-of select="current()/@name"/>: Name should be like XrSpace...FilterInfo... to match the pattern of existing structures.
            </sch:assert>

            <sch:assert test="if ($is_future_completion) then contains(current()/@name, 'Completion') else true()">
                <sch:value-of select="current()/@name"/>: Completion structs should be on the form Xr...Completion[EXT|KHR|VENDOR].
            </sch:assert>
        </sch:rule>

        <!-- handle creation with parents -->
        <sch:rule context="//commands/command[starts-with(proto/name/text(), 'xrCreate')][//types/type[@parent and @category = 'handle']/name/text() = ./param[last()]/type/text()]">

            <!-- TODO fix these exceptions at least for more-standard versions of the functionality -->
            <sch:let name="is_exception" value="current()/proto/name/text() = ('xrCreateHandMeshSpaceMSFT', 'xrCreateFacialTrackerHTC', 'xrCreatePersistedAnchorSpaceANDROID')" />
            <sch:let name="handle_name" value="current()/param[last()]/type/text()"/>
            <sch:let name="handle_type_node" value="//types/type[@parent and @category = 'handle'][name/text() = $handle_name]"/>
            <sch:let name="parent_handle" value="$handle_type_node/@parent"/>
            <sch:assert test="current()/param[1]/type/text() = $handle_type_node/@parent or $is_exception">
                <sch:value-of select="proto/name/text()"/>: Creating handle type <sch:value-of select="$handle_name"/> which has parent type <sch:value-of select="$parent_handle"/> but that is not the first parameter type: <sch:value-of select="current()/param[1]/type/text()"/> is. If you need a second handle in addition to the parent to create your new handle, pass the second handle in <sch:value-of select="current()/param[2]/type/text()"/>.
            </sch:assert>
        </sch:rule>

        <!-- xrCreate... commands -->
        <sch:rule context="commands/command[starts-with(proto/name/text(), 'xrCreate')]">
            <sch:let name="command_name" value="current()/proto/name/text()"/>
            <sch:let name="is_exception" value="$command_name = ('xrCreateSwapchainAndroidSurfaceKHR', 'xrCreateVulkanInstanceKHR', 'xrCreateVulkanDeviceKHR')"/>
            <sch:let name="param_count" value="count(current()/param)"/>
            <sch:assert test="$param_count = 2 or $param_count = 3 or $is_exception">
                <sch:value-of select="$command_name"/>: A "Create" function should have 2 (for XrInstance) or 3 parameters
            </sch:assert>

            <sch:let name="expected_handle_type" value="replace($command_name, 'xrCreate', 'Xr')"/>
            <sch:let name="handle_type_name" value="current()/param[last()]/type/text()"/>
            <!-- TODO finish this -->
            <!--
            <sch:assert test="$expected_handle_type = $handle_type_name or ($handle_type_name = 'XrSpace' and contains($expected_handle_type, 'Space')) or $is_exception">
                <sch:value-of select="$command_name"/>: Based on the name, we expected it would create a handle of type <sch:value-of select="$expected_handle_type"/>, but instead it appears to create <sch:value-of select="$handle_type_name"/>
            </sch:assert>
            -->
        </sch:rule>

        <!-- xrDestroy... commands -->
        <sch:rule context="commands/command[starts-with(proto/name/text(), 'xrDestroy')]">
            <sch:let name="command_name" value="current()/proto/name/text()"/>
            <sch:assert test="count(current()/param) = 1">
                <sch:value-of select="$command_name"/>: A "Destroy" function should not have more than one parameter
            </sch:assert>
            <!-- TODO remove the exception when OK to bump versions. -->
            <sch:assert test="current()/param/@externsync = 'true_with_children' or $command_name = 'xrDestroyDebugUtilsMessengerEXT'">
                <sch:value-of select="$command_name"/>: A "Destroy" function's parameter should have the attribute externsync="true_with_children"
            </sch:assert>

            <sch:let name="expected_handle_type" value="replace($command_name, 'xrDestroy', 'Xr')"/>
            <sch:assert test="$expected_handle_type = current()/param/type/text()">
                <sch:value-of select="$command_name"/>: Based on the name, we expected it would destroy a handle of type <sch:value-of select="$expected_handle_type"/>, but instead it destroys <sch:value-of select="current()/param/type/text()"/>
            </sch:assert>

        </sch:rule>
    </sch:pattern>

    <!-- Sizes -->
    <sch:pattern abstract="true" id="len_member">
        <!-- Context is the struct member whose name is size-related -->
        <sch:rule context="$contextElement">
            <sch:let name="struct_name" value="current()/../@name"/>
            <sch:let name="member_name" value="current()/name/text()"/>

            <sch:let name="not_size" value="$member_name = ('structSize', 'counterUnit', 'counterFlags') or $struct_name = ('XrSystemMarkerTrackingPropertiesANDROID', 'XrTrackableMarkerDatabaseEntryANDROID')"/>
            <sch:assert test="current()/type/text() = 'uint32_t' or $not_size">
                <sch:value-of select="$struct_name"/> member <sch:value-of select="$member_name"/> is named suggesting it is a size/length, but it is not uint32_t, the required size type.
            </sch:assert>

            <!-- these are fine, just not actually array sizes. Prefer renaming if possible before extending this condition. -->
            <sch:let name="not_array_size" value="$not_size
                                                  or contains($member_name, 'max')
                                                  or contains($member_name, 'recommended')
                                                  or $member_name = 'skeletonChangedCount'
                                                  or $struct_name = (
                                                    'XrSwapchainCreateInfo',
                                                    'XrSpaceQueryInfoFB',
                                                    'XrEventDataEventsLost',
                                                    'XrPlaneDetectorLocationEXT',
                                                    'XrRenderModelPropertiesEXT',
                                                    'XrSystemMarkerTrackingPropertiesANDROID',
                                                    'XrTrackableMarkerDatabaseEntryANDROID')"/>
            <!-- TODO these are registry errors left in place for now, fix them-->
            <sch:let name="is_exception" value="$struct_name = ('XrTriangleMeshCreateInfoFB', 'XrFacialExpressionsHTC')"/>

            <sch:let name="sized_members" value="current()/../member[some $len in tokenize(@len, ',') satisfies $len = $member_name]"/>
            <sch:assert test="$sized_members or $not_array_size or $is_exception">
                <sch:value-of select="$struct_name"/> member <sch:value-of select="$member_name"/> is named suggesting it is a count/size, but no other members mention it in their 'len' attribute. Make sure each array/pointer has a specified len, or consider including "max" or "recommended" in the member name if there is no array for this parameter.
            </sch:assert>
            <!-- TODO rpavlik This feels more consistent to me, but failure to follow this rule doesn't confuse the generation scripts.
            <sch:assert test="if (current()/@optional) then
                                every $sized_member in $sized_members satisfies ($sized_member/@optional or $is_exception)
                              else
                                true()">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This size member is optional, but at least one of the members it bounds is not optional: <sch:value-of select="$sized_members" />
            </sch:assert>
            -->
            <sch:assert test="if (not(current()/@optional)) then
                                every $sized_member in $sized_members satisfies (count($sized_member/@optional) = 0 or $is_exception)
                              else
                                true()">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This count member is not optional, but at least one of the members with length bound by it is marked as optional: <sch:value-of select="$sized_members" />
            </sch:assert>

            <!-- Count element comes before the array(s) it affects, with no other elements in between. -->
            <sch:let name="len_member_pos" value="count(preceding-sibling::member)" />
            <sch:let name="array_member_pos" value="count($sized_members/preceding-sibling::member)" />
            <sch:assert test="(every $array_pos in $array_member_pos satisfies ($array_member_pos > $len_member_pos)) or not($sized_members)">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This count member is field <sch:value-of select="$len_member_pos"/>, but at least one of the members with length bound by it appears earlier in the structure: positions are <sch:value-of select="$array_member_pos" /> for members <sch:value-of select="$sized_members/name/text()" /> respectively. Make sure the count precedes its arrays.
            </sch:assert>

            <sch:let name="arrays_start_right_after_count" value="min($array_member_pos) = $len_member_pos + 1" />
            <sch:assert test="$arrays_start_right_after_count or not($sized_members) or contains($member_name, 'CapacityInput')">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This count member is field <sch:value-of select="$len_member_pos"/>, but field <sch:value-of select="$len_member_pos + 1"/> is not an array bounded by it: All arrays bounded by <sch:value-of select="$member_name"/> should follow it immediately: <sch:value-of select="$sized_members/name/text()"/>. Either re-arrange fields to get the order right, or add the missing len attribute(s).
            </sch:assert>
            <!-- if the arrays don't start right after count, skip this check because it will be redundant. -->
            <sch:assert test="($len_member_pos + count($array_member_pos) = max($array_member_pos)) or not($arrays_start_right_after_count) or not($sized_members) or contains($member_name, 'CapacityInput')">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This count member is field <sch:value-of select="$len_member_pos"/>, and it is referenced by <sch:value-of select="count($array_member_pos)"/> arrays, but the last such array is not <sch:value-of select="$len_member_pos + count($array_member_pos)"/>: All arrays bounded by <sch:value-of select="$member_name"/> should follow it immediately and contiguously: <sch:value-of select="$sized_members/name/text()"/>. Either re-arrange fields to get the order right, or add the missing len attribute(s).
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern is-a="len_member">
        <sch:param name="contextElement" value="types/type/member[contains(name/text(), 'Size')]"/>
    </sch:pattern>
    <sch:pattern is-a="len_member">
        <sch:param name="contextElement" value="types/type/member[contains(name/text(), 'Capacity')]"/>
    </sch:pattern>
    <sch:pattern is-a="len_member">
        <sch:param name="contextElement" value="types/type/member[(contains(lower-case(name/text()), 'count')) and not(contains(name/text(), 'CountOutput'))]"/>
    </sch:pattern>

    <!-- The only thing using Size should be buffer, or things that aren't array field sizes, like a size input in a field -->
    <sch:pattern>
        <sch:rule context="types/type/member[contains(name/text(), 'Size')]">

            <sch:let name="struct_name" value="current()/../@name"/>
            <sch:let name="member_name" value="current()/name/text()"/>
            <sch:let name="sized_members" value="current()/../member[some $len in tokenize(@len, ',') satisfies $len = $member_name]"/>
            <sch:assert test="$sized_members/name/text() = 'buffer' or not($sized_members)">
                <sch:value-of select="$struct_name"/>::<sch:value-of select="$member_name"/>: This member includes the word "size", but bounds the size of a field not called buffer (<sch:value-of select="$sized_members/name/text()"/>). Either rename the length field to use Count instead of Size, or rename the array to buffer if it is a buffer of bytes/characters.
            </sch:assert>
        </sch:rule>

    </sch:pattern>


    <!-- Handle rules -->
    <sch:pattern>
        <sch:rule context="types/type[@category='handle']">
            <sch:let name="handle_type_name" value="current()/name/text()" />
            <sch:assert test="current()/type/text() = 'XR_DEFINE_HANDLE'">
                <sch:value-of select="$handle_type_name" /> handle: the type element must contain only XR_DEFINE_HANDLE.
            </sch:assert>

            <sch:assert test="$handle_type_name = 'XrInstance' or current()/@parent">
                <sch:value-of select="$handle_type_name" /> handle: No parent handle specified. The only handle without a parent handle is XrInstance.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- constness of next in returnedonly -->
    <sch:pattern name="constness of parameters">
        <!-- look for input parameters -->
        <sch:rule context="commands/command/param">
            <sch:let name="is_const" value="starts-with(current()/text()[following-sibling::type][1], 'const ')" />
            <sch:let name="is_pointer" value="ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*')" />

            <sch:let name="is_input_struct_param" value="$is_const and $is_pointer" />
            <sch:let name="is_output_struct_param" value="not($is_const) and $is_pointer" />

            <sch:let name="bare_type" value="current()/type/text()" />

            <sch:assert test="if ($is_input_struct_param) then count(types/type[@name = $bare_type]/@returnedonly) = 0 else true()">
                <sch:value-of select="$bare_type"/>: marked as returnedonly, but passed as a const parameter (input) to <sch:value-of select="current()/parent::command/proto/name/text()" />
            </sch:assert>

        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <!-- these commands are allowed to not take a handle as their first parameter: match them first so they skip the other rule. -->
        <sch:rule context="commands/command[proto/name/text() = ('xrEnumerateApiLayerProperties', 'xrEnumerateInstanceExtensionProperties', 'xrCreateInstance', 'xrInitializeLoaderKHR', 'xrNegotiateLoaderRuntimeInterface', 'xrNegotiateLoaderApiLayerInterface', 'xrCreateApiLayerInstance')]">
        </sch:rule>
        <sch:rule context="commands/command[proto/name]">
            <sch:let name="command_name" value="current()/proto/name/text()" />
            <sch:let name="first_param_type" value="current()/param[1]/type/text()" />

            <!-- All other commands should take a handle as their first argument. -->
            <sch:assert test="//types/type[@category = 'handle' and ./name[text() = $first_param_type]]">
                <sch:value-of select="$command_name" />: takes a first parameter that is not a handle: it is a <sch:value-of select="$first_param_type" />
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Param/member naming conventions: camelCase -->
    <sch:pattern>
        <sch:rule context="types/type[@category = ('struct', 'union')]/member">
            <sch:let name="type_name" value="current()/../@name" />
            <sch:let name="member_name" value="current()/name/text()" />

            <!-- TODO fix exceptions -->
            <sch:let name="is_exception" value="$type_name = ('XrFrameEndInfoML', 'XrApiLayerCreateInfo')"/>
            <sch:assert test="$is_exception or matches($member_name, '^[a-z]([a-z0-9]*)([A-Z][a-z0-9]*)*$')">
                <sch:value-of select="$type_name" /> member naming: The <sch:value-of select="$member_name" /> member does not match the struct camelCase convention.
            </sch:assert>
        </sch:rule>

        <sch:rule context="commands/command/param[name]">
            <sch:let name="command_name" value="current()/ancestor::command/proto/name/text()" />
            <sch:let name="param_name" value="current()/name/text()" />

            <sch:assert test="matches($param_name, '^[a-z]([a-z0-9]*)([A-Z][a-z0-9]*)*$')">
                <sch:value-of select="$command_name" /> param naming: The <sch:value-of select="$param_name" /> parameter does not match the param camelCase convention.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Two call functions -->
    <sch:pattern>
        <sch:rule context="commands/command/param[ends-with(name/text(), 'CountOutput')]">
            <sch:let name="command_name" value="current()/ancestor::command/proto/name/text()" />
            <sch:let name="param_name" value="current()/name/text()" />

            <sch:assert test="not(@optional)">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param must not have the attribute "optional".
            </sch:assert>

            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param must be uint32_t.
            </sch:assert>
            <sch:assert test="ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*')">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param must be a pointer.
            </sch:assert>

            <sch:let name="basename" value="replace($param_name, 'CountOutput', '')" />
            <sch:let name="other_param" value="concat($basename, 'CapacityInput')" />
            <sch:assert test="current()/ancestor::command/param/name[text() = $other_param]">
                <sch:value-of select="$command_name" /> two call idiom: Has a parameter named <sch:value-of select="$param_name" />
                    but none named <sch:value-of select="$other_param" /> as expected by the style guide for two call idiom.
            </sch:assert>
            <!-- We don't bother looking for the array here, we only do it in the other parameter. -->
        </sch:rule>

        <sch:rule context="commands/command/param[ends-with(name/text(), 'CapacityInput')]">
            <sch:let name="command_name" value="current()/ancestor::command/proto/name/text()" />
            <sch:let name="param_name" value="current()/name/text()" />

            <sch:assert test="@optional = 'true'">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param must have the attribute optional="true"
            </sch:assert>
            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param of <sch:value-of select="$command_name" /> must be uint32_t.
            </sch:assert>
            <sch:assert test="not(ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*'))">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$param_name" /> param of <sch:value-of select="$command_name" /> must not be a pointer.
            </sch:assert>

            <sch:let name="basename" value="replace($param_name, 'CapacityInput', '')" />
            <sch:let name="other_param" value="concat($basename, 'CountOutput')" />
            <sch:assert test="current()/ancestor::command/param/name[text() = $other_param]">
                <sch:value-of select="$command_name" /> two call idiom: Has a parameter named <sch:value-of select="$param_name" /> but none named <sch:value-of select="$other_param" /> as expected by the style guide for two call idiom.
            </sch:assert>

            <sch:let name="basename_len" value="string-length($basename)" />
            <!-- Compute the array name: either buffer (if basename is $buffer), otherwise the plural of $basename -->
            <sch:let name="array_name" value="
                        if ($basename = 'buffer') then
                        'buffer'
                        else if (ends-with($basename, 'y')) then
                        concat(substring($basename, 1, $basename_len - 1), 'ies')
                        else if (ends-with($basename, 'ex')) then
                        concat(substring($basename, 1, $basename_len - 2), 'ices')
                        else if (ends-with($basename, 'child')) then
                        concat($basename, 'ren')
                        else
                        concat($basename, 's')
                        " />
            <sch:assert test="current()/ancestor::command/param/name[text() = $array_name]" role="warning">
                <sch:value-of select="$command_name" /> two call idiom: Has a parameter named <sch:value-of select="$param_name" /> but no array param named <sch:value-of select="$array_name" /> as expected by the style guide for two call idiom. Your array parameter may be named incorrectly.
            </sch:assert>

            <!-- the "if($array)" keeps us from spamming about arrays we can't find -->
            <sch:let name="array" value="current()/ancestor::command/param[name/text() = $array_name]" />
            <sch:assert test="if ($array) then $array/@len = $param_name else true()">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$array/name/text()" /> param must have have the attribute len="<sch:value-of select="$param_name" />"
            </sch:assert>
            <sch:assert test="if ($array) then $array/@optional = 'true' else true()">
                <sch:value-of select="$command_name" /> two call idiom: The <sch:value-of select="$array/name/text()" /> param must have the attribute optional="true"
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern>
        <sch:rule context="types/type/member[ends-with(name/text(), 'CountOutput')]">
            <sch:let name="type_name" value="current()/../@name" />
            <sch:let name="member_name" value="current()/name/text()" />

            <sch:assert test="@optional">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must have the attribute optional="true"
            </sch:assert>
            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must be uint32_t.
            </sch:assert>
            <sch:let name="is_exception" value="$type_name = ('XrTrackablePlaneANDROID')"/>
            <sch:assert test="$is_exception or not(ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*'))">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must not be a pointer.
            </sch:assert>

            <sch:let name="basename" value="replace($member_name, 'CountOutput', '')" />
            <sch:let name="other_param" value="concat($basename, 'CapacityInput')" />
            <sch:assert test="current()/../member/name[text() = $other_param]">
                <sch:value-of select="$type_name" /> two call idiom struct: Has a member named <sch:value-of select="$member_name" /> but none named <sch:value-of select="$other_param" /> as expected by the style guide for two call idiom.
            </sch:assert>

        </sch:rule>

        <sch:rule context="types/type/member[ends-with(name/text(), 'CapacityInput')]">
            <sch:let name="type_name" value="current()/../@name" />
            <sch:let name="member_name" value="current()/name/text()" />

            <sch:assert test="@optional">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must have the attribute optional="true"
            </sch:assert>
            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must be uint32_t.
            </sch:assert>
            <sch:assert test="not(ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*'))">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must not be a pointer
            </sch:assert>

            <!-- Relax the rule if this struct is extending another struct. -->
            <sch:let name="structextends_names" value="current()/../@structextends"/>
            <sch:let name="structextends_count" value="count(tokenize($structextends_names,','))"/>
            <!-- TODO validate one of the extended structs in the next chain has an "output" parameter  -->

            <sch:let name="basename" value="replace($member_name, 'CapacityInput', '')" />
            <sch:let name="other_param" value="concat($basename, 'CountOutput')" />
            <sch:assert test="current()/../member/name[text() = $other_param] or $structextends_count > 0">
                <sch:value-of select="$type_name" /> two call idiom struct: Has a member named <sch:value-of select="$member_name" /> but none named <sch:value-of select="$other_param" /> as expected by the style guide for two call idiom.
            </sch:assert>

            <sch:let name="basename_len" value="string-length($basename)" />
            <!-- Compute the array name: either buffer (if basename is $buffer), otherwise the plural of $basename -->
            <sch:let name="array_name" value="
                        if ($basename = 'buffer') then
                        'buffer'
                        else if (ends-with($basename, 'y')) then
                        concat(substring($basename, 1, $basename_len - 1), 'ies')
                        else if (ends-with($basename, 'ex')) then
                        concat(substring($basename, 1, $basename_len - 2), 'ices')
                        else if (ends-with($basename, 'child')) then
                        concat($basename, 'ren')
                        else
                        concat($basename, 's')
                        " />
            <sch:assert test="current()/../member/name[text() = $array_name or (starts-with(text(), $basename) and ends-with(text(), 's'))]" role="warning">
                <sch:value-of select="$type_name" /> two call idiom struct: Has a member named <sch:value-of select="$member_name" /> but no array member named <sch:value-of select="$array_name" /> (or starting with <sch:value-of select="$basename" /> and ending with "s") as expected by the style guide for two call idiom. Your array member(s) may be named incorrectly.
            </sch:assert>

            <!-- the "if($array)" keeps us from spamming about arrays we can't find -->
            <sch:let name="array" value="current()/../member[(name/text() = $array_name) or (starts-with(name/text(), $basename) and ends-with(name/text(), 's'))]" />
            <sch:let name="array_names" value="$array/name" />

            <sch:assert test="$array/@len = $member_name">
                <sch:value-of select="$type_name" /> two call idiom struct: Array member(s) <sch:value-of select="$array_names" separator=", " /> must have len="<sch:value-of select="$member_name" />"
            </sch:assert>
            <sch:assert test="$array/@optional = 'true'">
                <sch:value-of select="$type_name" /> two call idiom struct: Array member(s) <sch:value-of select="$array_names" separator=", " /> must have the attribute optional="true"
            </sch:assert>

        </sch:rule>
    </sch:pattern>

    <!-- Somewhat-generic rules checking that everything "require"d or "include"d actually exists. -->
    <sch:pattern abstract="true" id="requiredEnum">
        <sch:rule context="$contextElement[$attribute]">
            <sch:let name="attr_val" value="current()/$attribute"/>
            <sch:assert test="/registry/types/type[@name=$attr_val] or /registry/types/type/name[text()=$attr_val] or /registry/enums/enum[@name=$attr_val]">
                Cannot <sch:value-of select="$action"/> enum <sch:value-of select="$attr_val"/> which does not exist.
                Error found in <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/../../@name"/>: <sch:value-of select="current()/../@comment"/>.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern is-a="requiredEnum" name="Core features include valid enums">
        <sch:param name="contextElement" value="feature/require/enum[not(@extends)]"/>
        <sch:param name="attribute" value="@name"/>
        <sch:param name="action" value="'include'"/>
    </sch:pattern>

    <sch:pattern abstract="true" id="requiredRefNameAttrOrTag">
        <sch:rule context="$contextElement[@name]">
            <sch:let name="name_attr_val" value="current()/@name"/>
            <sch:let name="context_name" value="if (current()/../@comment) then
                                                concat(current()/../../name(), ' ', current()/../../@name, ' (', current()/../@comment, ')')
                                                else
                                                concat(current()/../../name(), ' ', current()/../../@name)"/>
            <sch:assert test="$candidates[@name=$name_attr_val] or $candidates/descendant::name[text()=$name_attr_val]">
                <sch:value-of select="$context_name"/>: Cannot require <sch:value-of select="$tag"/> item <sch:value-of select="$name_attr_val"/> which does not exist.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern is-a="requiredRefNameAttrOrTag" name="Require valid type">
        <sch:param name="contextElement" value="//require/type"/>
        <sch:param name="tag" value="'type'"/>
        <sch:param name="candidates" value="/registry/types/type"/>
    </sch:pattern>
    <sch:pattern is-a="requiredRefNameAttrOrTag" name="Require valid command">
        <sch:param name="contextElement" value="//require/command"/>
        <sch:param name="tag" value="'type'"/>
        <sch:param name="candidates" value="/registry/commands/command"/>
    </sch:pattern>

    <sch:pattern abstract="true" id="requiredRefNameAttr">
        <sch:rule context="$contextElement[@name]">
            <sch:let name="name_attr_val" value="current()/@name"/>
            <sch:let name="context_name" value="if (current()/../@comment) then
                                                    concat(current()/../../name(), ' ', current()/../../@name, ' (', current()/../@comment, ')')
                                                else
                                                    concat(current()/../../name(), ' ', current()/../../@name)"/>
            <sch:assert test="$candidates[@name=$name_attr_val]">
                <sch:value-of select="$context_name"/>: Cannot require <sch:value-of select="$tag"/> item <sch:value-of select="$name_attr_val"/> which does not exist.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Interaction Profiles -->

    <sch:pattern name="Interaction Profile naming">
        <sch:rule context="interaction_profiles/interaction_profile">
            <sch:assert test="starts-with(@name, '/interaction_profiles/')">
                Interaction Profile <sch:value-of select="@name" /> (<sch:value-of select="@title" />): Name is a path that must start with /interaction_profiles/
            </sch:assert>

            <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#semantic-path-interaction-profiles -->
            <!-- we seem to allow both tags and vendor authors here -->
            <sch:let name="vendor-tags" value="//tags/tag/@name/lower-case(.)"/>
            <sch:let name="vendor-authors" value="//tags/tag/@author/lower-case(.)"/>
            <!-- TODO fix exceptions (samsung, hp are not vendor tags) -->
            <sch:let name="is_exception" value="current()/@name = ('/interaction_profiles/samsung/odyssey_controller', '/interaction_profiles/hp/mixed_reality_controller')"/>

            <sch:let name="extension-vendor-author" value="@name/tokenize(., '/')[3]"/>
            <sch:assert test="$extension-vendor-author = $vendor-authors or $extension-vendor-author = $vendor-tags or $is_exception">
                Interaction Profile '<sch:value-of select="@name" />' must include a vendor tag (but we got '<sch:value-of select="$extension-vendor-author" />')
            </sch:assert>
        </sch:rule>
    </sch:pattern>


    <sch:pattern name="Interaction Profile Component naming">
        <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#semantic-path-standard-identifiers -->
        <!-- we also allow `palm` here -->
        <sch:let name="standard-identifiers" value="'^(a|b|back|aim|dpad_down|dpad_up|dpad_left|dpad_right|grip|grip_surface|haptic|haptic_left|haptic_right|haptic_left_trigger|haptic_right_trigger|home|menu|mute_mic|palm|select|shoulder|shoulder_left|shoulder_right|squeeze|system|thumbrest|thumbstick|thumbstick_left|thumbstick_right|trackpad|trigger|trigger_left|trigger_right|view|volume_up|volume_down|x|y|stylus|thumb_resting_surfaces|trigger_curl|trigger_slide|haptic_trigger|haptic_thumb|primary|secondary)$'"/>
        <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#_standard_components -->
        <!-- we also allow the dpad identifiers here too -->
        <!-- we also allow `dpad_center` which is not listed in the spec -->
        <sch:let name="standard-components" value="'^click|dpad_down|dpad_up|dpad_left|dpad_right|dpad_center|force|pose|touch|twist|value|x|y$'"/>

        <sch:rule context="//interaction_profiles/interaction_profile/component">
            <sch:assert test="starts-with(@subpath, '/input/') or starts-with(@subpath, '/output/')">
                Interaction Profile component '<sch:value-of select="@subpath" />' must start with /input/ or /output/
            </sch:assert>

            <sch:let name="identifier-name" value="@subpath/tokenize(., '/')[3]"/>
            <sch:let name="component-name" value="@subpath/tokenize(., '/')[4]"/>
            <sch:let name="vendor-tags" value="//tags/tag/@name/lower-case(.)"/>
            <sch:let name="identifier-name-vendor-tag" value="tokenize(@subpath/tokenize(., '/')[3], '_')[last()]"/>
            <sch:let name="component-name-vendor-tag" value="tokenize(@subpath/tokenize(., '/')[4], '_')[last()]"/>

            <sch:assert test="matches($identifier-name, $standard-identifiers) or $identifier-name-vendor-tag = $vendor-tags">
                Interaction Profile subpath (<sch:value-of select="@subpath" />) must include a standard identifier (but we got '<sch:value-of select="$identifier-name" />') or the identifier must end in _VENDOR (got '<sch:value-of select="$identifier-name-vendor-tag" />')
            </sch:assert>

            <sch:assert test="not($component-name) or matches($component-name, $standard-components) or $component-name-vendor-tag = $vendor-tags">
                Interaction Profile subpath (<sch:value-of select="@subpath" />) must include a standard component (but we got '<sch:value-of select="$component-name" />') or the component must end in _VENDOR (got '<sch:value-of select="$component-name-vendor-tag" />')
            </sch:assert>

            <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#_output_paths -->
            <sch:assert test="not(contains($identifier-name, 'haptic')) or starts-with($identifier-name, 'haptic')">
                Interaction Profile component (<sch:value-of select="$identifier-name" />) contains the word haptic but it is not at the start of the component.
            </sch:assert>
        </sch:rule>

        <sch:rule context="extensions/extension/require/extend[@interaction_profile_path]">
            <sch:let name="existing-profiles" value="//interaction_profiles/interaction_profile/@name"/>
            <sch:assert test="@interaction_profile_path = $existing-profiles">
                Interaction Profile path wants to extend '<sch:value-of select="@interaction_profile_path" />' but the profile does not exist to extend.
            </sch:assert>
        </sch:rule>

        <sch:rule context="//extensions/extension/require/extend[@interaction_profile_path]/component">
            <!-- TODO: This is duplication of the above check for component path names - can we remove the duplication? -->
            <sch:assert test="starts-with(@subpath, '/input/') or starts-with(@subpath, '/output/')">
                Interaction Profile component (<sch:value-of select="@subpath" />) must start with /input/ or /output/
            </sch:assert>

            <sch:let name="identifier-name" value="@subpath/tokenize(., '/')[3]"/>
            <sch:let name="component-name" value="@subpath/tokenize(., '/')[4]"/>
            <sch:let name="vendor-tags" value="//tags/tag/@name/lower-case(.)"/>
            <sch:let name="identifier-name-vendor-tag" value="tokenize(@subpath/tokenize(., '/')[3], '_')[last()]"/>
            <sch:let name="component-name-vendor-tag" value="tokenize(@subpath/tokenize(., '/')[4], '_')[last()]"/>

            <sch:assert test="matches($identifier-name, $standard-identifiers) or $identifier-name-vendor-tag = $vendor-tags">
                Interaction Profile subpath '<sch:value-of select="@subpath" />' must include a standard identifier (but we got '<sch:value-of select="$identifier-name" />'), or the identifier must end in _VENDOR (got '<sch:value-of select="$identifier-name-vendor-tag" />')
            </sch:assert>

            <sch:assert test="not($component-name) or matches($component-name, $standard-components) or $component-name-vendor-tag = $vendor-tags">
                Interaction Profile subpath '<sch:value-of select="@subpath" />' must include a standard component (but we got '<sch:value-of select="$component-name" />'), or the component must end in _VENDOR (got '<sch:value-of select="$component-name-vendor-tag" />')
            </sch:assert>

            <!-- https://registry.khronos.org/OpenXR/specs/1.0/html/xrspec.html#_output_paths -->
            <sch:assert test="not(contains($identifier-name, 'haptic')) or starts-with($identifier-name, 'haptic')">
                Interaction Profile component (<sch:value-of select="$identifier-name" />) contains the word haptic but it is not at the start of the component.
            </sch:assert>
        </sch:rule>

        <sch:rule context="extensions/extension/require/interaction_profile[@name]">
            <sch:let name="vendor-tag" value="concat('_', lower-case(../../@name/tokenize(., '_')[2]))"/>
            <sch:let name="is_exception" value="current()/@name = (
                '/interaction_profiles/ext/eye_gaze_interaction',
                '/interaction_profiles/huawei/controller',
                '/interaction_profiles/microsoft/hand_interaction',
                '/interaction_profiles/samsung/odyssey_controller',
                '/interaction_profiles/hp/mixed_reality_controller',
                '/interaction_profiles/htc/vive_cosmos_controller',
                '/interaction_profiles/htc/vive_focus3_controller',
                '/interaction_profiles/htc/hand_interaction',
                '/interaction_profiles/htc/vive_wrist_tracker',
                '/interaction_profiles/ml/ml2_controller',
                '/interaction_profiles/bytedance/pico_neo3_controller',
                '/interaction_profiles/bytedance/pico4_controller',
                '/interaction_profiles/bytedance/pico_g3_controller',
                '/interaction_profiles/facebook/touch_controller_pro',
                '/interaction_profiles/meta/touch_controller_plus',
                '/interaction_profiles/varjo/xr-4_controller'
                )"/>
            <sch:let name="is_khr" value="$vendor-tag = '_khr'"/>
            <sch:assert test="ends-with(@name, $vendor-tag) or $is_exception or $is_khr">
                Interaction Profile name must end with vendor tag _vendor ('<sch:value-of select="$vendor-tag" />'). '<sch:value-of select="@name" />' if it is introduced in a non-KHR extension.
            </sch:assert>
        </sch:rule>


    </sch:pattern>

</sch:schema>

