Return-Path: <jailhouse-dev+bncBDGILGE54ELBB352XWEQMGQE3UCXZ4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7C43FD852
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Sep 2021 13:01:04 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id o11-20020a056402038b00b003c9e6fd522bsf1084609edv.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Sep 2021 04:01:04 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1630494063; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dh/ljkkOCy4MPBLJs02+1uY+MgCDeCQ1/ylctxqov0YPS2eyEma0RbATa76bXaLoH5
         lBX5w2AWqrTjCWVlSFExTvAO96Od4nsfNpaUWNIOfLa5fH8lU5Knto/VstFNpjflCXdv
         7p4O2pG843Bqh7BfQz9Y9JDethA2BIn+eT2kq5d7k+fF8YezZwR5R/vAuGePiWVxgwgA
         rNaJchyc0UsKWgATpbAT3qs299xtyKJ/Oc+IwyDTP081GpW1mTknsjB7N8xsGhi2vgno
         A+08ubnBueIHS7HVLK/0i5ZVo8nNaVNs4ZGMuw9U7R5yhnkW8ZFl1IVgnx1rUbAUZf6R
         DmPQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=r5/fyaaNlOhTGZtov3NmY/fT/vfZC1nf/6r7oMNCHx4=;
        b=0R7UQznj1VuAHSNsFgWHAZs341Kx5TklScYDZ9d2k7YZbJB0IT+6yTH9/mPea/xmsx
         uLHCrHGCQ+agCveaYCKQO8hp4XWOJYyNXV9+Iaaae5jMM26EYg7DvK3xugDk9E9W5Jov
         KApNoBRyZ/6yEULBihlMq1o7rQ6PjpXn3uAyWpQ95REJxsN4fOphZIwBA4zZul5bF7NB
         vTBcrMC72ixYqnDpbciyA9BxPQFDZnuAqwxL5vJB4Kz9WMcnfIkVCxnDPiU7uZBKIrmL
         2A9EFZAQt6wxJwMMv/WJRXfca4sqv10ZUavs9O+jnWCnm9Cj+qYCRERq/rwOOTASFZuf
         fypQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b="GN31JZ/T";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe05::711 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r5/fyaaNlOhTGZtov3NmY/fT/vfZC1nf/6r7oMNCHx4=;
        b=PFtqzARvKhcG7H+tzdL234ets33atCUeka2IMDEnXX8i6itgvkl+Snt6yReleJmV6v
         HDZ6/ftGEc2KdgtFZgJlnzXsVTVjtdyy4B0AWZaMbiAUKqAfDUcanFi0DHavjIhQdDxo
         kmg/4iolEoBt86qrctIZoVM5HdX79pL/GcKjlJWpZZvGtkOYsxe4ZEzoFWG5SwGnARE+
         cvtI3om3lRQamo/vRBqIqritQ32OIvFnDw/6LJq73CPZtBKJfZbXttNKk7RfhKkEKAdL
         pWsz1L525tj7/SqhsqIYbpWP1qeTThvRoviB5zyUF91fg2taQvENKQnuAYz4R+TugZfG
         QeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=r5/fyaaNlOhTGZtov3NmY/fT/vfZC1nf/6r7oMNCHx4=;
        b=Ezh+HynCgHcz9XHH8d+dnJmBa1A1TgVLexkQyIop86KXRtJ0Zz0oJcv1+3reBzm7Zc
         tlo21HCjAfoG0Hr0Z6fccN7soQViuPa8fVid7L/afrKVG57+NedVmFAsmJF0owt1aVvf
         wnWBtmpngeCAp9GRtS/OuCoM+gWuCWJEKmZWglWcwGsNrXr6JwMoB+bpTyHkJCy86afz
         xLPm2wLlZut9mEpYfemaiUbAGoS1BCOPuilnAg3mKvJ65XPZdHjciFgh7dmIBLZYXVvK
         mdG3jJ0WEiZZ/uxwLpe8Uk8p9k1LwdgKSk5gslh07Yl3cXQXWY2cBRvM1+qFYQZumSWV
         HUtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5306y25a4VVxq8oD7gc//gg1l0AWIx58jiCBhpyeTSYXMAC4hEet
	EK3F3hD6kqhb5AyL4w/BJZ0=
