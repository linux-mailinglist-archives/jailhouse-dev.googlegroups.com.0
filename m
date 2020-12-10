Return-Path: <jailhouse-dev+bncBCJN5Z66VINBB2MPY77AKGQEHU4Q7DI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F52D5449
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 08:02:01 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id m16sf3147384ljj.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 23:02:01 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607583721; cv=pass;
        d=google.com; s=arc-20160816;
        b=AIEmKji4QXFx6hBKydDCR+zxIz5Dbik7NF4avcxoc7s0TKclQpzuCgEFTbg2ht5wQY
         NSWopCOSslYqG6/0ufolZSkHwA9MUjeKjc6cAbPaeWZUwf6czRaz30bE5X7aq3IJKYlE
         4DS5G7HMJbuYYnVcD1vVNlZ1WfPiu+GvoPTcaSz0VRcWHvn1rGZDMI0Y+DiwgZKyYgjp
         Q+RJv4rAU5LJIgS3KB5r3wyQUq9ULcYzLeoaf93gFe14oKj6RaHn/mUk+CHbX04VW6Mv
         xxgvkDNiJNigEp7ijYWs3AT8yS/cOBCdtydRVHi2P1c15zsKNyPC7uJmlPXxXJ0jNgi+
         dUrA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=6v+8bPtg1pvO65lTNF3Q7O06uLAxQdoKuXwnLUdCFik=;
        b=DYegpOuJlRN3sJiwV+eg6I3t9Bz8iSvh8Hzt8PhuTSdFNDYq8jeNIc6/bwDLmmc8Z3
         vdv7ScJTUQEMNXmCdPFXKaoMQY1Or8B4D/HpSJ+NU3Spyfo6thunW1YW3xaErmW352xq
         H09eaEB0b5mgQECFNmlbFLNECUtNbsDS1fkDVt/DO3KKhXdYjuUjxxjBMePZrIbd000X
         MzZ7QqNbJKjOj+68shLEPRtBHebQ8A3qa1dOoe1Y/FUgRijVEQYtOmzHyN9mXP8/yiU5
         9wbXotltS5lRhAcTeZqmxks7xVWuGWh6pZOmQrl0igb88bSr6Fwv9QMW2TSb3OYZ0KEb
         ypHw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=rKROqmnz;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.15.93 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6v+8bPtg1pvO65lTNF3Q7O06uLAxQdoKuXwnLUdCFik=;
        b=Xak4n8aY/yf8amU/QzRzGFNHeYUxALmmNn0UJb6p1tL3lPMX2+v343HFXNfjFuV8kE
         nkQ0Nl7N9RAz1/9ecarrrntkf29vjH6enkw0SbQ+QzL0XNIwlKlTJr0JP4yMCK0ZLTPd
         z5++WsPJZ869ovXB6nnbHE6ynOni5jeJLjGhD9Hl0UTkRBQrDU27npgtAF++cASRAG36
         wfQT4pPCfXDTOSZxhxPha/eznWAPxHCpIj3X0CZFUhtiOUK/yGmNn0N+FzqAgd1XXMVb
         FWzsOFRo1uJVQotD/tLfpJOZOYjbMut2UF0GwoR8vMc09paUZJOXIEUKYpt8/2b5sQQZ
         9Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6v+8bPtg1pvO65lTNF3Q7O06uLAxQdoKuXwnLUdCFik=;
        b=FGVXQWjlFK36QBFC1oXlfi/1CNQZKBIO4uHPTuDBShSt9JlgEUUa2E6O9323+DHA9G
         ysQzCOFw5ck1eAPb3Cwle7o2zpsB/hssr/B6e5eXcpTYSa4ZcL1CLFPiJDJcm9FWVGi2
         FAzlpaHExhEmlTodiBCEYNwOvV4ikMrww0AqZhKK7l7dBTQDdURzvgmsefv8TMZMVXzr
         HqlS7yuyXNwkioLax7xgh4Zl7CbFKoJG7oNCpc0VjHo7IPbmwnbLrEno/1vNWEl34Gtn
         +Ur9B8eL4JTVLhdO26LtBV9mjVCTgkoKeaodHV8nygb53dtVQJ/jkGszr6BTXjiI8qxt
         wNXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531m/Eo0lYNzhLsQ0vckSzRK1KXKreKoVbut7jKgIIEHYauZh9XP
	1bc3XUf7fUaOVmycnR+kWG4=
