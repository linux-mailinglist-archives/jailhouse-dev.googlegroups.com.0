Return-Path: <jailhouse-dev+bncBDGILGE54ELBB7EC42AAMGQEKZLMM7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4330C64A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Feb 2021 17:44:44 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id i4sf3859183edt.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 08:44:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612284284; cv=pass;
        d=google.com; s=arc-20160816;
        b=zT6LCKzr7wtMhype6BOK3RrSAHIVZiWZ0NcwqBnsq8i9mmE+Q1QIcVD52T//Sz7sk9
         TH1X38umYl4EZ5k2ApczpVWdSg4c60y3JEtnE5ZI8nOOV5mbNLxNf3y75OGvJDK4RoDs
         whDKhlCFDFXTcmFPr9mWlJoc4IH/rGTWTTJgSWnRYUDJmdnXKUH4pBWV3TbBznJVCHXH
         uNQboNXY9SnV6ISkubVff6/xfOj3ybp+MXEYLBpf2YkeFgQ6U1lVEQ26QMbPZNmhFQqC
         Hf6kfny2gNGlzzQgXdS+jpkD4WKmLP5/KVJNyD7MKaqyQ22DEnosA1TQ/RW+k/R7v4V0
         E7FQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=r7RWJDaoNhNpWNbmeIZJ12J6RiXj+/ZDMPHmxvUhNuM=;
        b=JoJTELxNJodmFqUB/Y/tuadbJC50hMReQRk0rpfyDZ5eKSYohhm6Jy6fZPAPsxnHxL
         jmtnW88uShx6A9Y0tpSY2xUPbisuuU/IH/jgzVYPJBkrZa42c6kpexisrlsK9EW8ZsGi
         Puk2pRHQl80C0Qz9mWo6dM+aT0SRO4fN8WLsV+rlCmGMjluSYRbh0DQGHmPX+jatz0wV
         zmgwWiGZhB075n7pIQG3RqjhMeo7jhrtczo3NVjY71R1dS2eUoi11mvusysQdgSt3HFl
         9UtPbxegAVB/ZjAfSplG95//MAdFieNJLxueehmB0hK+i6aD4wirwsWs7ZprJicrrua5
         pskQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D4WY4vZi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.94 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r7RWJDaoNhNpWNbmeIZJ12J6RiXj+/ZDMPHmxvUhNuM=;
        b=gb1USiqVBYVHkAVErO5UN+jNkNJ5hf9j6sYp7EYwhchYKYzttNZsoyMX5IoA9EhbiR
         W1lkKbcEbyPREtPN+GltQm2u00gekw4t71L153pcJ/4YaR/Loilx8TBbnXZ3aIdZiEvo
         kY4cKc1Sw6r1IGB16E2unSEmkOSXAXFnYHmIRuDvw5nN6thB7hmz2Wc/Y+YjspTTYC+R
         ssywbEf6TWghg48fijWzeScSt2NVx2FbCMKXDPtxSX5vqF5QqYKEDWqNDHSZsBjJaLnX
         BGr6mdB/die5s9Iv/vb2n4p2f/fuKgVqRqjU8iZQuABm/nmph8Gkjj2C3wt38GhkhR8C
         jCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r7RWJDaoNhNpWNbmeIZJ12J6RiXj+/ZDMPHmxvUhNuM=;
        b=Rk/fPJ0pmJlkrJiAFEY87pvl8EEIuTDhXLzhCQFYxGYsZgvJiW4ErSwD02S/kFjF/T
         Z4CI82w3Ghjp1sNRLv4DYZblydIy1/Skwq+r35GVg7bQuHgOZGadX2o7o1LSadQMMN6u
         Ntqx45eODnq2fnJtJVYXWC+Kkg/49STjorPE8GnENM7/Osd4K0GPgBpdgMYIG4tMzJmP
         2fbr8ieH+xTNM7N7D3bV1ohaqEPSv2igqPNyeCukWpZtQgDZ7oCuDHzjD0j03njTCsgW
         gSaxeXSA+qVBHtw3B+4UnXp38gLu9jS9dD8NTHRbJ83Zsn+0qz2JTd93eeU/gDNqdLG6
         VZqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532d9h1lJuBCY1Z88QPN76SG6NByIwbyq7ONO7E8EzXhy9aKOLD/
	UaVFGnbEXZ2nnxi6bfXAG1k=
