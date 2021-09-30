Return-Path: <jailhouse-dev+bncBAABB3GC2WFAMGQECKSZM6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B441D3DD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 09:04:13 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 12-20020ac2484c000000b003fcb3298d00sf4668103lfy.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Sep 2021 00:04:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632985452; cv=pass;
        d=google.com; s=arc-20160816;
        b=PCSI4P9rfSryWyBYpHlkKBNEI4om2PGkdN51cuDxpuAKrPGQmLNNnVjxW3nULMiAq6
         pdyj1mAEk3wAQIWXDiKdI7H3HLF7/Of8cjLc0avuQyjpbFTBR7MHSTYa5uX+ukJxQNXJ
         TPdgaxIfMnYEkYgx6rWu9hsVdck0K+YOPgoXFoIUEseXxyLfn/rhNztw88i4QcvTuvR5
         w7VKVaLdCcX2Jpv8zcUuo77hE5DlbcUvcpTw5ReG8xvIIM8Z4C3axqCYiBndrLvTe4Vp
         dXN/kP32NGjn6LzvnxXAWaZO4O09Gt7pjg6rY4bQ5lDuV/I6Wh5RtH7bqnhw8O4EbuBk
         QiAA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=38HEiISmyZALVarSBvKK+7HNHInksv0Pa/dnJzNFmSg=;
        b=qd9q1YmUAZQ6RkNt2wVqvwKN9V/uSpSUfDkxR7J1/Htn7mOGTi1Xf+druqDiam9MWl
         sRM3ir5gMjyeeItu9yww4BMQreMneNhpkHmSMqtFg+NaN5yERdcFa1SmgEJnsUEwS37Q
         sNSVOpHR+McF8yUagQY3nq0D8e8/QPUDK4rocVhAeGIGVro6rSYxV8yCMi362qh7QQGr
         nT9/Xp4trMnqudis3Ek2PAI+tEmkrBtlEf5UlkGGNjI84/jHjmslXIi99b8EF8BxEzjS
         oLieC+gO8KmZXvNIcjmOT3oRUj1g6Riwbdav2+Ct8ZL+FvLb7ctncYfr6/+ZBhFg4JXv
         CAVA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=mAiQrNPr;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.14.85 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=38HEiISmyZALVarSBvKK+7HNHInksv0Pa/dnJzNFmSg=;
        b=YjDNqGA2PydLC2Mkrm+TJZy3Owu7FW9I/4evjGxARsR+RhtsIRyIjwFAXuWwzJ5uXQ
         7M4peDCVuOIxO25FTIXRdvlR0eOw7wGvwcwUBpqfP698Ryb3pgIlAFt4I2CHpGwkN1dk
         AziDAuz1wz8VMXu2Yvhj/yFZ5zC2nwURfMBhbPpA4lkYZ2NmXFfDa57HkA0Q0/iCHVNF
         weWcDsMoh5LnmadRTuxx7J+WlGbfVNlHwAXzYcI04vHb5y+i7FJfhpvjEkegdjZu0eI1
         SlzolgeBnJ7ROCr815CcrmnyWeCJ+7PSUPDOtxw+qiXO4vwZ8LLablA4iMvrAZ1J6tNT
         cuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=38HEiISmyZALVarSBvKK+7HNHInksv0Pa/dnJzNFmSg=;
        b=le8h2qSJES7+hmZwbAGcKz70re8+1ev/6Vysme6ISFCY53N4ZWrssYxKBNxyhF+rMt
         mjX7KxkA0+bme9F+Oi8yAoAp5Ou2CnEexRVfH1Nmsbax0mFctymSP/HIiDgVtrVP6TgO
         0oVY+Y+5JAFRfMNc0DylBZnqXwaj//0ZL+MSNFJlgRKiQEGhByjpK6DhxsUGVuoxcKB7
         PcINEZ/Qg5Fq8WCShmZpG4A9+vN7j1aDnZTEpPIJq1Fz68vcmnwPuDYjYWTX/AsqdYuf
         x7U1mRbzcZBudNQ1NLHQtK4XFy0iPBBVuZCT5KRGy/1OWwX4YJvDBPl8GDRGmDstV3IC
         BzBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531inl1gaHtGa5EAOVwYfv63/SnUJp2Okwz4cfTt1eXb9ODRb+t+
	b6E6ho+vt7Yvv4AQR4A7J3U=
