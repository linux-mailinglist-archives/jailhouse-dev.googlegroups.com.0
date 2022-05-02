Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAH7YCJQMGQED6B2K4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D651517822
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 May 2022 22:30:58 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id k5-20020ac257c5000000b004723f6f25d6sf5477694lfo.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 May 2022 13:30:58 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651523457; cv=pass;
        d=google.com; s=arc-20160816;
        b=LGXz4oySHJBLwzmpp1y2YD94OytJ6BXPUaJKqMZc3jk1AVwC8Ux1ROB0Sd6QhR9NT0
         QVtz56DnXXyJbCXY9lWOj3i4gGi2I3dSLRWMCR5k/UP8AeQHOOg99zk/DCpl0fMc0SvZ
         oYn0Ltqbx1xB80FuqrLQb+cpQm+7lTU1s1GnU8FqulgVua4cRmZ/aIC37yRkWY/8COAt
         YQKMAoICz5iwr3upBFKXCMkCv8TWF6SDb9ug+bHrXzs4ko8P7hlaBtyEKEGeglYHvNuM
         xF/tW1UJ5ZxcJPE/5UOGNZEwe5r3ESxToZIpnDX6T87PCDEyERvYI9S7YCDMYH73jxP3
         MGLg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=W/z+FYE4E+o7eWsIR4DrVMagUQN2UwrKF4c7xI0j7Dk=;
        b=SejJsTPHRQq3L2PSuWyxNi0hPGNMMbKW2Hq6lAtQuX38JA1jja0a/LWXeHnzCXwbL9
         vDo82cMJcOfjRTMS7nQu5wNcK242XQ6UmIqmQD6FAaRMjsCR5ui1MWU13dWDoU2QrTPt
         4tsPXdW3Qy4vUjoM3/R/LrsYUyAcUiqkRLJIQddMIVignzXYY/ARPmjAI8R3XoFjWizO
         BJ5bHDcNonbNvcs0z7voX1hpqZq4COTZq24uStQWPeiuUBQ5rCz8mcVZMfzfaWxhNMtI
         vtuDSniuam8bOFcp1M5q+aSEm7YusBO2JQEZVXYJzI2hMVq6mRJnDY0Jm1AFQCPNhzXQ
         BkOA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rTJkOf8A;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W/z+FYE4E+o7eWsIR4DrVMagUQN2UwrKF4c7xI0j7Dk=;
        b=OVA6qqmEmuuB2bRaai19Fg3EcH3fVNGaxD60rCFyLTGgQA8PGDdSDgEJvaVMmviWDu
         z45jON61qbbvwCvfh19nApG1cR4wslAsZ8Tbe8CLgS32Ax3xjaSenk/TQVZ4HaJpHntt
         iSPuN5d49GXcMVC9+MceUOoKjaN4WsN9L1MMRHB//O9J6YgTu90uaT4v2mZtxSm0clAt
         Zo733H/UdmsRYweUmrPz597EcOH4xVAm8DDAKpB6yXgEodWVtkhu7GUDEWtHeSGFCbWz
         DYqnE4fh3Gq8tpC0DNMRgKT9hOuIEyNfOb3vKSCLWt8GDZqmE1nFyXCUl1qo2pzGjKIq
         JKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=W/z+FYE4E+o7eWsIR4DrVMagUQN2UwrKF4c7xI0j7Dk=;
        b=GXaPG2WNv25h8WKS3HHCg+WNLLlVc18x2TZOP8EY0U3pdjPumtD1ZWrwViHnOEfFEv
         xUeKfWUBHUkDMiiTO2KXLNmVtv7Mu3A/6mvvezxAg29LIzTHP7lwXd3skfcnUBVi89kU
         81ohZJ8ob2Prxrj5FzsWMDx79AT5AziP6HiCOeWPQq254x4ApPvHG2fW7ZsvGk6gvVbe
         deJY8eRTYGUum62maiIE+On9EpO+XkNmV6wxERux6AtMsfr0ra3IjL+0TNZqPfHG3t/O
         IUrRTCm2b7xFP4mgVBTcqa60duHC8WsDXPx431fQo15BNqR1BpnaV2II52HZnTNpIydi
         il7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UZz0z50YUbbug2k6KzDMdzJC6Lf3MHCXsBnYhDeUGc/KobsYJ
	EXInPGF9VRz0z7iOG0QT8Pg=
