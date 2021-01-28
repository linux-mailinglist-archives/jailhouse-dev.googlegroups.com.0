Return-Path: <jailhouse-dev+bncBDGILGE54ELBBD7SZKAAMGQEVG3MD2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DEE3076DA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 14:16:00 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id o79sf2120733wme.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 05:16:00 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611839760; cv=pass;
        d=google.com; s=arc-20160816;
        b=UukShtaAxDaVpzcAVQ7OmxzihUeBm/i8lG9G6RPkhBf0sLe2WqMHFhUM1HwwXW4VH8
         63RTEXjQJPx3yX+FfOzifkZaSFdFIen77Cm2W9b/pa2MBFKOJgarfP54ochBMdflLhnB
         JSJGXzWmLKxOrP9o/NZIYOCRM++f6wQ+D3Kvjlmei22tSURhedXxy464JpMAMCYNPifz
         VKmdUYy+nXnbMg5XakDeIC+WmdIJ6JsA59+iByrDw3t++HCkPwyB8eZ5TeaL84J8SvRm
         bFXYT4c6qQGpBIFBw8M2ULLX08+lCwCo0CSoq5Maa+/5A+gtZ2X9xT4HOQB8b08gApnW
         z3RA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=VUiuikQMTqlL94wq0ZDV/NSdaZxvIdMg7K8kLC+Vcu0=;
        b=yZ6nCDp+cKH3uni686IdQeEEOZ7V3CJ2VfLEKmOHlBH8PE2VNbz21tbRV2zyqbmn41
         po+2Re2fe61qu+jsXiaxi/OWj9vecYBlJ617AaoGoTWp/Ee9eU3DmRQVS9N47fnQgdTB
         Rlvs5lpWczJEDdsGrfvEOvOuPkOFR1wHEEemuyXVHCDXF8BTlgvptYa25v8A1myV6bmZ
         pKgFcJB/y2Q+WtV9gxKvEtqTmSDveR8aZ+gBiXhRRtF2496K0kB78Y88UKgjD1dHZnHA
         BFOIp677UV8JRXMv8QjSteqT3rzmDE9cewvelUpH24wgv8FX4S9yH2KYi8KC/NZxgBLE
         MTew==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=N4X2Ge8j;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUiuikQMTqlL94wq0ZDV/NSdaZxvIdMg7K8kLC+Vcu0=;
        b=RKByjIUJWrALem0fQqrKxcITedhEd0UAVk/fsg1NRW5wceJTm8HD8SUuvFvViU/zti
         Pq3DezuvVflOMG/h+VUZ+kwTpx0Aly5cGnD2wkDyWoKps0b7OfYlRwWcSR8Yxky1MkWe
         LARCBxPJ/Yxx46+YJHo8FJtydzsUYr+cVkLSQdw09WVRwzovct5RnN73nzK+CMdbxRAc
         BWWdK9EZsLTRg2mmgYkKmmEaK7wYKb7K4ICIhOdFnHUD0byGmxsn1KhyA7Qgd+bC4lig
         9vejVGLEOvwXhhGGmqUFSkxCBtmLEBxfvyx+oTI4na+C85YZbG3QQnNYVZ7UKqqroSf2
         ySeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUiuikQMTqlL94wq0ZDV/NSdaZxvIdMg7K8kLC+Vcu0=;
        b=JMjLm86f/E2AroBGo4sXgPlvLvhB0HvACG/KrVZEkNw+JAhtu7X9mWfNpL6P9L9wWP
         ne44NwwY6KOFj2enIGPkCwcer7SSM9/OSMsfjGoPiuvLGWzLVhR9liPrFryFAkK1eQiq
         ZyByHdIG+4rfemlohojXmHQ88gROjkCL3gDnSF9yizTb493uP+FaCoJ/UDQH59sGTNGF
         eu93dqRYnPF7iFymUj6PgyYa1yqgiuhHMSB6GnrjvRsw+q4gfw0lxvIoRKc4fnrRv815
         JAyUtgXOQtUYXYjYD1hF8TrrMy4x1b3PqWK1DnJlpYTpQrp/z5xbc6gfe9tBjyENG1tB
         zPrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Bd27jqk/S8mSfPqk3C8LJI/Ci4Fjkz05EMzp47gcswr5hBKAf
	FfoRZHxlvXXlui8zP77AIxA=