X-Google-Smtp-Source: ABdhPJwsh5S8c5XDj3dRktQAxE9YSlgPRnM353GRSvGIkgV9IG//+cN03rQSOROX2eNX8Y2hGor3kA==
X-Received: by 2002:a17:906:ae91:: with SMTP id md17mr23344469ejb.302.1612284284334;
        Tue, 02 Feb 2021 08:44:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:520e:: with SMTP id s14ls719919edd.3.gmail; Tue, 02
 Feb 2021 08:44:43 -0800 (PST)
X-Received: by 2002:a05:6402:13c8:: with SMTP id a8mr24217521edx.191.1612284283432;
        Tue, 02 Feb 2021 08:44:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612284283; cv=pass;
        d=google.com; s=arc-20160816;
        b=oywBxI33Qds4n0TzwzicQrUOGZ0kEDn3sSx+Ol3YRXrYRqv7OQs2iTxztkVVHU16Q4
         S3iWJO75wb9SojKN2QDAf6V6jrNT5HTdqq4iqax+R/gmT7fVmQBn7/fuP8+5WhoAnikn
         ZxtFl6mB7zZoEMfpLEObMKHNdhGJMWFMCF1SNwgWUWLL62kA68eGhC1NWIABT7EOgJm9
         LxDvrvYLZ19jC3p+fyqi9QLUZeFsBQIOlrv42AsUejwAE0W3xVgfBp83knBZNHuyVpXG
         WMkhiISDB7joYOyr4PKvHLsB87uR8jv4pZScocHKe04qZKV1ltO875QcVhKZkw/Y/Mfg
         pqPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=ix7w6aRH8g7XCUWFIIsthVeJJLtjavV8e6H4EEQMmDQ=;
        b=p1M3JJOfmrTfshF1a7Xp0xMG8+PSrQEvT37f5PwDwxqgQYBGdlPQddddrc50bRbEs2
         s30RErMpezBesaL9gwXl4OtRq0i9tp4kwHJyTY7YUa9wBmVWgdlH2rI0ncBbwaLIBJcP
         eJ3orD6LRB7GQQrn3lzFsralqYjy0SuXMfQ4IAsrmjRuAboVNSU4wVJ7hNhocIsbn6k2
         R4DS2dg0lLOlbrqZwWOEIi8w9dpifOUUB1VRQhkylHkk7AY2SSzIBpDvE96dCrE4DqMf
         7VC/2/KqZNpd7gGSsGyRXvBr+QVrh6w2hXTyFeSf1WhI+pCWVxccUXwKb0prCvPcIfF3
         BXug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=D4WY4vZi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.94 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2094.outbound.protection.outlook.com. [40.107.21.94])
        by gmr-mx.google.com with ESMTPS id k22si780253eds.0.2021.02.02.08.44.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 08:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.21.94 as permitted sender) client-ip=40.107.21.94;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy754c7YWASpNiAQR9apCSQe7qGoEbOy7Iz0AeUr1CjXoHvS4SE8ItBTtD8BcAL/NTl0FW99BYbFOvjNLhtsqFRoWu3SW2SQdzfWzINC81+MF/Ik+omkgIt0a9kfa0v22NEBH4tavCAvCxLAtL2A0Ul6NU4GvYmvcWGSvqkwqh9KWgMim4wwIG2bjIg4m/NPL1AbtWaTS0csaqqulChswAflPje5Y2yeFN99MQOh3YS2YjBaFgge5t5Jp3pblZKA/W+IUhtCtp1F86WKX5HMC0YAVlv9gOq8//0VBB2Hj/Jsh9EL77gDEzSB+FemYW+RBESWJ4uoN3H+v5mkFz6ZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix7w6aRH8g7XCUWFIIsthVeJJLtjavV8e6H4EEQMmDQ=;
 b=UYNkXB8Q4Z9TM43aFxgLtwBN6kJxjKFSu4r1EKo3FoY/YU8jho/Ca9jtMUlSifHeGjNCTGfaiyRk30HMXxrHlvITpOwnFdCyNcKtE7ziA0EjOEVxlUhrf98bcXG/tuHLRWL+dFbKS7tuHbMZJH7lFhzNSi823YOLzwEbFZPiMvB4BO61bSdjbTZyZSbEYS52ebL35Cwuk4BsW687kjjTYZ73o7r5xfMnoVl/sQXYm5D8GRM6+LNxTozNVIAW6qOA56qZGYSzm5LWBYJchdjWW2J/Wl+aJEGFYoaA6QvIxcvKuqIDI2ZGBwEQnLykjFSN9/psHDVTJCRZjZxmr2cNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com (2603:10a6:102:fe::22)
 by PA4PR02MB6910.eurprd02.prod.outlook.com (2603:10a6:102:10f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 16:44:42 +0000
Received: from PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378]) by PA4PR02MB6670.eurprd02.prod.outlook.com
 ([fe80::91a7:f5cd:50df:e378%7]) with mapi id 15.20.3805.019; Tue, 2 Feb 2021
 16:44:42 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: [PATCH 6/6] x86/cat.c: Add COS re-use in cells with same mask.
