Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBYH6WL4QKGQE5TJULNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0E823E5F4
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:37 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id z1sf149918wrn.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:37 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768096; cv=pass;
        d=google.com; s=arc-20160816;
        b=yELBVS3LiMPTRYt9y+sBU9JNGHk+GgZJFpVaIGXBpDcsBDgohsfVYzGYkfLzHaZHKv
         II2RyU+Iy2LBuea9r6d5pp10Fhs4jf5GiGmsv/37T820Fyy+a7hP/NkhnICZGsiCDuzY
         2YPdBjJA/QUodem/AFnKfTKY2mqJdeu0Azm/kjgkiWneMhjzVF7z9KIWSxGZJefW4ybs
         LZYuopoUYaQw+H1TGuZuQirsdGYw8e/E8Xb8dnRm4oOQ7cPlXe5XeZs3mZYAYtaM42w/
         qexG731UarG6spaAFNTwg2sSq3jcvMOdAbTxWjGrqmSjn5g82u6q1Z6lL/lzXMSUig5r
         yFfw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4mdblkH4kGOD+leeytYqVlitlMc1MenhISr5emWb/Q0=;
        b=f8NWjmHaQyItJW872k0JEtOuhsxk4PQsMIRWiyn9Cgbw4EQLPmvWlOA2GJBuXHMouC
         Ky787Dp44GKsdfBQtd7kJZa34mBCiOHRL5488FGDF5l1cwdyOaS93cAsC7mNNtTML3Ek
         OC9rCxdDZ/1cDAZNsGSJqs444A+HKIf048R01s1GhoFdec66HEV4b/T0x2deUMU7rQew
         3PuSprhFuSExNM+qOdNvG87iMF1Vfz66aIwnqSoqfBGhwSExyLZ4qRRgJ6ar1VkJFGDw
         NNLCUICZ80iNqqvwkc05kK2l35WmEwbNMuHoOjkI4Uqm9NDfUV422uC6yAJbXoZUxvho
         Mx6w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="l6/+8xOW";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4mdblkH4kGOD+leeytYqVlitlMc1MenhISr5emWb/Q0=;
        b=oH76s4+6B5fk/tLUJABBT0RbIY6JXEdqVJyPaev9h0EVIX+i4QnlMzgY3qB1OTbpTR
         LBQXwkc5Hl/TjBXOcC1fzDcCgnCreGvATe75Upu37XMYQAVk0nsUi/1EbRJf4asfW4TW
         +pZ2K+M6YlPSd6ZLAlGeGte6iCkBKKzroKMU3jvQcW7wDAaS5YGf3zqLMvAlJ8BZ4xGr
         2aarwNcKgexGDi5B0R+SOl6i5mD8dr+GNEfT+kxj2AytCxz0BcXk//U9v5GUmcYKGsPP
         7KGbXOc+w62bN37cMFeZtvZBaezNrmwhi/S1bE4Z/yWSofHV/xxPgjuJQoFFQolJhC72
         t4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4mdblkH4kGOD+leeytYqVlitlMc1MenhISr5emWb/Q0=;
        b=PJH9umHhLkhDpxOWvFXpFPwsEHVSVP+fxgqXVTexhUeYGlJ6CIHP3kAE30auTXAtB5
         T+PmjDDEOXIY7VYdhNBX5z+piHl5X6PJtUoPRxWK7s3AiRahmGLaLE77JGrIXLnZbDHB
         LIscrB7l82yd4lsBr8r6aGcwshOkESaRYqvmT0Bo2mQf0E7LKbjSxVwyV8oceer3fDWg
         XsCwcAutF5T/VzdtD/TWySGLSJpFqbBrypfW/Kn/djZ71LgQ0VEKSKNnSj58PeRvM7od
         foS9m0rZ5A13qlkm/uKcfOk2AnlxRnz51+/hkNlC6D+iQ/rZRRdAZgls/focPkgWnHhU
         RYtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318jiUAd1GyqIg6tPbA5DvGhb8Z1uOtYgZJh+TKIuXxeRbCMkLw
	/aLGa56cFggI81+5hVKB3bM=