X-Google-Smtp-Source: ABdhPJyQeAmffvOCDw012BIpk59CPKSIfCFUInG7MPZ0Cq+g7I89O6Lz7BPqS2eMcH7bw6Gmlz7rLA==
X-Received: by 2002:a19:ae0a:0:b0:472:d3e:8312 with SMTP id f10-20020a19ae0a000000b004720d3e8312mr9915631lfc.176.1651523457466;
        Mon, 02 May 2022 13:30:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls1893196lfb.1.gmail; Mon, 02 May 2022
 13:30:55 -0700 (PDT)
X-Received: by 2002:ac2:5616:0:b0:445:7115:41af with SMTP id v22-20020ac25616000000b00445711541afmr9853854lfd.242.1651523455607;
        Mon, 02 May 2022 13:30:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651523455; cv=pass;
        d=google.com; s=arc-20160816;
        b=luCAUyoYydha3GjHNyatIs48RyaAyCqx8/TcK3D1Y3iroiAx48eCS9Tn2Lvnrhgmny
         QNN1YrZ74zPStb1u6XvEYsFsCywW22VC1hvX+vzFHh/478s8g9DB9JdtZMYe6sLOx8AX
         qFp7MswYQUSRLI/NXSgppLmz/lstf74kGXRUlfC7oNH6wULibhv9BmNvHZHO+Vu+Zuan
         PLqGeRKL//W789PPbt8fQyaIb4JTbnLYdfC4EBieybGA0jNpHnqcmDzJvCIPj8rLC8v5
         u7KSwO/cVUX76Pf/GKXi/LcAihzoilNnEOBTKsCBtfdjw935ASfjppxqpq4eEmItxG7n
         Cxdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ibOEdwvFU8TCnkuL0ooMg8XpPOSisAhDGu2leBPNjcA=;
        b=boDrSbNEndiPUfZpb8NdsoetxY60S0u6oWl+jUrcvetehMxQSJ/snGWO2mUDzbPoeS
         AG9HoNKKibFBWT+Z21rQW/5KGpIGPw75HygznIXPsd56TLZ4HYjGh+7/VJUeapv3bK0H
         ywvmQTPDD6Xr4bGabE65jWIBbpaCQRZXVO1my25FBrozZsKK2lfEdZCjgPMrGPjb11nU
         tZ2IZ0EZ/MkK88oeEruMkWtis/14p9R+j7WHeDnEsFCa+OSt77wvx4LQW9ZRJ/n2MKii
         8o/tSL1xrGjSgT3aIDLWN+AEH6Q0dLRPU5ChdJK+WbhIB1VX8FAY8ZstdGoz45RoCurj
         JU9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rTJkOf8A;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0624.outbound.protection.outlook.com. [2a01:111:f400:fe0d::624])
        by gmr-mx.google.com with ESMTPS id i18-20020a2e8652000000b0024f1cf9b1b0si699071ljj.4.2022.05.02.13.30.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 May 2022 13:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) client-ip=2a01:111:f400:fe0d::624;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C91HdmtlUqU1kGuZvdajGHKtNBQNQICfg4Ob7NA+pplUEPVvAB0lXSAzDqMQGw4gFqvwIP8N6tD4afE6HubHuDXe7j88WXjFEQ8Ex64RQ/FRbuNGU67NP6xODy8qtLgP0J2GC6GYczbhi92CIEWF+kEA4E3BIN6bbTGelavABh7eD8wW3JsFH0yF4P/YXBiHow3CVfGzQEZFLejGE+daZ3Enctackw0Z4Ne9BXr/Sz/0orkOp1fsAFAAR232THL7NSOwsYNsIGWb8AaNdlS25TkPidahdos2hn2s2cRAYGJkgzZw5n4sJOLxSrPbYdkVzzuPWvh0HUUDuPRsVlBlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibOEdwvFU8TCnkuL0ooMg8XpPOSisAhDGu2leBPNjcA=;
 b=fJKG+JqfoQL3XuuXRcrLhEAH/vifVIJyLUH6ek6oUUQ2+aYRmULwc0F9UY5WEItNCotIY74/LhM9jGtRx6zRFZm5qR/eefUfFAKKITTmd6Yg1kqbfvuiPjn/54wk+z3tD56tdttjIgRnQmokWb06N+bYKTPeZA0S5fz+mTCau49R0Jby1smnbfhVu88JZ9tf2Ab0o2T6G1fz2AIbc/5oQaqkc/iSm43t8h7rLjzUIKne2TljdzfqhObNOdIZG1nzxUv9T3kN1fk5BvnZRXyZ9DB021Ym6/Cl+OO+8hOVK+u2Tgd8Kj506jz6hCmaaKnzszbYo4ewvXANCtVL+LiXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0063.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::14)
 by HE1PR10MB1660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:5b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Mon, 2 May
 2022 20:30:53 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::5c) by SV0P279CA0063.outlook.office365.com
 (2603:10a6:f10:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Mon, 2 May 2022 20:30:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT026.mail.protection.outlook.com (10.152.0.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 20:30:52 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 22:30:52 +0200
Received: from [167.87.0.8] (167.87.0.8) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 22:30:51 +0200
Message-ID: <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com>
Date: Mon, 2 May 2022 22:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Linux and u-boot requirements
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Chris Paterson
	<Chris.Paterson2@renesas.com>
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
 <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com>
 <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.8]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--16.064200-8.000000
X-TMASE-MatchedRID: rSftH29dIPQcVCnVYxXFYTIFZZ/h7RBsYlldA0POS1L2b09s2KGDsAvx
	MaV6x4s8P4XE9vEibPJ+Nx1ftYxL8ON+5GlMXaHaKTY9WI32fF7tt0HEL3BUV/9N7e3lwkwbT5y
	sQDj6eFljjMm9SMavFUOcZvtoHDbzlZ0sk4gt6l/cVWmwGGP0Yqn7cUty5471/sUSFaCjTLyByx
	Vkfd04JFVNpk8Y6QvT/A/VIcnVRfkNSKqlwWMV1ouFKnm6AqrGlwt7DABrvp8f0eUint9QEaVjg
	XyvS9c/ZQObFuTKgicS5LnfGo4vrYw1TMOkyb7hGfg0OssCsfIx4g+7LKrJbPIq3+8DQd0oEAIm
	HgFYA95tdg+kv5rLUmNokeyvFnLM29CrCYLj1WI/VLbzWuWlm8obPoJ0HIwC8rQKMAEu2BUPo0v
	i0aZfNcXJpbpgV7oR7Ofp4TaCvCcdoA4bczXHCCvzbaOs1ugIbOvFTJniqDEOOK9P8WgPzYIXoa
	QH2H4PNHnUSRfk5GTtZ4DZVrT18mweKwY5dx2b6JvL/XA5QkaFmMEVwi+q3Xuh89GaUm+XDC/wb
	1J8WjP+Aw16GgqpO3ZQrrFTqfg/HoBO8Fq+OBe1BOUIN4s96YuBeCEZUtCSUyxW4vmvLt0ujMj6
	uE1hubbMVaqtU3gFXjesFOd0pM7i8zVgXoAltkWL4rBlm20vt7DW3B48kkHdB/CxWTRRu/n4aj7
	/C8POgC6xQCp1XMrCtr57qiQwAXR3V4KhGZS/bqHS+9I+zCaWyH4a4kb+FQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.064200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: EF49152C960962BFA6C6C31F79AE5B07D117721D3227F72D3D55B90E43617EC92000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a17a16b1-4568-46ff-7478-08da2c7aa749
X-MS-TrafficTypeDiagnostic: HE1PR10MB1660:EE_
X-Microsoft-Antispam-PRVS: <HE1PR10MB1660A948D25720A43430F66195C19@HE1PR10MB1660.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCpmXm6RpWSTdMPCVYcW1j416Mq/D8H0jI1mRWKOneflw1/9FtjzPrh1ZNRiiCtjkJ23D2fiYxroVpBIOIh6+Pae4FH8b2Ro/Nw24aCRrjCy4PzGJbQkTBE7sEl3QLCnhvDClvGOeir6hwkxXczAcgB2sLLlNFKn7ZIy+WHN0qOhMBVnS368mmutbiKRkVMIk1L28U7xb9jIm5RFHoN0lJSYcnovk6aT2nyOOM8qKlrhuKaRoHgJGamutrYB5oJ5LFjBTXffWmrB9dwPgb7tnfM2urCXKIsvEGGB3Ac/7V+LxiCs3n0Ml/v1+DhwmZ66WJLGvfxdIQ6odmYx7OIsEGePhKav155TRa8SSLxekb3wTxTUqA7WzEzz0tM7jbG33+S5om3GR/2GxnBPWXEkZQaBYC6QD1u9svXF8nuJupyzNhAon8ZBFxzekzXkKgyMBjy0BUvLMvdnYkv0UKCgxMWMKbdkhbBb75gx0+0SlR7mjrsmVtMoeAidfb3bGLt16HCkVHWfLswwgPPEobskeOvNMuGVEdoxfz/TrJMvMVTZLj9tIcGTYjLsluOWjtxSMng6wj9OG83XykFZFSqz07iH2QMlOTE3jewAal4loZpQ/ozIYGeVo6X8RosrGmhg2RUnOkpBqBmUjhPRnT4n4PzyZIZDDqVwboeFmkBvhovsBIjri5uVvN9uWxRqR3nIabo2nXqFcKAxGuVgW9p32OE9x26dJ8vJppHCrQuEqHDMB731BWeAwPInHmo+W5iapexZO58l49b906/JykFkjITbaARJuTskJw/1t/Uu+S9zkY/FWrHY54Yq4wC3Hj3XYeWDRW6SkD2/moFvMClWPpkS04vr7j/HXG/skLDkDFk=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(356005)(82960400001)(86362001)(31696002)(40460700003)(81166007)(36860700001)(44832011)(3480700007)(82310400005)(966005)(31686004)(26005)(316002)(70586007)(508600001)(6916009)(36756003)(53546011)(6706004)(4326008)(54906003)(16576012)(8676002)(70206006)(2906002)(8936002)(2616005)(956004)(47076005)(336012)(186003)(16526019)(83380400001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 20:30:52.9826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17a16b1-4568-46ff-7478-08da2c7aa749
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1660
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=rTJkOf8A;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi Prabhakar, hi Chris,

ok, now I understand your question last Thursday, Chris... ;)

On 02.05.22 21:37, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 27.04.22 15:19, Prabhakar Lad wrote:
>>> Hi All,
>>>
>>> I recently tried to build the v0.12 tag with the upstream kernel
>>> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
>>> (cpu_up/cpu_down mainly).
>>
>> You want to use master or even next for very recent kernels. I haven't
>> done a release in a too-long-while, so patches to account for kernel
>> changes can only be found there.
>>
> I see. I came across the linux [0] tree which has
> jailhouse-enabling/x.x branches. Is this a good starting point for
> Linux? These branches merge Linux releases into the jailhouse kernel
> which makes it a bit difficult to track the changes specifically made
> to jailhouse. For example, for the 4.19 branch it's currently on
> v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
> a bit difficult.

Not at all:

git log --no-merges --oneline v4.19.81..jailhouse-enabling/4.19

The 4.19 branch was retired a while ago, so rebasing over latest stable
or merging that in would definitely be recommended. Actually, you likely
want to check the latest enabling branch or [1] for updates since 4.19
was retired.

> 
>>>
>>> So I wanted to check what are the strict requirements for Linux and
>>> u-boot as I plan to add new arm64 platform.
>>>
>>> Also is there any document/link that I can refer to porting on new platform?
>>
>> No written documents, but if you follow the commit history of
>> https://github.com/siemens/jailhouse-images you can see how new targets
>> were hooked up there (mostly Jailhouse-unrelated integration work).
>> Jailhouse also does not depend on U-Boot, first of all only a working
>> Linux / firmware integration, ideally from upstream.
>>
> I see the tf-a and u-boot do point to upstream with some tiny patches.
> For example, for xilinx SDEI is enabled in TF-A. Is this required?
> (I'm still reading through the docs so this nooby question!)

SDEI is an optimization for interrupt delivery. Not needed, just faster.

> 
>> Which SoC are you targeting?
>>
> My plan is to start with the Renesas RZ/V2L SoC (cortex a55 with
> gic-v3), but will soon switch over to the Renesas RZ/G2M SoC (cortex
> a57 with gic-400).
>

I see.

The key steps in enabling will be
 - getting the patches applied to a tree that supports your board
 - writing a simple config (there is no "config create" on ARM, but you
   can more easily start with passing everything through)
 - jailhhouse config check
 - debugging remaining violations when starting Jailhouse
 - writing/adjusting non-root cell configs (for the pattern of recent
   enablings)

Jan

[1]
https://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aebdee8e-4074-b223-2cbe-42564624e7f6%40siemens.com.
