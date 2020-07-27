Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBGHV7H4AKGQE7IGSGUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA722E620
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 08:56:25 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id x190sf4064715lff.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jul 2020 23:56:24 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1595832984; cv=pass;
        d=google.com; s=arc-20160816;
        b=S1PiLV1SDBB1ErHjwUnEGfS/CIy4gd5kASDK2OfrXPMX8y+f4m3UuUIW+Uni0PC0lB
         dwg2silO4GJi4SZnGC6QkcwxHO0vqAMCzmVncx6WSsQUFMnjE64th2JM05FFlwB13Csd
         6nbIJ1MgouUIRdIOz7No1LzoQJaTqC6MzRGDRga+d+F7hom6G9yU+pCivXgVGRqcOK01
         A4ZEvuKTN+eGl401sMUNih8D2RdcHewED6AisnEdJF55Y0EpY62RKLwriFb2g2EDEVQr
         xLKyI7dAPFynzcWS1kVckQTfpFhR9f83EaPty3Z0H3RAuqCrybhL3yboOA7vCkk4ZY3V
         fL2Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=YOjQLVYuweOFDF2JR28tHDQBHRrbv1ckJ3K058M/MeQ=;
        b=vp4aVNTsPGSXSwEcuXnv7zSoL3M+iu82obEjX44LDGBnXslW1BFOdVF9hHY3VUsi7F
         guY0Xi37SkjQ3PN8212jkG8533QPq8UvU3icAWivD/PhXcENXUx0EqvVPhv14t4cBjAG
         kaETzIkMjINWMA7cBpNTogpkzXGYMcDdF5K6sAevGux2zrRzuKlIeGYUx7SPB5UcAQ8b
         oUdcE5yHkLxvEmVLFwERCxrJPhbgYH0RcTuybmahAqImJmkopUzDJfekezY4oyq7IVeo
         2o83yypLtMgwbOE8e6+6dhM+IRfHa+r1sLK2+HX8ZW5PE4xJ2fPyaMUe9j29T8wooQp3
         OeLw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=USba9tWd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YOjQLVYuweOFDF2JR28tHDQBHRrbv1ckJ3K058M/MeQ=;
        b=TAXIJM3iaHu4sDWFX/3l71E7Fy8rvAPDEUZ/MZhtmRfS+jgl0iZ9NegMi2Kplm9mSK
         T58vtZMUWR/OoCiq7oxbzpZg6w3m2A6ifHbarW6qevqy4WbUPNV90pTRTiXiG3H05FkP
         iOyuuOqpoLohE2omM6t9c+uaxu0qvsWj3uq6ljj4YnTcGX0cOUejbQXjiIko6yATatxq
         JEWckW2HCG3+Z3wrLs4PL2tMj0fcm1Ci1+aZoJmfIVm5DF2g0yP79/XN2n36RSw93nza
         tmmsSO3iifkfORjBESvRF0AUhDguvw+PnwID3964E1EMovj6vKo8ap4SE+2eDup4Z9b3
         IHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YOjQLVYuweOFDF2JR28tHDQBHRrbv1ckJ3K058M/MeQ=;
        b=sF8VT7k81+0uwba3OquleA3Cl3UrP0G+L++uP8b78b3eMSMuA72Waas8wrUGBanCJb
         tbj1cAvqlhalaASp3WvUreP4XxBtXqWvtoPrKnDJualJnGiSWFQV88f41OZMN1xDrvEy
         hIbBza5tOt3lhwy+BvYbLSuWLjZRnGiFTBnJCn/29Vcc7rOHstdDWvT5Mjw/smmtpwqB
         Q9C78DYPxQYKw0Mgz28UYGe5mhrC2P+Ls5UO3w7F1aOu22IOVd7xBA/6dyJpRMwU1Alb
         RsOjb+UE0MQfgrdid4XRRPj9b0me1vYBqMTpB6567TE0x19PLSFddOWT53uWcP30QPKM
         TbXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53356h5puPcfHsAaZSX+p7x+tffbOOPC9WO9hz37e4evCyoLJJmV
	pOVMk8wjR+Gwi36x7nzpU0E=
X-Google-Smtp-Source: ABdhPJypvq7dAI0zSrMg7FqPTA/m4VKcqdUl1fkRE0KtS4zXfodDeWUL+B2N310hSRcUM+FLBWp+DQ==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr9389345ljg.120.1595832984561;
        Sun, 26 Jul 2020 23:56:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9190:: with SMTP id f16ls2670827ljg.11.gmail; Sun, 26
 Jul 2020 23:56:23 -0700 (PDT)
