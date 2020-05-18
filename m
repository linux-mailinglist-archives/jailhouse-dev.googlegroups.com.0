Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBCUQRH3AKGQEIOG562Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3241D72F8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 10:32:11 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id p136sf3657349lfa.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 01:32:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1589790730; cv=pass;
        d=google.com; s=arc-20160816;
        b=EdlBoZZOaKuriJOsXIz9g4fRBpxHx2x7GdRSeDGzoSupNgh0whHcZNxVWrylbGC1zN
         LlUKek6G69VBdcfRJP7QwvKg8C2rUCOMz6L+bzImGtMqIZUZWQUwmMlZk6UMm7oYl6lY
         nOxIuJoxKHiK6mMkdNJosIBt4yR331P7WD60G9/DvgE7F1btA4qb/kF8UNsNquj6Um6k
         xJYZtn2QFD+ahCNsj+cfzFqIEP8r/9xT7w3O8aIKuS/QHOOGyvpth4LUClPQKJl8ciEA
         t8U7AWIUpuFIq1jNfsKzDFnx+KJPeeOcdeDDHyc3mSl4nAk/FiSNDS/xqvIgpYVDBVpO
         05iw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=4I7wBDJw4hEuW362vEsk3Beh912G2nkt5ivha5hfdUA=;
        b=sQpMnHETcvveOm35zksaFS5WwSAqFnHGuNZeULOoJLb9uW/JdJCCzc+rbd/Ihj6Xuv
         yGpkMBAhkkZGC/zCTCiiO3rB3x55guj7Vq/hAqMfZtsU60/pRyP6vTHd3+bAOsxQ5Scq
         AbJq6EL/OR0o6iGfWUjdar3sO0E3MEHQD1NJTdp+RG8/Tol2bM/f6R0LrjcG0YuBPv44
         ZgpUuUY5RX7KwYj+AmJXmVCmWmN+G6WHgvBXj6igSIfChn0gki+az1AAHHDYfb7Egn15
         q65ZQWqQVcoY52ln+kV0NrCRcolWiJCWwfXRKtx+jnhCjtrRpmDgoh9Ryfo4DnIMh1U+
         dXdA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rNzezoin;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4I7wBDJw4hEuW362vEsk3Beh912G2nkt5ivha5hfdUA=;
        b=cdWZdRkX/DboHh/I4iABC6gKOZKI6UsLblbj5glY4W9SUaP7Xn+thOHD1bL57xsZHE
         y6w/cumFInzknR/CQ+1jLKhRnt3T+hNKIvzDuxDmF8EsxOCljf5peT1vYBDz2jop7PgD
         6z389/mJFxymJiTrm0GEtBC5wo1sX/22qkZvU1aK4B805CL+v6ezl+Nf+YhY09Z77+Df
         wdJX33Qh7lkdBLgUMPbApyndO/eCypR5B+JNAm18hSA7HsvM1lBLTpVXJYHPagRpLq2H
         R/JbvyehMTv17yCwBmKMkglihoC6wQXPKUJXzXyPGrjo7XvbTfRYCmX3iyMwprVQhN2z
         H8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4I7wBDJw4hEuW362vEsk3Beh912G2nkt5ivha5hfdUA=;
        b=o70w6027BogNq1JJRJQ09uhNb82qvTgTc/kw6ul0uKCcaPfI18tswtLv/8xQmK18ea
         iVKWpxYTyw3APXIZMoCUSZbupD+XXivCyr2iVNgIKUfofZBSiH19Oi3HbNYyZXbgNjgY
         YhE9hu+8CxehTHYi0KOlitqBBRSSVluxejw8Gp25EtphISK7Ipjib6VEzD0mV60eTXYs
         wrSqZoLQc5WQdgGA/oyoIYbizCNC3hYpxRb2Ax4qVIJAceiPxkdPRiQ7EhqlJDuSbHbB
         oqxRCVblf8b/jH+RLv2a4KsUCl8c10olslx3A15clKUso8bkWIjAHZ+Wi0SUU9cPAhYn
         w0ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xfw2Ltv9HiAn/6vorrMeySTXKuXlYQMIjvZGVaFrZpIXMrnPg
	Df/cEz4WfeQp4/Of2EQiMJ8=
