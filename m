Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBWPXW35QKGQEVLK3UAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id E4545278444
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 11:43:53 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id x15sf352685lfn.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 02:43:53 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1601027033; cv=pass;
        d=google.com; s=arc-20160816;
        b=hNA3UnTunAvtXZcD93+CqVeb581BVKrH0PU4hmbuZjT7TcLNVl+2OvTDkEvYJ+FvU2
         PI5/blL3t3AujE6Q/1d0/TjDkEBGL+wZo5A0DdAhHjspqsv6wE5cynS/Yfq+eCGXipfB
         yij5zAj5j3T0GggnfmLnU9Ijef8/cKqlEiSVngRzfuPowWFFfkk4nKEIM2MKPbRjoz26
         tslcsuQRdE28QFaiKuP6d9VWtqmqNIqG2Qre4Myt5kssoZ6n4iwACs9bzEkQ85Z/wTab
         mFugnRaQEAqCjcPNvuSr0u+2dtlo9EzG+U6GHGMhcuCNyzzfg+iM44W+t5Z2usRlpIn0
         hLpg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=z5Fv7zOZZQP5DcW1oFJZ0odHd/EExMqZAJR5EgQvbCc=;
        b=WCKJupMHBGqPVvTWga9AFRuc8gGhiUv9BdTpcHFVEC3pDjYhXJP3kljtPmDww1Q7fj
         w3jocZAdhXmKP8I5oxFwN+gKvFMPwN8VSNuU/m+Sp19BqSTR8nW3luigUEOaYovBY0qp
         CbrW2OlcKkIdhuxi6geeVeHRZWzrhtK8LecvTGRu1+ZusZU4rDsHfy4pIm5/vw0qyoBT
         cun9zO35A8xFEAOzcLjIvcnRLZMc6ff+dNHatGMmr81i7oPf+IyFWAc/MaDwtc7nxKJi
         Fqlz8k65itarcMOI7ACTSdOoghb6tdct0SvM4wPx2zlfBas12Wwygcg/l692p79thTZG
         9pVA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Zs66i8RW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z5Fv7zOZZQP5DcW1oFJZ0odHd/EExMqZAJR5EgQvbCc=;
        b=NXbnBw09dFgWE+QXI+vYtOE/XpO18ERoSAemu0/ePjQvAq9juWe/zCdfjKkbnTWiWk
         k2PF3oNWs62pr0UbY9cahaBy/8hY528UVpiMH5txRqyLLeGQI9AxLcaOJzLamB/eexA3
         OQ/bHrDX8dqnMlRlhid3nze8jeG+Q0FZ4HgIN4AEhlWl+5hk8RoREtI7yWpmJ+E+f0wo
         uiJyLr0djy5RSa2EXRTur0sEF8cJMZfR+BucE68ILwhA6VmuhB+n2/n6JzhCq+xqg0jD
         z4skVFp99a86Ps+2fvF/e+HY370JdpKIihyuPQ7sjnVW4djVJJ52uL6R3ljdrFMcVZzL
         hKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=z5Fv7zOZZQP5DcW1oFJZ0odHd/EExMqZAJR5EgQvbCc=;
        b=k3/DmFrQFZx95oOTxxW18PKBljaTmlA7qU+vdWtFyGIUvhfEXJmFUdlrgGOHhrxT1Q
         5zTYNYPPlX718uJmSiVShRm/49ae7YdEpnuBDCC4+Z5444IbERufYoeaROuK9ksXQRYV
         OTtS/ukvKlUl9gQlyC6cIv6+NS/iePxfe8Vn/1eb4ZRtHrgbJk/msqro44s+lK6XriUw
         7vIWsOqAujAayQAkk0qQtOjfzMH3OiFGJ9r3JgajL06xuUSbBViWUPzALakHaocvwcwF
         mhi0k7Du7PXHjW3YdkDG5re5StxxHyqgEOGDSxZQube4m7ecdCRzlav5knnm0qtSfayz
         0IXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5307qSSxJAmjWuFTJBu+lh+81tQwf2gjccqf15N2UJBuyoAfb9Ck
	X2zAlaZxGoDtAECC1awN94c=
X-Google-Smtp-Source: ABdhPJyt8e1KKTBBJnv9APK47+NmOYFv/Dl5hTDd9d/rqnsKURb99dmNO4OqlfDe0c8leAepknbqzw==
X-Received: by 2002:ac2:4e96:: with SMTP id o22mr1004984lfr.485.1601027033481;
        Fri, 25 Sep 2020 02:43:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a556:: with SMTP id e22ls287507ljn.9.gmail; Fri, 25 Sep
 2020 02:43:52 -0700 (PDT)