X-Received: by 2002:a2e:161a:: with SMTP id w26mr9744540ljd.369.1595832983755;
        Sun, 26 Jul 2020 23:56:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595832983; cv=pass;
        d=google.com; s=arc-20160816;
        b=uvo0YHGeYLQ2Xl/DC8DojUcvpRx0JndhEOTo+LztZr9+rYXUW3xkpW4ijRW2HqG4YB
         qhFePIoY+eaPW1pZhd/m2bWmTNc8YOZcB2Rmttrgg7mtho9g9B33pU7gBQTsdPv2F208
         NITNdTfy5fbFBP3VokvZkKFG/p8gIL2VnRBDZUSZ7Z4KSSjMWYBJPIn4lwc547B2r2na
         VWOdMpkknCddgMzP1H66R6EnyVJxEjnTSw8IdK5RKY3kZaE4JgblbkcgksnwCHekjEM6
         s5sSzD1d6BjlzXDbQm6Li7NzMLqAaY9FOegrD1FeKFFNslvUXWjtfIjp6j9BmyQ/Ey3u
         ylKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=oJwY9hKJTKUBg9seIfAU81kbKOd+8Q69/wT+HWKySfY=;
        b=oQ2rX5cOBDCik0JpyMaFV//UU+WZ+51v8i3n6GMMLwRnDHhQHHh7l9n/PKVItcgZRl
         GhULKzd6Js72MBRlwKyrfHJmv+ON+akey9cCopsqiMzxF+Ys19HkM4axk4vS5vVH1dIO
         SA2ciFxUetLZ4HXr/j6pjWh1R4UQZmVuPIxmDbpqTMhLKEfJgI8/v+g4ZuGumO0DctrM
         UD1kHs4YGPLTqAooBfnH+LYFDS9aqtyox5EZgJyKJv+KUMH+dIQ1WrbrwPo6aCghD3fw
         HFtj74XPeBisJVHXu7wIVAiDFNMiB1RPzmTdNQkMgsruQyokbgAXlfy8GuyWOjJmgRTd
         TjQA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=USba9tWd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10089.outbound.protection.outlook.com. [40.107.1.89])
        by gmr-mx.google.com with ESMTPS id c27si322745ljn.3.2020.07.26.23.56.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2020 23:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.1.89 as permitted sender) client-ip=40.107.1.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd4MKASSI7qZxN65B0JTWa97nnEq9tIHCffR7Szhaa4g2lUu29pDbChff3qdj73rKpTweD3rPJozDusNlG+6Jo/wsM9TDJzuermpuybYnwvhAn0HpjhwUPLP/ZxW7w+M0ETxQ23fY2zKpPStuyLwzLkYqpihzIOG16n44ZTOL1lnvGQMPUc3kTMgnF24Wq4Hqtm9gsI20kAQuZQS4lKTft8s+hiJ2ftr/MDSMIrW6xRew5mo5UwWZj3r5pDEAA7/+JQBDlQakK+ysoQtE548yHsQhFHNZAbcu/BEDZWPwvV91wVFtwCop5+bKeV21iTEmgJL5zsCIQxHXdAY0vT35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJwY9hKJTKUBg9seIfAU81kbKOd+8Q69/wT+HWKySfY=;
 b=HoTHP6En5XUMSkiVNJwtW6zdYRqfUvdU7O8PPbFNT1TZT3Mkw8/o8Fpzc2uhpzVk7UgWQmkehKEB185TKoYljuE/08u2J8pE5785A8OUrIei8GiojzUaVi3gmHzFB29dyPa8mLxZxZeFIytbXFtkdR0Kswart/9/ndZWbblLzHBJO0DX92bJ3WnmY51pnQqyGNK//5exslI1baZ5bh8XO3dpbymSwe5W0p56UUo0cruuHeYXShfGhtFFIjNsY4jkZFMAbEl01tiXEL8yhCwflpMHKqlHy9JPOaMQCEJOrNElqOYnghdg5Jy2tiu8ND4NmuqEogHKcUM2E3tYjMOjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 06:56:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 06:56:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Angelo Ruocco
	<angelo.ruocco.90@gmail.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, Ralf
 Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jose Martins
	<jose.martins@bao-project.org>
