Return-Path: <jailhouse-dev+bncBDGILGE54ELBBVXS62BQMGQE255HVGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3E3648C6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 19:09:43 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id u11-20020a05600c00cbb029012a3f52677dsf4704558wmm.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 10:09:43 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618852183; cv=pass;
        d=google.com; s=arc-20160816;
        b=RYq/qzSRLlaeHCvA2OULGRZncnciH0oxtrNj2Ga0b/0BlBQIb91V1bEZo89aGIxI8b
         7pcfllnD5+mWvJX5+ouwdY5vwczS1mESKcHSbAv5Ttw6OL1K2JUBBirPqSrFN+SlHOC1
         PnavyDMsST81FvUqdd//YuYjZXAmdh89LlKsLHo6k9SG7anLelOA1Hh+Rw9qLJvlUdDR
         m/QN28K5uEwOZtb8bLgTBbVGTZoGhUgIyK3BKdOrehvhsgDDis2zpFugRIzfG5EYSoWW
         /MwOBijXZSI6BnmMNgGHo9TRQfYm+9FPkVaZ0w5jgKYaMBFWEhMm/wCoC0eXOrRv+dII
         nmTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=ORMz+vCArgP6AS7XyzlNUvdL2Z/bv4zEZZPa9gj4ATs=;
        b=xDrv0LU6tiYTCvrJ/r7dxbS6qhnzlvdhxzQKhJc/V0fiK7Z7K2xJZgDvGTzW8gJkWf
         cYtOYAdpxnODAUST3FA3SRGxAtdfRNPxlBIPDwZ08AW0l95F3xx74zOxzQbjxO2Ki/zL
         +z7gXqZBkxAnPkSi5T33Ybgi7en4Arwn0SD4ISrpCyxrEhW0tCua22C08LktI6S4h5Pe
         c4WTx3v2cbO9AnBOPRcBttLQtlZiCgr+qpfP6+eI02bUio/xa4qo6hosUcIQwDLVg4on
         rPlUmXatyGS/PCa0Bm1mcEcO1TqqmqRr8yWeudYeoi/R+z0kEdq3ejeP1Nvp46q8mYHV
         3hGg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=Fpz4A4pS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.96 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ORMz+vCArgP6AS7XyzlNUvdL2Z/bv4zEZZPa9gj4ATs=;
        b=RgeqOxv76NuDCd7EA1NsRNgcJQo2407PVlp9ErDM3eNYbmKjoExS2o+2yBmpjZxFja
         /yWOE1fxorbKSLAyy4RdcV2YcGmeCH8OA1qdQ6t3m8JN2kx4Dr3AidohsvPyBYC+8z/P
         A5PawUjj3KPWbcSfYf2ek8ixZxB3Pe/Oxye/5ZzFmwohJ5RwqvcTOzsFKUMQjV5pHWmm
         052qN5xxiDzTvw06Bi5Nsk2Av3fsU1AD31SKEEHF4FQ02Ghq84hPNPp8pVZNjtX/BqP8
         FyiVSE4FHVusiJEilnSZFjLxhAuujggMx3gfk3P8EFc1KQUZqz/omo55YoKI19LXK3Fy
         BcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ORMz+vCArgP6AS7XyzlNUvdL2Z/bv4zEZZPa9gj4ATs=;
        b=qDsleozN9QkktSH92da5tBjK/0YaB9NEDbI7z3rS+ceLI/3ZheGDZEqAe2AoalqbvT
         gNWE5spiFGk52q8lYOD0T8P3LtjCYk84g5gbjXlPTo9vETFLiDdP4D0ZdrZtJ5+Sx8dE
         10q50FhkSxef/Oa7YYdDm9KdeGRMrOfi4qhKkV4mwizKyqBLqpGqGCkJdAGhdGDwep5I
         OHcp6F2xrf6PeNCr7+cr5OBny90X6XOQb25cxXpzP0JBYULSHZ1OMHWBxJaui41Yb6ih
         X1OnakOPbmas9SSDNWBxhqAEqHRss1M2juQglaB4oSGnPZrMDP9l3qGXfDo3LYQBpV7u
         trGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531uNk2m/c3a9ACQubnht6td/9S1n1D5sk/3kWy0Fu5fkV9o2MVh
	v58XxiakJObEBw7Cyz2ixAI=
X-Google-Smtp-Source: ABdhPJyRqLiT2wAzhdkm9HHFb/vOiRKV26eeLy8RyluhXZhlBfeb6rEWPxBYJlkJfVN2e+hxEgJWaA==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr15549399wrr.17.1618852182998;
        Mon, 19 Apr 2021 10:09:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls8682387wrd.1.gmail; Mon, 19 Apr
 2021 10:09:42 -0700 (PDT)
