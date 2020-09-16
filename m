Return-Path: <jailhouse-dev+bncBDEN32754MOBBSMSQ75QKGQE45MMZRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1726BEE7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 10:14:01 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id j17sf900264lfm.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 01:14:01 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1600244041; cv=pass;
        d=google.com; s=arc-20160816;
        b=gpeAU1wlSPnOYDsJ3z0BAF9PPa89BGtsujf12Nu55s985lNbCM1k5CfpLvRy7lpR17
         e2bn5xmh3uTY6uYSi4dFGjhdqG1Oi8BtelW8c5+sV5pS4qoEs3n+uBWu6AZZZGfEzbNr
         g5SpBCVrfiXS1iDah3mu6Ln1pmb9scCIWyr6CGfMNOSi7Qm9RBylN+ZrPSvHM/PERak4
         Z1V4wsdrj3inVeuhDTACioNiaziJ6nQCZIn8plTN9N9o2yHnQ+3kmCQWj2ECoLTskJ4J
         zqFqLF0zNVZLny/+uFt4/ny/PZa3MP04TcuJDV57ort6dALymFoNxPVJuOaoMPoUBHM7
         q+Xw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vQSwOoQIINDPNxyy9/o0a0LczlHaCceTQfqL5LTIPqM=;
        b=tWBbISr1Hlz1j3SZedB2pMFHJutC/Gx/H7R5SOjQZJPbK6kso0qp8O+gcar9PCAQiK
         uq+xcuHB4y7ikl2YpEStjFqt5S1yM4NdBr1KT+8NgVE+Coa5XDxAlnvxbHi937LgxQeY
         LFsXzic1E0/E4KpBbc1P+UBcWfb3ulrIa3cQuvnGqANXF95VT8dg/pWxxOAYuOb2eO++
         bvgbmXHdA9ztJ1PHUgE+8kgEVsrsFAv5b3tZSWldWZCmMjhPD3rTs4q0T7LGlq38RTo4
         j1R8Ha7r93FwVPy+38u/JKn5OcRYS4o71FGEnYOI2Lrr98CnMfKEBzdpdOuiTMTSvh7u
         MoZA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=C6zCOmVY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vQSwOoQIINDPNxyy9/o0a0LczlHaCceTQfqL5LTIPqM=;
        b=bwSUr3W4w9wAUlemjqtI4Dh3Gy2a1DwEsqbxDC8uji6oUzt6eheGfy71Xm8j1MMsLs
         eQ85WJdLU5CxTp/Nf87I9LQahjLQZEcc5U9BenXdakS8F39hdPRiwPcAFzBAvOrwsekS
         v1yPCQDRRguqfBpok8seDLsJpwLEZqPPve6MrGbT1kTgN0GSRzLPaIMkayKmFwCL4SaD
         fHeRMWDjdDXWL8wbrRkHoLMjE7c1kIQnQ3KrtV33kV56c18o2Ra9LLtGOFce9YyQ7YNd
         mWxT4HiOROeOtUp61tTED0Kg2lVXWSNkUWIYyZTPvjpXJ/OjQn0NPy7I46waWitfcEV7
         /Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vQSwOoQIINDPNxyy9/o0a0LczlHaCceTQfqL5LTIPqM=;
        b=UaXAcCvb/Yk/+Jzs8KRpLBPp0y0s2p/HVOAJipVomIp4+C7kiunsr8L7RUQ+LBKbft
         sdYPQnDI+U0WO6jokitbeOGIOXvKUksUhCmM0vqZwgFfL/5GAxZWPeQsZ5iUwCtGNsFU
         kWIO17l+sahhDpyiGuYNqz8SNt/e3yGY7/lSn6Iz4Qhib+szJJFdiMDFJGn1WDYRKCf1
         vKcOXjjlyjojNUCAGrYwl0BlcCVGOmiIzvrQkjcpOMt/qd140du+a0P8DT99D70MhlZf
         yOwhKWypGGEV9faOV6TJjbvx6EbTFU/bQOzsGyqxBnKAqQEBfGNYUAPFoie1qjw4hZy8
         i+lA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530QcUkqNWajtjzQX6PYzqowWr31Tqz9h5eXTNiaGv+P/PF5NP3J
	eoPE9kQ9iJj2grsTXL76Tyw=
X-Google-Smtp-Source: ABdhPJysmNxPMTYvjltgXt2dX6D6B8ypQL+T5MqmDgNYkifd/+1e581buVV8U2Xb/HThmExOukYQ7g==
X-Received: by 2002:a19:85c4:: with SMTP id h187mr4938525lfd.320.1600244041431;
        Wed, 16 Sep 2020 01:14:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c13:: with SMTP id j19ls163771lja.10.gmail; Wed, 16 Sep
 2020 01:14:00 -0700 (PDT)
