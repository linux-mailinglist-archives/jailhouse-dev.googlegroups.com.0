Return-Path: <jailhouse-dev+bncBCJN5Z66VINBB3GZSP7AKGQEFHAV5VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF702C8496
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 14:00:29 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id x23sf6832848ljc.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 05:00:29 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606741229; cv=pass;
        d=google.com; s=arc-20160816;
        b=bw6RmpABz6IBVfUEypXtGqLXJOk70SP21//a2nktgzA8bhsvoh9SojnpXwnnfl+3yg
         FE5hAkPkxkQ2jFwx9OSn5pQD2gKgXKRhLcq2MIEOwANMeJ1sJDfUtHYipN3nJbYrKYRC
         3NE5FdTcfy8kZtLW9q7oTnwDXnh3bcFBa2dVB26rpX6a0nRHOcdQCRnaiJ5NMkt9dlT4
         vnT+Y4xcPyqgDTjnxZPX5yxYwsALbeq+WPCXcrOIQFoWeHSZDCLrrXBdaUrhd3XFhBwc
         hUNQK8JbzzgGdQeT2YXYjrtcLIHbJLvCNbGQFm9DJruj4mZk89LzauNm+CvwcZmUq2el
         oR3g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=3krNxhwOox9R9PDQ9+GjfOJZ7kQBiKhQC6k7+5lFQmA=;
        b=W9WcU/Hsq9n3jCC6HarEuOWrW+stfq31EYczDQSLMgeW0BpBMl62KlHfI+8VkAU0zr
         iGFcP7gwB73+Fu4BAhec4tknzAPjeAhf5gKGfPeoKEG8Tde2nJKc1tGCMX+0yEicx0Fk
         cSiYO04VQifmPOwyl7yd8xALZAJ/8Kr1LMPe6RqjuilYsW9Cqs8MR87dyE2aq3HX6fUA
         luSvI0afGvnVYLslew5uTi3T3S2n1oy/LxRqxrtFG8XWRpNRKtYO1l0vaCZ0JIIBWXC5
         iumS1GpXJmjbATf/8GVYP37h3lay09zDgpQN8qbglGEXPIjCvLTyOASqi6TTt8BzdRhM
         w5Kw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b="EZgGDtu/";
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.138 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3krNxhwOox9R9PDQ9+GjfOJZ7kQBiKhQC6k7+5lFQmA=;
        b=ewIwKPIj6Heh05Sh4q1ReSsx20hVcblQrDQTVe47cho3GFQ732bNWT7f78hQ9RQ5SS
         QKZ3Y2rq7WBWmc622BNEeh/UTL4Wm6imPLqftg2W2kqyv1t99im4MAOMbxvMgL2zjFbM
         9m111ZMPg7R0pwrxYElDtTiajCBnnn3dcXc3R+moFyXSXPD0Hu1wjRnFWDaG138aMgzI
         LWLvyMQ/nMcuaTRVJsl2bPcDzR0vAxRZRaQr0Btrf0/Y+Frk9dUdwqDtEISYmUlBDzc9
         vwLZCstk08r0GaFMu+P4ZXo6prHIhcksiSstG6QbCzuc3RFeU2H2rtlINlwkrYdDksKZ
         109A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3krNxhwOox9R9PDQ9+GjfOJZ7kQBiKhQC6k7+5lFQmA=;
        b=pSUKGtSR+0/BDZH6DRYH455fSv9axgV2dv5SuL72mV9X2rGdnUroiZiQMLxVSPIe7U
         J2NLMaGqFgjaBXF5CBtzACkSfkMaB6+a33dXx3/azPFARE/fV7a7OGO6fGTP0afIaDoh
         CAwhs/vX/ov2Dq5yoFIFGaEs9hozOivTcv1ag/59RbQJXL0W7yjEV0nJS3Mi5Ce/+wu8
         h8wa7VXN+KQwMfXIlJT0c60XDu7lqVChypXhydjnihyprgD67JjjTtixwR6dTUn3I+Ew
         LDWokSeLjTxByz65IYdLUyyOOHPYz8EX/OAZ5Y1MFWO32npNj5h38aIUl7EfgTgW1Efs
         nfKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530vXIN9UZspl2+gC2C7oVN/ZQudtmAwmc8vxyfLgn6t4q4Lv34D
	CP63JxOxkO0170aXzTekQTc=
