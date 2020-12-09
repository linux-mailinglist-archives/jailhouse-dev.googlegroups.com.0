Return-Path: <jailhouse-dev+bncBCJN5Z66VINBB5V4YL7AKGQEGOTQLEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id C476D2D3F30
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Dec 2020 10:52:54 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id k23sf355794wmj.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 01:52:54 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607507574; cv=pass;
        d=google.com; s=arc-20160816;
        b=k0YxRGi/sKO641ItDHK7EK65lw+FHXiFEn1t6Rz+mXyuUTgYcPSMH7Ztjq28zkpzim
         RzV8k7Vm3r7nq9C1ONwb3hTbx3XCIuWqAieNv9nN566LHPfij+HSTth//iZL/otMbuMc
         0Rp3kLYX8FNadMr2EkvfQd74itNigZGBR2OrMJgdVSspqYGJbBmP/M2BfwSCOQnkELOm
         kQEGZ7THadCgTbXwyNIVuS4NJ8mqlIWrA5uIk3FveF8B3AW1+pN+JhDPZIG3k++XB8aT
         2yVsoGnVuRlrATl/z3hXBHk0Js2Ph2GlQUpnNCq7t5dlWs89NkYn/yNnfMSHH7zco9jO
         jp9w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=WRKWtz0MpsLKVsYC9jib2pXdKCI33jZGnfGO+m3tMLE=;
        b=aNSd7THm6Yy7t6WdrxZl2MdmNjsXEe1GI7heJBWoyU5RhJesSMtpmT9yeHsW1IQtVx
         EKtWBzwqgXZdsI7AMo4GYZxYrXCvdCEqc2IslDrQp6DCGl++rmLkfduKP3SDlGZIvIdJ
         g9zTkv/yKuUUVOk9EDlVGh+rNtIE5sEVDqoQ7zdGRbnqjAQF5RkEafosOOShG0WFtPJb
         kmDfcUUEmLyMr2wHBDRQqCMx0kAHQsrCLDThMoZcgmFg0hltWJQc1XPqGa//FPCdD8OV
         4J81HxWuekTCgIX+HHGf+Vy3k9cc6B/hPULBYWpgg4UNeBShKYD7nirUXoOf9kR7Gi8+
         ykvw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=qdFPFxaU;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.131 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WRKWtz0MpsLKVsYC9jib2pXdKCI33jZGnfGO+m3tMLE=;
        b=OlE2wWNDIagLgECkXekU2dcdxSdHKn7EleYqmbtARInSmlwvB3G8fTOEtogGxuj6vz
         NIeTKi4kPsm0/bbLFLCQ7s7Y543QTkyqfGjGJOmM58ygI/ZODyjiJ46hmf79LVHkvWvG
         wB6Q0sWTj+zU+IXB1foyVcKCVM5djnLzdFSJlvmAhLp/AHnN4d7ziLGukeURCnxiPHiU
         ejxvWNU80MK+oXtn45xC22aUn0T6sbKemfRRFdOI7BwlE0BJ8pbC5IRHLcqb9qPdk+p4
         diqKTYtTtcKD41w/jRRZdqcCFdR80r+Fxstqa4VaN4raq78EREfxK5hvfgU1KI9uk36x
         0tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WRKWtz0MpsLKVsYC9jib2pXdKCI33jZGnfGO+m3tMLE=;
        b=U5tRjVrhRu/WOv/T50sjaTMxQEZ4/ABFsOEsoD748bS6BTcQ8dHjZ17eihZrRiZajK
         BMuQUP+WUJOpEwOHeGEvXkfStFuTj/IPrFnqXs1IBRr7mxPcElyqMVYeeY5Y4z3dXezQ
         sOuL4sip6+1nQpW7SfH6wQ4Ed3Hlnnxdq3wEfWQ0e8Wn2JnbtiaGRpUeyuX9nxJC/QXI
         0qHnf9xF1XxseTQw+h46RycyH7iWjMigOHjUR/1Uffpw7nT6MGbAjfDFMPH7Ip0nUKKq
         mxw2APWGG75sxcoQt0A7QQfBp8hFNnnh9+7fyVsqQAMbs7WJgmAIUXnhymfg/TqMSyf7
         NQcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532neMLBzpcKcBFk7pa+YuwiSaCKffaZv7tA2edp0KzefsQKhkXn
	X173HBez0grH1UNSBgbCCJo=