X-Received: by 2002:a2e:907:: with SMTP id 7mr8655572ljj.470.1600244040250;
        Wed, 16 Sep 2020 01:14:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600244040; cv=pass;
        d=google.com; s=arc-20160816;
        b=xu/F0YaOlcnOSFA9QTma0rDtlI8aRVIJhOv5rNxdqWLXYMxw6REBYnF4bGA7/Elkcz
         e8ES4jsBEGv+a7LIf/dKrFyPrr2zkJEukt/SNF1HDQUiMgA48uPWOKismaUD73NsBzM/
         i8ZKk7CjSQ5Gqa8O1EpHZWWydPPYy7jxBNbhlVPAxb4GNfQ2J/mh8nY5oQbIat4h6rbT
         5XndEz65khHGyYvatcNoMicU4azlt2NJlDuVRj7YlPevjVCpvPGW+YTM+q3EoPs7Foti
         NS/Kl5gS2vtpeH70xB1VWCtLpUr4Iz8noaNHCvGZpEBX+qbK5w5OvqK19uNPnURxq/fh
         4ViQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9pyWfHnDbS0r1kABMsBc1IDCaxdLVhOEWXGomktUMSA=;
        b=I4z2LfMzMpe52J5nC4X96skz+s7c2wa+M8d5a8asdsTID9vgv0SNPLMx0mDk/e4d+D
         lw9HdZ7BX6LPme74PBxX8ZvoXZeKOhL1mNMtvUZmiW/uJQIUQcvvNNOcMsuUGYe5wIEB
         TyeZJqbgIakftDKVMQXhek/R8swqit28BYIQr4MXp2FAuM9xbzNgFmjVMSdQCUhFIDIQ
         jQZzVpHAAUAu3W9BfwOl3hC5+egbe1ZLDtpK3l7SbznZVkBJ0qtrS86FDaz1fnv9qRxy
         E/AZOL12Qi82li4+CZj8IEVw6nzzFsR5wOAsGQebmgCcLPISPiQbWLEuJpOaQjD0R2xC
         mYPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=C6zCOmVY;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130043.outbound.protection.outlook.com. [40.107.13.43])
        by gmr-mx.google.com with ESMTPS id r6si463983lji.4.2020.09.16.01.13.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2020 01:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.13.43 as permitted sender) client-ip=40.107.13.43;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OULjMsU1t1qBD+r4KWs67BcfF5QxXaNcqlJ2W5sNhWs2enLjW03Yf0d3nDUcGlnl7KDuTlJKC2mXFWCn6wGs//WD2A65K/DjUPBRavIgbkDBhxcDjSH8nrVt0YWJtChyQcsG8Lx+XFUneoaqo1vsnLIS//yuInxYeEVfo056ZbWnvn//CEcdlQBzESmgJyO3I/oXhi9Rz3ADGwZnTx13q2QlgG4USQJ38hXRZ7aIaOkAwTCcyKqZOJfdPtMHDhdu0nRxnq9r17lBBcc6/H+VDSjPFx+ECq5ZER24VaN6+aCwKsm+hT8MCrdC+EALa7NULu1yhAU5R5PpAkViLTlvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pyWfHnDbS0r1kABMsBc1IDCaxdLVhOEWXGomktUMSA=;
 b=PRyyDEgob7azY8bk2Gwr7G/cTWsyS4buOPHbmPosdL+AWid+Rwi+NzpIlyJWm5SxCpHbpWmA2YFaLyqOkB1x88wT6fzX43vGG53bttYKZSOMnJ6+NCTH2zI21Erxnm0Baq1elyrp5yaCmm8YCalJGOCye3Ll2dv3roVR+uteQO1XbZOrihYEJ5SZTtYuxdza0gl90v3ZQSBO4WiTEYCqD5qgmTHzJ7MMoRDXoSXIGR0pEyMp1lCTO80G1Rz9DDYX1AnP+ezCey6vQ/bdtGHmZ63hgZyWnnQjWJ80b2BpgcQX9VJA4zuiPfA1Deh99sjSu4LJPumC2o/c5TdOXaHovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5291.eurprd04.prod.outlook.com (2603:10a6:10:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 08:13:57 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::ed87:8435:3012:9618%9]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 08:13:57 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 5/5] configs: imx8qm: add configuration files
Date: Wed, 16 Sep 2020 16:12:53 +0800
Message-Id: <20200916081253.27536-5-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916081253.27536-1-alice.guo@nxp.com>
References: <20200916081253.27536-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25)
 To DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by AM3PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:207::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 08:13:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52406cd1-55ba-49c1-ce95-08d85a18756d