X-Google-Smtp-Source: ABdhPJwzuuIvc92kqN6K+pHrjdaPA6K/LXVDY9poCLIyWwFv2TTabNJ2YG1fSUG9skjhrs7tJ8FHpg==
X-Received: by 2002:a19:f515:: with SMTP id j21mr9510496lfb.285.1606741229143;
        Mon, 30 Nov 2020 05:00:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5a02:: with SMTP id q2ls4123080lfn.1.gmail; Mon, 30 Nov
 2020 05:00:28 -0800 (PST)
X-Received: by 2002:a05:6512:1056:: with SMTP id c22mr7531206lfb.179.1606741228011;
        Mon, 30 Nov 2020 05:00:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606741228; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kf49D5wBnYeNni7xviXG5iOZwy4nFIFUvipwrPL61hqQUakljDoyJJUPJ62R+sBefr
         z3wQdF1KUUA0eUld1Gy6GO24EADl9M3a/NADCIvdH2Glv3lB9M1FYQ/6Cld+uDk1RH5G
         rdIG/V/ET0rX6mLAfmC7+5lpyX+4DaApV/vrcQzrP63e0Tkiz3bqBkZGL+jvK9pu0FLR
         uUIrlqtdgE7dBaVZObm9I+bRHV0PeZmr3Uc9iYUaKwnOIG2xlWWatwrw6oeXb/xOkSGo
         biJ3s3a8bkovN6K2ZC+1qIN3H+lL2RXOzkjYZrtnqGJd/5Fgjk8EK7mlCbIFsPVSoeIu
         XxMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=+ZQ8M3Lmbumtv7RyhEyzGrd7gBS+NHf4yBbmQo80gB0=;
        b=tVn/HqlyBIFIuHN4GRGm8BCjkeHsmG/ZL6upsV/oNiGexirhrLnHRvV0KyER+FqGgD
         /CvSmeWsP13Z7/4F937VVhJ3tB4NgotG4LYTdB7eJDPosF5nQJMCgWMDqTu77CXmbG06
         2pTByZdJKI8L+5jguZ/BQEDQmOnUj1Xpt7JtsB9gtRQv/smxEKaxYuLDxdYkJ1ClPwI3
         8eDa4+CPcmQtHO0BV1gpqF78GtPXYTLYwvn5XpFGx4yRKi8PZvkjQxJV+2oW6RaIo9rg
         svOljO6ICkudDqF4bayvW7Gsjd9nfHVp13fi8LUdLTXt+5yJVPpEH5q85QjiVqXyHtfr
         FXbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b="EZgGDtu/";
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.138 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2138.outbound.protection.outlook.com. [40.107.21.138])
        by gmr-mx.google.com with ESMTPS id f5si699478ljc.0.2020.11.30.05.00.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:00:27 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.21.138 as permitted sender) client-ip=40.107.21.138;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMNYQxMrXIJFRJNe4HOta4l9HUwvwyn2iN/A5cY8KC1Tqgl9jrbdA0jzqwC1QLsKTfLRoS7zLNyYp/eXLwEeLHE1zKokJRvmVi5N2nhuIWvgwPffRFEolTeiiglaV2F3vwXPHgQ6WRdloZF+u2XzkQenwerEnltTInHucL46TdnvNGHdh6K/ktqkHyFL4HAXtBWb3KieC8Cvpy5xFHNL6PFwPr8woHSwWNO1vkqpB94Zsu+CmxaYmaC2QepQ3F5F5cvSCdGvQnVu+ftbpKevJN6nH+5ZaSDST5xnN2OWlK3Vw0BP0V6y8kXRAYDLwLsey6pIK+XnbWXLdpFxTrkDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZQ8M3Lmbumtv7RyhEyzGrd7gBS+NHf4yBbmQo80gB0=;
 b=KIKZ+ZszAaU/3jvP5Cz636frIsjDb6qTZ2KyImrz0Tr1QyjLqTMv/mNzF4kKfK23o8TkAjuRxfcPnbQomnec01kYEUVVFf7/BUznCsE+ZFi9O+6qFp3o2rIHQGSrSYx8FhOu5jqCesYivFnpE3wXxV2NA1tXMZOmcn/xNqmijjphSq08FtjQWbpb/gOTzlFWiQYnVvAK4KGMJf64TQjBVbJa7GMo+1ffwIyqkYuO9JRYkW1qM+TFSZitVhzKhg53CXhKHJu66HkMf5kd1yu9mdzAYB2aTZ3IuW+zwb/pVSLd9a7jmlOwEy7Az9FErmMr116rmTwnsPdahGKQnvqa+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PA4PR03MB7311.eurprd03.prod.outlook.com (2603:10a6:102:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 13:00:23 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:00:23 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse: request_mem_region failed for hypervisor memory
Thread-Topic: jailhouse: request_mem_region failed for hypervisor memory
Thread-Index: AdbHA59mMTyyeCVKT82fCG3n0EzxOQAER0eAAAD6ltA=
Date: Mon, 30 Nov 2020 13:00:23 +0000
Message-ID: <PA4PR03MB718417E5C836D059FA4DC909B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
In-Reply-To: <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96f989a5-a39f-4bb2-65bf-08d8952fe646
x-ms-traffictypediagnostic: PA4PR03MB7311:
x-microsoft-antispam-prvs: <PA4PR03MB73114C51947F5833693E05E5B6F50@PA4PR03MB7311.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FniDVRI2l0ACPkjLgv6JRARxKtnAzm/oKR3AxBG0Cq/k7e+dE1G/j/87l8S3KoBL+umWwzKfTrqRJ+NvZZRO5zbi0auYsS6Xndrg7AkAttxuGVyZQuwEvsjm6rdSt4yZ+6KfTPOdjAFXNSkE9Z+4rR3UvCpw5VQy3+YQv7lkUmD6y+DZ+WGXzltIHgTbjz6v/0kXmIcotTV8va4PRBoOf0CdA3lTRZQf5EItrfQcXIMlQN6PC01AJD6AnI2uWrKnMjoR8Ubwqc8PRFSnL82nPP6G0rI2sY1zMy+kdPKViOfwKrjJ9zLv/DJCeAYGftaS4ms8l3+yW7Wkz1S6b9jRFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39840400004)(8676002)(316002)(76116006)(7696005)(83380400001)(478600001)(8936002)(66946007)(66476007)(66446008)(52536014)(64756008)(66556008)(2906002)(186003)(53546011)(55016002)(71200400001)(26005)(6506007)(9686003)(5660300002)(110136005)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eFk0T1lJYmVYSi8xS1Y4N2lzWUhjV1U0OUd0ZjkvTVlLWkVyRDNJeUZLOVkr?=
 =?utf-8?B?M1l3ckVUaUJEVEw1cWNvSlhqcWw4QXJmWkl3K2tHdHRrUVlnN1hHWXNnb3l1?=
 =?utf-8?B?QkJQMStvZUtpVEgwL1cwSzVacjRvN0tTUXBiZTNZT1JsQ2ZKUCtKR2JNZ1Fr?=
 =?utf-8?B?bmkwQVJqRlJOb0VIcTZBL3BXUjg4anNFbWJHQ1hWZCtiVDJWbEg0U0dPSkNq?=
 =?utf-8?B?cXdOUUtYU0V2dVlnK3g1cUJlVUEzaWl2eTgrYVA1bXNCc2x1YXlkNWx6em9Y?=
 =?utf-8?B?d2ZJdXdpRmdQdUtpb1ZrTEZOYUZOeERPRHVqNVBzRjZhV0RTbkJjS2gzem05?=
 =?utf-8?B?NkJHKzd4SjBUeVlDVVl1UDRkdFFwaU45ZnF2RFZGWldVZklxTFZHTDBYd3VC?=
 =?utf-8?B?YVEyOTVzdFFwTU5QYXYySW9mYWlGWGlRRFJHaWNxQ1hHZ3ZjdFVlVmg1bkI5?=
 =?utf-8?B?SVVLTm9sV2k2MFV3TmF3WkhMazJSeTcvWkNXcnV2Q2FLUlZTL2NPZi9sWS9o?=
 =?utf-8?B?aUwxNWp2cmIzYTdseTJ1QVdBZ0tNRzY1N0llUWE3Y2NIVjhkcVFOYkg5czBC?=
 =?utf-8?B?dU9uWFR1a1VmUkdSYmE3UldmekkzMXNsbVlrYVlaSktkRFZBN2NoY3lTUWFT?=
 =?utf-8?B?eC9rK0pXaU5reDZNUS8rUU5LZkp6MDNsL2NEZHA5SEZkVytYem1XQzdGWFRo?=
 =?utf-8?B?cXlNNWFLRFZvekY1YkxLMW91d1ZtOTR6R3J4SndqamRzRE8wOUVNN3kwbXZh?=
 =?utf-8?B?NVhpNGozNHVzNVVSUW5ubnBCa0tST3ZsWVRwTVpRQURTMys0cmR0UUt0T0JE?=
 =?utf-8?B?bDRvR2RqbXhleVUvN0RTcXhnL3JGUS9WdHBYTmJyOFFGRVR0bnRpMnBQczRa?=
 =?utf-8?B?Wk4vUDR2S2ZxVFFWK3ZYWXdPU1kxQXBZYW11ZkozQVYwallYak9SYjVXVjQ4?=
 =?utf-8?B?MVdqUHhYRjVId2g2N0JNaDRINE0vQm05MWNqdlR3SDZ6ZjU0NHR5QWR4N0xM?=
 =?utf-8?B?eFVpRCtrbVBucU4vWlhCZWJYSmVYejU2NkFxWE9mVXZuOWpCd1R6eXc0OGpa?=
 =?utf-8?B?VThBV2YwT2hZcytkWUE0OHdHQ0ozOVdhRUx5dy9MZDJGNU1Xd1VGSGtJODZu?=
 =?utf-8?B?a096bTdlTmFLUWgxSEM0c2xsaTQ3UHEvS29lTnU1c1VlUDdRVDhrU3FrUi9m?=
 =?utf-8?B?SVFTOXlDMk12ZGtLT2NPYXNWNE84YWM4OTROSXB4a1p1ei9lelhSVG1GZTdk?=
 =?utf-8?B?aGRIWW1ZMWc1TWVWVmR1Y09vZ0d3dXBXWkszQkJKSERQb2VhUHQ3cFZOaklD?=
 =?utf-8?Q?XXyCHxHOuqOmw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f989a5-a39f-4bb2-65bf-08d8952fe646
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 13:00:23.1294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9GUmdBO/BmW44xM0kDxExt8HaZwPDag0Yyf2EF4di60QSGRo1pZPkguai1HtiuZ5UrwtxnmfJy8EV0R3W6wxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7311
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b="EZgGDtu/";       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.21.138 as permitted sender)
 smtp.mailfrom=Msainz@ikerlan.es;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

No, the content on /proc/cmdline is what follows:

/ # more /proc/cmdline=20
console=3DttyS0

-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com>=20
Enviado el: lunes, 30 de noviembre de 2020 13:32
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 30.11.20 11:31, Sainz Markel wrote:
> Hi all,
>
>
>
> After being able to compile all the elements, when I try to enable the=20
> cell, I get the following error:
>
>
>
> / # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
>
> [=C2=A0 142.758697] jailhouse: request_mem_region failed for hypervisor m=
emory.
>
> [=C2=A0 142.760507] jailhouse: Did you reserve the memory with "memmap=3D=
" or=20
> "mem=3D"?
>
> JAILHOUSE_ENABLE: Invalid argument
>
>
>
> I=E2=80=99ve appended to the kernel the line =E2=80=9Croot=3D/dev/sda int=
el_iommu=3Doff
> memmap=3D0x5200000\$0x3a000000 vga=3D0x305=E2=80=9D
>

Does that show up without the "\" escape in /proc/cmdline?

Jan

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB718417E5C836D059FA4DC909B6F50%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