X-Google-Smtp-Source: ABdhPJw9DtrTemt/qIp8Kp4kKBn/9VeEQfqke+5b1h57ynB+kmFBB83hD6Z/bxci2UlqsetbSfclSQ==
X-Received: by 2002:a05:6402:5188:: with SMTP id q8mr35881332edd.138.1630494063797;
        Wed, 01 Sep 2021 04:01:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:254d:: with SMTP id l13ls1190933edb.3.gmail; Wed,
 01 Sep 2021 04:01:02 -0700 (PDT)
X-Received: by 2002:a50:bb68:: with SMTP id y95mr16554606ede.231.1630494062829;
        Wed, 01 Sep 2021 04:01:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1630494062; cv=pass;
        d=google.com; s=arc-20160816;
        b=iEVcR/E2dab+u2MVA+8j0xZ0kGsY5E96nDi0sgbSjRhYv+mkAziYQO0P/lo6Q7J2eF
         /62yx/vNta6KO3O39Zc7zjv1/h4cChwjS0glcOyeTrC74MUxkoE8qVC+H0kRP9VgRJhV
         EYpUFRg6A7unsA948mYVGfGTcCX05nCf9MO5ymr1bfloH9J58T95gqjfbWzIqAAcLTr8
         5wliahY1Dev9NsfLepNoVWO/MSEzwa/cXVtZ6zQHlArUJUpJ3AvyqSK2ekm6pPLVIE4o
         jfENEi6Dplprm10uv2X7eApw2ZVSmvC5UnWx9pg7bPguLR9EpvQwSCwhWq1RGnE7zaqw
         gh5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=PmfAetMMhTCgOLPlIIKMoKmA0Ljymg9c+hrVu62v8Xw=;
        b=yJdO/p8U8WJUYVN8mqozuW09Mj006u9o4ntLZjDLSFxoGcoEkibpGBIkQf1cUmilD7
         ks9hRn89hUSkWLsfHMVjd+Y85shrmKj4f1In1izo1YeB4dOowca3pXm+Mu8LVeoxt1dX
         thNptXqRIsvzNEZqHWeer7c64QJts0y1QzwR5wtrt7KE1hJhFtuE2uD/qiuWJ3hNc9zK
         d2ZTRMu6Ae79kuI20n/Xu8kWpJ8K+zLZkPjzEapFD4N+H65jsJQy6qrvcUk+L9nTgTR3
         Fxqrt3ptedANuJ6HWK5pU5HdAp7efn2FHZxBLyygiUVk+H1oY2VLlLNIKbEVlOafqxx1
         R4UA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b="GN31JZ/T";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe05::711 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0711.outbound.protection.outlook.com. [2a01:111:f400:fe05::711])
        by gmr-mx.google.com with ESMTPS id e20si670592eds.4.2021.09.01.04.01.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 04:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe05::711 as permitted sender) client-ip=2a01:111:f400:fe05::711;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as2hN3CTDZAgCSQS/3kDOENFquXa1yIDOcpNLtFWyT8t74/OU87BQmjJ7th1haHIVIyIoAljQXKGUoVU/iVEbUvp0VrwNjyxK1WmLh+DqTdVkwGVyXHN9waWG5911L9d8Eq7tUMoxVkiEIDgQodBRatpQukTwfH40DHUrsbQGD2WsO5JIEn46ZW/HIDdbDfxnlWXzoR626iqavg/ltOn/F1jwzsuCLDtzbTAd97ZOWPKzfGYFC2lvwCQyF6lgrJh0mF0ISoylBQP0d+L3/XjjnXTt9Yxbg0IG24Pt2w7Xe2dH8VZgcWRJUD3Qr42UhOWT/6b7Nin3d0KFnYmcemNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=PmfAetMMhTCgOLPlIIKMoKmA0Ljymg9c+hrVu62v8Xw=;
 b=mofYo+L3R49jKgl0cavWman1EupFoY4YSsenCZbYH5DuMtQuWsjAsFC1ipM+uKVUw3KTYpiChcEj5ex3tvmoLHbKK0T6+0udtpbNglp9AiSwPCjct6AHz6aP856pJntZX5gNxNq1RleppTXmMHiQ6Znfg5u+E3DMyScRpvgQcovLWra03FIvzqgee7mbk6JGcWBlxbUhSqjAlFyBly3kLQ3GrVmC8TdvKrg7aMip48lIFa6qKGKNSEYSIpB0z43E9DWsDczEP1W2V2yffcuO4/gnKFrbLoPLMkAO/CZbhzCLtJWgoR1iBZBJJn3XkqAwpFpJVctmR0K50NewZt8UAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 11:01:01 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::f949:d45b:acb4:e0fb%4]) with mapi id 15.20.4478.017; Wed, 1 Sep 2021
 11:01:01 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Error: FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
