Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBAG5TX7AKGQEOXQ3HAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E505A2CBAA6
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Dec 2020 11:37:53 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id v5sf3109288wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 02 Dec 2020 02:37:53 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606905473; cv=pass;
        d=google.com; s=arc-20160816;
        b=dDu+FO61gIesD2ljy3JLS3b+qFr1w9cFqYGOZDWsUd43UL9CnGTTctsS9NWkfqHqHF
         5wOkIPacolHw/pGpuxzhyaJfpREYjjFBcixQL/2rs3Y7jfbIHgzVvMrofglQpsbj/mRv
         8uPhUO182PJvWd7slNnvoWLzYDMHBr8h+h6AZ4GE7PTfPzMNeJh44vDhDLQex9gCKRZl
         T+rrHV5pZzhewBoLJ2y7/06adejYNyN9mx0n77vsEf3GyJXbtFN8cPMp6gyR47rk9eel
         WAZGYKwvqJ2saOr52/+2Qh+oeES1tDse0xGf+fsEAvO+DNSSerzfosNKfr66h9Foyn9C
         BZQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=d8Hitvb007v72xOfgHgF+O0Ptx/3C4JMy9uZWWhkPmY=;
        b=qgFrxtWnPehGVjdtxBWiHMGb0rNiioLx8adrPxTSQHS/BBCH37vcOCymCAKCh+u03n
         K9C4wxUExt1ROebFwBHLwdNrbEP8rOC4p5ATnAohUuwmQY+DLz2+OHf6GxOYQBihj/vu
         B17tCrwsWdmAlhAq1lzn5iSKU0nomLh9I0iCNrvnFJFAx+8phzq7EOqeMM7/4s3yNHr7
         dPmAne9hrnwm/4fCTUc4/csoJmkha41nJkroKdSnv5f9Ao294iior/vVfE8AL9hJhkZJ
         QzQVTMmsenpPpE2GXrugZnEWOl5kkV3FrutnjBSDpBPQlH+fCqZFMAwm9n6d3gLqj2H+
         KHDw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=WmRX5N4k;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.134 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=d8Hitvb007v72xOfgHgF+O0Ptx/3C4JMy9uZWWhkPmY=;
        b=Lxaa4JSsAHGxxwsAajZQ/8x85yUO392KfRbIQWN72eiBcW1FPUTS4s3omg9ICL2vXo
         WX/np51QVj7G1vMdhdlJwnXuCrNxN+npENk5NOXoJvuzk0T+sj/tVvPqNJXy2EHooxHk
         VJuLIx+kVgjzAYKPNITwM9V10iXV7i+2Xh6KJLUUIoDgWYeKUxKu+stnRdp+kLb52KrC
         iaQl/f12iTG8DIFBTtzuJsT2u3KodZ3RIjV614SbDRErRviA5HmaEVhnJttIeVREY8wY
         kdgDzx8xsNL4hRdFvI9GBEYNuaVQDf3MlPukrUSadF9w/cyCShPg9EFvX73WYK5dGi1/
         T0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=d8Hitvb007v72xOfgHgF+O0Ptx/3C4JMy9uZWWhkPmY=;
        b=kosw4DkeFvG26FEX0mnESzuRnWQxcot9w+N8hJI66sscVCMv4h4FnqxrwlTfqvPKPc
         YrRu7yu3Mu3uel5gFYwTjJpJfJpRgj/Ds2ddkfAAvcZGImyTyLoCa8JDoefKeK+aayX4
         mqTk0+pzjFKzteOFsDuX3BJAdFAExHRDtY2kVPfKKhKVeQri2nkd2zokNrA00zWzcYOh
         ytR/Bi78tRHGsuK3xAYNwnzCaxaprzbWfubRir8NesaNMVmFoB+ZdIwTvi4ySwA+7Obh
         LIlvnor0B/iU68hUrG7wIZigPElv/4oLWzH3Pe4z/aN1zIHSVuHJsUEdJfYibmjY9Nnm
         524Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530EKhepqEbS6hCZmu4mIqOjUQk3EGJjXqYu0jVFl3iZ7qO5Zzy5
	FlpN+Nh/HRPfOBmAOCHZwxo=
