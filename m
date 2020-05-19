Return-Path: <jailhouse-dev+bncBDEN32754MOBB35BRH3AKGQEMSDX6QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D11D7380
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 11:10:08 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id g26sf474450ljn.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 May 2020 02:10:08 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1589793008; cv=pass;
        d=google.com; s=arc-20160816;
        b=WP17dwB9osfE2W1EMYZx7o47Y3v6QgdHWvmmJ4FwL1+/eiOcb3wZv1DEtiHfBiGaZG
         XvHAV5vKVmohHsQjt/ff53xPt2TxjmMiidMqoxLhCpwkYoUXug3c1SkMtGNjL2zmkamL
         aooXRruUrBoko7GE1qjwjmQAsbaBv13tZr5efPYwCM+viMfEY0tcubr1JbE+w+6rRBqt
         GHDHO2RKTGx1npldSVOagfwIoAK7AlDrgQV7NYb9xSjacGzzg4Qqw5tfXVVj7Ekbqj5I
         zNnceXfwKrRwAfeFipJpImrea6R4ICw4S2quBunVQjoW5GErFu4rKMPKQJ5rxu+ptAnR
         oaBA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=CQeJDhwyXMXIdYWmkn3mZsQ7POsxjmFrGBSp4o+8l30=;
        b=UGAs89pE/OI2kTOkP2z0/nOU1ogyZAaXTVA/0jiP7dgs923kD5DIidp1HPCuo1e6jT
         eFmWtelhZkMbjw5TyvRh+/P6BaVhL0i75cd7P1KDgakECXjBeuZqGqKuvouae75QHono
         8TnQHAdTlWvTZewXO/zEYnsYfJRQIDAsB9dXq7V9xCAEMzAtID9s5Ehv2mZaF+kiHCTe
         8qmom5uR386Oe4cI8b0RW6WYasMYQYDHyEy6fufHQEkbMfle97MQEfSxRMdrd9S//u7L
         zCYQyT9OkoabnzxId30jcTD+MsRShNDZ7x/sjcGy31146zhC9eqhm33flMEtLgeufVTh
         lmVg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kXLYj+TP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.47 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CQeJDhwyXMXIdYWmkn3mZsQ7POsxjmFrGBSp4o+8l30=;
        b=CJC8LXlEYcZAcmoiB8ZOu2NPF+MJt3swZnev07UglQuFgvyXijxw6IgQUQTQ9FbjuR
         E/1RQVF2Hs8ul3alTplOTjSnVE2ySLMgsCQBvKKkDVsavFAanzHk4pTCRdQhDTaZHWiO
         6pHkSuIBVM9qQmWVO1e6L+BJs39PFbH3FJnZSbu/nzLCq1lLm3GQ3uR44uSYQEFi+QEO
         UyoF3+cCHk+aImuUmUroPpfQ2IsKdi9vSXwQ5lPpMWS12lEAh8zFaige4CeifO3Ws7Wv
         +JiHoEprek2g72H2PqInsDHhsv/7Mpb31C+bNLT49L2cXOO1zPreWx7ybLyfn4OeAHBx
         yt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CQeJDhwyXMXIdYWmkn3mZsQ7POsxjmFrGBSp4o+8l30=;
        b=OPfX3TAL5RU6fH6siVENNGFNaxXXwQ6josVMPPKjN5npyxcCxCX2h3H2WhSRLjk6XB
         uw6xYYWVxEmIrwv8iyc9PmHsicxoWHh4lnS3fxSQeIgdMBz2py/oulPtYq6H/PlfbtB3
         iP/oGTuRhhNHsmuY/WfVhjook8Q7O5erwcf7CaD9c6hocNrUrUG2i96F2udp7kIWVkh4
         d5YZeGyn3UJQIXWGx8nsfsh6XWGe9BM2vKPIuEz2O89Xa1l4ldZCq0V8tfdqw+lb2ANZ
         bBKV0l0yLZqNje6Sl8J8Yk0r6B/Ew4m7HSHRkLT/ivAeb+UGQPqhg8Ijf9gZBkI3ntF5
         Uv0g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qBULE0v7Ohq4r/VwlrZ3QRVXprfmqcQjopRqtdp7FY5irxS4i
	jA0Z70QsFDYqtSloe25gmjU=