X-Google-Smtp-Source: ABdhPJwZCsc2HKw3wl3IhbaO9qFOAkSByBeQJ/ZUdVlZoIPEKMgsW5XnQu0k4NaTylKI70ZOS1JhPA==
X-Received: by 2002:a2e:8703:: with SMTP id m3mr9556361lji.286.1589790730480;
        Mon, 18 May 2020 01:32:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3208:: with SMTP id y8ls1558601ljy.6.gmail; Mon, 18 May
 2020 01:32:09 -0700 (PDT)
X-Received: by 2002:a05:651c:1069:: with SMTP id y9mr6233245ljm.172.1589790729076;
        Mon, 18 May 2020 01:32:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589790729; cv=pass;
        d=google.com; s=arc-20160816;
        b=mY9pbukunJXjXDhEU7XoSMKYpn/RtfpTcvD9Mfv51HeG8OiqjIG3eGgQMcRISOMOuI
         5br9KBimVCpvpbf+oWBcHcyIS4jQVkRVu7bMp1UvM3FRZn4oXtV6+iskGf/uisHIFlz0
         Ve7yV6zJIUw/bT5aN1uij4ceCtQv8wo4Kwb+e5tMxvsEujQEhZbO2EfJkjm0bkwWFmhs
         rZm89oHcEN55TbFc3lzm38pEQ+tM+t47EkV2xpc6CiXFHbjtoloeEovR7KjGQiO1Qha1
         r1AdpNMieFySEPpzda3wrxilQGwYs90gXEslmBkVg9tTsSmn3xoOu1nTh54JgVK+4VzU
         6SAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=JnOevQbApZcwH1Z0sYSK3T4RsJvmchxMY/4X1mCf9zw=;
        b=lSAeNKnn/RqbNpsDehFnUZRoj2T2ElzaXNrNK/vkfBfCIyOVRy4HT910iNi13Ti0ig
         XWa/28FxXTA9x/jXwKWsnJHphAKicYR3M0bySJiA4+/woQGxES/srpbW7/V2j+z7k+2k
         2MGpGkp7udNqLTVBSaplwXQtb1jM5PUoPCwyR8IiWcsFoZeJJ3yieRJr/PJmEecsJM1W
         tPFcjTg6fTVuttO96FriX9+nj6W3gf0j2CT9EE5xfTQ8V0fqzeH2BOc9ijkcYstALp2W
         /PLvwdkEcdYny3Ut1wv/xNi6lXC0F7TsF3Fq6JlmzOUokPNV+poEkIHnV2TCC0sks6iE
         BbCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=rNzezoin;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20071.outbound.protection.outlook.com. [40.107.2.71])
        by gmr-mx.google.com with ESMTPS id q9si568570lfo.4.2020.05.18.01.32.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 01:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.2.71 as permitted sender) client-ip=40.107.2.71;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzIsjj5dMqF78P1YHJgw0JMTO/ihGnHaY9xusK3OqsT9XhghwxRqjWcQlCGYSwkxoeLfkWd0P2cBYwaO94Oe/uT3hykRbes5sFt4r9wtm+bb6IzHIYPgCHrVNxIv4QULikDjogp47SuFX5yGTXiCkJUAiJlxt3E8RKHZXj7yNXGKfzEdcsAUTbTYknmH6d+Qx61X+nXZdWNKrEE8sZ7Qy9C9KUhCBtT2c41kl1fdxXm3mM1vQjm8uiJUra2Wd1LXk0UA681hNCGJcZLYbip5NdKNvy41UwamuO7jwp3GoOw8Fyiz2N7iuOhQn/2+It3sJSt5pWufK4kaorifVmp3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnOevQbApZcwH1Z0sYSK3T4RsJvmchxMY/4X1mCf9zw=;
 b=fz28HQpbHmN31PegFLT5HTkyQpdUgdTVtg9lctnpSVU5AK7+HQygveFpByoCLG20p0ZqrkjmbDdDMRbWm7chqHvgzjqTBAOqzH+DQUJl2hfY4amRgZhfGPhVpUc/ACef7/ZfQbplfB6LXUNz2+UCsQyW6cblw9KrxgaQCbdDEL0FVWpFqoBgk9MKVojmw3vHn0+iUMKVwpksjFRwO39A6NlsUOcDxPuaw+58fgInXwzrlpxNm4BG8B9469W0+3c2JMMr9G1a3mTjlGR5zmDby5e6vz9ottEYNAbu7BpJh7Yf++FtrXqjACjSYlK75ShAhsgHGevvPy/vJmEBM3rXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2920.eurprd04.prod.outlook.com (2603:10a6:4:9d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.31; Mon, 18 May
 2020 08:32:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d17b:d767:19c3:b871%6]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 08:32:07 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: question on inmate linux network