X-Google-Smtp-Source: ABdhPJzx8F9exImsPw9sXyOZIv8oTxFO+ubh17ikc4QGLu+w8FeGIx+khE2WK+RgvF67xTDHMOW/+w==
X-Received: by 2002:a1c:678b:: with SMTP id b133mr11413053wmc.117.1596768096771;
        Thu, 06 Aug 2020 19:41:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2049:: with SMTP id g70ls3655654wmg.0.gmail; Thu, 06 Aug
 2020 19:41:36 -0700 (PDT)
X-Received: by 2002:a05:600c:224e:: with SMTP id a14mr10852226wmm.80.1596768096143;
        Thu, 06 Aug 2020 19:41:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768096; cv=pass;
        d=google.com; s=arc-20160816;
        b=xmDHCZggumvJXJHNh7re/qXRCHsXQm+dwUIXND++vZMpgHDPETLCYzkecwKgMY8aAA
         u2/s8ht+vV/ebk24rQJzFl1RvOPuGH7+9wZmDcQ7NL72GdIj1i/idX9ov7MvPgntB0UZ
         6MZbsVXaZbm3RwwBOr7/HvSQwP9hUsIabXz1FkYQtJlziJT0rIuiy/z6p6h3yovI22X4
         KQfUUTVMc8vM3O3TIuw5CstwUiJvNMnXKzh9OGQ01XiJBmY1wI7ZZ+WtIeNOqMm8bPQG
         1HdF8u5Il73waoEqtodmz8Z13+D+/3m9FhzjMnJCnsUNIVBb0Jw/ADh0Uqa9gYpnwvBj
         JIBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fFzaCK66TuM+7nR5VLvbKoUuj7/vF2rlRHEKQON2b10=;
        b=waIO86Mae9iOQDFl8XDinyslkqX4DSm/LJ0m97kSWnhzgPfvLn418Vi+dAIog0uqMC
         IlNi9AgEv+dP19B08Xn19Ti0ctr44OOvmvWW6E8iW5shSl3rsQZ9Sn2gOQ+IGSsmzo35
         9lSHupr0hpPo5DBc+nrEs5sqUUoWaWa7DNeM39SfWIxdi/m+mO+clzu9J/U3HA8jhj9D
         Y5qKGowkjIyn+b44T+K8g7kVT/R3i2QauXzHw5FPv41zrzMdqbrmLlcg7C+Cbu0Q4/iu
         iqDhHCF/MPaBJx82zmlTJNt/nspOL7iL+vL3VBrbKH4j7xVu5AIJ68iHSY18ZkboXGbs
         d9oA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="l6/+8xOW";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150052.outbound.protection.outlook.com. [40.107.15.52])
        by gmr-mx.google.com with ESMTPS id s10si321530wme.1.2020.08.06.19.41.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.52 as permitted sender) client-ip=40.107.15.52;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk3sWjHJDPM2XyHLRbnmQXzlmmOKEBx+BGmZSfJ3KAwyllupfozLBQTKbAMIR9Muu9m9EEKeLgEyJKowfwDvGyWcaJwQzQhq4Tn4aafNpuHVM6/pWbSUXhXS3SgWUakWG9Ls62DIDOSu0jELAF6e5djvglSphucQNuNzGbvcAb2JQUwmwkrdqEo2zg4vz0sWPVxhOL68+jI7dzXyJEub8R8KcLl2h2vBjMqOtZFg5r54Vi9I2Q4tEifmkPsU+YqMAGnxsKj8V1cdzAq/2BbdJ2ZNnoPAelIXVLsMQk9cVwHoFJzcpSCd7duV0exWEymA7IZc7r8YSid99thGmhy9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFzaCK66TuM+7nR5VLvbKoUuj7/vF2rlRHEKQON2b10=;
 b=ZTurx6VOxnxvYaZJkhK6ImEU0NGbtTyO2LOPdG0CvPBcDbIDWcBTo1/bbqMCFe+hPgJfM5Wjd08MPKPPIb1dJqxzsqqcUg66d9KZNOp705J8CtJFIDSPKtMEKKorDMvneTRkekLahyVYTJd+rlEoh6zv52ql4FJtHbyuA4rOIE/2czrGoEBqLWG/8/fNvieDFsN1ZLn2B7Pd2gPDn8Ac2X7EBJq+hMcuIpXhj/1EBLVFodPTlVGI7jpWIgKy8rMD+HgtLpxJGzbnO5luDiuDNOoQEBeXqxjxZmUYoJmHvFVFONpgbFPz6mr9W/ow4UfUUmzXODCKDXCH0kspptDBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:35 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:35 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 07/10] cell-config: reserve an entry to align jailhouse_system
