Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVE56JQMGQEYW4LP3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E795236C0
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 17:11:59 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id e8-20020ac24e08000000b00473b1bae573sf935795lfr.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 08:11:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652281919; cv=pass;
        d=google.com; s=arc-20160816;
        b=yM8abLOi0sqb2W5rYoVkdjN+D1ZzZmaD2UlMFEyTlqhliCCamGHiJpD6tLVhHlWKxk
         CVZexwYJVNZ/S4NiDTccCPZqowt6Un5/CiNR1zcr592X0Ht/FOEJRVZnBNvh/4awZWNr
         BnCJhs2oHayVTnLgyqCaug0Ej+F7bWncKacbe2UKgbYN8dGa9fEgPSf6R9l6ZAQhpROR
         HA+J/08ox1ZlmKgp1NtKp5V0GdkfV5jJC/GR9xrJknIhAWa+HP182Mk2+qZUCCTuxKKR
         MWTtuilbbZcawCkrlrOCsH0pj3yZQ7qIEn8ir+t2r063pM5qvwLEHMREIkVj8El3/NN+
         le8w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=uc+UWyWZXKK+kUJB786gWraVnC9yuXSRUz0j0DypNr0=;
        b=T9SegvZGUGanUDBO0S4N8TmJpqAeG/zs+paAFU55e06YBDlYEVz7GKcJd/ykwsnfP7
         ba8vVRe5To/TTzle9jmZvmX5aVu7YMVOoiI8C/yQr8YRE3tDvj9l6MU+OtRV8hiRSo4e
         6oKspzo+Vzy68UNkho+7OnqguE+jTEJH4ZJHbS9Ia9xlBt6u8yXtn8Mw5dhfRGXuueux
         AUZJiKvq+7HeJN0FFPAE+7nE2OKrMJvX8quvSVtX4JW5Ks+hRJNdUGsk+Bh3kNI/PHjY
         vrHFNB25gjdR6Q8AdG8K0zRTEFkFyhYcuogvvNqVzaRYV6U0egTc3E5SZxW+3FNpf56/
         BL3Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=r95c1F9P;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uc+UWyWZXKK+kUJB786gWraVnC9yuXSRUz0j0DypNr0=;
        b=fZ0vMTV7KqSYOz+eDPzWqHs3gF9wjXlF7e18aEfmEBJRth82yN4yRaOyUXV7Qz1lNM
         le7PwCW6g4jBf51QnN61gMmjgXmOctaK8OrE0Qvbsv+3UjcNJMKmM6N2V3LZL50neQ5L
         b3BdbLvpuxHYDJOETFRiBNg9N3nM8NuL3Ov9+hPusagge0pvlCSAnEI50Z2ReA6waKiM
         en9s0sNmIwZweslUtjyHLwjp8BhMI3fTjzVkiHxa+c+5h3kF7L3TriKvVhBjs9FK4oMT
         hk9tn2qUH1+hGv0Yf7+dYbuuvsm2GEpFh8K4RvVhjSwr+5mwoc0goEkog6mJayHI40Uy
         9mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uc+UWyWZXKK+kUJB786gWraVnC9yuXSRUz0j0DypNr0=;
        b=B5A7NLu0P3nuj/mhGrzpeKp6FCQj1bzocSHraxbef0YwkyFrtnscNlxfLG6D06+H5g
         ApwNN8OoU2ysI8ZjohroF65lx6x+4sDzZ/dOKWVVCLQRBi4jhbPHEMVM0llVcY4to6NH
         O2JYoYDTthveDjN+V9143XB6H39R49d2n0ajbkcHykVoJNw78cgTUZussAUNelZM2xYM
         LUdAf3z9lHU53JowRTf0BV9Y9K03tx8egblLauQxKb5dZVV/rRy6l5RH7xGZT1D5B94a
         C6WxJN3NJX2tAAopLyTyGSRKKl99X1BScbZ6dY9ON+sghdqfXQVkJvnzNq5pt4zduQVL
         qVlA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530HzUG6oOFcXltRwEcw2XUc7nKhMv3j7qm5cfGtg0jXTsb79MeT
	TFf+pvdCY6uqR/3mIjr5R0Q=
X-Google-Smtp-Source: ABdhPJz8VyCFzNuFfjmSCMUEKJ0QFJdQ2jneNfio1/vFLhPKXHQaaG8EfXWwAGgrtTEbOF6wFOKdiQ==
X-Received: by 2002:a05:6512:12c9:b0:473:c33e:a65b with SMTP id p9-20020a05651212c900b00473c33ea65bmr21292273lfg.285.1652281919007;
        Wed, 11 May 2022 08:11:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls324790lfb.1.gmail; Wed, 11 May 2022
 08:11:57 -0700 (PDT)