Thread-Topic: [PATCH 6/6] x86/cat.c: Add COS re-use in cells with same mask.
Thread-Index: Adb5f8baaoqFkHOjTsiSOdfQjX6GNQ==
Date: Tue, 2 Feb 2021 16:44:42 +0000
Message-ID: <PA4PR02MB6670F14BBC726C44E8200B2CB6B59@PA4PR02MB6670.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef7173e1-25df-4f1c-9044-08d8c799d711
x-ms-traffictypediagnostic: PA4PR02MB6910:
x-microsoft-antispam-prvs: <PA4PR02MB6910FBCB63656078BCBACF4DB6B59@PA4PR02MB6910.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UJj3HcxO22uX391HOdhumQGmWp/Rcyf5G1J+HB7s/EyQpNr6HqwEhB3jWmYBdeoT32BhOZ6JrWJRib+Y4hUUfkoFHSEbK8n4BG8qNfBqrFsciVYcHZUykzm9b4jqmkskHaqyUU523nuI1O7Fr9APdfocd8q6FKpADL6KXQwQk3VNh/LlmEuI3tmmxP1dE9Ljt2KR/vB4Rue/zj4xPDN62jLZSJxR2IxFTQ77ZgETfeXDBunuKG0ATsY5JS3op14DpxjtjOeSSyuGHGD1aRVbYZ6MCfU2PHC/qoX79plrBvqP7us7diAuPMaMnkpJicFkgCVa+vPr4p7cbdFJooxsHnf71fx1bMLON4h2QOG/2wr/nqxOAKvhOv6dXbJTl2NNoZtaEae5ux9cozLWzsY98tntzVn66ktcbPknpo+yCtqt0YpavulWAVNtQLoGblSsUfyXwDJXULNLPkpBRYVVu6tzmJEIlYo2qHQmi0BVX1CPVs4byTbQEnfMFSEik306ZkDK3wCaYtRofF5H6A1pCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR02MB6670.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(33656002)(83380400001)(66946007)(6916009)(8676002)(52536014)(9686003)(2906002)(478600001)(26005)(6506007)(8936002)(76116006)(66556008)(7696005)(186003)(44832011)(86362001)(66476007)(5660300002)(71200400001)(316002)(55016002)(64756008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jsiUchk3CGGo4KK2YY0+nFxri7uLK9tLAc4AEg/xvcyNwlDi3wYdKm5q/KBa?=
 =?us-ascii?Q?Vkref20RAfg1Ha1AHU6bGUQR3J6GjIwUyniQiu/uud7ph3glv2iZlfDj/6nD?=
 =?us-ascii?Q?t7y4rBvoQW0Jj4sgYXb/bAX2zOQ8VIfps2oX3joVxBVqeMemf6fUAWlmLzzp?=
 =?us-ascii?Q?bn/rzSsS+FcZVu7M3yw56luqb9Nf4d187aKfu7nfHTe8KOQR5FgTZj0XMXOi?=
 =?us-ascii?Q?EsZdl/6EUW00FVOKcVE3QuI7tV+ZRh+GLqBhP71T9GzctxPPLBooD+PpK9c+?=
 =?us-ascii?Q?yTS0VwaqY2whokxmq+rLdyNWJBS+tDTMHn340asrwlbRUAy4rdJAFaEeD+4Q?=
 =?us-ascii?Q?FPe5pALGzZD/AEbXDZn93csLKh0MQIUSDeGN/LWJ16VFc5k6K+3K6qfpKEt/?=
 =?us-ascii?Q?Brn731QEyTi5R1u8NUX66kdI7hrii6QF+7numOSmhroebEoHbQ+KnWmyz4Hp?=
 =?us-ascii?Q?5V69LTBZqqvtJZsjHda02aNErtijO9Ii83EBMUCgiM5ebH4WNWsKuKiTOnVc?=
 =?us-ascii?Q?GBu5NaqGAXsc9K3JDIkfGng0a1iNkTChXpsPbzSAdAcjrbr8TkEo6zgAqssU?=
 =?us-ascii?Q?BTpi7ER5CWmdvWTn5y4n6rz6fJMXKNq18lLcJIRU1Ej25qX4sDbiZxquZ22m?=
 =?us-ascii?Q?1JBD2mgiYfkfPqUeCS3yL+1FKqKFBuwGM+oYZIVRRQg/8yO8ONnHhFI225SV?=
 =?us-ascii?Q?+W7jJ05kxjW1xCFfMdd9khjH4UNZhVkyeRIkPYU91DC33MBGLNT8sZUj4zIh?=
 =?us-ascii?Q?w8z+Zgvu17XPPuT++hH5X4yqUx4uDADGiZIiK12alBt+RRAGPz6/K4ArTCDW?=
 =?us-ascii?Q?WXh48+dIHyyMpiil7rdpPYylR0gn/Y3pu08MS+0+yd4HCvZVwmtd6yzcBH91?=
 =?us-ascii?Q?lvlQV7nlOdVpBjr6jmbNEt+NdX8QR00tki90Q85jhi2BfKE7ra1fotRhB1eT?=
 =?us-ascii?Q?5r8EKmeiDqm9J+Fe7JHjj6JEA8tZddRh+3nf0iUWEkoxen5f7z3+F3tDuasM?=
 =?us-ascii?Q?PJMen5C5cYwpcK3x1gRmx03RJkgd3NhWIzz5BmWN8P/+HmyDLp75Zc62MZIz?=
 =?us-ascii?Q?tXrOsDe9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR02MB6670.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7173e1-25df-4f1c-9044-08d8c799d711
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 16:44:42.4215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4a2ec28CaRW70E494WPDsJu2hGnj+aOKZaDxY9EdcbgChZIaw/CgeMOr68RTTulEvriTlYMkf+i5haH7u6GQUUXOy4xI9mfA0iRLD1Hsu/qh+18RFN94MUFxRkLsoOOKUnUcY/BjISFg2hOvfZ98dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6910
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=D4WY4vZi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.21.94 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Upon cell creation, check whether there exists a cell with an identical
mask as should be created now. In that case, reuse that cell's COS, to
increase the number of available COS's.

Recent Intel Xeon Processors, which have CAT support, can have up to 28
cores. This might exceed the number of COSes available, as this
typically relates to the number of cache ways rather than the number of
cores on the processor. Therefore, creating a cell per core which is
isolated from the root becomes impossible if each core requires a
private COS.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 hypervisor/arch/x86/cat.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index c91560a2..fc943a0d 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -45,14 +45,22 @@ static void cat_update_cell(struct cell *cell)
 			public_per_cpu(cpu)->update_cat = true;
 }
 
