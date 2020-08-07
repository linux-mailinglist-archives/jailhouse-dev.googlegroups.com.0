Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBV76WL4QKGQE6XZRJEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DA23E5EF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:27 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id x13sf165479lfr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768087; cv=pass;
        d=google.com; s=arc-20160816;
        b=LrQEX9tkFWkYMmF+FZfZGQbAYPrOvqCCO3YjpcZtOF36JM6LCD0KPWybTtY646aoZB
         ixAGsM0E7YgJ/c5G/tPojbtbzbo6Urioyy99mJcxO6LbMIZ8OqK0HR8hs3Fe0cJBYDhY
         vH8AT3uLw8Xy+Nsu5hdE3wvKUha4NDS7ZV0UunjaI3t/ntzZrRc0l0gq+Dfn8G+qy+nb
         mCf1pKv+rbvDJtYMLL6+oxHEDMIlR3CrbakUo7lu1xmUXjhK0WQfENBOaTe6aXzDf8yX
         fhp/ZxqHyqO8GqVjYQlYehjoH7w6RIHacGi49qRsziDR7T42dOF5IqR/HtAz89iWN95z
         UelQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uWV13kd9FITgl6SXzorRV75fCu/cVIU1h2PEbCfbqvo=;
        b=ry0mCJlY6OEUayKr2gVOm+ZPh/atoF/+i0L7XzTJzzjAEO2cPZcnqGLCnArlc++R8j
         AEVdbTkdfQnHJ1bWKWY2euJ3zCVwkmqxufC9qRwi53eX483SrsSl07J58V8cRb9afnLC
         kHb0h4OD7dD+xlRqg6nY8uXi8oilaPSFVhdK0jYL1W13pcw2dxeg2vddO9MoFYJIkA85
         q8gRo5cji8o/x59O6v3bbGJAUv3eSFc8Han03ry8QC1PHL5Mh6+XcHeUgsq3jeVOKT3H
         BbMCJ0eB7LrLbfLnliHH12IRNHrWeFUB6hCyR/uE2er4etxXzfKou+l3r/U/HH1iBSSY
         wwYQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KUCGUyG8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uWV13kd9FITgl6SXzorRV75fCu/cVIU1h2PEbCfbqvo=;
        b=s0vtImiFHQG6PfXEn+VBcOk8hELOeQq223JztezBEQ8bFC0TIf/IaUfP0X5wcEJxdJ
         VLMBSb/fMNAh+pcFgWCt+s6fMRGUjtk8rHnVQv3Dzut4ZB3C6mbsaSafInlo+ADhCYSh
         D706czZundHDh+aC/fWiVh09ugE9H72+7Q2DgQoOOk/bgYBX94hfX3kSwTRWgGZec+8o
         x3k3AmfvWn5gWNuMFDrKB9imj8q7Iei1MrrdTBlpiVGvab+EFY6rfAiw8tVH2EhlOEGP
         9lGGcGeY/d2a1Cxunj+W3jTu/MQ0AZHHgUm8iy0wilAbXqmjzS+8ygYI9PxrPumKDtG/
         hTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uWV13kd9FITgl6SXzorRV75fCu/cVIU1h2PEbCfbqvo=;
        b=W8i2ol6ZAlt5bReXxd1kDVVnRD/hZ+/7DUJ9sGZDlttscy1rY7OyI8IO7JmQhpPtvl
         EQ/D/T6DD5xLq1eq4z6bW1k9xMtztAP9g9dnBPxEj+qEg/tFWkU+4knjkJjV3y+TEozv
         uOXGAzE/wOd0x1sGdddeRGZgrk747jbzorW0o8s6o9GOXLm13+ombZC2ez8u/9bhT9fV
         fHG/eBB0WC9QUxikTOBzXU74M6pqQN6adut3EcakK3AmgHuyFlsRdsZn7XpT2kijp5/O
         Wezu+d+N57VzquR7oFiyEhsyzbPRYu3jwUGunqYtIlEDRT8h6bh7/M3sL8NwCLHjjO2/
         dtzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532G057J3/O5qEaGZ9bGA8wBwvmDZL5c0jjgwB++V9j+du1/1D65
	9CYq/Xmq3rjYj2S3/M8ZZjA=
