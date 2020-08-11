Return-Path: <jailhouse-dev+bncBDEN32754MOBBLOZYT4QKGQE7IBYPDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id C36A924051B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 13:17:01 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id i15sf2650099wmb.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Aug 2020 04:17:01 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597058221; cv=pass;
        d=google.com; s=arc-20160816;
        b=AJdc+Hl3yd4RLDEmoG5LVv2Gds/vuY3jLBBuILMVwRXenlTKyxGfmg8J7wKaV6zYF1
         5KRHpeAzXRGDDhLbOUaoXxes7JM32LKdZknay5/bnaUbB5brnzvmnUFQtAmqPZ8h6/v7
         rcPKFFkVbF7aWhG+f/jjUb3vWphiDQfiuDyvhyBI0mbK1ULaIZETnEASTK2h2Psd+GQV
         jELa8DWRC0LK7Xjlztb6IDOhdRxQGja4JPIYhTBPfe8CipPykeCKJjGmC13Fnwc7UT09
         jfDOViETI5SPEIveBmdTD2ISYB0rgBPHEBnbdnJmh02yvAX4uJZiufPs+lez+OwlxvfI
         NTLQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=u6tzVWZjlmmwkQjCWkr0pDLa6RfZJ4h0L4aBuAWJZX4=;
        b=S9QwBRLFSiVRLVd77lWRabmG73InkK1tJyoo734LsWezERUtqAYB/s7am0NIZ+YW1Q
         YGPoMg4FLB2NU4Ff+/OEiPKy7YZk8VRvi9+G7PjpcAPTli6/zu/Gx9PdiXXuRMX/Jjw2
         vocoJcuFVxa2VznBclcTHKlLTeDatBPtQ7Y72Tt9J8AD6k+lyEClldQNO+MM5Np1IW2E
         u9C/96Y+bv7wVr+uctYk6lrm40ow4hf3zgvjVfFwQJhK7I5qY/9CHP+qrPDedjC0gno1
         hvYuI484pw3bk6pmlDMoMNCZD01lXPV4Mpot/EASga6Tpt94IXBMFcjXKUR1k8NS171J
         J8Mw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=j1QQYBNC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::605 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u6tzVWZjlmmwkQjCWkr0pDLa6RfZJ4h0L4aBuAWJZX4=;
        b=kJ+LDwM+2YUprZCGPVaoxAYGqMiiXF7WDdl/pH2bdjSQePh9x1htTzk9OxYQKk3Sm4
         mnx6dKl4FGrzgiMlraYn2sebieqD1zrJiOnK6O+B7RcNy40VwtCYQ+UxGULwQ5B/ymaO
         5ZtUgvpuZH0Gxx6pyOF+LV3msyUM4KR73EqnVXTW8eqJOZvbWjO86IdGOEuG7mGoXWoL
         JWgF4QshKmkYdyiawWEcjGTrK8An1kftIxb4vOuFfmcEGNfElQMBrvjf6nMLXzykAssh
         kwWIdFoZE6xAFEMty/gmiOiUsX+S5loJf2XT5ovgSGEy3ryv+TCsNvMrplhJpI4/kyHW
         e0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u6tzVWZjlmmwkQjCWkr0pDLa6RfZJ4h0L4aBuAWJZX4=;
        b=HlpGW7CaAhwjFhnUrPxKBQhxBCv2nXXC+dw9qGAcPD2A1883XP9ngLItoLADc0LPx7
         8k7ouVYFCtVTfmU2d2FSmp81EFF1zfLJbH/8Xt4ossWcTUNHDvOI7Ac+QKFzGfRGz9ry
         QOwZo2obZ8LKtUGjFlFDxIKL7qD6QeyPhe1J/FOi3CnRxm46XoAt+6rWgHLngUzfxzlE
         7TARCb5qDYCT4o/0I2WnfEvdAHI42ApRWaWePGBoocJmuX94CjKqbaQgy0/R3WaSKH6/
         74DdaeDmqBrG5PjhdaMgy6sBh7Jse3+gj4veskPMJSXa8coA32zoIctIwBX2J6s6701P
         8Wxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531mfDkXhM3YSRiw4z4p5ywkh3JNakqAWyCQO/SoyjWLZVrAAR+8
	LshSFqurhJgMH9YUmdHOyUc=
