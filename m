Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB7WJ6P4QKGQEZUUT2KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0F249854
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 10:38:22 +0200 (CEST)
Received: by mail-ej1-x63b.google.com with SMTP id bx27sf8053222ejc.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 01:38:22 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597826302; cv=pass;
        d=google.com; s=arc-20160816;
        b=vatLbyMbb/O5Qr0rjSx88PvOvH80QrohFS+tdp2kGr7B6JHEXv1XROaKi91D2QkpnX
         HHthJOBPBk+XNwVoyh330YAdc/Zjjq1uMroBkHCohdNv8lEZWCC70gp5X28ojEaXHAxw
         mUVS5VHbSHyp0sAUAKmEYDcD7BcMZ3O8L8ixAP2jJoK2A/+9goIhAkq4gUJDTJnlf5LU
         r7fmuWt8/HYdHl5hY7ppvHamDTkvcj7xv9ceDkOBCjgRICbbTYEXjgopHrKY3fT6wMT4
         2Rhhg+iX4o3A/M8yux/wCbN4JfRIjiV7azbZxD1xXZkoqs35vz9zZZ554pOU3tvxBxEq
         kgpg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=L6NqABdrZ1NYyHOoWzESADkLOlwjfGxdiSIdUyJjVEQ=;
        b=lML8PqxxenBcjzgQBKpMwFc70RkHQax+9RvxNVfb495dqmw5fXiNR1Vo28cUSbU21/
         5vIShDgbqqUQZdTWPLHOJwy2ftGdp8GXWiDqvXzXC1TBuSq6wYbYD7GditTZIqI7Kffc
         1rH/ZEPy+NqkR9k3CxNXhzfbRMxC0w+5b7p7EpGmkkhgJ55IRrUmtcJuFejTnb/53uAU
         JF6FwwS1MfoG3nfRz4eUMG94rs1DbN14UN3LtD5LHqbp8t6mG5Sgi7Irh5nXCq3eI/Ur
         Hd/eM3k8toBIIUpWMOSVT5FjLsOXKRSY/KUPwPtNiTWzwvMcVbyirtKUJtBJHK+7oNYa
         fMbw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lIttE+pH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=L6NqABdrZ1NYyHOoWzESADkLOlwjfGxdiSIdUyJjVEQ=;
        b=CJBoGhK25/JDFT/nbnhUApS1ohNSQ3I6DtzdsmgB7VdZmXTNJNr+WL5RfdSLnn9a1n
         2TjlecGueUlpq9p/VZaP0QP2JT39ZfHfuHiSrFvUJAOo8spjGk86/lAiDi8oVKb4RLB1
         dwdDQpDDxnfNsx5zHQZn+CF/FQR3VKbKzfTJTVXmyLA4wIbj4rw0Ww5tt1V5V0NAAEIC
         lM7T7ce1khqh3yiBwzhc+VHMaKOLD2eErwc1vv5Lq4sHgQQ4J2IB/fjSdJWP0h6x+3xi
         z6ga+nGPyjepKOgnID3hZvL4pKXYMiNMYR5tREbM3PzP4nG+Fk6LdeB8qZVSxcol/0XE
         9Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L6NqABdrZ1NYyHOoWzESADkLOlwjfGxdiSIdUyJjVEQ=;
        b=XfJeBFkJ6Iv6g1024TqJIcsPbUug314nlHEqkE5oIJGEvG1SOPcAttOT3s/pkape/O
         YpqlimNDWbTgDr5FlPCvLp0a67BOvRwjdN/xp9m75RjPG1cniU+5UE4xJ0dAMCb4xd+W
         FWQrffLTEPlASo1N2bcMq/k4F38ZtuvbTbUeuMmGHGs51gC3+EOBtNvhpZNWZX0Ik0am
         mV0Z1VVE8jjtNLC/ey5iI31Oc8GQvh4P65TmnT9qYDikItSWTndaQoKEHVYKGw4m1qkm
         H2Ku85N1ElYVSMH8tPLkt6kmSppnZItCffiMJHoaSBWz+pKAWwLGh3sxL+5HuIgVIHcn
         ZYHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531kRTIX5Ef8ZNq5c6opI5mnTBeXqO+1JmGf510PncJOU/KKpHSG
	nwbEcjUAlsrEdBgySTqjSi4=
X-Google-Smtp-Source: ABdhPJy05EdfppLvn6cP+NAvoiSD0cROuhxybKVUtdZwQoXx/sdkUF+EjOne+YnDCtfqDCv0yKxQAg==
X-Received: by 2002:a05:6402:1427:: with SMTP id c7mr24414453edx.245.1597826302633;
        Wed, 19 Aug 2020 01:38:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c40c:: with SMTP id j12ls125538edq.2.gmail; Wed, 19 Aug
 2020 01:38:21 -0700 (PDT)
