Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB5PB633QKGQEY5FYQIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440B212087
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jul 2020 12:03:34 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id u24sf17259290lfl.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jul 2020 03:03:34 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1593684213; cv=pass;
        d=google.com; s=arc-20160816;
        b=eL9tSk7xfItxxWQz02mx8NC3063U0YcU9Hpr/XUOyaMuuGfn1FgidcrSDZ/WFhOTqb
         SVBrAPGTg5GlGJuHqyhFr+wCqOrOuK0yKgevOQdUd5N4FQwB/WHLLyE4PG7U0Kmmx8wn
         MRHiygJ4TiuIYVdjTRTvr0AEj+lgAITl9gNI73QAjCISpf7MUDNwKoMTo6xuaetDNux6
         i/qcQEFnk1fso7whAmluYhfI7HEXzy0YeSJ7LLbVGjBJxv5901bzprkFJVQgYysYh3FT
         po7O/tTnzHzXnXjdgr4urKiXcKYjAsdNgbuZg73rWOQoUml0yNnC4qe8EheF04K4Ely8
         uuaQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=XLmMYe4AapGawPJr+CqTRI14h6kPk/QVK6LDGI12vZ0=;
        b=zs/XmSznxVhyOadTCT/jx4O8LpFKs9NLvb1kxWqf+hbbghOZgrSUJG3OhPj3DJk3c0
         XFYtTzyoKKMo+jhbAAwRiaUvxezrmxMEM4QOqkPCVZO+MpzQRzduAmbnJkmH/lccE/aL
         P+Oas6bPHpifNCKD/noIx/giaFjZqLH7CqYwBaNipeDL12ywbcFTe3mypsGvzOmjmPZP
         o5tyy/0LhXmRTaOQJikokxDYfmnxWBb8V3t+k9rbZJpEcMlQrRS7pk94niLEI0Tmtyg5
         162O15ivWdWM0ER0FmhDxlKoV4BNsUNXhi5/6aZYFGbVIKhAthI9uEif+sWe84H5WaZL
         VwSA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UvW3WT78;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.79 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XLmMYe4AapGawPJr+CqTRI14h6kPk/QVK6LDGI12vZ0=;
        b=iRk5N16IF6Q4ebktuJQYeONbWo/MjhYqiGQ8KcAT9vTO9FwfJ9mLI7VS6jZ/dftIe/
         XepWY+XGRtadGYIJCa+IpGVCkOudk2ysziu+xJFBitw5cSuKZUKmgsAmc9Qnpq5avBcz
         o6S/7h+u5Rj63PkWXmIf+Nr0BwGCG+CvlS4rj8tYWOpSZ98xNihOdJQOvqTEIyzSAKrs
         gXSoKElTgQ4JyDZGQDSc79TyAoFVNzk75l3Geq9lft1nY9V7IxKdjmBawtjUPx76ZToU
         PeWFqtOGeLJORkXdgSO/0j7vquEiEQGwCBMkjilXm8fKXTuXEU67rfwP9A4dorij6RDD
         KhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XLmMYe4AapGawPJr+CqTRI14h6kPk/QVK6LDGI12vZ0=;
        b=HjxvBXHfji73lpm1nMYnyIXCFWTAt1JuH+I8XUb0f0VoHILd8ZUPShHiQiVs/EkRsN
         iliK4VcZpu7DguJec6i6Hq+Jl+2+55nXPBbVdQrHDF3wNf/p3U4vWOndbjfnROlbMZ7w
         3QKLCXW0Fnhoh3ahAoM4wi9JdI2NP6PpC8ID3JmxEt6QEpJKFFjU5rMae2tnfYKXm2L3
         SL4kGI0Ub7XEk8QBhpqww6rtGr3X7fS4/wlBF2B/zUyjXFYJI2r0lh6SwAhnnMdYp3fQ
         NQCC2zcdqy3BZGhJTtFD8ZAwPljr/ai+qpiBXDcQ9I+Rk+zKJySX7paD+1qMbfArZtNW
         qgTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336VmsCGUf/pTH8F+//fQM61VE8XESfKXI08sPXLZr/O7vL6zFx
	PjbF1qGn7lS8q/F+CZfnswE=
