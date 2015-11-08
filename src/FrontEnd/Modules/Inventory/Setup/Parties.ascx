﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PartiesPopup.ascx.designer.cs"
    Inherits="MixERP.Net.Core.Modules.Inventory.Setup.PartiesPopup" %>

<script>
    var scrudFactory = new Object();

    scrudFactory.title = Resources.Titles.Parties();

    scrudFactory.viewAPI = "/api/core/party-scrud-view";
    scrudFactory.viewTableName = "core.party_scrud_view";

    scrudFactory.formAPI = "/api/core/party";
    scrudFactory.formTableName = "core.parties";

    scrudFactory.excludedColumns = ["AuditUserId", "AuditTs"];
    scrudFactory.readonlyColumns = ["PartyName", "PartyCode"];
    scrudFactory.hiddenColumns = ["AccountId"];

    scrudFactory.allowDelete = true;
    scrudFactory.allowEdit = true;
    scrudFactory.viewUrl = "PartyInfo.mix?PartyId={Key}";

    scrudFactory.live = "PartyName";

    scrudFactory.layout = [
        ["Photo", ""],
        ["PartyId", "PartyCode", "", ""],
        ["PartyName", ""],
        ["EmployeeId", "EmployeeName", "", ""],
        ["FirstName", "MiddleName", "LastName", "PartyTypeId", "", "", "", ""]
    ];

    scrudFactory.returnUrl = "../Employees.mix";
    scrudFactory.queryStringKey = "EmployeeId";
    scrudFactory.keys = [
        {
            property: "PartyTypeId",
            url: '/api/core/party-type/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        },
        {
            property: "EntityId",
            url: '/api/core/entity/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        },
        {
            property: "IndustryId",
            url: '/api/core/industry/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        },
        {
            property: "CountryId",
            url: '/api/core/country/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        },
        {
            property: "StateId",
            url: '/api/core/state/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        },
        {
            property: "CurrencyCode",
            url: '/api/core/currency/display-fields',
            data: null,
            valueField: "Key",
            textField: "Value"
        }
    ];
</script>

<div data-ng-include="'/Modules/ScrudFactory/View.html'"></div>
<div data-ng-include="'/Modules/ScrudFactory/Form.html'"></div>

<script>
    $(document).on("formready", function() {
        initialize();
    });

    function initialize() {

        var firstName = $("#first_name");
        var middleName = $("#middle_name");
        var lastName = $("#last_name");
        var partyName = $("#party_name");

        function displayPartyName() {
            var f = (firstName.val() || "");
            var m = (middleName.val() || "");
            var l = (lastName.val() || "");

            var name = f + " " + m;
            if (l) {
                name = l.trim() + ", " + f + " " + m;
            };


            partyName.val(name.trim());

            partyName.trigger("keyup");
        };


        firstName.keyup(function () { displayPartyName(); });
        middleName.keyup(function () { displayPartyName(); });
        lastName.keyup(function () { displayPartyName(); });

    };

</script>