Thread-Topic: question on inmate linux network
Thread-Index: AdYs7p01bFc81Sq5QWKZbg6bwsRq8w==
Date: Mon, 18 May 2020 08:32:06 +0000
Message-ID: <DB6PR0402MB27605FE1988C7CF39F94BB7288B80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65b8a81c-1f96-437d-22f0-08d7fb05f345
x-ms-traffictypediagnostic: DB6PR0402MB2920:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB29207F1B626F5AC74FAD0A2888B80@DB6PR0402MB2920.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FVhnr9f2cxI/aN6sfTdigiK/vTLR/gOOE7v+LnD0Q1RrMGzpFClidZLRGss/kyL042mGRyvskTh4Cbn/OI/AK2+kCyHx4tHGnL7mfKGxNN2FxP+8typ29F8792ybdSD+K+BHJyV+qWONK7YU2rzbETSLOIdAnu/DOKqchQl3xIC4qAXiexLxljAmlJk4DOSuaO71q8KnqyF3ChnrikrAKrpof/b3zRa2BH2Twbj2izSVzC7NCf2Yu8mupKXGFzGWMTtvLDMzXCmucN3KvCbOhLlzFkhBTDQ6+CVW8Fz4sOJEM5TpyvO1je61fbA/+eTILVtxYL3tJ1jA/icIkNGaR1U9J4Wrwaot97TmMM0KoKWvX7lrDBJtekMo8QHB+0tf+wqJl6jypfks19eIw/7za7vt9D/0Fca0dcO8RYOU8bQuOU7ddUG3BjSWD/R45jjj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(366004)(39860400002)(136003)(52536014)(71200400001)(8676002)(6506007)(86362001)(5660300002)(7696005)(6916009)(33656002)(54906003)(44832011)(186003)(558084003)(8936002)(4326008)(55016002)(76116006)(66556008)(66446008)(64756008)(66946007)(478600001)(66476007)(2906002)(316002)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: DWLNPsqJ783Rytn3xudc85iuLAV2pHIpG89m4vdv+bY780iMyTvCdMuK1map0Pq73t4RJQKY54TKtpbuUcenigVUooD9MxWYscPMZibgg8CiYOmbtFK3mE1RbmXjYFNl8YTEylqKOzMJwsa/1S6DGi/fNMaR6tVDGZfZfiZGFuE9PDZfFODJ8B78BDSrveqH0JRSR32LEJrp+mNjUQb/q8ZKltYo/A5rMqAjQGnBOU1qeSubd4rSXQTO9NptXhJ2Q4D/WcjHR5Zs7g7sUx7jOHSxFoSZqBTOv/nnsOf7jI0nllYJHGqPGPXlMydzkFDKr37uEkI8a1Em531SSILLfBI6HywZQCIIJgQB5ipqEYW8E4lcqwCOXFIY4+dbT6HRVi3CaEIHq3Y2GW3yEPZK6uFPbwYps+CyU4oF9CLkK1ggv7VzLNwNXvJllbyK8vV/6HPC1Q1E6b0CZv/42yAUAtFYTfbRIbw/PUdmLlk5GjBqFyWdwBSGK3wgODdpuvmA
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b8a81c-1f96-437d-22f0-08d7fb05f345
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 08:32:07.0117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QX9zng+kCppqEfB0wF0aiPiq4LGbvTVioM6ObaSOSJ8e3K4invg+ueE3n5djZZfVXdlBYk9Uvz4RxR94jsUyyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2920
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=rNzezoin;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.2.71 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi Jan

Do you have any ideas how to let inmate Linux access nfs
or other network?

Currently we could let inmate Linux ping root cell Linux
with ivshmem-net, but I have no idea how to setup
external network for inmate Linux.

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB27605FE1988C7CF39F94BB7288B80%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
