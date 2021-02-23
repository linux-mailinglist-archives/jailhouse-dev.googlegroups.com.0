Return-Path: <jailhouse-dev+bncBDGILGE54ELBBL6O2OAQMGQEZ3KBYHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EC32297A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 12:29:51 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a19sf11243528ljn.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Feb 2021 03:29:51 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1614079791; cv=pass;
        d=google.com; s=arc-20160816;
        b=rXmwNsGZWM6j+6WZeSAYeNCz9PjcEEsZN6j30yEr94VIruKm+7D5F5G5Lz44JAiTPB
         lARkZaUwv/brbEVQzkzmyUQ1I4rmMlqpEm2snAxGTXS4nR7Oc33kVqBYOQ629lvSYw6A
         HZCwwc/lCo+o+JrmTHCUbUTqts+GJ5dZotuO3pUEt2rX9lNr1RKfOjciN2WEl9RmzyeV
         m87B0DU7d3XYiHaIxV4pu7q4fU+DfIZSu0bZjzQ8l4FToRhh8lLMvZGpDZJ7iHV5RPwi
         KDWaEU+HVa4pbTX7SKA9vjs22g1Jl9OZLT5OG/nAx9v9xd6FQh1OmVKevHAUUc7vGlxW
         14fw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=6km6dYQCgRqyGcWUHtY59SZkB3lIS/Bh3menisegeSU=;
        b=DTpA1kzToER/jw1SS58PpA30aTSkjae0lf4m4Vy8KUcyYLCBqCc+q0rbmVpY2e3TC0
         gGEJAwRhM4Jw13s4+2N+4kbUo3jf3bgtVTGF3kEz8PaD08A+lSVSvumDHUqjfs+vFz29
         A4dvw4uiOPIwB4NoyymtXA4S+qG8CUSsk6MyxaEL/85qW7FvF4rhBnkpmo/6EGNd7ra8
         I+NXEfwu31YHA32+GnT6CAAauOsae5pYXWZkuEKQ673a0G7KmUDCv07mcPJc2Bw9TVHc
         VtOugQaU4YzP3pMoulxcQZwKQ2aCmlebuHMBAJKGP6cTvzJWL5nhToc14dOW/xGjaYjw
         O8Sg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=VJ4l6PGw;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.126 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6km6dYQCgRqyGcWUHtY59SZkB3lIS/Bh3menisegeSU=;
        b=Qb8tqL//r5uE0KIi4cIYXKWrOmUhDVeREefjF3Xvd9a2RS8sRAUxLKBZIOerk4ETb4
         8XifOULN92d36n47hIXgSa/Jx1KIjbRx4UX6WrCL/4J34s1M9Dde8Crca38D53LBxq+q
         BOFKULHVkcYvd6+VLoMR8MMJcGwXU0Nh+R3LsuxebBL0wDnmG84CWxSFDuH5giTjr9Tu
         KOAAsYNV7den74jQlRu1/4Wp3iGM2UvIb81uiLD/QBWGYbEpKMFjvra1NZZSCIPlKV5s
         uuTNbUdsXIVb+cGMZ5aKDJ3wuk5U4IL+hL7qEx/odDp0pCdKM0cFSr7cKX3pa8+wP/Vb
         Nylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6km6dYQCgRqyGcWUHtY59SZkB3lIS/Bh3menisegeSU=;
        b=Ka+ZqKuDhMjqxq6fGPDQPR087UrcBMDkDTPv/R/pvFmwyJFya+/de0qEsBMFZJNK2R
         K1MY9emUhpZqTMfTIe06kt2HRFHEEiEgJndT+yT1opekdXS30YtA9kt/wN0NdzGnfSUd
         eiR626s1+xtgj6Ot9IqhNMqTG4jFulkg6KeGZC/M+NvXiUouHg5Syw7YyfcpGr2+fnbx
         wAAvr56g9iPYRKnuBlSkcxwhH8QPSFKoO22EY1LzJUkpYUn9H4JNPKWl/cFQD5t1fTv8
         RbGDT1ucA9jllGyFWgeKbz/Pb2pS/37g27JYzrNxx6nX1lQm1uYrBqRUxGZZK6pk0xBf
         q3NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532m7VHthuz/YuUgDo322/SJy9BV1M+4pliPDCUqHuluCX1di6NY
	DigqqyHAY3REd7Qb/LM+Hso=