X-Google-Smtp-Source: ABdhPJy7XvOEScQCA7fWzgw+czcNcxBWttdN104pBhIq9k0xfzoNi0BiVB06r4lqhUsVU0Wquaj3Yg==
X-Received: by 2002:ac2:599b:: with SMTP id w27mr10908996lfn.164.1589793008085;
        Mon, 18 May 2020 02:10:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:288:: with SMTP id b8ls1577351ljo.8.gmail; Mon, 18
 May 2020 02:10:07 -0700 (PDT)
X-Received: by 2002:a2e:b53b:: with SMTP id z27mr9813832ljm.114.1589793007384;
        Mon, 18 May 2020 02:10:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589793007; cv=pass;
        d=google.com; s=arc-20160816;
        b=GJU8ValrrIoIadMHPysZx1AR2zvj5MMf2zxDsmGwA4X7jTaHedSGH7zklAwKU/z4NG
         kwoEa4nhZgfMUXaM6Le7SaZZfqbS//zS8i0XeAtrmD5prOjh7pN3Gvk9RX3+CO/h31q8
         qZoQ9crcI1jMQ+pd8SLzfoLQtdX70N/Q55mcbusN1dozn7X/Mrvtmj+ti800SO+iGI3/
         y0X2wpIknUsNja/Cq6usOGGuXGXHJN/cWz/So1ETC7mRvtHz2YGvBmtoVgdUHEksS+nY
         NQwD1WvM/12M3xG3L4lqth/7H2YThByq0c0Chcq5SDSZEdcfC7pPyLIHySDsAw9HeWiw
         BQqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4nlrNjBSCmAfqJqNHKISVtJ+9Pd6Gu7gNZEgfIaPYhI=;
        b=leyxqRYqwECE0PzbZp7OuepS/zKtACS242hLSQWv3t0VxqaiCtl2DcJZsxYdKdDYgE
         yA3WEbNEthdpQfdmuoEpEF2cDdNCVASyIXGpFZjkVVCoPmlq4TBfK7XM80wiCtnK/8hn
         TQqGPEk2uRTb6ekBu68oiLf2U1WfmD2KrCoNIjxh9D/hQVYbO8hSGoaC1rZ+KB1PaS3R
         Q4XhxjCLBFyM8KxVkj/01e+15U46eHfJtLBFJGCOUQdBrunsvGDfeg9GDy/ANoxKBrBZ
         ntQbKzWsVY0KEtgYSBYrqA//gAX2QIsLSM3q1aVexK/iux8zb9VnzzlIozXhPIc+t1wT
         wJ7w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=kXLYj+TP;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.47 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50047.outbound.protection.outlook.com. [40.107.5.47])
        by gmr-mx.google.com with ESMTPS id c144si465178lfg.5.2020.05.18.02.10.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 02:10:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.5.47 as permitted sender) client-ip=40.107.5.47;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/pAYpOuPqImAjm8pNMojgk6GgZKsOvda53qbkntQecQ2oQ5a5k+ZZTNkky7ovSZPQ1egogg+5LO90PxFsNhs6XgK0t2zAMuH8nhWBrEIH33JAXZ+q5ahJakFvMzJVQI4AsPLH3VxLXClmLNgG4rBDWbpYhNGjaJjRkbMIBk4O2u9BY8kG3YQ4gvX5WDoRKQ9QIbkLyArdB4FJiJBDYiP1p8x97gzKATk5XoMqqnu3F9+c/Z2oi8EQsOTd8DiY5km02rEDeJq34mbpIlezlfv9gwNTzvVKxFclEFj/JKcYV2JdQh2AHyK9mDDk/dJ5IDGzSX1Kc584kaUKurE0SFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nlrNjBSCmAfqJqNHKISVtJ+9Pd6Gu7gNZEgfIaPYhI=;
 b=AM6/X7xqlctkBHRUeQw+QxWVSG1nqyxZbOgPYnsxEYMT0HbzM8vVr8s34wAmSb+0vbNhLmH7/jlIz534+UyoSONEXb0iqAVMobY2+bGJyciuzKmFE0/nFmwngLEF3UuUo5KLOHv1rzm87hSDOlFAr3vVP4bvyaObp8j0+1uNVLqnZoIt4MRdhT0QFXHsYtSwUdhAlE6yp2mcX6OVfBJz2IOi6RhYC7ZvKImKXY4mxUpwNu1XR1cVqUErUzYGZkIcTJnB8Qlwr6ihY3vLPXcH7DW0mjE0LIhFJTqezLiu/+IiRRmGVuMkH0/dDhy5ACzsCvJ/zgI4jNRJ4kcgXyQyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB8PR04MB6634.eurprd04.prod.outlook.com (2603:10a6:10:10e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 09:10:06 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::780f:6f6c:db24:2418%8]) with mapi id 15.20.3000.033; Mon, 18 May 2020
 09:10:06 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V1 1/2] imx8: add lpuart support