X-Google-Smtp-Source: ABdhPJx8IH9i6k3zLTs//izulZYIeSf/H5WAQo7LVDTXF44MT05vYann0hxYbTuuMjOfVWragixp9Q==
X-Received: by 2002:a1c:6055:: with SMTP id u82mr2466874wmb.61.1606905472797;
        Wed, 02 Dec 2020 02:37:52 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:145:: with SMTP id r5ls1772276wrx.0.gmail; Wed, 02
 Dec 2020 02:37:51 -0800 (PST)
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr2566464wrt.176.1606905471839;
        Wed, 02 Dec 2020 02:37:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606905471; cv=pass;
        d=google.com; s=arc-20160816;
        b=qHlDEu4I4Aft+vHXnN1B8QNHM8R6iFCJ2xZoXNavfvRIg6JIsIQWkLCkbL05fPIZVj
         67kTmpxBpd6hWW8F0t3rsFm8KYRLw2Bpcl/7I6KJma8byHgp4iqY2OaxhHiUYZ9Yd4km
         K2/FbzxEgZc/J9BWWoObgnFgRZD7yEQXBu5UUuQcXPXif+jTp1fAkCgQybrOTnj25uN+
         Y/Fj7D0bgsmr9RyPI6p6KEpPbGRf7ceJa52VwlJFo1tDBG2xrw5IcTKtQkiMzC0ZV1Yy
         seUgD6GmBngLJkQ+otPLPvNNlF/8x1ro85z9uV9AZR1UTag+b/PK7vn41kNR/Kt/R5qJ
         3YzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=PTflwp3U5Yg2IZXO1Hk0VY0+tNsVRciEFlFY1RGCmtY=;
        b=KQpT07Pxmb7qXOZY1IuQnWkcD/r/Q8nCxRNlOHfnitCPxvWtwO0m+4w9DdPuHUy/1b
         34RR7ubc2D3DWTBdXntjJ7bCFIElb9ZZP+vH/UTioPeE4p2JaGTsxtHkQy1n7Sod9S1b
         692XYym7tcbkUUzn/UmWnhdpzy0w2oBKokeHgbXygXPhk97iiORVv9qg7hGIB4vHtJd/
         jfdjsy8GYljdTDKYYT1z0AP8TO/NZ9L9dOVsNfEC2yCtQSwCEKEZzvu6fStdKuWrVnny
         Y+UANXIxL4m1skg/s56t1Z9vh5T5J5Iuh8HZBRwoJULTNfVpH0xyvu7uNUCJNSAsK6IP
         JNbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=WmRX5N4k;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.134 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00134.outbound.protection.outlook.com. [40.107.0.134])
        by gmr-mx.google.com with ESMTPS id r21si99649wra.4.2020.12.02.02.37.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.0.134 as permitted sender) client-ip=40.107.0.134;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2ZaJczzmfN2VaXWxJhpRuOc3OkLehncKcyxYmc0ewklpSR3vOCgR7Qk7McFgtoqvr60/UEJVDVUPigia/UZw8Bt5zY6zjoSI58dpS3VS2qmAVo557xqTv9Pg/ritkZTiYoTJG5edZqZL3fTnTlAIw6sf92WY+qnkKjk+8aZXMJN0uxoIn46LvdNfc1Zu4joDrabebnc3SAznrwlfpPoZNG9DOQFm3olsxC++JYgsYUb+rkN0XjuoFlBcdy9MFDfL0fkhhwYwCygqRPtx28IDmEdL1BV3IGN+6XyPgaYx+srpsOhUxvbJBOByYAqO1L0rD+Hd+X0HhgRVibpCOk7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTflwp3U5Yg2IZXO1Hk0VY0+tNsVRciEFlFY1RGCmtY=;
 b=GkIm0LmCzXUIhRjpnlqjtjpuY94EziA8K/idNa6srGuNFjBQiwxwK0dLoA2j4+BZOKDNSMrLEcsmna8dfmRGyUJq0AsokkKvLzczgfLc68fueKLm6IAkUmLcbEEqq5fJczYmxKK15cCrRawAJnhPek+qo3fa3ag5hLVAyUVeh4YUd6doW2pTvX88MPf9Jcw9MvD0wsJ1SLwYeC5xNcPHjuxKY1P+pnxeXSDb82jzSdLpUotO2tTU4JPEriHVeLzkEzaM1mbNuQuEpiE9FTEE3yIBJatUvYGykwuX+B/MMbcPcscjYpisHUTFNZ9912Zf2Zk8PM89PnjSeaWkbErKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR3PR03MB6603.eurprd03.prod.outlook.com (2603:10a6:102:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 2 Dec
 2020 10:37:49 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 10:37:49 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlAACrWCAAAAQERAAARHbIAAEC6+AAC2xMaAAAqGbAAAAEPrg
Date: Wed, 2 Dec 2020 10:37:49 +0000
Message-ID: <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
In-Reply-To: <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26382dab-6ae9-4902-ef54-08d896ae50a9
x-ms-traffictypediagnostic: PR3PR03MB6603:
x-microsoft-antispam-prvs: <PR3PR03MB6603430B6C28C0CFBCF696DAB6F30@PR3PR03MB6603.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sKfByPfA2fwFnauco9b508yQ+i9FAMyWeBYzug4BxmnunlRDv8TaZDrlWX1x5qoilFFer/u+yOxxsMlf1LBAeAwTePVNqD9g55NGXiNLbxThtu5AlwdNjA9Wb+0LK/Nh1WktvR1X+7UNlxMCVXUGRrc4p6iAnD4TmfZmniV6IObWKb66sQwo8GCMlZawL3zjV6foR6/3UZEpyp1ty/Xa8zNhPm+WKDrpHuB4PamU/bUdh9N2DnWSz7cKidZ7U9K3FeBqs2jkeec+BMCZUigqExE97gLvkp20N5K41ru0SSQ0U93ogu0t6l2ClgzWwhNXEKVABUQc1XiQAK4dh9ZEJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(110136005)(316002)(186003)(26005)(86362001)(71200400001)(53546011)(6506007)(478600001)(33656002)(7696005)(8676002)(83380400001)(66574015)(55016002)(9686003)(66946007)(66446008)(64756008)(66556008)(66476007)(8936002)(76116006)(2906002)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?N2IzSHZSdzJyVVRQMW9xYklnRG8yNkRucW5pTmhGSGMrb2RRMEdpckFhSUZa?=
 =?utf-8?B?Si9BdDh0Q21zdzhwVUR1RXRXbDdIZVU1c05RM1lyUkxia0Z2K29oWThvMFF2?=
 =?utf-8?B?NCtpQXlhUllYUVIwNlNrSnlQcytBQk5YQzNWdlV1V1RIZTV1SlplSE1WK1po?=
 =?utf-8?B?VkhYcHFaTWcwSWE0U3NRc2h4M2EyUUloMml0OUlQeW5KcG8xSEJOMm1YaTYy?=
 =?utf-8?B?MnorVXg0c2dVY1RrN0ZXNjlkSTJTb1VYbFlvRjhRZlc1Q0tkZDkrR2JTSUNR?=
 =?utf-8?B?NFRDNTFsWHkxOUFkR0dqK3JCdHg1WFpvanQySWovd3JRVmpMR2IvZXdpbkhr?=
 =?utf-8?B?WUp3UFZ1MU9qdDJyUFUyTjlkN0h3RUkvZXZQMGZMWkJpU092NENXOHRsMHZM?=
 =?utf-8?B?QU5SR1VWWXJ6cU9CbzhXS1pVRElyV2pLdkp3c0trSVNIZVNoY3dLcS9VWmVw?=
 =?utf-8?B?V0crSkRUQTZVQ1MwbDEyb3h1NFdnVE14cTliZFZvQTByYlJ0emdidXovY0Fm?=
 =?utf-8?B?KzluR3JXM2VMY2x4aXpGeHdsdktMWXl1NmFYMFJJV3hwSy9udS9EVzFVYXox?=
 =?utf-8?B?cXJaVXdzMVBZYlgydjZZWU1ab1pzZkVyamNCVVJyKzZlcnBxUDk1S2k0LzFJ?=
 =?utf-8?B?WlJwYXUyeXhyOVo1R0hid0RhaVJDSnJpZzdmN0VBQ1hPcExGZHR2bUxPOThy?=
 =?utf-8?B?L2llVDRYWnFaYm5nU1o3ZFVWdEZWY3hXNkxXb0tjVGRIWUppTzR4NDN0clcw?=
 =?utf-8?B?VytXYTR6M0hLWVQwUkxzemRkQ3U4NURYd1VOSjhMeUlIclI3N1M4MCtYdmJ3?=
 =?utf-8?B?U1lFdnFUcEpZN1l5YjlVd2c4cWFnaDVRNDhaTHB3SlJwWWFiSTJQSDBwWGtO?=
 =?utf-8?B?cXZZVzVFVjlRa3lYRVJLN0k4S0VOZi9RT2lIcG5vYUhPTXN4WnJneHVmNkMr?=
 =?utf-8?B?MW9aeFNpSm1qSEljVkxyZ2hUSkZaNUZRMkRXZUc5MHF4aFAwRGRlWjdmOC91?=
 =?utf-8?B?VlpKZ0dRbjgyblRGSnVwOVc4aVRGbWswK3dFVW1UdnlzYjBBQWJNYW5QbURU?=
 =?utf-8?B?bDJXL3g5ZlZscDd6K3JUTldMRFNreXpzYlZoTjkzNjRaN2RmdGJJWjJTK1lZ?=
 =?utf-8?B?VEpZYTR3UGhmand6SHJqamlzNmVablFyM3MwU29GZkVCaGU3ZnE5bHdNand4?=
 =?utf-8?B?RVBTYlByUVYwU1d3cFpqQTR2Yy91NW9oMGRrVjJoTkNIVGhtRFFaVWZrMC8y?=
 =?utf-8?B?L1hGV3lJUkwxWHprRnpVSWd5MjNwVkM5aHk1Tk9vTmpTeXExMURReFRodHRH?=
 =?utf-8?Q?66j1du/AS7ykA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26382dab-6ae9-4902-ef54-08d896ae50a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 10:37:49.3908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhO2tYnQz6b6ZRD0gBE0zhZyhUySiJFBNcgcWsB7xBtckthSiiTbYSF3kFShi4t1Z9akvqHHytnLDTg0Ho6ivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6603
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=WmRX5N4k;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.0.134 as permitted sender)
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