X-Google-Smtp-Source: ABdhPJzAcxYLlDwqixLyIMt44I1QXBsZApJUmiQaEaQ2fKFPnX6UDoXzMt/0vmW/fJ4g5snr3zuuqw==
X-Received: by 2002:adf:df12:: with SMTP id y18mr16438663wrl.141.1611839759812;
        Thu, 28 Jan 2021 05:15:59 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fd09:: with SMTP id e9ls934028wrr.0.gmail; Thu, 28 Jan
 2021 05:15:59 -0800 (PST)
X-Received: by 2002:adf:eacc:: with SMTP id o12mr16068315wrn.202.1611839759053;
        Thu, 28 Jan 2021 05:15:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611839759; cv=pass;
        d=google.com; s=arc-20160816;
        b=jQVWsBFJn2E1n4MbIKJVKTYhMcE7S8ESO9uRCNDiUlKH5nq9KemT3E1KU3sNbmQlbk
         GChRQCw5kvvP2pFTdu1tyBRZuTGAyynnO76Sqo3RseblSAID7JAUi8Dhbf/wiTzQW8KG
         ZTxx0Zl5GxNrq4Y1avBL4rDI2edwWVZl35cPxmNGXpKWltrTSl0ixsWO7TobSm6ZR6xN
         ZdeF2YkX28sWV0cswRqU81kyukcmvmdtP8UMCnGqaxfuJYj7M6wxkq1QxhkWZE/WYdXa
         vhJcM1ajvQuFOgGV3uYevYBcq+LyzEvXPCYSgL0Jh0SaxyG1/wSyFJmH2Enjlp1KCI/n
         zgsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=6YvqIT8cEMYURag33nYz6WkHxSuxPyS88yml+is47QQ=;
        b=bsb1zk59J87uQ5WcFC1ol5aaL3PxllTceq0PONrOqshdUSofZt2I9Myg5ZOMFK+lpi
         3jYDMMalxEn0ZYKe/2ObI6w5cF1UixPzlaxR33i4nQ1sViAkkQH3ARavGsGQKZ3Ufof5
         XZ0KFdryJLhNsMboC9/Di54qZ/yfaMOyiF6G0WDQvxSLhRQkUpDSYOmFBAkKMuA/8ayu
         Tzl/fBDFgm+tuhxBh7pwrPJZjxD3MLUpawMPGkItcJx78EXH3LrqR8HKE2FUjQgb/dmT
         oohSRK2WTJxu21ifplAvgO3lClgyTB5JPuSnGPgAx66EgEbeB3qgdYrTY3w3eijMkeBN
         ZzBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=N4X2Ge8j;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60105.outbound.protection.outlook.com. [40.107.6.105])
        by gmr-mx.google.com with ESMTPS id v16si479678wmh.1.2021.01.28.05.15.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 05:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.105 as permitted sender) client-ip=40.107.6.105;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ2fGvLg/BUOWuZJmYg85so8lnrmkO1DhVhbgcebyIrpbG/xqHCED7/IdYgQX10spJpdgjGUf4g7jjJ2i1WazgmbDewVIfD8mWhf/4v5OjamiqVfjQHeJ61VyAAW49Al7Hy4TeZKM446dyZRJYqlwTHmrivKOWDpTXL6HhZDjOe5egTl88tqiCOqiCsEKVw5nC8LVoBXVUnPbPczJ/wk1EEnctbmL50rSPWYsU2AfkECj0xGAMiyW+wQxbbp/NXdLoghrr43wM2d52BmrJmhXvVw0s5zbBvoENg1TNl712ZzjJxWr5PKsYibOVnE4FKwQs124HInFEyX36uskUwkug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YvqIT8cEMYURag33nYz6WkHxSuxPyS88yml+is47QQ=;
 b=djuqb+5xz2GbBnYy+s1n2x20QZQCmORJNKf/odUMvnsKPk+tGmjipiQVoUYLyEssrDBWgiVWQDbITfK+d4Nj7DnUN2CyVNtastCvEViEpicHgnxjCwj/FlAXrDPPm4fS7X4EKNhDz0KqZYi6jSfMhZFT1LL8hmUjgD/nRC+8khuRIt6HByoa2klV+XYWn8AxT0lCdmlPqA9emLLBJd2PDJ9Yx8MqD9Wx7a53Ybl0h8QGTA0PtOh5DUPT7ER8NWIs8feRWjAp7V527T4ZyX90sCcQg4LhI3avw7CFRjflZVacGAEfZnXD/KnA+9Yec7KxtP2O/WT/JKQfktVRXA3G8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM7PR02MB6225.eurprd02.prod.outlook.com (2603:10a6:20b:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Thu, 28 Jan
 2021 13:15:57 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::640d:2e01:adb5:4ff]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::640d:2e01:adb5:4ff%5]) with mapi id 15.20.3763.018; Thu, 28 Jan 2021
 13:15:57 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: MMIO APEI issues