X-Received: by 2002:a2e:b4f7:: with SMTP id s23mr1238509ljm.80.1601027032254;
        Fri, 25 Sep 2020 02:43:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601027032; cv=pass;
        d=google.com; s=arc-20160816;
        b=KyP+ops5yktOijylgNATUYiL9rzU8X5E/QLfEWel5RoKOyYihUdeuLw1pGtOwsyCSn
         oSEbmSPF+uuE29Db341SUQ7+sjZmPeX5oXIVAwyBxJVJDGOooQNtKsS6gkC62K2gTmH3
         Jdqy9ooLoVJqsf3mecrWEUl48QW2mNZmoFE1ozaSIyK8ldyU6f3PrDNLNftLWsW59nkq
         vEAXGi5ueqE6Z85Aia1PQa54Skc7JSAzQN4+jHCw/GM6Zkq/6p6vzaba64UT4/JZjMQ4
         SvlDOEPmzHL22pOtb3pdqL4MfY9x9GcA+8D50A/zQuN31kGBGU3ZTRxGiNak+A+IiihR
         /nIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3OkP0IyZlwRAMeLsB5yhkVt4bhZ0rODsPW8TmgbKp9o=;
        b=iMH87Jc95pewJx4OzXUsoqivNmPhJCZmNj360e9Dy2m3NV2Po/CZkIGEQQvvfV5KWG
         O3wa+JmA2zBfPkHrKYxEA9mxAnSEzwgvDEW6L8S1Rq9r3ET6deWqz1LwoAJTXI+nTTTz
         muiuI/fKmlr6oOSO493zI+ucl4Qqy5pTe037EMRN6bmfjoiKkCxAc9gc4JrIWZQ0pxdN
         6QAeFZ2ILQ9g20U1/9KpnUDS7fTw1A0Spau9lKA8f8pydvo1nXOQrlnKm5NUQfCoKIX6
         4USErm+9j0uBD1BI+qpsOGhIRbwRxlsQa9J/MQ08QDUAFB881hlXa6NF79ICuDuXV0VO
         nhfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Zs66i8RW;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com. [40.107.22.86])
        by gmr-mx.google.com with ESMTPS id y17si63102lfg.2.2020.09.25.02.43.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 02:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.22.86 as permitted sender) client-ip=40.107.22.86;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcxJOPhoyYS5iSOyySG+K5NE9Qf5mXh3FpZBTCml/t2PHuJohbslDzIw/QW39M7diRs/Euh00YSI+C4T/T7jBS35QFLxRzXvlINj5YVGjkz3qxy8gKF6o5aL1vLQ0D9oZ+7nZ3X/rKTXgHq8cwEMBWRRXoBypzSwOuZSaRI8O1JrPZuLYc/EEMi9JggInkPovF8HyoiNyLKaGOnT5n6MqTPmXFbRNbKoIATlIqFwM5/S/Og63GV4hgJsC8oZgJ1JNZAbrK9/knT2RXrlGSMpa3L6+DZxY37gtHQkcm0aWBLsy3mR1VVcnM8TXOAx7dBg2c5jOV3wNHdmduY5d2XOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OkP0IyZlwRAMeLsB5yhkVt4bhZ0rODsPW8TmgbKp9o=;
 b=DDHUXHMVfkvkp+SquXNkX3bZFhInnUTKGHdrHv2tTDFEXcTeaj3X6QishQRaxDq1ahXtROox/QA0zsfua2IzxAyD+fKAWcCSa9PHoM0sLAaqZgzBx8EtUU377IPqxyg2bkKiU/kzyv4/rSfK4hhNvWKckdvPwTtNVIsjeA/ta9hqQ3DJVQqdOfL11PIAEIBUNR8AYvDUx91oUCy6P7iZ8Xr/Q6i6xL/gJsQcOBzU0IZb1zO+DDYDxVYjoOgJfjr+82kFfCyxe5RaQfMWoqwT98apKznyzRHs8kZAf74RU815sWlliVL+qFOawFKsJ28tI/kjTa+KZpG4BkaEwt1CJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5081.eurprd04.prod.outlook.com (2603:10a6:10:23::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 25 Sep
 2020 09:43:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.022; Fri, 25 Sep
 2020 09:43:51 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] inmates: lib: include ALWAYS_COMPAT_MK
