Return-Path: <jailhouse-dev+bncBDGILGE54ELBB5UC42AAMGQEESCPIEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F630C644
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:38 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id c22sf11773864ljk.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:38 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284278; cv=pass;
        d=google.com; s=arc-20160816;
        b=cA37MURAm80Mg/wJtxlt7z9m7l/9RSXHazDgZwNOuk/IwIvZqCp0CHQPJ0S6naycdu
         BXbhpf1fCuXR5A0BjZKLaa9GJUmW4vsQNwp1nQZsDgIwYjC3G9CTdPb8YSCid05qLaj5
         gXqjmCeW2GBqVjq16xwZn22cChYM4IEcLEIs8g/pgzD4rddmcI/IrcdF4zY6kmJ7BjsA
         15lGfDFTnN+erAFkA/Koa0fb38oyiQjHYk9yIAIjuqB/h2DLJBamzZkTi8x/3/rnxQ31
         GFudb/0z5yo/JFG6MVILqCW7e0ib2LIoHBpx+xxK45YcK6E60f/ExX/C4+kMfkDQUPtt
         updQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=g7njyArIm9PLNG1Pmj8MZFSCFtEm2G7GNHan4fHfvqU=;
        b=an/PokUGVb/p6SfDlOsPCiKLHr95TdMg6S5GA2CIXrYIDc08/y118K1VyDJ7lBUqy8
         afGVPT6A/eha0oi4ks3Byui915K+15KvOMTEyeK94Iidmns0HVDx/jyew6DJSH4VJ9YC
         dVroQ2Dy2u0FB+aHzzX5mjFKb7DqXEsM9jUyGN+2mbAIuBBQ1zEFfFnxbQuvUtts2zJi
         toZfJrtG18AKLyLoVhWKGgpxzQcLoCROrs65+gnuMmhS4GNataSSnr3B1gTd9UsLYEmO
         nSjfq6pJWLNsyXk1HLfuH9q2zo1YqgZYyrvwK6IlbPOob4ctfvwCGu5U96TcVKtB62QL
         TbSw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=GFJlZW6U;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=g7njyArIm9PLNG1Pmj8MZFSCFtEm2G7GNHan4fHfvqU=;
        b=LfOFRA+N962ROUHTS6hZ0pJNwy5K0e3knmShq7xErgYzjPb1VwfJ5DYiu6o2OeN4Q/
         IEA9CwIiLdS2Xkt6O2QE5pJfd6l8jCPW7hzn7WztSBHmvKR8ZaSyP46eaKNro8bsX6IA
         NfxVpZeh3rqlclG5E+9z5Q/kLe1APnHpxkdrWfS974yJQCXG9IIH/3Rl7k7Lw4VUvN2Z
         tb0+qk545ODFli2TpKuQdehXH02C9LiqSaZKYdHfED9D9cEsvBpzOPW+FOGYeC1/8exa
         05aEysYs/G/Ene4oVOXVyjCxz42TiP4BMzP0FK/soh28xiqdH4Ww3ZRhgOoUUU5hPChM
         7xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=g7njyArIm9PLNG1Pmj8MZFSCFtEm2G7GNHan4fHfvqU=;
        b=nUzgBtAYzCEoR/2SJS5i0F41hOSYbU71clKfbMTGFEw421hzv4wETNvd9fbE3Gb3SW
         gy85vgUBK+qgfU8QM8CBD2mvT5TI+nNY2rskwltkqB0wlt3BqpF+f91LHHX7xroB6qK3
         VNLr5eZ4PNuje6pK4PuVP8uaYuQjGc6hTfrFXviyGGJtMNjvEzlnYQy8HI2RV2Pg/ryS
         BYEfXJlH1c83o6JocsMgbX3fvrr4+OwhTHi8u/+j9fFDHWmLgUmC1N3J9FH/a+OSzNLK
         kSjKDxJVHHw+BjOZE3s3mWJqrh0VWOuFUaz1Q3GMZlfz01GEJpI1/efMqttnxG8Ip43p
         s1Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532lFuZ6bts9Wy171ZrjD5talH7Dcqp69H+7nxMuIlAfegsKBbHp
	DkbZzKG0s/XnYvPZ12Ivo7o=
X-Google-Smtp-Source: ABdhPJx3gNFxy6tpzCbVJIMfZ56ZmmUaEhqL2oez0txUZ0+hZbk75JgGbteTQXOE6R4OrmzdvGhffw==
X-Received: by 2002:a05:6512:234a:: with SMTP id p10mr11074652lfu.416.1612284278526;
        Tue, 02 Feb 2021 08:44:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1397:: with SMTP id k23ls3915093ljb.11.gmail; Tue,
 02 Feb 2021 08:44:37 -0800 (PST)
