Return-Path: <jailhouse-dev+bncBAABBVG77D6QKGQEHFH4JBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7022C3D8D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 11:20:05 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id i89sf855659edd.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Nov 2020 02:20:05 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606299605; cv=pass;
        d=google.com; s=arc-20160816;
        b=CwuG/lEdSRzocTZvFh4e4iS/TBMKqYjTDwKwUTekYVQ5ENsPthAo75I02CeJ6uQwKC
         nv8OQi0sjiV1YCVAkHo1FTTigf08aCr1DfeHDGyC3XZtK+GtBdNdulEu5Cbl7/dcC46P
         3TnUZG6HG3kIus3+ZyOV8rdZNJT+TBERy8Vqrwrbz/4/ouOEvuefX2YA7np6pFQMYDho
         6lx5i0qKEhkG+vNXBahOpq2XtBF1ALzdul21x90SSb2myJxmJgjesHxID56mAc3O2JBD
         rZ8tsP9a5AFVMHNaESdAD3+0XfCqTdmGMOJ93Atee4OCVr+NVu2zzAU101YP/BVeV817
         sy1w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=9mEn3gEZIBrZ1PJ+vs8qLFsuLSJ3HVOZdnPUCab2pLQ=;
        b=S1iWikhwHjnCz0RZDvSpZ3AMOVQOmIfHFnGs47ZcT6ic0tWUHrS8K9mqB0zeUROUyU
         LcliJFbcukopyxt2HQRg5l1W0MuW/f9pZn64Wn7p8yAYF745tpgOfL0dedN/DwKA5Exq
         GiT/dHpbY8z2e4hb5Zfc6ilwYswyiaZtuzIAcPlw1ebL4tMjYTbaImimp9bG9ZZTzeGk
         X6bCBQDr39dZTPXr9ewxJF4FPBI4U5Xa9fi+iP1OzEao7Wq4aKaR1h0w/wsWmcP4w7x/
         vt7Q8OLZqGtsBAfLXHsf8PeQ73yOEpFu/CyF2a0JB5ZwxmV76VUTJTXhITqkWTEJKJ+T
         9ymA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=kvf12Pqd;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.134 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9mEn3gEZIBrZ1PJ+vs8qLFsuLSJ3HVOZdnPUCab2pLQ=;
        b=cVxZRuu3jrX3X9+UMYo0fDc1e6drrKNqeT1PR2ulPMMwMX1GDI4pQbRuDOnN2ysKKd
         je/jp2OUX+bIGFThTq9EaKfIVgE+Qfar4TUnRNlH59vknjA8vCzmFAEtZ4V0TE43z2bA
         uFMKlkTEUgQIk4PhnjzxVBE4ZaoN9/s4ZGhxZJ4/49k4cZh2DOuT7lK+jSWzbZ0ENBxu
         TF/ZrnwFbNnBf75sMbrSWvYBXqoTfAb60sP2DqQ8a0E9mfvMcCabMdLfzn6AA5UoR/cc
         9FunR+E2BizUT+9CCM84KEARKw4S3OBTBZWghQJAUDqOlUZ32E8akdttScJNmHbwkzRo
         UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9mEn3gEZIBrZ1PJ+vs8qLFsuLSJ3HVOZdnPUCab2pLQ=;
        b=pmKmEMaxTI8RHDIIIlPW/LAYwuHKqZzLkTuSL8sh13EcoM30A5TG4P4PCqoObAJa6p
         bXEQRUgBhAi0irablK03pPcxQbFGtE5bBoy5z1GyrWAsirADrCz1d33p0ug0cay1RNoN
         tuhceDggGxD23FNFbmrhDrjYqiw15jfP5BoSsrCyTL5Ko+yRiOzu5R6RneKW7o2q/VDy
         OcJhtWG4XC6x0MuS9diewmWkpOhe/lqp73cs2V0YtQVqhJzePcD56t7ycsdIi9aw5P2y
         6LTI4mg5K6jPFrrWM2TtKA1C8PtFgY8kx4FoYgapsnkVah3uLvbTVI11/Y+Ak1Up3O8w
         f6/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533t1C4Di+JGA9n8pnXdT8mXRiByADxTcPDAObf2LI2kgginlv92
	CqMl9oMv6IwAiRe+USw5opg=