The ouput of the command on the VMWare guest:

msainz@ubuntu:~$ sudo jailhouse hardware check
[sudo] contrase=C3=B1a para msainz:=20
Lo sentimos, vuelva a intentarlo.
[sudo] contrase=C3=B1a para msainz:=20
Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
x2APIC                          ok

VT-x (VMX)                      ok
  VMX outside SMX               ok
  VMX inside SMX                missing (optional)
  IA32_TRUE_*_CLTS              ok
  NMI exiting                   ok
  Preemption timer              MISSING
  I/O bitmap                    ok
  MSR bitmap                    ok
  Secondary controls            ok
  Optional CR3 interception     ok
  Virtualize APIC access        MISSING
  RDTSCP                        ok
  Unrestricted guest            ok
  INVPCID                       ok
  XSAVES                        ok
  EPT                           ok
    4-level page walk           ok
    EPTP write-back             ok
    2M pages                    ok
    1G pages                    missing (optional)
    INVEPT                      ok
      Single or all-context     ok
  VM-exit save IA32_PAT         ok
  VM-exit load IA32_PAT         ok
  VM-exit save IA32_EFER        ok
  VM-exit load IA32_EFER        ok
  VM-entry load IA32_PAT        ok
  VM-entry load IA32_EFER       ok
  Activity state HLT            ok

