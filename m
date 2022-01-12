Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMPO7GHAMGQELKPWN6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 2400048BEA1
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 07:37:39 +0100 (CET)
Received: by mail-qv1-xf39.google.com with SMTP id 5-20020a05621420a500b00418562c923bsf1613106qvd.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jan 2022 22:37:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1641969458; cv=pass;
        d=google.com; s=arc-20160816;
        b=NloQsKWb75Hv9KVA4Ec0XIvj45NE3deE3lP2Ipy47c5INFziHAJ89gbCwCjLdfkKC2
         qVIyy/fNpL+6hoJ7nJX0HZxGf50J9XTIi1DKs1Q0I2+mBx7dYGWDqD1IHMwQg78jszwV
         cIuvilDzdr2gFwHeUUZ7dqZoDJwtHZgICbn14aZ9/VH5pyiRQd+xcZWuTvizuVsUwBqq
         8QBqy83S8ZKeQuq6X/vawk72EWHygpXPiYw4CgR9FiRmr6m2UPQAHOtyaKRPYqzRm5XC
         3dBWeYkYi3inIjGF81uhEr8lmEljcX8a9nK/Q4//35PhvpGN7AhnXsHRywGY7QjF4DSp
         DfWg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=QkwqoxXmYB+Ev2XIXCk4NeJ9h74nxoPpCqVuGZ7EPzI=;
        b=abaw/IiDAoqpyzMPAy9V8GvPkE/dIYe9BTLsMloRMtEixUXfSTrr9GM5g8V8tcMEwj
         EnkjrZLtGPFVGwhsL2o+gvZ8xqVfu+s9/Ll0YF7ob4XFkq27tNGsFySXw0vSVMb3zL6g
         QY0f8lv38YmcsksXf8oTW+FpRu/UACLBgvMg3hiYe3BPN2gM5ZUjgeQhDk81nYCgNQ+a
         UjI8a7Y6ghx/oQ42roKH9pgAmkOEltL5raUb8l7s0w2zxK6iKKyVNq0CPJPe7BMBU1Wo
         UdHc0dkTAJ6E0s4tq5v6xxtlBIpcP2GD1wM2zPYd9LoZ3402qXpwKiPxOesbt+Z7Deui
         3O1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hgsmk8t5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QkwqoxXmYB+Ev2XIXCk4NeJ9h74nxoPpCqVuGZ7EPzI=;
        b=b3n06cz615BEerDvNQGkRtIQ80HSpe6KHv+yONcNYPmKY8puC6Yisoxn0fgPBYwQ6G
         2wQaIaea4vEYnXkhJyLq37uyT4XBrfcj9QZcLomZ0Ei+1cYoIUzs/Q3zbqQ1g3SepF5S
         hrGQQrtuaSpP9RKCMqKdKnFuA5s2W9LTXaOtjKxDeySnHGOtueqLLlKukHQ1agH+uYnO
         SdtqWKTA+JoEAKliSgKNB4EVooiXiF1Bj8HUyAi35WCiB4+wWuNb6blsNGYU+DNmvKKs
         u5G86+ejC/zcTudyusd7rShRZ5MagH6TyWKqwvi/4PSYMw1x5I7f3PJctZUlIapKeZiZ
         6+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QkwqoxXmYB+Ev2XIXCk4NeJ9h74nxoPpCqVuGZ7EPzI=;
        b=tssvp7N7NB9MzKsOQh2U0pP2jnQWI2/NObnfaoj5Dw0N0k0/AxXF0MmVULtOeuIsyP
         fIIUwELfOf4mh4z8Gmu7Z0VU+h/3L6n5harss4OVkZAcb4W4PI1+Zeh/47/G0gVfCBrj
         0n7xwhn0LS7gfld86ZEq4JorvGbtUYTYA1Da+EAZtcTU+9HxfE+L8eV7OvYKSLsmPCdf
         G0BEQ831A0P+EVjAUroeAvP5lv96xne82Pg4KcagXPJq/GQoF159R2ufC6uKN7MwVmhT
         WWve5aPkSian5JUjj2GR56Ne2AmOYqa2FVHvZ0fXn/++y9OvX9EFHwv27LFIxMiesxkV
         UGxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Foyl05XmljCP05L8IEv35BeSVbr4CVZ6wQo9/lFxCPkGICZRT
	QxqbSctXMQqaBHGnwkEl+fc=
X-Google-Smtp-Source: ABdhPJy3lxrRNKkeq9bXO/PCv88DJ8EQeHMxBHkBfj5QSRhSSB1MKmLDuvh6bQa2v3my2rqZK8x4yA==
X-Received: by 2002:ad4:5961:: with SMTP id eq1mr6878968qvb.110.1641969457995;
        Tue, 11 Jan 2022 22:37:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:e852:: with SMTP id l18ls2906125qvo.10.gmail; Tue, 11
 Jan 2022 22:37:37 -0800 (PST)
