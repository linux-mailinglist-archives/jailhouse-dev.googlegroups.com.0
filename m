Return-Path: <jailhouse-dev+bncBAABB6PJ72AAMGQE6B4QTQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AA331233A
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 10:38:01 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id ia14sf10150473ejc.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 01:38:01 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612690681; cv=pass;
        d=google.com; s=arc-20160816;
        b=VUjU9EACBFnn6uDNobPYQ6fSMQ3VFRI8YOD+0mGqmOqzqomrG03gQDYL4tfQfyVJX1
         4Qef/+WRnRdCu+b0lpMltadfvyfsmNJYKkO6X65Rb30o9AlEHuSqVdNXVIEdyMgS3Vs6
         TpBhjeKzO9aQzhw0WL7gX6sbTkA15yWD7zbu/94F/sGHpmL7MQb/NKvuKdoX234dAZs3
         cQJJ901BLMegL/pbAMxeClaJP3gMcdQTbkZWpHVgan7dGfBf0s/VhfVZZPcIJiT+ggys
         v0ZdnIJ9emyECjKY2q0JV7XpqKWRMguUEEE+Z4YBYVCjsCwQZTnAbxFeKdVMLwRXaCGu
         eSog==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=v62yRrsd+inJ4CY633L1w82rz89yz1rN9Enz4ZPvZHs=;
        b=aiYoD2ezMAHlruVo5qsbqQ3+W304dhIfPumu8T6+VFtwmuMAFEPfLd3rvJvpem3c2a
         T/TSY0YicQEJg6vuF43jwFtaJ/XmDqcdqAb7uDL+GfRPxD5nHA1nkM/mk0nWKSEOgJZ1
         4P1mH5gjNvURYO9iitarDX6rQ+1acMg+D7m57JBlzkjRJ5Z7BHTMjo3FisCd0lj7odH9
         JhYryGgv1gGL8r3eZtBUTpfFC5u/ujBfzx11GOk2P1ingHmtvR9+bAe6yehtc7SnHSvK
         ZE4amtHMpISpZNzl+zhkg4ljD9Q9U0ujX6r4+8EQ/bpuVpN0FLtZrbTEhx28sYC0kvIT
         pQtw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EVAW6tc4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.3.45 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v62yRrsd+inJ4CY633L1w82rz89yz1rN9Enz4ZPvZHs=;
        b=k/3ezudygm1q+2MLCbee6zjuroLlgUlji0bfHjFyveG/aMcMhANlmFyjwj69/GIi69
         2tM6/wEjJY5aiUGefjeY6mNUkNSJ2vQFvdgJ7UTv1Y5QCV8kidzUW2ahzmCuo3pV2JWA
         FVFv8r9cCyskmY7nDRO1vUACvPQBz6rRiEUs/4aMpH94cE/d6PfO6caA8l2CUnzKwnBW
         bu9PLKk+WP3Lk2HQCUf6BYCbDZHS18sKspcTxGmRjxXXLxOVt+66AcccqEE1ZYBvf3J4
         gYSnBwwdxoaBiAaHvTO5NrobiNZXHuSGC+s3cPKhXwN2M8Z5WKRMzuNjEisM5L0O1Gfs
         cI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v62yRrsd+inJ4CY633L1w82rz89yz1rN9Enz4ZPvZHs=;
        b=hr+AyAvdYOldVifDi3cBOgPex0mN4xiQ81voCqWTQAVVxJFDV88YpPLEjt9C65rb7R
         59pK7j+JHHvByvxAMNLbTLEFyQBqfbpAcN0IfLPSZ+Z+isXuLyDCXukb75qxXEm7E4Z5
         5NeFQaTD3v6X9QeayAjFrHY8xsilLNeJx2YgX5LiolZu/rf7JShUjZmbdcxSGNz5W9B8
         G8rJqpv3nSRn7+2fbe4YwQTioytRNQO79Fls4YdCBtODY700IY8Ze6I2WqBlvitJRPTG
         n8IG8NKqz+4Dh8f9L38XmuuYWe6e131qsFo4uxP2iMXtFFdHdz97xV3sbPBWdER4W6dj
         S9hA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BPnCk/chcykMp52Fdr2ot73QrcMnqUjyznuRbxys31ywrJI3u
	gvsyX31PJn6hJ+jxD53cjUs=