-static u32 get_free_cos(void)
+static u32 get_suitable_cos(struct cell *cell)
 {
-	struct cell *cell;
+	struct cell *other_cell;
 	u32 cos = 0;
 
+	/* Check whether a COS can be reused.
+	 *
+	 * Never reuse the ROOT_COS, as the corresponding CBM can be changed
+	 * when new cells are made, collaterally impacting the created cell. */
+	for_each_non_root_cell(other_cell)
+		if (cell->arch.cat_mask == other_cell->arch.cat_mask)
+			return other_cell->arch.cos;
+
 retry:
-	for_each_cell(cell)
-		if (cell->arch.cos == cos) {
+	for_each_cell(other_cell)
+		if (other_cell->arch.cos == cos) {
 			cos++;
 			goto retry;
 		}
@@ -166,12 +174,6 @@ static int cat_cell_init(struct cell *cell)
 		return 0;
 
 	if (cell->config->num_cache_regions > 0) {
-		if (cell != &root_cell) {
-			cell->arch.cos = get_free_cos();
-			if (cell->arch.cos > (u32)cos_max)
-				return trace_error(-EBUSY);
-		}
-
 		cache = jailhouse_cell_cache_regions(cell->config);
 
 		if (cell->config->num_cache_regions != 1 ||
@@ -183,6 +185,12 @@ static int cat_cell_init(struct cell *cell)
 		cell->arch.cat_mask =
 			BIT_MASK(cache->start + cache->size - 1, cache->start);
 
+		if (cell != &root_cell) {
+			cell->arch.cos = get_suitable_cos(cell);
+			if (cell->arch.cos > (u32)cos_max)
+				return trace_error(-EBUSY);
+		}
+
 		if (cell != &root_cell &&
 		    !(cache->flags & JAILHOUSE_CACHE_ROOTSHARED) &&
 		    (root_cell.arch.cat_mask & cell->arch.cat_mask) != 0)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/PA4PR02MB6670F14BBC726C44E8200B2CB6B59%40PA4PR02MB6670.eurprd02.prod.outlook.com.