X-Received: by 2002:a05:6214:27cf:: with SMTP id ge15mr7011448qvb.129.1641969457634;
        Tue, 11 Jan 2022 22:37:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641969457; cv=pass;
        d=google.com; s=arc-20160816;
        b=FKq3rzycjeS4fPlS+z6jTLX4MixJLObALUKzT6mMGYShgxbpp36ky67LWU7CAcBskF
         zFLmsI8Zs/QUrOk1rzDK5gaNWMZDijGieNARFo0MdhyrP7I3Qhpkydt+mLsudnu5dQuY
         OLMCyfwB/1epQnJUrDrw2zOMYxoKdb+rAFkpj4PEVMfc/iElrKBQmqRgbajXnmSXKzgr
         D0yWdSY8XDUw3lGJew4RLEgF4KgRv5rgkVbr+5PRGKgCF4CTLt2A03OkiB52fjdD8enJ
         mzArHfvca2vNRboWSAkWd0NVjdiLGZQnufckD1qZz09fmqfmYz7jt9XaOUdl8tjUFPhn
         r7Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ad7pwYY/LDDbw6GbDYvOdvC9Z9jWfsEks25Z8+FB1Kc=;
        b=tRMzrmU6Aow7/Q4KI4yDW+tceElt4UjoG6dH+7FzpOD0qja/Yno7JIbbPo7avIFkAN
         4AYx+goLS2Ob6aLCTRAt8ZNTwko1rm58hzfZ4jjJwjjq93azFbFCGef9iyu6x/3Tkw+5
         q7RGIlPyNfrcfX9CUJibrrlId/j4g249UkHBe8kpDNtACeiy11Og/MGuGx5twK9VnhgR
         qJ/JSKu5mmZmiH9KdZ7y9svcmyF2btxVsq/Bh0uZl+Nl3wwb8snjnuFl/WI/t39Knn8l
         HihNAjqVlIF7eoqLdVTSyUr8IV9D4hcYFmbO6CE2J4maAv049d94Q0CJ/jwiVaYWQ4qb
         hIHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hgsmk8t5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20601.outbound.protection.outlook.com. [2a01:111:f400:7e1a::601])
        by gmr-mx.google.com with ESMTPS id 22si699486qty.4.2022.01.11.22.37.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jan 2022 22:37:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::601 as permitted sender) client-ip=2a01:111:f400:7e1a::601;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByW9JXS1HgyexwLyQBGa1uFPe+TrAl92vKdci/bK1q1ZlsYHGrWG93/7k9cht7p8qkfReg7cTf2+KMmE5e5ZlkauN/ad5+YZB0vfy6uM8PkoQ1xxiUq4ecM94skh45NlHwtA0I7B7y9sVkexL5210UdKBn1auoE7mV8NWcl3W/e9tazEgLn4Ch8hyYdF2Ie2UGeowTQNpiaSIVu4RotNJUUOUtYbAo4+uOGJ82yHKbO0pgfhBTx2ZEqOEmIZ+st9uRkj3sadbvYzzaPuEdnVO8+ljbDAO+jRm4pcm2If98rH+ZYx2Kenc9wfSLuQkgClIm7aIfC4nzwdVVDtbQcytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ad7pwYY/LDDbw6GbDYvOdvC9Z9jWfsEks25Z8+FB1Kc=;
 b=DE2oVzc6pD5AqASWaCM7s/2L/AVObv3Lpfp8r6wyKmoV5rJw6UC9xsaFyLvxbIZDrfTzs7T8Z3Mpx4pkkhKWrRRSSHn479t9y9uxpAihNrE3qUqTvqevdAPcDcGcDMtjJBQfi24TKKRnpQnYAD6kRIQqP5y7OYTtPLlaHS2ulNgiMt/bxcqcYv7Jj22ALSKzJZoL2961YvyNTpO49dqiOJnu9ybNvXrCwPVtiJPL2X070FDK6rR+XPoOgEDnCbPkXwDuMfD64Yrn5WT5HmDhHXmSpOLavta+OQvKuE0MPkIP5gKF5W9r1XkVuJHnMoMdssIbX3p5YGfvTkdkOR73ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0013.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::18)
 by AM6PR10MB1894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:34::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Wed, 12 Jan
 2022 06:37:35 +0000
