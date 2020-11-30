Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBRXGSP7AKGQE5MAZL3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439D2C8519
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 14:27:35 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id i3sf6839547ljj.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 05:27:35 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606742855; cv=pass;
        d=google.com; s=arc-20160816;
        b=o6xjN/3xDDMfNMkraxCcbWaNEb1rBI7A/KjggPjZSaddVYx1H1mS6TqC9BEpt+rXq7
         FM8qxeXumC++HBa+C85DC/oW2+9EZVBi6KYkQp0fMlHQqg/0WJSeTj8naOUJFTrf3PVc
         Jr3ehSryanOQP0tiXXV9GReU+q8DF0f10CvvzG8+unhjI6INT+i086OwYiuw3o4wZSxB
         cGwaEnHJyfls8CW9RJ2t77BBkC0vOtxdCOXQyuJr8OLU0A1XO4axo4fjhQIhNafkZUyE
         jZjmAYC6eGoV2hG2d1xQ52utAufUB/Kaza6DnQqPA9aeFnO0XMv2TwOCJlcwVFUXDty/
         Hhcg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=ImrqkZo77jDzBfavs4zXWZSLsQ2YYK81McPuNDtcGE8=;
        b=pR7bUt05rbuzjL9Ol2Av7EZesckIXzJxSil+o22uxCzvBWnbp09QYilfXTL9F9PeCy
         FPggw7/np9alUpeS77RNz97RY5nAvm4K8pb2fnZBFtQhcQf+gW3HxIENUJ6bvwaZoetq
         8Xz6KBdOfN4ZifZAvwzxKz3VjG2w9WpChDvmlpCswocrLAfp3Gq5xkc+Q/qOPd61sDnX
         MxmyrY2BHCMB8sXNFsF8ml5moKOjZ2Rb5BkNQ8wEBOFyCDmIDc3eh1TfY3s3VyPzcKI/
         edXHTb4THGB5ywShs7AElLIJwwuhCE70gzQicgyS043EI3pmoqB2ZKSthP0h7gucgAjL
         3BUw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=hbm1IfwJ;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.91 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ImrqkZo77jDzBfavs4zXWZSLsQ2YYK81McPuNDtcGE8=;
        b=WJgvVHBgJO6Ncqw0mNqmxJPY/krGOz1fYAMu+XlljgOmNfT+zeOBpak+BNsQTTrxk0
         QePGuBmtcJUjO7HV0a7vpTZ/djxtHeE3mtpgd2Y2gZcD3hadMndhOXm+1xUYr6xLvUwP
         E2AC0xNhivvPqKRGhc7lSvmb2yxqb2/AaZ8dU5u93JM+JjQ/dOhAzZpTEk9OXGJB7BzI
         Xuf/5X+R2NoBWkODJvb5wzfq2JTVJfLtV+AcBkgZcyrlAN4wyQN5Rgyro+YW17Srv1qr
         JRN3q1QTLgda9AjGJONWf3NV85JP3oN+MnfegD+wJzr36iGI1wPsY1yCi1LBjMHOCPmS
         uNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ImrqkZo77jDzBfavs4zXWZSLsQ2YYK81McPuNDtcGE8=;
        b=pOzGXcE+rTj1v+4OZaQxmmvS1xNVZ9aEvsRSrI5q3HrHmEeTUEjfikbvMwqjUu3VH8
         59MDQyf20rgXX4aaK9jtgAbnOl7fAOLJWtlNbfhAcqu85VSnSdGhYmo7X+dokJJz00iH
         DmzwUaAr7FAmiHZjl0uNbgtuP9vHmu3jYxODfvJAlNL/lIZelPXpChysgbvQdra5vUD5
         o2ulGKIQ8WyX4sNKvX39g598a794NMP/ZujD/CIY3GICpCwH5jn8RUrw1wJOjiPlegbE
         gr9SMK9r5cN65FGcT+YQV2WXKdBsASd7fyxr/efGS3h0LyhJ8c9XDpootl6PTBGTvHdd
         K54Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532z/n0Tz6JQgQAOc36uNuHeUKzzwgbBJKsYzh/pWx3mbvSWDZuW
	ihTrJjHvXI8AZL33/Un03bs=