X-Google-Smtp-Source: ABdhPJwL4QGklBeRqgdxN2IBSAObJSVioE/epG1kezkF8iCVlBHfM4V5qSYzlrOMVm5780I4HypTJw==
X-Received: by 2002:a2e:5359:: with SMTP id t25mr4290710ljd.18.1632985452560;
        Thu, 30 Sep 2021 00:04:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3a83:: with SMTP id q3ls1321879lfu.2.gmail; Thu, 30
 Sep 2021 00:04:11 -0700 (PDT)
X-Received: by 2002:a05:6512:3341:: with SMTP id y1mr4646203lfd.424.1632985451587;
        Thu, 30 Sep 2021 00:04:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632985451; cv=pass;
        d=google.com; s=arc-20160816;
        b=ynHHUf5zjPuwVR+oa81nYV7hQ/pAlnxEzJ/XqbixbmANVQdbjqzrUx0naT/LDKBwIP
         rm4ODseQE1Vg8IgZW2mo8rgrFTQfsH9Qa5/TEB3laIpCb8JcaqnAPySrnJ8SFzRW1zIE
         wvH681FZ9kLdktLgRvyQwF1K9uvDtK/f6i/Fb8zh9805b6NhHqEvyECbibTBgOwC+Kfw
         /azWmI+jtYSZPt3iIx9EZmK1aGp6oCpDqFiW23+EIJdY4/MGhl+fiaOcfa0wHpeszH0U
         4DOf/RgAfnfbh2Kuo9/5psd2IQ87Or3t63kkpN2Z7yWhJw1SwEsYs7sp/SV+YCz6Q2na
         WB4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MalUA7RsL+XNTZsbcJ+Og1Z6iIHiSGyQjhRWiA+QZ2Y=;
        b=weuXIce1qHlVfY2kno6eHl9OscfwqaAXOIr+OWRGk+CEAfV3B93Vy63EIFM8dtmMiX
         69o4oHpXFv1IJ6EKzvokhOWd7bCXWCtAHgus9h18oiq621g8p1J3SQUBecA2zi6lx0GW
         Rr0ghqKIKzNLTJnfZNaWyQWAbkbFLbIbogqnKkrMRxR/2fawNXNqpofwAn37TBz6wTso
         3hAze4EU1XDCOSRwPHkVaQ5lAOIQGVQo+VdgrNrGOfM8egs+fkDUa38MSZmEGZetSlcc
         wKWZcDAXBRGGqCm7NBm7Y4uVFhXZ0bJB769vzvYcEGwO0Xjx/BEBph1Pw1Y7lnMNWP2l
         LCdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=mAiQrNPr;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.14.85 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140085.outbound.protection.outlook.com. [40.107.14.85])
        by gmr-mx.google.com with ESMTPS id k8si94848ljq.8.2021.09.30.00.04.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Sep 2021 00:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.14.85 as permitted sender) client-ip=40.107.14.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee7y8buQx4/KVmZk9S46nB4K+NjVk33v5COm7Byq4IuzTSznjA771zC7DPhxXZ7tDzAMcXBDuhYthhq7c+Rh+bPgr5Yhbf7XpauRpg/9ZmC02NB7wgAH3Ty8RUe2GbLJLWhIYpWzUupbTeoFfyz3clKzwUrEcKziZxYy7wIFa0/8zFbiDJkMlANM2BpfjVOtyv99QautRZnlg5jACe0CUviEz4mlC+iwhy2H9mnQNLl0dqrV4emX7or7oTqLTfkIU9VS7NHDgu/Kns8co+5VUZpYygaDwDN/BtTUSMaPbURWPjEyz/TuMni1uJHFvvf6mEaFHWqdp8hnov1QKlKCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MalUA7RsL+XNTZsbcJ+Og1Z6iIHiSGyQjhRWiA+QZ2Y=;
 b=Gfvy3Gd/srEsry6JFEDfd3q+JwASw5uuJknodaldYhqN3povirzJL27dyDcf2qVzuAahmxnQT0XEhKymgH0WtEG0r4+oQT0Ryf/bjzePllfSXtaUzPllk/3/KYKnw0RWtywAx+Ex2p3Iy4coJyTjUI+R2PumUsArNKD464RXoS+xTCQDJhO2vmJBEZsrXMQZNWiCQ94LuhvgBgLqFoX79FE5C5nJwVP4UTQI20Jo4AXqphI0lFEylI+r5cXReZg/gvXirkYs3HO3Iq4C3mZXh2decedixZoyib4+yNjxeSpw5nmwsACPgek3sp+gmL+RPP6+aIXTd+PvJLrDhHXXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com (2603:10a6:20b:40b::22)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13; Thu, 30 Sep
 2021 07:04:09 +0000