Received: from HE1EUR01FT003.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::93) by SV0P279CA0013.outlook.office365.com
 (2603:10a6:f10:11::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Wed, 12 Jan 2022 06:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT003.mail.protection.outlook.com (10.152.0.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Wed, 12 Jan 2022 06:37:34 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 07:37:34 +0100
Received: from [139.22.143.158] (139.22.143.158) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 12 Jan 2022 07:37:32 +0100
Message-ID: <fc104832-1a03-5d06-f12f-dd34bdb2fe60@siemens.com>
Date: Wed, 12 Jan 2022 07:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hypervisor: arm/arm64: fix build error
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220112065619.19432-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.143.158]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5f8ca7e-4b42-4402-1d70-08d9d59604b9
X-MS-TrafficTypeDiagnostic: AM6PR10MB1894:EE_
X-Microsoft-Antispam-PRVS: <AM6PR10MB189465980935A74EA984980595529@AM6PR10MB1894.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEEFmNwsT4/aL3QUvnCrhkqh+ut6LyJQBisG5oZRj+btW8MN/z4MXrKata3C5iMq4t46Z4RKFy7kyYg8AYCIqgTyyzu6dQHko4KhQmCmp4BbeiGm75IKYX50H6V9WBdmFNU5WnAXw5DhYnj7tEhjHh9K9zEwfwYxlLqRmzoUV8rk+2AWtJiL5N0zlh01zKBTth+scjOxtGBm3A7Lwm4imcMeLJvA5kTTxmPAaXkufBwe74j7Ji95Y+BtUoGxMWqez8shlozznXBwqss5YuA0fXOtkCqcEYB9nSYbPAK3j1iETGS6vJP87XjNZY4W3O68ljwuAbtDiG9uO3O74GQHy+xSTIj2znoofKw8e+EPU+Ia9QkYWDKZyEh9fXSsM8e192RS1cJyqfzQPp6qetqFSMmV33VCdjlhODSws78J4SuD8+LlTntaoumJ6WOk739pPpp7uWe1XjFNOExktji0UD8kbS50BYGoXoxdnu0+puv7Zg2L8v5NIvb8iiFblXHNaPNCp1Ja5H4TgNB0vFa9wibUXs5dZiat4GTgITc7nIoc4XArpsZVsPmeLoBEQMN3GbiYj22PufItxybGU3AFEBCF2mYUeiAh9juRiTc1Py3Tyw/TT/K0nODx0gYqvU0Z+LlIwxq2+00GmGn4BdsNrkSN+K/ODKelD9Nkbs6sAqac4nMjFlS7/zJPHCcrxF4a2ezqMvEyga8qgGfsP7R0Fz/NKAfQ8ANMvmsfm9uIfp61NC+VGt94dVBzZMR9p3zjHriMMOhglsMOaqgA2tnaY9jpz990yFW91JTAm7og58o9BytesTaJCJ8/lh9oWeZ92HAhHympiwM+M+lyda2/oQ==
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(336012)(44832011)(82960400001)(70206006)(70586007)(53546011)(6706004)(6666004)(316002)(4326008)(7636003)(356005)(2616005)(956004)(47076005)(7596003)(86362001)(31686004)(16576012)(36860700001)(16526019)(2906002)(110136005)(5660300002)(36756003)(82310400004)(26005)(83380400001)(186003)(40460700001)(508600001)(8936002)(31696002)(8676002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 06:37:34.9749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f8ca7e-4b42-4402-1d70-08d9d59604b9
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT003.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB1894
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hgsmk8t5;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 12.01.22 07:56, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> With gcc 5.15, met the following error

Which gcc version (surely not "5.15") from which distro? I've tried with=20
manually adding -Werror=3Darray-bounds to the build and using gcc-10.3.1,=
=20
but this message didn't trigger.

>=20
> hypervisor/arch/arm64/control.c:33:9:
> error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0, =
0] [-Werror=3Darray-bounds]
>     33 |         memset(&this_cpu_data()->guest_regs, 0, sizeof(union reg=
isters));
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Fix this by use a volatile pointer to keep GCC from determining its value
>=20

Do we something wrong here, or did the kernel, e.g., had to work around=20
such issues as well? The workaround looks a bit odd.

Jan

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   hypervisor/arch/arm/control.c   | 3 ++-
>   hypervisor/arch/arm64/control.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.=
c
> index 46125e1a..c9c93982 100644
> --- a/hypervisor/arch/arm/control.c
> +++ b/hypervisor/arch/arm/control.c
> @@ -23,9 +23,10 @@
>   void arm_cpu_reset(unsigned long pc, bool aarch32)
>   {
>   	u32 sctlr;
> +	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
>  =20
>   	/* Wipe all banked and usr regs */
> -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> +	memset(guest_regs, 0, sizeof(union registers));
>  =20
>   	arm_write_banked_reg(SP_usr, 0);
>   	arm_write_banked_reg(SP_svc, 0);
> diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/cont=
rol.c
> index 5b41b393..2c33c5f7 100644
> --- a/hypervisor/arch/arm64/control.c
> +++ b/hypervisor/arch/arm64/control.c
> @@ -22,6 +22,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>   {
>   	u64 hcr_el2;
>   	u64 fpexc32_el2;
> +	union registers * volatile guest_regs =3D &this_cpu_data()->guest_regs;
>  =20
>   	/* put the cpu in a reset state */
>   	/* AARCH64_TODO: handle big endian support */
> @@ -30,7 +31,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
>   	arm_write_sysreg(PMCR_EL0, 0);
>  =20
>   	/* wipe any other state to avoid leaking information accross cells */
> -	memset(&this_cpu_data()->guest_regs, 0, sizeof(union registers));
> +	memset(guest_regs, 0, sizeof(union registers));
>  =20
>   	/* AARCH64_TODO: wipe floating point registers */
>  =20

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc104832-1a03-5d06-f12f-dd34bdb2fe60%40siemens.com.
