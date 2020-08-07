Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBYX6WL4QKGQECMSJ2MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72C23E5F5
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Aug 2020 04:41:38 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id m7sf149752wrb.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Aug 2020 19:41:38 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1596768098; cv=pass;
        d=google.com; s=arc-20160816;
        b=tWUL2b/fbvJ74wvz4tnpKQ32U/gJKA5Y4vQlhDStjBjI9rbWn6pvnUTlF8tKQXxN/Z
         7Kky0Lp+BH4+0UfZKIMXyrWWhcTD5y3a4jzJK5sCO/+pVmv9hU1YOVnJIPnTeATCdJMw
         09G43xsqYo4QpPrp+5S1bx9pQOJe1bfEI94foErDvn1WnoDzNIlR/vBDdoL3jxToeR4B
         pKtPL+ulk89JiTJNWbqyec4KN+Ol0ZeqQnnscDq6JC4Wet7sIaTai4ykIeMN05PXpCxr
         qtcN8SrQ66FrdymmYMfALkppWpvOEtSM15gPQdjn0h/ZQ/bSCrQYCHHA+YDla0IMUGNF
         Mv6g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=JNKPljwZy4rMo1qbb7e+j9Or83En1WC2HpNg+dnwWjo=;
        b=gVsIid9ZH8N9L9EQA47gmP8ZV/azw55tscWQw0nuT+Cc1HpwhvSzYa+DTTty3ANqVb
         Pr3uU6OpOPxAe3VE4R2SNcpNyenntix6h3DfvJRLk/pUTCYsD0xSGdozuZ+OB9aGhtam
         0cB5gIA6KtPiH+pG1lzY5gGDjp7XTZmdOMZsv3kfjOXEUY71Vt7Vn4Bm7/eZYxfQSEc3
         +9Oc3xW3kCQcuXuGbNJ8GZFM1P35l4LUVuOledLbUxQRxGG7aUb1LDQI4AbnGeYcGfs5
         ZTYkVjFz9QDLBPXjzuyZtw/eBT1E+3vExzC7q/Ct4hgdHMBkFSkB0VhR1tYu70c5kUTB
         aiHg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TAUfurqv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JNKPljwZy4rMo1qbb7e+j9Or83En1WC2HpNg+dnwWjo=;
        b=mXhlUD4yUKk5O9DwZBsbkkLGDJZxmANPIjTFeOoy4CpjLQAHyE0feaB/E2aWoM7mc+
         Jk8lIvv/5rIQpHoVZ0Phu2uSkNyTSZxQWukLeTDrrqeYeIYh9VeP94Ru7aoM/yK/i6Kr
         EqONkFA4fZWgXZMve8RspFgPupKgDfwWxxqH0PBnc9mD3qpCHLImubuXUeV0RevTBrxE
         zqtDHLysFvG+NFAodLJI+YwP5VklV4R2XtRphxZrf0GcYqLiGI76ScagfqgKp2NkrqJm
         pCJhyrIhKck3DJBSqLyd1RJ1syerRos6zaIYMzFxEHSn37XAlqIq/As0oB7ILMgUnkUH
         eXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JNKPljwZy4rMo1qbb7e+j9Or83En1WC2HpNg+dnwWjo=;
        b=FblZd9tlqj48LhpIDXk2TqG50TU7vnTGLiprFcKGgxwPqj5W2dnflBBqec9TW/cFAm
         eMZObz/d5OyH4K/RopQHPkhPZ+ZNFA409R4OYC1UnERpFnNANS/5Xj7LAvsWjIXFz7e0
         ZPUrwd8pYF2ExVIzr+roAIMJeLlYPp5wkswkhg3+c9LyxQQzMWX6xLrb8xAJbz4FBHzl
         GoGDfErSJdu4jQBZT3DKKVe0RjBe9WjD4M6j8/vSvb0gK9+nOEe05ITkOB6qogEM67BK
         xytgwwtO4oTauAC5tpikPcom60iSk/rGD199Jf2E576hlldFwiAe2HKJbQWFctpNZOT1
         0a1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IXkLPhP+Q98dgiBIyc1cO1i9HWmmog7GDBx7ry7tpRXYY2oaK
	kRPPvr8p3iD7tW+f2u9NmSA=