Thread-Topic: Error: FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
Thread-Index: AdefHQjbncc1UIsBRdqRgTxiubdggQ==
Date: Wed, 1 Sep 2021 11:01:01 +0000
Message-ID: <AS8PR02MB66630A289AFD9FCF2EBFAD7EB6CD9@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a1b9cdc-2ad4-4288-a2d3-08d96d37c93d
x-ms-traffictypediagnostic: AS8PR02MB7237:
x-microsoft-antispam-prvs: <AS8PR02MB7237712E5F0A361CEC5B7E8EB6CD9@AS8PR02MB7237.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RvAzfmMormdy+TsVkBgFLnkrJG/7LRJMsHWYjQQEnD9mI9rmbxiWS/pCJSDHV2YSpeIfvnsdP9WRxX4XSJms1dGJmkiHL14sH8FMv9Nxf+ZiO8NVCkNpY4fD/utyqQ6MBCtZNkKKzh9qcOh6sEBTxv81CR0Y5a0dBiX6g+En5gr5aHryTUqkcN5CdmmwUOjlKIMCKtflSTDBgZdIm2sz4uGfVHwgBnkrjbvivtVoIAodwWWYYbEumibAPgwHB8Cz4P2b8A6BqTctZ5dYTpAJpwCaG90caD2lVrcz1RpZv88JhlfUeWZUTvt46FseFwcBzz9CpVOIoIP9kqJsNMkpKqKoav9guuni3YEsgaAeMBvtO3BPFhKHRaMP1VxUiA8iDaAmM5NgGAJL1rPm0syIjkTriqqqfRV17dZpr6EG2VvOSj0+ReiSWv3Rj/9Fs5j8DMOw6J+ei/bWenTw69Ai0savgBs+ce0E+kFcd2bZ3d+QGsQ9GeY5FezHYTMTGX4sODSn8UNuaOOEqGbwog7itMrxUTgo938/rtqOTNPFfY6tUBftzpHLD3n67tbWbp2zK2jtoZId7IBMUeugpmSHaaPVPbJhVz2mhwG3DjXB3RMVNkrmm2H6WofwXO4OStP8Np7U+m8rfCpeI8BlCkM/0l/i6FNPJ9dU2s6+pb791+gh7kfu2arJt/0srjX2Cq6+HE/oZPSSTe8ND7sLTLErkg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(83380400001)(6916009)(38100700002)(52536014)(38070700005)(8936002)(44832011)(76116006)(5660300002)(66946007)(33656002)(316002)(66446008)(64756008)(66556008)(66476007)(8676002)(71200400001)(122000001)(86362001)(2906002)(6506007)(9686003)(478600001)(186003)(26005)(55016002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OOwfHoyukT78ZPSwgs13uyaiUDcFDDKoO3iwwN/KZbic5bwk9ccqDApt0qTe?=
 =?us-ascii?Q?Wko8qec6fUCx21dVyaIpiL2FgqM3Z0SkG+ZviX2aQveLk6F5vPADd5LmPEvK?=
 =?us-ascii?Q?BqDvg1oST68SEVbH3JirQrIH2jwUbo+uUD6gCB/dRhU8Uzq55qYYilsHogmg?=
 =?us-ascii?Q?eNSlwgyJRy3W9qfXyBeK204pDWPO+jDF2sgIOKcWf1IkAU0lGzaH1SN8fGXQ?=
 =?us-ascii?Q?Wcgtf56gydi1rXnoC/yux7hJJBsul0wMApV9BY5kuRL3Crdf0I1R7c9zzXKc?=
 =?us-ascii?Q?Gj12wtqt3/+nnRPx86QAg9yCtJCsigLayNaLarXGxLFf1WjILtU/ZJBeJVSw?=
 =?us-ascii?Q?eO1WCEK6LqObVkCTb5R80nbYTDcgXLQJaF4wm6FYFu0h/JieUD476jRkD1fv?=
 =?us-ascii?Q?mOYCoka9PSYLNjtTpA1YyQ+T3WOjUsCWp8ANA1sa3by+SIuJevKf2lTxOCVS?=
 =?us-ascii?Q?SUUC5qdSecBRsIE7OdENqGJ+zWdUSIEGSNqvvlbdn63Jbmc75Au2id3MuMKh?=
 =?us-ascii?Q?2h3VRl4GMj4/LVoxO5pVVnE0uY40UXDOG15j6UAm7uai/a3h9pX/Z0b6Bj2h?=
 =?us-ascii?Q?OAG6AzZOMULJl/LZ6bNSW94ExZILsncAScYXWuBdmq0liP8v8B4CVZn2q74Y?=
 =?us-ascii?Q?NvjVrcksz7HWp3ytwFqNSjh5RGmn12zxzr+b9fADwam173USKmStwtoS3JAi?=
 =?us-ascii?Q?qpHqMXWJ24Ix/+V2zLq6Z8X7FYqNwfOizC/Un+5GHv4nzM2asr6UIuC60f9k?=
 =?us-ascii?Q?QGHJ7sU7XYxMfG+dcak9kEZpgmMMtdJW3XXQqH6HIax6tg7lyW5icre43onI?=
 =?us-ascii?Q?HoKPRUhvtNlUFzBm6zN/vLH2YPh7TDbOjsOLoWqBeT17pU2Y7QBL9iDjDQs+?=
 =?us-ascii?Q?YikawExMLi5cAC0ayn0u9XF4FLeoAU9XhlnoVWKC5uxhEYrCULCOFnjrthk4?=
 =?us-ascii?Q?FJgYfO4bkmE6cEXGRrNO4Yl4BEftPUFZ+IJEMqDJIraE+TYhASfFUmOwFlC+?=
 =?us-ascii?Q?cs+VNE260bLC5AXFizrAHYnJUdCKm1eNtGnglkjeqqnwMcDIQUo9DAwf0xhM?=
 =?us-ascii?Q?C47D0qav4RUkohAt77WQ/qdBMH3LiprQMpGkgrVMOWt3WhbEvYaNfsHtvReQ?=
 =?us-ascii?Q?Iax2r6Im1ZKlu8C6aUpo+Gzew0JXLcqleU/IoRmz3kP+x34+mXU5B2tTuR2f?=
 =?us-ascii?Q?jcvxLFvFUQWWaOb8pVoJa8LCsYxuhjfDyQwDcy6OvUNdB/NT1EqGG/Vi+eeT?=
 =?us-ascii?Q?/vKWX/MEQ6n2LPIqMmvITY0yuQyJB2Ebv9gFBDD1Mr87xZU/Pi5H2TkcQ3SM?=
 =?us-ascii?Q?Pfs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1b9cdc-2ad4-4288-a2d3-08d96d37c93d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 11:01:01.5698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOaeWwM63GoYkAN3btdkPQjtatd3DInGvNJYhZT5is+UmxVMueAxlcSzH/7xcdjproVERfQSWVW4d5O4PdYA3ln+TCfPfK72DTHD6rHi3qfTp4FcqAWAqfrUpjbGsxtX7kmYv9S37hcEDPTSJvkhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7237
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b="GN31JZ/T";
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 2a01:111:f400:fe05::711 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Dear Jailhouse community, 

Currently I am running into an issue enabling Jailhouse on a x86-based server 
platform. 

The error triggered is
FATAL: Unsupported MSI/MSI-X state, device xx:xx.x, cap 5
from hypervisor/pci.c, line 833. 

This is traced back via
hypervisor/pci.c: 		pci_config_commit
hypervisor/arch/x86/pci.c: 	arch_pci_update_msi
hypervisor/arch/x86/vtd.c:	iommu_map_interrupt

where the check irte.field.sid != device_id fails.

The device for which this fails is a PCI bridge. The check fails for
vector 8
sid  0x5F40
device_id 0x5E00

The device_id corresponds to the upstream switch port, the sid corresponds to 
the downstream switch port. See the sysconfig snippet below.

The sysconfig discovers 8 msi_vectors for the upstream port, so this failing at
vector 8 makes quite some sense. However, the value of vectors in
arch_pci_update_msi is 128! I.e, tries to access up to 128 vector, which seems 
much too high. This value comes from union pci_msi_registers. Could that be 
misconfigured in the case of a bridge?

Does anybody have an idea what goes wrong here?
Is this on the Jailhouse side, or is the switch misconfigured?

PS, Removing the bridges fixes the error.

Thanks for the support!

Best regards, Bram Hooimeijer

    /* PCIDevice: 5e:00.0: Upstream port*/
    {
            .type = JAILHOUSE_PCI_TYPE_BRIDGE,
            .iommu = 6,
            .domain = 0x0,
            .bdf = 0x5e00,
            .bar_mask = {
                    0xfffc0000, 0x00000000, 0x00000000,
                    0x00000000, 0x00000000, 0x00000000,
            },
            .caps_start = 80,
            .num_caps = 12,
            .num_msi_vectors = 8,
            .msi_64bits = 1,
            .msi_maskable = 1,
            .num_msix_vectors = 0,
            .msix_region_size = 0x0,
            .msix_address = 0x0,
    },
    /* PCIDevice: 5f:08.0 Downstream port*/
    {
            .type = JAILHOUSE_PCI_TYPE_BRIDGE,
            .iommu = 6,
            .domain = 0x0,
            .bdf = 0x5f40,
            .bar_mask = {
                    0x00000000, 0x00000000, 0x00000000,
                    0x00000000, 0x00000000, 0x00000000,
            },
            .caps_start = 92,
            .num_caps = 12,
            .num_msi_vectors = 8,
            .msi_64bits = 1,
            .msi_maskable = 1,
            .num_msix_vectors = 0,
            .msix_region_size = 0x0,
            .msix_address = 0x0,
    },
    /* PCIDevice: 5f:10.0 Downstream port */
    {
            .type = JAILHOUSE_PCI_TYPE_BRIDGE,
            .iommu = 6,
            .domain = 0x0,
            .bdf = 0x5f80,
            .bar_mask = {
                    0x00000000, 0x00000000, 0x00000000,
                    0x00000000, 0x00000000, 0x00000000,
            },
            .caps_start = 92,
            .num_caps = 12,
            .num_msi_vectors = 8,
            .msi_64bits = 1,
            .msi_maskable = 1,
            .num_msix_vectors = 0,
            .msix_region_size = 0x0,
            .msix_address = 0x0,
    },

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66630A289AFD9FCF2EBFAD7EB6CD9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