X-Google-Smtp-Source: ABdhPJw+GLxwCbFrNYKI2jL+CcZLAh2K5JbgJoMDE1cZpmonIfYVWmvdyHtHDFM5X1gc9XD8Bsd1ew==
X-Received: by 2002:a2e:3506:: with SMTP id z6mr5083848ljz.418.1596768087339;
        Thu, 06 Aug 2020 19:41:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a172:: with SMTP id u18ls1579319ljl.7.gmail; Thu, 06 Aug
 2020 19:41:26 -0700 (PDT)
X-Received: by 2002:a2e:4c02:: with SMTP id z2mr5259614lja.177.1596768086594;
        Thu, 06 Aug 2020 19:41:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768086; cv=pass;
        d=google.com; s=arc-20160816;
        b=IHZp3WV0NvzylXfp+LPVrgIQSN3nsN5VN2XSjq5Ivx/KVWWjgR0Mb9z1sgUb2gdH/x
         1/Lq1afGGy1tDyzKcrweKkcKcwXcJAI2lhjzYAFGPu5IcwJY+kWbMAOY3FIETq1X+59I
         DkIGlToC+8etdtgL0NrkDnRaOxRCLOMbZVB7mh0cutFq+7ARQ9pQd2WxHbwyb0p2Klef
         K0VePTZkzrDVppuauu87Jvvb0RLwNc8Cqj8W8xxT4Ffvro/gIW0bn3mtZskJiBstqX0N
         4/Twd7XKvP/PvmsfWJ9u+90uOtJfdN2nPZwIGXPzDxhGlZglLFKeJ+f4iRvlMQn9AZ0E
         Q0pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6lHMaYAQjyau9UmR+8//8lvhqyr22cHIJGKReOj86W0=;
        b=g/9O87WhjHO3MvdBDayPdqAJ4tx3OU6KqirGtEl3J+b3aTi78+m9/XgIxvkTgDTpaS
         7dwoUanDtEmZwhpJPKETwtx/ZT2I6js0xhpwf6wugBksCVVfIraL0mXvLEIYUxkD3U3u
         ORnS5JpMBt2FtjzfEPOmlEVny/cP9dTLlbFUNwysdg8LjXjLKjCbl+w0Lkxv0yDXINKc
         p7ZJE8CqoEhuu9HqQhqaxp9c7u47UhOAshXBLkyLJlsVY1EvQL/aRelQArLGwkz+zTi1
         wndHyAckNTW0T7CoVKcFH05uB/lTcg2dSCcYvXSCp3W7LRAKES4FGiymAWhAnKelnQse
         Dk0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=KUCGUyG8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150040.outbound.protection.outlook.com. [40.107.15.40])
        by gmr-mx.google.com with ESMTPS id z21si361055ljn.0.2020.08.06.19.41.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.40 as permitted sender) client-ip=40.107.15.40;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKzJ7pdeDOTji2gwhRhHWhhLzeF743R2MGJQo1wv2FUrOkYDJYQsHkrt3V1prweRm641zM7vykL0BjJwQO0Uz2cnciiSeCQGKCtaakVPvJfpJmiR3gHnQvnTV1ao/rbFatQ6USg0rfHtPlS4/CL3y4jiChyfs7BFtZHYQME/ebAKh5l81f8mv1MeHjW+jzd/XuwJYymP7NOjqz4VpF50Tw/q/5RwfydwGpERC6ReQrnM2mLf+dNmcWljU2mZ/V/d+k7VVOdHc7QbYqRwmQp83lkGG0Q2h7QU8AjyO1ulK7HuvIea8Tgpfi2AUUHqvMRNSbr0V45J+P1JbUwWPAHSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lHMaYAQjyau9UmR+8//8lvhqyr22cHIJGKReOj86W0=;
 b=hKGOQeJGwzG9LWTdE7yJzf+jHofymJXVcNfHGFO3SOW4y5p/yNaKsDeIwDik3cfxDvI3lD4pL/agh6RFrm2XbE3G2yS72Ajmj+FaU86QfVwqEloRYBrUIdHQOrOo5zVwf5Mb1fYYXEYWVSBskfgGFjZ5DtmPmjiMcfKGoODwUCfM4mL9iGNTZd8QaEHWzOMj1KaceG2d0t68VykP4egzSqn3skFu2GJeTqex+I7ntL/lluYwmRhcGUu+COCC7NaiwkjNmP31YzEVEgqREC/p4fU706cB/9NaIgbJr43GQPDLJc+A5TqkS1U98g4zZAejW1Oi32ziHbyaxbAkjk4wxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:25 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:25 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 02/10] libbaremetal: move mmio.h out of inmates