X-Received: by 2002:a05:6512:3446:b0:473:c1af:fc2b with SMTP id j6-20020a056512344600b00473c1affc2bmr19979637lfr.220.1652281917094;
        Wed, 11 May 2022 08:11:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652281917; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yc3hTjVZhcgcKIrfwhOhePBIxFt6Dr5OCBP/Jn1C94o/L5pvXI9w1bOZE4mHbcwKiL
         sNXfO/iwVsWitnqbr9bZUwrTIjOoXG7TtqefJH943aQDkPU5HOO1+09GCVoRl0SXBGwK
         DdvU2IZlcuOX0lKxmYJAaXybVAc3annP5wuysPeOmsAbswou+gxRo/BK7jcyGyLPogKf
         RnDdQQdyxWCY0IanlDv0QqaIagYpMBFNnj49KO9PRw57xRuxnQlhnmSjReyKjylkoejZ
         nOB6CrkJ2BFoIdGPoJmIxZjf4lb3svQZF0Ff13Pioq7OVQx90FtRHpSjmteWy3U7Fl1z
         Pvow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3QyOyYxQ3I5PPbmDB0Z+sNfg2LLG0boYURmoovLnz7E=;
        b=IcO0owVo/SyZ57qMDuw9/vSAMNbWgzoXF6ymymJi2WHPIAJn6ZJUppEyTxfT6Zfngr
         8A1kB3sl4ZFQ3mbrwrEn2yD9jor/GaXrtqREiwPxx4sEoEpsEvfvO6gdKnBf+Bdyu7bo
         FxiIiw7KroejZz8l4g0RPeXVZJU9CFRfDviI3Z0dl/tvncgOKVCW+alha38eCCJzriYk
         WDCN4j/60ABhtdoVZI1h+i+YmvqvparxXrclLk3/tlxZhT1QxZBW7HnIQ0ACvs7ZlqT8
         8EtPD1b/H/DZ5IFLVPBP4XMIOyiofrAn940gbwHIdqpbptBqErt4v/gWa1a4K162RW75
         w1bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=r95c1F9P;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20628.outbound.protection.outlook.com. [2a01:111:f400:7d00::628])
        by gmr-mx.google.com with ESMTPS id j18-20020a2e8012000000b0024f304af5b0si133416ljg.7.2022.05.11.08.11.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2022 08:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::628 as permitted sender) client-ip=2a01:111:f400:7d00::628;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGP1nSm3TVl1NFKmE39BdB2Z5cS7+dgCjZrVOBgee2ZGKYhG2hI8REYhP9fZET79D7ZTOfnEWOji8SutXRVkrOg9DvEF6eYvMuN9CGlX9qDfg06/CE3p/UFJevz4yZmxuolBJXfm316Ztt1nQo7kaawIGkLFGqHoHcGhIB/MLu3ojQ3fJf/OE9qINffpYF7bkS/CCuLLdi9xXqA9XcnoQ2A7GdeVfn0fdxd/gwCX0WhCT19H/n1GceZX9lGi3kLNktCJh4Dj/7ziwD0MszKlZTL8HZVn9kRSQANHaQl95ievSeFLB5jW+XZ7SN/ZxL8kskXy0NOtT0yq5gAEuAyxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QyOyYxQ3I5PPbmDB0Z+sNfg2LLG0boYURmoovLnz7E=;
 b=KK6lSbX3zyfGQvl2gHbGbCDQVqi5pNCEuzZGJqgd0kdwqTzgrLk8Pr5Kx2DBaUSeOE9lC7VYyHNfnEjhXIgdEh/H3HMUF/Le2NOMpj4oRgpOPxCPyPOThyHTriDtdSR7S4gxxIvODnY3dFk6wRxkKddn1ahJEg3TXN0/MAEWMstpHGcj6tTZPc6W0Bzbbx+rTkmQXTZEHAbVQssrXX+wyD7CGeoaCj3iWAOVZUHaT7QmgQHlqgGGbAQ11564Tk/EfBMUVWzdaGzBPu28NlpfOkUdMJFlksr8BsPl3EjUJSqSyyD20PCY3YUJ9sKyWH4tfTGxOc3gngA3W4NGi7hUyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0034.eurprd06.prod.outlook.com (2603:10a6:20b:463::18)
 by AM0PR10MB3651.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 15:11:55 +0000