Received: from AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b]) by AM9PR04MB9015.eurprd04.prod.outlook.com
 ([fe80::1930:4dff:d531:7c3b%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 07:04:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2] Makefile/Kbuild: Fix "FORCE prerequisite is missing" warning
Date: Thu, 30 Sep 2021 15:03:19 +0800
Message-Id: <20210930070319.2314855-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0098.apcprd06.prod.outlook.com
 (2603:1096:3:14::24) To AM9PR04MB9015.eurprd04.prod.outlook.com
 (2603:10a6:20b:40b::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0098.apcprd06.prod.outlook.com (2603:1096:3:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend Transport; Thu, 30 Sep 2021 07:04:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00e6b42a-e5ec-4c7b-1dcf-08d983e07ff9
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8825F1CE973ADB364B3E42C2C9AA9@AM9PR04MB8825.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9cz+ytwGRfmM51l3HTPjjBb5vzi+yTOWfDmQJa/BeNtpasaPhEwgn3ZC093Sme69tymDgIWCjMqwzJg3/Fh9UzxMQv1CGyYahJqoo6YIejHdkjOMEfb5TD7DQC38TOTXmVk2QxGf4zpupUw01YRyQ9VZZZ71sqk641OxBjiii4sX4e1D3iq3O8VVPMBS4ODPzUBsSraB37n1T95kGpYXOQDWZb2BW+h0XK/IGrXKbRrRfUHeYzAL7rT7SWOgyTjE80A5zVlZyqZHruu5scUUxPc0UcsefvO5WOyU//R0b+3DIq+mydilN4ATgTVSurcIdsRtn9K7l3uvvRAvD/5JHiv84ZVSNXLUxr1L3rBta0XelCnajfzo85p/jOMXO5QKPE/anyQJIMfaTDxKb95bRwr8wlEkiVFUnfVzavhvoNOGgy6MPnG5/zrS1zf5lV+OtKGJZ1RG/nK6eZYog5aN6yh7uIOuAmrebKrq6MzyQaC1yfpWTvmrLMWbuWYArWtRgBgZ8lb9H/5LeSoNFpw47609R7ehC2eu6UtPF0pFmRZ+iyXsvsMX0aOSCoHy51nIba/YTcKYllDkMvU8+4bwkccHBFWSZB8gLfBigyZbB4deVB9x7k4Mr9rlOP7Ezl7Kid/Yl0X4kCmiJbn/oqNXSWyj1b+lExd7zGPiD8VRm3aELSrrDtKlbD1xUDB4LRhb3ORqkMCljIJUuLqYYNLXXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB9015.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(26005)(6666004)(52116002)(1076003)(6512007)(86362001)(66476007)(66556008)(66946007)(508600001)(6486002)(2616005)(2906002)(956004)(83380400001)(38100700002)(38350700002)(6506007)(8676002)(5660300002)(316002)(6916009)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W+becJuP98bf36yVT6qPF52PkEP/YKjNEf2YmqcNz1SfzD9tPpu8+gWC3e9k?=
 =?us-ascii?Q?QSbBKB7azxwj/7rgL4Q47OUCyby0wPU0xN2sPoUY39TMvtpQFfLQOG5DD/Zq?=
 =?us-ascii?Q?czk5C9+tVyU7SvNXznsP642qJMAfvHDWe5Zs+WxhlLTIdzxHQecl/jmDrBv/?=
 =?us-ascii?Q?G6H9Nsk9tJehlKVi+IWE31RZdMg0VTfUJLF5xeesiRCW7nNak0IgzyT8V4DW?=
 =?us-ascii?Q?PblRoYRomG7GBUGCm/DqO5w/WIag6h9G2EuLlOnUQWgx5IahC2BXFQZRUAN2?=
 =?us-ascii?Q?67OvIGhvLWRlf/nUa+oIe1qVvLABfswhc3Kmvu+V2kjeSxdHgDTeHy6a2rUx?=
 =?us-ascii?Q?nL4mPeBKRDUOWPdrVKJBhxTyhnRdO4vsBKjkfGPMYJ66uTIWtdUb90PvnUuw?=
 =?us-ascii?Q?T4SlJR1KMLESwZ2j7mv+90cr1bPXvyeYOaBXJHxswBQCcpdz3Mw/mBSu1svA?=
 =?us-ascii?Q?d+b5MBAlGBez+oL/RalyI3AOLadAy82zRrPkJh+0/5Yowo9WiHU4BqMRzJiQ?=
 =?us-ascii?Q?4/BEidLkeEwQ4U2/pRgslOhNzfmnT6GWcstOQsMsl8OegnRoKZ63WLavuRUt?=
 =?us-ascii?Q?zcZEI6+1rMWToyzY9r5mAhGQhUgk4mzjXVVkKUDszbTZuofxBCQDDw5uBhhv?=
 =?us-ascii?Q?D9hhV0VNZpSW6kgWpl69vFUOyXugcAb7G96LUvhBc/XCHXmKRwTzX5WETn/U?=
 =?us-ascii?Q?SdTmBDR/W7vTrGJgNOJdE2ie/W0rZ4Vp7LqHtOluP19OWeoBPtl8rrETgOva?=
 =?us-ascii?Q?gkBRu2jCtUNDAx6EpAbysbEvXDmEky0YJzULtVx87GQ8yuSDab/VG6aJI6Lr?=
 =?us-ascii?Q?4+DxxBucnBfdEiOikLbM3Ns5w0aSED5i7xAJ5EhsX7V4JGXVSrVCKadOyRP1?=
 =?us-ascii?Q?eALyyQwOpp1DOCOUCUdQEV9f+CA+HTSqVNKnPsBBUnuermjUUoekSICezwoa?=
 =?us-ascii?Q?RDMLXehkd7wVgFKuA8hNvkXlQzgslckRC0frISwzxeyquTLiwsuRCNb9qiT1?=
 =?us-ascii?Q?h/ht6unESzfHGrPHf+28i7NsDg/gbBKfv/8jF6HqUYKRvJipz1KL0c4cbOhT?=
 =?us-ascii?Q?pRZHwMhM7ULeBgpPGekJFaKER4VlpEF4V1mV+UCF9l70vC4NgO1G/4Yt2XQ3?=
 =?us-ascii?Q?AXd2rOs39crqHXQqbZW2BpRMfueXQbW/52fELZlijlTc2lrfRmNJQvHao6pU?=
 =?us-ascii?Q?o7idY+W8xeiARM/Wtf0fvbfdMgWd/3uSdbPGTij2ZWly6vOx0tM1JbZrG1/4?=
 =?us-ascii?Q?OhPMqf2KcMGdm47qmwrPsEGVDPu6M58O70coWKrW47aQCqc7GDheLBkjNiS5?=
 =?us-ascii?Q?b+CLFI9z+OXnu7VKgYjQ3QM3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e6b42a-e5ec-4c7b-1dcf-08d983e07ff9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB9015.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:04:09.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adK2oBjcUeN+tjvnCj1BWlexPuKLvy+PxjZTHqX9B5Z7Xepgi8+KS5wkJachb2iVV4t4Q7ewNR0LlrW3AnNLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=mAiQrNPr;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.14.85 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

With Linux kernel has a change that
"kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and
filechk", so add FORCE in Makefile/Kbuild to avoid build warning.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Use filter-out FORCE for x86 cmd_link_archive
 

 Kbuild                         | 4 ++--
 configs/Makefile               | 2 +-
 hypervisor/Makefile            | 6 +++---
 hypervisor/arch/x86/Kbuild     | 6 +++---
 inmates/lib/arm64/Makefile.lib | 4 ++--
 inmates/lib/x86/Makefile       | 4 ++--
 inmates/lib/x86/Makefile.lib   | 4 ++--
 tools/Makefile                 | 6 +++---
 8 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Kbuild b/Kbuild
index b76a8dd7..2863c121 100644
--- a/Kbuild
+++ b/Kbuild
@@ -46,12 +46,12 @@ $(GEN_VERSION_H): $(src)/Makefile FORCE
 
 quiet_cmd_gen_pci_defs = GEN     $@
 define cmd_gen_pci_defs
-	$^ $(src)/include/jailhouse/pci_defs.h > $@
+	$< $(src)/include/jailhouse/pci_defs.h > $@
 endef
 
 GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 
-$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh
+$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh FORCE
 	$(call if_changed,gen_pci_defs)
 
 subdir-y := hypervisor configs inmates tools
diff --git a/configs/Makefile b/configs/Makefile
index 74b35f0d..327043b7 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -38,5 +38,5 @@ targets += $(DTS:.dts=.dtb)
 # prevent deleting intermediate files which would cause rebuilds
 .SECONDARY: $(addprefix $(obj)/,$(CONFIGS:.c=.o))
 
-$(obj)/%.cell: $(obj)/%.o
+$(obj)/%.cell: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 3807e608..8ae4e332 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -80,7 +80,7 @@ ASM_DEFINES_H := arch/$(SRCARCH)/include/generated/asm/asm-defines.h
 
 targets := $(ASM_DEFINES_H) arch/$(SRCARCH)/asm-defines.s
 
-$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c
+$(obj)/arch/$(SRCARCH)/asm-defines.s: $(src)/arch/$(SRCARCH)/asm-defines.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
 $(obj)/$(ASM_DEFINES_H): $(obj)/arch/$(SRCARCH)/asm-defines.s
@@ -110,13 +110,13 @@ HYPERVISOR$(1)_OBJS = $$(addprefix $$(obj)/,$$(hypervisor$(1)-y))
 LDFLAGS_hypervisor$(1).o := --whole-archive -T
 
 targets += hypervisor$(1).o
-$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS)
+$$(obj)/hypervisor$(1).o: $$(src)/hypervisor.lds $$(HYPERVISOR$(1)_OBJS) FORCE
 	$$(call if_changed,ld)
 
 OBJCOPYFLAGS_jailhouse$(1).bin := -O binary -R .eh_frame
 
 targets += jailhouse$(1).bin
-$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o
+$$(obj)/jailhouse$(1).bin: $$(obj)/hypervisor$(1).o FORCE
 	$$(call if_changed,objcopy)
 endef
 
diff --git a/hypervisor/arch/x86/Kbuild b/hypervisor/arch/x86/Kbuild
index a6badcac..7a42adb4 100644
--- a/hypervisor/arch/x86/Kbuild
+++ b/hypervisor/arch/x86/Kbuild
@@ -40,10 +40,10 @@ intel-objs := vmx.o vtd.o vmx-vmexit.o $(common-objs-y) cat.o
 targets += $(amd-objs) $(intel-objs)
 
 quiet_cmd_link_archive = AR      $@
-cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
+cmd_link_archive = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(filter-out FORCE,$^)
 
-$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs))
+$(obj)/lib-amd.a: $(addprefix $(obj)/,$(amd-objs)) FORCE
 	$(call if_changed,link_archive)
 