X-Google-Smtp-Source: ABdhPJx47bhmr8r7YOu+mQy/6lHBVdCxng4Q8SQcB/pN6D8QcJkKD2PUBl8VD7Dyb1Y1+pXH28J4eg==
X-Received: by 2002:a19:c744:: with SMTP id x65mr18322623lff.133.1593684213629;
        Thu, 02 Jul 2020 03:03:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:be95:: with SMTP id o143ls2010461lff.0.gmail; Thu, 02
 Jul 2020 03:03:32 -0700 (PDT)
X-Received: by 2002:a05:6512:3fa:: with SMTP id n26mr17465452lfq.190.1593684212739;
        Thu, 02 Jul 2020 03:03:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593684212; cv=pass;
        d=google.com; s=arc-20160816;
        b=gIbG6ah2mpLvfAAQPH9JuUjnPjHjaztK5CK7EISGJoQtaJKmE/FaGp1VJ50vFS0uxp
         2M3XraqJD/FI36zZJ0VXHqqtQ5sjTR9xpnjKPadGQ/4pGK37XAZJfFZ1lu3vgY1ez9IN
         zG/6weHx3VVoVcLx0tGo0EtQZL7lWj68eQiOcsrwdZdzoTRahbYTpA6DJVd2GEoSTuwf
         5ZLGqVHoM6SQTTxxMTwlrbLYE6bjw3ylplkDAngXbbdGephsuBFr5QggQ/rVwNYgUy+h
         XLZ8HiaQz+SC04+YnX448tCIEw2CI77n1ePqG2/uegnuW/ZOTk7g74GIsEiUR5LMwIUu
         z0pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=Zwn9FtjRzMFFuDYASGd6gHLtYa2LYBoEEJlS7pJ+dcU=;
        b=m6IgkHl2zACnM7og0OPIIHRECLdgPosV68hSFHr/VFLsbSbOb9kJrzGyN2a2ejMSs2
         jtaHEOO3tVApZiWTFy2X7n8JBuwrlrXpjAqAndrz+P6CjVPEvLlMn5H6h4nC2re4bSZH
         j2p5xf+FJ1Bm4cBSmlNbEVJKe/wCrmhzRtRf8lww0ZNRWVnoaAJE2gTs4p/q0RlVvgCe
         yx/y8+KSDjYDYjOxPNxPzoCHmdlC73ucAuDiSbbHqq4HawXzmNIR6ZLMyEPS6pkxZRXW
         MPF9RiR4fdaULspRTY30En4PtYvf6U7saOHiUDqnIX2OEtlKQ9U3xIDihShgkpfTtA45
         dKFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=UvW3WT78;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.79 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60079.outbound.protection.outlook.com. [40.107.6.79])
        by gmr-mx.google.com with ESMTPS id a15si495828lfb.3.2020.07.02.03.03.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Jul 2020 03:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.79 as permitted sender) client-ip=40.107.6.79;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvneXr37IdkCf+mdf3gv/59oM/PUhbutgqo06txiERQLM1YZynnT4h3ZYB6V6C3U2YpOu9d2K6MBUVVYyYYx5+Cn9tfgC+5aEnTYNbHzCz/KDi1ifk2QzD5QuVa0DnqTJ2BZs51pa3uZWPUBRKzovCjtOap0AcRGhvu/ooSNEoo4TaKsOsUKqo2ciYCrPC8ATWAPsGnLmB41dPF4wjWkQizZ+gBd5sDwIxc+0ystqmwAcGVhrx3H61IK0LtC2nLE5AnyiWqMOliUuLJFwU7C/8rSrD62fWMwUg81fBKlQzsgvPTilYeZwgS+FSZ2/61iSRnlvg4u7Csz+1aRJ044Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zwn9FtjRzMFFuDYASGd6gHLtYa2LYBoEEJlS7pJ+dcU=;
 b=I5Z+dkCj6NdFDH3LIfHpGlNNX4gI5ooeczuZdZWk8dyAZTzGDCg6OryhngmrOIHeflf2MfZgybvs5mMOoVC+S18yF5a76Sv7i0TFAvSbAtiDqfm2ZavFLb87YwakyZgd0Ug6epOqofEms1qbqCHJ3CyAo1fUQpwj6gOnZ2Se1z7m13HMspSodebSZkk3Sny0Wmcy1vUReJURbmg5Vk5sGkKKVaUIc59GkrEYCWjKLzrJdHFJTpP7+LDXD9Q0M6yLIe3voV63QHlIg8+SZKsfOHO+eSnx4xnmSycqYbJoJQJFABjssrtdrxUxMahfbQzvjv/CGcHYBociqddabVaDEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4938.eurprd04.prod.outlook.com (2603:10a6:10:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Thu, 2 Jul
 2020 10:03:31 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3131.034; Thu, 2 Jul 2020
 10:03:31 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
Subject: jailhouse jitter?
Thread-Topic: jailhouse jitter?
Thread-Index: AdZQV9Sg2ghlhzPgRlmJb7fpOVsBgw==
Date: Thu, 2 Jul 2020 10:03:31 +0000
Message-ID: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e5fe17bd-bc51-4d52-b2ec-08d81e6f2cdf
x-ms-traffictypediagnostic: DB7PR04MB4938:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB49387DA4A9F71A0E623C53C6886D0@DB7PR04MB4938.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PKYbPPIOnqjLlBf25stKLieNKDZYeZtSJwibsPfsVEm1At964G8ck22l35C9G5EPJLoorI8+fgrmGPPCztq7GKGG/i76jfvly4c6aeUDTz99Po/zFfCSJcacxNRYEYrDeqXG9jQth9wzqDPrO7TPKlKW0+9nx7aL2KJULyMxNoFoQPOt7YF5HxklOF3k1ox1JxXQbe+VdQ8Phbg3hTlqsSvmjHyzmP/kNaOnjzNfbrbhjScuczhj7n+sgN+ZwqhXyTUPx9Va/LQzNSNYUExhhla4ACT6ZQxqh/eQJNfmoM9g57rRmT6g7ff5lZJqvGp7mrisdU4VJhAm1xf8d7KPx4ofoJLO1CpKqZmgT/jdNPMp+VRFxNT7lTg66h9LHa/KUNMeI92ax1aAGWUl6gfmJC9UM0NjmerPK59cf9MKqGqBWrJaJGQBBcr4j42H8hh2Skg79dJ6BBzNgNh/ay2tpg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(186003)(4744005)(4326008)(33656002)(66446008)(64756008)(66556008)(66946007)(66476007)(966005)(478600001)(5660300002)(26005)(7116003)(71200400001)(3480700007)(6916009)(6506007)(7696005)(316002)(8676002)(8936002)(54906003)(44832011)(86362001)(52536014)(76116006)(55016002)(9686003)(2906002)(15398625002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cgaPPws1bI/5MSbDUDWKrtvIWZfff4pO1/Lf7NJ+YJul30f++rIt4H+AlQsCeb4/eOj9to6jTA2s0IEZwHZvqE8MlXgnq9PbWyzfwvpi9LrpOJBxlgmjGmUsJCA40TCdpX/6RVi6nI7SYkosPmzmVCqPUuY1PRz+MIIVjPyMgTeMcPVecSvFdmIZrFCF3HFd0ObS0XlJK8kpDQLhNLMHWRHFOpXiPM8H8EHLtCTZf8RVcrsx3v1/x8rhbPQXgVdf6MIAVvC+eP3N5c4mzvHiwRQEkL4e+MNMvnLoaWWhp4ghQsro9nSc6eJ+JreA5tSt6oMn8193gc8qac99gFijfjWajHeIANHBdbnlptKurkIhwMtT5hGBUZ+75ajT5OY/G6CLnCqe858N0Syf9UGBFM17Ab3jxj2z3Af1/lBnRpCcmdknb0lHx6uZAXoKtwe77XWDwxlkvDbzLMi0OBRinJ1YNGATcqKOGWp1YiH28zQKHqoSJfl98o3KpfH12z0D
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fe17bd-bc51-4d52-b2ec-08d81e6f2cdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 10:03:31.3997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XzQIPg7anLThwukZ0m143LctKf4Jgmia7X1vbSh1aZSSJKcE1RbDAbxFC8zoms07umKqEcGNYNEgXUYM4VxD+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4938
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=UvW3WT78;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.79 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

https://events19.linuxfoundation.org/wp-content/uploads/2018/07/Consolidate-Real-Time-and-HMI-with-ACRN-Hypervisor.pdf

Have you ever see this? Page 13, there is a compare between ACRN and jailhouse on X86.

So it show ACRN a bit better? But is there any big differences in design? I doubt this.

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760BE2A66C776875890B5DF886D0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