X-Google-Smtp-Source: ABdhPJxu9GEZq3Itz4KRjP9wPFrt/hL3oG3Or/NIwjTHiTGNmmt1VphClQds4X+nhgcK4/3uZoOVCA==
X-Received: by 2002:a19:880a:: with SMTP id k10mr17088727lfd.598.1614079791316;
        Tue, 23 Feb 2021 03:29:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ac46:: with SMTP id r6ls885557lfc.2.gmail; Tue, 23 Feb
 2021 03:29:50 -0800 (PST)
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr15924278lfe.121.1614079790386;
        Tue, 23 Feb 2021 03:29:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614079790; cv=pass;
        d=google.com; s=arc-20160816;
        b=ol2K9VrjdS9oCGRoLvXUxoLamuQtcKeQ87uIZadDESG/fAdfZk+H5il+ggqnyphmrS
         Xjc1tJjHBBCxwpb9wq2RvpBR1ZdQpSyUQcSBmaBDsMtBq97bSb8640WAVrsmVlWrNpA1
         K6luxiq7HOidnusR46gHCd9L16zTAUWQWCVsu3c3EYapshQyFWQgmMDe50W9aGGhk8f/
         gmcJCSrzY+3FGITVOVJsgnbHxqc+P8fqmSPk+cwdxCCWMBeouiYMzHScWVtsHfHpei4b
         2viNPRHTRkQFR+QNb/WZfXWSbq3hqe67LkyCJ9EbBWEF+eqaeoC01gX4UCTi4KXTj2Pd
         rbEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=Q8h+rYGHORMdE0hrIfBVlnG+fZe1g5LXVy/lk895UdI=;
        b=BhjZR3BXJ+3yIZCeYA4ND+DwjpMe+i+eoN1s35GHK9tgLsmDzm3LsRdmdPQsgCStfh
         cMQVJ7OmAkGAMRMYxkYER2Z61jGgfrwTtVJxHtcKgCtSjxXm2K24eYVR7G0n1AZahdzk
         +O331gMruvH0rPHGEHLzu70CrOuNiJEdTNkTQTjfB4HyDPowakiXKzqjXh0sKMoQGrqq
         pWyL4V+vnbZmINAFrEwbDNXyMaOWzJngB1E4j1Jlhcq9A1GYEnFE13oMcE/CmvQrZG4b
         ofxhGvRCGiSNVmMq3NurTEYJzLeTz6WyD4zfI3kjILc5iBPGGR8vIoTbN3oZSut4oYId
         Fmrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=VJ4l6PGw;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.126 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50126.outbound.protection.outlook.com. [40.107.5.126])
        by gmr-mx.google.com with ESMTPS id z2si52914ljm.0.2021.02.23.03.29.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 03:29:50 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.126 as permitted sender) client-ip=40.107.5.126;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUdu+51NW68h+Lp4iiS2LJk+BlOyCni6QrE1q+fE3OJxSWE7zCIQBgA3konJTTAL49bv/WYI1bOlS1ryrwQ2DGtgNu2r080H5xV9r0+BGCh3hb/ZALxubfKuLtz3XKPpGPNTY7MpY7+Gk1OuScEtDRPUThGtvjd44dSdUIkBw00uXCRqGfa3gvfO5FapA9yQXRkDMVoQ6Z+0wddxuX0Ac17Z/2SykGWbBZ8Uw4snBR/Zh31awJntzWA2XCHTElgqJP49CRme+TiryArUhaRQVQg6HwpXT6YlR8iNajQ7kSDxrjpgHq8w8TroqLmbzW4FlNO0SnrR4WH7pyVUZUaEFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8h+rYGHORMdE0hrIfBVlnG+fZe1g5LXVy/lk895UdI=;
 b=Yef/1Sdb2bjTbnxf6P5NHz2ClJjd5QpXKEihI9r7DYwxQh8IvEEDo2MXpK3qiy1pHPriV13Bqu3YQnNjJoi69zFlyWwzsmDkm80mW6JgJ2ZCMHCnbGDxXGpmuCXc/a+hMPImGVrgIDzdDcCenTGWn7zP+IY1ELD6zfF/HmlpgHUrANgDipA0QRCwP5K+tgbfgB2ZXjsY5rkVZpixk++pKJVfKKB1ouzDUSUGrpo73vBYMw4NCZu0+c8SPJrP+xGMAY6biNr4QAaNBTvZr9EbDzvJPsIEdJooD0+9v+xBEDBzSkgUE6sLbc+PllKTxbyAzdxlN9Nk4/OB7V/zFhaxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM5PR0201MB2466.eurprd02.prod.outlook.com (2603:10a6:203:35::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Tue, 23 Feb
 2021 11:29:48 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402%4]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 11:29:47 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: Performance monitor counters (perf) in Jailhouse