-$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs))
+$(obj)/lib-intel.a: $(addprefix $(obj)/,$(intel-objs)) FORCE
 	$(call if_changed,link_archive)
diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
index 2ea037cd..5df2632d 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -58,8 +58,8 @@ endef
 
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/lib.a
+		   $(INMATES_LIB)/lib.a FORCE
 	$(call if_changed,ld)
 
-$(obj)/%.bin: $(obj)/%-linked.o
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
 	$(call if_changed,objcopy)
diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index 35f04161..06a84ecf 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -51,9 +51,9 @@ lib-y := $(TARGETS) $(TARGETS_64_ONLY)
 lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
 
 quiet_cmd_link_archive32 = AR      $@
-cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
+cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(filter-out FORCE,$^)
 
-$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
+$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y)) FORCE
 	$(call if_changed,link_archive32)
 
 targets += $(lib32-y)
diff --git a/inmates/lib/x86/Makefile.lib b/inmates/lib/x86/Makefile.lib
index 872b7ce0..b5748565 100644
--- a/inmates/lib/x86/Makefile.lib
+++ b/inmates/lib/x86/Makefile.lib
@@ -57,10 +57,10 @@ endef
 # obj/NAME-linked.o: ... obj/$(NAME-y) lib/lib[32].a
 .SECONDEXPANSION:
 $(obj)/%-linked.o: $(INMATES_LIB)/inmate.lds $$(addprefix $$(obj)/,$$($$*-y)) \