Date: Wed, 20 May 2020 00:10:13 +0800
Message-Id: <20200519161014.20147-1-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR02CA0100.apcprd02.prod.outlook.com (2603:1096:4:92::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 09:10:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dba74ec-4aef-428a-e00d-08d7fb0b4173
X-MS-TrafficTypeDiagnostic: DB8PR04MB6634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6634153FB21700B55EF000F4E2B80@DB8PR04MB6634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzoCb0N9Q5Oy8PxQ3S13zr4Uu3WAH+a7scXv3Au84e6vghdmsVFAcjB+r0rN7J47AMKXyxMgyF3lKLaV1UUNP89LaWCAjl53kvGqevlWksB/t2teup7jWUYXh6rxi0rXglfVzA7BZdv24o6EGvruCuE3E/9J6aDIzS5CFflQGp6u+LPxnwZmrFrqX8Y7jdaaYdd8MsPuePlbioMV/ruDzQ6VOKKt7GzdTpLtZF1BKcdEK6cBgxXkmjjOh6mazzpl1UC3qusf/NXQ002dcU8b/niaZ83xXeItpwD2EkYGJi5/9y7ETJRg6hHC30FG6fWzIBxAyOnxTQX5kxNs1RA383jw4fXa2i/5X7fc+MavtepuCMlUuyE3ZAh9ffH2UDF+ZGkkuxmPYlvqSa+IrK8SI9ClBoqmAwNeyShXRwLBS0nR4z1vuTNolZPCRgvs93+C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(8676002)(478600001)(2906002)(6486002)(956004)(36756003)(44832011)(6666004)(2616005)(8936002)(6506007)(16526019)(6916009)(66476007)(26005)(4326008)(5660300002)(66556008)(66946007)(6512007)(52116002)(1076003)(86362001)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Za0/VutbWrdVylzRlv8LWAHcWLmNUkbp75NyGS6aq4bBOhh3YH/0puPzWoSOSb4ZbLJs9JOit3+IlxH83G8EFAMn82O8E5iA8gDuNXNRC8enJ3isO/lShf6J1bvH7534Fez8oHQut9bBE3zyih/az5/AxzF+6Y4o8dQeXYg/yZeJ1SR2moA3JH8KgyeT2AzstmtIIt7fhNLoy5wmvzQxpqH0hCc+pb8iUcQnV/Fe0Jak6qxh7JVZNnV1dS8Chxc57g3U+gNikb7PPrPTu4B5bCszTWS4H0vKunfkE6OqWfDfEy/u3HDVuNrxH/ah3AdpZ+tn4/Rm0GqqA2uJAU4MZh0xNifY9BEKaIOCY7h9CkWaejUkhJWuHrmQl+j0L0JDqqMxCmueey5mjSjt63xeL01u5aS/atQvA5hdUsIey2aKIzNU0WG4pK1g7Pdp61RhnxprWNqUQAj5M5k8goO6D8MvituqUw7hrYFzU+G+BEk=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dba74ec-4aef-428a-e00d-08d7fb0b4173
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 09:10:05.9301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KhMg0/bMzTfr6BPAze2dxBPUrk1njGnfWxti55W4d1gN2XnMrTTOgYJjq5Jjm5238yAAdMLPQ8UlonxXMD9WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6634
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=kXLYj+TP;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.5.47 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
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
index 00000000..aa8a0897
--- /dev/null
+++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,38 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
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
index 00000000..bbbb53f2
--- /dev/null
+++ b/inmates/lib/arm-common/uart-imx-lpuart.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2020 NXP
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200519161014.20147-1-alice.guo%40nxp.com.
