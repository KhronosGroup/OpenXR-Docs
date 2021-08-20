<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <!--
         Copyright (c) 2021, The Khronos Group Inc.

         SPDX-License-Identifier: Apache-2.0
    -->
    <sch:pattern name="Extension uniqueness and basic requirements">
        <sch:rule context="extensions/extension">
            <sch:assert test="@name">
                Extensions must have a name
            </sch:assert>
            <sch:let name="extname" value="@name" />
            <sch:report test="preceding-sibling::element()[@name = $extname]">
                Extension with duplicate name "<sch:value-of select="$extname"/>" detected.
            </sch:report>

            <sch:let name="extnum" value="@number" />
            <sch:report test="preceding-sibling::element()[@number = $extnum]">
                Extension with duplicate number "<sch:value-of select="$extnum"/>" detected: <sch:value-of select="@name"/>
            </sch:report>

            <sch:let name="specver_name" value="concat($extname, '_SPEC_VERSION')"/>
            <sch:assert test="descendant::enum[@name = $specver_name]">
                Extension missing version enum with name "<sch:value-of select="$specver_name"/>".
            </sch:assert>

            <sch:let name="extname_value" value="concat('&quot;', $extname, '&quot;')"/>
            <sch:assert test="descendant::enum[@value = $extname_value]">
                Extension missing name enum with value "<sch:value-of select="$extname_value"/>".
            </sch:assert>
            <sch:let name="extname_name" value="concat(upper-case($extname), '_EXTENSION_NAME')"/>
            <sch:assert test="descendant::enum[ $extname_name]" >
                Extension missing name enum with name "<sch:value-of select="$extname_name"/>".
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
                First child element of <sch:value-of select="$extname"/>'s 'require' should be a version enum
                named "<sch:value-of select="$specver_name"/>".
            </sch:assert>
            <sch:let name="second_child_element" value="require/*[2]"/>
            <sch:let name="extname_value" value="concat('&quot;', $extname, '&quot;')"/>
            <sch:let name="second_child_element_is_enum" value="require/*[2][name() = 'enum']"/>
            <sch:let name="first_child_element_named_ext_name" value="require/*[1][@name = $specver_name]"/>

            <sch:assert test="$second_child_element[name() = 'enum']">
                Second child element of <sch:value-of select="$extname"/>'s 'require' should be a string enum (define) for the extension name.
            </sch:assert>
            <sch:assert test="$second_child_element[@value = $extname_value]">
                Second child element of <sch:value-of select="$extname"/>'s 'require' should be a name enum
                with value "<sch:value-of select="$extname_value"/>"  instead of "<sch:value-of select="$second_child_element/attribute::value"/>".
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
                Second child element of enabled extension <sch:value-of select="$extname"/>'s 'require' should be a name enum
                with name "<sch:value-of select="$extname_name"/>" instead of "<sch:value-of select="$second_child_element/attribute::name"/>"
            </sch:assert>
        </sch:rule>
    </sch:pattern>

    <sch:pattern name="Extensions extend valid enums">
        <sch:rule context="extensions/extension/require/enum[@extends]">
            <sch:let name="attr_val" value="current()/@extends"/>
            <sch:assert test="/registry/enums[@name=$attr_val]">
                Cannot extend enum <sch:value-of select="$attr_val"/> which does not exist.
                Error found in <sch:value-of select="current()/../../name()"/>: <sch:value-of select="current()/../../@name"/>: <sch:value-of select="current()/../@comment"/>.
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