X-Google-Smtp-Source: ABdhPJzOxHu9deQDf1rDl7M5iqD+ILuqB9nfj9xw94jhNdxlHn7I0rn2aW60P/f6ScuNEhyuMVZrRQ==
X-Received: by 2002:a1c:770c:: with SMTP id t12mr11200854wmi.65.1596768098717;
        Thu, 06 Aug 2020 19:41:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a3ca:: with SMTP id m10ls2480424wrb.1.gmail; Thu, 06 Aug
 2020 19:41:38 -0700 (PDT)
X-Received: by 2002:adf:9591:: with SMTP id p17mr10385941wrp.237.1596768098349;
        Thu, 06 Aug 2020 19:41:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596768098; cv=pass;
        d=google.com; s=arc-20160816;
        b=axugxfiMFnluASbaIAUPpqQ8/CyFd4jWebMQNhVLFXR/8ZuJJKH9TZpxVtXzxZXtvD
         8izpPV6ldnmDVP4UTSVqbZNNbI7tftiahdtDH6GCVd4fqZJl0L7ra+Tzi/K/rixCR6ys
         KXzapnnEOqyQOUpBdaAQAutDP7dBCg/QzbSGx890TSrmy3l/IC4ktZGJwc5vlnMy3Zla
         +YnF0R47/du15U0GTkLcAJznmE8RJz4KX0MW6jfJ74sufCVZqM2s+kqXZ3b4OSKYN5I4
         e1V2B2Zq5i20yU5XO8rHeLHYAkpjP6GvXTtmWAqgLJOR6gcLDHuKH7oLwpmphigvAz8E
         hrtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cEe00nYfjIZeJF+rteDYKGVjGfMr0RiBUlfH67hw5lY=;
        b=KzZODMGvihWooBPNJAFiLAb3PnCw63rWGj/rbBS2C+PINVvEKYMXBkcSRFn7HpqIsu
         0hk9p3Q254ABnnxvA+KRaqI862iOtHZJetzAcLOyATYUPDax/RdwuD42m2P33ohInq1Q
         C3CUI8h8sF7X/q+Qsqb7stn/aVgTz0DLkGA1VoKPLWOLQlWoeAzR/XG5blCxks24tnnH
         51XcjIMnJziN6XJehaDSxJqiL4fPhNW7Evcx+08schVX99FhSynwQHKL2KmrUE6XBzfB
         IkB6kVxfcPyn+EE0hMXMIy4FM0ssqnPSzoHWhu6ZMaWwS9yLNl1MFdJrhCT2xUYYjzCY
         9OLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TAUfurqv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150083.outbound.protection.outlook.com. [40.107.15.83])
        by gmr-mx.google.com with ESMTPS id m3si404250wme.0.2020.08.06.19.41.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 19:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.15.83 as permitted sender) client-ip=40.107.15.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lvwhwY2Wn+02LYFSaUbtFWuIXm7O9oFZrbELsGDK+99ucdsOS4F+V3lEvZC/CVbqMUjWl8uFNKBE5JJtSrIxtMuVYrjZpnmqU5iLKFMOuLdhVU8gLjqWFjCzh94i6pJ3qeOvRusuYx3FZ6lW207jF7Dsm22xgKLPx1aSglplUJAltr92Ym00or6akDyhTHo1pt2JnTuP8/aoUfKI3dGb7BgKe+hM8xghWaFScb1W4+AvK1ED7UW2DQzoRILGz3ByAh/ZV5PXXWW7pZhTUAqAucw/40bC4s6uVggXSrwWZgFwr2viCJmqR0LUKYfq9WqUkHUOwOUsvKZGUukiBePZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEe00nYfjIZeJF+rteDYKGVjGfMr0RiBUlfH67hw5lY=;
 b=Q7ilfQJcdSMov3KrvqutpDMCtwXd8nHtiWLnM4R72aG17B2sfEdBiGvSXWB7fdxil+T2a7LdOEhDcXjwyP76npYGSy6+gnAdMz8abFOm5whHSYzSd+nOxK2ezVz2kUb1aDp4kuLevKBx69oG8cfFEPzZnHkdyRlwSa20pdXAEqv6izGUhXsM51uIZlQrLK1TNK644Q6C0aE8Ib3XoqMfkW4+1DSKlrDTUrKH0utBBdKg8sJzYbIrjAkSc6XgZc7fG2PMcmBB5fWm/dgOjGhRFHEzWp0FdVpI1FGZ7bgJbsn5x9vVVx8Pw4hvbZitn8a8J0C1cN0EcvSyz+J9zhp6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB4087.eurprd04.prod.outlook.com
 (2603:10a6:209:4d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 02:41:37 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 02:41:37 +0000
From: peng.fan@nxp.com
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com,
	alice.guo@nxp.com,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
Date: Fri,  7 Aug 2020 11:06:30 +0800
Message-Id: <20200807030632.28259-9-peng.fan@nxp.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200807030632.28259-1-peng.fan@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31)
 To AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGBP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 02:41:35 +0000