X-Google-Smtp-Source: ABdhPJzGIDnqZPgR5TQ1CfJa55BnmYXlVU0r8p8qA4gQ7tK4NJbu95mgSS8ZLacSNKOHn3nVIJBfQQ==
X-Received: by 2002:a17:906:3ed1:: with SMTP id d17mr10329905ejj.0.1612690681326;
        Sun, 07 Feb 2021 01:38:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:364e:: with SMTP id r14ls5100021ejb.3.gmail; Sun, 07
 Feb 2021 01:38:00 -0800 (PST)
X-Received: by 2002:a17:906:fc4:: with SMTP id c4mr12294614ejk.143.1612690680638;
        Sun, 07 Feb 2021 01:38:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612690680; cv=pass;
        d=google.com; s=arc-20160816;
        b=JQ9HdOor1JNZ5nq4pr+bMyfap42xD5f3d9Awk1louGj7U6En7GqFSxvTBvwgMnXsxh
         kHfOq2i6+Uhtiic5UWO8O8PFNerpxyxBnXCG+CNsgNwgbt1/stOF/KM4VtGAnfexlM08
         RHnj++xCXSipUGsxGf5YIhYZqETJNkgbyrjJOmeP2yO+dgYiGuzMGzr5EKU9mEfbcLgX
         REr6XfD3iAzuGCac+cgWg1KHhtMmlvz9GwSo/jKuQEakTOnRmT85apfEtv0MumRXUJVp
         3GG0r9j/PXANz6TUTugiZ4RXtarGboIz7G3bio8myhfHUkDtHb+4ttncE1uZ7Qcj2s+4
         qlZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=EdVWtnOsy23C9vGVCPRyrlu5o+nF7G7KnXt0gKAJD6I=;
        b=bKE9zO/JroyGO6tmUE1oOVG2tzdkWCc9b0uR4WJdoZmGifc6IG9JtVwOcX3aM2qaTg
         umoH8gtskJA39Z797mzJsY6NKMzMdZIbFRLToosP+qYFpANElubo/64jheEVrzhfzqCj
         E1NG1e/qjt6Tx6D4Qgy2XHR5j7kgO8ZccbagTmEs2/i7NFXW6E6ZEST20KW8lGDej/0V
         50j1pZRDVnFMyJeYLgaU0d1WEKyJp7SeI1wPjXPIbMLhavoCKKj8PPqo+u/Xh1ghUhAy
         /XeZIIzvuZpd0Gw//ZcWyF3SntoZHhRF8jc6mB1ta1W3DrZojeHFUqyac/L+MHdPKDF3
         mwQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EVAW6tc4;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.3.45 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30045.outbound.protection.outlook.com. [40.107.3.45])
        by gmr-mx.google.com with ESMTPS id ce26si732687edb.2.2021.02.07.01.38.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Feb 2021 01:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.3.45 as permitted sender) client-ip=40.107.3.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCXknQasOZm2RfZNWK15bxB3tPwavJWd8n+CL9LR8ZXOQpAeOYGFswNHR3viAg+2gyOEAViSYYbHjvO8kQiqaMqnxJoKh0qfXDYAvbGFYTwiEePI30sIpisNDdupd185Nf8lg8hN452pmAEWtZ+ULKpIS2nDBrAOfqHYyOoKCurDhMTdvsKXCXKk7P2Bf99pgG+QaGKyPJIl449WO/jTwOwPDyXtZpugBe6+2kxwQCIwAYIA0qrKNTs+v3BYdcfFy5NBQcsCDEuugtzKC9IsHarWipN+OQnmlzNv2jsFZ4HD6+Gf1BDoDWRKJjPORESoQcrp3AT61jNQ0wtAB/spsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdVWtnOsy23C9vGVCPRyrlu5o+nF7G7KnXt0gKAJD6I=;
 b=n9lNg1lwtkmXeejooRM+ExezKYb41fHgv4zRdhplqzxtnyd40ap5wZ5YKJxwi0N2LCus3bY/6OdAzqDHjxcFolO4vd9sFUvRMoXloUPcP5w22OFULzrbLsksNxGnpMb7uf0VC9m1deYKllfKWPPH3H1S0D5SC485InP6bQnz9JeWKs8pAihTWA9dESOcldoNADLyAjokYtPnvoegYwXrsha4GVqnxbx7ZI60p8IJBdqHZ2Qjiect0uiVL/xrLhDL/3Uf4rYcCF202znPleMbr8yCfw0ZkZJonSxMpvhmisqGcqgHibkKkJkKt19b70Cb1wFSWm8AjqW9pIkazyJ3Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB5805.eurprd04.prod.outlook.com (2603:10a6:803:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Sun, 7 Feb
 2021 09:37:59 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3825.024; Sun, 7 Feb 2021
 09:37:58 +0000
From: Hongbo Wang <hongbo.wang@nxp.com>
To: Henning Schild <henning.schild@siemens.com>, Radu-andrei Bulie
	<radu-andrei.bulie@nxp.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo Xie
	<xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Topic: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Index: AQHW+fhwiGCPlADjr0ijwf7ZcFksWapGN2yAgAEMz8CAA7yuAIABbxCw
Date: Sun, 7 Feb 2021 09:37:58 +0000
Message-ID: <VI1PR04MB56773442B7DF4218F935AAFDE1B09@VI1PR04MB5677.eurprd04.prod.outlook.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
	<c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
	<VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
 <20210206122300.09b3711c@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210206122300.09b3711c@md1za8fc.ad001.siemens.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b2fd8fb-bb83-40ae-a786-08d8cb4c0e15
x-ms-traffictypediagnostic: VI1PR04MB5805:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5805897F4B1B727EC47D6C56E1B09@VI1PR04MB5805.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Er2TMCX4PObbseBJVSOq1M7pwfE/c9/IacSvuqA9C9JK2q/gTeoxsGf2XP5aSsiX1A06qLPjuOoDTYdd+MDOveP31ow21d2YGvE1QO01gYTp0/HeudwiCtugbvVdlCP81hHbLtCpSr5oD/rWDJOtV01d+ymFJuVQ9Xj8Ow8ek39g3rO8pCIkjGF8taefb+m+xv8zjo+xq/59kFU6k/I43Fq1WqYc/GlFH/R8gWLUYdnwCPXn1hJnVpW1RIy5hQNQ3H0/hPe5g+YQbCRqDSX/rPL0TaXKczLSdd271uIktXfHn+PniCiLdHPnQ2Oe1q276P4U3X/pfQiHAU5W37QgdzxGHgMeAvezTAHqLM5mJIZxrhlt68xhYL3A5AzadpXFJ3TOSYaQuvGiCIVQK/Ol9ki+d+xcD6mZ31Z4eUYzIRO97b/IxZ9AMgPGdVx0IPldWB7plG2q/aiD6z8+g3W3P8crh025/lalPXTB5wulxMGGGU76HaPTa8FsnhB31X9h3utzjZkfG4EfM/sRmSZxlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(86362001)(76116006)(7696005)(6506007)(5660300002)(478600001)(66476007)(186003)(8676002)(66446008)(26005)(66556008)(52536014)(4326008)(64756008)(2906002)(55016002)(6636002)(44832011)(71200400001)(8936002)(9686003)(316002)(33656002)(66946007)(54906003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LatQL2UhNyxjNw/b+kMFswwdisvy+TuJPC5nfwtzeTKqAZvsOWtBfVMkt+ZN?=
 =?us-ascii?Q?AxwguQbZXJrHzlRDFnSIoUB6zuBJItCDTiAzsXKFdEYOeb8D3sE6pRe9Opwx?=
 =?us-ascii?Q?2fORU1cQBhIS2QsuDNrTT/UR7vHm4GNxUnr0Ib4JFyANzhAVVYxdLdBULRfK?=
 =?us-ascii?Q?yIHRUdnVyJ5Z1BQPWaxG7LSLHMsxncCRizWW31ttHmcdV94mMkz1DrBKALGZ?=
 =?us-ascii?Q?fxgKWpTMmHMrHkS87gwzFJU2G4PbmTkPxY5ncirH3BpUFRDrrPannzSnx9Na?=
 =?us-ascii?Q?7rY0eBQjpnoKUbZUcoDiqNufZTsfRah7mOXM6eFPm7xnnEpSARlKAPELKr1f?=
 =?us-ascii?Q?PEoSHc9VpFzku1lfEJAMvTZvpg/s6Of3DslBcRmAvTzP8kWljpHyXdce3q6n?=
 =?us-ascii?Q?8SCLRo38qR+Qy5VAjgdl6KtMYZ0Hgyqahm6pCvxWvOX1ThNdNKfOpXiAYhcL?=
 =?us-ascii?Q?8R91MXp9utD/ceUgwZzkUz8uK0uvN0Vg6iXv3YkOm/T7Z+1wbYsi6JzQDtcE?=
 =?us-ascii?Q?+oYZczkXR4D/zte06+ADuZ/GjXI8OKD6FoLFKlVhqmpyNkXrSKkU8ciwbyOl?=
 =?us-ascii?Q?D0kEvBHKaAKK6NyrtJ/9G5hoqq4Xf644+KIsb7b5gWcUqxBcxBrDC1//CAG7?=
 =?us-ascii?Q?qPMAoyDoYJDPxU1WKBt6ZRIBR+7xlh6800U2hqDLgBAt7y+WQtV81kSlEHwI?=
 =?us-ascii?Q?VnK9beaLiE21l3JIC3rgqdgnhs5zz9JJtXLsYDjfZ/gzNK2EJq7ck0rVDPVU?=
 =?us-ascii?Q?QDYG/lew4gx4R/YWF58QAtNRSqFDnx8Z0IKFc76MqFnpFbb4Wbz9Cl1j0GHe?=
 =?us-ascii?Q?z7rC0TIOIoXnL8Nnv6qoPAnYaDRxXij47sFH8PERS4S0URx5zmNnbVz+EZud?=
 =?us-ascii?Q?dw+kRELyNtRvcfRsl17eyvukHfClJL0LExPSDee5wzc8x+eOVfraS3QYnrGc?=
 =?us-ascii?Q?6s15eVRJe4i8L/CMgnlnuBf+gAxu7/NO4Yb+1TtdJZ7488T9dw8j1RQwDUFN?=
 =?us-ascii?Q?TtY58Tnw2Dldpa0SxU40up8NP2uFYXL66Ax9MCVRF+0dZNxZVlKfrN9lzYwh?=
 =?us-ascii?Q?cmvKdPaAmyZka5APRnENYjRLTlO9En1KiYpUmTRCTYBW95GCCcNsl+EdLjF/?=
 =?us-ascii?Q?FBr9yw9veRCB7PgkiXzR06nLeH2ixqi4VCqHDwk7uy4kYboUbTPUPf6JQEmw?=
 =?us-ascii?Q?k+2aNSjjPn4R5qlmSQQRiWnYx34rF4wNvO1m6tDbmkGdbMvJauHvXdPPYJNH?=
 =?us-ascii?Q?1AQpmIrY9+zlzII2HXHhx8pOKcbV5ldbBvfPIBepnVQzB7bW8dz10+FtfMrC?=
 =?us-ascii?Q?qq9jCsklsG4eZm1DXbE8RXW5?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2fd8fb-bb83-40ae-a786-08d8cb4c0e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2021 09:37:58.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vhruo7yPnnKddmoJ8gHTeHJ9C4DFLDZse3Km/JHBH3BRiTML0hfvQjoatWBM2X01M5hWE5FHocD290IUX7S8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5805
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=EVAW6tc4;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.3.45 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> > there are some case that user want to non-root cell can connect
> > ethernet and cloud via DPAA1 port, and test their performance, so we
> > plan to add DPAAv1 support in jailhouse.
> >
> > in this patch set, all DPAA ports are owned by non-root cell, root
> > cell don't connect ethernet directly via DPAA.
> 
> Radu-andrei Bulie already has a setup where root and non-root can share
> DPAA1 in a cooperative way.
> 
> That depends on driver changes in Linux but in the end is much more powerful
> than what is proposed here. But it also has nasty implications on isolation
> between the cells.
> 
> Handing all of DPAA1 to non-root is an extreme case, next to leaving all in root.
> While "something in the middle" seems way more useful/flexible and it would
> be a shame to just go for the extremes.
> 
> I assume that people will want that sharing eventually, so it should be
> considered already to see how it fits on the second "extreme" that is proposed
> here.
> 
hi Henning,

for this patch-set, we want to supply one operation for some user's case.

it's a good idea for sharing between the cells.
we can also optimize our use-case when sharing config is accepted upstream.

thanks,
hongbo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB56773442B7DF4218F935AAFDE1B09%40VI1PR04MB5677.eurprd04.prod.outlook.com.
