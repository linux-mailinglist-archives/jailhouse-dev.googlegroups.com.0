Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBZ53W77AKGQEOCGZ7HY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9E2D0B43
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 08:46:48 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id o4sf910945wrw.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 06 Dec 2020 23:46:48 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607327208; cv=pass;
        d=google.com; s=arc-20160816;
        b=GpaeAEGn0sW7XLwlNq95qaSTPNeexvWrIbMyZPdpkMOuJ8TzLQq2JwAhvKUS/0cotY
         OWdFkuryCztcb35Q8TaZuaqApN04Y+FEA/+CZqXmnNt9meHC9SyryQEK4nr//TJZFlpF
         sr5bEmhywgoei1tch0FAN3vBv7PRGMftZ1U8bnkJCduhQf1S3xlEXkFfJIdh3KSUgjVI
         LEdCjmLA7OpdKE2q2ePrgo/EFxGUYqKOtsfx7L0VlrNnHgcVoxcgBS/57vGGw12KM8Qx
         yB3r+Aq298bpQtN6KWfY44EvAKsWB5eKXwYjuJtk0FK79h7jrjUKWxiQVInxvbp6mR/q
         wKtw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=QGd04eTcEHReKzarFXpGasfxqM+a7ayMOGqFdeoUqgE=;
        b=X8/+Gf0nRJeV0A9yTvXdO0paTDta/3IiXaFxRXjlK8L5L4m03Dcrx/3n6EPkBTb1zP
         3XHQVtzrwnAhBYsuYtQh5cRrCHITzRbu/HVMEned48nlAHVomdSZ0okYsheZQCj5Hxtm
         ckVZ38WnazOH+gCLhW6nvt6c3i+FsMzPgQeU7YgF1B9oQDBohr5UGH3mmCKV1TYs11zi
         trnOpdyN9MQKW2IdHUM74J1VSUpQMtuWxaaQv8lixw06sskwgWK2loAQ9m6YzY1qttxj
         S7D4akxtrzbo7qSarBp0wUVyaC8VDrfwRQ8eNvnLnzTU0nvoPgYlIgxbNCURq20QyZQS
         TKzw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lBD8Fixd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QGd04eTcEHReKzarFXpGasfxqM+a7ayMOGqFdeoUqgE=;
        b=c08hEuz7z2xli3c2lQX/hybAnI/ZYhV9g0ccwEWj+xkXQDGtgF2GDBo5+7HwkEtsaj
         +B0IJbz/V99aoByntoklBhcDEUUVzB1FsVf97KGUyRlZrWAlSfsmKxPMUmaYb1hg0fTi
         Sji/hyRaxQokCcViQqNCoZVEuZUISzzDaPtVTNO6homar9xLUxugQBaximtkwzNSgyWA
         Sgtlx1B9oX/4aW5xc3E7EeVIxdIkgPKjGcsOWqEkBGcooEefOplJwtHq30pH52/UXjsG
         oqL6SfbUVRh7xPoiqig5PZ5FlsIpWUY4fSiy9oCXY6XNU4rxjr3ZMnyQ/QQQ7KfBvZ3J
         Mg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QGd04eTcEHReKzarFXpGasfxqM+a7ayMOGqFdeoUqgE=;
        b=GkTyz1ZuXY4coHBorww+dAteK2Wk2DpilF7btZVDgMrSAdnrR9+8ircr0FvxgNV2sA
         xvVxJdG2Z/mTIdc6JLX0qTLv8uNbeQLfAL0gopAk7YSnrH/ENIm72CqvxTw2DQSgiUQj
         HAwXamRjFP/4UKfsYZSXJ4q+h9LqS/hEbsZ90Us7eCPWqw5xrwRwaq80MWNSyRxIazm8
         eSbAQHpVUlM/hKm/PMhpEFg4s1nmcbw6kCs/Ei21G9HM5VUMcy/0D9Sjip1ZqXfbFZ7V
         AZTsv4oss9jblN3xCERyvr2xQzxWSwX25YUgkSumnVAJSb77MS0tdhX1IW/f7p9VVEw2
         pGFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HaxWx1wQqepiUvU+nPaHJadBAAWOcS98WYZS1tfWlDS5ADaup
	DJR9oDJ7tN9VqT5MgpGUKY4=
X-Google-Smtp-Source: ABdhPJyHLFoPz8Ms0M9tc+ei0glwDc88yUVT3cXTchQz/sSaVtytV9ehapxZB0hx73/WspgD9IcMCA==
X-Received: by 2002:a1c:e3c4:: with SMTP id a187mr13107451wmh.58.1607327207848;
        Sun, 06 Dec 2020 23:46:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d14:: with SMTP id t20ls7753201wmt.3.canary-gmail; Sun,
 06 Dec 2020 23:46:47 -0800 (PST)