Date: Fri,  7 Aug 2020 11:06:24 +0800
Message-Id: <20200807030632.28259-3-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:23 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fae2ec7-98b3-46ff-2d00-08d83a7b608a
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087A9AADD470C9B69F9655D88490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZHO+xQAc6FxY8GmcpIkLo60OhorIHQGU4DLoYw+wXmD01aHoMcJwBDBRWHsBTvEr6ziPy/LwS8OVvCgYbdVIBfVHSAMokLcZKW9rXzHWiInaM4ofKmkQZ4sTlhYDFk9HaZUT7E3pS+2I19gmV/2lTLAKMWsJIuotvEz/4xI4/uTrP9AUs78Z/aivadZNFxoT/utASrpUq+7fVwjYtGjip+k3Ldpfm0nX6HUMxjJJt3YucXPnJC55zE5o8zRloPjUhByB+W32yx9lpqKD3k7NTx9OuVhNFqFbjA2NR9HpS411mVssT60/PMmED/BiHHfbqCNsjzdAfAl11Ihc9kwdHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(9686003)(6512007)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 8yVuwigMSBwxO75Q3iYyGL6tCOFo7QnBnE0rBgX+ycIdQ2LLqRnyUo2oLatDtk56XoULm3panxTTmqE2FqVCztqOk+adCx6799eaWH8eqRcEQMtGPPsDxstZ75MoTWPaEiUuyMCUUlPaopUONrZ/M7Sj5xdFr3mXRw1DJ78o+kI5ASNsYLiFrUEck8+DBxtQ3ITNrTYNM7TJxPHK2LlIqF6G877/LBxIPCxugM0/9KvJ1I2kubrnNhifD/y5kK+A9TAVNiu3KAaqC/6AkqaQ4fcu7LZ/GPLP5KvV5ARNItSSR2Ad/vJmURCqbc80IsNY4mtHNbHU6I6QlBOoLu9Lj8DUzgL9hA1bAQUAfmQpqDknurK63DbE3P/MckGmAwAJmZmwSXjlzDAQyCwvAJGJ6V6svoMQT36bErxsRQcm0OOgTmod9A8YrXtqaFJnQidprIA/VkjsT6oevuEyLucZGeUKI7DuCG5QOfIq0Z0qXzzuSvvRw+kNUeHT6Dk1trVTOr+uWtq1+51eT/pphZHFtnuVWTgNBE2NOmXawfQ/qmxox3IjTsvrr5muwXrR7djZ7E59Wxh676fUyVHyXJNYqgg8QRZPPIjz1FD36HmTNPh5LxZe1q8P9XkoLTmxfgUlGxv3NxOgukp3e8GiSp7QTQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fae2ec7-98b3-46ff-2d00-08d83a7b608a
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:25.0950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhO+JL9hWOWygMMqw3EFK/sPuLwoB4N1FYi6d1PoO1ireuStzKqRx28qkbpCb6HVyw1jVslAXJlTH0RCuC0sTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=KUCGUyG8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.40 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Move mmio.h out of inmates to make it could be shared

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 inmates/Makefile                                        | 1 +
 {inmates/lib => libbaremetal}/arm-common/include/mmio.h | 0
 2 files changed, 1 insertion(+)
 rename {inmates/lib => libbaremetal}/arm-common/include/mmio.h (100%)

diff --git a/inmates/Makefile b/inmates/Makefile
index 18a94853..9ccd30fa 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -22,6 +22,7 @@ INCLUDES := -I$(INMATES_LIB) \
 
 ifeq ($(subst arm64,arm,$(SRCARCH)),arm)
 INCLUDES += -I$(src)/../hypervisor/arch/arm-common/include
+INCLUDES += -I$(src)/../libbaremetal/arm-common/include
 endif
 
 LINUXINCLUDE  := $(INCLUDES)
diff --git a/inmates/lib/arm-common/include/mmio.h b/libbaremetal/arm-common/include/mmio.h
similarity index 100%
rename from inmates/lib/arm-common/include/mmio.h
rename to libbaremetal/arm-common/include/mmio.h
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-3-peng.fan%40nxp.com.