X-Google-Smtp-Source: ABdhPJxuCQzYu0r2usVEPD19mNM0LHIwEajqbm47kVfkIYOnvcrzDoEsa1dDtTl+DEYHoD0VkRVT0A==
X-Received: by 2002:a19:d82:: with SMTP id 124mr2101136lfn.604.1607583721470;
        Wed, 09 Dec 2020 23:02:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a5:: with SMTP id c5ls149025ljn.10.gmail; Wed, 09
 Dec 2020 23:02:00 -0800 (PST)
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr2656890ljo.443.1607583720237;
        Wed, 09 Dec 2020 23:02:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607583720; cv=pass;
        d=google.com; s=arc-20160816;
        b=CC2O6pmp8nZEztKqpRg6bELjnogKOv7R3s3r3LyG4IL4q2Cf7FCgdl171gKfkd4fn0
         wbzo0RjIZt2WblBf08OcDhP6NshX13PDFf/gOS1I+xCE09WUpEf5eeab8VVYZPBld6f/
         2S8VCRypYeT62Ti0k+eljQ0aMM3XfYsUGoiUj1U7RBGvXO0jgtsJyY9VQ7LaTwxCteFU
         dNCSjEMjX3VQC9wZmQ34+mJrpXQ7xGji/hlP3lZnnOzukKDw3VHIoNywMjZxOsM1mIEZ
         sNEkJqYHcwAvMNoq9/eMQ9t2n108q+s6bU0j7nAOFnXIOikLVzDT5x/0RmhfCS+udHzO
         b/XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=7+/2azIaCefITX4lE0PHcpcN/gT8vaxiN6SWcuopE7s=;
        b=FXehfq8DTkCM9ABdGIaBCFM1S5FFztOj6kcXEy+ggSvAEXpXuwzhRJ+CA6KhqzZrlm
         dVwycRmPCFNcNfB93+RoFcaMV6bx2wTTv472KRxqZnK3gPyLY1lsQgiBFfLIhPHliXsu
         M1UToX0+0xKpLeSFkyqk4NyuZUVzF+9BJ9n/BBQpjMeMyySBrJohfls1tfL6WJ2UWE38
         siSwmX1BJ7YEWtAInNYrKJG0vbYD+pX4qzv/YCGtJZNanekeL6mU+rFYhgjIiYHiMio/
         HSNiDAcufRo+gMhCV0ilJR9A2+cH/2I8bOTDNAQEaBZluXPB1Sg7aCGVf53SDTxEFAm1
         96mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=rKROqmnz;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.15.93 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150093.outbound.protection.outlook.com. [40.107.15.93])
        by gmr-mx.google.com with ESMTPS id h19si150859ljh.7.2020.12.09.23.01.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 23:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.15.93 as permitted sender) client-ip=40.107.15.93;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOqO85NdWApivYtCV9TFmlca/9X4eV6tQsgZxltln3LykZESK+CXsAwAruQMnvtwbAzEFFKASPj5zfQa+uBtflx2XACWfQZYxlpga7dd44FZiB09ineFuU7RB1yUMqQXeVsWqFU6sLZ9Fm3MLzkyJc9cH80ST7eHulw3kiafe614MlnLg9/6N4nlUpnOP7jXDJcYP32neixW5K2sykyRsshWdOJFSX+VOyabYTOyoPAIUU6ParMs3dDNrBtrp4x0aEFqdVtWkWtVTAtesy7RndsVVgJsV0mv3LkGS2/o48q64sGC2E5NJ7rePaRdtqUhiEW532vHl7MT/Fx2fS8XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+/2azIaCefITX4lE0PHcpcN/gT8vaxiN6SWcuopE7s=;
 b=gr5jerwwGSJ+L4qzqUgLdSly9rEVRaWSZd9zkZ+EwxpoS/zt/NiA6n1LqYjZNTm5Vphw3fMHubEm0s3atV2A5rNrH3ywhQ344iOusaveHanZDMjTolxsDRVWhkb8cxfpb4Cc+R27MPHZMrSZtA7p1YqCbcaa8ceJTDXpYh59EK/iMCGo7s1rqSKIABlpPqWf1mlXuTa7KtM3KLPMKX3SAwf6VxG4/5xP+OhEqtV+KMpup5RhozWBJCmH9muOQFKHHMpQsOMtRv0X6SMf0iE8qhnMze+Bju5IDGQpblJFcNEX8nKiI+Z3c0yycNZ8KS2OZ/yiM/kBUMphpjJfmCf5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PA4PR03MB6926.eurprd03.prod.outlook.com (2603:10a6:102:e4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 10 Dec
 2020 07:01:56 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 07:01:56 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse hardware check error
Thread-Topic: jailhouse hardware check error
Thread-Index: AdbOEISuarlPAbS2SqyLZ0yti5cZUwAsR7AAAAAgFtA=
Date: Thu, 10 Dec 2020 07:01:56 +0000
Message-ID: <PA4PR03MB7184C97813C5A21C345964DDB6CB0@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <92106761-1676-12d6-4d79-c1d9096e06d1@siemens.com>
In-Reply-To: <92106761-1676-12d6-4d79-c1d9096e06d1@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e11706ca-11b4-4429-9278-08d89cd97b7e
x-ms-traffictypediagnostic: PA4PR03MB6926:
x-microsoft-antispam-prvs: <PA4PR03MB692690BE6F71219F710C415CB6CB0@PA4PR03MB6926.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9WvhGRHeJ4JjZx1eVCgEgk0yJG2uQCMdV+qS+hOtSXfe2hMruPPqOMM0mm3/Z0uthXljn4kpVPsyDhWfNLm3V3pdnQTcJZ5OVyGDSQmr3Pvr52XoaZ8E9czayS+vP3W7Gad4arJQUndPpp0NNIm/CcHxEx2oolYip+L078dXoWAxtcuh0PI98aoHoL4mPQ6vk+rgPJz5c2EYc2zBwZhicK01xBdA5qc6+LZFrPJmm2G/bT8r/rD/XFfaTiZJlCL655W1HoyVc0VL8cuC7AOed/MaaZnlIuxXScRMjEVSj2OWnOCtgav95+/zZhRmglOC4b8inPUsqHKXSkTiHzj11w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39830400003)(366004)(66946007)(55016002)(66446008)(5660300002)(558084003)(8936002)(316002)(6506007)(86362001)(76116006)(64756008)(66556008)(33656002)(478600001)(2906002)(186003)(26005)(9686003)(7696005)(71200400001)(8676002)(3480700007)(66476007)(52536014)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?T3J0TjFFcjlCV0cwZ1EveFQzUGg4NlRqRFE1Z1JWZjN2dUVROFFXa2xqSjJP?=
 =?utf-8?B?eHFkZEkzalNaNjArUjlUM2RHbW1ZL0F6azExcE5CVC9KM1d1QUJmYnJ3eVhz?=
 =?utf-8?B?VUxiMURsb1ZQc2MyOStpZ05kVWRicnhUUkMvMVErKzhVYTE5M09lU0czTGpB?=
 =?utf-8?B?M1NSejJqMithdk9ZZTBHcFVVT1N0UUJjdEU3MlgxalpEaGdhODZKUGJvRmR4?=
 =?utf-8?B?VVQzZXFZMkY2NEtxcTNvWVlHdlhTYjNDb05naXJGZ2pXQWN6TnM5eGx1R0l5?=
 =?utf-8?B?aFdocUptVk5BS3Nzc2ZyaE1HbUFIUFBYTTZQQ2drUFhqeGxsNnQ0UjlVMDFi?=
 =?utf-8?B?ZGZOVGpnTFVmZ0ppS3d0a05qbCtEaGk0cDNXM0IwUzMzV1Uzei8zWlVUdm1B?=
 =?utf-8?B?Njd1S2NzVTFOTkY3ejVhMmJIWHQ3a1dwYlRZTzY1YjJGczlXaCtPVHQreWF4?=
 =?utf-8?B?YjBDVG9KVHBtU2pJZGYrcmNCRGVudk5SYVpJdkpMUWc1amk0bVpHdGh1c2lw?=
 =?utf-8?B?YXUzRDBUdjM4WWhlaTY4K2k5TDluTjJ0eXIyUnBtR2RPVVN0VHpxV2RkYjMv?=
 =?utf-8?B?ZXQ0TVBRbnlKZlJ2U1hqaThuRFo1N3RhdVNOc2RrMm9XdzV3aGJCNy9MTHcx?=
 =?utf-8?B?cjRxZkxkbjNPQ0pvQ0syWXc3TytjSElxcEkwSUFwV1F4Nm5RSEdJeHRFZGFB?=
 =?utf-8?B?YVR6bkorWkEzKzlOTU9ZVFA1RmZqVUx6ekduNHJtZzR0TW5YcEMwNURZcmJ0?=
 =?utf-8?B?RjNJdDd1d0IveDJTYU9ieHFmNktSM0pkZjBUMzF2YS9zc2c5YnBROFk3OUtI?=
 =?utf-8?B?cnVycmtQWkFlN0hWeWNqVUp6dmdqN1c3ekFYd2xkUmVmdXVaeTNTa1RLM0ll?=
 =?utf-8?B?ZW5NODVOMURHQTF3MzMwYjRTWnJsbWVCcWJZc1VIN2FqUktPQXdLNFZwWkhK?=
 =?utf-8?B?VDVJd2xpUFVBUHFWVnRlUjVycGthMEk2cVgxaS9FVVFTeTh5OVRYYjlqbm1m?=
 =?utf-8?B?NWFLOWNnaGt2TjZUNGoxT2pGaFd2c290T3ZUenh0QWxCYW41UjZvQzZBU09P?=
 =?utf-8?B?Tmtsd245NEk1eDhGd215NisyOGUrWFZwNmV5SUQrQ3RycmRHMGpwRmI3bVNn?=
 =?utf-8?B?bVVBRzFtVGwyN2FuN3VOV3MvTzFqQ1VXTHE4TUc2M0ZIRTEyK05na3hnUWh6?=
 =?utf-8?B?U3V2dmlHQ0E5WVd5R2NCYm5tVlhyWjR6T1lhSDNoQU5xai9PNzBXOG1MT0x1?=
 =?utf-8?B?MjZkNHRlQ1o0Znp3RVgzcG5WdE1zUmJuRGFmY2dMUWUzVWlvOFUxSTQvSklN?=
 =?utf-8?Q?XGbBMLe7DOQh8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11706ca-11b4-4429-9278-08d89cd97b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 07:01:56.5558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sU9WIUdfBiGv3ljFVSMzGeDnP9du7rQVHD2AyqaFwhI41InnILE26sQW74RVu7otWvuIMrmyygOZYz+DKV9WwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6926
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=rKROqmnz;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.15.93 as permitted sender)
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

>Are you starting Linux with "intel_iommu=off"? Don't do that for running the hardware check, only when running Jailhouse later on.

>Jan

After removing the parameter, the error is the same...

Markel.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB7184C97813C5A21C345964DDB6CB0%40PA4PR03MB7184.eurprd03.prod.outlook.com.