-		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a)
+		   $(INMATES_LIB)/$$(if $$($$*_32),lib32.a,lib.a) FORCE
 	$(call if_changed,ld)
 
-$(obj)/%.bin: $(obj)/%-linked.o
+$(obj)/%.bin: $(obj)/%-linked.o FORCE
 	$(call if_changed,objcopy)
 
 # 32-bit (i386) support
diff --git a/tools/Makefile b/tools/Makefile
index 4faf9430..1108433a 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -111,7 +111,7 @@ define cmd_gen_man
 	sed 's/$${VERSION}/$(shell cat $(src)/../VERSION)/g' $< > $@
 endef
 
-$(obj)/%: $(obj)/%.o
+$(obj)/%: $(obj)/%.o FORCE
 	$(call if_changed,ld)
 
 CFLAGS_jailhouse-gcov-extract.o	:= -I$(src)/../hypervisor/include \
@@ -122,13 +122,13 @@ LDFLAGS_jailhouse-gcov-extract := -lgcov -fprofile-arcs
 targets += jailhouse-gcov-extract.o
 always-y += jailhouse-gcov-extract
 
-$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl
+$(obj)/jailhouse-config-collect: $(src)/jailhouse-config-create $(src)/jailhouse-config-collect.tmpl FORCE
 	$(call if_changed,gen_collect)
 
 targets += $(MAN8_PAGES)
 always-y +=  $(MAN8_PAGES)
 
-$(obj)/%.8: $(src)/%.8.in
+$(obj)/%.8: $(src)/%.8.in FORCE
 	$(call if_changed,gen_man)
 
 install-bin: $(BINARIES) $(DESTDIR)$(sbindir)
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210930070319.2314855-1-peng.fan%40oss.nxp.com.