X-Google-Smtp-Source: ABdhPJytDgvSu8iS8sg02nCifEGX1uKVR3cfxZuTdI36O7agDogcj81n03/iYKa4nADjF0fBovUOhw==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr1875416wmh.2.1607507574492;
        Wed, 09 Dec 2020 01:52:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb0e:: with SMTP id s14ls1652129wrn.2.gmail; Wed, 09 Dec
 2020 01:52:53 -0800 (PST)
X-Received: by 2002:a5d:6386:: with SMTP id p6mr1720012wru.261.1607507573551;
        Wed, 09 Dec 2020 01:52:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607507573; cv=pass;
        d=google.com; s=arc-20160816;
        b=IAoCGQc+mnxiAM6KPHVuNCOeDeTc5ki7Bpn46PiX/k18znqtf4HPpQy+VBN0DP4SHw
         S6IABgisqLcKzdnU48HC3RpsUhIWXHtAKXU5JRLv0Homl8TuZ+2RmsaPi2OicvkuWhB/
         sZB5R8b17YiuMPdCUaU82o1QmMKHz5xQtO3TKdOL6GJVfzAfUbSRG4zCZe4kFvBgrqD1
         0VXQH6XOUqJ/PxxtR+Ss0To3aZDRnXUrUHXDkg4Dd/F2nUGvMcc2NOO8fG4dAbMv9EA7
         JlARe5TGBo/xZszjxkeBqufUJK2wxF2vrz1MXWiq3isAEs2jXYg7+ot7pfJAIqvmzbux
         Xc+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=tY9XS1h/J95J0vhggePTRxXWuBbahs+kePexcIKo9g8=;
        b=reAA/R405eaZYWa0wW+Pl2YOs0ynSBNjJKxDbu1XW/R2zni77spg/EbcbvxP60FauZ
         ADRFo6K8fP0uv++fKrUNTyMqjOPSoqRLE8j/QEJSf7bvk+yBnWhd2rhLOAiiIJOF394C
         ebVo3LLWf+Ruvx1MBtjOAYvVyn/ClHlJHPZ01aTwyeE2cezVNgKJ4nHGebO3F7pXyJb4
         0GsXFH57CdBXKSPrst8WO2xi782tDn11vrIxZc+fbuxt214g8xaSl19b7Pepr6E+L7hw
         D6Fqz/GD4Cr2GFOlyjWKjwCtSjMG31fGEsE7q46ejRN1DTs7KBwII/Pn3uCM3MZR4aCO
         vAJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=qdFPFxaU;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.131 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80131.outbound.protection.outlook.com. [40.107.8.131])
        by gmr-mx.google.com with ESMTPS id 18si36239wmg.2.2020.12.09.01.52.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 01:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.8.131 as permitted sender) client-ip=40.107.8.131;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkFnat354xAS/NWsSNRrOaxlOsA62cgqzFqZXlKVdEHHx34qlSfjcezSgPwCXpm7UW2e8O1/d9/i+w8P4PTPf7QMDEJ7fiMS8BpyB5LEKsG76zBKNALWZAotLSy9/36Y8NwceLDtxrOx6ZpEjsJwUoF2fg3UV8J94mRvxCzUk6bmJX3b5oh/N1yTSl7xlpUpvFrp9n6iy1awrAISkLnhtCT3VQSEw0lnOQBH6B9v3S2SzrQ1XgcT9BCtlVox9zmeYHzpI4zqN+NuL7V74ZzCbFzLDha21QK+NTab4jsnZShB+ycGCGryhYI0lreRKzrHADbTDElToA7T8jRozOJq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY9XS1h/J95J0vhggePTRxXWuBbahs+kePexcIKo9g8=;
 b=DkYnNmYvn/wIB3PGJfK9I+j/vLZtk/J3rTvQS+MToLi6S/eoq5gf4QMTkqNB5JOy4gA4LGQvuFaTDAtW0T24K1q1Zus1ZhvUeQa/6IGnaBBpf7QdBkcyMB5Ia4MiptLcbeNFfmJ0V4rC464k8XhK3QXlwfxaCecgfdEZkI/Dhwu7ObQGIQDhK5Ptt6cLJC17LNsV/ow9JK3fC0Z9ofRLg/dJG+0B6cfUa6bQtLwvjELMLWxTnTOaHUr3B7tFmp0yWC49/OcxIrDKudArBjFp/m5M530RXfkbGHv7QiljzdNsu9JgxfqE7bososIT3a+AeqUYMrI1ctUoaOnXJ7a+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PA4PR03MB7406.eurprd03.prod.outlook.com (2603:10a6:102:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 09:52:50 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 09:52:50 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: jailhouse hardware check error
Thread-Topic: jailhouse hardware check error
Thread-Index: AdbOEISuarlPAbS2SqyLZ0yti5cZUw==
Date: Wed, 9 Dec 2020 09:52:50 +0000
Message-ID: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca84a5c7-4c75-4344-8161-08d89c2830bd
x-ms-traffictypediagnostic: PA4PR03MB7406:
x-microsoft-antispam-prvs: <PA4PR03MB740649DA6115635BA42EC3BFB6CC0@PA4PR03MB7406.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LkMHizAAKOmMajD9ipiEOXuXTkQyDZYb/6cGOb2cYiPrv3I4IJkXsDiY34/B0el/go+WIyQRZ9Tl+hGFXarXvLuFJ7Th3TGpZTve/dJ+OKDMWwaK//5yYtCMA9Risaa9EMmHKsL3JonVroPn3U1pq5Tyojo9Rk1L7tcvt1UYPKxXpzM7uQSI5WiyaCgV2msCEhXE+oW+AcJJdbWppEg4u8Tja731ox8fXBrStEBavc4lSTc5XdEBQNNEavjRvWY1l5OjmppU1cNIaAXidhEolfNjOWV6aJpHSh1VKkCsYgOgnTH2gYWJEEMDFai5Wa0icPCoCpGtSB3nB5eXQ1ttdkXsGvkHyBCBsIRmP+Yj5eeqlU/oIcMa3vHosOjf5E4dCg7ReeDJv/jd7CLh76ezHijLTzv31qun0XStj7yfy44wviR7G2knGUCo/XwJ/KKUdUBih2icwgrUZQ/WO6WihIbC4U6Nc7vlyOO47nZegSw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(3480700007)(7696005)(26005)(86362001)(166002)(9686003)(66946007)(8676002)(55016002)(71200400001)(64756008)(66556008)(66574015)(52536014)(83380400001)(66446008)(76116006)(19627405001)(8936002)(66476007)(5660300002)(6506007)(2906002)(19627235002)(83080400002)(33656002)(6916009)(186003)(508600001)(158833001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?Lz4oDPWt/969GpQupxBrx5q0JZW/OJ1luSdv6NGO/5a0BLlU9UaBZGE3rG?=
 =?iso-8859-1?Q?daTfJ/KpkV8mcFUSeTFy5SsBkFXE/JwpMDleBuE7FYHjPvN09u3ACuVYCH?=
 =?iso-8859-1?Q?M4p2ne2qvKByAJEB/xnAJu5Yg7VYkA2YJwHd5PFBgFld5eqVGyVJj6sKUl?=
 =?iso-8859-1?Q?FhBLxd1H7pWtr4hYX4Rw7FbH91QhpKQ0mwuv/ZzecufSOTIYdxxJVYY//c?=
 =?iso-8859-1?Q?X2WKbqVYFPICw8U6Dmk3skzh9n1Jzp24hyLorn0RwNUdDjpFcXrldMCw2u?=
 =?iso-8859-1?Q?IloGRx9Kg6hUlQyo7EDuGIhi560OdrJQdQf/vL5gn4TCI1PM55ZeQRCeUG?=
 =?iso-8859-1?Q?biWKG2N1j8Ca73j6KjNx0RNav4QftmF6CZVwEAH7crEkqFdOs/fXLgpTCG?=
 =?iso-8859-1?Q?9DtUAlqtsZrcZt3UhO7g0VGuU0mUucKK9wSUJZrPTz6I8OmaATzAn+xh4R?=
 =?iso-8859-1?Q?u+u/dxlSjW70QLio/KnRlSYm0oZWx2Kbg2YwuifzjWThxonzdgrCWaCFNB?=
 =?iso-8859-1?Q?cHW+0htWE3LFXRqreJdRgJVDLvS+XU6unG6b6aWFTL7zdEsDfFtX7Er6FN?=
 =?iso-8859-1?Q?g00wqeWzBtMwbJ7oVJr4ntSoOLBnASPNRHtvh4ma34wfRAqQ9luuqYSUV6?=
 =?iso-8859-1?Q?gbipFC/5XaMGTNxExabLydIGSS2TZj+rjrTHeyoPWcM2nAeIP98o11Myea?=
 =?iso-8859-1?Q?EA/QnYIZNpDnd/lye9TDq8axwJ7pdVec1DItNbPP8SjJ/giDDSFSw3ziuo?=
 =?iso-8859-1?Q?uklwW1U17GMrN/nQu72l9jkGZp+ktdDR+V1vX2ZGrirVV5Qqa9LSflLp5I?=
 =?iso-8859-1?Q?nZUK0eFM9n00O8y7Uypq6AxeN1zyua7YUHtDCetZFnrYx5IYQRCSyD/Zql?=
 =?iso-8859-1?Q?xM5cyvFDNLs7ufrBEp+vk5jTV4a8S4uOd/Cf1eNtyWUONdYFLBREvQ0RbP?=
 =?iso-8859-1?Q?iK+21rH5KeTIFB38QoabbZDJl/SQbkUnHz/49LkByb/g9euXSC6Un6nUcS?=
 =?iso-8859-1?Q?ImHAk0HpEzDOhaFQU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB718419E2B512BC70CB7A56C1B6CC0PA4PR03MB7184eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca84a5c7-4c75-4344-8161-08d89c2830bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 09:52:50.0995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNMYmsyISNhA//ayoMPJu7VkntYPtCp1EaUANkXisHYIZSsK2GP49JM+MwaSFEQyEHiqbCGc4uwo1SNAlkQU8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7406
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=qdFPFxaU;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.8.131 as permitted sender)
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