VT-d (IOMMU #0)                 ok
  39-bit AGAW                   missing (optional)
  48-bit AGAW                   ok
  2M pages                      missing (optional)
  1G pages                      missing (optional)
  Queued invalidation           ok
  Interrupt remapping           ok
  Extended interrupt mode       ok

Check FAILED!


-----Mensaje original-----
De: Jan Kiszka <jan.kiszka@siemens.com>=20
Enviado el: mi=C3=A9rcoles, 2 de diciembre de 2020 11:35
Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
Asunto: Re: JAILHOUSE_ENABLE: Input/output error

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


On 02.12.20 10:37, Sainz Markel wrote:
> Well, I've been checking the related components. My env is being deployed=
 into Qemu, using the same commands exposed on the Jailhouse Github docs:
>
> qemu-system-x86_64 -machine q35,kernel_irqchip=3Dsplit -m 2G -enable-kvm =
\
>     -smp 6 -device intel-iommu,intremap=3Don,x-buggy-eim=3Don \
>     -cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmcl=
ock \
>     -serial stdio -serial vc \
>     -netdev user,id=3Dnet0,hostfwd=3Dtcp::5555-:22 -device e1000,netdev=
=3Dnet0 \
>     -device intel-hda,addr=3D1b.0 -device hda-duplex \
>     -kernel vmlinuz -append "root=3D/dev/sda intel_iommu=3Doff memmap=3D0=
x5200000\$0x3a000000 vga=3D0x305 console=3DttyS0" \
>     -initrd initrd.cpio.gz \
>     -display none \
>     -parallel none \
>     -serial tcp:127.0.0.1:1234,server,nowait
>
> The Qemu env is inside a Docker container which is being run in --privile=
ged mode to share the kernel with the host:
>
> docker run -it --privileged --net=3Dhost --volume ~/docker_tmp:/tmp=20
> selene-qemu:1.0
>
> The mentioned host is a VMWare Ubuntu VM which has KVM enabled with nesti=
ng=3D1 parameter:
>
> $ sudo modprobe kvm_intel nested=3D1
>
>  and all the virtualization configs are active in the VMWare config panel=
:
>
> Virtualize Intel VT -x/EPT or AMD-V/RVI yes Virtualize CPU performance=20
> counters yes Virtualize IOMMU yes
>
> Any other thing I should check? Any change that must be done in the outer=
most Windows host?
>

Run "jailhouse hardware check" in a first-level guest (can be any normal Li=
nux distro). It will tell you where VMware falls short in emulating VT-x.

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
jailhouse-dev/PA4PR03MB71840A37E0D9AB045A451369B6F30%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.