X-Google-Smtp-Source: ABdhPJyKLYmKckeGG+4oD2eZBHTe4tT2X2An09GUjzlHd4M6JQhyH43BQ+setB49wdv4ZSzXi4BwWg==
X-Received: by 2002:a19:4915:: with SMTP id w21mr9436764lfa.57.1606742855119;
        Mon, 30 Nov 2020 05:27:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ccc2:: with SMTP id c185ls3256390lfg.3.gmail; Mon, 30
 Nov 2020 05:27:34 -0800 (PST)
X-Received: by 2002:a19:8306:: with SMTP id f6mr9352280lfd.262.1606742854026;
        Mon, 30 Nov 2020 05:27:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606742854; cv=pass;
        d=google.com; s=arc-20160816;
        b=IYCcFmsAMPpqIF0HfF1RZCTcnyB+LpIaajC1BzaFgJtGkrasvF48pLc5C8RJrJXQzK
         G+MNdbNwWNVrSJlLpyREeuVv/eUJYLC1nfA2DzWeOHc0lgRHY7irInr+SpSkT+7JOCej
         URofz9sjfYz3abDd2NaAqKneQhEaJCnj/p9tVckZSL1JnxiggJH+KQAmz2cBWrtswwiw
         Y70BKO6cfkCq6g7AOA67kFKZLYCOIMuPY7AeK8dlyK59V+97qvRDW3da/bakWlEuNsUS
         dZrb7zHQ0S25v6/bag+pG1LXDopCbHk4/snj3vwSJEOvC8Lg8nvyxKQUrVus03Skrq8s
         xh2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=zdQSl9EyFUmm/PqSAf/B1mz6wlW63/VbZl6CRTag2ME=;
        b=MMyS6DUcJMBr0Sw0C/uqVEIwwHSHRsqwWsxgzEOGy4JzQILhJBI0/63LyjM4kBsxg8
         ygLcgogsE9gkrIBmAgZD3gxug2D9WxmjkC+uRij455IEeO8SRt/ofzl6D+5Q9jGmE9Fd
         BFM2VwsVDDyDl/6Bk6guza+p1t5BtLyW3oxme39qSgYUVO90MpKh55x8oPTSqM6rhNlu
         zYNWtbsFFyVbhIq+vNDrFAgxwUUpO1GMYUoRkwF8AwsX1TXpKzgoWiFGQPkGHiyg5QDg
         czDgdDGPMnTJ/Aispi6YL4LfxDrtdpGIVziTyATbg/KE4gWRN/5FLTj9fO1a+Gup16kZ
         llhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=hbm1IfwJ;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.91 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120091.outbound.protection.outlook.com. [40.107.12.91])
        by gmr-mx.google.com with ESMTPS id 23si372022lfa.10.2020.11.30.05.27.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.91 as permitted sender) client-ip=40.107.12.91;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrWVx5wm9mPVcjuSndqRPhr0H8CzSvin26NE53GMCPLuUjhUvZXR8qpL3nOkG9nM7T7meKj5iMbqHfI3bF9XT3KX59me6l/N0m3Der8mafbrqZFlN2PH7QsfAtOFhgzIgQqQDMsqzARc40eDDIZhPnNQ4QDdxAGVrY/N4yx3k8PhFCmobs+/zVGoOvx2qN86DrQg6LzADPlSR9qRyU6M9LGhVEbhLYPIfiqB8J4Ze6+AcPXvVzLds3b6k4QmwS2DkSnq6QZ51YeGIl6z8jZSsRUasuiH9o/8ykNoxeh5rdETslplHOKmSdRe35kA6HAs9HCd2SBQPxtpj0NIZFv/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdQSl9EyFUmm/PqSAf/B1mz6wlW63/VbZl6CRTag2ME=;
 b=mH537ppKmT65jDQpepiJvi/qk3C18HN7+XRKMF0B59seSChe3PsytJXKgybG9lsaNda5QAvFDAIh5d1jpNTUb2fIEUgMJVn/ragploaGqNWQJs4E46tMohiHgFdkDMO8wmvWonCDV7zfwZKEr/D8asiUGHGvIf+DVHTThHy4sykD+winsdQCM+W28GQdYsme6NcIdqrnO3L618yByEN5UoDxCC2yC2xy6TKl8Bmfvs2E/TIEvSUmAZLtaDhK76MCmNuPIagD4AsoyWKreWoqEz8Q6Sy5TIb4kWqViAwutriGD76Q+Oi2AztOD/j0RO+stNEBwZIDDtghFh6Z14lGqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5148.eurprd03.prod.outlook.com (2603:10a6:101:28::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 13:27:30 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:27:30 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse: request_mem_region failed for hypervisor memory
Thread-Topic: jailhouse: request_mem_region failed for hypervisor memory
Thread-Index: AdbHA59mMTyyeCVKT82fCG3n0EzxOQAER0eAAAD6ltAAANJOAAAAFT3g
Date: Mon, 30 Nov 2020 13:27:30 +0000
Message-ID: <PA4PR03MB71845FD4327C041761649880B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71849151EBE032D778289555B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <b2243b44-31d8-5e2a-5080-6658b5d1ffe4@siemens.com>
 <PA4PR03MB718417E5C836D059FA4DC909B6F50@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <36eaf13d-b428-8cc9-45df-9386b7d82c23@siemens.com>
In-Reply-To: <36eaf13d-b428-8cc9-45df-9386b7d82c23@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1f27e90-a11a-4557-c2b3-08d89533b063
x-ms-traffictypediagnostic: PR2PR03MB5148:
x-microsoft-antispam-prvs: <PR2PR03MB514878D399D3CF82B0C5E4CFB6F50@PR2PR03MB5148.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3s3kIMByBdjmWaPeFfKf4qdkA06Za6uCQ2CkKos+zPFJAaNzriv6t02hI29fGBgqyZutwIP5hpa62sSBG/EiIbtsf7DsQKBupxlWN9Jq2jik9UEzDnaij+hPDiH/8+5PRFJcfiXhncbh+f4EX5kRO6lO0qkrSCcZQBqY3xMGEvyU2TviKyx1+QCqVdzQRHVvbCXdSAI/jniV6U6fzW2tZFh1BS7X9q1Cz/kXKyRkk/4Qwj/R88diWHhfZMgEO0BzWV5r0WEDnXuAhUTvGMnrlNtECZvszZK36n87CqhLhnybxOmpPUSuW3ODnq/meqIOLvIoBHEflgD5XTCiNKFK4A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(53546011)(66946007)(64756008)(76116006)(66446008)(66476007)(66556008)(33656002)(2906002)(86362001)(71200400001)(5660300002)(52536014)(316002)(55016002)(9686003)(110136005)(83380400001)(186003)(8676002)(6506007)(26005)(7696005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?b0dsaUpRYm8wMjhqQUp0L1JoajhrcHdBQ2Q2cmhWQTZYM2JYRFFMeGhTaUhl?=
 =?utf-8?B?L2ltZEx4bDJ4aS84RVZyV0U0WDMwNlM5U2llQWJPOVU4cU9TVXhKQXlqWVd0?=
 =?utf-8?B?MVdpcjFxcnVvUmNEVGI0SVNtcEM4M2wxVFhLRUtaQlRod0I2UUlJdGltcGRG?=
 =?utf-8?B?MU04aW1vSDMyYU9RcVZpeitDVVBIaGJvUXBVRzNkRnpjYzdualJpaDBaOHBV?=
 =?utf-8?B?bkxzZTc3TGpLS1BBL3RMalkwckFaR01pWkVjN2gzKzV6cWJocDg1bVdveExr?=
 =?utf-8?B?QXc2RHhRbU9QWEs0YVd6WVkzRUlid0pZOVNKaGlaMXlwR211Z2VXcjhpVGlz?=
 =?utf-8?B?U1RaZExnTitYY0k2Rm42amQwWnEvUnlsRUtEMUNkNFRmc0IzV0VSYm9hRkE4?=
 =?utf-8?B?S2VDeXFwNGRWU1F2cGlRa056Q0g4cTU4V0NGbHd2dEZBb3JoRllvL2R1cnRK?=
 =?utf-8?B?V1p2bEZYWG90T3hxL0I5R2NSaTJPMjVNZTdGdkI0dlBaTmVLNm5uVjRlZ1lH?=
 =?utf-8?B?T0RtQWdDU3QzRnNZS3VmS0pxRVgycFZab3FCT1dvSHNldUVscjNza1dyc1NU?=
 =?utf-8?B?NDlRcHBvWmIvY2Znd0NPWVpxeW8valdrNG5uVmw2SlhZTVhIQURsVnNSeUxn?=
 =?utf-8?B?ckpQcDM5WTcwUkFvMG5UbUh3eGpWN2lUZTFoOE8xRnNuT2dKSnFiZzBjOUgr?=
 =?utf-8?B?dG8yK2xmbEFlVHdqV1MzaGpxUys0OFpVY0swZFVmT3p6N2k5RzV0L1dnTU95?=
 =?utf-8?B?aUNQWlF5akNMakZqTW95SFFQbndjTGpjaDBqRVhscTFnN1MrSmcwd1YwaWdt?=
 =?utf-8?B?VFJoa05ITGdHV3NhZ0VaQ0VrTllGUzh4RytIalBkZGtDbnBXZVFISGxJKzdu?=
 =?utf-8?B?VU9XNG9wSDdScEcxdjJBbFBPcGFHZHVpSjdmSjM3UUZ3ektpVzdTQndiTGk3?=
 =?utf-8?B?WmhGSjlCQ2d5MnB4cFdUK09QMlBwSTNweHpvSGVpVTJjdnRyMzlBTzdwSlpX?=
 =?utf-8?B?S0FObzNlYll0RnprYk5VQTZLd1VGdWRmSTQ2VlVOQkdFbWt5SFV6SU44QXBB?=
 =?utf-8?B?NnNaUnUvSHlMQ1lQam9pUTBieGhJVHFUWmE3K0wyWHpJYlB0bThidGs4UjFC?=
 =?utf-8?B?MWc3OW1RMGZtSEZyc3MzWjV2RXlHSnhaMmxBL05CTDQrbGFMeVNyanFLajZU?=
 =?utf-8?B?d3N4bzU3c3U4NWUrWlFOU2pud3FqL0lYYWZnQldUSUFvQS9YSUVNanJVZDdZ?=
 =?utf-8?B?T01qVlcrTzlYa2Jpbi9Vc0g5WVJrUFEvVERXUjRFSW5xSHgzV1pCbTlNbTRB?=
 =?utf-8?Q?ooyXNE2JlmVnA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f27e90-a11a-4557-c2b3-08d89533b063
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 13:27:30.7088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMvMtOFcR3j+DI1MMyYkNj4p+wO+N3ZWkxCOTRscW1nRvpcUBMup7FdZWZbTClpdn1BRg3yR/+Bs1OgLSdcEeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5148
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=hbm1IfwJ;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.12.91 as permitted sender)
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

I'm using a Qemu env with no bootloader, just a command to start the env co=
pied from the jailhouse-images repository (start-qemu.sh). Any other idea?

-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com>=20
Enviado el: lunes, 30 de noviembre de 2020 14:23
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 30.11.20 14:00, Sainz Markel wrote:
> No, the content on /proc/cmdline is what follows:
>
> / # more /proc/cmdline
> console=3DttyS0

Then you need to talk to your bootloader, that it eventually accepts your c=
ommand line extension.

Jan

>
> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com> Enviado el: lunes, 30 de=20
> noviembre de 2020 13:32
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: jailhouse: request_mem_region failed for hypervisor memory
>
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you recognize the sender and know the=
 content is safe.
>
>
> On 30.11.20 11:31, Sainz Markel wrote:
>> Hi all,
>>
>>
>>
>> After being able to compile all the elements, when I try to enable=20
>> the cell, I get the following error:
>>
>>
>>
>> / # jailhouse enable root/jailhouse/configs/x86/sysconfig.cell
>>
>> [=C2=A0 142.758697] jailhouse: request_mem_region failed for hypervisor =
memory.
>>
>> [=C2=A0 142.760507] jailhouse: Did you reserve the memory with "memmap=
=3D"=20
>> or "mem=3D"?
>>
>> JAILHOUSE_ENABLE: Invalid argument
>>
>>
>>
>> I=E2=80=99ve appended to the kernel the line =E2=80=9Croot=3D/dev/sda in=
tel_iommu=3Doff
>> memmap=3D0x5200000\$0x3a000000 vga=3D0x305=E2=80=9D
>>
>
> Does that show up without the "\" escape in /proc/cmdline?
>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>


--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB71845FD4327C041761649880B6F50%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