X-MS-TrafficTypeDiagnostic: DB7PR04MB5291:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5291EFCF164CD2A7D15E9B72E2210@DB7PR04MB5291.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XeuGjK/3p6CHU1wqZd+X9UHZVs2ZAtk7GEYGp9X9p220+5Wx6XSH2cOg9ZB4utea+1NIb+0rEDqle9v09qB9KP4npbVNeUWcpFU+bk/U5x8PqevzW4C+OIjyFTK1puozwqnh3eOc+T+/cp7sF6q06TIxxbtVvRFlGNbQD2uFpAxPfdc20IC8PrJjfRAywzv8MYGYW9/HKuo+m9lVKVvY19fDUH70eW6KNWTn0fEVdXsk68KFaII2Z5CE0JHNs9m4NTF09s/9v2hIZzAjUJGzsD1sL6JozlbMbT2dJkM7uwQDQoM/QWzhN84gvlEQ2nSstv/vyYXL7sK+BE7+ClFGJDKhUTDxeiYMcGHysR242fHfGPflla3pxiQZexcuiSp2APZvQeK0dDsH46fl9vhN3O+jMCbPCFi8MJIVySLkxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(2616005)(44832011)(66556008)(1076003)(66476007)(66946007)(86362001)(6486002)(83380400001)(5660300002)(2906002)(36756003)(6506007)(8676002)(26005)(30864003)(498600001)(6512007)(52116002)(186003)(16526019)(8936002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7wnaCFVr6vz1YY+gfyub4xwhx59wXL1Av0ijHsGhGsHWsAFReCJyLoGqcCh1ebXj72nAiDof1xtvvk+fXEZYHnYUo1yvT7HKk5Z8VztTAd2BKgBGH/V+l9HHcDWJgF95NcSrBHp/WNbbqXwjk9FUqfvgBPmENH7fC2JMHOzc6Wr+RalnthDdqu1YBsF0EmLlUt0q3f9h/4drsk7ceia3BeXXk7YHG8AwQyJoHuU6ZFFDbISoiS0Hqwn02hGdAFiwHtXSLNSTdATmDjzcH8lvJ1pFv8m6JEwtOTtKuq+bESxi56zZG80WNMIT0jFlBbDaWlK52MITfdKm+E/aYDVEUadPy2Qb+SQGdTM14khintzDwaBl+/W9TpWIUF/0tNonmjSDWQIuWA13gUofYdIk7DHti2/uFaX1cQNBPVkIkuWBEwRXKamQoaUJPI2EtgKFSrYe9Pp15Xfz90hLkZVARtWWQpl+Bfw9lMU/VbFnjHl3ZXewJYp7qWUWQVTv4qxwWv91HLyJeJ7Sm3Xsws9jUni+KR9THwpq1cV9n2frmJ+WT8LMYL2cfc/RFOEedPPzuo5HYcoX2Z3XyNYc9AjGJkEVZOwVjYxM9M/MMddKuwFlu27j3QYVimRMxbv+WNNUcvVsRrtCj2SV2jbxvDXkYA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52406cd1-55ba-49c1-ce95-08d85a18756d
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:13:57.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqxLPOtdDUWmHRssbT44ntebwCbs6pb6okSp+khAtJI807ndK1PtqPHvqtCFbwlp6YYbzdzImKq21ZPX8B4NBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5291
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=C6zCOmVY;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.13.43 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

Add root cell and inmate cell configuration files for imx8qm.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8qm-ivshmem-demo.c | 124 ++++++++++++++++
 configs/arm64/imx8qm-linux-demo.c   | 199 ++++++++++++++++++++++++++
 configs/arm64/imx8qm.c              | 213 ++++++++++++++++++++++++++++
 3 files changed, 536 insertions(+)
 create mode 100644 configs/arm64/imx8qm-ivshmem-demo.c
 create mode 100644 configs/arm64/imx8qm-linux-demo.c
 create mode 100644 configs/arm64/imx8qm.c

diff --git a/configs/arm64/imx8qm-ivshmem-demo.c b/configs/arm64/imx8qm-ivshmem-demo.c
new file mode 100644
index 00000000..2bfe88d5
--- /dev/null
+++ b/configs/arm64/imx8qm-ivshmem-demo.c
@@ -0,0 +1,124 @@
+/*
+ * iMX8QM target - ivshmem-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "ivshmem-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 90, /* Not include 32 base */
+
+		.console = {
+			.address = 0x5a060000,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART1 */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: from Inmate memory of imx8qm.c */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 96,
+			.pin_bitmap = {
+				0x1 << (90 + 32 - 96) /* irq 122 */
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+};
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
new file mode 100644
index 00000000..f13ca7bc
--- /dev/null
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -0,0 +1,199 @@
+/*
+ * iMX8QM target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_irqchip irqchips[4];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "imx8qm-linux-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 124, /* Not include 32 base */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 1),
+		/* UART0 earlycon */ {
+			.phys_start = 0x5a060000,
+			.virt_start = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* UART2*/ {
+			.phys_start = 0x5a080000,
+			.virt_start = 0x5a080000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* UART2_LPCG*/ {
+			.phys_start = 0x5a480000,
+			.virt_start = 0x5a480000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0 */ {
+			.phys_start = 0x5b010000,
+			.virt_start = 0x5b010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* SHDC0_LPCG */ {
+			.phys_start = 0x5b200000,
+			.virt_start = 0x5b200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MU2 */ {
+			.phys_start = 0x5d1d0000,
+			.virt_start = 0x5d1d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Bottom at 4GB Space */ {
+			.phys_start = 0xfdb00000,
+			.virt_start = 0,
+			.size = 0x10000, /* 64KB */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* IVSHMEM */ {
+			.address = 0x51a00000,
+			.pin_base = 128,
+			.pin_bitmap = {
+				0xf << (124 + 32 - 128)
+			},
+		},
+		/* MU2_A */ {
+			.address = 0x51a00000,
+			.pin_base = 192,
+			.pin_bitmap = {
+				(1 << (178 + 32 - 192))
+			},
+		},
+		/* sdhc1 */ {
+			.address = 0x51a00000,
+			.pin_base = 256,
+			.pin_bitmap = {
+				(1 << (232 + 32 - 256))
+			},
+		},
+		/* lpuart2 */ {
+			.address = 0x51a00000,
+			.pin_base = 352,
+			.pin_bitmap = {
+				(1 << (347 + 32 - 352))
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		0x10,
+	},
+};
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
new file mode 100644
index 00000000..20451cf5
--- /dev/null
+++ b/configs/arm64/imx8qm.c
@@ -0,0 +1,213 @@
+/*
+ * i.MX8QM Target
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_irqchip irqchips[3];
+	struct jailhouse_pci_device pci_devices[2];
+	__u32 stream_ids[3];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfdc00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x5a060000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
+				 JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
+		},
+		.platform_info = {
+			/*
+			 * .pci_mmconfig_base is fixed; if you change it,
+			 * update the value in mach.h
+			 * (PCI_CFG_BASE) and regenerate the inmate library
+			 */
+			.pci_mmconfig_base = 0xfd700000,
+			.pci_mmconfig_end_bus = 0x0,
+			.pci_is_virtual = 1,
+			.pci_domain = 0,
+
+			.iommu_units = {
+				{
+					.type = JAILHOUSE_IOMMU_ARM_MMU500,
+					.base = 0x51400000,
+					.size = 0x40000,
+					.arm_sid_mask = 0x7f80,
+				},
+			},
+
+			.arm = {
+				.gic_version = 3,
+				.gicd_base = 0x51a00000,
+				.gicr_base = 0x51b00000,
+				.maintenance_irq = 25,
+			},
+		},
+
+		.root_cell = {
+			.name = "imx8qm",
+
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			/*
+			 * vpci_irq_base not include base 32
+			 */
+			.vpci_irq_base = 53,
+		},
+	},
+
+	.cpus = {
+		0x3f,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd900000,
+			.virt_start = 0xfd900000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd901000,
+			.virt_start = 0xfd901000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90a000,
+			.virt_start = 0xfd90a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0xfd90c000,
+			.virt_start = 0xfd90c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd90e000,
+			.virt_start = 0xfd90e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfda00000, 0),
+		/* MMIO (permissive): TODO: refine the map */ {
+			.phys_start = 0x00000000,
+			.virt_start = 0x00000000,
+			.size =	      0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+
+		/* RAM */ {
+			.phys_start = 0x80200000,
+			.virt_start = 0x80200000,
+			.size = 0x5f500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* Inmate memory */ {
+			.phys_start = 0xdf700000,
+			.virt_start = 0xdf700000,
+			.size = 0x1e000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* Loader */{
+			.phys_start = 0xfdb00000,
+			.virt_start = 0xfdb00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* OP-TEE reserved memory */{
+			.phys_start = 0xfe000000,
+			.virt_start = 0xfe000000,
+			.size = 0x2000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* RAM2 */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x100000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+		/* GIC */ {
+			.address = 0x51a00000,
+			.pin_base = 288,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 0000:00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 0000:00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+
+	.stream_ids = {
+		0x11, 0x12, 0x13,
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200916081253.27536-5-alice.guo%40nxp.com.