X-Google-Smtp-Source: ABdhPJx8D23mbEFQvTSZAiBUi0HrmbZXXy/5LxHTvHm+WMSFkYm1qcjnMGWRhzCjUeHfIX58z62e3g==
X-Received: by 2002:a17:906:2c44:: with SMTP id f4mr1917891ejh.139.1606299605137;
        Wed, 25 Nov 2020 02:20:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6955:: with SMTP id c21ls848981ejs.8.gmail; Wed, 25
 Nov 2020 02:20:04 -0800 (PST)
X-Received: by 2002:a17:906:2708:: with SMTP id z8mr2466853ejc.428.1606299604207;
        Wed, 25 Nov 2020 02:20:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606299604; cv=pass;
        d=google.com; s=arc-20160816;
        b=pBKsrerK+QWNSfY1URwCUlkv7TKRz/M5ofYBrp8FfH4Cm5Lk0SNvd/BiItXrtvhL1j
         PaqHUZWAJiCBjUtzSB6lb1J1u5PeFD7D0mJsEE9PJVF26TLhvCbc82WnbZtJkhoXqF+4
         ci8QpajCvDPxiHdFiF8xiBMj9gcsYIgJD5o8nBt42t3s0/RuUfkm+uIC7odKaWxX06UL
         zqFsudBXMCrjzwAFmLZBsP1OvFAAaL9EZdz51rVZAbl2QF4qJLXcgqflrISQFv6kvSpc
         7dwoSX5zbW0NXKWCQsNIDD+evoVNBWdFY8FyH7AHe7CnV4v8saCePvsCwMgshhJl5YtD
         fiRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=zcEjViu5D++wxmaD+HL1sH10k9rkr4WoR1Uuu+kTR/I=;
        b=AATsi38itEoiJmmJodY/DI/GHWIFc3Kawh2lMRs48VbH1gvupUbIplLb28k3OMh1bm
         7bqDlQ9bHooNT4cSUeDhNstWzhBr5LSqlikti7bGhE8JOgz2MdgUAODZqSNEv5nV3a21
         pbQMCFgFo0y6u4KRKmlGpC/dR6EVu02/9BpCEm5xQXpmiRncd7I2TvYfDMjFx5P92C/T
         EUxaz+L8wdjFF3CxdBrsS1gJ7NJm1Uyg4XLIJT6POXyERgKW+ovpBAUC7RPZsDMGqz+j
         AH+ImE2jT5uw36H0kWx8D1zM3KjOEmVxBgc04PAxUHuH7UPNFn9yJpzrclyx28TAY1+b
         BeBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=kvf12Pqd;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.134 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120134.outbound.protection.outlook.com. [40.107.12.134])
        by gmr-mx.google.com with ESMTPS id a11si40364edq.1.2020.11.25.02.20.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.12.134 as permitted sender) client-ip=40.107.12.134;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayJwwCxNq0hVTKqX8FceX+YJeLPP3C/WMf6Ppx5dj77Co6h4H5mSCZXA5wVXiGkregBNQecOlRnrXM8gi9uMJZ/P7I0Qxun9opg22wNENxsJVdx+OXINjat/rMbX611VgcmyTZOwHL0wczajrAXoxASOQjY3XXBmmsyYM3fkdC2bK11/TGJAZhSO28BZpILWANlb0h+Z2hLs/A/EP/q0Rl5fG8HNB19xbtT3JfyLR1G3zWm3Fk8aTKrtn0YNjTSkPSLapSzNlbcb8iYV6/Q8W9xuy5O8bZ+NRaD8iAXOpxuY0XP/j75SXx6avdXeuh7bQjAPPAVY43Ctniu/xnezgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcEjViu5D++wxmaD+HL1sH10k9rkr4WoR1Uuu+kTR/I=;
 b=gqr3GEuluGXk0E/uD7jJ5DAMZ/cQP9HdLpmM3W5zRGwaprB+cCbWbc8Eqm1d9hEFvwhOgWoULPZKOdNarkgleyoYBKnFPGh2MipQtGzw/+kU36/NyM2iTGWOd3eUgEJvlnlu7GQ7Rz4vlH5gKKJox17COT8b+RM+ZBD11l+d0Cflao7qx2E+qcmUoQYwcrcWW9GeN/8PDjlhJ6SHgRzY+2hYrlQnk1X769A7S0eWkup7Rj/YTWVHFPR43jVgNYCCCyE/XaWzN3qC4wL3VhhBkVzNCLJsnApFK6AzK8eMuXUOKbb2hDTHaa42dT6VWx1Mw3mBiA1U8TPklVIIS3KwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PR2PR03MB5468.eurprd03.prod.outlook.com (2603:10a6:101:1a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Wed, 25 Nov
 2020 10:20:01 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3589.024; Wed, 25 Nov 2020
 10:20:01 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Creating a sysconfig.c for a target
Thread-Topic: Creating a sysconfig.c for a target
Thread-Index: AdbDFBx6W4i6Npy+QGOFC6kHN6UDNQ==
Date: Wed, 25 Nov 2020 10:20:01 +0000
Message-ID: <PA4PR03MB71846100DFE427B73A94F944B6FA0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c95a563-4d43-4a6a-e26b-08d8912bab36
x-ms-traffictypediagnostic: PR2PR03MB5468:
x-microsoft-antispam-prvs: <PR2PR03MB54681FC8828BA49D26D7E1B8B6FA0@PR2PR03MB5468.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8SkPz06iH1Dc5lKitVZD9cYBOezyhyK5+8dHeL04uNbNqSbjOT98urvxLTC2AJ/REovZgWJkFR986Bkh9bSeMwcFLtkhclZYxTw5kjAqbsPhMC9o+Vb2Wa7My2k6uYKaw/5UQMDMBnFVR0ynDDvts52W84GlNm4j0UfFE6pKGWvTIWvemf2ZhhiymH+lsNk0QN+ZxMXzqrWZVlLOLc9uSCpto6PEf9/9we2zvL+c9v07tqVwe0o/5ZYmSoIQiVX9Qav0vkH01zMrbj4wQaOpr3tKTqA9sXgPvzlg2jCWw3ek1bfsaxJZJ0v5u7EpFgyIANTdKRAy3bpRRqbbz9fmV8BjsESfEo7YwNoj/HB441JBmDbCVvHvCVJxCAblk8RXHB5WyysulzXO45gL55tjmMI5D2GbMc8c7hYx74V2Rqw32XD5L6hrbMB/nD/B9GqNj2ZyNdCQEHNnQmvksJkfrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(86362001)(9686003)(2906002)(26005)(76116006)(64756008)(71200400001)(66476007)(6506007)(83080400002)(52536014)(66556008)(19627235002)(8936002)(66946007)(66574015)(83380400001)(8676002)(498600001)(55016002)(7696005)(6916009)(19627405001)(5660300002)(186003)(166002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?l42ATM4CuXOTIMrVp17pvOwdLCTYZBrMG2eJlqik2XAcb/u7Vp/06/NITb?=
 =?iso-8859-1?Q?SQ3MGNOOalyAAaJI3OvVbTXOoQr5iic4vwrYa9epdI+ZfEgToDrcs6m7gd?=
 =?iso-8859-1?Q?DiaccvdivLADGIE8hfBQ9PmE8QcQPpCMcuarg3pfVF2Ab/C3H/fuY2af+R?=
 =?iso-8859-1?Q?DJEP4yEvtKh3iCX6pRHpJZOe7KFZzxoDd0L5ZI+qL6HC3u2FYJxWIGPrs+?=
 =?iso-8859-1?Q?rtM32CT/IbuuZ8RIi9EDSZdkZI9u4pmCMrs3y8g3NMp8U/DRd4UYNIGg2B?=
 =?iso-8859-1?Q?bIZFeqvF2/xEvgFVF426ZDvmx4to3xs5WlkKCoCCYMIziYgmGplh85y4V+?=
 =?iso-8859-1?Q?nm6TRlmIBCex/2UFiG4rj8jB+A1YkEXKn+syQDYHS4P+cjCdIWBFx1Xhwm?=
 =?iso-8859-1?Q?qEAXH3n/JO6O9E96aax43uCmsnt72fq6z50nDHpdT8sNeYHUzf+IMXYMG3?=
 =?iso-8859-1?Q?dREQNBEa1YNMmKOj8lopsy7xaZP1+P8OTLfpoQmY0qA2dYXGCi/uz2QF30?=
 =?iso-8859-1?Q?YC6zdDHSniV7brL6fb3nuu9CGRw5pTWivczzQLiqMl9vLoJX+QnOMda3jd?=
 =?iso-8859-1?Q?igCweIxkV8OlSbI6WMxepkClQkKGg9K9xXutJTFDH1GgW9NiPIDzenwb8s?=
 =?iso-8859-1?Q?t0hhPO6OtF9t5+gIMZDpCUu1iiwzWZ6mNl0qIvnZ203UWHvjOl6GHC8bK7?=
 =?iso-8859-1?Q?pzgwXdGl/s8z00rUnkQeG3MzgLYtMXoKp6o9hpj5WBm6CZDR/JGyTA2Ajz?=
 =?iso-8859-1?Q?vOM79QmVX74dsfbohWup61aS616dM70MW7may1rjEDcX/sVAQpUYAs4o3P?=
 =?iso-8859-1?Q?aJlK9PkqMdnW7N2TwjKIIRFmY+RGTaoKmohiV7TLNx7iEoZhNRw0mhvN2e?=
 =?iso-8859-1?Q?AeSOJox4SNCDLsHJlK3RTyAaVIhW/Ga+x3grmmQ5CyyQ6ZWAn+2UfV2Vuv?=
 =?iso-8859-1?Q?YTpwXP1FUxs4+CfRV8I4ArEYZthOmRAucablbNmT1B3EzsOmc1SFQRomNX?=
 =?iso-8859-1?Q?LMaRdjLXwW85MtfwU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB71846100DFE427B73A94F944B6FA0PA4PR03MB7184eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c95a563-4d43-4a6a-e26b-08d8912bab36
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 10:20:01.4270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7P6RO/bwMRy9zLBJHLio8P+nqiI7OFZ7zl6fXPOfupsNQ/uEwVFToJWirjB5CM/M1OUVrDf66dU0noVu3mQPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5468
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=kvf12Pqd;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.12.134 as permitted sender)
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

--_000_PA4PR03MB71846100DFE427B73A94F944B6FA0PA4PR03MB7184eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm trying to integrate Jailhouse in a tiny Linux system running over Qemu =
(x86, uclibc). Compiles OK and drivers are loaded OK. In order to run "jail=
house enable /path/to/cell" a sysconfig.c file needs to be created before c=
ompilation, as far as I understand. My tiny Linux does not have Python inst=
alled and I was wondering if that file can be created on the host...

Thanks for the attention,

Markel Sainz Oruna
HW eta Komunikazio Sistemak
Sistemas HW y de Comunicaci=C3=B3n
HW and communication systems


msainz@ikerlan.es <mailto:msainz@ikerlan.es>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_twitter.gif]<https://=
twitter.com/IKERLANofficial>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_linkedin.gif]<https:/=
/es.linkedin.com/company/ikerlan>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_youtube.gif]<https://=
www.youtube.com/c/IKERLANofficial>
Tel.: +34 943 71 24 00
P=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa=
)
www.ikerlan.es<http://www.ikerlan.es>
[https://www.ikerlan.es/upload/actualidad_noticias/ikerlan_separador.gif]
[https://www.ikerlan.es/resize/branding/Ikerlan_BRTA.jpg]
[https://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIA=
K.jpg]
* Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen legedi=
ak babesten du. Hutsegite baten ondorioz jaso baduzu, bidal iezaiozu berrir=
o bidaltzaileari eta ezaba ezazu. Milesker zure laguntzagatik. Behar beharr=
ezkoa baino ez inprimatu, gogoratu zure INGURUMENarekiko konpromisoa.
* La informaci=C3=B3n de este correo puede ser confidencial y est=C3=A1 pro=
tegida por la legislaci=C3=B3n vigente. Si ha recibido este correo por erro=
r, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda. Impri=
me s=C3=B3lo lo imprescindible, recuerda tu compromiso con el MEDIO AMBIENT=
E.
* This e-mail may contain confidential information that is protected by our=
 laws. If you have received this e-mail by mistake, please, notify the send=
er and delete it. Thank you for your help. Before printing think about the =
ENVIRONMENT.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB71846100DFE427B73A94F944B6FA0%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.

--_000_PA4PR03MB71846100DFE427B73A94F944B6FA0PA4PR03MB7184eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m trying to integrate Jailhouse in a tiny Li=
nux system running over Qemu (x86, uclibc). Compiles OK and drivers are loa=
ded OK. In order to run &#8220;jailhouse enable /path/to/cell&#8221; a sysc=
onfig.c file needs to be created before compilation,
 as far as I understand. My tiny Linux does not have Python installed and I=
 was wondering if that file can be created on the host&#8230;<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for the attention,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"370" style=3D"width:277.5pt">
<tbody>
<tr style=3D"height:37.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:37.5pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black;text-transform:uppercase;mso-fareast-la=
nguage:EN-GB">Markel Sainz Oruna</span></b><span style=3D"mso-fareast-langu=
age:EN-GB">
<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td width=3D"200" style=3D"width:150.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW eta Kom=
unikazio Sistemak</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">S=
istemas HW y de Comunicaci=C3=B3n</span><span lang=3D"ES" style=3D"mso-fare=
ast-language:EN-GB"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW and com=
munication systems</span></b><span style=3D"mso-fareast-language:EN-GB"><o:=
p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB">&nbsp;<o:=
p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"display:none;mso-fareast-language:EN-=
GB"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><a href=
=3D"mailto:msainz@ikerlan.es"><b><span style=3D"font-size:9.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:#333333;text-decoration:none">msainz@ik=
erlan.es
</span></b></a><o:p></o:p></span></p>
</td>
<td width=3D"100" rowspan=3D"2" valign=3D"top" style=3D"width:75.0pt;paddin=
g:0cm 0cm 0cm 0cm">
<div align=3D"right">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"75" style=3D"width:56.25pt">
<tbody>
<tr>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://twitter.com/IKERLANofficial" target=3D"_blank"><span style=3D"c=
olor:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=3D"0=
" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"_=
x0000_i1030" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_icono_tw=
itter.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p=
></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://es.linkedin.com/company/ikerlan" target=3D"_blank"><span style=
=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=
=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=
=3D"_x0000_i1029" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ico=
no_linkedin.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://www.youtube.com/c/IKERLANofficial" target=3D"_blank"><span styl=
e=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img borde=
r=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" i=
d=3D"_x0000_i1028" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ic=
ono_youtube.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">Tel.: +34 =
943 71 24 00</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p></o:=
p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">P=
=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa)=
</span><span lang=3D"ES" style=3D"mso-fareast-language:EN-GB"><o:p></o:p></=
span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><a href=3D"http://www.ikerlan.es"><b><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#=
24ED31;text-decoration:none">www.ikerlan.es</span></b></a><o:p></o:p></span=
></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"800" height=3D"44" style=3D"width:8.3333in;height:.4583in=
" id=3D"_x0000_i1027" src=3D"https://www.ikerlan.es/upload/actualidad_notic=
ias/ikerlan_separador.gif"></span><span style=3D"mso-fareast-language:EN-GB=
"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"366" style=3D"width:274.5pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"200" height=3D"96" style=3D"width:2.0833in;height:1.0in" =
id=3D"_x0000_i1026" src=3D"https://www.ikerlan.es/resize/branding/Ikerlan_B=
RTA.jpg"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></spa=
n></p>
</td>
<td width=3D"400" style=3D"width:300.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><img border=3D"0" width=3D"357" height=3D=
"75" style=3D"width:3.7187in;height:.7812in" id=3D"_x0000_i1025" src=3D"htt=
ps://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIAK.jp=
g"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr style=3D"height:10.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:10.5pt"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:7.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">&=
#8226; Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen l=
egediak babesten du. Hutsegite baten ondorioz jaso baduzu,
 bidal iezaiozu berriro bidaltzaileari eta ezaba ezazu. Milesker zure lagun=
tzagatik. Behar beharrezkoa baino ez inprimatu, gogoratu zure INGURUMENarek=
iko konpromisoa.
<br>
&#8226; La informaci=C3=B3n de este correo puede ser confidencial y est=C3=
=A1 protegida por la legislaci=C3=B3n vigente. Si ha recibido este correo p=
or error, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda=
. Imprime s=C3=B3lo lo imprescindible, recuerda tu compromiso con el
 MEDIO AMBIENTE.<br>
</span><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#333333;mso-fareast-language:EN-GB">&#8226; This e-mail may conta=
in confidential information that is protected by our laws. If you have rece=
ived this e-mail by mistake, please, notify the sender
 and delete it. Thank you for your help. Before printing think about the EN=
VIRONMENT.</span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></sp=
an></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/PA4PR03MB71846100DFE427B73A94F944B6FA0%40PA4PR03MB=
7184.eurprd03.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB71846100DFE427B73A94F9=
44B6FA0%40PA4PR03MB7184.eurprd03.prod.outlook.com</a>.<br />

--_000_PA4PR03MB71846100DFE427B73A94F944B6FA0PA4PR03MB7184eurp_--