Received: from VE1EUR01FT030.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::38) by AS9PR06CA0034.outlook.office365.com
 (2603:10a6:20b:463::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21 via Frontend
 Transport; Wed, 11 May 2022 15:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT030.mail.protection.outlook.com (10.152.2.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 15:11:54 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 17:11:53 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 17:11:53 +0200
Message-ID: <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
Date: Wed, 11 May 2022 17:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: Prabhakar Lad <prabhakar.csengg@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--13.706600-8.000000
X-TMASE-MatchedRID: 8xNMUprDHac5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tT4jnQTqD4CzRfT3
	wDt+vdV7EtLGRAe3PGYG32ZLukpVN6ipWzVkuu8IbXzhjksitpTX7PJ/OU3vKDGx/OQ1GV8mMVP
	zx/r2cb+gtHj7OwNO2OhzOa6g8KrYdBY7CAaQ5sDdI9YOWX0Dukib2eC8bD1PmDQ2eeBEh7mBiT
	AXDh23c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.706600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: E1C49F89EFE1C96588094D9F776EA3EE088BC5EB7CEB7D19EA7143E84103C58E2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d82a84a3-0e5a-47a0-6355-08da336095a4
X-MS-TrafficTypeDiagnostic: AM0PR10MB3651:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3651C2B6D0A5A71BD4CABD9695C89@AM0PR10MB3651.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vXXQeCfSuHs+n9ulVVyVWNIkmfSribuprVQy8o16gp8A28De1khsLJAn/h5THZWIpf8XF4hPNd6FpCj6mb/FPT4nVeqa6u+D0+JBoLYkqwZcl58p8WlTS3xFUgseAq2WYo2oVRj6DF2FmOC3w83tBD9yNpU6jXGRtLnRryeExmQdjTmd0RHz9D/5K0FQB4b3fpavQ+CvaDkvr+r84SSwn0NL90TEAqWQHZMrzLlN7JEKsCd8dfHk8++XF2ctZR+rLbbFcJRbfcAzrlKeawIUAUGVxG/S9VFHd5bxiKrb/3Hd00RTYAH2RkFoDNDYuunnD+zZZLi6sgw4Xs49gtqq8SH9OvDqwrtsYjmmbuZOKnLs1E63d1z8TwwjJd8EZbVAnppFGkgf9D5YA6Z4wIl/udxRWK87N3iiDc2d9vamsHHyzJnZyqbfQhC+wQAvzpd3r7EsD2U/+fL38ovikdyl82JyTNwxCLlNP0Pe8H/036RhBowJjsbKKZ6cMi73I5Wh9i1/7ww062iA/4BHIe1YbX7EWN0G0Be3WbXn0tixy7FHWLWPyqsWTx0v4iDFfrfeZzWcRv+uui3PLwX+7KsUeZIKgYvEsrgQBwNMLoHTY+m7oAnfNuPNKxNS0VCMMHcH26ggoipIhTscnlZoMcS9wnGPvdlRDTN1xZjxRiQfUHbo7LALZphrGVnom3s2IIaKNZIM3cM4WC5gHlVHkCpSqwrdfJS56WzjrXcLVjS+teDqDcd4jwn/8jAdohHurHrzJ6TYn1AmMMuLCk3cAjToA==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(4744005)(110136005)(16576012)(498600001)(70586007)(70206006)(44832011)(47076005)(2906002)(40460700003)(16526019)(36860700001)(82960400001)(186003)(81166007)(6706004)(8676002)(31696002)(336012)(26005)(86362001)(82310400005)(356005)(2616005)(8936002)(31686004)(956004)(53546011)(5660300002)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:11:54.6177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82a84a3-0e5a-47a0-6355-08da336095a4
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT030.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3651
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=r95c1F9P;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7d00::628 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 11.05.22 13:20, Prabhakar Lad wrote:
> To add further more details:
> 
> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> for jailhouse [1].
> 
> I added some debug prints and I see the panic is caused when entry()
> function is called (in enter_hypervisor). The entry function lands into
> assembly code (entry.S). I dont have a JTAG to see which exact
> instruction is causing this issue.

So, already the first instruction in the loaded hypervisor binary is not
executable? That would explain why we see no hypervisor output at all.

Was that memory region properly reserved from Linux (via DTB carve-out
e.g.)?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d22051fb-2c80-2d88-af8c-5f1ccdb69197%40siemens.com.