X-Received: by 2002:a05:6000:504:: with SMTP id a4mr16009888wrf.51.1618852181965;
        Mon, 19 Apr 2021 10:09:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618852181; cv=pass;
        d=google.com; s=arc-20160816;
        b=BB0Xnl6P5A9mfp4GiJMudPKIVxjrrk95V5CmNXf64vkGIpqG8i5LX0EvEuN0OaMr+Z
         iOXkCn9ubc3mxfjlxfonX+IM42gSDLBLysDNQXMfQH62REW+jhH6Lf247P6E6OVjY6zk
         rhd8o+WaZmfztWnPJFYt8b/gDy3jcgor+w/vNAABdSJK7YPF+sZMIof+w1RXYLHYHCKM
         +aUFLLuF6hZ1EkdpdsozlCPyg+rBFa7oQYgIyucyW/dTFZhMOKNuaA3XX71NpxTIxKDz
         xabzvI/K0vQkyx2pNFqxRs2XMK/1Z+7exxPlpKuniwD3beT7EdoVmbxqc+2GY6Co33oJ
         WYcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=K4lF09icLZco9O7p2kJJHjhB9QO2xWAmTIuPyNCFQKE=;
        b=zpit9iOn1vavG8aK0uU2tS6Esa6urOPbE4ZBLIzeWqIIhFN/Fe1vwwhQBY2eQdRMf9
         /0SwkYDiSWr23VoOfnC/ZhaFPpTVT34WBQ57BEJAgCR4G1I3zZdrUc1bLP0buTx2l4mH
         ylnLV7lpeCSgWq24WPbs2sUrCbOeaT62SKGQkJtlWtat+KalBIKIUvxPyAOrZGWZWK18
         0tOyOsGnzN4l75v5W4i04fNoAoRYBYh67EUWFqFQwjWCKnj0KxA+8S38+MiuhTUyKqwJ
         WCjehNbJMgDVVq78NWFP4lWFiDouBUHfVMWMycoXbfUrXWH0gFiK9FO+FdMZ52m+lio9
         0zzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=Fpz4A4pS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.96 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60096.outbound.protection.outlook.com. [40.107.6.96])
        by gmr-mx.google.com with ESMTPS id a4si1225034wrc.0.2021.04.19.10.09.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.6.96 as permitted sender) client-ip=40.107.6.96;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ckn9EXEan+KusKhx5tV0G3ZueaXgL/yfZvrtjE29WRflrpT/6/e7rRc7vt2FqbCd3G7kvsov9eNvOUkMiUgmTuxlNGljCpuDQ1VhrCQqZbQ8azlIAUkakhyOpnGTvhVOVLLayeQ3LRzd9NlD92w36nNsvR9VAttsatenOVHwN+T9aNVlkwxQ26D/fOY0FIjXINzxdxVKve/iU4k+LYHG4AcfBo6ayd/hwiHDROC2Zyjj0IE4ohipN2dDWDywJmoZW5stjOpFhhVHUr3ATYrK+4j0KfMgE1kRtkdA3zuVfdGqwem8UJaEt9kvyI+pYP8+VsOsun/upAZWGFaDqp+hDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4lF09icLZco9O7p2kJJHjhB9QO2xWAmTIuPyNCFQKE=;
 b=aBBmAXELmzXFAk66c/DAnOcaZTCx20/JTpGbOgV9VR11HFJL800uUPNJlYos429VJvKe0y95g2SB6eRNM0r3k7bEK+n7o1N8P8i9dTAojHkkOK0X+60JHSDT/8CbcpZMGLySOv/RFQN9ckveRgJ2prdJbWzxtWNa+kONvO7DOO5hG+Y0jz0+EueGRiccqgs7WkWmaqbbYer/ZrEnvK2A3igOz0m9JUDm3en9blXx+DlAe1RMsq7BNX+pbR3yDwbRuIqHwLSXK846dRWAsEgY95X2HlH6DIyhjlsT47I8ViiKej4WW7nSge9Seyk9IXBpSouNpGxq1Qcc6BG7GPkMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR02MB4519.eurprd02.prod.outlook.com (2603:10a6:20b:6a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 17:09:41 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 17:09:41 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH V2 1/1] inmates/lib: Add zeroed alloc, and update usage