Date: Fri, 25 Sep 2020 18:10:06 +0800
Message-Id: <20200925101006.15965-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR06CA0232.apcprd06.prod.outlook.com
 (2603:1096:4:ac::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0232.apcprd06.prod.outlook.com (2603:1096:4:ac::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 09:43:49 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00fb3800-f568-4e38-5509-08d861378216
X-MS-TrafficTypeDiagnostic: DB7PR04MB5081:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB508153A77E7653228227631588360@DB7PR04MB5081.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxivojIYR+oMmsU9vHL3lxOxcEYuoAVwFyUuOjAEuh6cc3Mx5rOP3GqqKWNWWRyCSwXKdbtDgf9MbceldZm2l8GilSOdrEcaPwenDHMUvoyZj1xata26uZJSL141LWmyu9rgsFznFHRXS1cNMntU4MtsPUKI1qclm3GgTY6VCspeu3OTePrdgtqC/0i3rF1gS+ojJCLMVUzYX43Xkq/EonM37HWUrbD2EpkYeVv7lWitUSU3MwvXDgp9C3NC5/kh5eJ6vKRAkmBgB08W6f4asiR7pg+dv0RPHWzN82kqRewtJ1FS7EMxnieiE/uMTngwI42GnlUvOaEZXAxuxX2Zjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(9686003)(5660300002)(16526019)(66556008)(36756003)(6506007)(26005)(6512007)(956004)(4326008)(2616005)(52116002)(2906002)(186003)(6666004)(66946007)(8676002)(8936002)(6916009)(1076003)(66476007)(478600001)(86362001)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xx3Dt+uDuzICLDTBHlscuz3lZNH+ZtFR79RcFrTjRa67A/qGh0OSgJRwmO9P9gVznpZcfJ+NWnrffJMiQnWdsuSGRUVEVeKYselfvsw62a2nfgOsePkARJAVKy136DCkUsqPntZK+LxTgaf7Vusr1gaAPV6csgBGgTlP1bPu53WrF3UL8tK4qdlJUdTo4l4BoY7aaj910fMv2ljwTSDxGJNdw5y0Tjwc0DRvaOxJZQxujz6WVIHubEfOfpPkr+8HUOBsSwDZGkahobOPz9e9zGQZVprN8DIURz2EsFaplMAWkVdaymfPZHkajdFiFeG7W2bHNEN3jNrvsvtjgvX/vHT8DUwJ/xHHtcWje9VNkzP73e8O3kOCvIDy15/pPev09s/2v1OpvHsrtoR1n+nU5eDf7T5FZWEAOROoxoGOZlmUfwe21ZHsUVa226+T0vMUUzD2W5dCaa3Hdxcxv1elS7kEKDOfxX5EBjoAOC3LC/fAeseGC/N+vjGmgJHv3HXwhmd1uQ2+l32TAWvOufFFVioInwEY1om7ZJ1D3ajGSVAhDIRQNGVNwGJXdr99Vl0IQir5TCtzfRt0QAkOXrJtIvVjk0OfLfHzSDzF+s7nw3ufn0fPiJR5Cith5jKt3mvbAgI1FTbl7l/XtxM2fjU6CA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fb3800-f568-4e38-5509-08d861378216
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 09:43:51.0690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8waGXbl81xZ2h2rBnPFRB5IWzg/wd3h6zOQ0DaG67jfqP8m5V8yEwSvr4WDBYEK8/m2DPHmxKmY57e78Ukz0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5081
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Zs66i8RW;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.22.86 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Need to include ALWAYS_COMPAT_MK to build out inmates demo with
5.4 kernel.

Fixes: 7b2876158c416("kbuild: Avoid deprecated 'always'")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/lib/arm/Makefile.lib   | 1 +
 inmates/lib/arm64/Makefile.lib | 1 +
 2 files changed, 2 insertions(+)

diff --git a/inmates/lib/arm/Makefile.lib b/inmates/lib/arm/Makefile.lib
index 723ff6aa..aaa33fcf 100644
--- a/inmates/lib/arm/Makefile.lib
+++ b/inmates/lib/arm/Makefile.lib
@@ -39,6 +39,7 @@
 #
 
 -include $(GEN_CONFIG_MK)
+-include $(ALWAYS_COMPAT_MK)
 
 LINUXINCLUDE += -I$(INMATES_LIB)/include
 LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
diff --git a/inmates/lib/arm64/Makefile.lib b/inmates/lib/arm64/Makefile.lib
index 723ff6aa..aaa33fcf 100644
--- a/inmates/lib/arm64/Makefile.lib
+++ b/inmates/lib/arm64/Makefile.lib
@@ -39,6 +39,7 @@
 #
 
 -include $(GEN_CONFIG_MK)
+-include $(ALWAYS_COMPAT_MK)
 
 LINUXINCLUDE += -I$(INMATES_LIB)/include
 LINUXINCLUDE += -I$(INMATES_LIB)/../arm-common/include
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200925101006.15965-1-peng.fan%40nxp.com.
