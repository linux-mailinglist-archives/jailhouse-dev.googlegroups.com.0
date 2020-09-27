Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBMGOX75QKGQED6XQAOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4309A279D48
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Sep 2020 03:13:21 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id i10sf2946340wrq.5
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Sep 2020 18:13:21 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601169201; cv=pass;
        d=google.com; s=arc-20160816;
        b=EU8zlpTtwvqqvifF6uViBnwPVbCI2mLueB2eaz99IUYdivTK/zueZOwibGMRx2i4hB
         N2mEQtcypLKuENtSFqIeAbJHyTp1dXvd/OggCSw+jrM4pyYhpkOjCeRcvlOHFxemk1dV
         yw+2DbMcVMLdM8bm9I2j69ENENEfEjjURsLHCn8GhlExQsli1Bu+fKL7A/7EICaoxdQj
         YGtzBwb135jKWxApX01sUjFY1v9ST/0xu8AmPAMstzFPB6DGPMENkGpyCMxcepE0RpMb
         zdBbVHSwXkdjUEObujd/IfXUIqFsW1MFZQpT1Nhd+Stmm2Pftal7AnoSDSqnkOvLIesl
         w5KQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=QsJSjVJpZP99wdMiP2Wmrh3l1wUj18x4k8oZWUGCUEw=;
        b=swdhs/1smwGR17b+9SCqQB9DsiPjb+PdqbL8IyNZhzj7B0Wu7y82TfL8CeJ7WSh0r3
         HcHr/f9XtllBCv+Twi8boROBgVqrqx0E6jyUbdVdXLybvVwepBqds9zR8+E/egCw739V
         m8kb9AJbpUZ4cvax2ghCmOBoefLpDPHJ/Z0PRC01K83IF+Ix1za8IgWN52tYkwe+NSL3
         uq+vIL+74wQqNivJidQ2aHUGOzO204oSGB+d0ByDMTpBUHMhdHBTW3TMwwnpUctOOATO
         vg/gQ1cuZfKU6E4mprVxLGe2G+gSHRCXXWr1vXAzQrwsTOd6Cl8FcR0DIFQxlPNAYCLT
         rAwg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Qu8SSGtk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QsJSjVJpZP99wdMiP2Wmrh3l1wUj18x4k8oZWUGCUEw=;
        b=P6NdII1lFl6oNU25TRJP0pIP/oNyJe6pnYPMtoWdntC2P+ZLJpCen8uF21LJUzAQbP
         h4sQaTSk+MS3X4HYAe5ka3EU4svOf+JDRnoTOI16l66BRtNm5TSzM5/jSK8nZWy7OycQ
         98xirGaIWztEeqLqJdnqQazkceG+thDdQ++YVG4SSkzX29M+zjoWHTGGlJEnDjMdL2NG
         8WyFerQWZ95/aVQAxD76pajQK35bDsTnqhne3SBlen0ksz6W6YQ6Kh2KEox4ps0Fztfg
         2ZagpIEYS19mcGOnp4EkDUtdA4iH6kqPwe8aDszaDZ4MXKRuxn80Pg75V1rp+mRJtuxT
         UVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QsJSjVJpZP99wdMiP2Wmrh3l1wUj18x4k8oZWUGCUEw=;
        b=h+MS5rLtdgTpZF3aseX/iPJbrY/R2XEvPyxaZncZZlgerY5yo19UX5cKQ3YL0laJmE
         ljz5Htn8iZF3mlXEya7z2Ro5LCujTe0s5AVvPKclcvgY5aCClZ8PWsSXve6KS9flEez3
         +HtL9yCqH30kV08D3ltYz1WRtT+OdLWX9DKQhkDyUdu4CcTJhvrBg+vzztUt5aEP8vqP
         kwlPUzNS4NA/LHH2KHrN75e34F9z1qxkygNgqXVsL/CRHwxXFVFtvPDiZKIrgbQ7Cacg
         gzx4xKaW0bn8rZm10Kx5i2mQJEBjMLhEomfM/pn0bS0Tu54zG+BGJ39D14Qlitmzpju3
         TiIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RsNpKx5f2j6itVU2/SmoGz1a4PaIWlmtEQO4YXB3EsfV26Njt
	Bw4t6qRe0jgZDzg9OdmLN2w=