Thread-Topic: [PATCH V2 1/1] inmates/lib: Add zeroed alloc, and update usage
Thread-Index: Adc1Pf6cejFfr7A8Qn6nGaU/HEIuXg==
Date: Mon, 19 Apr 2021 17:09:41 +0000
Message-ID: <AS8PR02MB6663931DDEBBE7D87BFFF808B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3482769a-d209-4bae-3a10-08d90355ebc4
x-ms-traffictypediagnostic: AM6PR02MB4519:
x-microsoft-antispam-prvs: <AM6PR02MB45195072F369A066464E7A15B6499@AM6PR02MB4519.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oDNs69L1QRPRczob4/KGNiMP02XxUFT2bdab54RZkr6CSbPwAdPCrLQwQaLin8HEcdsOYsppC5N31iktl2cFDC7hL+/7qlJ2cjONlRnwQGlO+pBu2/7dgn3NDmQs/s2ye0afRF4OtYpIv+hXsDICok31DGZqlwdkVNi0kgKqGJebtdwNR5rMYETL243WrCwTmUflZUoUOOred74Ix0otlDuhXY1VQt4XT/gtBJytfEWS7bgm3Y4JyLtMkxh88d1fKDuq9bcV6FUdPQ3zWNLdK6NmYDMiCe4UXlO2W1cwgEdmrmbmd24GJGQEugS7HWxsN79t1OBGZwJfXbGWLSpXvtQA27yMDetdBFFb1uGeCxx1FozckAtLznRfFyq2BuvARqkmF3PX7KH8j+Enplmd1zbj3QROj4avLybXGCcTEUvlQuarNEiWpLbe7xbiAcv+vUaEZLEh1ROy9envFRbzc9qs2f/UqhIJVxBgF7+nbNvo9FNqcZzfHFZnkkmfbX6ObGY6hUEGJ1ABhGfjAg90kG7rVm1QdvL1dcF8AZlDJFLpkNq6KL0Vb/F3ooVGYaITPDrh+s2KyatMcw+qwS3xnImsuAFMfOGjV8xUT4ZKGec=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(376002)(366004)(346002)(396003)(66446008)(2906002)(64756008)(7696005)(66556008)(478600001)(122000001)(38100700002)(9686003)(66946007)(5660300002)(83380400001)(86362001)(76116006)(66476007)(110136005)(55016002)(52536014)(33656002)(44832011)(8936002)(8676002)(186003)(71200400001)(316002)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+100jsc7pK0KR7jelcO25LOIbypy1qw/xizzQ1HOQlSe19hMcTlPEtnNZ8Lf?=
 =?us-ascii?Q?iqGbk11HZjvIki/NpP+X/OnKNId6pg/2x6J7E8//q6Xt+pJuc9rTjCUx9C4O?=
 =?us-ascii?Q?UL/Q7X7/3w3dywWLFrBOzWQPU3CmlGsEyMbjHzHt5yny1l5zIEBjZM57Juau?=
 =?us-ascii?Q?yNR5jlO1rieN38oLVVCyQhMfpdkNBvkT1cTQdvp0xsNC4ZtNwNbRaDKQbIFj?=
 =?us-ascii?Q?U7eB/fQrHzl2TN8n+UTTYRZ5Qd0o95340R6k/7iMI8CKeInEcsD4SbL7kbsL?=
 =?us-ascii?Q?DAaLcBbIzk9FlFFFOo/sMknHluD0+O1r5MyS3qZbMDcKuwJyiy7aHMkPXCLJ?=
 =?us-ascii?Q?6Gb+mFJc4dK3vw54ZMz1jtUak//fB2eOH+NKUJRfJcqJYHGdjBYQTtM/baQW?=
 =?us-ascii?Q?LRENC0xCzUsYIb7y4N12cDNbShBwV3q8MzdcPtUKoU5L2iZUHJOYQJA/jyyy?=
 =?us-ascii?Q?EsxeusoU/S6RPgckh5tDWvlfhQ1QI3Cpn/SexNymWxguDcenhC6ko4MVbYjl?=
 =?us-ascii?Q?mLa0MHSVI8epavC3568U82aNt4Y9AeifS+AO/b9ZO8W2n1tbRHNfOjRM4toh?=
 =?us-ascii?Q?0DGvnmXbgunOvwWm/CMmUe7/4gbrqcBJwbmGShzKNLpEccLpx6vyIkdcsfrH?=
 =?us-ascii?Q?hTPFcmOcQkbudA7KS513ndrBd7oboTlPdaYoh18bx0vDK7zsyU7M4LM4WEnL?=
 =?us-ascii?Q?wIn8ZsZC87Pp3JlXjxjkzL8MtwoarxwDCDxK89pWrwENB8WiZJH5P1dOufZZ?=
 =?us-ascii?Q?nVopGg3BJMHUSRfoPJOw39y5QD0IerASxT3nF9LvJhNnOPFGHZkZnntA4Yrl?=
 =?us-ascii?Q?urlZ9yX2XRjVZhTAk56AFiBL4ePwXiPShyGzCTbOq5Pz5qZREsgNXDXXU50I?=
 =?us-ascii?Q?TEXamCUatKtUNcQEdGCqmtCvi/1/A2i4Dbvpvl3jwAuDKcXWaX61tAGPRhD6?=
 =?us-ascii?Q?uGnJFTFI3hlNTh37kpDYb6FHNlHQ8ycIF9SNnnzktdtOYZ0zurM2ElUpH/mo?=
 =?us-ascii?Q?A6zqcfp6tjsc79YH5ZA9LfdnQSEbxEh80nK33tA3aKDT/N7G0MsLY0CWOibO?=
 =?us-ascii?Q?vpcfkJomtnS4L2RIWp/KwVXvzhduvVTCNvYCpNeZiaoCmbAP9IimfPW0aLzQ?=
 =?us-ascii?Q?WaWjRs6uoATN8YqY2eTuATfoSWlyUZyqL5sgjlh81iceyF+nayWrua0m7JWZ?=
 =?us-ascii?Q?6i9jFPvdNFAW+0K9qeHNMvkg2z4OzpehGe7V3jCgpKI6NdOGhHsp1D8fKFe4?=
 =?us-ascii?Q?EfDnbfWWEeFQibWFFjajrbPtCoe1V8X4JIOvQKjMFBlodPY1stjNkCUGJJ3o?=
 =?us-ascii?Q?kF0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3482769a-d209-4bae-3a10-08d90355ebc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 17:09:41.1518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hn7Em3qGGlHyHmILKA6QFtdI7mG8hy4dpRHS0ypQ62wG7GOLhNRBowHwFcBBDn51CLdgR5prCpOccHIuZ/NviyUwxQAyErYWHq8tLS8Vt8zuqTBXyReUY4+naZD/7iEuRcg70oEZ9awop+2kzJsmLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4519
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=Fpz4A4pS;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.6.96 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Adds zalloc(size, align) which allocates memory and fills it with zeros.
Replaces usage of alloc() in inmates/lib with zalloc().

