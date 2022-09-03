<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
            queryBinding="xslt2">
    <!--
         Copyright (c) 2021-2022, The Khronos Group Inc.

         SPDX-License-Identifier: Apache-2.0
    -->
    <sch:pattern name="Extension uniqueness and basic requirements">
        <sch:rule context="extensions/extension">
            <sch:assert test="@name">
                Extension <sch:value-of select="@number" /> must have a name
            </sch:assert>

            <sch:let name="extname" value="@name" />
            <sch:report test="preceding-sibling::element()[@name = $extname]">
                Extension <sch:value-of select="@number" />: duplicate name "<sch:value-of select="$extname"/>"
            </sch:report>

            <sch:let name="extnum" value="@number" />
            <sch:report test="preceding-sibling::element()[@number = $extnum]">
                <sch:value-of select="$extname"/> extension: duplicate number "<sch:value-of select="$extnum"/>"
            </sch:report>

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

    <sch:pattern name="Extensions extend valid enums">
        <sch:rule context="extensions/extension/require/enum[@extends]">
            <sch:let name="attr_val" value="current()/@extends"/>
            <sch:assert test="/registry/enums[@name=$attr_val]">
                <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/@name"/> cannot extend enum <sch:value-of select="$attr_val"/> which does not exist.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- look for structs with structextends -->
    <sch:pattern name="structextends">
        <sch:rule context="types/type[@structextends]">
            <sch:let name="structextends_name" value="current()/@structextends"/>
            <!-- the thing you extend must exist -->
            <sch:assert test="/registry/types/type[@name=$structextends_name]">
                <sch:value-of select="current()/@name"/> structextends: names <sch:value-of select="$structextends_name"/> but that type does not exist.
            </sch:assert>

            <sch:let name="structextends" value="/registry/types/type[@name=$structextends_name]"/>
            <!-- TODO this is an exception because we want to make sure the location array is populated, but the rest is returnedonly. -->
            <sch:let name="is_returnedonly_exception" value="$structextends/@name = ('XrHandJointLocationsEXT')"/>
            <!-- you probably want to agree on presence/absence of "returnedonly" with the struct you extend -->
            <sch:assert test="count($structextends/@returnedonly) = count(current()/@returnedonly) or $is_returnedonly_exception" role="warning">
                <sch:value-of select="current()/@name"/> structextends warning: This struct and the struct it extends, <sch:value-of select="$structextends_name"/>, do not agree on whether they are "returnedonly".
                    <sch:value-of select="current()/@name"/> says <sch:value-of select="count(current()/@returnedonly)"/>, but <sch:value-of select="$structextends_name"/> says <sch:value-of select="count($structextends/@returnedonly)"/>
                    This is not an always an error, but usually is.
            </sch:assert>
            <!-- can't extend a struct without a next pointer -->
            <sch:assert test="$structextends/member/name[text()='next']">
                <sch:value-of select="current()/@name"/> structextends: cannot extend <sch:value-of select="$structextends_name"/>, as that type does not have a next pointer.
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- look for structs with parentstruct -->
    <sch:pattern name="parentstruct">
        <sch:rule context="types/type[@parentstruct]">
            <sch:let name="parentstruct_name" value="current()/@parentstruct"/>
            <!-- the parent struct must exist -->
            <sch:assert test="/registry/types/type[@name=$parentstruct_name]">
                <sch:value-of select="current()/@name"/> parent: names <sch:value-of select="$parentstruct_name"/> as parent struct but that type does not exist.
            </sch:assert>

            <sch:assert test="contains($parentstruct_name, 'BaseHeader')">
                <sch:value-of select="current()/@name"/> parent: names <sch:value-of select="$parentstruct_name"/> as parent struct but that type name does not include "BaseHeader".
            </sch:assert>

            <sch:let name="parentstruct" value="/registry/types/type[@name=$parentstruct_name]"/>

            <!-- you must agree on presence/absence of "returnedonly" with the parent struct -->
            <!-- TODO fix exceptions -->
            <sch:let name="is_exception" value="current()/@name = ('XrEventDataPerfSettingsEXT', 'XrEventDataMainSessionVisibilityChangedEXTX', 'XrEventDataViveTrackerConnectedHTCX')"/>
            <sch:assert test="count($parentstruct/@returnedonly) = count(current()/@returnedonly) or $is_exception">
                <sch:value-of select="current()/@name"/>: parent returnedonly mismatch: The struct and its parent struct, <sch:value-of select="$parentstruct_name"/>, do not agree on whether they are "returnedonly".
                    <sch:value-of select="current()/@name"/> says <sch:value-of select="count(current()/@returnedonly)"/>,
                    but <sch:value-of select="$parentstruct_name"/> says <sch:value-of select="count($parentstruct/@returnedonly)"/>
                    Either both should have them, or neither should.
            </sch:assert>

            <!-- parentstruct must have type and next -->
            <sch:assert test="$parentstruct/member/name[text()='type']">
                Struct <sch:value-of select="$parentstruct_name"/> (indicated as the parent of <sch:value-of select="current()/@name"/>)
                cannot be a parent struct type, as it has no type field.
            </sch:assert>
            <sch:assert test="$parentstruct/member/name[text()='next']">
                Struct <sch:value-of select="$parentstruct_name"/> (indicated as the parent of <sch:value-of select="current()/@name"/>)
                cannot be a parent struct type, as it has no next pointer.
            </sch:assert>

            <!-- parentstruct must not have a value for its type -->
            <sch:assert test="count($parentstruct/member/name[text()='next']/@value) = 0">
                <sch:value-of select="$parentstruct_name"/>: cannot be a parent struct type, as it has a value attribute for its type field. (indicated as the parent of <sch:value-of select="current()/@name"/>)
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
            <sch:let name="is_exception" value="current()/@name = ('XrFoveationProfileCreateInfoFB', 'XrSwapchainCreateInfoFoveationFB', 'XrFoveationLevelProfileCreateInfoFB', 'XrRenderModelPathInfoFB','XrRenderModelLoadInfoFB','XrKeyboardSpaceCreateInfoFB')"/>
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

    <sch:pattern>
        <!-- Things with a parent struct -->
        <sch:rule context="types/type[@parentstruct]">
            <sch:let name="parentstruct_name" value="current()/@parentstruct" />
            <sch:let name="is_spacefilterinfo" value="$parentstruct_name = 'XrSpaceFilterInfoBaseHeaderFB'"/>
            <sch:let name="expected_prefix" value="if ($is_spacefilterinfo) then 'XrSpace' else substring-before($parentstruct_name, 'BaseHeader')"/>

            <!-- TODO fix exception with alias? -->
            <sch:let name="is_exception" value="current()/@name = ('XrInteractionProfileDpadBindingEXT', 'XrInteractionProfileAnalogThresholdVALVE')"/>
            <sch:assert test="starts-with(current()/@name, $expected_prefix) or $is_exception">
                <sch:value-of select="current()/@name"/>: Name should start with <sch:value-of select="$expected_prefix" /> because its parent struct type is <sch:value-of select="current()/@parentstruct" />.
            </sch:assert>

            <!-- Keep exceptions consistent -->
            <sch:assert test="if ($is_spacefilterinfo) then contains(current()/@name, 'FilterInfo') else true()">
                <sch:value-of select="current()/@name"/>: Name should be like XrSpace...FilterInfo... to match the pattern of existing structures.
            </sch:assert>
        </sch:rule>

        <!-- xrDestroy... commands -->
        <sch:rule context="commands/command[proto/name/starts-with(text(), 'xrDestroy')]">
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
        <sch:rule context="commands/command[proto/name/text() = ('xrEnumerateApiLayerProperties', 'xrEnumerateInstanceExtensionProperties', 'xrCreateInstance', 'xrInitializeLoaderKHR')]">
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

    <!-- Two call functions -->
    <sch:pattern>
        <sch:rule context="commands/command/param[ends-with(name/text(), 'CountOutput')]">
            <sch:let name="command_name" value="current()/ancestor::command/proto/name/text()" />
            <sch:let name="param_name" value="current()/name/text()" />

            <!-- TODO fix and remove exception -->
            <sch:let name="is_exception" value="$command_name = 'xrEnumeratePersistedSpatialAnchorNamesMSFT'" />

            <sch:assert test="not(@optional) or $is_exception">
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
                        else
                        concat($basename, 's')
                        " />
            <!-- TODO fix and remove exception -->
            <sch:assert test="current()/ancestor::command/param/name[text() = $array_name] or $command_name = 'xrEnumeratePersistedSpatialAnchorNamesMSFT'" role="warning">
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

            <!-- TODO fix exceptions -->
            <sch:let name="is_exception" value="$type_name = ('XrSceneMeshIndicesUint32MSFT', 'XrSceneMeshIndicesUint16MSFT', 'XrSceneMeshVertexBufferMSFT', 'XrHandMeshIndexBufferMSFT', 'XrHandMeshVertexBufferMSFT', 'XrSceneComponentsMSFT')"/>

            <sch:assert test="@optional or $is_exception">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must have the attribute optional="true"
            </sch:assert>
            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must be uint32_t.
            </sch:assert>
            <sch:assert test="not(ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*'))">
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

            <!-- TODO fix exceptions -->
            <sch:let name="is_exception" value="$type_name = ('XrSceneMeshIndicesUint32MSFT', 'XrSceneMeshIndicesUint16MSFT', 'XrHandMeshIndexBufferMSFT', 'XrHandMeshVertexBufferMSFT')"/>

            <sch:assert test="@optional or $is_exception">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must have the attribute optional="true"
            </sch:assert>
            <sch:assert test="type/text() = 'uint32_t'">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must be uint32_t.
            </sch:assert>
            <sch:assert test="not(ends-with(normalize-space(current()/text()[preceding-sibling::type][1]), '*'))">
                <sch:value-of select="$type_name" /> two call idiom struct: The <sch:value-of select="$member_name" /> member must not be a pointer
            </sch:assert>

            <sch:let name="basename" value="replace($member_name, 'CapacityInput', '')" />
            <sch:let name="other_param" value="concat($basename, 'CountOutput')" />
            <sch:assert test="current()/../member/name[text() = $other_param]">
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
            <sch:assert test="$array/@optional = 'true' or $is_exception">
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
        <sch:param name="contextElement" value="feature/require/enum"/>
        <sch:param name="attribute" value="@name"/>
        <sch:param name="action" value="'include'"/>
    </sch:pattern>

    <sch:pattern abstract="true" id="requiredType">
        <sch:rule context="$contextElement[@name]">
            <sch:let name="attr_val" value="current()/@name"/>
            <sch:assert test="/registry/types/type[@name=$attr_val] or /registry/types/type/name[text()=$attr_val]">
                Cannot require type <sch:value-of select="$attr_val"/> which does not exist.
                Error found in <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/../../@name"/>: <sch:value-of select="current()/../@comment"/>.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern is-a="requiredType" name="Extensions require valid types">
        <sch:param name="contextElement" value="extensions/extension/require/type"/>
    </sch:pattern>
    <sch:pattern is-a="requiredType" name="Core features require valid types">
        <sch:param name="contextElement" value="feature/require/type"/>
    </sch:pattern>

    <sch:pattern abstract="true" id="requiredCommand">
        <sch:rule context="$contextElement[@name]">
            <sch:let name="attr_val" value="current()/@name"/>
            <sch:assert test="/registry/commands/command[@name=$attr_val] or /registry/commands/command/proto/name[text()=$attr_val]">
                Cannot require command <sch:value-of select="$attr_val"/> which does not exist.
                Error found in <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/../../@name"/>: <sch:value-of select="current()/../@comment"/>.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern is-a="requiredCommand" name="Extensions require valid commands">
        <sch:param name="contextElement" value="extensions/extension/require/command"/>
    </sch:pattern>
    <sch:pattern is-a="requiredCommand" name="Core features require valid commands">
        <sch:param name="contextElement" value="feature/require/command"/>
    </sch:pattern>

</sch:schema>