X-Google-Smtp-Source: ABdhPJwW5swyyzhLI8XwP2C9Z5JHHGB7UAf4VwDMKxRlVBkMqeLQ4LalH8pJHLFRsfDsqeDhs8ZEUg==
X-Received: by 2002:a05:6000:100c:: with SMTP id a12mr12319957wrx.115.1601169201047;
        Sat, 26 Sep 2020 18:13:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80d7:: with SMTP id b206ls1346915wmd.1.canary-gmail;
 Sat, 26 Sep 2020 18:13:20 -0700 (PDT)
X-Received: by 2002:a1c:31c6:: with SMTP id x189mr4941477wmx.83.1601169200031;
        Sat, 26 Sep 2020 18:13:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601169200; cv=pass;
        d=google.com; s=arc-20160816;
        b=hqDUhX4KeqgjRSJoSGpURy/rnJNctb1ODWV7Rf5jYYgInM43YtiB/3N4/mCyfgeyNd
         EOnU3L+e7Hc2V+z22n1VJFOZp1rP2Djw0E3SuqNEaNDWN+L2qtG6BBVzvsfIGCR4sVCG
         rRaUdq9AF2Y6wsSo7U5ipwXD0HxtT+BjTrsenRTovPpKwK7jMarMEHxZBgOc2hfLAdQO
         oA7DL0kdQ0asGXmyUixeYfDRWFP9kP7jAVtHEhXUs9nVKdDCDrT5ZxQluifEiB37xX+w
         83RUicfGJL9f3mYUIijudBFnZ9AJXj7/qBDzDA9oIkXP+zTDGa+rPyjDm6wrYgeaSy0V
         USXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=FAz+bwMVztP2kyPsS0VB8MY0gxl/17MwUDLzsT3jgKY=;
        b=giMMFWfoXXqpaWbqv6eIQlwZQbe6uJAKeixhhCCr2guam3dF4LaTBUrELu49jJ299v
         WsjS6T18LTghzRiU2Z0DruqEZsasmuyVsjccMKJB3/UUinbHL5QwyUoI2UdaS4jyRCHo
         tgeUG9Qf8mViwl1qESgo8+ToZQOB16CBDOwrSM5g4Bf+0Lc8WEsusJMr1Kt6MT15DIF+
         /Vq1g7HPyYuEZc1scJ3d7nN+5rRS0zMfERoV8j0Ee1FBOn9Qq9ZAEVe3jO7pTItezyo9
         cMMJBu7oiSMsVpaPH9wS5ym0LTy/kFrPivXyBCSNfgD5F9Ohj9sny7OlK1+TyD6TsvdM
         ihUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Qu8SSGtk;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60043.outbound.protection.outlook.com. [40.107.6.43])
        by gmr-mx.google.com with ESMTPS id s79si78603wme.2.2020.09.26.18.13.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Sep 2020 18:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.43 as permitted sender) client-ip=40.107.6.43;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEoW6piA4xMQBLY1/JgS1d5qOxh8poc5xkadwKdAnDiaw1EVQXWKBQhMZ3BtBF+yXLWAplVDXcAwGj/xFzSw748bpwV1S+JVO1QIJcHp1jV/GnqpWjx2tWSam/OLejTrRKIIFjtZ9dMuITfwrvxiV4ixspVzmU3sLEZ77kNJ5ct0BdVQCP1R6wVHugtBdXK31itavzcMot/wQB0t013WUz2INtNk1BhAFni2hZrsMUfS3nzIFXsKZaKhoak+jMI8qFcAZmzGIktfJCw1Vru/eN+cujIbcyin4bTbbLVUcO5AHClLlWxFc5Y5GBdyBS9edJ5DK9/Dslnh/B88mqhFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAz+bwMVztP2kyPsS0VB8MY0gxl/17MwUDLzsT3jgKY=;
 b=OiLf3Hcwg/ovlworG4cjrzkKg7tQg1hCiQv9bgdO+o2Ks5eXm9atjtxUj0rgcbguHSnRjChfp5mgV4t3R1zu1uASTLhoTYoIz7mOU5+vZlIlsNWk7FCkbxCnP737MOK5xiezyV/xXUvtCU3jQi3K9W7v6fa3zOeR6znYwr8G/+PyBGyZlDbywWk2EZ8NzyAex/lCFCNs8WQ7tsVy4S/3BG2B136ZAw7MXjRXfXMA16VABEfwI5ggwV0FweYzkJvC8YfSc9315kd6aXkxwPdEKwf59vBL4VnPvqA5UVmWIJqjdVUCHp19j/KQugw+0sFcUDjeXyjzGhYH72yyNdB3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5660.eurprd04.prod.outlook.com (2603:10a6:10:a5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Sun, 27 Sep
 2020 01:13:18 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 01:13:18 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Topic: [PATCH V5 5/5] configs: imx8qm: add configuration files
Thread-Index: AQHWkKwNK0JWEvsu4kGyPQM5pp+tJal49wyAgAACHmCAAAgQgIAACeoAgAKpIPA=
Date: Sun, 27 Sep 2020 01:13:18 +0000
Message-ID: <DB6PR0402MB2760EF8A41AFC17F8571BB5B88340@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
 <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
In-Reply-To: <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec15b3a3-4761-4459-029c-08d86282848e
x-ms-traffictypediagnostic: DB8PR04MB5660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB56603294DB48798AC7F5551188340@DB8PR04MB5660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YFqjnf4oC1EVQvqMjvuWrMPZjmCSsy7oUUWzGmEUvuuJ9uB6H1d0r2hq6IPVAXxMskbimliuNKcku2c18Nop1lNqGV0iQZU3jEvZeSeECangShVY42Vl2gKc+8rq5UDQ2c8aU4gaVFpKkXCAXSbt/LCnrMzlhBPerH6PZRmYOBPCgdxoKVNyL8kmQKyXl+vyZxdgerWVVhri0IkJzuEaDi7UbdDq98EMuPKljm/xQ4e29Bw+p5tE2WBWeA0cDQxL0WklGtKNzm0cb02GCuyMTHPBXaoMT0aRn72rtkURAyVCVZvdS7K1i9Q/DxxVngbdsQRcOkYfUhbyfa+gRkc2J37sWPC8wnv7XmKckJ3ts33XIHXJAzjP6UtGivCNkZ2NhYetDxdS2LlJcRYBQgDdElf07l45BXgrACwGyo82tcc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(83380400001)(316002)(186003)(7696005)(2906002)(66476007)(6506007)(44832011)(53546011)(66446008)(64756008)(66556008)(55016002)(110136005)(52536014)(8676002)(8936002)(33656002)(9686003)(86362001)(5660300002)(26005)(71200400001)(478600001)(76116006)(66946007)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 6jjKJl7aiWZK+KN768vIQuXKi8Z5gpdbmkgWAcOC4RB0/CTKleqe/1GvU5QKz93xlt23R2fOqXYTNleimXzG0A3ASnr41To8w8ZhIEU1TvfsxzMznMe/mwZi69PT4NHlOtTQ5gqs5LIV+IeHTX2IY9Fj0jJO6p/rU2pU5zwQTcILmiVkJnecWP1UITJZb4sGQhIFmfUAjlLTpvwdrdG6/siPepjaNwAZ03Ky4HkHPhDGAze9i13lOkr0Ozboo8W7e+EFgzqhZ8ywIcIvGkJurZ/6y4DGoAaW6Vhl+03yTGGnkaGCd7zylAFjcOFkhpy18s4ni5Ax04qV6j3ESt9bInpbtgjMj95vqjImkKVNOUw8eozDc9AopNAClssU2BY9Y+UGEoof7cNyAIPC5jWtCcR84cL9MIeRLn2ron+QA4mtzRvAL4FvKmCKyMgrqQHE6/D6ZZgPPPsKswIjSkxGR6gRPlVbuBjn6zJbdwzn+afPeYQQpQ7tXjE5mLhx8As50P4jrjAWRlyhkqOGs5NAMW12MiEo4iawqaLN2awM0bWoESOjds7YTZW/TTAcm1MRYc5tEEy6CcHqaOJVGFFmGVb42ubsTG3fI2HhBBfWr1yoUAj3E02A+TFoAgs4P4+j7VuSSjFO+7DeLPtcWwPpiQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec15b3a3-4761-4459-029c-08d86282848e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2020 01:13:18.1195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXtfFY4vTII8Eh8fVeVZTK2H2l7HAh/5rWxFn4Lmy1RJMdUBlK5JfU8oHHeUZP0XkqaffOFRSoaDp5DEev1wGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5660
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Qu8SSGtk;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.43 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>=20
> On 25.09.20 09:55, Jan Kiszka wrote:
> > On 25.09.20 09:30, Peng Fan wrote:
> >>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
> >>>
> >>> On 22.09.20 08:45, Alice Guo wrote:
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/*
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * .pci_mmconfig_base is fixed; if you change it,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * update the value in mach.h
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * (PCI_CFG_BASE) and regenerate the inmate
> library
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_mmconfig_base =3D 0xfd700000,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_mmconfig_end_bus =3D 0x0,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_is_virtual =3D 1,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.pci_domain =3D 0,
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
.iommu_units =3D {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 {
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D
> JAILHOUSE_IOMMU_ARM_MMU500,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =3D 0=
x7f80,
> >>>
> >>> How is the sid_mask of a platform retrieved? Can this be derived
> >>> from information in a normal device tree?
> >>
> >> This could be get from device tree, to i.MX8QM, iommus =3D <&smmu 0x12
> >> 0x7f80>;
> >> 0x12 is sid, 0x7f80 is sid mask.
> >>
> >> Sid mask is use to get the extract the exact sid from SOC internal
> >> BUS, You could think as below:
> >> Bus signal & 0x7f80 =3D 0x12
> >>
> >
> > Understood - but there seems to be nothing like this on zynqmp, so I
> > tried both 0 and ~0, so far without any sids assigned to the cell. I
> > would have expected that something breaks then, MMC e.g. There is no
> > error reporting in the SMMU code so, thus I will simply see stuck DMA
> > requests?
> >
> > I guess I need to study that SoC to understand what can be expected
> > there, i.e. which devices are under SMMU regime. Unfortunately, I do
> > not have the MX8QM running here yet to check your setup.
> >
>=20
> I do understand now how the 14-bit IDs on the zynqmp look like and that t=
hey
> cover all units, including the SD interfaces that I'm currently using for=
 mmc
> and wifi. But leaving those stream IDs out generates no apparent error.
>=20
> The SMMU seems to initialize fine (I've already cleaned up the output):
>=20
> [...]
> Initializing unit: ARM SMMU
> ARM MMU500 at 0xfd800000 with:
>   stream matching with 48 SMR groups
>   16 context banks (0 stage 2 only)
>   supported page sizes: 0x61311000
>   stage-2: 40-bit IPA -> 48-bit PA
> Initializing unit: PVU IOMMU
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "Ultra96"
> Adding virtual PCI device 00:01.0 to cell "Ultra96"
> Page pool usage after late setup: mem 63/991, remap 37/131072 Activating
> hypervisor
>=20
> But that's it. DMA is still happily flowing. What could that mean? What d=
o you
> get on the imx8qm when dropping the sids from the root cell?

I am not sure how zynqmp use SMMU and how their bus signal looks like.

To i.MX8QM, if the IP DMA has SID, but without SMMU context programmed,
the smmu will bypass the translation per the configuration is bypass in smm=
u
driver, so if dropping the sids from the root cell, it will work well, no e=
rror.
Same to inmate cell.

You could try to not bypass SMMU transition in smmu driver, then the system
might not work well.

Regards,
Peng.

>=20
> Jan
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760EF8A41AFC17F8571BB5B88340%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