X-Received: by 2002:a05:651c:39c:: with SMTP id e28mr13657895ljp.81.1612284277570;
        Tue, 02 Feb 2021 08:44:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284277; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jvc+NBOzXNHI0r1g5s33a6umuDymkAKrYzRz3OyzS+CderfW3r5VjaG6vCGlTENkNx
         FIyudSZYWJ7QsaNXNT4WZpt0MJOeWTRw5HTGHSb0WWvf8oAS3G+vSj0tXurNaxn5G8/J
         wnGAsP1jdLguVXMZcO91gaibKOTgTTD6HxdjHtIHzzuXd2tGp1/qtdnDFLrI+d3KRbO8
         v/7RhG2My6+N6ET+vVp69Tp95Bys6FbL4wzGV0iNJNXkh7hMB1NQXD1CpE7nF3MuWwgi
         EKkA30C0enltNG/4iIPHdJDtKdTsGJPX0HV2FxP2jRvUaxzbMM1SiOfMtXzzw7QvQefk
         t0FQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=LjqqtpQKfW+y/F0voAlTarI9qQkPRyYC3ULlkUmIc+o=;
        b=vj7kysrj0WxRfTSgrT3ZpN9ZqVn5h1/lU/uYeFKh3I29olIL1EYjY7L0QKjLAFT3Ta
         FmarWDjWd44LOFmyf7ZeDBetr0CPgZ4ep1gqsnrAo7LRGNLz7zURAqV+8qaZLo9yG1UL
         t1XFC770F+UGaeOo0Bgx7fafXoPZUiKWtFfYrztGTG16G9lKtiTxhqD7dznT0kKNWB2G
         /UUxMw9S3Ngt7NwrKxVccbuDGOAVwIOJ9IqPZ3d1JUG/b111gc6+dr8Kfvdovec7DSeY
         75Woq3xWkCCX5V6kYoxSCJF5/pgg0sEikOYmB/4x+niy5GlUxacOGftp8R9crX/QklFP
         yTiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=GFJlZW6U;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2136.outbound.protection.outlook.com. [40.107.21.136])
        by gmr-mx.google.com with ESMTPS id s5si24682ljg.7.2021.02.02.08.44.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.136 as permitted sender) client-ip=40.107.21.136;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA/oAne7/k18ewfb492pab7CbWz6mKhMVR/a58Fa5JsbM7Wpu7SSJzNV53AysivyNXtkmrfjwZBDcpDaKNJlF2Lw5A4QcF96qzBWtklhBFZYEP6BO6j889NWC4gscT4V79gDiBAAm+Nu88hLT4t2dop/7S9pwMnSNqD2xNPBnR6brWBs/XvlqbJor4ehW/k2kD9VQI2mT0PaRHDBPiS5kfrRBUVA4UVqt/5DOEdbBjEumAsL9aeNU8kzjEWDqWFe92DYgoH7kqGsm87KOBmgYJyLwq2jh1Dk6w6oO5ZzqMXq4I+8adfi4B0utWwHdZGUTppj3BlgTszdJ2+ToxwelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjqqtpQKfW+y/F0voAlTarI9qQkPRyYC3ULlkUmIc+o=;
 b=G9LRr9ks2ouQ9UJFdAnqnx+csUEl+RO8PsRNCgXE8mnr0FaMtJAG2a5GrSPrSX50PZ8GQQOHRHWbW4Y4WXI41yxG3rL4bQcEnD9tEZR9jixgODHjtfz+YMjuNJWCboc2Wer4874ys7qjNUXAocYZZvmxg5bCR4bu/uiudQ+ohtvA2udL9Ugi8QypwFjc/VQSTKKUcvPRk8eu4DN+cVhgMFvNnEUpR2fOcCbkZPkJjjGsLykF3VUSrXVuH3dmhuwhkXGy3P5s3AOxgiHhVqyIfp26OZjHXmyOzuwboEF298az+TyfTGRBu1FteKKqMLWLfAc5lR1kYFr20QArIyDk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:36 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:36 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 1/6] x86/cat.c: Fix type freed_mask