X-Received: by 2002:aa7:d1cc:: with SMTP id g12mr24263461edp.385.1597826301832;
        Wed, 19 Aug 2020 01:38:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597826301; cv=pass;
        d=google.com; s=arc-20160816;
        b=OAHqF+xjIdMMxK7YCJtAqpyxCT+wC5zNZEEPDqoU6bkJyGTDL35L094VZMcpIFaLV0
         jrjVpwZfLO9sA9nCMdsBGaA9/ci+nvxUWSM4ifshfGIlTME/yeBI5Ka8aGohNXmvtjJE
         T/kvK6LN5RAbrQwX1SN51/CXXMZ4BcmgQQHsrRHw8jpg7ixXHoCuDPV7zO4IJUqk0L14
         iJtfcUU1c0h4Sgt00yLF9V8KKleOKu3BP3rVDRNB5cgMlBpuLekUxMM7l/0vyzjaOEtP
         JRsTJ6rWXACyLTYyUnGXGBOUxvjC1QbCpmMuPTmarjv4zQcL3IOy/xCq1sw+3UKtnoSC
         a2oQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FKPaWXIV47ou5VG2gkRE0LLKZL3NVP3G120gg1dfsWs=;
        b=uE/2a9qwRlnFrMajZMx1tdrNTwG6xf7VhZva2u1cU+y8WC+EjZNtjJ7jBwgjhUgI+O
         zScOoSh7kJFlp08cnc8Y1IO8tHA6vT2ru8+cgSKLyXxMvEiCQKzO38waWZ2uKSQ4Au/+
         9lRi0vAXVQT1dbv2ohNXJ+mYg7vYLJTGO0EWgsZWMZ/lg/MybGT60ir+QJdNtzhdp0Mx
         gzkAw6LWkW3Aeiikmbd0XVEO+kTOPZXJ7ZvMNdMe4DqGMtEkA0peb3VBV1ofHjkGenqi
         oJoQUj1U1KXnhoTIHet5dBhF2YZlQzhA/vMhKheQokXERY0cX9IiPJMV8olxIK2jJFJB
         L2xg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=lIttE+pH;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com. [40.107.20.89])
        by gmr-mx.google.com with ESMTPS id q14si704464ejo.0.2020.08.19.01.38.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 01:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.89 as permitted sender) client-ip=40.107.20.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSVxYxyge32vffI43t3aLRD8ML8KiiCAQwlH9ZpiZb0dzucMcUo4NFnh5mn7YGpyGqrS1VFbFSGFcpCNTJ7JfNxWdOH2H8zWsiyT3umBqbWKsABbZ1uJ2bF04KKUSO7+tUDxc8UZntHl93gr9CZCmULV94IpHKK3Id5oJG0TN9A0pNhijMfiiRJANBO7WXjVJdxeHF/haqDEcxcHyv+8EDbMaiXhYl9Y94geMWBf+CMfnv+ig/FxhCdXRIBq4h0YyTksd99RGLG2uGwO1scepLm4VGEZRi87Gx38w5wo5njMvRJ1kh7RhTdZoMhtoQMVKNUg08q/aLj71tKLEzgbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKPaWXIV47ou5VG2gkRE0LLKZL3NVP3G120gg1dfsWs=;
 b=eXY/b715qV0b2kRjLCOICnKZkLx6hHY1mF6emjLtSyBFHu3+lYrkQtWKN6R/KcTmvrxzLV8DgcCWndo4P5ELIC0AVZHFyTW4o1jkSvhj+P64WU6vKmjJzNgfdGNnk8Y6BsG+XQkjJlCrFyxIQXT34cbX5jXcMy8OyZruvdDU0UqZXh3HxhBtbCcRN6w3Uf6m+O9vhKF+hn+K11hnig9DLFH+fIHn4Jk401bA/XZNXFZlWBfMviWptHHWXTMhn5nH3rfwVwqm8kWDJIiEKMT/NG0ZvTU8VQyA4849NbEGHu8EuKLgaiE7zsi+mXvVIbRy4OYPohGDZZp80W/sUJXYDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Wed, 19 Aug
 2020 08:38:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Wed, 19 Aug
 2020 08:38:20 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] arm64: mitigate Straight-line Speculation