Date: Fri,  7 Aug 2020 11:06:29 +0800
Message-Id: <20200807030632.28259-8-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:33 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3f724cd-86a6-42f5-ed5f-08d83a7b66b9
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087911851AEC7D05E1841D488490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDBULGWVAuctOB7R77ea2975RFgN783ri9kwW9NDAd15IKKw7M6oF0OOsJL5EsrPtMySlHw4GJThUGlgankXN0B2HWzs3x/Dc8d5figSWbI8IXMmYOgB2zpHd58uc2B58U5DVD2gfp2K+POFLKgAldugj1zhlM0T6QLuQc9OJqkFNF9kgOzcakdVPyp528x0prV9zYFj1nfjdiQbHuZyAlQJS5RFCSejuSCWDeByqQq3BJu481gIU14AxLEX4V0o7jMz+pVsFOnkCEvSYLK+oR/HepwyK0h2HaO3/cyDTzkwk9RdaOaiHotfKu/MBfBGzDhvqqOLi85QaO64q+0WPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ETje/WpAHMfD1n9YGA9DVEF7J5+5OcJi6Ao1MkRxDi5CdNEdvRO5iiFsArl4TR89Ws2OlzzlDQj4RGM4WI5DDisDBpqn9mVMMpYh3ABKPE51prst1gQCBBqppQ+OwOoPseX4/edv2cCJIo9d2xeTRY0aCHh36rt6/9Y76ECWjztTX6iprY3yjcyrClnTvurIeiOb9AC08BQvkGqyuqQqIyQqxslohm/Vp3Pih/qhMiGc+rMvusWQGKp5oi+YZ7DpHq90ju1BdL0IQWPX7t4bVNvTHDLUWad6RNP7sLqAHzeTR9+27aeca7Zztj8NpkEdiDrw/IrCVpjbK6PDuQQ19v7cZR+bfG8DPZ4rAhFmA1me71hKzHD0n+QKVVp7kKWrpfPJr3uLfVyOzHOfnp8wszTpvodsqGxSkICz1TlVyRmFkuVgzVfbfhGziIZEUob0Df3CuU3b+TrxXMePErrYnfwvDsALup2mjFz7U4F/idqvq5WhwEI3XWlKW7654S8XrL1VjTgyKU7g4dPQMlYHPZH26lgewP/L4i9vWBOqsFvZWP8FVZmYwmlVPu6K3k2Z7llabeVeQfGJxLXuLfhK1a3gVo6IJxViAdUK8imtNwZkkj8cUfYSdh+1pbc9VqxfAM2CTNSx8QA5yEKwPvDveQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f724cd-86a6-42f5-ed5f-08d83a7b66b9
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:35.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cbwF+rUnSghQ+oTyjfP0tpRZGcdTO15RT8o+kUGlLoat60+1iitUTc3hP1saQABpSx4XjKC/vux7LuCeYnnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="l6/+8xOW";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.52 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6df4a745..77a61da9 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -309,6 +309,7 @@ struct jailhouse_system {
 	char signature[6];
 	__u16 revision;
 	__u32 flags;
+	__u32 reserved;
 
 	/** Jailhouse's location in memory */
 	struct jailhouse_memory hypervisor_memory;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-8-peng.fan%40nxp.com.