--_000_PA4PR03MB718419E2B512BC70CB7A56C1B6CC0PA4PR03MB7184eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After realizing the inconsistency on VT-x emulation in VMware and switching=
 to VBox, I get the following error in hardware check command:

mjonian@mjonian-VirtualBox:~/Projects/jailhouse/tools$ sudo jailhouse hardw=
are check
Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
Traceback (most recent call last):
  File "./jailhouse-hardware-check", line 147, in <module>
    iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioapics, dmar_regions=
)
  File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_parser.=
py", line 338, in parse_dmar
    f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb')
  File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_parser.=
py", line 90, in input_open
    raise e
IOError: [Errno 2] No such file or directory: '//sys/firmware/acpi/tables/D=
MAR'

I've checked that VT-x is enabled in bios and I've run the VM with the inte=
l_iommu=3Doff kernel parameter. To get you out of doubt, I've installed Ubu=
ntu v20.04 with kernel 5.4.77 natively in a machine and checked all the pre=
vious. The same result when trying to check the hardware... Any ideas?

Markel.

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
jailhouse-dev/PA4PR03MB718419E2B512BC70CB7A56C1B6CC0%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.

--_000_PA4PR03MB718419E2B512BC70CB7A56C1B6CC0PA4PR03MB7184eurp_
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
<p class=3D"MsoNormal">After realizing the inconsistency on VT-x emulation =
in VMware and switching to VBox, I get the following error in hardware chec=
k command:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">mjonian@mjonian-VirtualBox:~/Projects/jailhouse/tool=
s$ sudo jailhouse hardware check<o:p></o:p></p>
<p class=3D"MsoNormal">Feature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; Availability<o:p></o:p></p>
<p class=3D"MsoNormal">------------------------------&nbsp; ---------------=
---<o:p></o:p></p>
<p class=3D"MsoNormal">Number of CPUs &gt; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok<o:p></o:p></p>
<p class=3D"MsoNormal">Long mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ok<o:p></o:p></p>
<p class=3D"MsoNormal">Traceback (most recent call last):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;./jailhouse-hardware-check&quot;, =
line 147, in &lt;module&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; iommu, _ =3D sysfs_parser.parse_d=
mar(pci_devices, ioapics, dmar_regions)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/mjonian/Projects/jailhouse/t=
ools/../pyjailhouse/sysfs_parser.py&quot;, line 338, in parse_dmar<o:p></o:=
p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; f =3D input_open('/sys/firmware/a=
cpi/tables/DMAR', 'rb')<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; File &quot;/home/mjonian/Projects/jailhouse/t=
ools/../pyjailhouse/sysfs_parser.py&quot;, line 90, in input_open<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; raise e<o:p></o:p></p>
<p class=3D"MsoNormal">IOError: [Errno 2] No such file or directory: '//sys=
/firmware/acpi/tables/DMAR'<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve checked that VT-x is enabled in bios and =
I&#8217;ve run the VM with the intel_iommu=3Doff kernel parameter. To get y=
ou out of doubt, I&#8217;ve installed Ubuntu v20.04 with kernel 5.4.77 nati=
vely in a machine and checked all the previous. The same
 result when trying to check the hardware&#8230; Any ideas?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Markel.<o:p></o:p></p>
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
om/d/msgid/jailhouse-dev/PA4PR03MB718419E2B512BC70CB7A56C1B6CC0%40PA4PR03MB=
7184.eurprd03.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB718419E2B512BC70CB7A56=
C1B6CC0%40PA4PR03MB7184.eurprd03.prod.outlook.com</a>.<br />

--_000_PA4PR03MB718419E2B512BC70CB7A56C1B6CC0PA4PR03MB7184eurp_--
