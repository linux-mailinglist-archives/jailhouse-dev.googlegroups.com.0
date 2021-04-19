Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBAUL62BQMGQELLYZWFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5087736439A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 15:28:35 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id n8-20020a196f480000b02901ae3a7df1aesf5039943lfk.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 06:28:35 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618838914; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ooa+8Kfg/1w0wPai8nf/POoiSDMq4HRcLpJaL8HDWddRlziDjGqIJ6RzBRNB/gcsFR
         UDogJJFtcUCyBriRsX7u+5CfP1lGeMl+tZ+L5BjAUhQqZwuXVHSht73CANBqtrRQQq3f
         Cv8Jx2BFJ1FWkmB+wL7bQwzXIRCgrXDf7kqCTBnY5eaVN+cs5yVzpDIMbE33HM9N3P4P
         GmWVjLy4R4rO6ESV5HZpRmqJ2BUh+Ii6xYYJFwPfVNA+D00iYsr9eGxGQ7g6hAfW5eQq
         yZArDTvBZyew1+gdVNk1VDM1YKkSEPfR+DH2uUUTOQji0zlVzpQbiAsNbEHDNO5NBel3
         LLfg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=edAej4KZZOTSPolTqJ7c+pvPwcL1f0hhXH9ySSTpW3U=;
        b=zPooez+B8uNYObXuGUth5hyRzZhtxMQWkZ2ndfp9b9iP6uj1DKp7a0Q81Ne2IRl5NE
         gXN/fITncLZ8p0KKiB8X0RODO/ZskZFS0Jr0N2Ky4nJCSHHJN9t59+jE7Z6bEkwyEPAr
         qoZ2DEH7mDjcaUATGu+jZrORbLL6O7NV6Ff82HHuw11oCGlqvDZNGuHa3iu+X9QQMedX
         yvTxxoqKdduwZV+zRw7t5O08fkTOURlMfC887F176mG32g/DiPZ9HbNNo/0xerRBVmtp
         7qDqB52byyLCS2isytigNEMXO8NvZNXhProVS41+jmFM/LyXQAY6lJ7ar4l7GJxHZg5H
         2F6Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="TK9e/Srt";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=edAej4KZZOTSPolTqJ7c+pvPwcL1f0hhXH9ySSTpW3U=;
        b=nwBRpoWewPixwkNsFFzZbdsIagzcUFAquVUjk+ijVI6neYSbl7QTmLfDVVks3jb6iV
         AN4wzQcKVYjVzLllKtpbvCXtN0Kb8WKBgVUPV9PEhoqzGj2arrupFCfeCrBRvlo8hTjC
         LdazHAdySAg0a0xsov6q2BnYDp3D65ko1UkruxgFER11USJF8eRn/I/Ag1EawnHKuXF6
         soS1b9v+XEvH4hCqnpjx3WKa0ZsMtOvgnEJNePcmFsEw93FdtFlZltr6wJ0jxAgVKVB/
         o1Ls8Sqw+PK1kqWnQWBFk/LJ6UqkoQsG6YwmPmM45eOUMQp0HoI71dkx3G/huPRPg1yi
         XZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=edAej4KZZOTSPolTqJ7c+pvPwcL1f0hhXH9ySSTpW3U=;
        b=RSBrBNx/5bnHH22ATtD+rwZbSXjFSr2O8cPEhJVgPQ2mzwUe9zFiGxX/Qa07oNVdIQ
         Ewh91tZJ5iwQVMM6ATMQDSZBB66Jh9dIVZFmwAdvkF84dCsxU9l2NSoP/vM01lQ3R4iP
         exswn+s0YGNY70KSQi6dm/bZJMiw2yOKegSfr02yo1QKsUnvo8MbujZXgIPMK7cq0xtc
         FVLcZnsPMIgVrm0na8hvnnPWASixhiOB35y4YYjEEsA5SiQZQ48MoOuPU1Rtc83QI8xG
         rhi0vBYOVCwwNhkDOBIYGVtq5/gGdSdqe49K+9OfHJpceVYwurwqSk0reDLa4WYdXyX/
         6okg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531PQfWDwlWaj3siABPcq4+ntPJ9tcWclzQzfMvUQbb5bKyUdm5H
	8c6p9Da4NJSndmvEJxf8wh8=