Thread-Topic: [PATCH 1/6] x86/cat.c: Fix type freed_mask
Thread-Index: Adb5f2wT3GH1dsaURzSb9OTJZ7BLHw==
Date: Tue, 2 Feb 2021 16:44:36 +0000
Message-ID: <PA4PR02MB6670966F938FA1D18E7F76EDB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3bb37126-bf36-4fed-3a36-08d8c799d3a9
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB691028FC528021A14D7E93E1B6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4cIAAgihHtRB645/5Wq9/7GAxSy3XaIpxSY1r9sl5X859v+GI1BwSlzAWm43b45y07NeuJoQhcDy9t1zpNgBv1VjHVEbsn8c7QoBW3pWnfRi8Crb8Pyh2Xr7n6r374qmUryDO3WLG2kt5pok2A/oPaKU5aWsJo1AUK3uhbBNXX8lBLmaVjM6YoU0PfPchQTCcfphqJPDAtFHgBbiTerVE2ZxDE7GMcOJ9RwJVGuoC6ANwdaqaN1hRuKGC4OXa+rvuK8AxBgMQ5qUiv3XD19MmlEHGKeFfYVSj7p4tY6TYSAP2aWT2qJZJE7YPWc6TL/HUYo7wKiR4YO9siJzHyiS7f3w94sYp8W8BwanilFVkeJ3ntgcwGCFxfd+AX2mrYT/j0s8ITZ9LblxgB/Lm7NO34FwEw/Z9YxYPziHWiIjuQrTD2wmUhw/i7vqybEM4gDfLdI/yS6pKuetK4V+kfu9+JGut1rYeheHjr1wdhYhYEQcDajq/TrDRM0h2fomHxPAFV4ewpIHpEyO7mT+Vy4BkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(4744005)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hBl/kfbjt6Ky4doJHGsX253Fi7ceYjMXk0oKHMJHvUiBeW89WSqvwkpxnhxY?=
 =?us-ascii?Q?BfGqbef7QckLnTuM/HUe4dZa0CbTfSznN8guvRa3DuswDASUI4WXnPTXBSnQ?=
 =?us-ascii?Q?acasfrOsEceIHivQAC4Mp2TNuPidCshYIGYKayYUvTXSxX5Wt7+JTzBmhoxO?=
 =?us-ascii?Q?7yhSzXiJLdQVvjcepCAKCp0fmlpVShZKpn/XLAf1nojzTjVGeARTEapE/c9Z?=
 =?us-ascii?Q?80gwmEAxfcbi6iyaDbdRdgGNkvtLhphVIfsFk3708uqOYGaOPCJa95kX9A8p?=
 =?us-ascii?Q?BrfuK5PVSprizxQtz3XVHEIPW5XEpfcxDI2AsB8jN20hkdeuV83zHF0uAO/7?=
 =?us-ascii?Q?rmhpEGdVXyCt+ibwzlUgfwp8zS9sWH4zgSnqywx8L2dJUwnUv0IWQZqnA1hp?=
 =?us-ascii?Q?TET8RiddYsZtyKlkLLaMh5DI82FBfGbNJ2XR0NxsKyGBWkAbf3VGmryBdPRj?=
 =?us-ascii?Q?YGgXHiANN76sgOYLmzMLnuE6IPY+k+ksU2T6QlHI4v1OYWjRq0EQFTyyb132?=
 =?us-ascii?Q?VDn5s1e1qyve7CKKkOeERK9eTx/0tud6gcdM3IP1ZMpXOBOyoVfOFuzfDg8h?=
 =?us-ascii?Q?0nr9cVW/VJK9PtR5VXnRHwKTVWNTWh58OBjXXVKgC3IQgJXqY6lT1nJxM5un?=
 =?us-ascii?Q?JJdgLIpIR0Ziokp2PE2RIzY2CEykUcn69jISXOIJVEouzLe/sYFPT1aCKWi2?=
 =?us-ascii?Q?11c/XSncE8F6redId4fWotioJcmvAN9gfYBPjaH5SnB/F6dcFQO467S7s1JU?=
 =?us-ascii?Q?dSgSqRrTG8a/sFpIWlZu9+uDTpGP9jfavj83AZFHt0TW/am3wCiBJuEdCwHX?=
 =?us-ascii?Q?FFBXad7c60KsMYY3qOMboMcjgUYoXuhPwyuEy7Q++inKNJVkQIRvypvBUVxS?=
 =?us-ascii?Q?gmEHKd45O3r4+DV0egkueErXkfA7VCxhNXcqgvaGcwJePcUgvHvQh8/jTUDI?=
 =?us-ascii?Q?csH1UOK1TNEmfWuYMlVaE5GqYwnbJ97Yf/RlHgb3TvOqdqKIQnc1iplqGKeP?=
 =?us-ascii?Q?INQOSFxqt9IfxhflQfwS6/8Mrfb7uLbypReLVA2f/6OYWeln4fnGL5mCnaEt?=
 =?us-ascii?Q?2NcmWk8e?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb37126-bf36-4fed-3a36-08d8c799d3a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:36.7324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jzeiumFAsI8eBJ6u0sz0AAVWXGUvT529z3IA/eDuKgQ8oo6zBMe9bSdaJ7h2e2zaS8RIhq4BvxOTyK57ojYuV6OVFQcbNDSt96AmVcNN/NEfOi6YIxXnocP6O51yXlOWSunf3ylRCktvz38CksL3uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=GFJlZW6U;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.136 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Given that any bit in the original root mask can be freed, the freed
mask should reflect the same type as the original mask.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index 644bb3e5..f6719b1e 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -20,9 +20,9 @@
 
 #define CAT_ROOT_COS	0
 
-static unsigned int cbm_max, freed_mask;
+static unsigned int cbm_max;
 static int cos_max = -1;
-static u64 orig_root_mask;
+static u64 orig_root_mask, freed_mask;
 
 void cat_update(void)
 {
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB6670966F938FA1D18E7F76EDB6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