Thread-Topic: MMIO APEI issues
Thread-Index: Adb0k6sE6Zmd86F3Srq7H6JWBrPoAwAISQUAADAY9dA=
Date: Thu, 28 Jan 2021 13:15:57 +0000
Message-ID: <AS8PR02MB66636F44464F9BEC17A8AAFEB6BA9@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <AS8PR02MB6663AEA8ADC5EE631F76496BB6BB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <3570d529-ff10-da30-9b23-384a8b30cfe1@oth-regensburg.de>
In-Reply-To: <3570d529-ff10-da30-9b23-384a8b30cfe1@oth-regensburg.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8902bbd5-0664-429c-c028-08d8c38ed99e
x-ms-traffictypediagnostic: AM7PR02MB6225:
x-microsoft-antispam-prvs: <AM7PR02MB62250814CBEB7A723446C77BB6BA9@AM7PR02MB6225.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZQqBhjM4cD/b/j6aDHifMsrhL9j13HPNRoRxcLOGyTmdePvjunqlNxgbfSPeVvJSed2z5PHy3VmeTNZ8p0brg1yoyfAyAZq0ntoWIKUkqIGGJokpO3htMib9eqOXMf/Rla64bN/Lw81xTgbGvOZbO7zUDYKA5X9AQ10qYkuacyRXHDYy8IrWnvtS4SZL37Zgv5YiTgt5h9+PNHat1WeRCrgt6av1WgCzvxmLMbY+eZCzQa9ilIgc1bmbjFA/z7lQhWPkFX/Ns+LNGv4QW4cRbraF9G+8jtOQUy29FfMIsBNH9A06b4hjA6RVFwIfxkRs6ECIqre+3VMSWQYfPIHG25dxtvqmcDvKQ9TBz0sOFMWia7m21+Z7tT6nrEG58Ht5qQFJwG8hZS0IJEgAZfYKngma6682PmCdiLqIIzCsGMpyfxF8Cs1WaNuwT9lFuW6c7TBgZqLltZW/A82OgDmHeTBahwR3fbbCzBojWWI7DP0ljRVVu8J9XbEByWm6NHzlgXo5V6SygfIJmboYdsSYwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39830400003)(366004)(5660300002)(76116006)(8676002)(52536014)(66946007)(6506007)(7696005)(53546011)(26005)(83380400001)(66556008)(66476007)(66446008)(64756008)(9686003)(4326008)(8936002)(55016002)(186003)(3480700007)(71200400001)(316002)(6916009)(478600001)(2906002)(44832011)(86362001)(33656002)(7116003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cTVrSE41TnNIMXZuRnRWUHRrNFUybG9hbXR6NFNCck1panBENUpNdXk5MTdq?=
 =?utf-8?B?VlNhRFpxQWFBQUE5K0YyK2JhekQwSWZCUnJpWGtuM21sWkM2YkxaWDBsWENH?=
 =?utf-8?B?cFUzTDMxZEJvZ3pER05VamczMTcrWU1TMU5uRndZd0JvUkxEME9meUZLRHZG?=
 =?utf-8?B?ekdVUkZOemxHKytHMjVoRjJRc0o2aTBzcGtBblRRQkx1QnVnTXNzMjB0WHk3?=
 =?utf-8?B?cnlYUGRNdmtFdjBsQ1pPNjJiUDRnTG5TVFlrTEtiZ1p0VksrQmxRSWprbEZQ?=
 =?utf-8?B?NzR5aWtRV2JtVUx1RnhJL1JzbFpPdmNUUVgzampqL1JIeUxld010VmxIV1NE?=
 =?utf-8?B?Q2FseFJrS0FxdENsWklQYzY0ZDhLZkc5UnRoOXZ1NW50ZFBTSkVna29uRGVR?=
 =?utf-8?B?YVU0MlY2YlB4ZEh2bHJWWGE3KzJtVVVjY3ZEOENMaFQ5OWFQNC9EMGlvamEx?=
 =?utf-8?B?N0tMMzIrZzVLVUc3R1kxYkFkelJIb2JudFFnWkxDUXNIUmhuSWlzSTVRVjly?=
 =?utf-8?B?VkhtZSt6enZ0SUM0SlBSdDN2WXdQeUdodXk1bTMzS0s3WUZnbnJNR1ZTbmtV?=
 =?utf-8?B?U1dSRXdoUUpVNEZMZER5UGVqM1puTXU2YkVmK3ppREVnMWtJYlZmTHJEaVB6?=
 =?utf-8?B?V0FlSmlDQitEanM0LzlNaVhzSUhXeVZjcmFadkNYMk9RTzk4OEUyNTQ3NGRl?=
 =?utf-8?B?UG1YT0pobzJ1LzEzWEFCMlUrVDAyS3UxS2xMZTBZcGFWUmR6Vm05WVVJWUhj?=
 =?utf-8?B?Ky8xdXhzcE1NNGVHNUZsWnhtNVZodHl2Z1RMNmJyTmx6b0xRMUNTWkdmcGhJ?=
 =?utf-8?B?TmVuNXVBR3ZpWkxSVlBrcEJKZTBVdGY1c2w3eUlJbW4wOFZ2Tmh5bm5xZ0h2?=
 =?utf-8?B?NkY1dlV2Y1FZa1hoNFBFVk5zeUF3MjNWNU5yN1NTdytFRkZsMVdqcVZHT2Zs?=
 =?utf-8?B?dUFRM3N3b2JtYnBNYzBVN1hKS2dQdzBhNUpybFkxNDlsQmpLclZsSTBmL2hz?=
 =?utf-8?B?dE5XWjNGYVgzSTExUmxTOTRDTUYwTGo5UHY2SFVUbzE5emh3c2JBOVlsdXV3?=
 =?utf-8?B?MlhvOFdESFQzRUNKSDVjU0dIVkczTjAxSWsyNXJHbGlnRWpOM2ZWQVV4MTNn?=
 =?utf-8?B?a3ZxZHlsZkJzUE9MZC9TWHp5akRRQ3dySTlqcUl1cnpHS0RtdzcvRWZoVXc0?=
 =?utf-8?B?MzhFZHIvVm15a3ViaEF0NkxiQ0dYa1dmbWF2V0dhOGVWaTMxUlZlNFM1OVA2?=
 =?utf-8?B?SzRKNlV6TUhlTGd3c2RWbnVnN1lGZkMydVl2SkNMMm5wZ3UxQ1pZcURoMHVi?=
 =?utf-8?B?bUVMSEcyRFVqYzlMNHRjZDczNkI1b09Ld0Nnazk0V1BpOEJPd3dQSWF6SUFM?=
 =?utf-8?B?cHhCL3ZtUFdGSWRVam1TeDRxVTBvdUJtT0lleVJtMlBOZHc4dFJFSElUanNJ?=
 =?utf-8?Q?aUML8Aba?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8902bbd5-0664-429c-c028-08d8c38ed99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 13:15:57.5607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: muZwWZtl/ha7/PZOjScE0YoLsKkw4De+Y7Ymqclqd9JJuXmxN8fCAwYn8tc5+Gf4cgdPsQrDJtg8cD8+tr3pxOG+rYbz/16Cc3cu2fZPwuBY6lTd1Cm4dkgacidl1+kX/+g8/uo9//702tfenUNxdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6225
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=N4X2Ge8j;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.105 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

> Hi Bram,
> 
> On 27/01/2021 11:46, Bram Hooimeijer wrote:
> > Dear Jailhouse community,
> >
> > Currently I am experiencing issues with the MMIO virtualization in
> Jailhouse, which interacts with the BIOS. I am hoping any of you can shed
> some light on the issue:
> >
> > Jailhouse reports the following after running for some while:
> >> FATAL: unable to get MMIO instruction
> 
> Where does RIP point to?

I don't know how to derive this exactly. The issue arrives from root-cell linux, so the RIP is not in the cell binary or in jailhouse. 

> 
> >
> > The region listed has previously reported illegal MMIO accesses. These
> have been resolved by adding the region to the system config. This requires
> all sub-64 access widths, as the region is apparently byte accessed. The BIOS
> vendor has indicated that this region implements APEI according to the ACPI
> specification.
> 
> Could you please try the following region:
> {
> 		.phys_start = 0x86dff000,
> 		.virt_start = 0x86dff000,
> 		.size =       0x0b700000,
> 		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 			 JAILHOUSE_MEM_EXECUTE |
> JAILHOUSE_MEM_DMA },
> 
> the size 0x0b700000 will make the page aligned, and the hypervisor doesn't
> need to trap. In that case, JH_MEM_IO_{8,16,32,64} is not required.

This seems to solve the issue for now. As I understand: if the region is page-aligned, access is possible without involving the hypervisor as it is known up front that this access is the cell its own region. 
If the region is not page aligned, an access should involve the hypervisor to prevent access to the page outside the reserved region. 

Thanks for the help! 
Bram 

> 
> Thanks
>   Ralf
> 
> 
> >
> > By adding some printk() statements to the hypervisor, I could derive where
> the error exactly originates. Apparently the function ctx_update(&ctx, &pc,
> 0, pg_structs) returns null. Jan, could you shed any light on what this function
> does? Could it be that the paging structs for the APEI interface are incorrect?
> >
> > All snippets are listed below. The system runs Linux Kernel 5.4.73, from
> Ubuntu 20.04 LTS, modified to remove kernel RDT support (conflicts with
> Jailhouse). Any directions are welcome!
> >
> > Many thanks,
> >
> > Kind regards,
> >
> > Bram Hooimeijer
> >
> > Issue reported over ipmi (see attached log.txt):
> >> FATAL: unable to get MMIO instruction
> >> FATAL: Invalid MMIO/RAM read, addr: 0x00000000870a9998 size: 0
> >> RIP: 0xfffffffeec8a9998 RSP: 0xffffb52400177d78 FLAGS: 10282
> >> RAX: 0x0000000000000246 RBX: 0xffffb5240dc8fe50 RCX:
> >> 0xffff9cef966f4000
> >> RDX: 0xffff9cef966f4400 RSI: 0xffff9cef966f4000 RDI:
> >> 0xfffffffeec8a9998
> >> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> >> CR0: 0x0000000080050033 CR3: 0x0000002ff2842001 CR4:
> >> 0x00000000007626f0
> >> EFER: 0x0000000000000d01
> >> Parking CPU 0 (Cell: "RootCell")
> >
> > Modification required to root cell configuration for APEI ERST region
> > (see attached sysconfig_dual256M.c)
> >> {
> >> 	.phys_start = 0x86dff000,
> >> 	.virt_start = 0x86dff000,
> >> 	.size =       0x0b6fffff,
> >> 	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >> 		JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_UNALIGNED |
> >> 		JAILHOUSE_MEM_ROOTSHARED | JAILHOUSE_MEM_IO_8 |
> >> 		JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 |
> >> 		JAILHOUSE_MEM_IO_64 | JAILHOUSE_MEM_EXECUTE },
> >
> > Point of failure (see hypervisor/arch/x86/mmio.c:108--121)
> >> struct mmio_instruction  x86_mmio_parse(const struct
> >> guest_paging_structures *pg_structs, bool is_write) {
> >>           struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
> >>                                                             .count = 1 };
> >>           union registers *guest_regs = &this_cpu_data()->guest_regs;
> >>           struct mmio_instruction inst = { 0 };
> >>           u64 pc = vcpu_vendor_get_rip();
> >>           unsigned int n, skip_len = 0;
> >>           union opcode op[4] = { };
> >>
> >>           if (!ctx_update(&ctx, &pc, 0, pg_structs)){
> >>                   printk("ctx update failed\n");
> 		<<--- FAILS HERE.
> >>                   goto error_noinst;
> >>           }
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66636F44464F9BEC17A8AAFEB6BA9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