X-Received: by 2002:a1c:96c2:: with SMTP id y185mr17275787wmd.84.1607327206965;
        Sun, 06 Dec 2020 23:46:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607327206; cv=pass;
        d=google.com; s=arc-20160816;
        b=DyYLkjhJM8KIQC9dLXCt7zUk/R3O+JWWWnbAoIYIx1nZ0ZOtc22tJC5dmoYOZ1WWyx
         8f9Rg0+b1joZO2kAkABbMeHAiY3FNJ+T2Ob6aOjDLlA2rC8nfLPoyg37ovAoVLbFTlMF
         uagC1a41Jgcu/2PfN7Bjx5S4Tsmnwye9UW+Tw+msDkiCyRPYz49KoC9yAnh+U/HpEpTD
         m5Y0gARV77n/S8A/j2koV45+7LZSlpILPmgVTNv7qreX7O5BhZgth3BAOKJGne1fGpg+
         MYAzuTpfxmZIO2usKRUBsWCcuNnUEaTiiuuB4WDipXw2M2f+Ysr00VMq90cbZC+qNk3r
         JF4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=X1+KejnH8ij4Lr0mtc8kh2ou01H62MkBGyUKtpl/7Qg=;
        b=VfBTD/9LJjutCuaYd1xKb7Fz06rzjQqlGT6hZZ0AId4lUat9iNCDFMgCKK1fx+v5ry
         lSP/qQ/7cw7rQEOevdDdylOAWGiVH+yaitiKKVQD6NcWQ7uzpXAz91o5lxBfEnCv+qGU
         CcQpnWhO0qE4iqmVAngCvDzk7Rgzac016W26jdRbPJIJB6Nb8IhbrEDvxmj3MdjtXSuG
         3Vu2O7GHRHtP+nwjCBweru7Jgw1OmHoBspoOjZOiyl0hsKXWiDgHpVZ6gablN1J1HCzW
         amdf1GPA4wqaRjoMTMOhM5MFdeV6V6YUJmjlCZl5+PTl5JWhoikhGCgNZ2XgW4DO9NRu
         L0RQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lBD8Fixd;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0600.outbound.protection.outlook.com. [2a01:111:f400:fe0d::600])
        by gmr-mx.google.com with ESMTPS id d17si354933wma.4.2020.12.06.23.46.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 23:46:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 2a01:111:f400:fe0d::600 as permitted sender) client-ip=2a01:111:f400:fe0d::600;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjJJFotLtqqSv/w/MguCp/vCHZhnKm6CL+wIUMTbfUWXJ5HvleQpFHvplA/tN6l2dVS/O/ZZnCNfZBhrwRj3XFMIMTjzLdfFI3Qnv7/BkEb8RZYWYLCgRNXiVyQMpBm6N1QqfR0PDT5TyixdbKzR7lt06QrzLxqsFy6EkcE0qGFDEmQ5+QSNXXfbSVYECUIR4Q08tArLtb3YLags9WYpxNAA90qilfhwB+WN54m2PdJYe8gobVFlx43FsDMqqV1q1W+AGojvt5fQCJEBZLce/5zUkepoWLxAmOu0z0w5Jp2A+1YLxnRHPaECSwFMvAvjQPEHvhtllUVtgLDpZix2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1+KejnH8ij4Lr0mtc8kh2ou01H62MkBGyUKtpl/7Qg=;
 b=ieXSOAd8PsHLkbjfziraIY0vc0CjKevPG0B6NuO/aOleYuGm9Dm2WbQCAbMyz73Vw14DD7ovPtGx+KPjkM6a9OYkl8Rg4bDiaIRnsQAC7FOBxP558cW8823UxpUXI8j7JjaCm8g633IUQHSYR0Um9KbjOBGZt/6HT7vMSp1ShQLHClw/Cq1glpcC/5nqxsjv3qS3Ys+kZH+GZ0Ip79NZhDcEDBj2AigaS0RZOTOMR89ILgn7OuzeC7G7MIBw05wkbD2olyTisXUeAJAA99OyzF885X9MPKQODTRhTgDf7NMrp+npECqp7l1JG8pL6KENZFWEpbyXA9Kmb8Qmm/e2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4938.eurprd04.prod.outlook.com (2603:10a6:10:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Mon, 7 Dec
 2020 07:46:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 07:46:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: ARM64 MSIX enabling error
Thread-Topic: ARM64 MSIX enabling error
Thread-Index: AdbMbLjE+IGjwJH3TguDfS43O45UGQ==
Date: Mon, 7 Dec 2020 07:46:45 +0000
Message-ID: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0dea756-e88c-4487-5965-08d89a843ecd
x-ms-traffictypediagnostic: DB7PR04MB4938:
x-microsoft-antispam-prvs: <DB7PR04MB4938A4B1043A9920538E8C0088CE0@DB7PR04MB4938.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qBO1Qs7s3YkO6UnDjOvf9hAuCi52Bs0NtvoJGBnSpafeBDx1VPTs1KJFq5ZMTKEKIFzVip4LAAcpgBmO5mChgnogQPW3cnUqN5VVoE3xjMvRIokIPyOih0CMsNn95/GgmeoQ4l4IufYP7o0MK1VK4eUvk72uLbLbsB7He6LHLkFIHPj/iVER0oX6MRb/dwOF0aMhqAd5kJ9R5bSRBP+M6gFWWHTzSTnW7jcYTSshhLXtjEGdmqvuMWXk1XeFRB1x8hyzxdCz871uqXTNdesq4TybPw6pleUS2IQ0W84CHw4fP55izjLtZhFjzWdNtmx5vsBkZ+XVmUYF4YFtcaD49Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(8676002)(44832011)(8936002)(86362001)(71200400001)(6506007)(316002)(7696005)(186003)(6916009)(2906002)(52536014)(5660300002)(64756008)(66946007)(66476007)(66556008)(55016002)(76116006)(26005)(33656002)(478600001)(66446008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?56qwAOFw2+jssKy5XwhsWp4Mn9qY1ohvRE2VX26UB21Sr0agArnaSCzvbMcl?=
 =?us-ascii?Q?4RiEpXxidNRcXIL8Kn0CdXPD9C/iZx+5aCyjRM+L8Uu0C5elJhCwgqtaKH4F?=
 =?us-ascii?Q?4F2ivueYzhehqj2w71QR1JPVnM7CBGsRHAtWE36vgjDntfJvJmve22eYAMn1?=
 =?us-ascii?Q?J+kVcrn6aZT8Cql89nSHOyNNW7liqY/vQ3ub36rTBZobfrU6pPivi5IVHfVE?=
 =?us-ascii?Q?iHRbdDcOQGud0gxDR4WWMJ8Rhzkbej4WS2tFzOfli8vyBJlBIgCISnV9e8e+?=
 =?us-ascii?Q?XqHsT+80OqiXyxj8iVvgcJyXq/8QKYVpdWumAagBo2sEOZblQEZcrcoKLJ2s?=
 =?us-ascii?Q?wOKWl09OgO46O04uLB3xJ0TPYesSs5pAqVBHH+DnPKofgTyMKEvzxnMNRbe6?=
 =?us-ascii?Q?213TmPyhhzHGAygTQKlUaPU+Ltv0nCkq+j9BEfMzjfXVc5+xi+VfAtd+KAYM?=
 =?us-ascii?Q?c5dpWmMTcVv3+f5IC3FRSLLgv+UrL7ALxOtam1BXlnh4qlU/iswh6WKX26e1?=
 =?us-ascii?Q?aWJhveWgPmdeJomRsSJCXj/VWxtp9jfZ5B059vWd6ub+s5I146WMirOe9h7e?=
 =?us-ascii?Q?elNW9lM74TK7OV4lPqvaoLL0Nl13il60x8K0RhOs6fM6zlgI2gqjxU6Lv6hq?=
 =?us-ascii?Q?OxAfgxYotkAo2qfyo6+stRIJ/ugYtr+pumV6aIw9lLE/dpqIoZpE8qdbLF8u?=
 =?us-ascii?Q?CEGsZ0a6NallS+h0lalHezqaqKZ2ltgbenjmt4ubprLZZZhYaiy73BWLbfuc?=
 =?us-ascii?Q?Z8WEIjrZCq+5Hv9jrPjxfQ+XWEtHrUEHkev2Zo7j4y9skfDNAesTcAlB/oJz?=
 =?us-ascii?Q?1eO0JDQHq+yZtRxKUT6MsWhvXTzj6PS93VNvHe6zhzL6Lcybs7xLXBHLwmCv?=
 =?us-ascii?Q?H+A17saot68T7WuO4x/hFahewqe1xw1QgjW82I0PgR/eTMMUalN5aOmutUmq?=
 =?us-ascii?Q?3YZ2cPTuduu8ziADQ39pdtAJ26vi1YQ8C2FqOXgM6x0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dea756-e88c-4487-5965-08d89a843ecd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 07:46:45.1861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /dzYXF2hZTEP8fQWVUZyuzHY9IJomkFDxQwCjs3sCvczVuw+f+K7UDJ3FIr6gb6DnSe3apec2cu5z60Q+bPLTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4938
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lBD8Fixd;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 2a01:111:f400:fe0d::600 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Hi,

I use MSIX, not INTX in root cell file, but always met the following error.
uio_ivshmem: probe of 0001:00:00.0 failed with error -28


I am trying virtio ivshmem on my board, but seems virtio ivshmem
vi_find_vqs not work with INTX, so I change to MSIX to see how.
But met upper error, any suggestions?

Log as below:
./jailhouse enable imx8mp.cell

Initializing Jailhouse hypervisor v0.12 (70-ga85860da-dirty) on CPU 2
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 39/992, remap 0/131072
Initializing processors:
 CPU 2... OK
 CPU 0... OK
 CPU 1... OK
 CPU 3... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
No SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:0c.0 to cell "imx8mp"
Adding virtual PCI device 00:0d.0 to cell "imx8mp"
Adding virtual PCI device 00:00.0 to cell "imx8mp"
Adding virtual PCI device 00:01.0 to cell "imx8mp"
Page pool usage after late setup: mem 67/992, remap 144/131072
Activating hypervisor
[  233.439774] pci-host-generic fd700000.pci: host bridge /pci@0 ranges:
[  233.446287] pci-host-generic fd700000.pci:   MEM 0xfd800000..0xfd807fff -> 0xfd800000
[  233.454232] pci-host-generic fd700000.pci: ECAM at [mem 0xfd700000-0xfd7fffff] for [bus 00]
[  233.468784] pci-host-generic fd700000.pci: PCI host bridge to bus 0001:00
[  233.475634] pci_bus 0001:00: root bus resource [bus 00]
[  233.480893] pci_bus 0001:00: root bus resource [mem 0xfd800000-0xfd807fff]
[  233.487822] pci 0001:00:00.0: [110a:4106] type 00 class 0xff0000
[  233.493874] pci 0001:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  233.500177] pci 0001:00:00.0: reg 0x14: [mem 0x00000000-0x000001ff]
[  233.506867] pci 0001:00:01.0: [110a:4106] type 00 class 0xff0001
[  233.512941] pci 0001:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  233.519246] pci 0001:00:01.0: reg 0x14: [mem 0x00000000-0x000001ff]
[  233.526524] pci 0001:00:0c.0: [110a:4106] type 00 class 0xffc002
[  233.532596] pci 0001:00:0c.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  233.538916] pci 0001:00:0c.0: reg 0x14: [mem 0x00000000-0x000001ff]
[  233.545591] pci 0001:00:0d.0: [110a:4106] type 00 class 0xffc003
[  233.551680] pci 0001:00:0d.0: reg 0x10: [mem 0x00000000-0x00000fff]
[  233.557990] pci 0001:00:0d.0: reg 0x14: [mem 0x00000000-0x000001ff]
[  233.565712] pci 0001:00:00.0: BAR 0: assigned [mem 0xfd800000-0xfd800fff]
[  233.572540] pci 0001:00:01.0: BAR 0: assigned [mem 0xfd801000-0xfd801fff]
[  233.579371] pci 0001:00:0c.0: BAR 0: assigned [mem 0xfd802000-0xfd802fff]
[  233.586199] pci 0001:00:0d.0: BAR 0: assigned [mem 0xfd803000-0xfd803fff]
[  233.593027] pci 0001:00:00.0: BAR 1: assigned [mem 0xfd804000-0xfd8041ff]
[  233.599851] pci 0001:00:01.0: BAR 1: assigned [mem 0xfd804200-0xfd8043ff]
[  233.606669] pci 0001:00:0c.0: BAR 1: assigned [mem 0xfd804400-0xfd8045ff]
[  233.613485] pci 0001:00:0d.0: BAR 1: assigned [mem 0xfd804600-0xfd8047ff]
[  233.620479] uio_ivshmem 0001:00:00.0: enabling device (0000 -> 0002)
[  233.626917] uio_ivshmem 0001:00:00.0: state_table at 0x00000000fd9f0000, size 0x0000000000001000
[  233.635758] uio_ivshmem 0001:00:00.0: rw_section at 0x00000000fd9f1000, size 0x0000000000009000
[  233.644495] uio_ivshmem 0001:00:00.0: input_sections at 0x00000000fd9fa000, size 0x0000000000006000
[  233.653564] uio_ivshmem 0001:00:00.0: output_section at 0x00000000fd9fa000, size 0x0000000000002000
[  233.662693] uio_ivshmem: probe of 0001:00:00.0 failed with error -28
[  233.669234] ivshmem-net 0001:00:01.0: enabling device (0000 -> 0002)
[  233.675674] ivshmem-net 0001:00:01.0: TX memory at 0x00000000fda01000, size 0x000000000007f000
[  233.684333] ivshmem-net 0001:00:01.0: RX memory at 0x00000000fda80000, size 0x000000000007f000
[  233.756986] ivshmem-net: probe of 0001:00:01.0 failed with error -28

Thanks,
Peng.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760E09A5E40B4818663E07D88CE0%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