X-Google-Smtp-Source: ABdhPJxfhM5kR6fSfaL3q1ajg5ddZRkVi5fFzG+nZHfOqpduzF9jLoDLHvTEnarKjb/JXbotbHWA/g==
X-Received: by 2002:adf:e712:: with SMTP id c18mr25310259wrm.92.1597058221489;
        Mon, 10 Aug 2020 04:17:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e78f:: with SMTP id n15ls209557wrm.1.gmail; Mon, 10 Aug
 2020 04:17:00 -0700 (PDT)
X-Received: by 2002:adf:9526:: with SMTP id 35mr25632316wrs.326.1597058220868;
        Mon, 10 Aug 2020 04:17:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597058220; cv=pass;
        d=google.com; s=arc-20160816;
        b=PgAjjzvikhOkTHUrl+JJULBH1KzEy2JU5qWh1oHkkfcYAN4f31oDPEamhfCZ7NSFc6
         KI7Wlo9zvCi4/4xFtCdv1wamH3B9jWRZKEPK3t+2OLN0s4eg7j9hPPiKtgzrmq8HlG5S
         4X+UdK8fwC631eKZmZjyU1+e0JMTXoukUU4qNdZUF7KJwXQz4BVVcUqQWDvRW2FDBvzo
         MJlbTx2lUuWs9XCDeRF3kEHUcn1NtoCFMl20TrUJynTRaNPPdqYD7PixcRC4BnmpP5SV
         iQDtc0uLwtv3Eq30OA8odN86TVKbBZYlUwZ2zp83jRvVLMh+da57qAGs+Z3UpQDGj52u
         rz9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yvk8YrXczxA+gLPnlyeYDxhvabzekQ16mI7fQfu46EM=;
        b=xz8mTea/gyQ0Aab4PeIlKNz0LC9STxuW5SNNnmAOqMK1uwDakT1KSN55DlfGfTCwos
         L2pU+3sLk7DZRNYjEZgSg2/VDjpddSMwxDZ3MFqygFcRBIu/Vogbt//qbRlGfXGiNpQZ
         n53cLhBinyitKImZnYNJOc2di5vbjVnyzxcCGFY/lngdRVYCYrGqGW8voJrlBOVDvKFQ
         fxftV3b/DEoZnjKVQNSfy0GB6BVa7FHyJZndTPveuWYjbxwArf3mK0ALD+97yGhKZBeF
         LI6VHQIyG51cQ7s49zVPdAt366tLmy93ZwPjKs4RGLTKf4yaBsLSjcd6RX1EV97JO4Ho
         acuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=j1QQYBNC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::605 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0605.outbound.protection.outlook.com. [2a01:111:f400:fe0e::605])
        by gmr-mx.google.com with ESMTPS id m3si906061wme.0.2020.08.10.04.17.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 04:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 2a01:111:f400:fe0e::605 as permitted sender) client-ip=2a01:111:f400:fe0e::605;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBV9YI6H1HnAx6BuKu5aBiqUcofGMVnif3bFFXVhEtUI5rUdmK5qQFlQpT1zUZw7cNFXUqHNnhvI8ORp/VDYmwyH78hddU41Niw7wyidN1M1ZT5Eay/ih0yuQ27riGytTdmkrgvqL7bVqf3CgEXni1FpR7M88fI31NOZU/8C0jx9IjC8qP2JYvhQ0n/auOlK2uvfak/+ZAGYhkM+06zjofknRG+FD37x47cYndjk5840DObHZnVVPGVcPIE3jPkr0epydgNORpAp2gPyHIZL8v/mLDTQzBy4Y6mbp04UNbhaT1eXpVTadc7VXL1jR/R1CASqkGxYh4QcFz4p2+F5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvk8YrXczxA+gLPnlyeYDxhvabzekQ16mI7fQfu46EM=;
 b=W9Rq89yvncKhEkr5LBghuIh9x1liggIs5YiP/sLLejnE7l78t9rrMzS8o56Rxf0OFkreIvVQ81c/EmJz5ehKyfRtO6Sa/DMFRbTAx9zEIT3CJp+Qh+akxLSiAU8JiaJTYfsIlN3u8xexbsS3MVYNLTURtU+lywhgx+fEm7Cg39MsvvqW/NluT3m1C2y9kmn3oPwoYDBo81vSqwvE/H3lK5KmCvhI5AnMUQPdHTSvluhMSHEHmpBatwgyvpCnFfAR9wUZ8rmUKYU7ntjVISkyLOa/0F/CC1GVVTe2bmtzCiWHudSnIRYbe/mm0oPs9na7NiqWMSX3wBVaSj090o5hfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB5451.eurprd04.prod.outlook.com (2603:10a6:10:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Mon, 10 Aug
 2020 11:16:59 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8cf6:40ae:36ee:9b42%9]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 11:16:59 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 1/5] imx8: add lpuart support