Subject: RE: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgwADlDcAAAL01YAAAMZ8gAAGw6oAAAZGpAAALvHKAANegwUAABKcb+ABLTLsQAAAvACAAABJEgA=
Date: Mon, 27 Jul 2020 06:56:22 +0000
Message-ID: <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
In-Reply-To: <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3ffba3ab-9d69-4967-00f9-08d831fa2c1b
x-ms-traffictypediagnostic: DB8PR04MB7051:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB7051E5148C91E1A17EA1999488720@DB8PR04MB7051.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B8CyrVLKGRapTx35yVl9zD8CpPi9tml08UEZpShO+k8xSiIUQbTbOcIyt8dbtYl8ocGeJprPIwr2nhau0A4FgrSBsXOdBIxqOQtQc6pMzqTNzls13kW1oOKBgorDH/gE6iqISWiT0yfc3A/OEN0eLMA1SnhDxkT8Mum2bp7BZ+0CTEafbW6fjRIx9NX2Znu9mxrp447QVyYo7bbawrHt4Y/yQK2j/8o/Hca9w1+jyGVVj729ip3NZjkGKwRugwS7UaofgWyF1PkAiqTF1Lr71eensTTJ62S2Dn8IwOMBpQy2AizxhsCJbpXstWwaUe/T/t9Vn7Dj5U5mLXguIGMFBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(3480700007)(26005)(2906002)(7696005)(66446008)(52536014)(8936002)(4326008)(64756008)(86362001)(33656002)(71200400001)(8676002)(110136005)(186003)(66946007)(54906003)(53546011)(66556008)(7116003)(6506007)(83380400001)(66476007)(5660300002)(478600001)(76116006)(44832011)(316002)(55016002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ck368TXvLW9eyNYVSvhJ7gmpdl8/a2fP8X7Xvw5Xejo/j4rwhQOOx+iXKi5FVeA2qdqcY6jCiL9jbszwDAoGPDMd4huYd+HZanbJdNxSdssCrNmGSGEDpIUJpLVLeJc5eowuYZV9bE9mBMWQHIdvOVKkR5I3sEJuhr6uG5R3UEEXorCJHtkkRp4UYjeCN2y5t6Mu1NHBYs2CweXKI9QOMmOG+iYKxIOdLWYrVhb5zVQBv51LobjTRNp7QQbVYXZYZij0OGa1CfVOjLaonGE78Pdg9C1S9sSV0CSdgAv5uti9SPEWF4w0heEdBJdFARdtmuo748obfswvxP6akFG5NGdkpTjOOtvNU50IwVpk3J2B5G1F8BJ19y+U3uvsuozhk9oD/Bo8y3fAs5H/aEJJ//pqQKovH4L2FdkbTErRmnQdYf9mQaGHen8gsbYDgTvlAKpLpBC6YxSfxeDSzZzyxJaF7qCD8E/AwQDepTDMH7M=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffba3ab-9d69-4967-00f9-08d831fa2c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 06:56:22.3607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDSwZxL0YiYXK4ZGdf6mA1kWAd7/gO48R5UmpfOR9WiiZXelBGCF9yfHvC7Derx0CeZBBM99tXk+TYk2JwPNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=USba9tWd;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.1.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> Subject: Re: jailhouse jitter?
> 
> On 27.07.20 08:25, Peng Fan wrote:
> > Hi Jan
> 
> ...
> 
> >
> > I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
> >
> > Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the gic-demo
> > jitter is 124ns~246ns.
> >
> > Indeed no more vmexits.
> >
> > But the max jitter, some times SDEI bigger only when program start up,
> mostly because of CACHE WARM UP I think.
> 
> That is one source. If you add a warm-up period, they can be mitigated,
> though.
> 
> The other source might be last-level cache sharing. If there are cache-miss
> counters, maybe you can check if those increase along the peaks.

Yes. When I add stress-ng in root cell, the jitter became larger sometimes.


> 
> >
> > Will you move SDEI support to jailhouse mainline?
> 
> Once the to-dos are addressed. Any contributions?

I'll read more into your patches and check the to-dos you listed in the jailhouse
commit log to see what I could help there.

> 
> BTW, did you have to patch ATF for your experiment? Will you upstream that
> patch?

Yes. I'll upstream that. Quite simple, I only enabled one SDEI private event.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27609A148CE4F1B5DC105D3088720%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