Motivation is that use of alloc without zeroing in mem.c:map_range()
results in illegal page tables if memory contains artefacts.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/alloc.c                 | 13 +++++++++++++
 inmates/lib/arm-common/mem.c        |  3 +--
 inmates/lib/include/inmate_common.h |  1 +
 inmates/lib/x86/mem.c               |  4 ++--
 inmates/lib/x86/smp.c               |  2 +-
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
index e68e6cc1..f4c06571 100644
--- a/inmates/lib/alloc.c
+++ b/inmates/lib/alloc.c
@@ -5,6 +5,7 @@
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -47,3 +48,15 @@ void *alloc(unsigned long size, unsigned long align)
 	heap_pos = base + size;
 	return (void *)base;
 }
+
+void *zalloc(unsigned long size, unsigned long align)
+{
+	void *base = alloc(size, align);
+	unsigned long *p = base;
+	unsigned long s = size / sizeof(unsigned long);
+
+	while (s--)
+		*p++ = 0;
+
+	return base;
+}
diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
index 5951fafc..5064b002 100644
--- a/inmates/lib/arm-common/mem.c
+++ b/inmates/lib/arm-common/mem.c
@@ -56,8 +56,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 	while (size) {
 		pgd_index = PGD_INDEX(vaddr);
 		if (!(page_directory[pgd_index] & LONG_DESC_TABLE)) {
-			pmd = alloc(PAGE_SIZE, PAGE_SIZE);
-			memset(pmd, 0, PAGE_SIZE);
+			pmd = zalloc(PAGE_SIZE, PAGE_SIZE);
 			/* ensure the page table walker will see the zeroes */
 			synchronization_barrier();
 
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 5af1213a..1c20a0af 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -103,6 +103,7 @@ void __attribute__((format(printf, 1, 2))) printk(const char *fmt, ...);
 extern unsigned long heap_pos;
 
 void *alloc(unsigned long size, unsigned long align);
+void *zalloc(unsigned long size, unsigned long align);
 
 void *memset(void *s, int c, unsigned long n);
 void *memcpy(void *d, const void *s, unsigned long n);
diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index 7e1c8b83..764bdb4b 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -57,7 +57,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
-			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
@@ -65,7 +65,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
-			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c
index 94ce2913..625ddaf0 100644
--- a/inmates/lib/x86/smp.c
+++ b/inmates/lib/x86/smp.c
@@ -54,7 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
 	u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
 
 	ap_entry = entry;
-	stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
+	stack = zalloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
 
 	write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
 	delay_us(10000);
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663931DDEBBE7D87BFFF808B6499%40AS8PR02MB6663.eurprd02.prod.outlook.com.