Date: Wed, 12 Aug 2020 02:16:37 +0800
Message-Id: <20200811181641.7282-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.6 via Frontend Transport; Mon, 10 Aug 2020 11:16:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 340fb2ec-6aa4-44e7-9a0f-08d83d1ee5eb
X-MS-TrafficTypeDiagnostic: DB7PR04MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5451F86E67C6E9A34DB6B38DE2440@DB7PR04MB5451.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QaANFods/a9kS9U/M5dOO5ThnCSu7qsLyvWF0F5zKWZlbzPUVOAU+9xBVkN92wto78j7yan3iF7hMrXfX6nLFaFiMq7qIzT2Xu47S28rRJjrxGCWWzbxuchU3kOvWH01TZ6xAPHCM1XpvMPt1l2dAFP31Xf0Ttpz46dfRGPzmJZ4zmSaZdh/qcCPYGVl8eX836r/f6UdAcWHzL2p2VfjtpFcpL1NV/tgCsBlk+isiRGpWyYg05+tMPSAxnoca5PQ2QUdITCga3fW2zv7O8EH4Sn5aiO03EeosrLpFlOsYaJmMKrQvUgFAa0F6MMBSSgk+PlOmH1QPwaHNslpluq6JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(2906002)(956004)(6512007)(8676002)(52116002)(1076003)(8936002)(478600001)(44832011)(86362001)(5660300002)(66476007)(66556008)(2616005)(83380400001)(36756003)(4326008)(316002)(66946007)(6486002)(186003)(16526019)(26005)(6506007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 21QXepMsNrFB2X3Q3W5bnw05LtLKFbjAXFsiO6rT+DUETGx6CAMM6oYoUchW9fwn6dUwsHhNe2kY0s5eV/HdNWQhvpeNBA2YfsgnV9xDEvkOXasLoReJYCd+g7hBebkBPPCKKWhjzrOTs7pW2p2pYgiJVxOk6ZcjmmmPSaWde9Qtb717sRWxiD1hsvLrCcTXrGRVsV0T70s9YWiCQLYWQwM85K7C40GPf13xPTfSi8xso3dQjTkjnBmiyiIDwZ8+bUbsZvdf2TQMgzCJC/dwqSKWFixX6hjSTX3dNhiIiza/qWxJygCYP/KGuScJT17LSN0vZ7tYubjMxm1hRu+orQkDMrCy4AYIlHjNYJ/dONUwvmsPzp1rranvlTliL6niL5Rmf6xv13pCH0GV7wCPfz8ZDRaeRK3kBZ99kbNvyS9djlENBZq2+bR+VHDH0SKOYGmy6dLKO5pKUyb2ub4VgcHaVkEXBc4OLtRwN/FWT4/0NgP59AkhEqc81994Vy7r1SXyrciQxAGNW2CR6iHeQkFQpOx61uwBhLdVS1PdrV83R1nPReywQ8hb1Q/tjPOI45kZCNZySXVwkVHWdQTpYSRG/LtzPLdgaG11/EcJv3VcBsWyKI97jX+XY3mUzP7rTGy9EAfhXiz1hPlXP0LYfA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340fb2ec-6aa4-44e7-9a0f-08d83d1ee5eb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 11:16:59.0483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FNpONfW1vKJvy+cM1wvkHUPbM6agQR/feRfvrxn96XWr2XcNThBeclFl/pA2NYF2lLbRriRu0QUQJaBUd57nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5451
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=j1QQYBNC;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 2a01:111:f400:fe0e::605 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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

On i.MX8/8X family, there is only LPUART. So introduce lpuart support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 hypervisor/arch/arm-common/Kbuild             |  2 +-
 hypervisor/arch/arm-common/dbg-write.c        |  2 +
 hypervisor/arch/arm-common/include/asm/uart.h |  3 +-
 hypervisor/arch/arm-common/uart-imx-lpuart.c  | 38 ++++++++++++
 include/jailhouse/console.h                   |  1 +
 inmates/lib/arm-common/Makefile.lib           |  2 +-
 inmates/lib/arm-common/uart-imx-lpuart.c      | 58 +++++++++++++++++++
 inmates/lib/arm-common/uart.c                 |  2 +
 8 files changed, 105 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/uart-imx-lpuart.c
 create mode 100644 inmates/lib/arm-common/uart-imx-lpuart.c

diff --git a/hypervisor/arch/arm-common/Kbuild b/hypervisor/arch/arm-common/Kbuild
index 78b9e512..ab86eca6 100644
--- a/hypervisor/arch/arm-common/Kbuild
+++ b/hypervisor/arch/arm-common/Kbuild
@@ -16,7 +16,7 @@ ccflags-$(CONFIG_JAILHOUSE_GCOV) += -fprofile-arcs -ftest-coverage
 
 objs-y += dbg-write.o lib.o psci.o control.o paging.o mmu_cell.o setup.o
 objs-y += irqchip.o pci.o ivshmem.o uart-pl011.o uart-xuartps.o uart-mvebu.o
-objs-y += uart-hscif.o uart-scifa.o uart-imx.o
+objs-y += uart-hscif.o uart-scifa.o uart-imx.o uart-imx-lpuart.o
 objs-y += gic-v2.o gic-v3.o smccc.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/hypervisor/arch/arm-common/dbg-write.c b/hypervisor/arch/arm-common/dbg-write.c
index 64dfef20..d4cd4399 100644
--- a/hypervisor/arch/arm-common/dbg-write.c
+++ b/hypervisor/arch/arm-common/dbg-write.c
@@ -38,6 +38,8 @@ void arch_dbg_write_init(void)
 		uart = &uart_scifa_ops;
 	else if (con_type == JAILHOUSE_CON_TYPE_IMX)
 		uart = &uart_imx_ops;
+	else if (con_type == JAILHOUSE_CON_TYPE_IMX_LPUART)
+		uart = &uart_imx_lpuart_ops;
 
 	if (uart) {
 		uart->debug_console = &system_config->debug_console;
diff --git a/hypervisor/arch/arm-common/include/asm/uart.h b/hypervisor/arch/arm-common/include/asm/uart.h
index 9317446f..f620501d 100644
--- a/hypervisor/arch/arm-common/include/asm/uart.h
+++ b/hypervisor/arch/arm-common/include/asm/uart.h
@@ -11,4 +11,5 @@
  */
 
 extern struct uart_chip uart_pl011_ops, uart_xuartps_ops, uart_mvebu_ops,
-			uart_hscif_ops, uart_scifa_ops, uart_imx_ops;
+			uart_hscif_ops, uart_scifa_ops, uart_imx_ops,
+			uart_imx_lpuart_ops;
diff --git a/hypervisor/arch/arm-common/uart-imx-lpuart.c b/hypervisor/arch/arm-common/uart-imx-lpuart.c
new file mode 100644
index 00000000..29943de7
--- /dev/null
+++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,38 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright 2018 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/mmio.h>
+#include <jailhouse/uart.h>
+
+#define UART_DATA		0x1c
+#define UART_STAT		0x14
+#define STAT_TDRE		(1 << 23)
+
+static void uart_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_is_busy(struct uart_chip *chip)
+{
+	return !(mmio_read32(chip->virt_base + UART_STAT) & STAT_TDRE);
+}
+
+static void uart_write_char(struct uart_chip *chip, char c)
+{
+	mmio_write32(chip->virt_base + UART_DATA, c);
+}
+
+struct uart_chip uart_imx_lpuart_ops = {
+	.init = uart_init,
+	.is_busy = uart_is_busy,
+	.write_char = uart_write_char,
+};
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index a6efd37a..34dd7209 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -49,6 +49,7 @@
 #define JAILHOUSE_CON_TYPE_HSCIF	0x0006
 #define JAILHOUSE_CON_TYPE_SCIFA	0x0007
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
+#define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
diff --git a/inmates/lib/arm-common/Makefile.lib b/inmates/lib/arm-common/Makefile.lib
index 3d7b335d..c13696f3 100644
--- a/inmates/lib/arm-common/Makefile.lib
+++ b/inmates/lib/arm-common/Makefile.lib
@@ -40,7 +40,7 @@ objs-y := ../string.o ../cmdline.o ../setup.o ../alloc.o ../uart-8250.o
 objs-y += ../printk.o ../pci.o
 objs-y += printk.o gic.o mem.o pci.o timing.o setup.o uart.o
 objs-y += uart-xuartps.o uart-mvebu.o uart-hscif.o uart-scifa.o uart-imx.o
-objs-y += uart-pl011.o
+objs-y += uart-pl011.o uart-imx-lpuart.o
 objs-y += gic-v2.o gic-v3.o
 
 common-objs-y = $(addprefix ../arm-common/,$(objs-y))
diff --git a/inmates/lib/arm-common/uart-imx-lpuart.c b/inmates/lib/arm-common/uart-imx-lpuart.c
new file mode 100644
index 00000000..4e5d43ef
--- /dev/null
+++ b/inmates/lib/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2018 NXP
+ *
+ * Authors:
+ *  Peng Fan <peng.fan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+#include <uart.h>
+
+#define UART_DATA		0x1c
+#define UART_STAT		0x14
+#define STAT_TDRE		(1 << 23)
+
+static void uart_imx_lpuart_init(struct uart_chip *chip)
+{
+}
+
+static bool uart_imx_lpuart_is_busy(struct uart_chip *chip)
+{
+	return !(mmio_read32(chip->base + UART_STAT) & STAT_TDRE);
+}
+
+static void uart_imx_lpuart_write(struct uart_chip *chip, char c)
+{
+	mmio_write32(chip->base + UART_DATA, c);
+}
+
+DEFINE_UART(imx_lpuart, "IMX-LPUART", JAILHOUSE_CON_TYPE_IMX_LPUART);
diff --git a/inmates/lib/arm-common/uart.c b/inmates/lib/arm-common/uart.c
index 8855d476..90a322b5 100644
--- a/inmates/lib/arm-common/uart.c
+++ b/inmates/lib/arm-common/uart.c
@@ -42,6 +42,7 @@
 DECLARE_UART(8250);
 DECLARE_UART(hscif);
 DECLARE_UART(imx);
+DECLARE_UART(imx_lpuart);
 DECLARE_UART(mvebu);
 DECLARE_UART(pl011);
 DECLARE_UART(scifa);
@@ -51,6 +52,7 @@ struct uart_chip *uart_array[] = {
 	&UART_OPS_NAME(8250),
 	&UART_OPS_NAME(hscif),
 	&UART_OPS_NAME(imx),
+	&UART_OPS_NAME(imx_lpuart),
 	&UART_OPS_NAME(mvebu),
 	&UART_OPS_NAME(pl011),
 	&UART_OPS_NAME(scifa),
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200811181641.7282-1-alice.guo%40nxp.com.