X-Mailer: git-send-email 2.16.4
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b4e5bec-ccb8-4623-4494-08d83a7b67f4
X-MS-TrafficTypeDiagnostic: AM6PR04MB4087:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4087E0EF24BBCBAFE7297AD688490@AM6PR04MB4087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TI+K1Bno8o5xNkQmnTl4R7G4VEWgjo0o8WNchLNkMDBtLsVu5qrxizPxINurP1LQg3OBq4rETiglYqwocycWsBK/hERio0Dd4w7Psx6Qy/JuVWQmXuF6mxo8desqrAHuXppkEdPgc2XgZ0A/SvHaPVvhS3OTpX/62c+wfzAR7vY8KXbt5RVO8l60o4ztGds5ZNNtTAyDalmSSUS5b2DbwTpmua0fOGbqA3dyZgFg8XVZokjWMI16COXZ6jtXJ3Zh4iHUUp9B4upxZ4y1GzLh2C70rI+e65VU7K/BEDr6Br5J1x/auzlQ/g/J89R7yEKqPLnjKkUbnhMZwZ4uCi75AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(52116002)(478600001)(6916009)(1076003)(6506007)(83380400001)(9686003)(6512007)(6666004)(8936002)(66946007)(66556008)(66476007)(2906002)(16526019)(26005)(956004)(2616005)(4326008)(5660300002)(316002)(36756003)(86362001)(186003)(4744005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: m6wmyPJV1/eMpq9E3HGGFsvEw9qHPTWiMOxb2u92SjMnLvY2sxMkrBdmr7TLUKXiiuiOwbIv3NhDvmTUtdxQBnTLNN7i02k2Z2i6boNOTpSkfsqhgOAkGXy0KAFvFU5kmlHYOq2kcAkxQQ2epEnBtvuSirWkV3jO2bi151yMQPpdqo38pL34jQEpaP+yw6n0Tsv+g0EhB0/wcaqdl0LE+mk8CXQhxZVkE7apVvZQDmeCt67PiXJdTxKPbqGQLjnVjmM/O5Gw1tgE9FzdruCNgB+UtrAtC01B4SQaVj87uPS/2DTAV5iss8FSmKaLLGYvT5HGBLHW8xsYwBKcFo84/RtMHn7eF8BRS9P4DaCCuEl1XK5+evfjtGICUNg+xHIswY4dtHs+hQAlif3hZELdNXjc87TM1O0gdEzcf0ziOE3WzmmvVUgPXL0Eu8CMr8KYUpZDowFbqFH4HFdnqbVp9zsxXIr1AhRtb3cdxXpF/S6NFReSQjwn28h4oW0yZxcXIVow1YTgRo/AbPbbSqYmkswPUJ7AuLirWo1UwvekgWtouwo+hk9hsEaElV3japGlidZeCRbrtTxp0mFIZj8k0mwrlR/JC86hzuiUMSy4wiy8jP2tSXplRJuAlMK6FXkp/JL19Eqqz+Y7iso1ay1UBg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4e5bec-ccb8-4623-4494-08d83a7b67f4
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 02:41:37.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LASdInbWdnUQIh2Lv7jddYzzHdVLR79miz4hYQ16CDlPklYyzEa0SJevgnvxQlCTdX820RCBPUQ92Akc1SpSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4087
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=TAUfurqv;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.15.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

bit23 is SPAN, not reserved bit.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm64/include/asm/sysregs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index 0105b109..a7370373 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -64,7 +64,7 @@
 #define SCTLR_EE_BIT	(1 << 25)
 #define SCTLR_UCI_BIT	(1 << 26)
 
-#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (3 << 22) | (3 << 28))
+#define SCTLR_EL1_RES1	((1 << 11) | (1 << 20) | (1 << 22) | (3 << 28))
 #define SCTLR_EL2_RES1	((3 << 4) | (1 << 11) | (1 << 16) | (1 << 18)	\
 			| (3 << 22) | (3 << 28))
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200807030632.28259-9-peng.fan%40nxp.com.