Date: Wed, 19 Aug 2020 17:03:50 +0800
Message-Id: <20200819090350.22368-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0104.apcprd06.prod.outlook.com
 (2603:1096:3:14::30) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0104.apcprd06.prod.outlook.com (2603:1096:3:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Wed, 19 Aug 2020 08:38:18 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d3a3efdc-5d18-4a0a-8495-08d8441b39ed
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB408998DFEFCBA8CA88E20733885D0@DB7PR04MB4089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SpGbuMnWZb0/DinVVyDAu81e7xxXgfWspDGMC1bfjWlnQn/ifHljRYS+t2plTQYu21COQTAhl3XIpDFE6Rn3i4E1wCLNM5Hiae5foetY50W11BRxsgYZnofFcKLTuoFtX/00Hzb5IpTot+zlyZw9Pzx+WAqVuIhPNST47paRxX3U0l0s9cHHMP3GWhrdNycBR0i+nLRNkinnHkFd8Mw7Q7bmOvczKEXEcdB1vsd6zSap1S0STt3b1slzGKMYCnd0dSkdhVwLdbiWM7Vza0TwClrevE8aqoQAQWtWw4gelbQRKBkHZF1IUo9iSeEkPmREsuCHUSOH87rfeHlTrVud/EJ+EooRAojDzo+I2f+RebgqyxsVrrDBMQfKrUSxmXLITEv5BrVPxVQfF+lrPXFs/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(66476007)(26005)(6486002)(66556008)(83380400001)(52116002)(9686003)(6512007)(36756003)(6916009)(16526019)(186003)(5660300002)(8676002)(316002)(66946007)(86362001)(966005)(4326008)(2616005)(956004)(478600001)(6666004)(2906002)(1076003)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MNpAfik9Q4Ydc57QcADqkYwxkNBg3fcsjy7JuEPleVyUxJXClj+1Uj1Gpo2+tiPGwebEkik+GqmH8iZX+Wzl+kQuaLS4oKc6PkZtLVlzo9s7CWZGer6n3NMEq945ACHDqnBSvZp/4z9wdXqjJzavxD22OfqNA2YjZHohwA+9QTKqnPgWEyGi2rpjoGoQTWr5rcIiHN8mZtw8jzmmONKHdMZB0D/hxeq3BQgTW60X38elnvhw3K5i2rnMbjRUN5o+68NxBAFJR+jTAXDCJx77YoaT7aPweIxg+QYk8N0JVnd5NvswF3CGo2CvuD+UoVgyjPGpX1R4frunVCBP16L/YJVS2BZlOw7k/t38MT2y82MwSyszG6jqVzXuUQ5I0baSIRDZ234il6Wl5dDp+bm8TGe7PZ9vax+jSmsQgtl2YOE84CnoT0R5zNqz+dMPAVNE9R/kS8QAvNmfkWqn05xnBJg26CK5jeA8bdrLs8y4MCEF7gAu4/49BsfzCCM3FSI93VTOGdHTYc39iGbWb9WD6ydkoA3XJ73+RRFYzqZ3yMzbGRHLY9SUlsQ0CTs+tMRqUTHHPr7uEr5mae1n5pVFf2nBwlYqcO1dqP/W0nZLB1Kw4HcMtGWJzfWUhfEZ6AgaMpmjrZFR6UmF1m2hEdBUuQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a3efdc-5d18-4a0a-8495-08d8441b39ed
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 08:38:20.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6FGol6B4lWOhEr2Njt+iUZ2doEhcnUqXJILP1slF6T/b4VRLXVFBXge1BiU/e+1TOwXPS20SS3nUXJIxTVA3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=lIttE+pH;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

From Linux Kernel
commit 679db70801da ("arm64: entry: Place an SB sequence following an ERET instruction")
"
Some CPUs can speculate past an ERET instruction and potentially perform
speculative accesses to memory before processing the exception return.
Since the register state is often controlled by a lower privilege level
at the point of an ERET, this could potentially be used as part of a
side-channel attack.
"

Use Speculation barrier sequences:
 - SB
 - DSB followed by ISB

Since we not have ARMv8.5 with SB extension hardware, so only
use the 2nd approach now.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

Take from OP-TEE commit: abfd092aa19f9c025
"
It was fixed by Linux [1], FreeBSD [2] and OpenBSD [3]. The misbehavior
is demonstrated in [4] and [5].

Link: [1] torvalds/linux@679db70
Link: [2] freebsd/freebsd@29fb48a
Link: [3] openbsd/src@3a08873
Link: [4] https://github.com/google/safeside/blob/master/demos/eret_hvc_smc_wrapper.cc
Link: [5] https://github.com/google/safeside/blob/master/kernel_modules/kmod_eret_hvc_smc/eret_hvc_smc_module.c
"

 hypervisor/arch/arm64/entry.S | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index 27e148c6..1b6fa696 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -378,6 +378,14 @@ el1_trap:
 	ldr	x4, [sp, #(2 * 16 + 1 * 8)]
 	add	sp, sp, #(16 * 16)
 	eret
+	/*
+	 * Mitigate Straight-line Speculation.
+	 * Guard against Speculating past an ERET instruction and
+	 * potentially perform speculative accesses to memory before
+	 * processing the exception return
+	 */
+	dsb nsh
+	isb
 .endm
 
 /*
@@ -522,4 +530,12 @@ __vmreturn:
 	ldr	    x0, [sp, #(1 * 8)]
 	add	sp, sp, #(16 * 16)
 	eret
+	/*
+	 * Mitigate Straight-line Speculation.
+	 * Guard against Speculating past an ERET instruction and
+	 * potentially perform speculative accesses to memory before
+	 * processing the exception return
+	 */
+	dsb nsh
+	isb
 	.popsection
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200819090350.22368-1-peng.fan%40nxp.com.