Thread-Topic: Performance monitor counters (perf) in Jailhouse
Thread-Index: AdcJ1xEZPbb7JQXCRdijIOAarAyMig==
Date: Tue, 23 Feb 2021 11:29:47 +0000
Message-ID: <AS8PR02MB666308E65BE540CAEE21862CB6809@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c11a4944-1904-4783-5b7d-08d8d7ee53ba
x-ms-traffictypediagnostic: AM5PR0201MB2466:
x-microsoft-antispam-prvs: <AM5PR0201MB24662BCF838DB83C6F27F9B6B6809@AM5PR0201MB2466.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FR2KXYIibbZYLps+bldzYB7rktwgzbuvQf/qvR2W5o1NuqEP1eOJyz3Kg3wJlZEr2ltQnACjUHvKdOgi4vPUMbh26ZmhR/i1BpmOvJ8it6JK0xp5hm5S5Pn6XDGwq1JB2qAUgKTvuRb4LxAvtDe5K+EUUyKVcP7jbbVX6bDBd8Mvs/TpV3Ylr8ovPiR7MI2DcP0LfBPJP0ytBO72HfG01LdXGGW9QHzkZ/326jWg57UNqHy3qU7pMlHlpU6+qwSCE4D9A89PlS9N2rFLnko+ubLw8s0dL1BAkmXkgMwR44zePiRLUQtzIrcceTClzevYuP5A0mrMkW9LlBx9pCYspIsEAkkPNYUcIYmvfoOde2h+iG8zw0ToTYgIDplnExwJ2RhKP97i4i0FS32aoQ1uOqiff8uNkx2InSXSekamPiml4Q+IGwFo5WUpPI1xCaB8rJTpfBGMrhRbenHWCiGFCvkTqFjPcOr0rmyZ02MWNbfJ9C8YzEdfh5GyrH2Of86fdUoIKBItj8bPtf7Ic8EAug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(6506007)(4744005)(76116006)(26005)(55016002)(4743002)(316002)(186003)(66446008)(9686003)(71200400001)(52536014)(44832011)(5660300002)(8676002)(86362001)(66476007)(64756008)(83380400001)(33656002)(8936002)(7696005)(110136005)(478600001)(66946007)(2906002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DfNUIbqWl6qGSi4eOU493MXmJpXbfrl0gMnqZP0G9iSFLMVAcPknBKUara0r?=
 =?us-ascii?Q?hHEcPNmkQhnFBxR286vhbtcpJihrfzdK/xhSa5LloW5FHVk6d6qep9+/VCZa?=
 =?us-ascii?Q?aAc5KmPkeFBmlXLC6YbAXTMlY3ebLz9cBrbLxDfO97c4XsW5JwKM1ispD7zx?=
 =?us-ascii?Q?3xXL1JgNsCU/Tc13XsSJXL0Hq5QoGA/fxqFEwKe3QHlHtnbuDehQCVHqjug4?=
 =?us-ascii?Q?gZXp2A1JcVIyzyrnN4d3+u4ZqWf8CqYIDWBhYMO7x2cDvCa2M7AvQ/6x8kvi?=
 =?us-ascii?Q?088UAGjK6ah5NBnWO01LcDEMLI5Nb75qbiCLXskC19hx863/xD4Mxf1Cfg7P?=
 =?us-ascii?Q?8eaEcdaMqTfi2r2YBmb4U5ZMZGCQDOKg7klv22rAvip2NIG2uH5US/qKN/CU?=
 =?us-ascii?Q?xTC1MLDhyHAaimhBYpUNCgvUp36Vedh0qnxbS007ZnARN9qdW/kx6+fxxCdT?=
 =?us-ascii?Q?Euy4gK+euKIXLVmzvN74zwaRV3I1AV9nHydBXCtebYN+FqL2qMtTUfpi/ETf?=
 =?us-ascii?Q?DG8TauX/PeBPwY1RDXF5UwSPvi9b6ewqu59/v6/G0aZYSIvM0BsREnOJ7NUV?=
 =?us-ascii?Q?LuN5K6jmRzTUWHfaK8PswGJj6pUNSxenaNHmXCHEOop8zjD89nd4h2p6r8H6?=
 =?us-ascii?Q?1533XrSj2i1ED1VSn0prSY7z1yAObd4aJ7HpZlbDOQUqXsAdt3XC2YmunNLm?=
 =?us-ascii?Q?5I1P/lj6KrVbsw9jGKsjeMzxwBmIwG5NpFUdT36QlNzptUm3SCYb+fmx1G8a?=
 =?us-ascii?Q?Cp62cGIOuH4+7Tl3uJgpUjos5O701NmfXnHS3wgeRaPPNB2dMLKoxVTZNMGj?=
 =?us-ascii?Q?PIi2aQawhKjKAlmhtiV8j/l3y3WpzwD16rHGSlnxWG1aDyIj4ZwUpYuZilPK?=
 =?us-ascii?Q?uisZyjOCU4aMOPDsEFYP0+pFUquSPJvowle3kndEXMoBqMkN1tqCgmJOiBfM?=
 =?us-ascii?Q?8zI4lfCp2zswmiqqp3he1NinWqhHE8b7WArJi2orczCNhqsX8Jm+yBlggx2U?=
 =?us-ascii?Q?lkvPR7aZwCiMd8VT7+bv775onQuLVO+lTX5BVEIldNxC5CdlRzCVUfXZ5Abr?=
 =?us-ascii?Q?T2ZdYZs9A66mz6C5LLKEmOIVV9Yd5HMhfUFVcW0z36oIlB3s24wTID5mUL6V?=
 =?us-ascii?Q?2kYbZPyS8f6/VKSpri8eTUUIM2KwBN7TviYr4V317GnfEGGYoGMus+64/D3S?=
 =?us-ascii?Q?8eW6YNGIv6ncP88RX83nUjo9UBb7kCv0jJAgndOTBsqIo14o6r70RWPsAft9?=
 =?us-ascii?Q?oD1zybMe0Kmoi937sBN+3Pxr8Htefc5jNsuX5A913xoHPfA3gEnKY6I2K37V?=
 =?us-ascii?Q?4SjJDtxwOKUCt8ZLnEyRRDoA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c11a4944-1904-4783-5b7d-08d8d7ee53ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 11:29:47.9268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhH4tQMywXsQecACUDuVuxCARyRbuTG13sTvQXH+CVm3OYjQ1P2dI7wgPeJxYE4/G04TaQKW6ojKlMVjof6LlG4pLYjhQUSsufB0fYv24Q75nj7ShFjbBmNN3Itke1XD3xU+moWHbltB43dco4noUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0201MB2466
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=VJ4l6PGw;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.5.126 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jailhouse community, dear Jan, 

I am considering using the performance monitor counters in Intel CPUs while using Jailhouse. 
Given that the counters are private to each logical core, this is a nice opportunity to get more insight in the performance of the application in the cell. 

The current implementation disables the perf counters when initializing a cell, and exits on any writes to MSR_IA32_PERF_GLOBAL_CTRL to ignore the msr write. 
Why are these counters disabled? Is it just to omit complexity, or am I overlooking a structural reason why the use of these counters is unviable?
I consulted the Intel SDM on perf counters, and could not find a reason not to whitelist the MSRs, so I wanted to check whether I am overlooking something. 

Thanks!

Kind regards,

Bram Hooimeijer 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB666308E65BE540CAEE21862CB6809%40AS8PR02MB6663.eurprd02.prod.outlook.com.