X-Google-Smtp-Source: ABdhPJzNfkQjfMeWbE1iVLVqpAzqtAGMK7xmV28LHL5paJNdhj61nNqnZW+xiJN/lTMIMcOLZMxIrw==
X-Received: by 2002:a2e:bf03:: with SMTP id c3mr11823231ljr.184.1618838914777;
        Mon, 19 Apr 2021 06:28:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c22:: with SMTP id z34ls608254lfu.2.gmail; Mon, 19
 Apr 2021 06:28:33 -0700 (PDT)
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr6436739lfm.203.1618838913511;
        Mon, 19 Apr 2021 06:28:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618838913; cv=pass;
        d=google.com; s=arc-20160816;
        b=rwZlir0kUTIz7We+nooZfzzMJV0XktCAVyCP9DnUg7zKB4oD2CPwJ2A9ZP8hFN7xau
         WUYINPWVMJqmkJdjElCo8PRHZ0y8d7h6xbZ7ZNWz8ZDpNDJO0NITsm6quOD9rKeBzeq1
         e/ODXldAx2vVgCEeRkTHcVJmr1iz+igv87FZoOIaGtnOycdtCFjS6E4fMnQs/ICRCpf1
         SfINk5Wgc6RzYJS47BmRhOGc3Emov7TsPTGRpg1YiO/PTgJw6mxrR32s8rvHErFHdZeT
         dlapufeohO1b5Umn5gCKiDea8noTywumLO2sqayusdySCxyFCpNhGfH6aOX6u0/4GBKF
         OWvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=TV33Kdm75x0Gwy1PvMB1Yj9hmNepRBPBVVVzNo66GH0=;
        b=xtsSMhxko99Z/vbhNn1ZateWJuZQs1DXbq9nHzLq0mNDTl7hLaXHsXKunvas7Q6wOl
         MGdgL//xGdo9ozsNOPE+7F/Um8WVrWoKVMSyJABZhbUbJBd4Stp9yCsieqMFGsQarNsV
         G2aJKGY6dzJcPNE4bRG6O0LT5ECmnLI4cSgg3jIydeC46+6ONptQ/Z+MmzjkAtYnt+aT
         qRDNbTmzhLxl7T89n0pv5iCqw+o89D3gqrNkDqLdok0zhnb+WPpBEDRHl+N1we6mYxr9
         b2/KBKc6jQliy04SaeSZqGmAYH1RBobPWRCjF4cBpAWV4419fivxUnDMFsaeedF9FvBV
         PQng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="TK9e/Srt";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com. [40.107.21.83])
        by gmr-mx.google.com with ESMTPS id d25si84462lja.2.2021.04.19.06.28.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 06:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.21.83 as permitted sender) client-ip=40.107.21.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWYwGgfR+dHSl3x+OWowho3W9FBnCLM7RnTxZw/SMbBqm8JXX4D3r4jHpcNVwkFIVkQbeuE/xy1WDAWCB0gIMYvP+4GSQdnIbsyYqcS8Rb7nHttaI8ae1QJvM88Pucrq/x8G7CNXis7IME6dKcf0zcZSaWusp6hSB1lqEJmEt6gQjVLtB8yhWnCNy2KZCKpL5RsynshX3Py1c0Jgb5cEeAjtaz7/hw5tZhbmeUmY/p7UX8XDrFWI0VzfozrqY6l1m/0oS4Ivd1rCrrNqVb7lM16keNdueFIxI8/7LYdoMmKl8BS7pFZVokdAtbOkpESNNjjWgUuHZuWimGAUBT5++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV33Kdm75x0Gwy1PvMB1Yj9hmNepRBPBVVVzNo66GH0=;
 b=eIO8549wjTMzTKv42TmvV9f9eNHHmYJbsGq9W5H/oVGp5Jx6uQsHGLdFmfBVAdeyXuWWlS9vzb5NPaBCy+JUq6NUcxi2WaNQrXo6dGlxuSdyM+TenVkGbhuHE6djsHAo8EFAlrEmYuRv6BC+rYaPwg6JXoUnxEJjZHQtgNex7+LIC45D6PDWS/pSz9gQvZG2x1MXF2jWbFjkRwBHWIWB7cRqmQVY8VhLqy32cVueIZo0lIfDAn0kRBLjU5eUYriGzTFwfI+bEJ5IYkqURfZQ+BReNkCEv7yHzydMDnhcIVMua7FWC6meJ6ozbUaRB5ZLtdqgCJg4UcT9F2ZaM0+0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4233.eurprd04.prod.outlook.com (2603:10a6:5:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Mon, 19 Apr
 2021 13:28:31 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Mon, 19 Apr 2021
 13:28:31 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Marco Solieri <marco.solieri@unimore.it>
Subject: RE: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
Thread-Topic: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
Thread-Index: AQHXH825UYHf5+045EG8V/hDxrSc3aq7/9xQ
Date: Mon, 19 Apr 2021 13:28:31 +0000
Message-ID: <DB6PR0402MB2760F544F58FFF3AB688F19688499@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
In-Reply-To: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7053265-2eae-4097-2624-08d903370666
x-ms-traffictypediagnostic: DB7PR04MB4233:
x-microsoft-antispam-prvs: <DB7PR04MB4233655CBCE56C3BC341145188499@DB7PR04MB4233.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bFeV4zT6CuUAO0FYlWYys1tfdP6aFeXX3RLK6or5NoSf7klsQieSqzRJQ0x99aVSZ/UWYL6fradx2rzdMljzuIhuJEZH/jYX6WgpFpfmNMZalck5JY89IbyKxg5NS7FuH1iI2Q4R5scgv/7jvxGgQZd4FMBrh1jpZaXMzytn0t1ef44H9plM63Lm8Id4eGSpmvG+sYbbFUUM7AaeCXmp5VifkaAubAj8hxxxXozSFHTvVSua6mcISW6tFZEJVr7ERTQET0hLxOdMrkHf0xPuDMhdmOpg2BWU7YV2yQ3JzmY7ctx+zM6nMGvu0XjldxVnotesKtvaeECr+4ggUMT22Zte9GMPnVVZt905HDXdQwcUKj1F4DuXkD6K1nq8nshSpaIsfPLG4FQPtyQdpO8mmhwtCocuwyMr3SGAfAGhd4Elcri/WBJ3zM2HA4INSHu9aAjQN8IrGqDeFrasbJ669bvggc5hb+P9DXNes5+DtOP1gkTZ1WrtBZ9GfqKF5bRS6XwuyD+0rIHB000i3KYJAt3mKJx4oLuj6CiGRdSmQfp8DcuCAF0wOmfVJuUTAJT00OiVHE0rcl0CU9F2hpTcx218GR32wQSNIKpcQfA4hp8wp0SXNiMvuNJYoGW8kPEIxVJn7Mxwc1brz9s4NTLS6L1RB+gm8Jeln0d+HG2Knv6EjkO5PLD2m/FcSYNzNsVA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(66946007)(83380400001)(316002)(55016002)(122000001)(6506007)(8676002)(38100700002)(76116006)(5660300002)(4326008)(110136005)(66556008)(64756008)(66476007)(9686003)(33656002)(71200400001)(86362001)(2906002)(186003)(7696005)(44832011)(52536014)(966005)(478600001)(45080400002)(66446008)(26005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?jWPLwrwHJvItcFdkH2q96Lipi5c/r6pzjUqWhgBLwEc0sg8SdAFaUvKqHiL7?=
 =?us-ascii?Q?/6QBTRQTsYchXJs71t2jzHBzcsI2Oga72Hu9afI8GEpLWM9sML7sHk7dAjrJ?=
 =?us-ascii?Q?Jgd9d6tbZszPkTDNUzzEEELp0O1KA/UyzlL2dPv7BlNxQ9mu9IQXaikjPd/8?=
 =?us-ascii?Q?OAcG4AxVWWKAfUa8XJcuGWzN5YjECGK/4Al1a1u6uAgHuKecdk1sU7vvpWZh?=
 =?us-ascii?Q?NzgvGLPr5GawQD+HdFKiLN0pl0xx+3oKCssuH8V8B+rNNL4KqBay/xG2B2P4?=
 =?us-ascii?Q?6XtUWc20X61ZYRXnCrrzRGrU8j9FOskRh42p0xEY7T5S9bXSaFGeuefccwZv?=
 =?us-ascii?Q?cDdNlLNhPVN3jCjgaUSjhZsHcBoOaMAggTbbCVQoWadeyoaez4fFis56eyp6?=
 =?us-ascii?Q?XMEZrS7iTNUvwordLS5j/4JOEvxuhEAzz+gr2987+6Rra4Pra8pKi6yyKpMp?=
 =?us-ascii?Q?N93HBzxMK7ye8ENbe5e8St9r0/n6FRGkMKZDrSm10vS6kK6eGpho5DftvUsl?=
 =?us-ascii?Q?+aC+m3oztLHpgfxC8yQVB+/Cgu1zqIlxmy4ABCZSloU2bhGRepcwaBro56Wg?=
 =?us-ascii?Q?83wHiz0U/TYORd9H0jbJDPApM/TvuuZARcjHNDj7MsRCwuRCeRy2XtEEEzC6?=
 =?us-ascii?Q?hdP43kK+rMOw7VzyK5pE+//z39RzhmVP9xaUfA4C0z8j07gar4ndrWLGR9VZ?=
 =?us-ascii?Q?RLLWdePftWCXlP6kCILCppazFEHJ801Hx+2z6PxP0DzVuM7dmScCRNvZ6OMY?=
 =?us-ascii?Q?REWtpnK4YLC+vDlnd/Df7cPY+gPsthGmIm3Z16qhPKrfBfCca3xmJpmKhXWl?=
 =?us-ascii?Q?w9ViLzcuRW2IS2PRtpyvmn9Pasc+DUIDAy99FbcdoRKgt3IL6TYHMUYL1q+P?=
 =?us-ascii?Q?r1F8IkJXAPE85zUC5rrtlkAAq1vWybDHullDHeC5RdpBPk0/Md7w63EzcRwg?=
 =?us-ascii?Q?IfNNej4GzrvFYPK9wcwTQ/weyMMGEp/cISQb0WAKL/76TX80/v0yIxAilg2k?=
 =?us-ascii?Q?n1agq9nSBmQKsyCYIfUYH91p8iXa2QSrEF3q27yfG9tnjJIoiRv7g2l9orgX?=
 =?us-ascii?Q?Mxc1lW/6uUjoJs0odhtPCpJ67Twpv9CWWdWbKEB/gnHuwy6qmNAHaknviLyQ?=
 =?us-ascii?Q?Ph9hZWHAmwodjBSv+xCa5SHY2LFrCEPqgGxMtSnFsLntDrvZeyjaQKuCjmEv?=
 =?us-ascii?Q?BFyAIeNLDME08E2az+onHivxrtPx7nWavOYTaKsop9EV4IRyE4hD1VYAOZXW?=
 =?us-ascii?Q?5HrmJUkYOOToS9BOcjFjqKwqe3fpyOXsf3RNK9CJdhgBrbQ2LZaTxkFgjAiD?=
 =?us-ascii?Q?o+OzmHN94LI7xumCr/U47seo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7053265-2eae-4097-2624-08d903370666
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 13:28:31.4058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AnbDgQ9iASTG3IUCR7UfdIl/9zN5YfL/nGEB+jBCKgda3eOtjyPr6B00w6di9P9CFg6zcHUQRrHr34WD8+7U5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4233
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="TK9e/Srt";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.21.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming

Not sure whether you are aware.
FYI: SDEI not work with OP-TEE for now.

Regards,
Peng.

> 
> Hi Jan, all,
> 
> I have seen that arm-zero-exits has been merged into next.
> 
> My understanding is that right now the only officially supported boards,
> meaning supporting both jailhouse and SDEI, are NXP's ones, with only a
> experimental patch for the xilinx zynqmp firmware to enable SDEI.
> 
> Regarding that patch, I have looked at it, tested it and added the missing
> non-secure-boundary check.
> 
> Are you thinking of submitting it upstream? If so, how do you want to
> proceed?
> 
> Angelo
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FCADiTV-03GyURVJ2De-Fe5r
> eAcvveWQq7JxAUTh2kES2DSbwcWA%2540mail.gmail.com&amp;data=04%7
> C01%7Cpeng.fan%40nxp.com%7Ceaba478b1d3941914a6508d8ede4db50%7
> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63752091447529456
> 7%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=6zMBNnEHb%2B
> %2FL3FRMLvw%2BlO4KnOr9ryagUIj0soQB38c%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760F544F58FFF3AB688F19688499%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
